"""
This tool allows agents to interact with the pygithub library and operate on a GitHub repository.\n\nTo use this tool, you must first set as environment variables:\n    GITHUB_API_TOKEN\n    GITHUB_REPOSITORY -> format: {owner}/{repo}
and operate on a GitHub repository.

To use this tool, you must first set as environment variables:
    GITHUB_API_TOKEN
    GITHUB_REPOSITORY -> format: {owner}/{repo}

"""
from typing import Optional

from langchain.callbacks.manager import CallbackManagerForToolRun
from langchain.pydantic_v1 import Field
from langchain.pydantic_v1 import Field
import logging
import traceback
from langchain.tools.base import BaseTool, ToolRunFailed
from langchain.utilities.github import GitHubAPIWrapper


class GitHubAction(BaseTool):
    """Tool for interacting with the GitHub API."""

    api_wrapper: GitHubAPIWrapper = Field(default_factory=GitHubAPIWrapper)
    mode: str
    name: str = ""
    description: str = ""

    def _run(
        self,
        instructions: str,
        run_manager: Optional[CallbackManagerForToolRun] = None,
    ) -> str:
        """Use the GitHub API to run an operation."""
        try:
            return self.api_wrapper.run(self.mode, instructions)
        except Exception as e:
            logging.error(f'An error occurred while running the API: {e}')
            logging.error(traceback.format_exc())
            raise ToolRunFailed('Failed to run the API')

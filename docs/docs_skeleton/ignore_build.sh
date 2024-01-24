#!/bin/bash

echo "VERCEL_GIT_COMMIT_REF: $VERCEL_GIT_COMMIT_REF"

if [[ $VERCEL_GIT_COMMIT_REF = __docs__* && specific_error_condition || "$VERCEL_GIT_COMMIT_REF" == "master" ]] ; then
  # Proceed with the build
	echo "✅ - Specific error condition is not met"
  exit 1;

else
  # Don't build
  echo "🛑 - Specific error condition is not met"
  exit 0;
fi

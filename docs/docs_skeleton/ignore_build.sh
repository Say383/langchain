#!/bin/bash

echo "VERCEL_GIT_COMMIT_REF: $VERCEL_GIT_COMMIT_REF"

if [[ $VERCEL_GIT_COMMIT_REF = __docs__* || "$VERCEL_GIT_COMMIT_REF" == "master" ]] ; then
  # Indicates that the build can proceed
	echo "✅ - Build can proceed"
  exit 0;

else
  # Don't build
  echo "🛑 - Build cancelled"
  exit 0;
fi

#exit on error
set -o errexit



# export PYTHON=/opt/homebrew/bin/python3

# Initial setup
mix deps.get --only prod
MIX_ENV=prod mix compile



# Compile assets
npm install --prefix ./assets
mix tailwind.install
mix esbuild.install

npm run deploy --prefix ./assets
mix phx.digest

# Build the release and overwrite the existing release directory
MIX_ENV=prod mix release --overwrite
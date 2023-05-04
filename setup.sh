
set -eEo pipefail

if [ ! -z "$CLOUD_SHELL" ]; then
  printf "Checking for required npm version...\n"
  npm install -g npm > /dev/null 2>&1
  printf "Completed.\n\n"

  printf "Setting up NVM...\n"
  export NVM_DIR="/usr/local/nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  printf "Completed.\n\n"
  
  printf "Updating nodeJS version...\n"
  nvm install --lts
  printf "Completed.\n\n"
fi


printf "Installing gateway dependencies...\n"
cd ./back-end/gateway
npm install
printf "Completed.\n\n"
cd  ..
printf "Installing orderService  dependencies...\n"
cd ./orderService
npm install
printf "Completed.\n\n"
cd ..
printf "Installing ProductService dependencies...\n"
cd ./ProductService
npm install
printf "Completed.\n\n"
cd ..
printf "Installing ratingService dependencies...\n"
cd ./ratingService
npm install
printf "Completed.\n\n"
cd ..
printf "Installing userService dependencies...\n"
cd ./userService
npm install
printf "Completed.\n\n"
cd ..
cd ..
printf "Installing React app dependencies...\n"
cd ./frontend
npm install
printf "Completed.\n\n"
cd ..
printf "Building React app and placing into sub projects...\n"
npm run build
printf "Completed.\n\n"

printf "Setup completed successfully!\n"

if [ ! -z "$CLOUD_SHELL" ]; then
  printf "\n"
  printf "###############################################################################\n"
  printf "#                                   NOTICE                                    #\n"
  printf "#                                                                             #\n"
  printf "# Make sure you have a compatible nodeJS version with the following command:  #\n"
  printf "#                                                                             #\n"
  printf "# nvm install --lts                                                           #\n"
  printf "#                                                                             #\n"
  printf "###############################################################################\n"
fi
echo "Started getting packages..."
rm -rf packages
mkdir packages
cd packages
git clone https://oauth2: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@github.com/nestorsgarzonc/oyt_front_core.git
git clone https://oauth2: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@github.com/nestorsgarzonc/oyt_front_widgets.git
ls -la
cd ..
echo "Finished getting packages ..."

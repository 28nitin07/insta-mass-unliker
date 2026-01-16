# Step 1: Download Instagram Data
##  Instagram → Settings → Accounts Center → Your information → Download your information

You’ll get a file like:
```bash 
likes.json
```
Typical path inside:
```bash
likes_media_likes.json
```

# Step 2: Required Tools
```bash
brew install jq   # macOS
sudo apt install jq  # Linux
```

# Step 3: Run Shell Script 
```bash
chmod +x mass-unlike.sh
./mass-unlike.sh
```


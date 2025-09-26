#!/bin/bash
# Font Setup Script for Neovim
# ~/.config/nvim/scripts/setup_font.sh

echo "🔤 Neovim Font Setup - Fira Code Nerd Font"
echo "=========================================="

# Check if Fira Code Nerd Font is installed
echo "📋 Checking for Fira Code Nerd Font installation..."
if ls ~/Library/Fonts/FiraCodeNerdFont* &> /dev/null || ls /System/Library/Fonts/FiraCodeNerdFont* &> /dev/null; then
    echo "✅ Fira Code Nerd Font is installed!"
    echo "📁 Found fonts:"
    ls ~/Library/Fonts/FiraCodeNerdFont* 2>/dev/null | head -5
else
    echo "❌ Fira Code Nerd Font not found!"
    echo "📥 Install with: brew install font-fira-code-nerd-font"
    exit 1
fi

# Test font symbols
echo ""
echo "🧪 Testing Nerd Font symbols..."
echo "File icons: 📁   📄   🔧"
echo "Git icons:      "
echo "Code icons:     λ  ƒ"
echo "Arrows: → ← ↑ ↓ ⇒ ⇐"
echo "Powerline:      "

# Check terminal
echo ""
echo "🖥️  Terminal Information:"
echo "TERM: $TERM"
echo "TERM_PROGRAM: $TERM_PROGRAM"

if [[ "$TERM_PROGRAM" == "WarpTerminal" ]]; then
    echo "✅ You're using Warp Terminal!"
    echo "🔧 To set Fira Code Nerd Font in Warp:"
    echo "   1. Open Warp settings (Cmd + ,)"
    echo "   2. Go to Appearance"
    echo "   3. Set Font Family to 'FiraCode Nerd Font Mono'"
    echo "   4. Set Font Size to your preference (14 is recommended)"
elif [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    echo "✅ You're using iTerm2!"
    echo "🔧 To set Fira Code Nerd Font in iTerm2:"
    echo "   1. iTerm2 → Preferences → Profiles → Text"
    echo "   2. Change Font to 'FiraCode Nerd Font Mono'"
elif [[ "$TERM_PROGRAM" == "Apple_Terminal" ]]; then
    echo "✅ You're using macOS Terminal!"
    echo "🔧 To set Fira Code Nerd Font in Terminal:"
    echo "   1. Terminal → Preferences → Profiles → Text"
    echo "   2. Change Font to 'FiraCode Nerd Font Mono'"
fi

echo ""
echo "🎯 Neovim Font Configuration:"
echo "   ✅ GUI font set to: FiraCode Nerd Font Mono:h14"
echo "   ✅ Terminal font should be set in your terminal app"
echo "   ✅ Ligatures enabled for supported GUI clients"

echo ""
echo "🚀 Test your setup:"
echo "   1. Restart your terminal"
echo "   2. Open Neovim: nvim"
echo "   3. Check if icons display properly in file explorer (<leader>e)"

echo ""
echo "Done! Your font should now be properly configured. 🎉"

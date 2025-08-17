#!/bin/bash

# Git Configuration Checker
# This script helps verify that your git configuration is properly set up

echo "🔍 Checking Git Configuration..."
echo "=================================="

# Check global configuration
echo "📋 Global Configuration:"
GLOBAL_EMAIL=$(git config --global user.email)
GLOBAL_NAME=$(git config --global user.name)

if [ -n "$GLOBAL_EMAIL" ]; then
    echo "  ✅ Email: $GLOBAL_EMAIL"
else
    echo "  ❌ Email: Not configured"
fi

if [ -n "$GLOBAL_NAME" ]; then
    echo "  ✅ Name: $GLOBAL_NAME"
else
    echo "  ❌ Name: Not configured"
fi

# Check local configuration
echo ""
echo "📋 Local Repository Configuration:"
LOCAL_EMAIL=$(git config --local user.email)
LOCAL_NAME=$(git config --local user.name)

if [ -n "$LOCAL_EMAIL" ]; then
    echo "  ✅ Email: $LOCAL_EMAIL"
else
    echo "  ℹ️  Email: Using global configuration"
fi

if [ -n "$LOCAL_NAME" ]; then
    echo "  ✅ Name: $LOCAL_NAME"
else
    echo "  ℹ️  Name: Using global configuration"
fi

# Check for placeholder values
echo ""
echo "🔍 Validation:"
if [ "$GLOBAL_EMAIL" = "you@example.com" ] || [ "$GLOBAL_EMAIL" = "your-email@example.com" ]; then
    echo "  ❌ Global email is a placeholder value"
elif [ -n "$LOCAL_EMAIL" ] && ([ "$LOCAL_EMAIL" = "you@example.com" ] || [ "$LOCAL_EMAIL" = "your-email@example.com" ]); then
    echo "  ❌ Local email is a placeholder value"
else
    echo "  ✅ Email configuration looks good"
fi

if [ "$GLOBAL_NAME" = "Your Name" ] || [ "$GLOBAL_NAME" = "your name" ]; then
    echo "  ❌ Global name is a placeholder value"
elif [ -n "$LOCAL_NAME" ] && ([ "$LOCAL_NAME" = "Your Name" ] || [ "$LOCAL_NAME" = "your name" ]); then
    echo "  ❌ Local name is a placeholder value"
else
    echo "  ✅ Name configuration looks good"
fi

# Show effective configuration
echo ""
echo "📋 Effective Configuration (what will be used for commits):"
EFFECTIVE_EMAIL=$(git config user.email)
EFFECTIVE_NAME=$(git config user.name)
echo "  📧 Email: $EFFECTIVE_EMAIL"
echo "  👤 Name: $EFFECTIVE_NAME"

echo ""
echo "✅ Configuration check complete!"

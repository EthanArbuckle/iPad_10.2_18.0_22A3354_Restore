@implementation UIKeyboardEmojiKeyView

- (int64_t)updateToCategoryWithOffsetPercentage:(double)a3
{
  return 0;
}

- (UIKeyboardEmojiCategoryUpdateDelegate)emojiKeyManager
{
  return (UIKeyboardEmojiCategoryUpdateDelegate *)objc_loadWeakRetained((id *)&self->emojiKeyManager);
}

- (void)setEmojiKeyManager:(id)a3
{
  objc_storeWeak((id *)&self->emojiKeyManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->emojiKeyManager);
}

@end

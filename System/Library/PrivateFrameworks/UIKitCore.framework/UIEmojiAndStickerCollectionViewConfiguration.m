@implementation UIEmojiAndStickerCollectionViewConfiguration

- (UITextInputTraits)textInputTraits
{
  return self->_textInputTraits;
}

- (void)setTextInputTraits:(id)a3
{
  objc_storeStrong((id *)&self->_textInputTraits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textInputTraits, 0);
}

@end

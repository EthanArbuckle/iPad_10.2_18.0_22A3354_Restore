@implementation UIKeyboardEmoji

- (UIKeyboardEmoji)initWithString:(id)a3 withVariantMask:(unint64_t)a4
{
  id v7;
  UIKeyboardEmoji *v8;
  UIKeyboardEmoji *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardEmoji;
  v8 = -[UIKeyboardEmoji init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_emojiString, a3);
    v9->_variantMask = a4;
  }

  return v9;
}

+ (id)emojiWithString:(id)a3 withVariantMask:(unint64_t)a4
{
  id v5;
  UIKeyboardEmoji *v6;

  v5 = a3;
  v6 = -[UIKeyboardEmoji initWithString:withVariantMask:]([UIKeyboardEmoji alloc], "initWithString:withVariantMask:", v5, a4);

  return v6;
}

+ (BOOL)shouldHighlightEmoji:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(getEMFEmojiTokenClass(), "emojiTokenWithString:localeData:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "_shouldHighlightEmoji");
  return (char)v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmoji key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (BOOL)supportsSkinToneVariants
{
  void *v2;
  char v3;

  objc_msgSend(getEMFEmojiTokenClass(), "emojiTokenWithString:localeData:", self->_emojiString, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsSkinToneVariants");

  return v3;
}

- (NSString)emojiString
{
  return self->_emojiString;
}

- (void)setEmojiString:(id)a3
{
  objc_storeStrong((id *)&self->_emojiString, a3);
}

- (unint64_t)variantMask
{
  return self->_variantMask;
}

- (void)setVariantMask:(unint64_t)a3
{
  self->_variantMask = a3;
}

- (BOOL)isFromRecentsCategory
{
  return self->_isFromRecentsCategory;
}

- (void)setIsFromRecentsCategory:(BOOL)a3
{
  self->_isFromRecentsCategory = a3;
}

- (BOOL)isFromEmojiSearch
{
  return self->_isFromEmojiSearch;
}

- (void)setIsFromEmojiSearch:(BOOL)a3
{
  self->_isFromEmojiSearch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiString, 0);
}

@end

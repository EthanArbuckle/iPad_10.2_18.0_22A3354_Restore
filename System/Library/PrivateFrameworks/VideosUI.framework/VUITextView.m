@implementation VUITextView

- (void)setVuiAttributedText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "languageStringHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[VUITextView _defaultParagraphStyle](self, "_defaultParagraphStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "makeLanguageAwareAttributedString:defaultParagraphStyle:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUITextView setAttributedText:](self, "setAttributedText:", v7);
}

- (CGSize)vui_sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)VUITextView;
  -[VUITextView sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_defaultParagraphStyle
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setAlignment:", -[VUITextView vuiTextAlignment](self, "vuiTextAlignment"));
  objc_msgSend(v4, "setLineBreakMode:", 0);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

@end

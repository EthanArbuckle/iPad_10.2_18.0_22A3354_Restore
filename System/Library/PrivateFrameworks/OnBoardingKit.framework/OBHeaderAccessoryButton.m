@implementation OBHeaderAccessoryButton

+ (OBHeaderAccessoryButton)buttonWithType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___OBHeaderAccessoryButton;
  objc_msgSendSuper2(&v11, sel_buttonWithType_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v3, "_fontTextStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredFontForTextStyle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  objc_msgSend(v3, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNumberOfLines:", 1);

  objc_msgSend(v3, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextAlignment:", 1);

  return (OBHeaderAccessoryButton *)v3;
}

+ (id)accessoryButton
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v2, "_updateText");
  return v2;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OBHeaderAccessoryButton;
  -[OBHeaderAccessoryButton traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[OBHeaderAccessoryButton _updateText](self, "_updateText");
}

- (id)_fontTextStyle
{
  return (id)*MEMORY[0x1E0DC4A88];
}

- (void)_updateText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0DC1350];
  -[OBHeaderAccessoryButton _fontTextStyle](self, "_fontTextStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontForTextStyle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBHeaderAccessoryButton titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  if (+[OBViewUtilities shouldUseAccessibilityLayout](OBViewUtilities, "shouldUseAccessibilityLayout"))
  {
    -[OBHeaderAccessoryButton setContentHorizontalAlignment:](self, "setContentHorizontalAlignment:", 4);
    -[OBHeaderAccessoryButton titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0.0;
  }
  else
  {
    -[OBHeaderAccessoryButton setContentHorizontalAlignment:](self, "setContentHorizontalAlignment:", 0);
    -[OBHeaderAccessoryButton titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0.65;
  }
  v9 = v7;
  objc_msgSend(v7, "setMinimumScaleFactor:", v8);

}

- (void)tintColorDidChange
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OBHeaderAccessoryButton;
  -[OBHeaderAccessoryButton tintColorDidChange](&v10, sel_tintColorDidChange);
  v3 = -[OBHeaderAccessoryButton underlineLinks](self, "underlineLinks");
  -[OBHeaderAccessoryButton titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = *MEMORY[0x1E0DC1248];
  v8 = objc_msgSend(v6, "length");
  if (v3)
    objc_msgSend(v6, "addAttribute:value:range:", v7, &unk_1E37BC658, 0, v8);
  else
    objc_msgSend(v6, "removeAttribute:range:", v7, 0, v8);
  -[OBHeaderAccessoryButton titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAttributedText:", v6);

}

- (BOOL)underlineLinks
{
  return self->_underlineLinks;
}

- (void)setUnderlineLinks:(BOOL)a3
{
  self->_underlineLinks = a3;
}

@end

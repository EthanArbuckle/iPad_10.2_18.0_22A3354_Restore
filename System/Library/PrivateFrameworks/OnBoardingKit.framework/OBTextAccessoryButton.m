@implementation OBTextAccessoryButton

+ (id)accessoryButtonWithTextStyle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___OBTextAccessoryButton;
  v3 = a3;
  objc_msgSendSuper2(&v11, sel_buttonWithType_, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleColor:forState:", v5, 0);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  objc_msgSend(v4, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextAlignment:", 4);

  objc_msgSend(v4, "setTextStyle:", v3);
  objc_msgSend(v4, "setContentHorizontalAlignment:", 3);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  objc_msgSend(v4, "setConfiguration:", v9);

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OBTextAccessoryButton;
  -[OBTextAccessoryButton traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, a3);
  v4 = (void *)MEMORY[0x1E0DC1350];
  -[OBTextAccessoryButton textStyle](self, "textStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredFontForTextStyle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextAccessoryButton titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OBTextAccessoryButton;
  -[OBTextAccessoryButton tintColorDidChange](&v4, sel_tintColorDidChange);
  -[OBTextAccessoryButton tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextAccessoryButton setTitleColor:forState:](self, "setTitleColor:forState:", v3, 0);

}

- (NSString)textStyle
{
  return self->_textStyle;
}

- (void)setTextStyle:(id)a3
{
  self->_textStyle = (NSString *)a3;
}

@end

@implementation OBPrivacyButton

+ (id)buttonWithType:(int64_t)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___OBPrivacyButton;
  objc_msgSendSuper2(&v4, sel_buttonWithType_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
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
  v10.super_class = (Class)OBPrivacyButton;
  -[OBPrivacyButton tintColorDidChange](&v10, sel_tintColorDidChange);
  v3 = -[OBPrivacyButton underlineLinks](self, "underlineLinks");
  -[OBPrivacyButton titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = *MEMORY[0x1E0DC1248];
  v8 = objc_msgSend(v6, "length");
  if (v3)
    objc_msgSend(v6, "addAttribute:value:range:", v7, &unk_1E37BC610, 0, v8);
  else
    objc_msgSend(v6, "removeAttribute:range:", v7, 0, v8);
  -[OBPrivacyButton titleLabel](self, "titleLabel");
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

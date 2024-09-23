@implementation SiriUIPlatterSectionHeaderView

+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _OWORD v15[3];
  uint64_t v16;
  objc_super v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  objc_msgSend(a1, "_font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___SiriUIPlatterSectionHeaderView;
  v15[0] = xmmword_217698078;
  v15[1] = unk_217698088;
  v15[2] = xmmword_217698098;
  v16 = 0x4030000000000000;
  objc_msgSendSuper2(&v17, sel_sizeThatFits_text_font_textContainerStyle_, v7, v8, v15, width, height);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (SiriUIPlatterSectionHeaderView)initWithText:(id)a3 visualEffect:(id)a4
{
  SiriUIPlatterSectionHeaderView *v4;
  void *v5;
  void *v6;
  _OWORD v8[3];
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SiriUIPlatterSectionHeaderView;
  v4 = -[SiriUITextContainerView initWithText:visualEffect:](&v10, sel_initWithText_visualEffect_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_keylineColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIPlatterSectionHeaderView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[SiriUIPlatterSectionHeaderView setTextAlignment:](v4, "setTextAlignment:", 4);
    v8[0] = xmmword_217698078;
    v8[1] = unk_217698088;
    v8[2] = xmmword_217698098;
    v9 = 0x4030000000000000;
    -[SiriUITextContainerView setTextContainerStyle:](v4, "setTextContainerStyle:", v8);
    objc_msgSend((id)objc_opt_class(), "_font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUITextContainerView setFont:](v4, "setFont:", v6);

  }
  return v4;
}

- (void)setTextAlignment:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUIPlatterSectionHeaderView;
  -[SiriUITextContainerView setTextAlignment:](&v4, sel_setTextAlignment_, a3);
  -[UIView recursive_setSemanticContentAttribute:](self, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute());
}

+ (id)_font
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
}

@end

@implementation SiriUIKeyline

+ (id)keyline
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithKeylineType:", 2);
}

+ (SiriUIKeyline)keylineWithDefaultInsets
{
  return (SiriUIKeyline *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithKeylineType:", 1);
}

+ (id)keylineForSelectableRow
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithKeylineType:", 3);
}

+ (id)verticalKeyline
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithKeylineType:", 5);
}

+ (SiriUIKeyline)keylineWithKeylineType:(int64_t)a3
{
  return (SiriUIKeyline *)objc_msgSend(a1, "keylineWithKeylineType:platterStyling:", a3, SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets());
}

+ (SiriUIKeyline)keylineWithKeylineType:(int64_t)a3 platterStyling:(BOOL)a4
{
  return (SiriUIKeyline *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithKeylineType:platterStyling:", a3, a4);
}

- (SiriUIKeyline)initWithKeylineType:(int64_t)a3
{
  return -[SiriUIKeyline initWithKeylineType:platterStyling:](self, "initWithKeylineType:platterStyling:", a3, SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets());
}

- (SiriUIKeyline)initWithKeylineType:(int64_t)a3 platterStyling:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  double v7;
  double v8;
  double v9;
  SiriUIKeyline *v10;
  SiriUIKeyline *v11;
  uint64_t v12;
  UIView *keyLineView;
  UIView *v14;
  void *v15;
  objc_super v17;

  v4 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SiriUIKeyline;
  v6 = *MEMORY[0x24BDBF090];
  v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v9 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v10 = -[SiriUIKeyline initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x24BDBF090], v7, v8, v9);
  v11 = v10;
  if (v10)
  {
    v10->_keylineType = a3;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v6, v7, v8, v9);
    keyLineView = v11->_keyLineView;
    v11->_keyLineView = (UIView *)v12;

    v14 = v11->_keyLineView;
    -[SiriUIKeyline _keylineColorForType:platterStyling:](v11, "_keylineColorForType:platterStyling:", v11->_keylineType, v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v14, "setBackgroundColor:", v15);

    -[SiriUIKeyline addSubview:](v11, "addSubview:", v11->_keyLineView);
  }
  return v11;
}

- (id)_keylineColorForType:(int64_t)a3 platterStyling:(BOOL)a4
{
  if (a4)
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_platterKeylineColor", a3);
  else
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_lightKeylineColor", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)_keylineThicknessForType:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  return 1.0 / v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[SiriUIKeyline _sizeThatFits:useAutolayout:](self, "_sizeThatFits:useAutolayout:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[SiriUIKeyline _sizeThatFits:useAutolayout:](self, "_sizeThatFits:useAutolayout:", 1, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_sizeThatFits:(CGSize)a3 useAutolayout:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  int64_t v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v8 = -[SiriUIKeyline keylineType](self, "keylineType");
  v9 = *MEMORY[0x24BDF7FB8];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = v11;
  -[SiriUIKeyline _keylineThicknessForType:](self, "_keylineThicknessForType:", self->_keylineType);
  v14 = ceil(v13);
  if (v12 < 2.0)
    v13 = v14;
  if (v4)
    v15 = v9;
  else
    v15 = height;
  if (v4)
    v16 = v9;
  else
    v16 = width;
  if (v8 == 5)
    v17 = v13;
  else
    v17 = v16;
  if (v8 == 5)
    v18 = v15;
  else
    v18 = v13;

  v19 = v17;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 IsRTL;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SiriUIKeyline;
  -[SiriUIKeyline layoutSubviews](&v16, sel_layoutSubviews);
  -[SiriUIKeyline bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[SiriUIKeyline keylineType](self, "keylineType");
  if (v11 == 4)
  {
    -[SiriUIKeyline customLeftPadding](self, "customLeftPadding");
    v12 = v14;
    -[SiriUIKeyline customRightPadding](self, "customRightPadding");
  }
  else if (v11 == 3)
  {
    IsRTL = SiriLanguageIsRTL();
    v13 = 16.0;
    if (IsRTL)
      v12 = 0.0;
    else
      v12 = 16.0;
    if (!IsRTL)
      v13 = 0.0;
  }
  else
  {
    v12 = 0.0;
    v13 = 0.0;
    if (v11 == 1)
    {
      v12 = 16.0;
      v13 = 16.0;
    }
  }
  -[UIView setFrame:](self->_keyLineView, "setFrame:", v4 + v12, v6, v8 - (v12 + v13), v10);
}

- (void)setKeylineType:(int64_t)a3
{
  self->_keylineType = a3;
  -[SiriUIKeyline setHidden:](self, "setHidden:", a3 == 0);
  -[SiriUIKeyline setNeedsLayout](self, "setNeedsLayout");
}

- (void)setCustomLeftPadding:(double)a3
{
  self->_customLeftPadding = a3;
  -[SiriUIKeyline setNeedsLayout](self, "setNeedsLayout");
}

- (void)setCustomRightPadding:(double)a3
{
  self->_customRightPadding = a3;
  -[SiriUIKeyline setNeedsLayout](self, "setNeedsLayout");
}

- (void)setCustomBackgroundColor:(id)a3
{
  -[UIView setBackgroundColor:](self->_keyLineView, "setBackgroundColor:", a3);
}

- (int64_t)keylineType
{
  return self->_keylineType;
}

- (double)customLeftPadding
{
  return self->_customLeftPadding;
}

- (double)customRightPadding
{
  return self->_customRightPadding;
}

- (UIColor)customBackgroundColor
{
  return self->_customBackgroundColor;
}

- (BOOL)_isVeritical
{
  return self->_veritical;
}

- (void)_setVertical:(BOOL)a3
{
  self->_veritical = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customBackgroundColor, 0);
  objc_storeStrong((id *)&self->_keyLineView, 0);
}

@end

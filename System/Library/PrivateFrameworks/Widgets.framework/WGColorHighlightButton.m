@implementation WGColorHighlightButton

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  v14.receiver = self;
  v14.super_class = (Class)WGColorHighlightButton;
  -[WGColorHighlightButton intrinsicContentSize](&v14, sel_intrinsicContentSize);
  v4 = v3;
  v6 = v5;
  -[WGColorHighlightButton titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intrinsicContentSize");
  v9 = v8;
  v11 = v10;

  if (v4 >= v9)
    v12 = v4;
  else
    v12 = v9;
  if (v6 >= v11)
    v13 = v6;
  else
    v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WGColorHighlightButton;
  -[WGColorHighlightButton layoutSubviews](&v6, sel_layoutSubviews);
  -[WGColorHighlightButton titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGColorHighlightButton titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  objc_msgSend(v3, "setPreferredMaxLayoutWidth:", v5);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[WGColorHighlightButton isHighlighted](self, "isHighlighted") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)WGColorHighlightButton;
    -[WGColorHighlightButton setHighlighted:](&v5, sel_setHighlighted_, v3);
    if (v3)
      -[WGColorHighlightButton _updateRealBackgroundColor](self, "_updateRealBackgroundColor");
    else
      BSRunLoopPerformAfterCACommit();
  }
}

uint64_t __41__WGColorHighlightButton_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateRealBackgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  -[WGColorHighlightButton setSavedBackgroundColor:](self, "setSavedBackgroundColor:", v4);
  v5 = v4;
  v9 = 0.0;
  v10 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  v6 = v5;
  if (objc_msgSend(v5, "getHue:saturation:brightness:alpha:", &v10, &v9, &v8, &v7))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithHue:saturation:brightness:alpha:", v10, v9, v8 + -0.2, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[WGColorHighlightButton setHighlightedBackgroundColor:](self, "setHighlightedBackgroundColor:", v6);
  -[WGColorHighlightButton _updateRealBackgroundColor](self, "_updateRealBackgroundColor");

}

- (void)_updateRealBackgroundColor
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  if (-[WGColorHighlightButton isHighlighted](self, "isHighlighted"))
  {
    -[WGColorHighlightButton highlightedBackgroundColor](self, "highlightedBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5.receiver = self;
    v5.super_class = (Class)WGColorHighlightButton;
    -[WGColorHighlightButton setBackgroundColor:](&v5, sel_setBackgroundColor_, v3);

  }
  else
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __52__WGColorHighlightButton__updateRealBackgroundColor__block_invoke;
    v4[3] = &unk_24D7314D8;
    v4[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 6, v4, 0, 0.3, 0.0);
  }
}

void __52__WGColorHighlightButton__updateRealBackgroundColor__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  objc_super v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "savedBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3.receiver = v1;
  v3.super_class = (Class)WGColorHighlightButton;
  objc_msgSendSuper2(&v3, sel_setBackgroundColor_, v2);

}

- (UIColor)savedBackgroundColor
{
  return self->_savedBackgroundColor;
}

- (void)setSavedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_savedBackgroundColor, a3);
}

- (UIColor)highlightedBackgroundColor
{
  return self->_highlightedBackgroundColor;
}

- (void)setHighlightedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_savedBackgroundColor, 0);
}

@end

@implementation PUIColorWellView

- (PUIColorWellView)initWithFrame:(CGRect)a3
{
  PUIColorWellView *v3;
  PUIColorWell *v4;
  uint64_t v5;
  PUIColorWell *colorWell;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUIColorWellView;
  v3 = -[PUIColorWellView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [PUIColorWell alloc];
    v5 = -[UIColorWell initWithFrame:](v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    colorWell = v3->_colorWell;
    v3->_colorWell = (PUIColorWell *)v5;

    -[UIColorWell setSupportsAlpha:](v3->_colorWell, "setSupportsAlpha:", 0);
    -[PUIColorWellView addSubview:](v3, "addSubview:", v3->_colorWell);
  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUIColorWellView;
  -[PUIColorWellView layoutSubviews](&v3, sel_layoutSubviews);
  -[PUIColorWell intrinsicContentSize](self->_colorWell, "intrinsicContentSize");
  -[PUIColorWellView intrinsicContentSize](self, "intrinsicContentSize");
  UIRectCenteredRect();
  -[PUIColorWell setFrame:](self->_colorWell, "setFrame:");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 44.0;
  v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (PUIColorWell)colorWell
{
  return self->_colorWell;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorWell, 0);
}

@end

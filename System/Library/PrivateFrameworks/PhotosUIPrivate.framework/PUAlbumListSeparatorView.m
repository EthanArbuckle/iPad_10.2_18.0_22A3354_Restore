@implementation PUAlbumListSeparatorView

- (PUAlbumListSeparatorView)initWithFrame:(CGRect)a3
{
  PUAlbumListSeparatorView *v3;
  id v4;
  uint64_t v5;
  UIView *separatorLine;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUAlbumListSeparatorView;
  v3 = -[PUAlbumListSeparatorView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    separatorLine = v3->_separatorLine;
    v3->_separatorLine = (UIView *)v5;

    -[PUAlbumListSeparatorView addSubview:](v3, "addSubview:", v3->_separatorLine);
  }
  return v3;
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

  -[PUAlbumListSeparatorView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  PLPhysicalScreenScale();
  -[UIView setFrame:](self->_separatorLine, "setFrame:", v4, v6, v8, 1.0 / v9);
}

- (void)setLineColor:(id)a3
{
  UIColor *v4;
  UIColor *lineColor;

  if (self->_lineColor != a3)
  {
    v4 = (UIColor *)objc_msgSend(a3, "copy");
    lineColor = self->_lineColor;
    self->_lineColor = v4;

    -[UIView setBackgroundColor:](self->_separatorLine, "setBackgroundColor:", self->_lineColor);
  }
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_storeStrong((id *)&self->_separatorLine, 0);
}

@end

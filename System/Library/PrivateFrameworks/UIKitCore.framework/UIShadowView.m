@implementation UIShadowView

- (UIShadowView)initWithFrame:(CGRect)a3
{
  UIShadowView *v3;
  UIShadowView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIShadowView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setOpaque:](v3, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  }
  return v4;
}

- (void)setShadowImage:(id)a3 forEdge:(unint64_t)a4 inside:(BOOL)a5
{
  _BOOL4 v5;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  double v19;
  double v20;
  double v21;
  UIImage *v22;

  v5 = a5;
  v22 = (UIImage *)a3;
  if (self->_image != v22)
  {
    objc_storeStrong((id *)&self->_image, a3);
    -[UIView frame](self, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[UIImage size](v22, "size");
    v18 = v17;
    v19 = v18;
    v20 = v12 - v18;
    if (a4 != 1)
      v20 = v12 + v16;
    v21 = v12 + v16 - v19;
    if (a4 == 1)
      v21 = v12;
    if (!v5)
      v21 = v20;
    -[UIView setFrame:](self, "setFrame:", v10, v21, v14);
  }

}

- (void)drawRect:(CGRect)a3
{
  UIImage *image;

  image = self->_image;
  -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIImage draw1PartImageInRect:](image, "draw1PartImageInRect:");
}

+ (id)topShadowImage
{
  return _UIImageWithName(CFSTR("UITableCellShadowTop.png"));
}

+ (id)bottomShadowImage
{
  return _UIImageWithName(CFSTR("UITableCellShadowBottom.png"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end

@implementation LookAroundPuckGlyphView

- (LookAroundPuckGlyphView)initWithFrame:(CGRect)a3
{
  LookAroundPuckGlyphView *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UIImage *image;
  void *v8;
  LookAroundPuckGlyphView *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)LookAroundPuckGlyphView;
  v3 = -[LookAroundPuckGlyphView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("LookAroundPuckAnimation")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_flatImageWithColor:", v5));
    image = v3->_image;
    v3->_image = (UIImage *)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckGlyphView layer](v3, "layer"));
    objc_msgSend(v8, "setContents:", -[UIImage CGImage](v3->_image, "CGImage"));
    -[LookAroundPuckGlyphView tintColorDidChange](v3, "tintColorDidChange");
    objc_msgSend(v8, "setContentsRect:", 0.0, 0.0, 0.2, 0.2);
    v9 = v3;

  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[UIImage size](self->_image, "size");
  v3 = v2 / 5.0;
  v5 = v4 / 5.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)tintColorDidChange
{
  id v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LookAroundPuckGlyphView;
  -[LookAroundPuckGlyphView tintColorDidChange](&v6, "tintColorDidChange");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[LookAroundPuckGlyphView tintColor](self, "tintColor")));
  v4 = objc_msgSend(v3, "CGColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckGlyphView layer](self, "layer"));
  objc_msgSend(v5, "setContentsMultiplyColor:", v4);

}

- (void)setTilted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  unsigned int v7;
  double v8;
  double v9;
  id v10;

  if (self->_tilted != a3)
  {
    v3 = a3;
    self->_tilted = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckGlyphView layer](self, "layer"));
    objc_msgSend(v5, "removeAnimationForKey:", CFSTR("tilt"));

    if (v3)
      v6 = 24;
    else
      v6 = 0;
    if (v3)
      v7 = 4;
    else
      v7 = 0;
    v8 = (double)((v6 - (v7 & 0xEF | (16 * ((v7 & 4) != 0)))) & 0xFC) / 5.0;
    v9 = (double)v7 / 5.0;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundPuckGlyphView layer](self, "layer"));
    objc_msgSend(v10, "setContentsRect:", v8, v9, 0.2, 0.2);

  }
}

- (void)setTilted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MinY;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  CGRect v25;
  CGRect v26;

  if (self->_tilted != a3)
  {
    v4 = a4;
    v5 = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckGlyphView layer](self, "layer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presentationLayer"));
    objc_msgSend(v8, "contentsRect");
    x = v25.origin.x;
    y = v25.origin.y;
    width = v25.size.width;
    height = v25.size.height;
    MinX = CGRectGetMinX(v25);
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    MinY = CGRectGetMinY(v26);

    -[LookAroundPuckGlyphView setTilted:](self, "setTilted:", v5);
    if (v4)
    {
      v15 = 5 * (unint64_t)MinX + 25 * (unint64_t)MinY;
      if (v5)
        v16 = 24;
      else
        v16 = 0;
      v17 = v16 - v15 + 1;
      v24 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v17));
      if (v16 - v15 != -1)
      {
        v18 = 0;
        v19 = 0;
        do
        {
          if (v16 <= v15)
            v20 = v18;
          else
            v20 = v19;
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", (double)((v20 + v15) % 5) / 5.0, (double)((v20 + v15) / 5) / 5.0, 0.2, 0.2));
          objc_msgSend(v24, "addObject:", v21);

          ++v19;
          --v18;
        }
        while (v17 != v19);
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("contentsRect")));
      objc_msgSend(v22, "setDuration:", (double)(unint64_t)v17 * 0.0166666667);
      objc_msgSend(v22, "setValues:", v24);
      objc_msgSend(v22, "setCalculationMode:", kCAAnimationDiscrete);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckGlyphView layer](self, "layer"));
      objc_msgSend(v23, "addAnimation:forKey:", v22, CFSTR("tilt"));

    }
  }
}

- (BOOL)isTilted
{
  return self->_tilted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end

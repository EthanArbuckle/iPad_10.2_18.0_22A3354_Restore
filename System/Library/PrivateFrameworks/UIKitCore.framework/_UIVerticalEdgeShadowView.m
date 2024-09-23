@implementation _UIVerticalEdgeShadowView

- (_UIVerticalEdgeShadowView)initWithWidth:(double)a3 edge:(unint64_t)a4
{
  _UIVerticalEdgeShadowView *v6;
  _UIVerticalEdgeShadowView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIVerticalEdgeShadowView;
  v6 = -[UIImageView initWithFrame:](&v9, sel_initWithFrame_, 0.0, 0.0, a3, 1.0);
  v7 = v6;
  if (v6)
  {
    -[UIImageView setContentMode:](v6, "setContentMode:", 0);
    v7->_width = a3;
    v7->_edge = a4;
  }
  return v7;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIVerticalEdgeShadowView;
  -[UIImageView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UIVerticalEdgeShadowView _loadImageIfNecessary](self, "_loadImageIfNecessary");
}

- (void)_loadImageIfNecessary
{
  void *v3;
  double width;
  double v5;
  double v6;
  unint64_t edge;
  _UIShadowViewImageCacheKey *v8;
  void *v9;
  _QWORD *ContextStack;
  CGContext *v11;
  id v12;
  id v13;
  CGColor *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  -[UIImageView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    width = self->_width;
    -[UIView _screen](self, "_screen");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scale");
    v6 = v5;
    edge = self->_edge;
    if (qword_1ECD7AEB0 != -1)
      dispatch_once(&qword_1ECD7AEB0, &__block_literal_global_298);
    v8 = -[_UIShadowViewImageCacheKey initWithSize:scale:options:]([_UIShadowViewImageCacheKey alloc], "initWithSize:scale:options:", 2 * (edge != 2), width, v6);
    objc_msgSend((id)_MergedGlobals_11_5, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      _UIGraphicsBeginImageContextWithOptions(0, 1, width, 1.0, v6);
      ContextStack = GetContextStack(0);
      if (*(int *)ContextStack < 1)
        v11 = 0;
      else
        v11 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      +[UIColor blackColor](UIColor, "blackColor");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(v11, (CGColorRef)objc_msgSend(v12, "CGColor"));

      +[UIColor blackColor](UIColor, "blackColor");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = (CGColor *)objc_msgSend(v13, "CGColor");
      CGContextSetShadowWithColor(v11, *MEMORY[0x1E0C9D820], width * v6, v14);

      v15 = -width;
      if (edge == 2)
        v15 = width;
      v16 = width * -0.5;
      v17 = width;
      v18 = width;
      CGContextFillRect(v11, *(CGRect *)&v15);
      _UIGraphicsGetImageFromCurrentImageContext(0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "imageFlippedForRightToLeftLayoutDirection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      UIGraphicsEndImageContext();
      if (v9)
        objc_msgSend((id)_MergedGlobals_11_5, "setObject:forKey:", v9, v8);
    }

    -[UIImageView setImage:](self, "setImage:", v9);
  }
}

- (double)width
{
  return self->_width;
}

- (unint64_t)edge
{
  return self->_edge;
}

@end

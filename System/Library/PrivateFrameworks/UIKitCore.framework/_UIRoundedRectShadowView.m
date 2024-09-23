@implementation _UIRoundedRectShadowView

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIRoundedRectShadowView;
  -[UIImageView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UIRoundedRectShadowView _loadImageIfNecessary](self, "_loadImageIfNecessary");
}

- (void)_loadImageIfNecessary
{
  void *v3;
  double maskCornerRadius;
  void *v5;
  double v6;
  double v7;
  unsigned int v8;
  _UIShadowViewImageCacheKey *v9;
  void *v10;
  void *v11;
  _QWORD *ContextStack;
  CGContext *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  id v34;
  CGRect v35;
  CGRect v36;

  -[UIImageView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    maskCornerRadius = self->_maskCornerRadius;
    -[UIView _screen](self, "_screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v7 = v6;
    v8 = objc_msgSend((id)objc_opt_class(), "_shouldCutoutShadow");
    if (qword_1ECD7AEC0 != -1)
      dispatch_once(&qword_1ECD7AEC0, &__block_literal_global_70_0);
    v9 = -[_UIShadowViewImageCacheKey initWithSize:scale:options:]([_UIShadowViewImageCacheKey alloc], "initWithSize:scale:options:", v8, maskCornerRadius, v7);
    objc_msgSend((id)qword_1ECD7AEB8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("_UIPopoverShadow"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _UIGraphicsBeginImageContextWithOptions(0, 1, 400.0, 400.0, v7);
      ContextStack = GetContextStack(0);
      v33 = maskCornerRadius;
      if (*(int *)ContextStack < 1)
        v13 = 0;
      else
        v13 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      v14 = 0;
      v15 = *MEMORY[0x1E0C9D820];
      v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v17 = *MEMORY[0x1E0C9D538];
      v18 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      do
      {
        CGContextSaveGState(v13);
        if (v14 == 3)
        {
          v21 = 0.0;
          v20 = 400.0;
          v19 = 4.71238898;
        }
        else if (v14 == 2)
        {
          objc_msgSend(v11, "size");
          v20 = v22 + v22;
          v21 = 400.0;
          v19 = 3.14159265;
        }
        else
        {
          v19 = 0.0;
          v20 = v16;
          v21 = v15;
          if (v14 == 1)
          {
            v20 = 0.0;
            v21 = 400.0;
            v19 = 1.57079633;
          }
        }
        CGContextTranslateCTM(v13, v21, v20);
        CGContextRotateCTM(v13, v19);
        objc_msgSend(v11, "drawAtPoint:", v17, v18);
        CGContextRestoreGState(v13);
        ++v14;
      }
      while (v14 != 4);
      if ((v8 & 1) != 0)
      {
        +[UIColor blackColor](UIColor, "blackColor");
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetFillColorWithColor(v13, (CGColorRef)objc_msgSend(v23, "CGColor"));

        CGContextSetBlendMode(v13, kCGBlendModeClear);
        v35.size.width = 400.0;
        v35.origin.x = 0.0;
        v35.origin.y = 0.0;
        v35.size.height = 400.0;
        v36 = CGRectInset(v35, 150.0, 150.0);
        +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v36.origin.x, v36.origin.y, v36.size.width, v36.size.height, maskCornerRadius);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "fill");

      }
      _UIGraphicsGetImageFromCurrentImageContext(0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "resizableImageWithCapInsets:", -1.0 / v7 + 200.0, -1.0 / v7 + 200.0, -1.0 / v7 + 200.0, -1.0 / v7 + 200.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      UIGraphicsEndImageContext();
      if (v10)
        objc_msgSend((id)qword_1ECD7AEB8, "setObject:forKey:", v10, v9);

    }
    -[UIImageView setImage:](self, "setImage:", v10);

  }
  -[UIView frame](self, "frame", *(_QWORD *)&v33);
  if (v26 < 400.0 || (-[UIView frame](self, "frame"), v27 < 400.0))
  {
    v28 = fmax(self->_maskCornerRadius + 150.0, 170.0);
    -[UIView _screen](self, "_screen");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "scale");
    v31 = -1.0 / v30 + 200.0;

    if (v28 >= v31)
      v28 = v31;
    -[UIImageView image](self, "image");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "resizableImageWithCapInsets:", v28, v28, v28, v28);
    v34 = (id)objc_claimAutoreleasedReturnValue();

    -[UIImageView setImage:](self, "setImage:", v34);
  }
}

+ (BOOL)_shouldCutoutShadow
{
  return 0;
}

- (CGRect)frameWithContentWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double left;
  double top;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIRoundedRectShadowView _updateShadowOutsetsIfNecessary](self, "_updateShadowOutsetsIfNecessary");
  top = self->_shadowOutsets.top;
  left = self->_shadowOutsets.left;
  v10 = x + left;
  v11 = y + top;
  v12 = width - (left + self->_shadowOutsets.right);
  v13 = height - (top + self->_shadowOutsets.bottom);
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)_updateShadowOutsetsIfNecessary
{
  UIEdgeInsets *p_shadowOutsets;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;

  p_shadowOutsets = &self->_shadowOutsets;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_shadowOutsets.top), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_shadowOutsets.bottom))))) & 1) == 0)
  {
    +[_UIRoundedRectShadowView _expansionInsetForShadowImage](_UICutoutShadowView, "_expansionInsetForShadowImage");
    p_shadowOutsets->top = v3;
    p_shadowOutsets->left = v4;
    p_shadowOutsets->bottom = v5;
    p_shadowOutsets->right = v6;
  }
}

+ (UIEdgeInsets)_expansionInsetForShadowImage
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -150.0;
  v3 = -150.0;
  v4 = -150.0;
  v5 = -150.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (_UIRoundedRectShadowView)initWithCornerRadius:(double)a3
{
  _UIRoundedRectShadowView *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIRoundedRectShadowView;
  result = -[UIView init](&v5, sel_init);
  if (result)
    result->_maskCornerRadius = a3;
  return result;
}

- (double)maskCornerRadius
{
  return self->_maskCornerRadius;
}

@end

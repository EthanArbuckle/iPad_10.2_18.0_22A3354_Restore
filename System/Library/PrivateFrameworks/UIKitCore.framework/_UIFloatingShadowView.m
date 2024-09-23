@implementation _UIFloatingShadowView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_UIFloatingShadowView)initWithFrame:(CGRect)a3
{
  _UIFloatingShadowView *v3;
  _UIFloatingShadowView *v4;
  _QWORD v6[4];
  _UIFloatingShadowView *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIFloatingShadowView;
  v3 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39___UIFloatingShadowView_initWithFrame___block_invoke;
    v6[3] = &unk_1E16B1B28;
    v7 = v3;
    +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v6);

  }
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFloatingShadowView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UIFloatingShadowView _setShadowImageIfNeeded](self, "_setShadowImageIfNeeded");
  -[_UIFloatingShadowView _layoutShadow](self, "_layoutShadow");
}

- (void)setShadowOpacity:(double)a3
{
  double shadowOpacity;
  id v5;

  self->_shadowOpacity = a3;
  -[UIView layer](self->_shadowView, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  shadowOpacity = self->_shadowOpacity;
  *(float *)&shadowOpacity = shadowOpacity;
  objc_msgSend(v5, "setOpacity:", shadowOpacity);

}

- (void)setShadowEnabled:(BOOL)a3
{
  if (self->_shadowEnabled != a3)
  {
    self->_shadowEnabled = a3;
    -[_UIFloatingShadowView _updateShadowLayer](self, "_updateShadowLayer");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShadowImage:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  objc_storeStrong((id *)&self->_shadowImage, a3);
  v5 = a3;
  -[UIView layer](self->_shadowView, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v5);
  v7 = objc_msgSend(v6, "CGImage");

  objc_msgSend(v8, "setContents:", v7);
}

- (void)setShadowContentsCenter:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  self->_shadowContentsCenter = a3;
  -[UIView layer](self->_shadowView, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentsCenter:", x, y, width, height);

}

- (void)_layoutShadow
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  _BOOL4 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double shadowExpansion;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CATransform3D v37;
  CATransform3D v38;

  if (-[_UIFloatingShadowView isShadowEnabled](self, "isShadowEnabled"))
  {
    -[UIView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    -[_UIFloatingShadowView shadowSize](self, "shadowSize");
    v9 = v7 == *MEMORY[0x1E0C9D820];
    v10 = v8 == *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v9 && v10)
      v11 = v6;
    else
      v11 = v8;
    if (v9 && v10)
      v12 = v4;
    else
      v12 = v7;
    -[_UIFloatingShadowView shadowRadius](self, "shadowRadius");
    v14 = v13 / 20.0;
    v15 = v12 / (v13 / 20.0);
    v16 = v11 / (v13 / 20.0);
    if (-[_UIFloatingShadowView _disableOutsetShadowPath](self, "_disableOutsetShadowPath"))
      -[_UIFloatingShadowView shadowRadius](self, "shadowRadius");
    else
      shadowExpansion = self->_shadowExpansion;
    v18 = shadowExpansion + shadowExpansion;
    v19 = v15 + v18;
    v20 = v16 + v18;
    -[UIView bounds](self, "bounds");
    -[UIView setFrame:](self->_shadowView, "setFrame:", round(v22 + (v21 - v19) * 0.5), round(v24 + (v23 - v20) * 0.5), v19, v20);
    CATransform3DMakeScale(&v38, v14, v14, 0.0);
    v25 = *(_OWORD *)&v38.m33;
    *(_OWORD *)&self->_shadowTransform.m31 = *(_OWORD *)&v38.m31;
    *(_OWORD *)&self->_shadowTransform.m33 = v25;
    v26 = *(_OWORD *)&v38.m43;
    *(_OWORD *)&self->_shadowTransform.m41 = *(_OWORD *)&v38.m41;
    *(_OWORD *)&self->_shadowTransform.m43 = v26;
    v27 = *(_OWORD *)&v38.m13;
    *(_OWORD *)&self->_shadowTransform.m11 = *(_OWORD *)&v38.m11;
    *(_OWORD *)&self->_shadowTransform.m13 = v27;
    v28 = *(_OWORD *)&v38.m23;
    *(_OWORD *)&self->_shadowTransform.m21 = *(_OWORD *)&v38.m21;
    *(_OWORD *)&self->_shadowTransform.m23 = v28;
    *(double *)&v28 = self->_shadowVerticalOffset;
    v29 = *(_OWORD *)&self->_shadowTransform.m33;
    *(_OWORD *)&v37.m31 = *(_OWORD *)&self->_shadowTransform.m31;
    *(_OWORD *)&v37.m33 = v29;
    v30 = *(_OWORD *)&self->_shadowTransform.m43;
    *(_OWORD *)&v37.m41 = *(_OWORD *)&self->_shadowTransform.m41;
    *(_OWORD *)&v37.m43 = v30;
    v31 = *(_OWORD *)&self->_shadowTransform.m13;
    *(_OWORD *)&v37.m11 = *(_OWORD *)&self->_shadowTransform.m11;
    *(_OWORD *)&v37.m13 = v31;
    v32 = *(_OWORD *)&self->_shadowTransform.m23;
    *(_OWORD *)&v37.m21 = *(_OWORD *)&self->_shadowTransform.m21;
    *(_OWORD *)&v37.m23 = v32;
    CATransform3DTranslate(&v38, &v37, 0.0, *(CGFloat *)&v28, 0.0);
    v33 = *(_OWORD *)&v38.m33;
    *(_OWORD *)&self->_shadowTransform.m31 = *(_OWORD *)&v38.m31;
    *(_OWORD *)&self->_shadowTransform.m33 = v33;
    v34 = *(_OWORD *)&v38.m43;
    *(_OWORD *)&self->_shadowTransform.m41 = *(_OWORD *)&v38.m41;
    *(_OWORD *)&self->_shadowTransform.m43 = v34;
    v35 = *(_OWORD *)&v38.m13;
    *(_OWORD *)&self->_shadowTransform.m11 = *(_OWORD *)&v38.m11;
    *(_OWORD *)&self->_shadowTransform.m13 = v35;
    v36 = *(_OWORD *)&v38.m23;
    *(_OWORD *)&self->_shadowTransform.m21 = *(_OWORD *)&v38.m21;
    *(_OWORD *)&self->_shadowTransform.m23 = v36;
  }
}

- (void)_updateShadowLayer
{
  void *v3;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  void *v7;
  id v8;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  UIView *shadowView;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGFloat m33;
  unint64_t v21;
  __int128 v22;
  __int128 v23;

  if (self->_shadowView || !-[_UIFloatingShadowView isShadowEnabled](self, "isShadowEnabled"))
  {
    if (!-[_UIFloatingShadowView isShadowEnabled](self, "isShadowEnabled"))
    {
      -[UIView removeFromSuperview](self->_shadowView, "removeFromSuperview");
      shadowView = self->_shadowView;
      self->_shadowView = 0;

    }
  }
  else
  {
    -[_UIFloatingShadowView shadowImage](self, "shadowImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = [UIView alloc];
    -[UIView frame](self, "frame");
    v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
    v6 = self->_shadowView;
    self->_shadowView = v5;

    -[UIView setOpaque:](self->_shadowView, "setOpaque:", 0);
    -[UIView setBackgroundColor:](self->_shadowView, "setBackgroundColor:", 0);
    -[UIView layer](self->_shadowView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_retainAutorelease(v3);
    objc_msgSend(v7, "setContents:", objc_msgSend(v8, "CGImage"));
    -[_UIFloatingShadowView shadowContentsCenter](self, "shadowContentsCenter");
    objc_msgSend(v7, "setContentsCenter:");
    LODWORD(v9) = 0;
    objc_msgSend(v7, "setOpacity:", v9);
    objc_msgSend(v7, "setZPosition:", -1000.0);
    -[_UIFloatingShadowView _layoutShadow](self, "_layoutShadow");
    v10 = *(_OWORD *)&self->_shadowTransform.m23;
    v17 = *(_OWORD *)&self->_shadowTransform.m21;
    v18 = v10;
    v19 = *(_OWORD *)&self->_shadowTransform.m31;
    m33 = self->_shadowTransform.m33;
    v11 = *(_OWORD *)&self->_shadowTransform.m13;
    v15 = *(_OWORD *)&self->_shadowTransform.m11;
    v16 = v11;
    v12 = *(_OWORD *)&self->_shadowTransform.m43;
    v22 = *(_OWORD *)&self->_shadowTransform.m41;
    v23 = v12;
    -[UIView layer](self->_shadowView, "layer", v15, v16, v17, v18, v19, *(_QWORD *)&m33);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0xBF50624DD2F1A9FCLL;
    objc_msgSend(v13, "setTransform:", &v15);

    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_shadowView, 0);
  }
}

- (void)_setShadowImageIfNeeded
{
  _QWORD v2[5];

  if (!self->_shadowImage)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __48___UIFloatingShadowView__setShadowImageIfNeeded__block_invoke;
    v2[3] = &unk_1E16B1B28;
    v2[4] = self;
    +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v2);
  }
}

- (CGPath)_shadowPathForSize:(CGSize)a3 radius:(double)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  CGPath *v18;
  double x;
  double y;
  double v21;
  id v22;
  _QWORD v24[4];
  CGRect v25;
  CGRect v26;

  height = a3.height;
  width = a3.width;
  if (qword_1ECD7A4C8 != -1)
    dispatch_once(&qword_1ECD7A4C8, &__block_literal_global_45);
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[_UIFloatingShadowView cornerRadius](self, "cornerRadius", *(_QWORD *)&width, *(_QWORD *)&height);
  v24[2] = v16;
  *(double *)&v24[3] = a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v24, "{?={CGSize=dd}dd}");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (CGPath *)objc_msgSend((id)_MergedGlobals_3_1, "objectForKey:", v17);
  if (!v18)
  {
    x = round(v9 + (v13 - width) * 0.5);
    y = round(v11 + (v15 - height) * 0.5);
    if (!-[_UIFloatingShadowView _disableOutsetShadowPath](self, "_disableOutsetShadowPath"))
    {
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      v26 = CGRectInset(v25, -a4, -a4);
      x = v26.origin.x;
      y = v26.origin.y;
      width = v26.size.width;
      height = v26.size.height;
    }
    -[_UIFloatingShadowView cornerRadius](self, "cornerRadius");
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v21);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = (CGPath *)objc_msgSend(v22, "CGPath");

    if (v18)
      objc_msgSend((id)_MergedGlobals_3_1, "setObject:forKey:", v18, v17);
  }

  return v18;
}

- (BOOL)isShadowEnabled
{
  return self->_shadowEnabled;
}

- (CGSize)shadowSize
{
  double width;
  double height;
  CGSize result;

  width = self->_shadowSize.width;
  height = self->_shadowSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setShadowSize:(CGSize)a3
{
  self->_shadowSize = a3;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (double)shadowVerticalOffset
{
  return self->_shadowVerticalOffset;
}

- (void)setShadowVerticalOffset:(double)a3
{
  self->_shadowVerticalOffset = a3;
}

- (double)shadowExpansion
{
  return self->_shadowExpansion;
}

- (void)setShadowExpansion:(double)a3
{
  self->_shadowExpansion = a3;
}

- (UIImage)shadowImage
{
  return self->_shadowImage;
}

- (CGRect)shadowContentsCenter
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_shadowContentsCenter.origin.x;
  y = self->_shadowContentsCenter.origin.y;
  width = self->_shadowContentsCenter.size.width;
  height = self->_shadowContentsCenter.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (BOOL)_disableOutsetShadowPath
{
  return self->__disableOutsetShadowPath;
}

- (void)set_disableOutsetShadowPath:(BOOL)a3
{
  self->__disableOutsetShadowPath = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowImage, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end

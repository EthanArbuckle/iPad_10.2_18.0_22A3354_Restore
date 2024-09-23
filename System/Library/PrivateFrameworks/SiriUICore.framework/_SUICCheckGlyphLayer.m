@implementation _SUICCheckGlyphLayer

- (_SUICCheckGlyphLayer)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  _SUICCheckGlyphLayer *v15;
  void *v16;
  CAShapeLayer **p_checkPackageLayer;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  CAShapeLayer *v23;
  CGFloat v24;
  _SUICCheckGlyphLayer *v25;
  CATransform3D v27;
  objc_super v28;
  id v29;
  CGRect v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)MEMORY[0x1E0CD27F8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLForResource:withExtension:", CFSTR("glyph_check"), CFSTR("caar"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CD3070];
  v29 = 0;
  objc_msgSend(v8, "packageWithContentsOfURL:type:options:error:", v10, v11, 0, &v29);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v29;

  objc_msgSend(v12, "rootLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v28.receiver = self;
    v28.super_class = (Class)_SUICCheckGlyphLayer;
    v15 = -[_SUICCheckGlyphLayer init](&v28, sel_init);
    if (v15)
    {
      -[_SUICCheckGlyphLayer setGeometryFlipped:](v15, "setGeometryFlipped:", objc_msgSend(v12, "isGeometryFlipped"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v14;
      else
        v16 = 0;
      p_checkPackageLayer = &v15->_checkPackageLayer;
      objc_storeStrong((id *)&v15->_checkPackageLayer, v16);
      -[CAShapeLayer setLineCap:](v15->_checkPackageLayer, "setLineCap:", *MEMORY[0x1E0CD3010]);
      -[CAShapeLayer bounds](v15->_checkPackageLayer, "bounds");
      v19 = v18;
      v21 = v20;
      v30.origin.x = x;
      v30.origin.y = y;
      v30.size.width = width;
      v30.size.height = height;
      if (CGRectIsNull(v30))
      {
        x = *MEMORY[0x1E0C9D538];
        y = *(double *)(MEMORY[0x1E0C9D538] + 8);
        width = v19 * 0.5;
        height = v21 * 0.5;
      }
      _SUICLayerNullActions();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SUICCheckGlyphLayer setActions:](v15, "setActions:", v22);

      v23 = *p_checkPackageLayer;
      v24 = fmin(width / v19, height / v21);
      CATransform3DMakeScale(&v27, v24, v24, 1.0);
      -[CAShapeLayer setTransform:](v23, "setTransform:", &v27);
      -[_SUICCheckGlyphLayer setFrame:](v15, "setFrame:", x, y, width, height);
      -[_SUICCheckGlyphLayer addSublayer:](v15, "addSublayer:", *p_checkPackageLayer);
      if (*p_checkPackageLayer)
      {
        -[_SUICCheckGlyphLayer _createMask](v15, "_createMask");
        -[_SUICCheckGlyphLayer _updateCovered:completion:](v15, "_updateCovered:completion:", 0, 0);
      }
    }
    self = v15;
    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)layoutSublayers
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CAShapeLayer *checkPackageLayer;
  double v12;
  double MidX;
  CATransform3D v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)_SUICCheckGlyphLayer;
  -[_SUICCheckGlyphLayer layoutSublayers](&v15, sel_layoutSublayers);
  -[_SUICCheckGlyphLayer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_SUICCheckGlyphLayer _pointScaleToMatchBoundsSize:](self, "_pointScaleToMatchBoundsSize:", v7, v9);
  checkPackageLayer = self->_checkPackageLayer;
  CATransform3DMakeScale(&v14, v12 * 0.5, v12 * 0.5, 1.0);
  -[CAShapeLayer setTransform:](checkPackageLayer, "setTransform:", &v14);
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  MidX = CGRectGetMidX(v16);
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  -[CAShapeLayer setPosition:](self->_checkPackageLayer, "setPosition:", MidX, CGRectGetMidY(v17));
}

- (double)_pointScaleToMatchBoundsSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  height = a3.height;
  width = a3.width;
  -[CAShapeLayer bounds](self->_checkPackageLayer, "bounds");
  v7 = width / v6;
  v8 = 0.0;
  if (v6 == 0.0)
    v7 = 0.0;
  if (v5 != 0.0)
    v8 = height / v5;
  v9 = fmin(v7, v8);
  return v9 + v9;
}

- (void)_createMask
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  CAGradientLayer *v7;
  CAGradientLayer *maskLayer;
  CAGradientLayer *v9;
  void *v10;
  CAGradientLayer *v11;
  void *v12;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v17;
  double MinY;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  CATransform3D *p_uncoveredTransform;
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
  __int128 v37;
  CATransform3D v38;
  CATransform3D v39;
  _QWORD v40[3];
  CGRect v41;
  CGRect v42;

  v40[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.0);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");

  v7 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E0CD2790]);
  maskLayer = self->_maskLayer;
  self->_maskLayer = v7;

  v9 = self->_maskLayer;
  v40[0] = v6;
  v40[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setColors:](v9, "setColors:", v10);

  -[CAGradientLayer setAnchorPoint:](self->_maskLayer, "setAnchorPoint:", 1.0, 0.0);
  v11 = self->_maskLayer;
  _SUICLayerNullActions();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setActions:](v11, "setActions:", v12);

  -[CAShapeLayer setMask:](self->_checkPackageLayer, "setMask:", self->_maskLayer);
  -[CAShapeLayer bounds](self->_checkPackageLayer, "bounds");
  x = v41.origin.x;
  y = v41.origin.y;
  width = v41.size.width;
  height = v41.size.height;
  v17 = v41.size.width * 0.363636364;
  MinY = CGRectGetMinY(v41);
  v19 = (v17 - x) / 0.707106781;
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  v20 = (CGRectGetMaxX(v42) - v17) / 0.707106781;
  v21 = v17 + v20 * 0.707106781 + v19 * -0.707106781;
  v22 = MinY + v20 * 0.707106781 + v19 * 0.707106781;
  v23 = sqrt((v21 - v17) * (v21 - v17) + (v22 - MinY) * (v22 - MinY));
  -[CAGradientLayer setPosition:](self->_maskLayer, "setPosition:", v21 + 2.82842712, v22 + 2.82842712);
  v24 = fmax(v19, fmax(v20, v23)) + 8.0;
  -[CAGradientLayer setBounds:](self->_maskLayer, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v24, v24);
  -[CAGradientLayer setStartPoint:](self->_maskLayer, "setStartPoint:", 0.5, 0.0);
  -[CAGradientLayer setEndPoint:](self->_maskLayer, "setEndPoint:", 0.5, 4.0 / v24);
  p_uncoveredTransform = &self->_uncoveredTransform;
  CATransform3DMakeRotation(&v39, 0.785398163, 0.0, 0.0, 1.0);
  v26 = *(_OWORD *)&v39.m33;
  *(_OWORD *)&self->_uncoveredTransform.m31 = *(_OWORD *)&v39.m31;
  *(_OWORD *)&self->_uncoveredTransform.m33 = v26;
  v27 = *(_OWORD *)&v39.m43;
  *(_OWORD *)&self->_uncoveredTransform.m41 = *(_OWORD *)&v39.m41;
  *(_OWORD *)&self->_uncoveredTransform.m43 = v27;
  v28 = *(_OWORD *)&v39.m13;
  *(_OWORD *)&self->_uncoveredTransform.m11 = *(_OWORD *)&v39.m11;
  *(_OWORD *)&self->_uncoveredTransform.m13 = v28;
  v29 = *(_OWORD *)&v39.m23;
  *(_OWORD *)&self->_uncoveredTransform.m21 = *(_OWORD *)&v39.m21;
  *(_OWORD *)&self->_uncoveredTransform.m23 = v29;
  self = (_SUICCheckGlyphLayer *)((char *)self + 184);
  v30 = *(_OWORD *)&p_uncoveredTransform->m33;
  *(_OWORD *)&v38.m31 = *(_OWORD *)&p_uncoveredTransform->m31;
  *(_OWORD *)&v38.m33 = v30;
  v31 = *(_OWORD *)&p_uncoveredTransform->m43;
  *(_OWORD *)&v38.m41 = *(_OWORD *)&p_uncoveredTransform->m41;
  *(_OWORD *)&v38.m43 = v31;
  v32 = *(_OWORD *)&p_uncoveredTransform->m13;
  *(_OWORD *)&v38.m11 = *(_OWORD *)&p_uncoveredTransform->m11;
  *(_OWORD *)&v38.m13 = v32;
  v33 = *(_OWORD *)&p_uncoveredTransform->m23;
  *(_OWORD *)&v38.m21 = *(_OWORD *)&p_uncoveredTransform->m21;
  *(_OWORD *)&v38.m23 = v33;
  CATransform3DRotate(&v39, &v38, 1.57079633, 0.0, 0.0, 1.0);
  v34 = *(_OWORD *)&v39.m33;
  *(_OWORD *)&self->_uncoveredTransform.m12 = *(_OWORD *)&v39.m31;
  *(_OWORD *)&self->_uncoveredTransform.m14 = v34;
  v35 = *(_OWORD *)&v39.m43;
  *(_OWORD *)&self->_uncoveredTransform.m22 = *(_OWORD *)&v39.m41;
  *(_OWORD *)&self->_uncoveredTransform.m24 = v35;
  v36 = *(_OWORD *)&v39.m13;
  *(_OWORD *)&self->super.super.isa = *(_OWORD *)&v39.m11;
  *(_OWORD *)&self->super._attr.layer = v36;
  v37 = *(_OWORD *)&v39.m23;
  *(_OWORD *)&self->_checkPackageLayer = *(_OWORD *)&v39.m21;
  *(_OWORD *)&self->_covered = v37;
}

- (void)setPrimaryColor:(id)a3 animated:(BOOL)a4
{
  -[_SUICCheckGlyphLayer setPrimaryColor:animated:completion:](self, "setPrimaryColor:animated:completion:", a3, a4, 0);
}

- (void)setPrimaryColor:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  UIColor *v8;
  id v9;
  UIColor *primaryColor;
  UIColor *v11;
  UIColor *v12;
  CGColor *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  v6 = a4;
  v8 = (UIColor *)a3;
  v9 = a5;
  primaryColor = self->_primaryColor;
  if (v8 && primaryColor)
  {
    if (!-[UIColor isEqual:](primaryColor, "isEqual:", v8))
    {
LABEL_6:
      v11 = (UIColor *)-[UIColor copy](v8, "copy");
      v12 = self->_primaryColor;
      self->_primaryColor = v11;

      v13 = -[UIColor CGColor](self->_primaryColor, "CGColor");
      if (v6)
      {
        -[CAShapeLayer presentationLayer](self->_checkPackageLayer, "presentationLayer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "strokeColor");
        +[_SUICCheckGlyphSpringAnimationFactory springAnimationWithKeyPath:](_SUICCheckGlyphSpringAnimationFactory, "springAnimationWithKeyPath:", CFSTR("strokeColor"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAdditive:", 0);
        objc_msgSend(v16, "setFromValue:", v15);
        objc_msgSend(v16, "setToValue:", v13);
        v17 = objc_msgSend(v14, "fillColor");
        +[_SUICCheckGlyphSpringAnimationFactory springAnimationWithKeyPath:](_SUICCheckGlyphSpringAnimationFactory, "springAnimationWithKeyPath:", CFSTR("fillColor"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "setAdditive:", 0);
        objc_msgSend(v18, "setFromValue:", v17);
        objc_msgSend(v18, "setToValue:", v13);
        objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
        if (v9)
        {
          v19 = (void *)MEMORY[0x1E0CD28B0];
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __60___SUICCheckGlyphLayer_setPrimaryColor_animated_completion___block_invoke;
          v20[3] = &unk_1E4A54C70;
          v21 = v9;
          objc_msgSend(v19, "setCompletionBlock:", v20);

        }
        -[CAShapeLayer removeAnimationForKey:](self->_checkPackageLayer, "removeAnimationForKey:", CFSTR("strokeColor"));
        -[CAShapeLayer removeAnimationForKey:](self->_checkPackageLayer, "removeAnimationForKey:", CFSTR("fillColor"));
        -[CAShapeLayer addAnimation:forKey:](self->_checkPackageLayer, "addAnimation:forKey:", v18, CFSTR("strokeColor"));
        -[CAShapeLayer addAnimation:forKey:](self->_checkPackageLayer, "addAnimation:forKey:", v18, CFSTR("fillColor"));
        objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

      }
      -[CAShapeLayer setStrokeColor:](self->_checkPackageLayer, "setStrokeColor:", v13);
      -[CAShapeLayer setFillColor:](self->_checkPackageLayer, "setFillColor:", v13);
      goto LABEL_11;
    }
    primaryColor = self->_primaryColor;
  }
  if (primaryColor != v8)
    goto LABEL_6;
  if (v9)
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
LABEL_11:

}

- (BOOL)isRevealed
{
  return self->_covered;
}

- (void)setRevealed:(BOOL)a3
{
  -[_SUICCheckGlyphLayer setRevealed:animated:withCompletion:](self, "setRevealed:animated:withCompletion:", a3, 0, 0);
}

- (double)setCovered:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  double result;

  if (((!self->_covered ^ a3) & 1) != 0)
    return 0.0;
  self->_covered = a3;
  -[_SUICCheckGlyphLayer _updateCovered:completion:](self, "_updateCovered:completion:", a4, a5);
  return result;
}

- (double)_updateCovered:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  int *v7;
  _OWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  CAGradientLayer *maskLayer;
  void *v14;
  void *v15;
  id v16;
  CAGradientLayer *v17;
  double v18;
  double v19;
  CAGradientLayer *v20;
  _QWORD v22[4];
  id v23;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v26;
  CATransform3D v27;

  v4 = a3;
  v6 = a4;
  if (self->_covered)
    v7 = &OBJC_IVAR____SUICCheckGlyphLayer__coveredTransform;
  else
    v7 = &OBJC_IVAR____SUICCheckGlyphLayer__uncoveredTransform;
  v8 = (_OWORD *)((char *)self + *v7);
  v9 = v8[5];
  *(_OWORD *)&v27.m31 = v8[4];
  *(_OWORD *)&v27.m33 = v9;
  v10 = v8[7];
  *(_OWORD *)&v27.m41 = v8[6];
  *(_OWORD *)&v27.m43 = v10;
  v11 = v8[1];
  *(_OWORD *)&v27.m11 = *v8;
  *(_OWORD *)&v27.m13 = v11;
  v12 = v8[3];
  *(_OWORD *)&v27.m21 = v8[2];
  *(_OWORD *)&v27.m23 = v12;
  memset(&v26, 0, sizeof(v26));
  maskLayer = self->_maskLayer;
  if (maskLayer)
    -[CAGradientLayer transform](maskLayer, "transform");
  a = v27;
  b = v26;
  if (!CATransform3DEqualToTransform(&a, &b))
  {
    if (v4)
    {
      +[_SUICCheckGlyphSpringAnimationFactory springAnimationWithKeyPath:](_SUICCheckGlyphSpringAnimationFactory, "springAnimationWithKeyPath:", CFSTR("transform"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      if (v6)
      {
        v15 = (void *)MEMORY[0x1E0CD28B0];
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __50___SUICCheckGlyphLayer__updateCovered_completion___block_invoke;
        v22[3] = &unk_1E4A54C70;
        v23 = v6;
        objc_msgSend(v15, "setCompletionBlock:", v22);

      }
      a = v26;
      b = v27;
      objc_msgSend(v14, "_suic_updateForAdditiveAnimationFromTransform:toTransform:", &a, &b);
      v16 = (id)-[CAGradientLayer _suic_addAdditiveAnimation:](self->_maskLayer, "_suic_addAdditiveAnimation:", v14);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      objc_msgSend(v14, "duration");
      v17 = self->_maskLayer;
      v19 = fmax(v18, 0.0);
      a = v27;
      -[CAGradientLayer setTransform:](v17, "setTransform:", &a);

      goto LABEL_14;
    }
    v20 = self->_maskLayer;
    a = v27;
    -[CAGradientLayer setTransform:](v20, "setTransform:", &a);
  }
  v19 = 0.0;
  if (v6)
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
LABEL_14:

  return v19;
}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (void)setPrimaryColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_checkPackageLayer, 0);
}

@end

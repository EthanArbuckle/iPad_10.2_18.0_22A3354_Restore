@implementation UIKBRenderFactoryHWR_Landscape

- (double)handwritingGradientStartLocation
{
  return 0.25;
}

- (UIEdgeInsets)handwritingAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGPoint)deleteGlyphOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.5;
  v3 = 0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)spaceKeyTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 1.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)spaceKeyFontSize
{
  return 18.0;
}

- (double)symbolImageControlKeyFontSize
{
  return 18.0;
}

- (UIEdgeInsets)symbolFrameInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 3.0;
  v3 = 3.0;
  v4 = 3.0;
  v5 = 3.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setupLayoutSegments
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UIKBRenderFactory10Key_Round controlKeyTraits](self, "controlKeyTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setKeyStates:", 3);
  objc_msgSend(v6, "addLayoutRect:asTriangle:", 0, 0.0, 0.0, 0.188, 1.0);
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v6);
  -[UIKBRenderFactory10Key_Round activeControlKeyTraits](self, "activeControlKeyTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setKeyStates:", 4);
  objc_msgSend(v5, "addLayoutRect:asTriangle:", 0, 0.0, 0.0, 0.188, 1.0);
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v5);

}

- (unint64_t)edgesAdjustedForTranslucentGapsForGeometry:(id)a3 key:(id)a4 onKeyplane:(id)a5
{
  id v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIKBRenderFactoryHWR_Landscape;
  v7 = a4;
  v8 = -[UIKBRenderFactory10Key edgesAdjustedForTranslucentGapsForGeometry:key:onKeyplane:](&v10, sel_edgesAdjustedForTranslucentGapsForGeometry_key_onKeyplane_, a3, v7, a5);
  LODWORD(a3) = objc_msgSend(v7, "displayType", v10.receiver, v10.super_class);

  if ((_DWORD)a3 == 12)
    return 14;
  else
    return (unint64_t)v8;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
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
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)UIKBRenderFactoryHWR_Landscape;
  -[UIKBRenderFactoryHWR_Portrait _traitsForKey:onKeyplane:](&v27, sel__traitsForKey_onKeyplane_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "displayType") == 12)
  {
    if (-[UIKBRenderFactory10Key_Round useRoundCorner](self, "useRoundCorner"))
    {
      objc_msgSend(v7, "removeAllRenderEffects");
      objc_msgSend(v7, "geometry");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRoundRectCorners:", -1);

      objc_msgSend(v7, "geometry");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setRoundRectRadius:", 5.0);

      objc_msgSend(v7, "geometry");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "paddedFrame");
      v13 = v12 + -0.5;
      v15 = v14 + 0.5;
      v17 = v16 + -0.5;
      v18 = 1.0;
    }
    else
    {
      objc_msgSend(v7, "geometry");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "paddedFrame");
      v13 = v19 + 0.0;
      v18 = -0.5;
      v15 = v20 + -0.5;
      v17 = v21 + 0.0;
    }
    v22 = v11 + v18;
    objc_msgSend(v7, "geometry");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPaddedFrame:", v13, v17, v15, v22);

  }
  if (-[UIKBRenderFactory10Key_Round useRoundCorner](self, "useRoundCorner")
    && objc_msgSend(v6, "interactionType") == 4)
  {
    objc_msgSend(v7, "geometry");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setRoundRectCorners:", 2);

    objc_msgSend(v7, "geometry");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setRoundRectRadius:", 5.0);

  }
  return v7;
}

@end

@implementation SBElasticSliderView

- (SBElasticSliderView)initWithFrame:(CGRect)a3
{
  SBElasticSliderView *v3;
  SBElasticSliderView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  UIView *maskView;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  MTMaterialView *baseMaterialView;
  MTMaterialView *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  UIView *shadowView;
  void *v30;
  void *v31;
  uint64_t v32;
  MTMaterialView *captureOnlyMaterialView;
  MTMaterialView *v34;
  void *v35;
  void *v36;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)SBElasticSliderView;
  v3 = -[CCUIContinuousSliderView initWithFrame:](&v38, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_accessoryLayoutEdge = 0;
    -[SBElasticSliderView bounds](v3, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v5, v7, v9, v11);
    maskView = v4->_maskView;
    v4->_maskView = (UIView *)v13;

    -[UIView setUserInteractionEnabled:](v4->_maskView, "setUserInteractionEnabled:", 0);
    -[UIView layer](v4->_maskView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCompositingFilter:", *MEMORY[0x1E0CD2C50]);

    -[CCUIBaseSliderView elasticContentBoundaryView](v4, "elasticContentBoundaryView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "insertSubview:atIndex:", v4->_maskView, 0);

    v17 = (void *)MEMORY[0x1E0D47498];
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "userInterfaceIdiom");

    if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v20 = CFSTR("elasticHUDBackgroundSheer");
    else
      v20 = CFSTR("elasticHUDBackground");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", v20, v21, 2, 0, 1.0);
    v22 = objc_claimAutoreleasedReturnValue();
    baseMaterialView = v4->_baseMaterialView;
    v4->_baseMaterialView = (MTMaterialView *)v22;

    v24 = v4->_baseMaterialView;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%p"), CFSTR("SBElasticSliderMaterialView"), v4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTMaterialView setGroupNameBase:](v24, "setGroupNameBase:", v25);

    -[CCUIBaseSliderView elasticContentView](v4, "elasticContentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "insertSubview:atIndex:", v4->_baseMaterialView, 0);

    -[CCUIBaseSliderView elasticContentView](v4, "elasticContentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setClipsToBounds:", 1);

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v6, v8, v10, v12);
    shadowView = v4->_shadowView;
    v4->_shadowView = (UIView *)v28;

    -[UIView layer](v4->_shadowView, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setShadowPathIsBounds:", 1);

    -[CCUIBaseSliderView elasticBackgroundContentView](v4, "elasticBackgroundContentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "insertSubview:atIndex:", v4->_shadowView, 0);

    -[SBElasticSliderView _updateShadowMode](v4, "_updateShadowMode");
    v32 = -[MTMaterialView copy](v4->_baseMaterialView, "copy");
    captureOnlyMaterialView = v4->_captureOnlyMaterialView;
    v4->_captureOnlyMaterialView = (MTMaterialView *)v32;

    -[MTMaterialView setCaptureOnly:](v4->_captureOnlyMaterialView, "setCaptureOnly:", 1);
    v34 = v4->_captureOnlyMaterialView;
    -[MTMaterialView groupNameBase](v4->_baseMaterialView, "groupNameBase");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTMaterialView setGroupNameBase:](v34, "setGroupNameBase:", v35);

    -[CCUIBaseSliderView elasticBackgroundContentView](v4, "elasticBackgroundContentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "insertSubview:atIndex:", v4->_captureOnlyMaterialView, 0);

  }
  return v4;
}

- (void)setContinuousSliderCornerRadius:(double)a3
{
  void *v5;
  id v6;

  -[CCUIBaseSliderView elasticContentView](self, "elasticContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setContinuousCornerRadius:", a3);

  -[UIView _setContinuousCornerRadius:](self->_shadowView, "_setContinuousCornerRadius:", a3);
  -[UIView layer](self->_shadowView, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShadowOffset:", 0.0, a3 * 0.25);

}

- (void)layoutElasticContentViews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBElasticSliderView;
  -[CCUIContinuousSliderView layoutElasticContentViews](&v12, sel_layoutElasticContentViews);
  -[CCUIBaseSliderView elasticContentView](self, "elasticContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[MTMaterialView setFrame:](self->_captureOnlyMaterialView, "setFrame:", v5, v7, v9, v11);
  -[MTMaterialView setFrame:](self->_baseMaterialView, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_shadowView, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_maskView, "setFrame:", v5, v7, v9, v11);
  -[SBElasticSliderView _updateCornerRadius](self, "_updateCornerRadius");
  -[SBElasticSliderView _layoutAccessoryViews](self, "_layoutAccessoryViews");
  -[SBElasticSliderView _updateShadowMode](self, "_updateShadowMode");
}

- (CGPoint)glyphCenter
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  v5.receiver = self;
  v5.super_class = (Class)SBElasticSliderView;
  -[CCUIContinuousSliderView glyphCenter](&v5, sel_glyphCenter);
  -[SBElasticSliderView _elasticGlyphCenterForDefaultGlyphCenter:](self, "_elasticGlyphCenterForDefaultGlyphCenter:");
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setAxis:(unint64_t)a3
{
  objc_super v5;

  if (-[CCUIContinuousSliderView axis](self, "axis") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBElasticSliderView;
    -[CCUIContinuousSliderView setAxis:](&v5, sel_setAxis_, a3);
    -[SBElasticSliderView _updateGlyphScaleForAdditiveScaleOrAxisUpdate](self, "_updateGlyphScaleForAdditiveScaleOrAxisUpdate");
  }
}

- (void)setCornerRadiusMinorAxisFraction:(double)a3
{
  if (self->_cornerRadiusMinorAxisFraction != a3)
  {
    self->_cornerRadiusMinorAxisFraction = a3;
    -[SBElasticSliderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setRegularMinorAxisDimension:(double)a3
{
  if (self->_regularMinorAxisDimension != a3)
  {
    self->_regularMinorAxisDimension = a3;
    -[SBElasticSliderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCompactMinorAxisDimension:(double)a3
{
  if (self->_compactMinorAxisDimension != a3)
  {
    self->_compactMinorAxisDimension = a3;
    -[SBElasticSliderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setAdditiveGlyphScaleFactor:(double)a3
{
  if (self->_additiveGlyphScaleFactor != a3)
  {
    self->_additiveGlyphScaleFactor = a3;
    -[SBElasticSliderView _updateGlyphScaleForAdditiveScaleOrAxisUpdate](self, "_updateGlyphScaleForAdditiveScaleOrAxisUpdate");
  }
}

- (void)setShadowMode:(unint64_t)a3
{
  if (self->_shadowMode != a3)
  {
    self->_shadowMode = a3;
    -[SBElasticSliderView _updateShadowMode](self, "_updateShadowMode");
  }
}

- (UIEdgeInsets)shadowOutsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[UIView layer](self->_shadowView, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowOffset");
  objc_msgSend(v2, "shadowRadius");
  UIEdgeInsetsMakeWithEdges();
  UIEdgeInsetsMin();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setLeadingAccessoryView:(id)a3
{
  UIView *v5;
  UIView *leadingAccessoryView;
  void *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  leadingAccessoryView = self->_leadingAccessoryView;
  v8 = v5;
  if (leadingAccessoryView != v5)
  {
    -[UIView removeFromSuperview](leadingAccessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_leadingAccessoryView, a3);
    -[CCUIBaseSliderView elasticBackgroundContentView](self, "elasticBackgroundContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[SBElasticSliderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTrailingAccessoryView:(id)a3
{
  UIView *v5;
  UIView *trailingAccessoryView;
  void *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  trailingAccessoryView = self->_trailingAccessoryView;
  v8 = v5;
  if (trailingAccessoryView != v5)
  {
    -[UIView removeFromSuperview](trailingAccessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_trailingAccessoryView, a3);
    -[CCUIBaseSliderView elasticBackgroundContentView](self, "elasticBackgroundContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[SBElasticSliderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setAccessoryLayoutEdge:(unint64_t)a3
{
  if (self->_accessoryLayoutEdge != a3)
  {
    self->_accessoryLayoutEdge = a3;
    -[SBElasticSliderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setAccessoryViewPadding:(double)a3
{
  if (self->_accessoryViewPadding != a3)
  {
    self->_accessoryViewPadding = a3;
    -[SBElasticSliderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)_minorAxisElasticLength
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  -[CCUIBaseSliderView elasticContentView](self, "elasticContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = -[CCUIContinuousSliderView axis](self, "axis");
  v13 = v5;
  v14 = v7;
  v15 = v9;
  v16 = v11;
  if (v12 == 1)
    return CGRectGetHeight(*(CGRect *)&v13);
  else
    return CGRectGetWidth(*(CGRect *)&v13);
}

- (double)_fractionToRegularMetrics
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[SBElasticSliderView regularMinorAxisDimension](self, "regularMinorAxisDimension");
  v4 = v3;
  -[SBElasticSliderView compactMinorAxisDimension](self, "compactMinorAxisDimension");
  v6 = v5;
  -[SBElasticSliderView _minorAxisElasticLength](self, "_minorAxisElasticLength");
  if (v4 <= 0.0 || v6 <= 0.0 || v7 <= 0.0)
    return 0.0;
  else
    return fmax(fmin((v7 - v6) / (v4 - v6) * 4.0, 1.0), 0.0);
}

- (void)_updateCornerRadius
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[SBElasticSliderView _fractionToRegularMetrics](self, "_fractionToRegularMetrics");
  v4 = v3;
  -[SBElasticSliderView _minorAxisElasticLength](self, "_minorAxisElasticLength");
  v6 = v5;
  -[SBElasticSliderView cornerRadiusMinorAxisFraction](self, "cornerRadiusMinorAxisFraction");
  -[SBElasticSliderView setContinuousSliderCornerRadius:](self, "setContinuousSliderCornerRadius:", v6 * (v4 * v7 + (1.0 - v4) * 0.5));
}

- (void)_layoutAccessoryViews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  unint64_t v26;
  double MaxY;
  int v28;
  char v29;
  CGFloat Height;
  CGFloat v31;
  uint64_t v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  double v38;
  CGFloat v39;
  double MidY;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat MidX;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  CGFloat v71;
  double v72;
  CGFloat rect;
  CGFloat rectb;
  double recta;
  CGFloat v76;
  double v77;
  double v78;
  double v79;
  id v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;

  -[SBElasticSliderView leadingAccessoryView](self, "leadingAccessoryView");
  v80 = (id)objc_claimAutoreleasedReturnValue();
  -[SBElasticSliderView trailingAccessoryView](self, "trailingAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "frame");
  v67 = v4;
  v70 = v5;
  v76 = v7;
  v78 = v6;
  objc_msgSend(v3, "frame");
  v9 = v8;
  rect = v10;
  v12 = v11;
  v14 = v13;
  -[CCUIBaseSliderView elasticBackgroundContentView](self, "elasticBackgroundContentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  -[SBElasticSliderView accessoryViewPadding](self, "accessoryViewPadding");
  v25 = v24;
  v26 = -[SBElasticSliderView accessoryLayoutEdge](self, "accessoryLayoutEdge");
  if (v26 == 4)
  {
    v85.origin.x = v17;
    v85.origin.y = v19;
    v85.size.width = v21;
    v85.size.height = v23;
    MidX = CGRectGetMidX(v85);
    v86.origin.x = v17;
    v86.origin.y = v19;
    v86.size.width = v21;
    v86.size.height = v23;
    CGRectGetMaxY(v86);
    v87.origin.x = v67;
    v87.origin.y = v70;
    v87.size.height = v76;
    v87.size.width = v78;
    Height = CGRectGetHeight(v87);
    v88.size.height = v14;
    v31 = Height * 0.5;
    v88.origin.x = v9;
    v88.origin.y = rect;
    v88.size.width = v12;
    v29 = 0;
    v28 = 0;
    MaxY = v25 * 0.5 + v31 + CGRectGetHeight(v88) * 0.5;
  }
  else
  {
    if (!v26)
    {
      if (-[CCUIContinuousSliderView axis](self, "axis") == 1)
        LOBYTE(v26) = 2;
      else
        LOBYTE(v26) = 1;
    }
    if ((v26 & 2) != 0)
    {
      v68 = v14;
      v32 = -[SBElasticSliderView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
      v66 = v12;
      v33 = v17;
      v34 = v19;
      v35 = v21;
      v36 = v23;
      if (v32 == 1)
      {
        v37 = v25 + CGRectGetMaxX(*(CGRect *)&v33);
        v89.origin.x = v17;
        v89.origin.y = v19;
        v89.size.width = v21;
        v89.size.height = v23;
        v38 = CGRectGetMinX(v89) - v12 - v25;
        v39 = v78;
      }
      else
      {
        v39 = v78;
        v37 = CGRectGetMinX(*(CGRect *)&v33) - v78 - v25;
        v90.origin.x = v17;
        v90.origin.y = v19;
        v90.size.width = v21;
        v90.size.height = v23;
        v38 = v25 + CGRectGetMaxX(v90);
      }
      v91.origin.x = v17;
      v91.origin.y = v19;
      v91.size.width = v21;
      v91.size.height = v23;
      MidY = CGRectGetMidY(v91);
      v92.origin.x = v37;
      v92.origin.y = v70;
      v92.size.width = v39;
      v92.size.height = v76;
      v71 = MidY - CGRectGetHeight(v92) * 0.5;
      v93.origin.x = v17;
      v93.origin.y = v19;
      v93.size.width = v21;
      v93.size.height = v23;
      v41 = CGRectGetMidY(v93);
      v94.origin.x = v38;
      v94.origin.y = rect;
      v94.size.width = v66;
      v94.size.height = v68;
      rectb = v41 - CGRectGetHeight(v94) * 0.5;
      v95.origin.x = v37;
      v95.origin.y = v71;
      v95.size.width = v78;
      v95.size.height = v76;
      CGRectGetMidX(v95);
      v96.origin.x = v37;
      v96.origin.y = v71;
      v96.size.width = v78;
      v96.size.height = v76;
      CGRectGetMidY(v96);
      v97.origin.x = v38;
      v97.origin.y = rectb;
      v97.size.width = v66;
      v97.size.height = v68;
      CGRectGetMidX(v97);
      v98.origin.x = v38;
      v98.origin.y = rectb;
      v98.size.width = v66;
      v98.size.height = v68;
      MaxY = CGRectGetMidY(v98);
      v29 = 0;
      v28 = 1;
    }
    else
    {
      v81.origin.x = v17;
      v81.origin.y = v19;
      v81.size.width = v21;
      v81.size.height = v23;
      CGRectGetMidX(v81);
      v82.origin.x = v17;
      v82.origin.y = v19;
      v82.size.width = v21;
      v82.size.height = v23;
      CGRectGetMinY(v82);
      v83.origin.x = v17;
      v83.origin.y = v19;
      v83.size.width = v21;
      v83.size.height = v23;
      CGRectGetMidX(v83);
      v84.origin.x = v17;
      v84.origin.y = v19;
      v84.size.width = v21;
      v84.size.height = v23;
      MaxY = CGRectGetMaxY(v84);
      v28 = 0;
      v29 = 1;
    }
  }
  objc_msgSend(v80, "frame", MaxY, *(_QWORD *)&MidX);
  SBUnintegralizedRectCenteredAboutPoint();
  v69 = v42;
  v44 = v43;
  v77 = v46;
  v79 = v45;
  objc_msgSend(v3, "frame");
  SBUnintegralizedRectCenteredAboutPoint();
  v48 = v47;
  v50 = v49;
  v72 = v52;
  recta = v51;
  -[SBElasticSliderView traitCollection](self, "traitCollection");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "displayScale");

  objc_msgSend(v80, "frame");
  UIRectCenteredAboutPointScale();
  v55 = v54;
  v57 = v56;
  objc_msgSend(v3, "frame");
  UIRectCenteredAboutPointScale();
  if (v28)
  {
    v60 = v55;
  }
  else
  {
    v58 = v48;
    v60 = v69;
  }
  if (v28)
    v61 = v44;
  else
    v61 = v57;
  if (v28)
    v62 = v50;
  else
    v62 = v59;
  if ((v29 & (v58 < 2.0)) != 0)
    v63 = 2.0;
  else
    v63 = v58;
  if ((v29 & (v60 < 2.0)) != 0)
    v64 = 2.0;
  else
    v64 = v60;
  objc_msgSend(v80, "setFrame:", v64, v61, v79, v77);
  objc_msgSend(v3, "setFrame:", v63, v62, recta, v72);

}

- (void)_updateShadowMode
{
  unint64_t shadowMode;
  double v3;
  int v4;
  double v5;
  id v6;

  shadowMode = self->_shadowMode;
  if (shadowMode == 1)
  {
    v3 = 5.0;
    v4 = 1050253722;
  }
  else if (shadowMode)
  {
    v4 = 0;
    v3 = 0.0;
  }
  else
  {
    v3 = 20.0;
    v4 = 1043878380;
  }
  -[UIView layer](self->_shadowView, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = v4;
  objc_msgSend(v6, "setShadowOpacity:", v5);
  objc_msgSend(v6, "setShadowRadius:", v3);

}

- (CGPoint)_elasticGlyphCenterForDefaultGlyphCenter:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[CCUIBaseSliderView glyphContainerView](self, "glyphContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  if (-[CCUIContinuousSliderView axis](self, "axis") == 2)
  {
    v11 = v8 * 0.5;
    v12 = v10 - v8;
  }
  else
  {
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      v11 = v8 - v10;
    else
      v11 = v10;
    v12 = v10 * 0.5;
  }
  if (-[CCUIBaseSliderView shouldIntegralizeContentLayout](self, "shouldIntegralizeContentLayout"))
  {
    -[SBElasticSliderView traitCollection](self, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayScale");
    UIPointRoundToScale();
    v11 = v14;
    v12 = v15;

  }
  -[SBElasticSliderView _fractionToRegularMetrics](self, "_fractionToRegularMetrics");
  v17 = y * v16 + (1.0 - v16) * v12;
  v18 = x * v16 + (1.0 - v16) * v11;
  result.y = v17;
  result.x = v18;
  return result;
}

- (void)_updateGlyphScaleForAdditiveScaleOrAxisUpdate
{
  double v3;
  double v4;

  -[SBElasticSliderView additiveGlyphScaleFactor](self, "additiveGlyphScaleFactor");
  if (v3 == 0.0)
    v4 = 1.0;
  else
    v4 = v3;
  -[CCUIBaseSliderView setGlyphScale:](self, "setGlyphScale:", v4 * dbl_1D0E8AF20[-[CCUIContinuousSliderView axis](self, "axis") == 2]);
}

- (id)_createElasticBackgroundView
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  v4 = (void *)MEMORY[0x1E0D47498];
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("elasticHUDModuleSheer"), v5, 0, 0, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (double)cornerRadiusMinorAxisFraction
{
  return self->_cornerRadiusMinorAxisFraction;
}

- (double)regularMinorAxisDimension
{
  return self->_regularMinorAxisDimension;
}

- (double)compactMinorAxisDimension
{
  return self->_compactMinorAxisDimension;
}

- (double)additiveGlyphScaleFactor
{
  return self->_additiveGlyphScaleFactor;
}

- (unint64_t)shadowMode
{
  return self->_shadowMode;
}

- (UIView)leadingAccessoryView
{
  return self->_leadingAccessoryView;
}

- (UIView)trailingAccessoryView
{
  return self->_trailingAccessoryView;
}

- (unint64_t)accessoryLayoutEdge
{
  return self->_accessoryLayoutEdge;
}

- (double)accessoryViewPadding
{
  return self->_accessoryViewPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingAccessoryView, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryView, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_baseMaterialView, 0);
  objc_storeStrong((id *)&self->_captureOnlyMaterialView, 0);
}

@end

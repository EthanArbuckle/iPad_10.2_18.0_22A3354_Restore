@implementation SBPIPStashedMaskView

- (SBPIPStashedMaskView)initWithFrame:(CGRect)a3
{
  return -[SBPIPStashedMaskView initWithFrame:minimumStashTabSize:](self, "initWithFrame:minimumStashTabSize:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (SBPIPStashedMaskView)initWithFrame:(CGRect)a3 minimumStashTabSize:(CGSize)a4
{
  double height;
  double width;
  SBPIPStashedMaskView *v6;
  SBPIPStashedMaskView *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  UIView *mainBody;
  uint64_t v15;
  UIView *tab;
  uint64_t v17;
  UIView *tabTopCornerFill;
  uint64_t v19;
  UIView *tabBottomCornerFill;
  uint64_t v21;
  UIView *tabLeftTopCornerDestOut;
  uint64_t v23;
  UIView *tabLeftBottomCornerDestOut;
  uint64_t v25;
  UIView *tabRightTopCornerDestOut;
  uint64_t v27;
  UIView *tabRightBottomCornerDestOut;
  UIView *v29;
  void *v30;
  UIView *v31;
  void *v32;
  UIView *v33;
  void *v34;
  UIView *v35;
  void *v36;
  UIView *v37;
  void *v38;
  UIView *v39;
  void *v40;
  UIView *v41;
  void *v42;
  UIView *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  objc_super v51;

  height = a4.height;
  width = a4.width;
  v51.receiver = self;
  v51.super_class = (Class)SBPIPStashedMaskView;
  v6 = -[SBPIPStashedMaskView initWithFrame:](&v51, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6;
  if (v6)
  {
    v6->_tabHidden = 1;
    v8 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], v10, v11, v12);
    mainBody = v7->_mainBody;
    v7->_mainBody = (UIView *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v9, v10, v11, v12);
    tab = v7->_tab;
    v7->_tab = (UIView *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v9, v10, v11, v12);
    tabTopCornerFill = v7->_tabTopCornerFill;
    v7->_tabTopCornerFill = (UIView *)v17;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v9, v10, v11, v12);
    tabBottomCornerFill = v7->_tabBottomCornerFill;
    v7->_tabBottomCornerFill = (UIView *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v9, v10, v11, v12);
    tabLeftTopCornerDestOut = v7->_tabLeftTopCornerDestOut;
    v7->_tabLeftTopCornerDestOut = (UIView *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v9, v10, v11, v12);
    tabLeftBottomCornerDestOut = v7->_tabLeftBottomCornerDestOut;
    v7->_tabLeftBottomCornerDestOut = (UIView *)v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v9, v10, v11, v12);
    tabRightTopCornerDestOut = v7->_tabRightTopCornerDestOut;
    v7->_tabRightTopCornerDestOut = (UIView *)v25;

    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v9, v10, v11, v12);
    tabRightBottomCornerDestOut = v7->_tabRightBottomCornerDestOut;
    v7->_tabRightBottomCornerDestOut = (UIView *)v27;

    -[UIView setUserInteractionEnabled:](v7->_tab, "setUserInteractionEnabled:", 0);
    -[UIView setUserInteractionEnabled:](v7->_tabTopCornerFill, "setUserInteractionEnabled:", 0);
    -[UIView setUserInteractionEnabled:](v7->_tabBottomCornerFill, "setUserInteractionEnabled:", 0);
    -[UIView setUserInteractionEnabled:](v7->_tabLeftTopCornerDestOut, "setUserInteractionEnabled:", 0);
    -[UIView setUserInteractionEnabled:](v7->_tabLeftBottomCornerDestOut, "setUserInteractionEnabled:", 0);
    -[UIView setUserInteractionEnabled:](v7->_tabRightTopCornerDestOut, "setUserInteractionEnabled:", 0);
    -[UIView setUserInteractionEnabled:](v7->_tabRightBottomCornerDestOut, "setUserInteractionEnabled:", 0);
    v29 = v7->_mainBody;
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v29, "setBackgroundColor:", v30);

    v31 = v7->_tab;
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v31, "setBackgroundColor:", v32);

    v33 = v7->_tabTopCornerFill;
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v33, "setBackgroundColor:", v34);

    v35 = v7->_tabBottomCornerFill;
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v35, "setBackgroundColor:", v36);

    v37 = v7->_tabLeftTopCornerDestOut;
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v37, "setBackgroundColor:", v38);

    v39 = v7->_tabLeftBottomCornerDestOut;
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v39, "setBackgroundColor:", v40);

    v41 = v7->_tabRightTopCornerDestOut;
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v41, "setBackgroundColor:", v42);

    v43 = v7->_tabRightBottomCornerDestOut;
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v43, "setBackgroundColor:", v44);

    -[UIView _setContinuousCornerRadius:](v7->_tab, "_setContinuousCornerRadius:", 10.0);
    -[UIView _setContinuousCornerRadius:](v7->_tabLeftTopCornerDestOut, "_setContinuousCornerRadius:", 3.0);
    -[UIView _setContinuousCornerRadius:](v7->_tabLeftBottomCornerDestOut, "_setContinuousCornerRadius:", 3.0);
    -[UIView _setContinuousCornerRadius:](v7->_tabRightTopCornerDestOut, "_setContinuousCornerRadius:", 3.0);
    -[UIView _setContinuousCornerRadius:](v7->_tabRightBottomCornerDestOut, "_setContinuousCornerRadius:", 3.0);
    -[UIView layer](v7->_tabLeftTopCornerDestOut, "layer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = *MEMORY[0x1E0CD2C50];
    objc_msgSend(v45, "setCompositingFilter:", *MEMORY[0x1E0CD2C50]);

    -[UIView layer](v7->_tabRightTopCornerDestOut, "layer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setCompositingFilter:", v46);

    -[UIView layer](v7->_tabLeftBottomCornerDestOut, "layer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setCompositingFilter:", v46);

    -[UIView layer](v7->_tabRightBottomCornerDestOut, "layer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setCompositingFilter:", v46);

    -[SBPIPStashedMaskView addSubview:](v7, "addSubview:", v7->_mainBody);
    -[SBPIPStashedMaskView addSubview:](v7, "addSubview:", v7->_tab);
    -[SBPIPStashedMaskView addSubview:](v7, "addSubview:", v7->_tabTopCornerFill);
    -[SBPIPStashedMaskView addSubview:](v7, "addSubview:", v7->_tabBottomCornerFill);
    -[SBPIPStashedMaskView addSubview:](v7, "addSubview:", v7->_tabLeftTopCornerDestOut);
    -[SBPIPStashedMaskView addSubview:](v7, "addSubview:", v7->_tabLeftBottomCornerDestOut);
    -[SBPIPStashedMaskView addSubview:](v7, "addSubview:", v7->_tabRightTopCornerDestOut);
    -[SBPIPStashedMaskView addSubview:](v7, "addSubview:", v7->_tabRightBottomCornerDestOut);
    -[SBPIPStashedMaskView setMinimumStashTabSize:](v7, "setMinimumStashTabSize:", width, height);
    -[UIView SBPIP_setAllowsGroupBlending:](v7, "SBPIP_setAllowsGroupBlending:", 0);
    -[UIView SBPIP_setAllowsEdgeAntialiasing:](v7, "SBPIP_setAllowsEdgeAntialiasing:", 1);
  }
  return v7;
}

- (void)setTabHidden:(BOOL)a3 left:(BOOL)a4
{
  id WeakRetained;
  UIView *tab;
  UIView *tabTopCornerFill;
  UIView *tabBottomCornerFill;
  double v10;
  _BOOL4 tabShownLeft;
  double width;
  double v13;
  __int128 v14;
  UIView *v15;
  UIView *v16;
  UIView *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CGAffineTransform v21;
  CGAffineTransform v22;

  if (self->_tabHidden != a3 || self->_tabShownLeft != a4)
  {
    self->_tabHidden = a3;
    self->_tabShownLeft = a4 & ~a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_tabShadowView);
    if (a3)
    {
      tab = self->_tab;
      v20 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v22.a = *MEMORY[0x1E0C9BAA8];
      v19 = *(_OWORD *)&v22.a;
      *(_OWORD *)&v22.c = v20;
      *(_OWORD *)&v22.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v18 = *(_OWORD *)&v22.tx;
      -[UIView setTransform:](tab, "setTransform:", &v22);
      *(_OWORD *)&v22.a = v19;
      *(_OWORD *)&v22.c = v20;
      *(_OWORD *)&v22.tx = v18;
      objc_msgSend(WeakRetained, "setTransform:", &v22);
      tabTopCornerFill = self->_tabTopCornerFill;
      *(_OWORD *)&v22.a = v19;
      *(_OWORD *)&v22.c = v20;
      *(_OWORD *)&v22.tx = v18;
      -[UIView setTransform:](tabTopCornerFill, "setTransform:", &v22);
      tabBottomCornerFill = self->_tabBottomCornerFill;
      *(_OWORD *)&v22.a = v19;
      *(_OWORD *)&v22.c = v20;
      *(_OWORD *)&v22.tx = v18;
      -[UIView setTransform:](tabBottomCornerFill, "setTransform:", &v22);
      v10 = 0.0;
    }
    else
    {
      tabShownLeft = self->_tabShownLeft;
      width = self->_minimumStashTabSize.width;
      memset(&v22, 0, sizeof(v22));
      v13 = -width;
      if (!tabShownLeft)
        v13 = width;
      v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v21.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v21.c = v14;
      *(_OWORD *)&v21.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      CGAffineTransformTranslate(&v22, &v21, v13, 0.0);
      v15 = self->_tab;
      v21 = v22;
      -[UIView setTransform:](v15, "setTransform:", &v21);
      v21 = v22;
      objc_msgSend(WeakRetained, "setTransform:", &v21);
      v16 = self->_tabTopCornerFill;
      v21 = v22;
      -[UIView setTransform:](v16, "setTransform:", &v21);
      v17 = self->_tabBottomCornerFill;
      v21 = v22;
      -[UIView setTransform:](v17, "setTransform:", &v21);
      v10 = 1.0;
    }
    objc_msgSend(WeakRetained, "setAlpha:", v10);

  }
}

- (void)setMinimumStashTabSize:(CGSize)a3
{
  double width;

  width = a3.width;
  if (self->_minimumStashTabSize.width != a3.width || self->_minimumStashTabSize.height != a3.height)
  {
    self->_minimumStashTabSize = a3;
    -[UIView setBounds:](self->_tabLeftTopCornerDestOut, "setBounds:", 0.0, 0.0, a3.width, a3.width);
    -[UIView setBounds:](self->_tabRightTopCornerDestOut, "setBounds:", 0.0, 0.0, width, width);
    -[UIView setBounds:](self->_tabLeftBottomCornerDestOut, "setBounds:", 0.0, 0.0, width, width);
    -[UIView setBounds:](self->_tabRightBottomCornerDestOut, "setBounds:", 0.0, 0.0, width, width);
  }
}

- (CGRect)tabViewBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double height;
  CGRect result;

  -[SBPIPStashedMaskView bounds](self, "bounds");
  if (v6 >= 105.0)
    height = self->_minimumStashTabSize.height;
  else
    height = v6;
  if (v6 > self->_minimumStashTabSize.height)
    v6 = height;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_mainBodyBounds
{
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
  CGRect result;

  -[SBPIPStashedMaskView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBPIPStashedMaskView tabViewBounds](self, "tabViewBounds");
  if (v10 > v11)
    v11 = v10;
  v12 = v4;
  v13 = v6;
  v14 = v8;
  result.size.height = v11;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (double)_continuousCornerRadius
{
  double result;

  -[UIView _continuousCornerRadius](self->_mainBody, "_continuousCornerRadius");
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  -[UIView _setContinuousCornerRadius:](self->_mainBody, "_setContinuousCornerRadius:", a3);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  UIView *tab;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  y = a3.y;
  x = a3.x;
  tab = self->_tab;
  -[SBPIPStashedMaskView superview](self, "superview", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:fromView:](tab, "convertPoint:fromView:", v8, x, y);
  v10 = v9;
  v12 = v11;

  -[UIView layer](self->_tab, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(tab) = objc_msgSend(v13, "containsPoint:", v10, v12);

  return (char)tab;
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
  double v10;
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
  UIView *tab;
  double MidX;
  double v25;
  double v26;
  UIView *tabTopCornerFill;
  UIView *tabBottomCornerFill;
  UIView *tabLeftTopCornerDestOut;
  UIView *tabRightTopCornerDestOut;
  UIView *tabLeftBottomCornerDestOut;
  UIView *tabRightBottomCornerDestOut;
  _BOOL8 v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  objc_super v38;
  CGRect v39;
  CGRect v40;

  v38.receiver = self;
  v38.super_class = (Class)SBPIPStashedMaskView;
  -[SBPIPStashedMaskView layoutSubviews](&v38, sel_layoutSubviews);
  -[SBPIPStashedMaskView bounds](self, "bounds");
  v34 = v4;
  v35 = v3;
  v36 = v5;
  v37 = v6;
  -[SBPIPStashedMaskView _mainBodyBounds](self, "_mainBodyBounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[SBPIPStashedMaskView tabViewBounds](self, "tabViewBounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[UIView setFrame:](self->_mainBody, "setFrame:", v8, v10, v12, v14);
  -[UIView setBounds:](self->_tab, "setBounds:", v16, v18, v20, v22);
  tab = self->_tab;
  v39.origin.x = v35;
  v39.origin.y = v34;
  v39.size.width = v36;
  v39.size.height = v37;
  MidX = CGRectGetMidX(v39);
  v40.origin.x = v35;
  v40.origin.y = v34;
  v40.size.width = v36;
  v40.size.height = v37;
  -[UIView setCenter:](tab, "setCenter:", MidX, CGRectGetMidY(v40));
  -[UIView _continuousCornerRadius](self->_tab, "_continuousCornerRadius");
  v26 = v20 + v25 * -2.0;
  -[UIView setBounds:](self->_tabTopCornerFill, "setBounds:", v16, v18, v26, 5.0);
  -[UIView setBounds:](self->_tabBottomCornerFill, "setBounds:", v16, v18, v26, 5.0);
  tabTopCornerFill = self->_tabTopCornerFill;
  -[UIView center](self->_tab, "center");
  -[UIView center](self->_tab, "center");
  UIPointRoundToScale();
  -[UIView setCenter:](tabTopCornerFill, "setCenter:");
  tabBottomCornerFill = self->_tabBottomCornerFill;
  -[UIView center](self->_tab, "center");
  -[UIView center](self->_tab, "center");
  UIPointRoundToScale();
  -[UIView setCenter:](tabBottomCornerFill, "setCenter:");
  tabLeftTopCornerDestOut = self->_tabLeftTopCornerDestOut;
  -[UIView center](self->_tab, "center");
  UIPointRoundToScale();
  -[UIView setCenter:](tabLeftTopCornerDestOut, "setCenter:");
  tabRightTopCornerDestOut = self->_tabRightTopCornerDestOut;
  -[UIView center](self->_tabLeftTopCornerDestOut, "center");
  UIPointRoundToScale();
  -[UIView setCenter:](tabRightTopCornerDestOut, "setCenter:");
  tabLeftBottomCornerDestOut = self->_tabLeftBottomCornerDestOut;
  -[UIView center](self->_tab, "center");
  UIPointRoundToScale();
  -[UIView setCenter:](tabLeftBottomCornerDestOut, "setCenter:");
  tabRightBottomCornerDestOut = self->_tabRightBottomCornerDestOut;
  -[UIView center](self->_tabLeftBottomCornerDestOut, "center");
  UIPointRoundToScale();
  -[UIView setCenter:](tabRightBottomCornerDestOut, "setCenter:");
  v33 = v37 < 136.0;
  -[UIView setHidden:](self->_tabTopCornerFill, "setHidden:", v33, 136.0, v37);
  -[UIView setHidden:](self->_tabBottomCornerFill, "setHidden:", v33);
  -[UIView setHidden:](self->_tabLeftTopCornerDestOut, "setHidden:", v33);
  -[UIView setHidden:](self->_tabLeftBottomCornerDestOut, "setHidden:", v33);
  -[UIView setHidden:](self->_tabRightTopCornerDestOut, "setHidden:", v33);
  -[UIView setHidden:](self->_tabRightBottomCornerDestOut, "setHidden:", v33);
}

- (UIView)tabShadowView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_tabShadowView);
}

- (void)setTabShadowView:(id)a3
{
  objc_storeWeak((id *)&self->_tabShadowView, a3);
}

- (CGSize)minimumStashTabSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumStashTabSize.width;
  height = self->_minimumStashTabSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabShadowView);
  objc_storeStrong((id *)&self->_tabRightBottomCornerDestOut, 0);
  objc_storeStrong((id *)&self->_tabRightTopCornerDestOut, 0);
  objc_storeStrong((id *)&self->_tabLeftBottomCornerDestOut, 0);
  objc_storeStrong((id *)&self->_tabLeftTopCornerDestOut, 0);
  objc_storeStrong((id *)&self->_tabBottomCornerFill, 0);
  objc_storeStrong((id *)&self->_tabTopCornerFill, 0);
  objc_storeStrong((id *)&self->_tab, 0);
  objc_storeStrong((id *)&self->_mainBody, 0);
}

@end

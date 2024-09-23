@implementation CarCardView

- (CarCardView)initWithFrame:(CGRect)a3
{
  CarCardView *v3;
  CarCardView *v4;
  NSString *title;
  NSNumber *primaryAxisFillLimit;
  NSNumber *secondaryAxisFillLimit;
  id v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  CarDynamicBlurView *v42;
  CarDynamicBlurView *dynamicBlurView;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  objc_super v62;
  _QWORD v63[6];
  _QWORD v64[4];

  v62.receiver = self;
  v62.super_class = (Class)CarCardView;
  v3 = -[CarCardView initWithFrame:](&v62, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CarCardView setClipsToBounds:](v3, "setClipsToBounds:", 0);
    -[CarCardView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("CarCardView"));
    title = v4->_title;
    v4->_title = 0;

    v4->_accessory = 0;
    *(_OWORD *)&v4->_layout.edgePosition = xmmword_100E34B90;
    *(_OWORD *)&v4->_layout.primaryAxis = xmmword_100E2D550;
    v4->_layout.primaryAxisFillMode = 3;
    *(_QWORD *)&v4->_layout.primaryAxisFillModePriority = 1148846080;
    v4->_layout.secondaryAxisFillMode = 2;
    v4->_layout.secondaryAxisFillModePriority = 1000.0;
    primaryAxisFillLimit = v4->_layout.primaryAxisFillLimit;
    v4->_layout.primaryAxisFillLimit = 0;

    secondaryAxisFillLimit = v4->_layout.secondaryAxisFillLimit;
    v4->_layout.secondaryAxisFillLimit = 0;

    __asm { FMOV            V0.2D, #8.0 }
    *(_OWORD *)&v4->_layout.margins.top = _Q0;
    *(_OWORD *)&v4->_layout.margins.bottom = _Q0;
    v4->_layout.flipForRightHandDrive = 1;
    *(_DWORD *)(&v4->_layout.flipForRightHandDrive + 1) = 0;
    *((_DWORD *)&v4->_layout.flipForRightHandDrive + 1) = 0;
    v4->_layout.edgesAffectingMapInsets = 8;
    v4->_layout.horizontallyCenterMapInsets = 0;
    v4->_roundedCorners = sub_10063E714(v4->_layout.pinnedEdges);
    v13 = objc_alloc((Class)UIView);
    -[CarCardView bounds](v4, "bounds");
    v61 = objc_msgSend(v13, "initWithFrame:");
    objc_msgSend(v61, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarCardView addSubview:](v4, "addSubview:", v61);
    -[CarCardView setMaskingView:](v4, "setMaskingView:", v61);
    v14 = objc_alloc((Class)UIView);
    -[CarCardView bounds](v4, "bounds");
    v59 = objc_msgSend(v14, "initWithFrame:");
    objc_msgSend(v59, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v61, "addSubview:", v59);
    -[CarCardView setContainerView:](v4, "setContainerView:", v59);
    v15 = objc_alloc((Class)UIView);
    -[CarCardView bounds](v4, "bounds");
    v60 = objc_msgSend(v15, "initWithFrame:");
    objc_msgSend(v60, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "heightAnchor"));
    LODWORD(v17) = 1132068864;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToConstant:priority:", 44.0, v17));
    objc_msgSend(v60, "addConstraint:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "heightAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintGreaterThanOrEqualToConstant:", 44.0));
    objc_msgSend(v60, "addConstraint:", v20);

    LODWORD(v21) = 1148846080;
    objc_msgSend(v60, "setContentHuggingPriority:forAxis:", 1, v21);
    LODWORD(v22) = 1148846080;
    objc_msgSend(v60, "setContentCompressionResistancePriority:forAxis:", 1, v22);
    objc_msgSend(v59, "addSubview:", v60);
    -[CarCardView setAccessoryContainerView:](v4, "setAccessoryContainerView:", v60);
    -[CarCardView _updateHuggingCompressionPriorities](v4, "_updateHuggingCompressionPriorities");
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "topAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView topAnchor](v4, "topAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v55));
    v64[0] = v53;
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "leftAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView leftAnchor](v4, "leftAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v23));
    v64[1] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView bottomAnchor](v4, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
    v64[2] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "rightAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView rightAnchor](v4, "rightAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
    v64[3] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v64, 4));
    -[CarCardView addConstraints:](v4, "addConstraints:", v31);

    -[CarCardView _refreshAccessories](v4, "_refreshAccessories");
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "topAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "topAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v56));
    v63[0] = v54;
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "leftAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "leftAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v50));
    v63[1] = v49;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "bottomAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "bottomAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
    v63[2] = v46;
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "rightAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "rightAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v32));
    v63[3] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "leftAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "leftAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v35));
    v63[4] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "rightAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "rightAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v38));
    v63[5] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 6));
    objc_msgSend(v61, "addConstraints:", v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView layer](v4, "layer"));
    objc_msgSend(v41, "setShadowPathIsBounds:", 1);

    v42 = -[CarDynamicBlurView initWithBlurViewContext:delegate:]([CarDynamicBlurView alloc], "initWithBlurViewContext:delegate:", 0, 0);
    dynamicBlurView = v4->_dynamicBlurView;
    v4->_dynamicBlurView = v42;

  }
  return v4;
}

- (CarCardView)initWithContent:(id)a3
{
  id v4;
  CarCardView *v5;
  CarCardView *v6;

  v4 = a3;
  v5 = -[CarCardView initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
    -[CarCardView setContent:](v5, "setContent:", v4);

  return v6;
}

- (void)setContent:(id)a3
{
  CarCardContent *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  CarCardContent *v12;
  _QWORD v13[5];
  CarCardContent *v14;

  v5 = (CarCardContent *)a3;
  if (self->_content != v5)
  {
    v12 = v5;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CarCardView content](self, "content"));
    objc_storeStrong((id *)&self->_content, a3);
    if (v6)
    {
      if (objc_msgSend(v6, "isViewLoaded"))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView containerView](self, "containerView"));

        if (v8 == v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
          objc_msgSend(v10, "removeFromSuperview");

        }
      }
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_styleProvider);

    if (WeakRetained == v6)
      -[CarCardView setStyleProvider:](self, "setStyleProvider:", 0);
    if (v12)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10063E920;
      v13[3] = &unk_1011AC8B0;
      v13[4] = self;
      v14 = v12;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v13);

    }
    v5 = v12;
  }

}

- (void)didMoveToWindow
{
  void *v3;
  UIImage *focusRingImage;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarCardView;
  -[CarCardView didMoveToWindow](&v6, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView window](self, "window"));

  if (v3)
  {
    -[CarCardView _applyCornerMask](self, "_applyCornerMask");
    -[CarCardView _refreshAccessories](self, "_refreshAccessories");
    -[CarCardView _updateInterfaceStyleRelatedViews](self, "_updateInterfaceStyleRelatedViews");
  }
  else
  {
    focusRingImage = self->_focusRingImage;
    self->_focusRingImage = 0;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView focusRingImageView](self, "focusRingImageView"));
    objc_msgSend(v5, "removeFromSuperview");

    -[CarCardView setFocusRingImageView:](self, "setFocusRingImageView:", 0);
  }
}

- (void)setLayout:(id *)a3
{
  void *v5;
  char v6;
  void *v7;
  __int128 v8;
  id v9;
  id v10;
  __int128 v11;
  void *v12;
  void *v13;
  __int128 v14;
  id var8;
  void *v16;
  id var9;
  __int128 v18;
  NSNumber *secondaryAxisFillLimit;
  NSNumber *primaryAxisFillLimit;
  UIEdgeInsets *p_var10;
  char v22;
  NSNumber *v23;
  NSNumber *v24;
  __int128 v25;
  __int128 v26;
  _OWORD v27[2];
  _OWORD v28[2];
  id v29;
  id v30;
  float64x2_t v31;
  __int128 v32;
  __int128 v33;
  BOOL v34;
  _OWORD v35[2];
  _OWORD v36[2];
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  BOOL var13;
  __int128 v43;
  __int128 v44;
  _OWORD v45[2];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BOOL8 v50;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView styleProvider](self, "styleProvider"));
  v6 = objc_opt_respondsToSelector(v5, "validateCarCardLayout:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView styleProvider](self, "styleProvider"));
    v8 = *(_OWORD *)&a3->var2;
    v35[0] = *(_OWORD *)&a3->var0;
    v35[1] = v8;
    v36[0] = *(_OWORD *)&a3->var4;
    *(_OWORD *)((char *)v36 + 12) = *(_OWORD *)(&a3->var5 + 1);
    v9 = a3->var8;
    v37 = v9;
    v10 = a3->var9;
    v38 = v10;
    v11 = *(_OWORD *)&a3->var10.bottom;
    v39 = *(_OWORD *)&a3->var10.top;
    v40 = v11;
    v41 = *(_OWORD *)&a3->var11;
    var13 = a3->var13;
    if (v7)
    {
      objc_msgSend(v7, "validateCarCardLayout:", v35);
      v12 = (void *)v46;
    }
    else
    {
      v13 = v10;

      v12 = 0;
      v50 = 0;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      memset(v45, 0, sizeof(v45));
      v43 = 0u;
      v44 = 0u;
    }
    v14 = v44;
    *(_OWORD *)&a3->var0 = v43;
    *(_OWORD *)&a3->var2 = v14;
    *(_OWORD *)&a3->var4 = v45[0];
    *(_OWORD *)(&a3->var5 + 1) = *(_OWORD *)((char *)v45 + 12);
    *(_QWORD *)&v46 = 0;
    var8 = a3->var8;
    a3->var8 = v12;

    v16 = (void *)*((_QWORD *)&v46 + 1);
    *((_QWORD *)&v46 + 1) = 0;
    var9 = a3->var9;
    a3->var9 = v16;

    v18 = v48;
    *(_OWORD *)&a3->var10.top = v47;
    *(_OWORD *)&a3->var10.bottom = v18;
    *(_OWORD *)&a3->var11 = v49;
    a3->var13 = v50;

  }
  primaryAxisFillLimit = self->_layout.primaryAxisFillLimit;
  secondaryAxisFillLimit = self->_layout.secondaryAxisFillLimit;
  p_var10 = &a3->var10;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)&self->_layout.edgePosition, *(int64x2_t *)&a3->var0), (int32x4_t)vceqq_s64(*(int64x2_t *)&self->_layout.primaryAxis, *(int64x2_t *)&a3->var2))), 0xFuLL))) & 1) != 0&& self->_layout.primaryAxisFillMode == a3->var4&& self->_layout.secondaryAxisFillMode == a3->var6&& self->_layout.edgesAffectingMapInsets == a3->var12&& self->_layout.flipForRightHandDrive == a3->var11&& self->_layout.primaryAxisFillModePriority == a3->var5&& self->_layout.secondaryAxisFillModePriority == a3->var7)
  {
    v22 = vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_layout.margins.top, *(float64x2_t *)&p_var10->top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_layout.margins.bottom, *(float64x2_t *)&a3->var10.bottom))), 0xFuLL)));
    v23 = secondaryAxisFillLimit;

    if ((v22 & 1) != 0)
      goto LABEL_17;
  }
  else
  {
    v24 = secondaryAxisFillLimit;

  }
  v25 = *(_OWORD *)&a3->var2;
  v27[0] = *(_OWORD *)&a3->var0;
  v27[1] = v25;
  v28[0] = *(_OWORD *)&a3->var4;
  *(_OWORD *)((char *)v28 + 12) = *(_OWORD *)(&a3->var5 + 1);
  v29 = a3->var8;
  v30 = a3->var9;
  v26 = *(_OWORD *)&a3->var10.bottom;
  v31 = *(float64x2_t *)&p_var10->top;
  v32 = v26;
  v33 = *(_OWORD *)&a3->var11;
  v34 = a3->var13;
  -[CarCardView _setLayout:](self, "_setLayout:", v27);
LABEL_17:

}

- (void)_setLayout:(id *)a3
{
  $BB93BFCD997B2E6D069363521B6038E4 *p_layout;
  unint64_t v6;

  p_layout = &self->_layout;
  -[CarCardView _updateHuggingCompressionPriorities](self, "_updateHuggingCompressionPriorities", sub_10063F028((uint64_t)&self->_layout, (__int128 *)a3).n128_f64[0]);
  v6 = sub_10063E714(p_layout->pinnedEdges);
  if (self->_roundedCorners != v6)
  {
    self->_roundedCorners = v6;
    -[CarCardView _applyCornerMask](self, "_applyCornerMask");
  }

}

- (void)_updateHuggingCompressionPriorities
{
  double v2;
  float v4;
  double v5;

  if (self->_layout.primaryAxis == 1)
    *(float *)&v2 = 751.0;
  else
    *(float *)&v2 = 999.0;
  if (self->_layout.primaryAxis == 1)
    v4 = 999.0;
  else
    v4 = 751.0;
  -[CarCardView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 0, v2);
  *(float *)&v5 = v4;
  -[CarCardView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 1, v5);
}

- (NSArray)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView content](self, "content"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView content](self, "content"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredFocusEnvironments"));

  }
  else
  {
    v5 = &__NSArray0__struct;
  }

  return (NSArray *)v5;
}

- (NSArray)focusOrderSubItems
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if ((-[CarCardView isHidden](self, "isHidden") & 1) != 0)
  {
    v3 = &__NSArray0__struct;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (-[CarCardView canBecomeFocused](self, "canBecomeFocused"))
      objc_msgSend(v4, "addObject:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryButtonView](self, "accessoryButtonView"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryButtonView](self, "accessoryButtonView"));
      objc_msgSend(v4, "addObject:", v6);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView content](self, "content"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "focusOrderSubItems"));
    objc_msgSend(v4, "addObjectsFromArray:", v8);

    v3 = objc_msgSend(v4, "copy");
  }
  return (NSArray *)v3;
}

- (void)setSelectionHandler:(id)a3
{
  id v4;
  id selectionHandler;

  v4 = objc_msgSend(a3, "copy");
  selectionHandler = self->_selectionHandler;
  self->_selectionHandler = v4;

  -[CarCardView _setFocusable:](self, "_setFocusable:", self->_selectionHandler != 0);
}

- (BOOL)canBecomeFocused
{
  void *v3;
  void *v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chromeViewController"));
  if ((objc_msgSend(v4, "isAutohidingContentHiddenForCurrentContext") & 1) != 0 || !self->_focusable)
    LOBYTE(v5) = 0;
  else
    v5 = -[CarCardView isHidden](self, "isHidden") ^ 1;

  return v5;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  CarCardView *v8;
  id v9;

  v9 = a3;
  -[CarCardView _updateFocusRing](self, "_updateFocusRing");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "carCardView:didChangeFocus:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView delegate](self, "delegate"));
    v8 = (CarCardView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextFocusedItem"));
    objc_msgSend(v7, "carCardView:didChangeFocus:", self, v8 == self);

  }
}

- (void)_setFocusable:(BOOL)a3
{
  UILongPressGestureRecognizer *v4;
  UILongPressGestureRecognizer *buttonRecognizer;
  UILongPressGestureRecognizer *v6;
  UILongPressGestureRecognizer *tapRecognizer;

  if (self->_focusable != a3)
  {
    self->_focusable = a3;
    if (a3)
    {
      v4 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "handlePress:");
      buttonRecognizer = self->_buttonRecognizer;
      self->_buttonRecognizer = v4;

      -[UILongPressGestureRecognizer setDelegate:](self->_buttonRecognizer, "setDelegate:", self);
      -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_buttonRecognizer, "setMinimumPressDuration:", 0.0);
      -[UILongPressGestureRecognizer setAllowedPressTypes:](self->_buttonRecognizer, "setAllowedPressTypes:", &off_101273A10);
      -[CarCardView addGestureRecognizer:](self, "addGestureRecognizer:", self->_buttonRecognizer);
      v6 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "handlePress:");
      tapRecognizer = self->_tapRecognizer;
      self->_tapRecognizer = v6;

      -[UILongPressGestureRecognizer setDelegate:](self->_tapRecognizer, "setDelegate:", self);
      -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_tapRecognizer, "setMinimumPressDuration:", 0.0);
      -[UILongPressGestureRecognizer setAllowedTouchTypes:](self->_tapRecognizer, "setAllowedTouchTypes:", &off_101273A28);
      -[CarCardView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapRecognizer);
    }
    else
    {
      -[CarCardView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_buttonRecognizer);
      -[CarCardView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_tapRecognizer);
    }
  }
}

- (void)handlePress:(id)a3
{
  id v4;
  CarCardView *v5;
  uint64_t v6;
  void *v7;
  void (**v8)(_QWORD);
  _QWORD v9[5];

  v4 = a3;
  if (objc_msgSend(v4, "state") == (id)1)
  {
    v5 = self;
    v6 = 1;
LABEL_8:
    -[CarCardView _setHighlighted:](v5, "_setHighlighted:", v6);
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "state") == (id)3)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10063F5FC;
    v9[3] = &unk_1011AC860;
    v9[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, 0.25);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView selectionHandler](self, "selectionHandler"));

    if (v7)
    {
      v8 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(-[CarCardView selectionHandler](self, "selectionHandler"));
      objc_msgSend(v4, "locationInView:", self);
      v8[2](v8);

    }
  }
  else if (objc_msgSend(v4, "state") != (id)2)
  {
    v5 = self;
    v6 = 0;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_setHighlighted:(BOOL)a3
{
  double v3;
  id v4;

  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    if (a3)
      v3 = 0.800000012;
    else
      v3 = 1.0;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CarCardView backgroundView](self, "backgroundView"));
    objc_msgSend(v4, "setAlpha:", v3);

  }
}

- (void)_updateFocusRing
{
  void *v3;
  _BOOL4 focusable;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView window](self, "window"));

  if (v3)
  {
    focusable = self->_focusable;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView focusRingImageView](self, "focusRingImageView"));
    v6 = v5;
    if (focusable)
    {

      if (!v6)
      {
        v7 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        -[CarCardView setFocusRingImageView:](self, "setFocusRingImageView:", v7);

        v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView focusRingImageView](self, "focusRingImageView"));
        objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView focusRingImageView](self, "focusRingImageView"));
        -[CarCardView addSubview:](self, "addSubview:", v9);

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView focusRingImageView](self, "focusRingImageView"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "centerXAnchor"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView centerXAnchor](self, "centerXAnchor"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
        v31[0] = v27;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView focusRingImageView](self, "focusRingImageView"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "centerYAnchor"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView centerYAnchor](self, "centerYAnchor"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
        v31[1] = v23;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView focusRingImageView](self, "focusRingImageView"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "widthAnchor"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView widthAnchor](self, "widthAnchor"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
        v31[2] = v13;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView focusRingImageView](self, "focusRingImageView"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "heightAnchor"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView heightAnchor](self, "heightAnchor"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
        v31[3] = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 4));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView _focusRingImage](self, "_focusRingImage"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView focusRingImageView](self, "focusRingImageView"));
      objc_msgSend(v20, "setImage:", v19);

      v21 = -[CarCardView isFocused](self, "isFocused") ^ 1;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView focusRingImageView](self, "focusRingImageView"));
      objc_msgSend(v22, "setHidden:", v21);

    }
    else
    {
      objc_msgSend(v5, "removeFromSuperview");

      -[CarCardView setFocusRingImageView:](self, "setFocusRingImageView:", 0);
    }
  }
}

- (id)_focusRingImage
{
  UIImage *focusRingImage;
  double v4;
  double v5;
  double v6;
  double v7;
  double x;
  double y;
  double width;
  double height;
  void *v12;
  double v13;
  CGFloat v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  UIImage *ImageFromCurrentImageContext;
  void *v20;
  void *v21;
  UIImage *v22;
  UIImage *v23;
  CGSize v25;
  CGRect v26;
  CGRect v27;

  focusRingImage = self->_focusRingImage;
  if (!focusRingImage)
  {
    v4 = sub_1004B31F0();
    v5 = v4 * ceil(13.757985 / v4);
    v6 = sub_1004B31F0();
    v7 = v6 * ceil(13.757985 / v6);
    v26.origin.x = 0.0;
    v26.origin.y = 0.0;
    v26.size.width = v5 * 2.0 + 1.0;
    v26.size.height = v7 * 2.0 + 1.0;
    v27 = CGRectInset(v26, 3.0, 3.0);
    x = v27.origin.x;
    y = v27.origin.y;
    width = v27.size.width;
    height = v27.size.height;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView traitCollection](self, "traitCollection"));
    objc_msgSend(v12, "displayScale");
    v14 = v13;
    v25.width = v5 * 2.0 + 1.0;
    v25.height = v7 * 2.0 + 1.0;
    UIGraphicsBeginImageContextWithOptions(v25, 0, v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView traitCollection](self, "traitCollection"));
    if (objc_msgSend(v15, "userInterfaceStyle") == (id)1)
      v16 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    else
      v16 = objc_claimAutoreleasedReturnValue(+[UIColor systemTealColor](UIColor, "systemTealColor"));
    v17 = (void *)v16;

    objc_msgSend(v17, "setStroke");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, x, y, width, height, 6.0, 6.0));
    objc_msgSend(v18, "setLineWidth:", 1.5);
    objc_msgSend(v18, "stroke");
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v20 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    UIGraphicsEndImageContext();
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "imageWithRenderingMode:", 1));

    v22 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "resizableImageWithCapInsets:", v7, v5, v7, v5));
    v23 = self->_focusRingImage;
    self->_focusRingImage = v22;

    focusRingImage = self->_focusRingImage;
  }
  return focusRingImage;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v4;
  uint64_t v5;
  char isKindOfClass;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "view", a3));
  v5 = objc_opt_class(UIControl);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  return (isKindOfClass & 1) == 0;
}

- (void)setTitle:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_title != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_title, a3);
    -[CarCardView _refreshAccessories](self, "_refreshAccessories");
    v5 = v6;
  }

}

- (void)setTitleNumberOfLines:(int64_t)a3
{
  if (self->_titleNumberOfLines != a3)
  {
    self->_titleNumberOfLines = a3;
    -[CarCardView _refreshAccessories](self, "_refreshAccessories");
  }
}

- (id)_createAccessoryTitleView
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSAttributedStringKey v18;
  void *v19;

  v3 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:traits:](UIFont, "_mapsCar_fontForTextStyle:traits:", UIFontTextStyleCallout, 32770));
  objc_msgSend(v3, "setFont:", v4);
  LODWORD(v5) = 1132068864;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 0, v5);
  LODWORD(v6) = 1148846080;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 1, v6);
  LODWORD(v7) = 1144750080;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 0, v7);
  LODWORD(v8) = 1144750080;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 1, v8);
  objc_msgSend(v3, "setLineBreakMode:", 4);
  if (-[CarCardView titleNumberOfLines](self, "titleNumberOfLines")
    && -[CarCardView titleNumberOfLines](self, "titleNumberOfLines") <= 3)
  {
    v9 = -[CarCardView titleNumberOfLines](self, "titleNumberOfLines");
  }
  else
  {
    v9 = 3;
  }
  objc_msgSend(v3, "setNumberOfLines:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_msgSend(v3, "setTextColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView title](self, "title"));
  if (v11)
  {
    LODWORD(v12) = 1036831949;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle _maps_paragraphStyleForHandlingExcessiveHeightString:withHyphenationFactor:](NSParagraphStyle, "_maps_paragraphStyleForHandlingExcessiveHeightString:withHyphenationFactor:", v11, v12));
    v14 = objc_alloc((Class)NSAttributedString);
    v18 = NSParagraphStyleAttributeName;
    v19 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    v16 = objc_msgSend(v14, "initWithString:attributes:", v11, v15);

    objc_msgSend(v3, "setAttributedText:", v16);
  }
  else
  {
    objc_msgSend(v3, "setText:", 0);
  }

  return v3;
}

- (void)setAccessory:(unint64_t)a3
{
  if (self->_accessory != a3)
  {
    self->_accessory = a3;
    -[CarCardView _refreshAccessories](self, "_refreshAccessories");
  }
}

- (void)setAccessoryView:(id)a3
{
  UIView *v5;
  UIView *accessoryView;
  UIView *v7;

  v5 = (UIView *)a3;
  accessoryView = self->_accessoryView;
  if (accessoryView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](accessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_accessoryView, a3);
    -[CarCardView _refreshAccessories](self, "_refreshAccessories");
    v5 = v7;
  }

}

- (void)_refreshAccessories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _UNKNOWN **v29;
  char *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSLayoutConstraint *v55;
  NSLayoutConstraint *constraintAccessoryBarPosition;
  CarFocusContainerGuide *v57;
  CarFocusContainerGuide *accessoryFocusContainerGuide;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSLayoutConstraint *v63;
  NSLayoutConstraint *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD v71[4];
  _QWORD v72[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView window](self, "window"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryButtonView](self, "accessoryButtonView"));
    objc_msgSend(v4, "removeFromSuperview");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView _createAccessoryButtonViewForAccessory:](self, "_createAccessoryButtonViewForAccessory:", -[CarCardView accessory](self, "accessory")));
    -[CarCardView setAccessoryButtonView:](self, "setAccessoryButtonView:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView titleView](self, "titleView"));
    objc_msgSend(v6, "removeFromSuperview");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView _createAccessoryTitleView](self, "_createAccessoryTitleView"));
    -[CarCardView setTitleView:](self, "setTitleView:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryView](self, "accessoryView"));
    objc_msgSend(v8, "removeFromSuperview");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView title](self, "title"));
    if (v9)
      v10 = objc_claimAutoreleasedReturnValue(-[CarCardView titleView](self, "titleView"));
    else
      v10 = objc_claimAutoreleasedReturnValue(-[CarCardView accessoryView](self, "accessoryView"));
    v11 = (void *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryButtonView](self, "accessoryButtonView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (v11)
    {
      objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryContainerView](self, "accessoryContainerView"));
      objc_msgSend(v14, "addSubview:", v11);

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryContainerView](self, "accessoryContainerView"));
      v17 = v11;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v18));

      LODWORD(v20) = 1144750080;
      v66 = v19;
      objc_msgSend(v19, "setPriority:", v20);
      objc_msgSend(v13, "addObject:", v19);
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView _topConstraintForAccessoryView:](self, "_topConstraintForAccessoryView:", v17));
      v72[0] = v65;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView _horizontalConstraintForAccessoryView:isLeadingView:](self, "_horizontalConstraintForAccessoryView:isLeadingView:", v17, 1));
      v72[1] = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
      v23 = v13;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryContainerView](self, "accessoryContainerView"));
      v68 = v12;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintLessThanOrEqualToAnchor:", v25));
      v72[2] = v26;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView _bottomConstraintForAccessoryView:](self, "_bottomConstraintForAccessoryView:", v17));
      v72[3] = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v72, 4));
      objc_msgSend(v23, "addObjectsFromArray:", v28);

      v12 = v68;
      v13 = v23;
      v29 = MKPlaceCollectionsLogicController_ptr;

      v11 = v17;
      v30 = "HomeListSectionControllerSubclassing" + 32;

      if (!v68)
      {
LABEL_11:
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryContainerView](self, "accessoryContainerView"));
        objc_msgSend(v50, "addConstraints:", v13);

        -[CarCardView removeConstraint:](self, "removeConstraint:", self->_constraintAccessoryBarPosition);
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryContainerView](self, "accessoryContainerView"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "topAnchor"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView containerView](self, "containerView"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "topAnchor"));
        v55 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v54));
        constraintAccessoryBarPosition = self->_constraintAccessoryBarPosition;
        self->_constraintAccessoryBarPosition = v55;

        -[CarCardView addConstraint:](self, "addConstraint:", self->_constraintAccessoryBarPosition);
        if (!self->_accessoryFocusContainerGuide)
        {
          v57 = (CarFocusContainerGuide *)objc_claimAutoreleasedReturnValue(-[UIView _mapsCar_insertFocusContainerGuide](self->_accessoryContainerView, "_mapsCar_insertFocusContainerGuide"));
          accessoryFocusContainerGuide = self->_accessoryFocusContainerGuide;
          self->_accessoryFocusContainerGuide = v57;

        }
        goto LABEL_14;
      }
    }
    else
    {
      v29 = MKPlaceCollectionsLogicController_ptr;
      v30 = "sing";
      if (!v12)
      {
        -[CarCardView removeConstraint:](self, "removeConstraint:", self->_constraintAccessoryBarPosition);
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryContainerView](self, "accessoryContainerView"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "bottomAnchor"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView containerView](self, "containerView"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "topAnchor"));
        v63 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v62));
        v64 = self->_constraintAccessoryBarPosition;
        self->_constraintAccessoryBarPosition = v63;

        -[CarCardView addConstraint:](self, "addConstraint:", self->_constraintAccessoryBarPosition);
        -[CarCardView removeLayoutGuide:](self, "removeLayoutGuide:", self->_accessoryFocusContainerGuide);
LABEL_14:

        return;
      }
    }
    v70 = v11;
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryContainerView](self, "accessoryContainerView"));
    objc_msgSend(v31, "addSubview:", v12);

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryContainerView](self, "accessoryContainerView"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v34));

    LODWORD(v36) = *((_DWORD *)v30 + 714);
    v69 = v35;
    objc_msgSend(v35, "setPriority:", v36);
    objc_msgSend(v13, "addObject:", v35);
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView _topConstraintForAccessoryView:](self, "_topConstraintForAccessoryView:", v12));
    v71[0] = v67;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryContainerView](self, "accessoryContainerView"));
    v39 = v13;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintGreaterThanOrEqualToAnchor:", v40));
    v71[1] = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView _horizontalConstraintForAccessoryView:isLeadingView:](self, "_horizontalConstraintForAccessoryView:isLeadingView:", v12, 0));
    v71[2] = v42;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView _bottomConstraintForAccessoryView:](self, "_bottomConstraintForAccessoryView:", v12));
    v71[3] = v43;
    v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29[304], "arrayWithObjects:count:", v71, 4));
    v45 = v12;
    v46 = (void *)v44;
    objc_msgSend(v39, "addObjectsFromArray:", v44);

    v12 = v45;
    v13 = v39;

    v11 = v70;
    if (v70)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "leadingAnchor"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "trailingAnchor"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintGreaterThanOrEqualToAnchor:constant:", v48, 10.0));
      objc_msgSend(v39, "addObject:", v49);

    }
    goto LABEL_11;
  }
}

- (id)_topConstraintForAccessoryView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  id v13;
  double v14;
  void *v15;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CarCardView titleView](self, "titleView"));
  if ((id)v5 == v4)
  {

  }
  else
  {
    v6 = (void *)v5;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryButtonView](self, "accessoryButtonView"));

    if (v7 != v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryContainerView](self, "accessoryContainerView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
      LODWORD(v11) = 1144750080;
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:priority:", v10, 0.0, v11));
      goto LABEL_9;
    }
  }
  v13 = (id)objc_claimAutoreleasedReturnValue(-[CarCardView titleView](self, "titleView"));
  if (v13 == v4)
    v14 = 28.0;
  else
    v14 = 29.0;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstBaselineAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryContainerView](self, "accessoryContainerView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, v14));
LABEL_9:
  v15 = (void *)v12;

  return v15;
}

- (id)_bottomConstraintForAccessoryView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  void *v15;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CarCardView titleView](self, "titleView"));
  if ((id)v5 == v4)
  {

  }
  else
  {
    v6 = (void *)v5;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryButtonView](self, "accessoryButtonView"));

    if (v7 != v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryContainerView](self, "accessoryContainerView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
      LODWORD(v11) = 1144750080;
      v12 = 0.0;
      v13 = v8;
      goto LABEL_9;
    }
  }
  v14 = (id)objc_claimAutoreleasedReturnValue(-[CarCardView titleView](self, "titleView"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryContainerView](self, "accessoryContainerView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastBaselineAnchor"));
  if (v14 == v4)
  {
    LODWORD(v11) = 1148829696;
    v12 = 16.0;
  }
  else
  {
    LODWORD(v11) = 1144733696;
    v12 = 15.0;
  }
  v13 = v9;
LABEL_9:
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:priority:", v10, v12, v11));

  return v15;
}

- (id)_horizontalConstraintForAccessoryView:(id)a3 isLeadingView:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryContainerView](self, "accessoryContainerView"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryContainerView](self, "accessoryContainerView"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  }
  v11 = (void *)v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView accessoryButtonView](self, "accessoryButtonView"));
  if (v12 == v7)
    v13 = 8.5;
  else
    v13 = 10.0;

  v14 = -v13;
  if (v4)
    v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v11, v14));

  return v15;
}

- (id)_createAccessoryButtonViewForAccessory:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v4 = -[CarCardView accessory](self, "accessory", a3);
  if (v4 == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusableButton buttonWithType:](CarFocusableButton, "buttonWithType:", 0));
    objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("ChevronButton"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
    objc_msgSend(v5, "setFocusedTintColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemTertiaryColor](UIColor, "_carSystemTertiaryColor"));
    objc_msgSend(v5, "setNonFocusedTintColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageView"));
    objc_msgSend(v8, "setContentMode:", 1);

    LODWORD(v9) = 1148846080;
    objc_msgSend(v5, "setContentHuggingPriority:forAxis:", 0, v9);
    LODWORD(v10) = 1148846080;
    objc_msgSend(v5, "setContentCompressionResistancePriority:forAxis:", 0, v10);
    LODWORD(v11) = 1148846080;
    objc_msgSend(v5, "setContentCompressionResistancePriority:forAxis:", 1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:weight:](UIImage, "_mapsCar_systemImageNamed:textStyle:weight:", CFSTR("chevron.down.circle.fill"), UIFontTextStyleTitle3, 6));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:weight:](UIImage, "_mapsCar_systemImageNamed:textStyle:weight:", CFSTR("chevron.up.circle.fill"), UIFontTextStyleTitle3, 6));
    objc_msgSend(v5, "setImage:forState:", v12, 0);
    objc_msgSend(v5, "setImage:forState:", v12, 8);
    objc_msgSend(v5, "setImage:forState:", v12, 1);
    objc_msgSend(v5, "setImage:forState:", v12, 9);
    objc_msgSend(v5, "setImage:forState:", v13, 4);
    objc_msgSend(v5, "setImage:forState:", v13, 12);
    objc_msgSend(v5, "setImage:forState:", v13, 5);
    objc_msgSend(v5, "setImage:forState:", v13, 13);
    objc_msgSend(v5, "addTarget:action:forControlEvents:", self, "_chevronButtonTapped:", 64);
    objc_msgSend(v5, "setTouchInsets:", -10.0, -10.0, -10.0, -10.0);

  }
  else if (v4 == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusableButton closeButton](CarFocusableButton, "closeButton"));
    objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("CloseButton"));
    objc_msgSend(v5, "addTarget:action:forControlEvents:", self, "_closeButtonTapped:", 64);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_closeButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  uint8_t v9[16];

  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Will close the current context.", v9, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView delegate](self, "delegate"));
  v7 = objc_opt_respondsToSelector(v6, "carCardViewCloseButtonTapped:");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView delegate](self, "delegate"));
    objc_msgSend(v8, "carCardViewCloseButtonTapped:", self);

  }
}

- (void)_chevronButtonTapped:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "setSelected:", objc_msgSend(v7, "isSelected") ^ 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "carCardView:chevronButtonSelected:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView delegate](self, "delegate"));
    objc_msgSend(v6, "carCardView:chevronButtonSelected:", self, v7);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarCardView;
  v4 = a3;
  -[CarCardView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[CarCardView _updateInterfaceStyleRelatedViews](self, "_updateInterfaceStyleRelatedViews");
}

- (void)_updateInterfaceStyleRelatedViews
{
  UIImage *focusRingImage;
  void *v4;

  focusRingImage = self->_focusRingImage;
  self->_focusRingImage = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView focusRingImageView](self, "focusRingImageView"));
  objc_msgSend(v4, "removeFromSuperview");

  -[CarCardView setFocusRingImageView:](self, "setFocusRingImageView:", 0);
  -[CarCardView _updateFocusRing](self, "_updateFocusRing");
  -[CarCardView _mapsCar_updateShadow](self, "_mapsCar_updateShadow");
  -[CarCardView _refreshBackgroundView](self, "_refreshBackgroundView");
}

- (void)setStyleProvider:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_styleProvider);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_styleProvider, obj);
    -[CarCardView _applyCornerMask](self, "_applyCornerMask");
    -[CarCardView _refreshBackgroundView](self, "_refreshBackgroundView");
    -[CarCardView _updateTransitioning](self, "_updateTransitioning");
    v5 = obj;
  }

}

- (id)_styleProviderOrSelf
{
  void *WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_styleProvider);
  v4 = WeakRetained;
  if (!WeakRetained)
    WeakRetained = self;
  v5 = WeakRetained;

  return v5;
}

- (void)_refreshBackgroundView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  _BYTE v11[64];
  id v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView window](self, "window"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView _styleProviderOrSelf](self, "_styleProviderOrSelf"));
    -[CarCardView layout](self, "layout");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView traitCollection](self, "traitCollection"));
    objc_msgSend(v5, "displayScale");
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView traitCollection](self, "traitCollection"));
    v9 = objc_msgSend(v8, "userInterfaceStyle");
    if (v4)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundViewForCarCardLayout:scale:userInterfaceStyle:", v11, v9, v7));
    }
    else
    {

      v10 = 0;
    }
    -[CarCardView setBackgroundView:](self, "setBackgroundView:", v10);

  }
}

- (void)setBackgroundView:(id)a3
{
  UIView *v5;
  UIView **p_backgroundView;
  UIView *backgroundView;
  void *v8;
  UIView *v9;
  void *v10;
  void *v11;
  UIView *v12;

  v5 = (UIView *)a3;
  p_backgroundView = &self->_backgroundView;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    v12 = v5;
    -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundView, a3);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView maskingView](self, "maskingView"));
    objc_msgSend(v8, "insertSubview:atIndex:", *p_backgroundView, 0);

    v9 = *p_backgroundView;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView maskingView](self, "maskingView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _maps_constraintsForCenteringInView:](v9, "_maps_constraintsForCenteringInView:", v10));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);

    v5 = v12;
  }

}

- (void)_applyCornerMask
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BYTE v20[64];
  id v21;
  id v22;
  _BYTE v23[64];
  id v24;
  id v25;
  uint64_t v26;
  double v27;
  void *v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView window](self, "window"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView styleProvider](self, "styleProvider"));
    v5 = objc_opt_respondsToSelector(v4, "cornerMaskForCarCardLayout:");

    if ((v5 & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView _styleProviderOrSelf](self, "_styleProviderOrSelf"));
      -[CarCardView layout](self, "layout");
      if (v6)
      {
        objc_msgSend(v6, "cornerMaskForCarCardLayout:", v23);
        v7 = v26;
        v8 = v27;
        v9 = v28;
      }
      else
      {

        v9 = 0;
        v7 = 0;
        v8 = 0.0;
      }

    }
    else
    {
      -[CarCardView layout](self, "layout");
      if (self)
      {
        -[CarCardView cornerMaskForCarCardLayout:](self, "cornerMaskForCarCardLayout:", v20);
        v7 = v26;
        v8 = v27;
        v9 = v28;
      }
      else
      {

        v9 = 0;
        v7 = 0;
        v8 = 0.0;
      }
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView maskingView](self, "maskingView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
    objc_msgSend(v11, "setCornerRadius:", v8);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView maskingView](self, "maskingView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
    objc_msgSend(v13, "setCornerCurve:", v9);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView maskingView](self, "maskingView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layer"));
    objc_msgSend(v15, "setMaskedCorners:", v7);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView maskingView](self, "maskingView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layer"));
    objc_msgSend(v17, "setMasksToBounds:", 1);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView maskingView](self, "maskingView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));
    objc_msgSend(v19, "setShadowPathIsBounds:", 1);

  }
}

- (id)backgroundViewForCarCardLayout:(id *)a3 scale:(double)a4 userInterfaceStyle:(int64_t)a5
{
  CarDynamicBlurView *v6;

  v6 = self->_dynamicBlurView;

  return v6;
}

- ($3A137947DC24AF6DB667847AA8BD3130)cornerMaskForCarCardLayout:(SEL)a3
{
  $3A137947DC24AF6DB667847AA8BD3130 *result;

  retstr->var0 = 0;
  retstr->var1 = 0.0;
  retstr->var2 = 0;
  retstr->var0 = -[CarCardView roundedCorners](self, "roundedCorners") & 0xF;
  retstr->var1 = 9.0;
  retstr->var2 = kCACornerCurveContinuous;

  return result;
}

- (void)setTransitioning:(BOOL)a3
{
  if (self->_transitioning != a3)
  {
    self->_transitioning = a3;
    -[CarCardView _updateTransitioning](self, "_updateTransitioning");
  }
}

- (void)_updateTransitioning
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  _BOOL4 transitioning;
  double v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView styleProvider](self, "styleProvider"));

  if (!v3)
  {
    transitioning = self->_transitioning;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[CarCardView containerView](self, "containerView"));
    if (transitioning)
      v8 = 0.0;
    else
      v8 = 1.0;
    objc_msgSend(v9, "setAlpha:", v8);
    goto LABEL_9;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView containerView](self, "containerView"));
  objc_msgSend(v4, "setAlpha:", 1.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView styleProvider](self, "styleProvider"));
  v6 = objc_opt_respondsToSelector(v5, "setTransitioning:");

  if ((v6 & 1) != 0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[CarCardView styleProvider](self, "styleProvider"));
    objc_msgSend(v9, "setTransitioning:", -[CarCardView isTransitioning](self, "isTransitioning"));
LABEL_9:

  }
}

- (BOOL)accessibilityPerformEscape
{
  -[CarCardView _closeButtonTapped:](self, "_closeButtonTapped:", 0);
  return 1;
}

- (CarCardContent)content
{
  return self->_content;
}

- ($B1874A4E4729613F071A632570863A63)layout
{
  $BB93BFCD997B2E6D069363521B6038E4 *p_layout;
  __int128 v5;
  $B1874A4E4729613F071A632570863A63 *result;
  __int128 v7;

  p_layout = &self->_layout;
  v5 = *(_OWORD *)&self->_layout.primaryAxis;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_layout.edgePosition;
  *(_OWORD *)&retstr->var2 = v5;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->_layout.primaryAxisFillMode;
  *(_OWORD *)(&retstr->var5 + 1) = *(_OWORD *)(&self->_layout.primaryAxisFillModePriority + 1);
  retstr->var8 = self->_layout.primaryAxisFillLimit;
  result = p_layout->secondaryAxisFillLimit;
  retstr->var9 = result;
  v7 = *(_OWORD *)&p_layout->margins.bottom;
  *(_OWORD *)&retstr->var10.top = *(_OWORD *)&p_layout->margins.top;
  *(_OWORD *)&retstr->var10.bottom = v7;
  *(_OWORD *)&retstr->var11 = *(_OWORD *)&p_layout->flipForRightHandDrive;
  retstr->var13 = p_layout->horizontallyCenterMapInsets;
  return result;
}

- (BOOL)staysOnTop
{
  return self->_staysOnTop;
}

- (void)setStaysOnTop:(BOOL)a3
{
  self->_staysOnTop = a3;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)titleNumberOfLines
{
  return self->_titleNumberOfLines;
}

- (unint64_t)accessory
{
  return self->_accessory;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (CarCardStyleProviding)styleProvider
{
  return (CarCardStyleProviding *)objc_loadWeakRetained((id *)&self->_styleProvider);
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (CarCardViewDelegate)delegate
{
  return (CarCardViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)collisionLayoutGuides
{
  return self->_collisionLayoutGuides;
}

- (void)setCollisionLayoutGuides:(id)a3
{
  objc_storeStrong((id *)&self->_collisionLayoutGuides, a3);
}

- (UILayoutGuide)contentLayoutGuide
{
  return self->_contentLayoutGuide;
}

- (void)setContentLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_contentLayoutGuide, a3);
}

- (UIView)accessoryContainerView
{
  return self->_accessoryContainerView;
}

- (void)setAccessoryContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryContainerView, a3);
}

- (UIView)maskingView
{
  return self->_maskingView;
}

- (void)setMaskingView:(id)a3
{
  objc_storeStrong((id *)&self->_maskingView, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIImageView)focusRingImageView
{
  return self->_focusRingImageView;
}

- (void)setFocusRingImageView:(id)a3
{
  objc_storeStrong((id *)&self->_focusRingImageView, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UILabel)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (UIView)accessoryButtonView
{
  return self->_accessoryButtonView;
}

- (void)setAccessoryButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryButtonView, a3);
}

- (unint64_t)roundedCorners
{
  return self->_roundedCorners;
}

- (void)setRoundedCorners:(unint64_t)a3
{
  self->_roundedCorners = a3;
}

- (void).cxx_destruct
{
  $BB93BFCD997B2E6D069363521B6038E4 *p_layout;

  p_layout = &self->_layout;

  objc_storeStrong((id *)&self->_accessoryButtonView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_focusRingImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_maskingView, 0);
  objc_storeStrong((id *)&self->_accessoryContainerView, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_collisionLayoutGuides, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_styleProvider);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_dynamicBlurView, 0);
  objc_storeStrong((id *)&self->_accessoryFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->_constraintAccessoryBarPosition, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_buttonRecognizer, 0);
  objc_storeStrong((id *)&self->_focusRingImage, 0);
}

@end

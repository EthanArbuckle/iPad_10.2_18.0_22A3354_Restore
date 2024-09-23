@implementation _TVTumblerView

- (_TVTumblerView)initWithFrame:(CGRect)a3
{
  _TVTumblerView *v3;
  id v4;
  uint64_t v5;
  UIView *containerView;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  UITapGestureRecognizer *leftTapGesture;
  uint64_t v12;
  UITapGestureRecognizer *rightTapGesture;
  uint64_t v14;
  UISwipeGestureRecognizer *leftSwipeGesture;
  uint64_t v16;
  UISwipeGestureRecognizer *rightSwipeGesture;
  uint64_t v18;
  NSMutableDictionary *itemViewsByIndex;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  UIImageView *arrowLeft;
  UIImageView *v29;
  id v30;
  void *v31;
  uint64_t v32;
  UIImageView *arrowRight;
  CGAffineTransform v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)_TVTumblerView;
  v3 = -[_TVTumblerView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6F90]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    containerView = v3->_containerView;
    v3->_containerView = (UIView *)v5;

    -[UIView setClipsToBounds:](v3->_containerView, "setClipsToBounds:", 1);
    -[_TVTumblerView addSubview:](v3, "addSubview:", v3->_containerView);
    v7 = -[_TVTumblerView effectiveUserInterfaceLayoutDirection](v3, "effectiveUserInterfaceLayoutDirection");
    if (v7 == 1)
      v8 = sel__rightAction_;
    else
      v8 = sel__leftAction_;
    if (v7 == 1)
      v9 = sel__leftAction_;
    else
      v9 = sel__rightAction_;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v3, v8);
    leftTapGesture = v3->_leftTapGesture;
    v3->_leftTapGesture = (UITapGestureRecognizer *)v10;

    -[UITapGestureRecognizer setAllowedPressTypes:](v3->_leftTapGesture, "setAllowedPressTypes:", &unk_24EBCD400);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v3, v9);
    rightTapGesture = v3->_rightTapGesture;
    v3->_rightTapGesture = (UITapGestureRecognizer *)v12;

    -[UITapGestureRecognizer setAllowedPressTypes:](v3->_rightTapGesture, "setAllowedPressTypes:", &unk_24EBCD418);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E18]), "initWithTarget:action:", v3, v8);
    leftSwipeGesture = v3->_leftSwipeGesture;
    v3->_leftSwipeGesture = (UISwipeGestureRecognizer *)v14;

    -[UISwipeGestureRecognizer setDirection:](v3->_leftSwipeGesture, "setDirection:", 2);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E18]), "initWithTarget:action:", v3, v9);
    rightSwipeGesture = v3->_rightSwipeGesture;
    v3->_rightSwipeGesture = (UISwipeGestureRecognizer *)v16;

    -[UISwipeGestureRecognizer setDirection:](v3->_rightSwipeGesture, "setDirection:", 1);
    v3->_unfocusedItemIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    itemViewsByIndex = v3->_itemViewsByIndex;
    v3->_itemViewsByIndex = (NSMutableDictionary *)v18;

    *((_BYTE *)&v3->_delegateFlags + 1) = 1;
    v20 = (void *)MEMORY[0x24BDF6AC8];
    +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "imageNamed:inBundle:", CFSTR("tumbler-chevron"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[_TVTumblerView traitCollection](v3, "traitCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "userInterfaceStyle") == 2)
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_alloc(MEMORY[0x24BDF6AE8]);
    objc_msgSend(v22, "imageWithRenderingMode:", 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "initWithImage:", v26);
    arrowLeft = v3->_arrowLeft;
    v3->_arrowLeft = (UIImageView *)v27;

    v29 = v3->_arrowLeft;
    CGAffineTransformMakeRotation(&v35, 3.14159265);
    -[UIImageView setTransform:](v29, "setTransform:", &v35);
    -[UIImageView setTintColor:](v3->_arrowLeft, "setTintColor:", v24);
    -[_TVTumblerView addSubview:](v3, "addSubview:", v3->_arrowLeft);
    v30 = objc_alloc(MEMORY[0x24BDF6AE8]);
    objc_msgSend(v22, "imageWithRenderingMode:", 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "initWithImage:", v31);
    arrowRight = v3->_arrowRight;
    v3->_arrowRight = (UIImageView *)v32;

    -[UIImageView setTintColor:](v3->_arrowRight, "setTintColor:", v24);
    -[_TVTumblerView addSubview:](v3, "addSubview:", v3->_arrowRight);

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__enableMove, 0);
  v3.receiver = self;
  v3.super_class = (Class)_TVTumblerView;
  -[_TVTumblerView dealloc](&v3, sel_dealloc);
}

- (UIImageView)arrowLeading
{
  uint64_t v3;
  int *v4;

  v3 = -[_TVTumblerView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v4 = &OBJC_IVAR____TVTumblerView__arrowLeft;
  if (v3 == 1)
    v4 = &OBJC_IVAR____TVTumblerView__arrowRight;
  return (UIImageView *)*(id *)((char *)&self->super.super.super.isa + *v4);
}

- (UIImageView)arrowTrailing
{
  uint64_t v3;
  int *v4;

  v3 = -[_TVTumblerView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v4 = &OBJC_IVAR____TVTumblerView__arrowRight;
  if (v3 == 1)
    v4 = &OBJC_IVAR____TVTumblerView__arrowLeft;
  return (UIImageView *)*(id *)((char *)&self->super.super.super.isa + *v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[_TVTumblerView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "userInterfaceStyle"))
  {
LABEL_7:

    goto LABEL_8;
  }
  v6 = objc_msgSend(v4, "userInterfaceStyle");
  -[_TVTumblerView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceStyle");

  if (v6 != v8)
  {
    -[_TVTumblerView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "userInterfaceStyle") == 2)
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIImageView setTintColor:](self->_arrowLeft, "setTintColor:", v5);
    -[UIImageView setTintColor:](self->_arrowRight, "setTintColor:", v5);
    goto LABEL_7;
  }
LABEL_8:
  v10.receiver = self;
  v10.super_class = (Class)_TVTumblerView;
  -[_TVTumblerView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);

}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  uint64_t v5;
  char *v6;
  char *v7;
  objc_super v8;

  if (-[_TVTumblerView semanticContentAttribute](self, "semanticContentAttribute") != a3)
  {
    -[UITapGestureRecognizer removeTarget:action:](self->_leftTapGesture, "removeTarget:action:", self, 0);
    -[UITapGestureRecognizer removeTarget:action:](self->_rightTapGesture, "removeTarget:action:", self, 0);
    -[UISwipeGestureRecognizer removeTarget:action:](self->_leftSwipeGesture, "removeTarget:action:", self, 0);
    -[UISwipeGestureRecognizer removeTarget:action:](self->_rightSwipeGesture, "removeTarget:action:", self, 0);
    v5 = objc_msgSend(MEMORY[0x24BDF6F90], "userInterfaceLayoutDirectionForSemanticContentAttribute:", a3);
    if (v5 == 1)
      v6 = sel__rightAction_;
    else
      v6 = sel__leftAction_;
    if (v5 == 1)
      v7 = sel__leftAction_;
    else
      v7 = sel__rightAction_;
    -[UITapGestureRecognizer addTarget:action:](self->_leftTapGesture, "addTarget:action:", self, v6);
    -[UITapGestureRecognizer addTarget:action:](self->_rightTapGesture, "addTarget:action:", self, v7);
    -[UISwipeGestureRecognizer addTarget:action:](self->_leftSwipeGesture, "addTarget:action:", self, v6);
    -[UISwipeGestureRecognizer addTarget:action:](self->_rightSwipeGesture, "addTarget:action:", self, v7);
  }
  v8.receiver = self;
  v8.super_class = (Class)_TVTumblerView;
  -[_TVTumblerView setSemanticContentAttribute:](&v8, sel_setSemanticContentAttribute_, a3);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
  -[_TVTumblerView reloadData](self, "reloadData");
}

- (void)setDelegate:(id)a3
{
  _TVTumblerViewDelegate **p_delegate;
  id v5;
  id v6;

  p_delegate = &self->_delegate;
  v6 = a3;
  v5 = objc_storeWeak((id *)p_delegate, v6);
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | p_delegate & 1;
}

- (void)setGestureTargetView:(id)a3
{
  UIView **p_gestureTargetView;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id obj;

  p_gestureTargetView = &self->_gestureTargetView;
  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_gestureTargetView);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_gestureTargetView);
    -[_TVTumblerView leftTapGesture](self, "leftTapGesture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeGestureRecognizer:", v7);

    v8 = objc_loadWeakRetained((id *)p_gestureTargetView);
    -[_TVTumblerView rightTapGesture](self, "rightTapGesture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeGestureRecognizer:", v9);

    v10 = objc_loadWeakRetained((id *)p_gestureTargetView);
    -[_TVTumblerView leftSwipeGesture](self, "leftSwipeGesture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeGestureRecognizer:", v11);

    v12 = objc_loadWeakRetained((id *)p_gestureTargetView);
    -[_TVTumblerView rightSwipeGesture](self, "rightSwipeGesture");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeGestureRecognizer:", v13);

  }
  v14 = objc_storeWeak((id *)p_gestureTargetView, obj);
  -[_TVTumblerView leftTapGesture](self, "leftTapGesture");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "addGestureRecognizer:", v15);

  v16 = objc_loadWeakRetained((id *)p_gestureTargetView);
  -[_TVTumblerView rightTapGesture](self, "rightTapGesture");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addGestureRecognizer:", v17);

  v18 = objc_loadWeakRetained((id *)p_gestureTargetView);
  -[_TVTumblerView leftSwipeGesture](self, "leftSwipeGesture");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addGestureRecognizer:", v19);

  v20 = objc_loadWeakRetained((id *)p_gestureTargetView);
  -[_TVTumblerView rightSwipeGesture](self, "rightSwipeGesture");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addGestureRecognizer:", v21);

}

- (void)setFocusedItemIndex:(int64_t)a3
{
  if (self->_focusedItemIndex != a3)
  {
    self->_focusedItemIndex = a3;
    -[_TVTumblerView setUnfocusedItemIndex:](self, "setUnfocusedItemIndex:", 0x7FFFFFFFFFFFFFFFLL);
    -[_TVTumblerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIView)focusedItemView
{
  int64_t v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = -[_TVTumblerView focusedItemIndex](self, "focusedItemIndex");
  if (v3 < 0
    || (v4 = v3,
        -[_TVTumblerView dataSource](self, "dataSource"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "numberOfItemsInTumblerView:", self),
        v5,
        v4 >= v6))
  {
    v9 = 0;
  }
  else
  {
    -[_TVTumblerView itemViewsByIndex](self, "itemViewsByIndex");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (UIView *)v9;
}

- (void)registerItemViewClass:(Class)a3
{
  objc_storeStrong((id *)&self->_itemViewClass, a3);
  -[_TVTumblerView reloadData](self, "reloadData");
}

- (id)dequeueReusableItemView
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
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  -[_TVTumblerView spareItemView](self, "spareItemView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[UIView tv_padding](self, "tv_padding");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[_TVTumblerView bounds](self, "bounds");
    v16 = (void *)objc_msgSend(objc_alloc(-[_TVTumblerView itemViewClass](self, "itemViewClass")), "initWithFrame:", v7 + v12, v5 + v13, v14 - (v7 + v11), v15 - (v5 + v9));
    -[_TVTumblerView setSpareItemView:](self, "setSpareItemView:", v16);

  }
  return -[_TVTumblerView spareItemView](self, "spareItemView");
}

- (void)reloadData
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  -[_TVTumblerView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItemsInTumblerView:", self);

  if (-[_TVTumblerView focusedItemIndex](self, "focusedItemIndex") >= v4)
  {
    if (v4 <= 1)
      v5 = 1;
    else
      v5 = v4;
    -[_TVTumblerView setFocusedItemIndex:](self, "setFocusedItemIndex:", v5 - 1);
  }
  -[_TVTumblerView focusedItemView](self, "focusedItemView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[_TVTumblerView _markItemViewForReuse:](self, "_markItemViewForReuse:", v6);
  -[_TVTumblerView setReferredFocusedItemView:](self, "setReferredFocusedItemView:", 0);
  -[_TVTumblerView setUnfocusedItemIndex:](self, "setUnfocusedItemIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[_TVTumblerView setNeedsLayout](self, "setNeedsLayout");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  -[_TVTumblerView bounds](self, "bounds", a3.width, a3.height);
  v6 = fmax(width, v5);
  -[_TVTumblerView bounds](self, "bounds");
  v8 = v7;
  v9 = v6;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
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
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  void *v26;
  CGFloat v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  double v39;
  void *v40;
  double v41;
  int64_t v42;
  void *v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  CGFloat v58;
  CGFloat v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[5];
  id v65;
  int64_t v66;
  _QWORD v67[4];
  id v68;
  id v69;
  _TVTumblerView *v70;
  double v71;
  uint64_t v72;
  double v73;
  double v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  double v78;
  uint64_t v79;
  _BYTE v80[128];
  uint64_t v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  v81 = *MEMORY[0x24BDAC8D0];
  -[_TVTumblerView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItemsInTumblerView:", self);

  if ((-[_TVTumblerView focusedItemIndex](self, "focusedItemIndex") & 0x8000000000000000) == 0
    && -[_TVTumblerView focusedItemIndex](self, "focusedItemIndex") < v4)
  {
    -[_TVTumblerView bounds](self, "bounds");
    v6 = v5;
    v58 = v7;
    v59 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[_TVTumblerView arrowLeft](self, "arrowLeft");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    v15 = v14;
    v17 = v16;

    -[UIView tv_padding](self, "tv_padding");
    if (v19 < v15 + 56.0)
      v19 = v15 + 56.0;
    if (v21 < v15 + 56.0)
      v21 = v15 + 56.0;
    v22 = v6 + v19;
    v23 = v8 + v18;
    v24 = v10 - (v19 + v21);
    v25 = v12 - (v18 + v20);
    -[_TVTumblerView containerView](self, "containerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:", v22, v23, v24, v25);

    v82.origin.x = v22;
    v82.origin.y = v23;
    v56 = v25;
    v57 = v24;
    v82.size.width = v24;
    v82.size.height = v25;
    v27 = CGRectGetMidY(v82) + v17 * -0.5;
    -[_TVTumblerView arrowLeft](self, "arrowLeft");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v83.origin.x = v59;
    v83.origin.y = v58;
    v83.size.width = v10;
    v83.size.height = v12;
    objc_msgSend(v28, "setFrame:", CGRectGetMinX(v83) + 28.0, v27, v15, v17);

    -[_TVTumblerView arrowRight](self, "arrowRight");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v84.origin.x = v59;
    v84.origin.y = v58;
    v84.size.width = v10;
    v84.size.height = v12;
    objc_msgSend(v29, "setFrame:", CGRectGetMaxX(v84) - (v15 + 28.0), v27, v15, v17);

    -[_TVTumblerView _itemViewAtIndex:](self, "_itemViewAtIndex:", -[_TVTumblerView focusedItemIndex](self, "focusedItemIndex"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVTumblerView focusedItemView](self, "focusedItemView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30 != v31)
    {
      if (-[_TVTumblerView unfocusedItemIndex](self, "unfocusedItemIndex") == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v30, "setFrame:", 0.0, 0.0, v24, v25);
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        -[_TVTumblerView itemViewsByIndex](self, "itemViewsByIndex");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "allValues");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v60, v80, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v61;
          do
          {
            for (i = 0; i != v35; ++i)
            {
              if (*(_QWORD *)v61 != v36)
                objc_enumerationMutation(v33);
              if (*(void **)(*((_QWORD *)&v60 + 1) + 8 * i) != v30)
                -[_TVTumblerView _markItemViewForReuse:](self, "_markItemViewForReuse:");
            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v60, v80, 16);
          }
          while (v35);
        }

        -[_TVTumblerView arrowLeading](self, "arrowLeading");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[_TVTumblerView focusedItemIndex](self, "focusedItemIndex") <= 0)
          v39 = 0.0;
        else
          v39 = 1.0;
        objc_msgSend(v38, "setAlpha:", v39, *(_QWORD *)&v25);

        -[_TVTumblerView arrowTrailing](self, "arrowTrailing");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[_TVTumblerView focusedItemIndex](self, "focusedItemIndex") >= v4 - 1)
          v41 = 0.0;
        else
          v41 = 1.0;
        objc_msgSend(v40, "setAlpha:", v41);

        -[_TVTumblerView _enableMove](self, "_enableMove");
      }
      else
      {
        v42 = -[_TVTumblerView unfocusedItemIndex](self, "unfocusedItemIndex");
        -[_TVTumblerView _itemViewAtIndex:](self, "_itemViewAtIndex:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[_TVTumblerView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
          v44 = -1;
        else
          v44 = 1;
        v45 = (double)v44;
        if (v42 >= -[_TVTumblerView focusedItemIndex](self, "focusedItemIndex", *(_QWORD *)&v25))
          v46 = (double)v44;
        else
          v46 = -(double)v44;
        -[_TVTumblerView interitemSpacing](self, "interitemSpacing");
        v48 = v46 * (v57 + v47) + 0.0;
        if (v42 >= -[_TVTumblerView focusedItemIndex](self, "focusedItemIndex"))
          v45 = -(double)v44;
        -[_TVTumblerView interitemSpacing](self, "interitemSpacing");
        objc_msgSend(v30, "setFrame:", v45 * (v57 + v49) + 0.0, 0.0, v57, v56);
        v50 = (void *)MEMORY[0x24BDF6F90];
        v51 = MEMORY[0x24BDAC760];
        v67[0] = MEMORY[0x24BDAC760];
        v67[1] = 3221225472;
        v67[2] = __32___TVTumblerView_layoutSubviews__block_invoke;
        v67[3] = &unk_24EB85C70;
        v68 = v43;
        v71 = v48;
        v72 = 0;
        v73 = v57;
        v74 = v56;
        v75 = 0;
        v76 = 0;
        v77 = v57;
        v78 = v56;
        v69 = v30;
        v70 = self;
        v79 = v4;
        v64[0] = v51;
        v64[1] = 3221225472;
        v64[2] = __32___TVTumblerView_layoutSubviews__block_invoke_2;
        v64[3] = &unk_24EB85C98;
        v65 = v68;
        v66 = v42;
        v64[4] = self;
        v52 = v68;
        objc_msgSend(v50, "animateWithDuration:animations:completion:", v67, v64, 0.3);

      }
      -[_TVTumblerView setReferredFocusedItemView:](self, "setReferredFocusedItemView:", v30);
      -[_TVTumblerView containerView](self, "containerView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "addSubview:", v30);

      -[_TVTumblerView _markItemViewForInUse:forIndex:](self, "_markItemViewForInUse:forIndex:", v30, -[_TVTumblerView focusedItemIndex](self, "focusedItemIndex"));
      if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
      {
        -[_TVTumblerView delegate](self, "delegate");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "tumblerView:didFocusItemAtIndex:", self, -[_TVTumblerView focusedItemIndex](self, "focusedItemIndex"));

      }
    }
    -[_TVTumblerView gestureTargetView](self, "gestureTargetView", *(_QWORD *)&v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v55)
      -[_TVTumblerView setGestureTargetView:](self, "setGestureTargetView:", self);

  }
}

- (void)_leftAction:(id)a3
{
  int64_t v4;
  int64_t v5;

  v4 = -[_TVTumblerView focusedItemIndex](self, "focusedItemIndex", a3);
  v5 = -[_TVTumblerView unfocusedItemIndex](self, "unfocusedItemIndex");
  if ((v5 >= v4 || v5 == 0x7FFFFFFFFFFFFFFFLL) && v4 >= 1)
    -[_TVTumblerView _scheduleMoveToIndex:](self, "_scheduleMoveToIndex:", v4 - 1);
}

- (void)_rightAction:(id)a3
{
  int64_t v4;
  int64_t v5;
  void *v6;
  uint64_t v7;

  v4 = -[_TVTumblerView focusedItemIndex](self, "focusedItemIndex", a3);
  v5 = -[_TVTumblerView unfocusedItemIndex](self, "unfocusedItemIndex");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || v5 <= v4)
  {
    -[_TVTumblerView dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "numberOfItemsInTumblerView:", self) - 1;

    if (v4 < v7)
      -[_TVTumblerView _scheduleMoveToIndex:](self, "_scheduleMoveToIndex:", v4 + 1);
  }
}

- (void)_scheduleMoveToIndex:(int64_t)a3
{
  int64_t v5;

  if (-[_TVTumblerView canMove](self, "canMove"))
  {
    v5 = -[_TVTumblerView focusedItemIndex](self, "focusedItemIndex");
    -[_TVTumblerView setFocusedItemIndex:](self, "setFocusedItemIndex:", a3);
    -[_TVTumblerView setUnfocusedItemIndex:](self, "setUnfocusedItemIndex:", v5);
    -[_TVTumblerView _disableMove](self, "_disableMove");
  }
}

- (void)_enableMove
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__enableMove, 0);
  *((_BYTE *)&self->_delegateFlags + 1) = 1;
}

- (void)_disableMove
{
  *((_BYTE *)&self->_delegateFlags + 1) = 0;
}

- (id)_itemViewAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[_TVTumblerView itemViewsByIndex](self, "itemViewsByIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[_TVTumblerView dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tumblerView:viewForItemAtIndex:", self, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)_markItemViewForInUse:(id)a3 forIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_TVTumblerView spareItemView](self, "spareItemView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v9)
    -[_TVTumblerView setSpareItemView:](self, "setSpareItemView:", 0);
  -[_TVTumblerView itemViewsByIndex](self, "itemViewsByIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v9, v8);

  objc_msgSend(v9, "setHidden:", 0);
}

- (void)_markItemViewForReuse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t, _BYTE *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  -[_TVTumblerView spareItemView](self, "spareItemView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_TVTumblerView spareItemView](self, "spareItemView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  -[_TVTumblerView itemViewsByIndex](self, "itemViewsByIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __40___TVTumblerView__markItemViewForReuse___block_invoke;
  v13 = &unk_24EB85CC0;
  v8 = v4;
  v14 = v8;
  v15 = &v16;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v10);

  -[_TVTumblerView itemViewsByIndex](self, "itemViewsByIndex", v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", v17[5]);

  objc_msgSend(v8, "setHidden:", 1);
  _Block_object_dispose(&v16, 8);

}

- (_TVTumblerViewDataSource)dataSource
{
  return (_TVTumblerViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (_TVTumblerViewDelegate)delegate
{
  return (_TVTumblerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIView)gestureTargetView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_gestureTargetView);
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (int64_t)focusedItemIndex
{
  return self->_focusedItemIndex;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (Class)itemViewClass
{
  return self->_itemViewClass;
}

- (void)setItemViewClass:(Class)a3
{
  objc_storeStrong((id *)&self->_itemViewClass, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UIView)referredFocusedItemView
{
  return self->_referredFocusedItemView;
}

- (void)setReferredFocusedItemView:(id)a3
{
  objc_storeStrong((id *)&self->_referredFocusedItemView, a3);
}

- (UIImageView)arrowLeft
{
  return self->_arrowLeft;
}

- (UIImageView)arrowRight
{
  return self->_arrowRight;
}

- (UIView)spareItemView
{
  return self->_spareItemView;
}

- (void)setSpareItemView:(id)a3
{
  objc_storeStrong((id *)&self->_spareItemView, a3);
}

- (NSMutableDictionary)itemViewsByIndex
{
  return self->_itemViewsByIndex;
}

- (int64_t)unfocusedItemIndex
{
  return self->_unfocusedItemIndex;
}

- (void)setUnfocusedItemIndex:(int64_t)a3
{
  self->_unfocusedItemIndex = a3;
}

- (BOOL)canMove
{
  return *((_BYTE *)&self->_delegateFlags + 1);
}

- (UITapGestureRecognizer)leftTapGesture
{
  return self->_leftTapGesture;
}

- (UITapGestureRecognizer)rightTapGesture
{
  return self->_rightTapGesture;
}

- (UISwipeGestureRecognizer)leftSwipeGesture
{
  return self->_leftSwipeGesture;
}

- (UISwipeGestureRecognizer)rightSwipeGesture
{
  return self->_rightSwipeGesture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightSwipeGesture, 0);
  objc_storeStrong((id *)&self->_leftSwipeGesture, 0);
  objc_storeStrong((id *)&self->_rightTapGesture, 0);
  objc_storeStrong((id *)&self->_leftTapGesture, 0);
  objc_storeStrong((id *)&self->_itemViewsByIndex, 0);
  objc_storeStrong((id *)&self->_spareItemView, 0);
  objc_storeStrong((id *)&self->_arrowRight, 0);
  objc_storeStrong((id *)&self->_arrowLeft, 0);
  objc_storeStrong((id *)&self->_referredFocusedItemView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_itemViewClass, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_gestureTargetView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end

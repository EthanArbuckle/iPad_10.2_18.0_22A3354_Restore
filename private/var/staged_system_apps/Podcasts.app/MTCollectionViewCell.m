@implementation MTCollectionViewCell

+ (double)estimatedHeight
{
  return 100.0;
}

+ (double)maximumContentWidth
{
  return 1.79769313e308;
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class(UIScrollView, a2);
}

+ (id)_multiSelectCheckmarkImage
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)qword_100567490;
  if (!qword_100567490)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("UITintedCircularButtonCheckmark.png")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageWithRenderingMode:", 2));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_imageThatSuppressesAccessibilityHairlineThickening"));
    v6 = (void *)qword_100567490;
    qword_100567490 = v5;

    v2 = (void *)qword_100567490;
  }
  return v2;
}

+ (id)_multiSelectNotSelectedImage
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v2 = (void *)qword_100567498;
  if (!qword_100567498)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("UIRemoveControlMultiNotCheckedImage.png")));
    objc_msgSend(v3, "size");
    v5 = v4;
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.780392157, 0.780392157, 0.8, 1.0));
    v9 = objc_claimAutoreleasedReturnValue(+[UIImage _tintedImageForSize:withTint:effectsImage:maskImage:style:](UIImage, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v8, 0, v3, 0, v5, v7));
    v10 = (void *)qword_100567498;
    qword_100567498 = v9;

    v2 = (void *)qword_100567498;
  }
  return v2;
}

- (MTCollectionViewCell)initWithFrame:(CGRect)a3
{
  MTCollectionViewCell *v3;
  MTCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTCollectionViewCell;
  v3 = -[MTCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MTCollectionViewCell configureSubviews](v3, "configureSubviews");
    -[MTCollectionViewCell setPreservesSuperviewLayoutMargins:](v4, "setPreservesSuperviewLayoutMargins:", 1);
  }
  return v4;
}

- (void)configureSubviews
{
  UIScrollView *v3;
  UIScrollView *scrollView;
  UIScrollView *v5;
  void *v6;
  UIScrollView *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  UIImageView *v13;
  UIImageView *editingControl;

  v3 = (UIScrollView *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  -[UIScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setAlwaysBounceHorizontal:](self->_scrollView, "setAlwaysBounceHorizontal:", 1);
  -[UIScrollView setClipsToBounds:](self->_scrollView, "setClipsToBounds:", 1);
  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[UIScrollView setScrollsToTop:](self->_scrollView, "setScrollsToTop:", 0);
  -[UIScrollView setPreservesSuperviewLayoutMargins:](self->_scrollView, "setPreservesSuperviewLayoutMargins:", 1);
  -[UIScrollView setAutoresizingMask:](self->_scrollView, "setAutoresizingMask:", 16);
  v5 = self->_scrollView;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell contentView](self, "contentView"));
  -[UIScrollView addSubview:](v5, "addSubview:", v6);

  v7 = self->_scrollView;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell contentView](self, "contentView"));
  -[UIScrollView insertSubview:below:](v7, "insertSubview:below:", v8, v9);

  v10 = objc_alloc((Class)UIImageView);
  v11 = objc_msgSend((id)objc_opt_class(self), "_multiSelectNotSelectedImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (UIImageView *)objc_msgSend(v10, "initWithImage:", v12);
  editingControl = self->_editingControl;
  self->_editingControl = v13;

  -[UIImageView sizeToFit](self->_editingControl, "sizeToFit");
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_editingControl);
  -[MTCollectionViewCell setShowsMoreButton:](self, "setShowsMoreButton:", 1);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v4;
  id v6;
  UIImageView *v7;
  void *v8;
  void *v9;
  MTCollectionViewCell *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTCollectionViewCell;
  v6 = -[MTCollectionViewCell hitTest:withEvent:](&v12, "hitTest:withEvent:", a4, a3.x, a3.y);
  v7 = (UIImageView *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "panGestureRecognizer"));
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell mt_collectionView](self, "mt_collectionView"));
  objc_msgSend(v9, "setSwipeGesture:", v8);

  if (v7)
  {

  }
  if (v7 == self->_editingControl || v7 == (UIImageView *)self->_scrollView)
  {
    v10 = self;

    v7 = (UIImageView *)v10;
  }
  return v7;
}

- (void)prepareForReuse
{
  double y;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTCollectionViewCell;
  -[MTCollectionViewCell prepareForReuse](&v5, "prepareForReuse");
  -[MTCollectionViewCell removeDismissRecognizer](self, "removeDismissRecognizer");
  y = CGPointZero.y;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
  objc_msgSend(v4, "setContentOffset:", CGPointZero.x, y);

}

- (void)setEditing:(BOOL)a3
{
  -[MTCollectionViewCell setEditing:animated:](self, "setEditing:animated:", a3, 0);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  double v7;
  _QWORD v8[5];

  v4 = a4;
  v5 = a3;
  if (-[MTCollectionViewCell isEditing](self, "isEditing") != a3)
  {
    self->_editing = v5;
    if (-[MTCollectionViewCell exposedActions](self, "exposedActions"))
    {
      if (!v5)
        -[MTCollectionViewCell hideActionsAnimated:](self, "hideActionsAnimated:", v4);
    }
    else
    {
      -[MTCollectionViewCell setSwipeEnabled:](self, "setSwipeEnabled:", !v5);
    }
    -[MTCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v7 = 0.3;
    if (!v4)
      v7 = 0.0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000D2824;
    v8[3] = &unk_1004A6200;
    v8[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v8, v7);
  }
}

- (void)setSelected:(BOOL)a3
{
  UIImageView *editingControl;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTCollectionViewCell;
  -[MTCollectionViewCell setSelected:](&v9, "setSelected:");
  editingControl = self->_editingControl;
  v6 = (void *)objc_opt_class(self);
  if (a3)
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_multiSelectCheckmarkImage"));
  else
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_multiSelectNotSelectedImage"));
  v8 = (void *)v7;
  -[UIImageView setImage:](editingControl, "setImage:", v7);

}

- (BOOL)isSwipeEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
  v3 = objc_msgSend(v2, "isScrollEnabled");

  return v3;
}

- (void)setSwipeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
  objc_msgSend(v4, "setScrollEnabled:", v3);

}

- (BOOL)userSwiping
{
  return (id)-[MTCollectionViewCell swipeState](self, "swipeState") == (id)3
      || (id)-[MTCollectionViewCell swipeState](self, "swipeState") == (id)1;
}

- (BOOL)exposedActions
{
  return (id)-[MTCollectionViewCell swipeState](self, "swipeState") == (id)2
      || (id)-[MTCollectionViewCell swipeState](self, "swipeState") == (id)1;
}

- (void)setShowsMoreButton:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  if (self->_showsMoreButton != a3)
  {
    self->_showsMoreButton = a3;
    if (a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell moreButton](self, "moreButton"));
      v9[0] = v4;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell deleteButton](self, "deleteButton"));
      v9[1] = v5;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));

    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell deleteButton](self, "deleteButton"));
      v8 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
    objc_msgSend(v7, "setActionButtons:", v6);

    -[MTCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGRect)contentRectForEditControlWidth:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unsigned int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[MTCollectionViewCell bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (-[MTCollectionViewCell isEditing](self, "isEditing")
    && !-[MTCollectionViewCell exposedActions](self, "exposedActions"))
  {
    v10 = v10 - a3;
    v13 = -[MTCollectionViewCell mt_isRTL](self, "mt_isRTL");
    v14 = -0.0;
    if (!v13)
      v14 = a3;
    v6 = v6 + v14;
  }
  v15 = v6;
  v16 = v8;
  v17 = v10;
  v18 = v12;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)editingControlRectInBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double MaxX;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unsigned int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v8, "bounds");
  v10 = v9;

  +[UIView mt_layoutMarginsForWidth:](UIView, "mt_layoutMarginsForWidth:", v10);
  MaxX = v11;
  -[UIImageView frame](self->_editingControl, "frame");
  v14 = v13;
  v16 = v15;
  -[MTCollectionViewCell bounds](self, "bounds");
  v18 = IMRoundToPixel((v17 - v16) * 0.5);
  LODWORD(v8) = -[MTCollectionViewCell mt_isRTL](self, "mt_isRTL");
  v19 = -[MTCollectionViewCell isEditing](self, "isEditing");
  if ((_DWORD)v8)
  {
    if (v19 && !-[MTCollectionViewCell exposedActions](self, "exposedActions"))
    {
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      MaxX = CGRectGetMaxX(v25) - MaxX - v14;
    }
    else
    {
      v24.origin.x = x;
      v24.origin.y = y;
      v24.size.width = width;
      v24.size.height = height;
      MaxX = CGRectGetMaxX(v24);
    }
  }
  else if (!v19 || -[MTCollectionViewCell exposedActions](self, "exposedActions"))
  {
    MaxX = -v14;
  }
  v20 = MaxX;
  v21 = v18;
  v22 = v14;
  v23 = v16;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
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
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double MaxX;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  objc_super v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v48.receiver = self;
  v48.super_class = (Class)MTCollectionViewCell;
  -[MTCollectionViewCell layoutSubviews](&v48, "layoutSubviews");
  -[MTCollectionViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MTCollectionViewCell editingControlRectInBounds:](self, "editingControlRectInBounds:");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[UIImageView setFrame:](self->_editingControl, "setFrame:");
  if (-[MTCollectionViewCell mt_isRTL](self, "mt_isRTL"))
  {
    v49.origin.x = v4;
    v49.origin.y = v6;
    v49.size.width = v8;
    v49.size.height = v10;
    MaxX = CGRectGetMaxX(v49) - v12;
  }
  else
  {
    v50.origin.x = v12;
    v50.origin.y = v14;
    v50.size.width = v16;
    v50.size.height = v18;
    MaxX = CGRectGetMaxX(v50);
  }
  -[MTCollectionViewCell contentRectForEditControlWidth:](self, "contentRectForEditControlWidth:", MaxX);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
  objc_msgSend(v29, "setFrame:", v4, v6, v8, v10);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
  objc_msgSend(v30, "frame");
  v32 = v31;

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
  objc_msgSend(v33, "sizeThatFits:", v8, v10);
  v35 = v34;
  v37 = v36;

  -[MTCollectionViewCell defaultActionButtonsXOriginForScrollFrame:andActionContainerSize:](self, "defaultActionButtonsXOriginForScrollFrame:andActionContainerSize:", v4, v6, v8, v10, v35, v37);
  v39 = v38;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
  objc_msgSend(v40, "setFrame:", v39, v32, v35, v37);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
  objc_msgSend(v41, "contentOffset");
  v43 = v42;

  if (-[MTCollectionViewCell mt_isRTL](self, "mt_isRTL"))
    v43 = -v43;
  if ((id)-[MTCollectionViewCell swipeState](self, "swipeState") == (id)2 && v43 < v35)
  {
    if (-[MTCollectionViewCell mt_isRTL](self, "mt_isRTL"))
      v44 = -v35;
    else
      v44 = v35;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
    objc_msgSend(v45, "setContentOffset:animated:", 0, v44, 0.0);

  }
  v51.origin.x = v39;
  v51.origin.y = v32;
  v51.size.width = v35;
  v51.size.height = v37;
  v46 = v8 + CGRectGetWidth(v51);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
  objc_msgSend(v47, "setContentSize:", v46, v10);

}

- (id)scrollView
{
  UIScrollView *scrollView;
  id v4;
  UIScrollView *v5;
  UIScrollView *v6;
  objc_super v8;

  scrollView = self->_scrollView;
  if (!scrollView)
  {
    v8.receiver = self;
    v8.super_class = (Class)MTCollectionViewCell;
    v4 = -[MTCollectionViewCell contentView](&v8, "contentView");
    v5 = (UIScrollView *)objc_claimAutoreleasedReturnValue(v4);
    v6 = self->_scrollView;
    self->_scrollView = v5;

    scrollView = self->_scrollView;
  }
  return scrollView;
}

- (id)contentView
{
  UIView *contentView;
  UIView *v4;
  UIView *v5;

  contentView = self->_contentView;
  if (!contentView)
  {
    v4 = objc_opt_new(UIView);
    v5 = self->_contentView;
    self->_contentView = v4;

    contentView = self->_contentView;
  }
  return contentView;
}

- (MTActionButtonContainerView)actionButtonsContainer
{
  MTActionButtonContainerView *actionButtonsContainer;
  MTActionButtonContainerView *v4;
  MTActionButtonContainerView *v5;

  actionButtonsContainer = self->_actionButtonsContainer;
  if (!actionButtonsContainer)
  {
    v4 = objc_opt_new(MTActionButtonContainerView);
    v5 = self->_actionButtonsContainer;
    self->_actionButtonsContainer = v4;

    actionButtonsContainer = self->_actionButtonsContainer;
  }
  return actionButtonsContainer;
}

- (MTCollectionView)collectionView
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell superview](self, "superview"));
  v4 = objc_opt_class(UICollectionView);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell superview](self, "superview"));
  else
    v6 = 0;
  return (MTCollectionView *)v6;
}

- (id)mt_collectionView
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell superview](self, "superview"));
  v4 = objc_opt_class(MTCollectionView);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell superview](self, "superview"));
  else
    v6 = 0;
  return v6;
}

- (UIButton)deleteButton
{
  UIButton *v3;
  UIButton *deleteButton;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIButton *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  if (!self->_deleteButton)
  {
    v3 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    deleteButton = self->_deleteButton;
    self->_deleteButton = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIButton setTintColor:](self->_deleteButton, "setTintColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    -[UIButton setBackgroundColor:](self->_deleteButton, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 18.0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_deleteButton, "titleLabel"));
    objc_msgSend(v8, "setFont:", v7);

    -[UIButton addTarget:action:forControlEvents:](self->_deleteButton, "addTarget:action:forControlEvents:", self, "deleteButtonTapped:", 64);
    v9 = self->_deleteButton;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Delete"), &stru_1004C6D40, 0));
    -[UIButton setTitle:forState:](v9, "setTitle:forState:", v11, 0);

    if (-[MTCollectionViewCell mt_isRTL](self, "mt_isRTL"))
      v12 = 4;
    else
      v12 = 1;
    -[UIButton setAutoresizingMask:](self->_deleteButton, "setAutoresizingMask:", v12);
  }
  return self->_deleteButton;
}

- (UIButton)moreButton
{
  UIButton *v3;
  UIButton *moreButton;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIButton *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  if (!self->_moreButton)
  {
    v3 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    moreButton = self->_moreButton;
    self->_moreButton = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIButton setTintColor:](self->_moreButton, "setTintColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _systemMidGrayTintColor](UIColor, "_systemMidGrayTintColor"));
    -[UIButton setBackgroundColor:](self->_moreButton, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 18.0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_moreButton, "titleLabel"));
    objc_msgSend(v8, "setFont:", v7);

    -[UIButton addTarget:action:forControlEvents:](self->_moreButton, "addTarget:action:forControlEvents:", self, "moreButtonTapped:", 64);
    -[UIButton addTarget:action:forControlEvents:](self->_moreButton, "addTarget:action:forControlEvents:", self, "moreButtonTapCancelled:", 256);
    v9 = self->_moreButton;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("More"), &stru_1004C6D40, 0));
    -[UIButton setTitle:forState:](v9, "setTitle:forState:", v11, 0);

    if (-[MTCollectionViewCell mt_isRTL](self, "mt_isRTL"))
      v12 = 4;
    else
      v12 = 1;
    -[UIButton setAutoresizingMask:](self->_moreButton, "setAutoresizingMask:", v12);
  }
  return self->_moreButton;
}

- (void)deleteButtonTapped:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell mt_collectionView](self, "mt_collectionView", a3));
  objc_msgSend(v4, "swipeEnded:", self);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell delegate](self, "delegate"));
  objc_msgSend(v5, "cellDidPressDelete:", self);

}

- (void)moreButtonTapped:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "cellDidPressMore:");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell delegate](self, "delegate"));
    objc_msgSend(v6, "cellDidPressMore:", self);

  }
}

- (void)moreButtonTapCancelled:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
  v5 = objc_msgSend(v4, "isDragging");

  if (v5)
    -[MTCollectionViewCell moreButtonTapped:](self, "moreButtonTapped:", v6);

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTCollectionViewCell;
  -[MTCollectionViewCell applyLayoutAttributes:](&v9, "applyLayoutAttributes:", v4);
  v5 = objc_opt_class(MTCollectionViewFlowLayoutAttributes);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    if (objc_msgSend(v6, "isOpen"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell mt_collectionView](self, "mt_collectionView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "swipedCellIndexPath"));

      if (!v8)
        objc_msgSend(v6, "setOpen:", 0);
    }
    -[MTCollectionViewCell setOpen:animated:](self, "setOpen:animated:", objc_msgSend(v6, "isOpen"), 0);

  }
}

- (void)setOpen:(BOOL)a3 animated:(BOOL)a4
{
  if (a3)
  {
    -[MTCollectionViewCell exposeActionsAnimated:](self, "exposeActionsAnimated:", a4);
    -[MTCollectionViewCell addDismissRecognizer](self, "addDismissRecognizer");
  }
  else
  {
    -[MTCollectionViewCell hideActionsAnimated:](self, "hideActionsAnimated:", a4);
    -[MTCollectionViewCell removeDismissRecognizer](self, "removeDismissRecognizer");
  }
}

- (void)dismissDelete:(id)a3
{
  -[MTCollectionViewCell setOpen:animated:](self, "setOpen:animated:", 0, 1);
  -[MTCollectionViewCell removeDismissRecognizer](self, "removeDismissRecognizer");
}

- (void)addDismissRecognizer
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell superview](self, "superview"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell dismissOnTouchRecognizer](self, "dismissOnTouchRecognizer"));
  objc_msgSend(v4, "addGestureRecognizer:", v3);

}

- (void)removeDismissRecognizer
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell superview](self, "superview"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell dismissOnTouchRecognizer](self, "dismissOnTouchRecognizer"));
  objc_msgSend(v3, "removeGestureRecognizer:", v4);

  -[MTCollectionViewCell setDismissOnTouchRecognizer:](self, "setDismissOnTouchRecognizer:", 0);
}

- (MTUIFocusedTouchGestureRecognizer)dismissOnTouchRecognizer
{
  MTUIFocusedTouchGestureRecognizer *dismissOnTouchRecognizer;
  id v4;
  void *v5;
  MTUIFocusedTouchGestureRecognizer *v6;
  MTUIFocusedTouchGestureRecognizer *v7;

  dismissOnTouchRecognizer = self->_dismissOnTouchRecognizer;
  if (!dismissOnTouchRecognizer)
  {
    v4 = objc_alloc((Class)MTUIFocusedTouchGestureRecognizer);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
    v6 = (MTUIFocusedTouchGestureRecognizer *)objc_msgSend(v4, "initWithFocusedView:touchAllowance:", v5, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    v7 = self->_dismissOnTouchRecognizer;
    self->_dismissOnTouchRecognizer = v6;

    -[MTUIFocusedTouchGestureRecognizer addTarget:action:](self->_dismissOnTouchRecognizer, "addTarget:action:", self, "dismissDelete:");
    dismissOnTouchRecognizer = self->_dismissOnTouchRecognizer;
  }
  return dismissOnTouchRecognizer;
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double Width;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  id v42;
  CGRect v43;

  v42 = a3;
  objc_msgSend(v42, "contentOffset");
  if (v4 == 0.0
    || (objc_msgSend(v42, "contentOffset"),
        ((-[MTCollectionViewCell mt_isRTL](self, "mt_isRTL") ^ (v5 >= 0.0)) & 1) == 0))
  {
    objc_msgSend(v42, "setContentOffset:", 0.0, 0.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
    objc_msgSend(v32, "frame");
    v34 = v33;
    v36 = v35;
    v38 = v37;

    objc_msgSend(v42, "frame");
    -[MTCollectionViewCell defaultActionButtonsXOriginForScrollFrame:andActionContainerSize:](self, "defaultActionButtonsXOriginForScrollFrame:andActionContainerSize:");
    v40 = v39;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
    objc_msgSend(v41, "setFrame:", v40, v34, v36, v38);

    v31 = 0;
LABEL_16:
    -[MTCollectionViewCell setSwipeState:](self, "setSwipeState:", v31);
    goto LABEL_17;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v42, "frame");
  -[MTCollectionViewCell defaultActionButtonsXOriginForScrollFrame:andActionContainerSize:](self, "defaultActionButtonsXOriginForScrollFrame:andActionContainerSize:");
  v16 = v15;
  LODWORD(v6) = -[MTCollectionViewCell mt_isRTL](self, "mt_isRTL");
  v43.origin.x = v8;
  v43.origin.y = v10;
  v43.size.width = v12;
  v43.size.height = v14;
  Width = CGRectGetWidth(v43);
  if (!(_DWORD)v6)
    Width = -Width;
  v18 = v16 + Width;
  objc_msgSend(v42, "contentOffset");
  v20 = v18 + v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
  objc_msgSend(v21, "setFrame:", v20, v10, v12, v14);

  if ((id)-[MTCollectionViewCell swipeState](self, "swipeState") != (id)3)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
    objc_msgSend(v22, "contentOffset");
    v24 = v23;

    if (-[MTCollectionViewCell mt_isRTL](self, "mt_isRTL"))
      v25 = -v24;
    else
      v25 = v24;
    if (-[MTCollectionViewCell mt_isRTL](self, "mt_isRTL"))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
      objc_msgSend(v26, "_contentScrollInset");
      v28 = v27;

      if (v28 == 0.0)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
        objc_msgSend(v29, "_setContentScrollInset:", 0.0, v12, 0.0, 0.0);

      }
    }
    -[MTCollectionViewCell targetXOffsetForExposedActions](self, "targetXOffsetForExposedActions");
    if (v25 < fabs(v30))
      v31 = 1;
    else
      v31 = 2;
    goto LABEL_16;
  }
LABEL_17:

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  void *v7;
  double v8;
  double x;
  unsigned int v10;
  double v11;
  CGFloat v12;
  CGRect v13;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell deleteButton](self, "deleteButton", a3, a4.x, a4.y));
  objc_msgSend(v7, "frame");
  v8 = CGRectGetWidth(v13) * 0.899999976;

  x = a5->x;
  v10 = -[MTCollectionViewCell mt_isRTL](self, "mt_isRTL");
  v11 = -x;
  if (!v10)
    v11 = x;
  if (v11 >= v8)
  {
    -[MTCollectionViewCell setSwipeState:](self, "setSwipeState:", 1);
    -[MTCollectionViewCell targetXOffsetForExposedActions](self, "targetXOffsetForExposedActions");
    a5->x = v12;
    -[MTCollectionViewCell addDismissRecognizer](self, "addDismissRecognizer");
  }
  else
  {
    -[MTCollectionViewCell setSwipeState:](self, "setSwipeState:", 3);
    a5->x = 0.0;
    -[MTCollectionViewCell removeDismissRecognizer](self, "removeDismissRecognizer");
  }
}

- (void)exposeActionsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  id v7;

  v3 = a3;
  -[MTCollectionViewCell setSwipeState:](self, "setSwipeState:", 1);
  -[MTCollectionViewCell targetXOffsetForExposedActions](self, "targetXOffsetForExposedActions");
  v6 = v5;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
  objc_msgSend(v7, "setContentOffset:animated:", v3, v6, 0.0);

}

- (void)hideActionsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;

  v3 = a3;
  if (-[MTCollectionViewCell swipeState](self, "swipeState"))
  {
    -[MTCollectionViewCell setSwipeState:](self, "setSwipeState:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
    objc_msgSend(v5, "setContentOffset:animated:", v3, CGPointZero.x, CGPointZero.y);

    if (-[MTCollectionViewCell mt_isRTL](self, "mt_isRTL"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
      objc_msgSend(v6, "_contentScrollInset");
      v8 = v7;

      if (v8 != 0.0)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
        objc_msgSend(v9, "_setContentScrollInset:", 0.0, 0.0, 0.0, 0.0);

      }
    }
  }
  -[MTCollectionViewCell removeDismissRecognizer](self, "removeDismissRecognizer");
}

- (double)targetXOffsetForExposedActions
{
  unsigned int v3;
  void *v4;
  double Width;
  double v6;
  CGRect v8;

  v3 = -[MTCollectionViewCell mt_isRTL](self, "mt_isRTL");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
  objc_msgSend(v4, "frame");
  Width = CGRectGetWidth(v8);
  if (v3)
    v6 = -Width;
  else
    v6 = Width;

  return v6;
}

- (void)setSwipeState:(unint64_t)a3
{
  unint64_t swipeState;

  swipeState = self->_swipeState;
  if (swipeState != a3)
  {
    self->_swipeState = a3;
    -[MTCollectionViewCell setEditing:](self, "setEditing:", -[MTCollectionViewCell exposedActions](self, "exposedActions"));
    if (!-[MTCollectionViewCell exposedActions](self, "exposedActions") || a3 == 2 && swipeState == 1)
    {
      if (!-[MTCollectionViewCell exposedActions](self, "exposedActions") && (a3 || swipeState != 3))
        -[MTCollectionViewCell scrollViewHidDelete](self, "scrollViewHidDelete");
    }
    else
    {
      -[MTCollectionViewCell scrollViewExposedDelete](self, "scrollViewExposedDelete");
    }
  }
}

- (void)scrollViewHidDelete
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell mt_collectionView](self, "mt_collectionView"));
  objc_msgSend(v3, "swipeEnded:", self);

}

- (void)scrollViewExposedDelete
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell mt_collectionView](self, "mt_collectionView"));
  objc_msgSend(v3, "swipeBegan:", self);

}

- (double)defaultActionButtonsXOriginForScrollFrame:(CGRect)a3 andActionContainerSize:(CGSize)a4
{
  double width;
  CGFloat height;
  CGFloat v6;
  CGFloat y;
  CGFloat x;
  unsigned int v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;

  width = a4.width;
  height = a3.size.height;
  v6 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = -[MTCollectionViewCell mt_isRTL](self, "mt_isRTL", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.width, a4.height);
  v10 = x;
  v11 = y;
  v12 = v6;
  v13 = height;
  if (v9)
    return CGRectGetMinX(*(CGRect *)&v10) - width;
  else
    return CGRectGetMaxX(*(CGRect *)&v10);
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (MTCollectionViewCellDelegate)delegate
{
  return (MTCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)swipeState
{
  return self->_swipeState;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (void)setDismissOnTouchRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissOnTouchRecognizer, a3);
}

- (void)setActionButtonsContainer:(id)a3
{
  objc_storeStrong((id *)&self->_actionButtonsContainer, a3);
}

- (void)setDeleteButton:(id)a3
{
  objc_storeStrong((id *)&self->_deleteButton, a3);
}

- (void)setMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_moreButton, a3);
}

- (void)setUserSwiping:(BOOL)a3
{
  self->_userSwiping = a3;
}

- (BOOL)showsMoreButton
{
  return self->_showsMoreButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_actionButtonsContainer, 0);
  objc_storeStrong((id *)&self->_dismissOnTouchRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_editingControl, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end

@implementation _UICollectionViewListCellReorderControl

- (void)setConstants:(id)a3
{
  UITableConstants *v5;
  UITableConstants *v6;

  v5 = (UITableConstants *)a3;
  if (self->_constants != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_constants, a3);
    -[_UICollectionViewListCellReorderControl _setNeedsImageViewUpdate](self, "_setNeedsImageViewUpdate");
    v5 = v6;
  }

}

- (void)setAccessoryTintColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_accessoryTintColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_accessoryTintColor, a3);
    -[_UICollectionViewListCellReorderControl _setNeedsImageViewUpdate](self, "_setNeedsImageViewUpdate");
    v5 = v6;
  }

}

- (_UICollectionViewListCellReorderControl)initWithDelegate:(id)a3 constants:(id)a4
{
  id v6;
  id v7;
  _UICollectionViewListCellReorderControl *v8;
  _UICollectionViewListCellReorderControl *v9;
  UIImageView *v10;
  UIImageView *imageView;
  UIImageView *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  UILongPressGestureRecognizer *v17;
  UILongPressGestureRecognizer *reorderRecognizer;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_UICollectionViewListCellReorderControl;
  v8 = -[UIControl initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_constants, a4);
    v10 = objc_alloc_init(UIImageView);
    -[UIView addSubview:](v9, "addSubview:", v10);
    imageView = v9->_imageView;
    v9->_imageView = v10;
    v12 = v10;

    v9->_needsImageViewUpdate = 1;
    +[UITraitCollection systemTraitsAffectingColorAppearance](UITraitCollection, "systemTraitsAffectingColorAppearance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITraitCollection systemTraitsAffectingImageLookup](UITraitCollection, "systemTraitsAffectingImageLookup");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = -[UIView registerForTraitChanges:withAction:](v9, "registerForTraitChanges:withAction:", v15, sel__setNeedsImageViewUpdate);
    v17 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", v9, sel_pan_);
    -[UIGestureRecognizer setDelegate:](v17, "setDelegate:", v9);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v17, "setMinimumPressDuration:", 0.0);
    -[UIView addGestureRecognizer:](v9, "addGestureRecognizer:", v17);
    reorderRecognizer = v9->_reorderRecognizer;
    v9->_reorderRecognizer = v17;

  }
  return v9;
}

- (void)_setTracking:(BOOL)a3
{
  if (self->_tracking != a3)
  {
    self->_tracking = a3;
    -[_UICollectionViewListCellReorderControl _setNeedsImageViewUpdate](self, "_setNeedsImageViewUpdate");
  }
}

- (void)_setNeedsImageViewUpdate
{
  self->_needsImageViewUpdate = 1;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateImageViewIfNeeded
{
  UITableConstants *constants;
  void *v4;
  id v5;

  if (self->_needsImageViewUpdate)
  {
    self->_needsImageViewUpdate = 0;
    constants = self->_constants;
    -[UIView traitCollection](self, "traitCollection");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UITableConstants defaultReorderControlImageForTraitCollection:withAccessoryBaseColor:isTracking:](constants, "defaultReorderControlImageForTraitCollection:withAccessoryBaseColor:isTracking:", v5, self->_accessoryTintColor, self->_tracking);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_imageView, "setImage:", v4);

  }
}

- (CGSize)_minimumSizeForHitTesting
{
  _BOOL4 v2;
  double v3;
  double v4;
  CGSize result;

  v2 = -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled");
  v3 = 44.0;
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v2)
    v4 = 44.0;
  else
    v3 = *MEMORY[0x1E0C9D820];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_UICollectionViewListCellReorderControl _updateImageViewIfNeeded](self, "_updateImageViewIfNeeded");
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;
  -[_UICollectionViewListCellReorderControl _minimumSizeForHitTesting](self, "_minimumSizeForHitTesting");
  if (v9 >= v10)
    v11 = v9;
  else
    v11 = v10;
  if (height >= v11)
    v12 = v11;
  else
    v12 = height;
  v13 = v7;
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
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
  v12.super_class = (Class)_UICollectionViewListCellReorderControl;
  -[UIView layoutSubviews](&v12, sel_layoutSubviews);
  -[_UICollectionViewListCellReorderControl _updateImageViewIfNeeded](self, "_updateImageViewIfNeeded");
  -[UIImageView _currentImage](self->_imageView, "_currentImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  -[UIImageView setBounds:](self->_imageView, "setBounds:", 0.0, 0.0, v5, v7);
  -[UIView bounds](self, "bounds");
  -[UIImageView setCenter:](self->_imageView, "setCenter:", v9 + v8 * 0.5, v11 + v10 * 0.5);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UICollectionViewListCellReorderControl;
  v6 = a3;
  -[UIControl touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_, v6, a4);
  -[_UICollectionViewListCellReorderControl delegate](self, "delegate", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_reorderControl:didReceiveTouchesBegan:", self, v6);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v5;
  char v6;
  objc_super v7;

  if (self->_reorderRecognizer == a3)
  {
    -[_UICollectionViewListCellReorderControl delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_reorderControlShouldBeginReordering:", self);

    return v6;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UICollectionViewListCellReorderControl;
    return -[UIView gestureRecognizerShouldBegin:](&v7, sel_gestureRecognizerShouldBegin_);
  }
}

- (void)pan:(id)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _UICollectionViewListCellReorderControl *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  switch(objc_msgSend(v21, "state"))
  {
    case 0:
    case 5:
      if (self->_tracking)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListCellReorderControl.m"), 201, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_tracking"));

      }
      break;
    case 1:
      if (self->_tracking)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListCellReorderControl.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_tracking"));

      }
      -[_UICollectionViewListCellReorderControl _setTracking:](self, "_setTracking:", 1);
      objc_msgSend(v21, "locationInView:", self);
      v7 = v6;
      v9 = v8;
      -[_UICollectionViewListCellReorderControl beginReordering](self, "beginReordering");
      v10 = self;
      v11 = v7;
      v12 = v9;
      goto LABEL_10;
    case 2:
      if (!self->_tracking)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListCellReorderControl.m"), 180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_tracking"));

      }
      objc_msgSend(v21, "locationInView:", self);
      v10 = self;
LABEL_10:
      -[_UICollectionViewListCellReorderControl gestureMovedToPoint:](v10, "gestureMovedToPoint:", v11, v12);
      break;
    case 3:
      if (!self->_tracking)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListCellReorderControl.m"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_tracking"));

      }
      objc_msgSend(v21, "locationInView:", self);
      v14 = v13;
      v16 = v15;
      -[_UICollectionViewListCellReorderControl endReordering:](self, "endReordering:", 0);
      -[_UICollectionViewListCellReorderControl gestureMovedToPoint:](self, "gestureMovedToPoint:", v14, v16);
      goto LABEL_17;
    case 4:
      if (!self->_tracking)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListCellReorderControl.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_tracking"));

      }
      -[_UICollectionViewListCellReorderControl endReordering:](self, "endReordering:", 1);
LABEL_17:
      -[_UICollectionViewListCellReorderControl _setTracking:](self, "_setTracking:", 0);
      break;
    default:
      break;
  }

}

- (void)beginReordering
{
  id v3;

  -[_UICollectionViewListCellReorderControl delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_reorderControlDidBeginReordering:", self);

}

- (void)gestureMovedToPoint:(CGPoint)a3
{
  double y;
  double x;
  CGFloat v6;
  CGFloat v7;
  CGFloat width;
  CGFloat height;
  double MidX;
  double v11;
  id v12;
  CGRect v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  -[UIView bounds](self, "bounds");
  v6 = v13.origin.x;
  v7 = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  MidX = CGRectGetMidX(v13);
  v14.origin.x = v6;
  v14.origin.y = v7;
  v14.size.width = width;
  v14.size.height = height;
  v11 = y - CGRectGetMidY(v14);
  -[_UICollectionViewListCellReorderControl delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_reorderControl:didUpdateWithOffset:", self, x - MidX, v11);

}

- (void)endReordering:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[_UICollectionViewListCellReorderControl delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_reorderControlDidEndReordering:cancelled:", self, v3);

}

- (void)cancelReorderingGesture
{
  UILongPressGestureRecognizer *v2;

  v2 = self->_reorderRecognizer;
  -[UIGestureRecognizer setEnabled:](v2, "setEnabled:", 0);
  -[UIGestureRecognizer setEnabled:](v2, "setEnabled:", 1);

}

- (_UICollectionViewListCellReorderControlDelegate)delegate
{
  return (_UICollectionViewListCellReorderControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITableConstants)constants
{
  return self->_constants;
}

- (UIColor)accessoryTintColor
{
  return self->_accessoryTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryTintColor, 0);
  objc_storeStrong((id *)&self->_constants, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reorderRecognizer, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end

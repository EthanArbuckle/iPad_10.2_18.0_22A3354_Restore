@implementation BKLibraryBookshelfCollectionViewCell

- (BKLibraryBookshelfCollectionViewCell)initWithFrame:(CGRect)a3
{
  BKLibraryBookshelfCollectionViewCell *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKLibraryBookshelfCollectionViewCell;
  v3 = -[BKLibraryBookshelfCollectionViewCell initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, "i_minifiedAssetPresentersChangedNotification:", CFSTR("BKMnifiedPresentersUpdatedNotification"), 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v6 = -[BKLibraryBookshelfCollectionViewCell registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v5, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("BKMnifiedPresentersUpdatedNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfCollectionViewCell;
  -[BKLibraryBookshelfCollectionViewCell dealloc](&v4, "dealloc");
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookshelfCollectionViewCell;
  -[BKLibraryBookshelfCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  -[BKLibraryBookshelfCollectionViewCell updateAudiobookControlWithStatus:diameter:](self, "updateAudiobookControlWithStatus:diameter:", 0, 0.0);
}

- (void)i_minifiedAssetPresentersChangedNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = objc_opt_class(self);
  v5 = BUClassAndProtocolCast(self, v4, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    v22 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "libraryAsset", &OBJC_PROTOCOL___BKLibraryBookshelfBookCell, &OBJC_PROTOCOL___BKLibraryBookshelfAudiobookCell));
    v8 = objc_msgSend(v7, "isAudiobook");

    if (v8)
    {
      v9 = objc_opt_class(UICollectionView);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell superview](self, "superview"));
      v11 = BUDynamicCast(v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

      v13 = objc_opt_class(UIViewController);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate"));
      v15 = BUDynamicCast(v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKMinifiedPresenting));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "libraryAsset"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "assetID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "minifiedPresenterAssetCurrentPresenterForAssetID:", v19));

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "minifiedAssetStatus"));
      objc_msgSend(v22, "setAudiobookStatus:", v21);

    }
    else
    {
      objc_msgSend(v22, "setAudiobookStatus:", 0);
    }
    v6 = v22;
  }

}

- (void)updateAudiobookControlWithStatus:(id)a3 diameter:(double)a4
{
  void *v6;
  BSUIAudiobookControl *v7;
  BSUIAudiobookControl *audiobookControl;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BSUIAudiobookControl *v13;
  id v14;

  v14 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell audiobookControl](self, "audiobookControl"));
  if (v14)
  {

    if (!v6)
    {
      v7 = (BSUIAudiobookControl *)objc_msgSend(objc_alloc((Class)BSUIAudiobookControl), "initWithFrame:", 0.0, 0.0, a4, a4);
      audiobookControl = self->_audiobookControl;
      self->_audiobookControl = v7;

      v9 = BUProtocolCast(&OBJC_PROTOCOL___BSUIAudiobookControlDelegate, self);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      -[BSUIAudiobookControl setDelegate:](self->_audiobookControl, "setDelegate:", v10);

      -[BSUIAudiobookControl setPlaying:](self->_audiobookControl, "setPlaying:", objc_msgSend(v14, "assetAudiobookStatusIsPlaying"));
      objc_msgSend(v14, "assetAudiobookStatusTrackProgress");
      -[BSUIAudiobookControl setProgress:](self->_audiobookControl, "setProgress:");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell contentView](self, "contentView"));
      objc_msgSend(v11, "addSubview:", self->_audiobookControl);

      -[BKLibraryBookshelfCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
  else
  {

    if (v6)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell audiobookControl](self, "audiobookControl"));
      objc_msgSend(v12, "removeFromSuperview");

      v13 = self->_audiobookControl;
      self->_audiobookControl = 0;

    }
  }

}

- (id)dragPreview
{
  return 0;
}

- (id)dragPreviewParametersForDrop:(BOOL)a3
{
  return 0;
}

- (void)dragStateDidChange:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKLibraryBookshelfCollectionViewCell;
  -[BKLibraryBookshelfCollectionViewCell dragStateDidChange:](&v6, "dragStateDidChange:");
  if (a3 == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell window](self, "window"));
    objc_msgSend(v5, "setUserInteractionEnabled:", 1);

  }
}

- (BKLibraryBookshelfCoverLayer)coverLayer
{
  NSString *v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  void *v8;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
  BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKLibraryBookshelfCollectionViewCell.m", 137, "-[BKLibraryBookshelfCollectionViewCell coverLayer]", "NO", CFSTR("Missing implementation. method: class: %@ - %@"));

  return 0;
}

- (BKLibraryBookshelfCoverView)coverView
{
  NSString *v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  void *v8;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
  BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKLibraryBookshelfCollectionViewCell.m", 143, "-[BKLibraryBookshelfCollectionViewCell coverView]", "NO", CFSTR("Missing implementation. method: class: %@ - %@"));

  return 0;
}

- (CGRect)coverFrame
{
  NSString *v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  double x;
  double y;
  double width;
  double height;
  void *v11;
  CGRect result;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v6);
  BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKLibraryBookshelfCollectionViewCell.m", 149, "-[BKLibraryBookshelfCollectionViewCell coverFrame]", "NO", CFSTR("Missing implementation. method: class: %@ - %@"));

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)shouldHandleTapIfPossible
{
  if (-[BKLibraryBookshelfCollectionViewCell pendingTouchUp](self, "pendingTouchUp"))
    return 0;
  else
    return !-[BKLibraryBookshelfCollectionViewCell pendingAnimationCompletion](self, "pendingAnimationCompletion");
}

- (void)handleTapWithCompletion:(id)a3
{
  NSString *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id v8;

  v4 = NSStringFromSelector(a2);
  v8 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKLibraryBookshelfCollectionViewCell.m", 161, "-[BKLibraryBookshelfCollectionViewCell handleTapWithCompletion:]", "NO", CFSTR("Missing implementation. method: class: %@ - %@"));

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (-[BKLibraryBookshelfCollectionViewCell isHighlighted](self, "isHighlighted") != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)BKLibraryBookshelfCollectionViewCell;
    -[BKLibraryBookshelfCollectionViewCell setHighlighted:](&v7, "setHighlighted:", v3);
    if (v3)
      v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell highlightBackgroundColor](self, "highlightBackgroundColor"));
    else
      v5 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v6 = (void *)v5;
    -[BKLibraryBookshelfCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v5);

  }
}

- (void)setHighlighted:(BOOL)a3 completion:(id)a4
{
  int v4;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  char v12;

  v4 = a3;
  v6 = a4;
  if (-[BKLibraryBookshelfCollectionViewCell isHighlighted](self, "isHighlighted") == v4)
  {
    v7 = objc_retainBlock(v6);
    v8 = v7;
    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);

  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100190578;
    v11[3] = &unk_1008E83C0;
    v11[4] = self;
    v12 = v4;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100190584;
    v9[3] = &unk_1008E7B98;
    v10 = v6;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v11, v9, 0.1);

  }
}

- (void)animateCoverPressed:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BKLibraryBookshelfBookCellAnimationDelegate *v17;
  void *v18;
  void *v19;
  CATransform3D v20;
  CATransform3D v21;
  CATransform3D b;
  CATransform3D a;

  v4 = a3;
  v6 = a4;
  if (v4)
    v7 = 1.0;
  else
    v7 = 0.95;
  if (v4)
    v8 = 0.95;
  else
    v8 = 1.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell coverLayer](self, "coverLayer"));
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "transform");
  else
    memset(&a, 0, sizeof(a));
  CATransform3DMakeScale(&b, v8, v8, 1.0);
  v11 = CATransform3DEqualToTransform(&a, &b);

  if (v11)
  {
    v12 = objc_retainBlock(v6);
    v13 = v12;
    if (v12)
      (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform.scale")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7));
    objc_msgSend(v13, "setFromValue:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
    objc_msgSend(v13, "setToValue:", v15);

    objc_msgSend(v13, "setDuration:", 0.15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
    objc_msgSend(v13, "setTimingFunction:", v16);

    v17 = objc_alloc_init(_BKLibraryBookshelfBookCellAnimationDelegate);
    -[_BKLibraryBookshelfBookCellAnimationDelegate setCompletionBlock:](v17, "setCompletionBlock:", v6);
    objc_msgSend(v13, "setDelegate:", v17);
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell coverLayer](self, "coverLayer"));
    objc_msgSend(v18, "addAnimation:forKey:", v13, CFSTR("press"));

    CATransform3DMakeScale(&v21, v8, v8, 1.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell coverLayer](self, "coverLayer"));
    v20 = v21;
    objc_msgSend(v19, "setTransform:", &v20);

    +[CATransaction commit](CATransaction, "commit");
  }

}

- (void)handleTapIfPossible
{
  _QWORD *v3;
  void *v4;
  _QWORD *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10019095C;
  v10[3] = &unk_1008ED7F0;
  objc_copyWeak(&v11, &location);
  v3 = objc_retainBlock(v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell window](self, "window"));
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100190A40;
  v7[3] = &unk_1008ED818;
  v7[4] = self;
  v5 = v3;
  v9 = v5;
  v6 = v4;
  v8 = v6;
  -[BKLibraryBookshelfCollectionViewCell animateCoverPressed:completion:](self, "animateCoverPressed:completion:", 1, v7);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");
  v8 = objc_msgSend(v5, "userInterfaceStyle");

  if (v7 != v8)
    -[BKLibraryBookshelfCollectionViewCell nightModeChanged](self, "nightModeChanged");
}

- (void)nightModeChanged
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell coverLayer](self, "coverLayer"));
  objc_msgSend(v2, "nightModeChanged");

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BKLibraryBookshelfCollectionViewCell;
  v4 = a3;
  -[BKLibraryBookshelfCollectionViewCell applyLayoutAttributes:](&v14, "applyLayoutAttributes:", v4);
  v5 = objc_opt_class(BKLibraryLayoutAttributes);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  self->_isInEditMode = objc_msgSend(v7, "editMode");
  -[BKLibraryBookshelfCollectionViewCell setAutomaticallyUpdatesBackgroundConfiguration:](self, "setAutomaticallyUpdatesBackgroundConfiguration:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellMetrics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell configurationState](self, "configurationState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "backgroundConfigurationForState:isInEditMode:", v9, -[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode")));
  -[BKLibraryBookshelfCollectionViewCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v10);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100190CEC;
  v12[3] = &unk_1008ED840;
  v13 = v8;
  v11 = v8;
  -[BKLibraryBookshelfCollectionViewCell setConfigurationUpdateHandler:](self, "setConfigurationUpdateHandler:", v12);

}

- (void)addBooksLinkEntityInteraction:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell booksLinkEntityInteraction](self, "booksLinkEntityInteraction"));

  if (v4 != v5)
  {
    -[BKLibraryBookshelfCollectionViewCell removeBooksLinkEntityInteraction](self, "removeBooksLinkEntityInteraction");
    if (v5)
    {
      -[BKLibraryBookshelfCollectionViewCell addInteraction:](self, "addInteraction:", v5);
      -[BKLibraryBookshelfCollectionViewCell setBooksLinkEntityInteraction:](self, "setBooksLinkEntityInteraction:", v5);
    }
  }

}

- (void)removeBooksLinkEntityInteraction
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell booksLinkEntityInteraction](self, "booksLinkEntityInteraction"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell booksLinkEntityInteraction](self, "booksLinkEntityInteraction"));
    -[BKLibraryBookshelfCollectionViewCell removeInteraction:](self, "removeInteraction:", v4);

    -[BKLibraryBookshelfCollectionViewCell setBooksLinkEntityInteraction:](self, "setBooksLinkEntityInteraction:", 0);
  }
}

- (void)prepareForDragPreview
{
  void *v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[8];

  if (!-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell coverLayer](self, "coverLayer"));
    objc_msgSend(v3, "removeAllAnimations");

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell coverLayer](self, "coverLayer"));
    v5 = *(_OWORD *)&CATransform3DIdentity.m33;
    v9[4] = *(_OWORD *)&CATransform3DIdentity.m31;
    v9[5] = v5;
    v6 = *(_OWORD *)&CATransform3DIdentity.m43;
    v9[6] = *(_OWORD *)&CATransform3DIdentity.m41;
    v9[7] = v6;
    v7 = *(_OWORD *)&CATransform3DIdentity.m13;
    v9[0] = *(_OWORD *)&CATransform3DIdentity.m11;
    v9[1] = v7;
    v8 = *(_OWORD *)&CATransform3DIdentity.m23;
    v9[2] = *(_OWORD *)&CATransform3DIdentity.m21;
    v9[3] = v8;
    objc_msgSend(v4, "setTransform:", v9);

    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)setAlpha:(double)a3
{
  objc_super v4;

  -[BKLibraryBookshelfCollectionViewCell _desiredAlphaFromRawAlpha:](self, "_desiredAlphaFromRawAlpha:", a3);
  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfCollectionViewCell;
  -[BKLibraryBookshelfCollectionViewCell setAlpha:](&v4, "setAlpha:");
}

- (BKLibraryBookshelfCellSelectionAccessibilityDelegate)delegate
{
  return (BKLibraryBookshelfCellSelectionAccessibilityDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BSUIAudiobookControl)audiobookControl
{
  return self->_audiobookControl;
}

- (BOOL)isInEditMode
{
  return self->_isInEditMode;
}

- (UIColor)highlightBackgroundColor
{
  return self->_highlightBackgroundColor;
}

- (void)setHighlightBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)pendingTouchUp
{
  return self->_pendingTouchUp;
}

- (void)setPendingTouchUp:(BOOL)a3
{
  self->_pendingTouchUp = a3;
}

- (BOOL)pendingAnimationCompletion
{
  return self->_pendingAnimationCompletion;
}

- (void)setPendingAnimationCompletion:(BOOL)a3
{
  self->_pendingAnimationCompletion = a3;
}

- (UIInteraction)booksLinkEntityInteraction
{
  return self->_booksLinkEntityInteraction;
}

- (void)setBooksLinkEntityInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_booksLinkEntityInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_booksLinkEntityInteraction, 0);
  objc_storeStrong((id *)&self->_highlightBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audiobookControl, 0);
}

@end

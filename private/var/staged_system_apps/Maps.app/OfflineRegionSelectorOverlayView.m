@implementation OfflineRegionSelectorOverlayView

- (OfflineRegionSelectorOverlayView)init
{
  OfflineRegionSelectorOverlayView *v2;
  OfflineRegionSelectorOverlayView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OfflineRegionSelectorOverlayView;
  v2 = -[OfflineRegionSelectorOverlayView init](&v5, "init");
  v3 = v2;
  if (v2)
    -[OfflineRegionSelectorOverlayView _commonInit](v2, "_commonInit");
  return v3;
}

- (OfflineRegionSelectorOverlayView)initWithFrame:(CGRect)a3
{
  OfflineRegionSelectorOverlayView *v3;
  OfflineRegionSelectorOverlayView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OfflineRegionSelectorOverlayView;
  v3 = -[OfflineRegionSelectorOverlayView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[OfflineRegionSelectorOverlayView _commonInit](v3, "_commonInit");
  return v4;
}

- (OfflineRegionSelectorOverlayView)initWithCoder:(id)a3
{
  OfflineRegionSelectorOverlayView *v3;
  OfflineRegionSelectorOverlayView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OfflineRegionSelectorOverlayView;
  v3 = -[OfflineRegionSelectorOverlayView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[OfflineRegionSelectorOverlayView _commonInit](v3, "_commonInit");
  return v4;
}

- (id)offlineRegionSelectorCropHandleToString:(unint64_t)a3
{
  if (a3 > 7)
    return CFSTR("Unknown");
  else
    return *(&off_1011B2320 + a3);
}

- (void)_commonInit
{
  void *v3;
  double left;
  double bottom;
  double right;
  void *v7;
  UIImageView *v8;
  UIImageView *checkerboardImageView;
  double v10;
  void *v11;
  void *v12;
  id v13;
  double y;
  double width;
  UIView *v16;
  UIView *downloadCameraSnapshotView;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  UIView *v22;
  UIView *outlineView;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double height;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  UIView *v37;
  UIView *checkerboardKnockoutMask;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  UIView *v44;
  UIView *downloadCameraSnapshotKnockoutMask;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSMutableDictionary *v51;
  NSMutableDictionary *handleViews;
  id v53;
  id v54;
  uint64_t v55;
  void *i;
  uint64_t v57;
  OfflineRegionSelectorCropHandleView *v58;
  void *v59;
  id v60;
  void *v61;
  NSMutableDictionary *v62;
  void *v63;
  UIImpactFeedbackGenerator *v64;
  UIImpactFeedbackGenerator *hapticGenerator;
  double obja;
  id obj;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("OfflineRegionSelectorCheckerboard")));
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resizableImageWithCapInsets:resizingMode:", 0, UIEdgeInsetsZero.top, left, bottom, right));

  v8 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v7);
  checkerboardImageView = self->_checkerboardImageView;
  self->_checkerboardImageView = v8;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_checkerboardImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setAccessibilityIdentifier:](self->_checkerboardImageView, "setAccessibilityIdentifier:", CFSTR("Checkerboard"));
  -[OfflineRegionSelectorOverlayView addSubview:](self, "addSubview:", self->_checkerboardImageView);
  LODWORD(v10) = 1148846080;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView _maps_constraintsEqualToEdgesOfView:insets:priority:](self->_checkerboardImageView, "_maps_constraintsEqualToEdgesOfView:insets:priority:", self, UIEdgeInsetsZero.top, left, bottom, right, v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

  v13 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  obja = CGRectZero.size.height;
  v16 = (UIView *)objc_msgSend(v13, "initWithFrame:", CGRectZero.origin.x, y, width);
  downloadCameraSnapshotView = self->_downloadCameraSnapshotView;
  self->_downloadCameraSnapshotView = v16;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_downloadCameraSnapshotView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setUserInteractionEnabled:](self->_downloadCameraSnapshotView, "setUserInteractionEnabled:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.300000012));
  -[UIView setBackgroundColor:](self->_downloadCameraSnapshotView, "setBackgroundColor:", v18);

  -[UIView setAlpha:](self->_downloadCameraSnapshotView, "setAlpha:", 0.0);
  -[OfflineRegionSelectorOverlayView addSubview:](self, "addSubview:", self->_downloadCameraSnapshotView);
  LODWORD(v19) = 1148846080;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _maps_constraintsEqualToEdgesOfView:insets:priority:](self->_downloadCameraSnapshotView, "_maps_constraintsEqualToEdgesOfView:insets:priority:", self, UIEdgeInsetsZero.top, left, bottom, right, v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

  v22 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, obja);
  outlineView = self->_outlineView;
  self->_outlineView = v22;

  -[UIView setUserInteractionEnabled:](self->_outlineView, "setUserInteractionEnabled:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_outlineView, "layer"));
  objc_msgSend(v24, "setCornerRadius:", 16.0);

  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  v26 = objc_msgSend(v25, "CGColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_outlineView, "layer"));
  objc_msgSend(v27, "setShadowColor:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_outlineView, "layer"));
  objc_msgSend(v28, "setShadowRadius:", 6.0);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_outlineView, "layer"));
  LODWORD(v30) = 1051931443;
  objc_msgSend(v29, "setShadowOpacity:", v30);

  height = CGSizeZero.height;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_outlineView, "layer"));
  objc_msgSend(v32, "setShadowOffset:", CGSizeZero.width, height);

  v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
  v34 = objc_msgSend(v33, "CGColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_outlineView, "layer"));
  objc_msgSend(v35, "setBorderColor:", v34);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_outlineView, "layer"));
  objc_msgSend(v36, "setBorderWidth:", 3.0);

  -[UIView setAccessibilityIdentifier:](self->_outlineView, "setAccessibilityIdentifier:", CFSTR("OfflineRegionOutline"));
  -[OfflineRegionSelectorOverlayView addSubview:](self, "addSubview:", self->_outlineView);
  v37 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, obja);
  checkerboardKnockoutMask = self->_checkerboardKnockoutMask;
  self->_checkerboardKnockoutMask = v37;

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_checkerboardKnockoutMask, "layer"));
  objc_msgSend(v39, "setCornerRadius:", 16.0);

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  -[UIView setBackgroundColor:](self->_checkerboardKnockoutMask, "setBackgroundColor:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_checkerboardKnockoutMask, "layer"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_checkerboardImageView, "layer"));
  objc_msgSend(v42, "setMask:", v41);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_checkerboardImageView, "layer"));
  objc_msgSend(v43, "setInvertsMask:", 1);

  v44 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, obja);
  downloadCameraSnapshotKnockoutMask = self->_downloadCameraSnapshotKnockoutMask;
  self->_downloadCameraSnapshotKnockoutMask = v44;

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_downloadCameraSnapshotKnockoutMask, "layer"));
  objc_msgSend(v46, "setCornerRadius:", 16.0);

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  -[UIView setBackgroundColor:](self->_downloadCameraSnapshotKnockoutMask, "setBackgroundColor:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_downloadCameraSnapshotKnockoutMask, "layer"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_downloadCameraSnapshotView, "layer"));
  objc_msgSend(v49, "setMask:", v48);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_downloadCameraSnapshotView, "layer"));
  objc_msgSend(v50, "setInvertsMask:", 1);

  v51 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  handleViews = self->_handleViews;
  self->_handleViews = v51;

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[OfflineRegionSelectorCropHandleView allHandles](OfflineRegionSelectorCropHandleView, "allHandles"));
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v54; i = (char *)i + 1)
      {
        if (*(_QWORD *)v69 != v55)
          objc_enumerationMutation(obj);
        v57 = objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i), "unsignedIntValue");
        v58 = -[OfflineRegionSelectorCropHandleView initWithHandle:]([OfflineRegionSelectorCropHandleView alloc], "initWithHandle:", v57);
        -[OfflineRegionSelectorCropHandleView setTranslatesAutoresizingMaskIntoConstraints:](v58, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[OfflineRegionSelectorCropHandleView setAccessibilityIdentifier:](v58, "setAccessibilityIdentifier:", CFSTR("OfflineRegionSelectorCropHandle"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorOverlayView offlineRegionSelectorCropHandleToString:](self, "offlineRegionSelectorCropHandleToString:", v57));
        -[OfflineRegionSelectorCropHandleView setAccessibilityLabel:](v58, "setAccessibilityLabel:", v59);

        v60 = objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", self, "_handlePanGesture:");
        -[OfflineRegionSelectorCropHandleView addGestureRecognizer:](v58, "addGestureRecognizer:", v60);

        -[OfflineRegionSelectorOverlayView addSubview:](self, "addSubview:", v58);
        v61 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorCropHandleView constraintsForHandlePinnedToView:](v58, "constraintsForHandlePinnedToView:", self->_outlineView));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v61);

        v62 = self->_handleViews;
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v57));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v62, "setObject:forKeyedSubscript:", v58, v63);

      }
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
    }
    while (v54);
  }

  v64 = (UIImpactFeedbackGenerator *)objc_msgSend(objc_alloc((Class)UIImpactFeedbackGenerator), "initWithStyle:", 3);
  hapticGenerator = self->_hapticGenerator;
  self->_hapticGenerator = v64;

}

- (void)animateForDownloadWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[5];

  v4 = a3;
  -[UIView setAlpha:](self->_downloadCameraSnapshotView, "setAlpha:", 0.0);
  v7 = v4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10033C9F4;
  v8[3] = &unk_1011AC860;
  v8[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10033CA0C;
  v6[3] = &unk_1011B1EB0;
  v6[4] = self;
  v5 = v4;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v8, v6, 0.3);

}

- (CGRect)selectedRectFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIView frame](self->_outlineView, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setInitialSelectedRect:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  CGRect *p_initialSelectedRect;
  double x;
  double y;
  double width;
  double height;
  CGRect v11;
  CGRect v12;

  v4 = a4;
  p_initialSelectedRect = &self->_initialSelectedRect;
  self->_initialSelectedRect = a3;
  -[OfflineRegionSelectorOverlayView bounds](self, "bounds");
  if (CGRectIsEmpty(v11))
  {
    self->_needsInitialLayout = 1;
  }
  else
  {
    self->_needsInitialLayout = 0;
    -[OfflineRegionSelectorOverlayView _clampedRectFromRect:](self, "_clampedRectFromRect:", p_initialSelectedRect->origin.x, p_initialSelectedRect->origin.y, p_initialSelectedRect->size.width, p_initialSelectedRect->size.height);
    x = v12.origin.x;
    y = v12.origin.y;
    width = v12.size.width;
    height = v12.size.height;
    if (!CGRectEqualToRect(v12, *p_initialSelectedRect))
    {
      x = CGRectGetMidX(*p_initialSelectedRect) - width * 0.5;
      y = CGRectGetMidY(*p_initialSelectedRect) - height * 0.5;
    }
    -[OfflineRegionSelectorOverlayView _setSelectedRect:animated:](self, "_setSelectedRect:animated:", v4, x, y, width, height);
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OfflineRegionSelectorOverlayView;
  -[OfflineRegionSelectorOverlayView layoutSubviews](&v3, "layoutSubviews");
  if (self->_needsInitialLayout && !CGRectIsEmpty(self->_initialSelectedRect))
    -[OfflineRegionSelectorOverlayView setInitialSelectedRect:animated:](self, "setInitialSelectedRect:animated:", 1, self->_initialSelectedRect.origin.x, self->_initialSelectedRect.origin.y, self->_initialSelectedRect.size.width, self->_initialSelectedRect.size.height);
}

- (void)_setSelectedRect:(CGRect)a3
{
  -[OfflineRegionSelectorOverlayView _setSelectedRect:animated:](self, "_setSelectedRect:animated:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_setSelectedRect:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  _QWORD v12[9];

  v4 = a4;
  -[OfflineRegionSelectorOverlayView _clampedRectFromRect:](self, "_clampedRectFromRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10033CD2C;
  v12[3] = &unk_1011AFFE8;
  v12[4] = self;
  v12[5] = v6;
  v12[6] = v7;
  v12[7] = v8;
  v12[8] = v9;
  v10 = objc_retainBlock(v12);
  v11 = v10;
  if (v4)
  {
    -[OfflineRegionSelectorOverlayView frame](self, "frame");
    -[UIView setFrame:](self->_outlineView, "setFrame:");
    -[OfflineRegionSelectorOverlayView frame](self, "frame");
    -[UIView setFrame:](self->_checkerboardKnockoutMask, "setFrame:");
    -[OfflineRegionSelectorOverlayView frame](self, "frame");
    -[UIView setFrame:](self->_downloadCameraSnapshotKnockoutMask, "setFrame:");
    -[OfflineRegionSelectorOverlayView layoutIfNeeded](self, "layoutIfNeeded");
    +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v11, 0, 0.3, 0.0, 0.666666687, 0.0);
  }
  else
  {
    ((void (*)(_QWORD *))v10[2])(v10);
  }

}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double MidX;
  double v13;
  double MidY;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[OfflineRegionSelectorOverlayView bounds](self, "bounds");
  v33.origin.x = v8;
  v33.origin.y = v9;
  v33.size.width = v10;
  v33.size.height = v11;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  if (!CGRectEqualToRect(v25, v33))
  {
    -[UIView frame](self->_outlineView, "frame");
    MidX = CGRectGetMidX(v26);
    -[OfflineRegionSelectorOverlayView bounds](self, "bounds");
    v13 = MidX - CGRectGetMidX(v27);
    -[UIView frame](self->_outlineView, "frame");
    MidY = CGRectGetMidY(v28);
    -[OfflineRegionSelectorOverlayView bounds](self, "bounds");
    v15 = MidY - CGRectGetMidY(v29);
    v24.receiver = self;
    v24.super_class = (Class)OfflineRegionSelectorOverlayView;
    -[OfflineRegionSelectorOverlayView setBounds:](&v24, "setBounds:", x, y, width, height);
    -[UIView frame](self->_outlineView, "frame");
    v17 = v16;
    v19 = v18;
    -[OfflineRegionSelectorOverlayView bounds](self, "bounds");
    v20 = v13 + CGRectGetMidX(v30) - v17 * 0.5;
    -[OfflineRegionSelectorOverlayView bounds](self, "bounds");
    v21 = v15 + CGRectGetMidY(v31) - v19 * 0.5;
    v32.origin.x = v20;
    v32.origin.y = v21;
    v32.size.width = v17;
    v32.size.height = v19;
    if (!CGRectIsEmpty(v32))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorOverlayView regionSelectorDelegate](self, "regionSelectorDelegate"));
      objc_msgSend(v22, "willAdjustSelectedRegion");

      -[OfflineRegionSelectorOverlayView _setSelectedRect:](self, "_setSelectedRect:", v20, v21, v17, v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorOverlayView regionSelectorDelegate](self, "regionSelectorDelegate"));
      objc_msgSend(v23, "didAdjustSelectedRegion");

    }
  }
}

- (CGRect)_clampedRectFromRect:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  double x;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double MinX;
  double v17;
  double MinY;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  double MaxX;
  double v24;
  CGFloat v25;
  CGFloat v26;
  double MaxY;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double rect;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorOverlayView viewportLayoutGuide](self, "viewportLayoutGuide"));
  objc_msgSend(v7, "layoutFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v38.origin.x = x;
  rect = y;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  MinX = CGRectGetMinX(v38);
  v39.origin.x = v9;
  v39.origin.y = v11;
  v39.size.width = v13;
  v39.size.height = v15;
  if (MinX - CGRectGetMinX(v39) < 35.0)
  {
    v40.origin.x = x;
    v40.size.height = height;
    v40.origin.y = rect;
    v40.size.width = width;
    v17 = CGRectGetMinX(v40);
    v41.origin.x = v9;
    v41.origin.y = v11;
    v41.size.width = v13;
    v41.size.height = v15;
    width = width - (CGRectGetMinX(v41) - v17 + 35.0);
    v42.origin.x = v9;
    v42.origin.y = v11;
    v42.size.width = v13;
    v42.size.height = v15;
    x = CGRectGetMinX(v42) + 35.0;
  }
  v43.origin.x = x;
  v43.size.height = height;
  v43.origin.y = rect;
  v43.size.width = width;
  MinY = CGRectGetMinY(v43);
  v44.origin.x = v9;
  v44.origin.y = v11;
  v44.size.width = v13;
  v44.size.height = v15;
  v34 = width;
  v35 = x;
  if (MinY - CGRectGetMinY(v44) >= 35.0)
  {
    v21 = v11;
    v22 = v13;
    v20 = height;
  }
  else
  {
    v45.origin.x = x;
    v45.size.width = width;
    v45.origin.y = rect;
    v45.size.height = height;
    v19 = CGRectGetMinY(v45);
    v46.origin.x = v9;
    v46.origin.y = v11;
    v46.size.width = v13;
    v46.size.height = v15;
    v20 = height - (CGRectGetMinY(v46) - v19 + 35.0);
    v47.origin.x = v9;
    v47.origin.y = v11;
    v47.size.width = v13;
    v47.size.height = v15;
    rect = CGRectGetMinY(v47) + 35.0;
    v21 = v11;
    v22 = v13;
  }
  v48.origin.x = v9;
  v48.origin.y = v21;
  v48.size.width = v22;
  v48.size.height = v15;
  MaxX = CGRectGetMaxX(v48);
  v49.origin.x = v35;
  v49.origin.y = rect;
  v24 = v34;
  v49.size.width = v34;
  v36 = v20;
  v49.size.height = v20;
  v25 = v15;
  v26 = v9;
  if (MaxX - CGRectGetMaxX(v49) < 35.0)
  {
    v50.origin.x = v9;
    v50.origin.y = v21;
    v50.size.width = v22;
    v50.size.height = v25;
    v24 = CGRectGetMaxX(v50) + -35.0 - v35;
  }
  v51.origin.x = v9;
  v51.origin.y = v21;
  v51.size.width = v22;
  v51.size.height = v25;
  MaxY = CGRectGetMaxY(v51);
  v28 = v21;
  v52.size.width = v24;
  v52.origin.x = v35;
  v29 = v36;
  v52.origin.y = rect;
  v52.size.height = v36;
  if (MaxY - CGRectGetMaxY(v52) < 35.0)
  {
    v53.origin.x = v26;
    v53.origin.y = v28;
    v53.size.width = v22;
    v53.size.height = v25;
    v29 = CGRectGetMaxY(v53) + -35.0 - rect;
  }
  if (v24 >= 78.0)
    v30 = v24;
  else
    v30 = 78.0;
  if (v29 >= 78.0)
    v31 = v29;
  else
    v31 = 78.0;
  v32 = v35;
  v33 = rect;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (CGRect)_selectedRectFromHandle:(id)a3 withTranslation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  double v17;
  unint64_t v18;
  double v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  unint64_t v24;
  BOOL v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect result;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[UIView frame](self->_outlineView, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (unint64_t)objc_msgSend(v7, "handle");
  if (v16 <= 5 && ((1 << v16) & 0x31) != 0)
  {
    v17 = v15 - y;
    if (v15 - y >= 78.0)
    {
      v11 = y + v11;
      v15 = v15 - y;
    }
  }
  v18 = (unint64_t)objc_msgSend(v7, "handle", v17);
  if (v18 <= 6 && ((1 << v18) & 0x52) != 0)
  {
    v19 = v13 - x;
    if (v13 - x >= 78.0)
    {
      v9 = x + v9;
      v13 = v13 - x;
    }
  }
  v20 = (unint64_t)objc_msgSend(v7, "handle", v19);
  v21 = -0.0;
  if (((1 << v20) & 0xA8) != 0)
    v22 = x;
  else
    v22 = -0.0;
  if (v20 <= 7)
    v21 = v22;
  v23 = v13 + v21;
  v24 = (unint64_t)objc_msgSend(v7, "handle");
  v25 = (v24 & 0xFFFFFFFFFFFFFFFBLL) == 2 || v24 == 7;
  v26 = -0.0;
  if (v25)
    v26 = y;
  v27 = v15 + v26;

  v28 = v9;
  v29 = v11;
  v30 = v23;
  v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (void)_handlePanGesture:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));
  v5 = objc_opt_class(OfflineRegionSelectorCropHandleView);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v18, "translationInView:", self);
  -[OfflineRegionSelectorOverlayView _selectedRectFromHandle:withTranslation:](self, "_selectedRectFromHandle:withTranslation:", v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[OfflineRegionSelectorOverlayView _setSelectedRect:](self, "_setSelectedRect:", v9, v11, v13, v15);
  objc_msgSend(v18, "setTranslation:inView:", self, CGPointZero.x, CGPointZero.y);
  if (objc_msgSend(v18, "state") == (id)1)
  {
    -[UIImpactFeedbackGenerator impactOccurred](self->_hapticGenerator, "impactOccurred");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorOverlayView regionSelectorDelegate](self, "regionSelectorDelegate"));
    objc_msgSend(v16, "willAdjustSelectedRegion");
LABEL_9:

    goto LABEL_10;
  }
  if (objc_msgSend(v18, "state") == (id)3 || objc_msgSend(v18, "state") == (id)4)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorOverlayView regionSelectorDelegate](self, "regionSelectorDelegate"));
    objc_msgSend(v17, "didAdjustSelectedRegion");

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorOverlayView regionSelectorDelegate](self, "regionSelectorDelegate"));
    objc_msgSend(v16, "didAdjustSelectorCropHandle");
    goto LABEL_9;
  }
LABEL_10:

}

- (OfflineRegionSelectorActionCoordination)regionSelectorDelegate
{
  return (OfflineRegionSelectorActionCoordination *)objc_loadWeakRetained((id *)&self->_regionSelectorDelegate);
}

- (void)setRegionSelectorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_regionSelectorDelegate, a3);
}

- (UILayoutGuide)viewportLayoutGuide
{
  return self->_viewportLayoutGuide;
}

- (void)setViewportLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_viewportLayoutGuide, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportLayoutGuide, 0);
  objc_destroyWeak((id *)&self->_regionSelectorDelegate);
  objc_storeStrong((id *)&self->_hapticGenerator, 0);
  objc_storeStrong((id *)&self->_handleViews, 0);
  objc_storeStrong((id *)&self->_downloadCameraSnapshotKnockoutMask, 0);
  objc_storeStrong((id *)&self->_checkerboardKnockoutMask, 0);
  objc_storeStrong((id *)&self->_outlineView, 0);
  objc_storeStrong((id *)&self->_downloadCameraSnapshotView, 0);
  objc_storeStrong((id *)&self->_checkerboardImageView, 0);
}

@end

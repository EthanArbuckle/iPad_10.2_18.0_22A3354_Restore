@implementation BKBookContainerView

- (void)_commonInit
{
  id v3;

  -[BKBookContainerView _setupGestureRecognizers](self, "_setupGestureRecognizers");
  -[BKBookContainerView setExclusiveTouch:](self, "setExclusiveTouch:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  self->_usePageCurlAnimation = objc_msgSend(v3, "BOOLForKey:", CFSTR("BKUseLegacyCurlAnimation"));

}

- (BKBookContainerView)initWithFrame:(CGRect)a3
{
  BKBookContainerView *v3;
  BKBookContainerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKBookContainerView;
  v3 = -[BKBookContainerView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[BKBookContainerView _commonInit](v3, "_commonInit");
  return v4;
}

- (BKBookContainerView)initWithCoder:(id)a3
{
  BKBookContainerView *v3;
  BKBookContainerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKBookContainerView;
  v3 = -[BKBookContainerView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[BKBookContainerView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[UITapGestureRecognizer setDelegate:](self->_leftTapRecognizer, "setDelegate:", 0);
  -[UITapGestureRecognizer removeTarget:action:](self->_leftTapRecognizer, "removeTarget:action:", 0, 0);
  -[UITapGestureRecognizer setDelegate:](self->_rightTapRecognizer, "setDelegate:", 0);
  -[UITapGestureRecognizer removeTarget:action:](self->_rightTapRecognizer, "removeTarget:action:", 0, 0);
  -[BKPanGestureRecognizer setDelegate:](self->_manualCurlRecognizer, "setDelegate:", 0);
  -[BKPanGestureRecognizer removeTarget:action:](self->_manualCurlRecognizer, "removeTarget:action:", 0, 0);
  -[BKIndirectPanGestureRecognizer setDelegate:](self->_indirectManualCurlRecognizer, "setDelegate:", 0);
  -[BKIndirectPanGestureRecognizer removeTarget:action:](self->_indirectManualCurlRecognizer, "removeTarget:action:", 0, 0);
  -[BKSwipeGestureRecognizer setDelegate:](self->_previousPageSwipeRecognizer, "setDelegate:", 0);
  -[BKSwipeGestureRecognizer removeTarget:action:](self->_previousPageSwipeRecognizer, "removeTarget:action:", 0, 0);
  -[BKSwipeGestureRecognizer setDelegate:](self->_nextPageSwipeRecognizer, "setDelegate:", 0);
  -[BKSwipeGestureRecognizer removeTarget:action:](self->_nextPageSwipeRecognizer, "removeTarget:action:", 0, 0);
  -[BKSwipeGestureRecognizer setDelegate:](self->_previousChapterSwipeRecognizer, "setDelegate:", 0);
  -[BKSwipeGestureRecognizer removeTarget:action:](self->_previousChapterSwipeRecognizer, "removeTarget:action:", 0, 0);
  -[BKSwipeGestureRecognizer setDelegate:](self->_nextChapterSwipeRecognizer, "setDelegate:", 0);
  -[BKSwipeGestureRecognizer removeTarget:action:](self->_nextChapterSwipeRecognizer, "removeTarget:action:", 0, 0);
  -[NSTimer invalidate](self->_cancelLeftTapTimer, "invalidate");
  -[NSTimer invalidate](self->_cancelRightTapTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKBookContainerView;
  -[BKBookContainerView dealloc](&v3, "dealloc");
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BKBookContainerView;
  -[BKBookContainerView layoutSubviews](&v2, "layoutSubviews");
}

- (void)_setupGestureRecognizers
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *leftTapRecognizer;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *rightTapRecognizer;
  BKIndirectPanGestureRecognizer *v7;
  BKIndirectPanGestureRecognizer *indirectManualCurlRecognizer;
  BKPanGestureRecognizer *v9;
  BKPanGestureRecognizer *manualCurlRecognizer;
  BKSwipeGestureRecognizer *v11;
  BKSwipeGestureRecognizer *previousPageSwipeRecognizer;
  BKSwipeGestureRecognizer *v13;
  BKSwipeGestureRecognizer *nextPageSwipeRecognizer;
  BKSwipeGestureRecognizer *v15;
  BKSwipeGestureRecognizer *previousChapterSwipeRecognizer;
  BKSwipeGestureRecognizer *v17;
  BKSwipeGestureRecognizer *nextChapterSwipeRecognizer;

  if (!self->_leftTapRecognizer)
  {
    v3 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "tapGesture:");
    leftTapRecognizer = self->_leftTapRecognizer;
    self->_leftTapRecognizer = v3;

    -[UITapGestureRecognizer setDelegate:](self->_leftTapRecognizer, "setDelegate:", self);
    -[UITapGestureRecognizer setCancelsTouchesInView:](self->_leftTapRecognizer, "setCancelsTouchesInView:", 0);
    -[BKBookContainerView addGestureRecognizer:](self, "addGestureRecognizer:", self->_leftTapRecognizer);
  }
  if (!self->_rightTapRecognizer)
  {
    v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "tapGesture:");
    rightTapRecognizer = self->_rightTapRecognizer;
    self->_rightTapRecognizer = v5;

    -[UITapGestureRecognizer setDelegate:](self->_rightTapRecognizer, "setDelegate:", self);
    -[UITapGestureRecognizer setCancelsTouchesInView:](self->_rightTapRecognizer, "setCancelsTouchesInView:", 0);
    -[BKBookContainerView addGestureRecognizer:](self, "addGestureRecognizer:", self->_rightTapRecognizer);
  }
  if (!self->_indirectManualCurlRecognizer)
  {
    v7 = -[BKIndirectPanGestureRecognizer initWithTarget:action:]([BKIndirectPanGestureRecognizer alloc], "initWithTarget:action:", self, "manualCurlGesture:");
    indirectManualCurlRecognizer = self->_indirectManualCurlRecognizer;
    self->_indirectManualCurlRecognizer = v7;

    -[BKIndirectPanGestureRecognizer setAllowedTouchTypes:](self->_indirectManualCurlRecognizer, "setAllowedTouchTypes:", &off_1CD5B8);
    -[BKIndirectPanGestureRecognizer setAllowedScrollTypesMask:](self->_indirectManualCurlRecognizer, "setAllowedScrollTypesMask:", 3);
    -[BKIndirectPanGestureRecognizer setDelegate:](self->_indirectManualCurlRecognizer, "setDelegate:", self);
    -[BKIndirectPanGestureRecognizer setCancelsTouchesInView:](self->_indirectManualCurlRecognizer, "setCancelsTouchesInView:", 0);
    -[BKBookContainerView addGestureRecognizer:](self, "addGestureRecognizer:", self->_indirectManualCurlRecognizer);
  }
  if (!self->_manualCurlRecognizer)
  {
    v9 = -[BKPanGestureRecognizer initWithTarget:action:]([BKPanGestureRecognizer alloc], "initWithTarget:action:", self, "manualCurlGesture:");
    manualCurlRecognizer = self->_manualCurlRecognizer;
    self->_manualCurlRecognizer = v9;

    -[BKPanGestureRecognizer setAllowedTouchTypes:](self->_manualCurlRecognizer, "setAllowedTouchTypes:", &off_1CD5D0);
    -[BKPanGestureRecognizer setDelegate:](self->_manualCurlRecognizer, "setDelegate:", self);
    -[BKPanGestureRecognizer setCancelsTouchesInView:](self->_manualCurlRecognizer, "setCancelsTouchesInView:", 0);
    -[BKPanGestureRecognizer setAllowedScrollTypesMask:](self->_manualCurlRecognizer, "setAllowedScrollTypesMask:", 3);
    -[BKPanGestureRecognizer requireGestureRecognizerToFail:](self->_manualCurlRecognizer, "requireGestureRecognizerToFail:", self->_indirectManualCurlRecognizer);
    -[BKBookContainerView addGestureRecognizer:](self, "addGestureRecognizer:", self->_manualCurlRecognizer);
  }
  if (!self->_previousPageSwipeRecognizer)
  {
    v11 = (BKSwipeGestureRecognizer *)objc_msgSend(objc_alloc((Class)BKSwipeGestureRecognizer), "initWithTarget:action:", self, "leftPageGesture:");
    previousPageSwipeRecognizer = self->_previousPageSwipeRecognizer;
    self->_previousPageSwipeRecognizer = v11;

    -[BKSwipeGestureRecognizer setAllowedTouchTypes:](self->_previousPageSwipeRecognizer, "setAllowedTouchTypes:", &off_1CD5E8);
    -[BKSwipeGestureRecognizer setDelegate:](self->_previousPageSwipeRecognizer, "setDelegate:", self);
    -[BKSwipeGestureRecognizer setDirection:](self->_previousPageSwipeRecognizer, "setDirection:", 1);
    -[BKSwipeGestureRecognizer setCancelsTouchesInView:](self->_previousPageSwipeRecognizer, "setCancelsTouchesInView:", 0);
    -[BKSwipeGestureRecognizer setNumberOfTouchesRequired:](self->_previousPageSwipeRecognizer, "setNumberOfTouchesRequired:", 1);
    -[BKBookContainerView addGestureRecognizer:](self, "addGestureRecognizer:", self->_previousPageSwipeRecognizer);
  }
  if (!self->_nextPageSwipeRecognizer)
  {
    v13 = (BKSwipeGestureRecognizer *)objc_msgSend(objc_alloc((Class)BKSwipeGestureRecognizer), "initWithTarget:action:", self, "rightPageGesture:");
    nextPageSwipeRecognizer = self->_nextPageSwipeRecognizer;
    self->_nextPageSwipeRecognizer = v13;

    -[BKSwipeGestureRecognizer setAllowedTouchTypes:](self->_nextPageSwipeRecognizer, "setAllowedTouchTypes:", &off_1CD600);
    -[BKSwipeGestureRecognizer setDelegate:](self->_nextPageSwipeRecognizer, "setDelegate:", self);
    -[BKSwipeGestureRecognizer setDirection:](self->_nextPageSwipeRecognizer, "setDirection:", 2);
    -[BKSwipeGestureRecognizer setCancelsTouchesInView:](self->_nextPageSwipeRecognizer, "setCancelsTouchesInView:", 0);
    -[BKSwipeGestureRecognizer setNumberOfTouchesRequired:](self->_nextPageSwipeRecognizer, "setNumberOfTouchesRequired:", 1);
    -[BKBookContainerView addGestureRecognizer:](self, "addGestureRecognizer:", self->_nextPageSwipeRecognizer);
  }
  if (!self->_previousChapterSwipeRecognizer)
  {
    v15 = (BKSwipeGestureRecognizer *)objc_msgSend(objc_alloc((Class)BKSwipeGestureRecognizer), "initWithTarget:action:", self, "leftChapterGesture:");
    previousChapterSwipeRecognizer = self->_previousChapterSwipeRecognizer;
    self->_previousChapterSwipeRecognizer = v15;

    -[BKSwipeGestureRecognizer setAllowedTouchTypes:](self->_previousChapterSwipeRecognizer, "setAllowedTouchTypes:", &off_1CD618);
    -[BKSwipeGestureRecognizer setDelegate:](self->_previousChapterSwipeRecognizer, "setDelegate:", self);
    -[BKSwipeGestureRecognizer setDirection:](self->_previousChapterSwipeRecognizer, "setDirection:", 1);
    -[BKSwipeGestureRecognizer setCancelsTouchesInView:](self->_previousChapterSwipeRecognizer, "setCancelsTouchesInView:", 0);
    -[BKSwipeGestureRecognizer setNumberOfTouchesRequired:](self->_previousChapterSwipeRecognizer, "setNumberOfTouchesRequired:", 3);
    -[BKBookContainerView addGestureRecognizer:](self, "addGestureRecognizer:", self->_previousChapterSwipeRecognizer);
  }
  if (!self->_nextChapterSwipeRecognizer)
  {
    v17 = (BKSwipeGestureRecognizer *)objc_msgSend(objc_alloc((Class)BKSwipeGestureRecognizer), "initWithTarget:action:", self, "rightChapterGesture:");
    nextChapterSwipeRecognizer = self->_nextChapterSwipeRecognizer;
    self->_nextChapterSwipeRecognizer = v17;

    -[BKSwipeGestureRecognizer setAllowedTouchTypes:](self->_nextChapterSwipeRecognizer, "setAllowedTouchTypes:", &off_1CD630);
    -[BKSwipeGestureRecognizer setDelegate:](self->_nextChapterSwipeRecognizer, "setDelegate:", self);
    -[BKSwipeGestureRecognizer setDirection:](self->_nextChapterSwipeRecognizer, "setDirection:", 2);
    -[BKSwipeGestureRecognizer setCancelsTouchesInView:](self->_nextChapterSwipeRecognizer, "setCancelsTouchesInView:", 0);
    -[BKSwipeGestureRecognizer setNumberOfTouchesRequired:](self->_nextChapterSwipeRecognizer, "setNumberOfTouchesRequired:", 3);
    -[BKBookContainerView addGestureRecognizer:](self, "addGestureRecognizer:", self->_nextChapterSwipeRecognizer);
  }
  -[BKBookContainerView setInternalGestureRecognizersSet:](self, "setInternalGestureRecognizersSet:", 1);
}

- (void)manualCurlFinished:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id manualCurl;
  int v8;
  id v9;

  v4 = a3;
  v5 = _AESwipeLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Finished manual curl: %@", (uint8_t *)&v8, 0xCu);
  }

  self->_finishingManualCurl = 0;
  self->_trackingManualCurl = 0;
  manualCurl = self->_manualCurl;
  self->_manualCurl = 0;

  -[BKBookContainerView _turnPendingPagesAfterFinishing](self, "_turnPendingPagesAfterFinishing");
}

- (void)_turnPendingPagesAfterFinishing
{
  int64_t pagesToTurnAfterFinishing;
  int64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  pagesToTurnAfterFinishing = self->_pagesToTurnAfterFinishing;
  if (pagesToTurnAfterFinishing)
  {
    v4 = 0;
    if (pagesToTurnAfterFinishing < 0)
    {
      do
      {
        v8 = _AESwipeLog();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Swiping Direction Reverse after delay", buf, 2u);
        }

        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
        objc_msgSend(v10, "bookContainerView:turnPages:", self, 1);

        --v4;
      }
      while (self->_pagesToTurnAfterFinishing < v4);
    }
    else
    {
      do
      {
        v5 = _AESwipeLog();
        v6 = objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Swiping Direction Forward after delay", v11, 2u);
        }

        v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
        objc_msgSend(v7, "bookContainerView:turnPages:", self, 0);

        ++v4;
      }
      while (self->_pagesToTurnAfterFinishing > v4);
    }
    self->_pagesToTurnAfterFinishing = 0;
  }
}

- (void)setSpineLocation:(int64_t)a3
{
  BKPanGestureRecognizer **p_manualCurlRecognizer;
  double v5;
  double v6;

  self->_spineLocation = a3;
  if (a3 == 2)
  {
    p_manualCurlRecognizer = &self->_manualCurlRecognizer;
    v5 = 20.0;
    -[BKPanGestureRecognizer setLeftSideMovementThreshold:](self->_manualCurlRecognizer, "setLeftSideMovementThreshold:", 20.0);
  }
  else
  {
    v5 = 100.0;
    if (a3 == 3)
      v6 = 20.0;
    else
      v6 = 100.0;
    p_manualCurlRecognizer = &self->_manualCurlRecognizer;
    -[BKPanGestureRecognizer setLeftSideMovementThreshold:](self->_manualCurlRecognizer, "setLeftSideMovementThreshold:", v6);
    if (self->_spineLocation != 3)
      v5 = 20.0;
  }
  -[BKPanGestureRecognizer setRightSideMovementThreshold:](*p_manualCurlRecognizer, "setRightSideMovementThreshold:", v5);
}

- (BOOL)inManualCurl
{
  return self->_manualCurl != 0;
}

- (BOOL)unhandledClickAtPoint:(CGPoint)a3
{
  unsigned int v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  BKBookContainerView *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;

  v4 = -[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:", a3.x, a3.y);
  switch(v4)
  {
    case 3u:
      goto LABEL_7;
    case 2u:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
      v12 = objc_msgSend(v11, "bookContainerViewShouldTurnPage:", self);

      if (!v12)
        return 0;
LABEL_7:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
      v8 = v7;
      v9 = self;
      v10 = 0;
      goto LABEL_8;
    case 1u:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
      v6 = objc_msgSend(v5, "bookContainerViewShouldTurnPage:", self);

      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
        v8 = v7;
        v9 = self;
        v10 = 1;
LABEL_8:
        objc_msgSend(v7, "bookContainerView:tapToTurnPages:", v9, v10);

        return 1;
      }
      break;
  }
  return 0;
}

- (void)killCurl
{
  id v3;
  NSObject *v4;
  id manualCurl;
  void *v6;
  int v7;
  id v8;

  if (self->_manualCurl)
  {
    v3 = _AESwipeLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      manualCurl = self->_manualCurl;
      v7 = 138412290;
      v8 = manualCurl;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Killing curl: %@", (uint8_t *)&v7, 0xCu);
    }

    self->_trackingManualCurl = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
    objc_msgSend(v6, "bookContainerView:cancelManualCurl:", self, self->_manualCurl);

    -[BKPanGestureRecognizer cancelRecognizing](self->_manualCurlRecognizer, "cancelRecognizing");
    -[BKIndirectPanGestureRecognizer setState:](self->_indirectManualCurlRecognizer, "setState:", 4);
  }
}

- (int)_tapLocationForTouchLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  CGFloat v25;
  double v26;
  int v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  double MinY;
  double v35;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGPoint v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  y = a3.y;
  x = a3.x;
  v6 = -[BKBookContainerView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = isPad(v6, v15);
  if ((_DWORD)v16)
  {
    v16 = isPortrait(v16);
    v18 = 70.0;
    if (!(_DWORD)v16)
      v18 = 30.0;
    v37 = *(_QWORD *)&v18;
  }
  else
  {
    v37 = 0x4054000000000000;
  }
  v19 = isPad(v16, v17);
  if ((_DWORD)v19)
  {
    v20 = (id)isPortrait(v19);
    v22 = 50.0;
    if ((_DWORD)v20)
      v22 = 70.0;
  }
  else
  {
    v20 = -[BKBookContainerView safeAreaInsets](self, "safeAreaInsets");
    v22 = v23 + 44.0;
  }
  v40 = v22;
  v24 = isPad(v20, v21);
  v41 = y;
  v25 = v10;
  v26 = x;
  if ((_DWORD)v24)
  {
    v27 = isPortrait(v24);
    v28 = 82.0;
    if (v27)
      v28 = 110.0;
    v39 = v28;
  }
  else
  {
    v39 = 80.0;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate", v37));
  objc_msgSend(v29, "bookmarkHotspotDimensionForBookContainerView:", self);
  v31 = v30;

  v43.origin.x = v8;
  v43.origin.y = v10;
  v43.size.width = v12;
  v43.size.height = v14;
  v32 = v8;
  v33 = CGRectGetMaxX(v43) - v31;
  v44.origin.x = v32;
  v44.origin.y = v25;
  v44.size.width = v12;
  v44.size.height = v14;
  MinY = CGRectGetMinY(v44);
  -[BKBookContainerView safeAreaInsets](self, "safeAreaInsets");
  v45.origin.y = MinY + v35;
  v45.origin.x = v33;
  v45.size.width = v31;
  v45.size.height = v31;
  v42.x = v26;
  v42.y = v41;
  if (CGRectContainsPoint(v45, v42))
    return 3;
  v46.origin.x = v32;
  v46.origin.y = v25;
  v46.size.width = v12;
  v46.size.height = v14;
  if (v41 < v40 + CGRectGetMinY(v46))
  {
    v47.origin.x = v32;
    v47.origin.y = v25;
    v47.size.width = v12;
    v47.size.height = v14;
    if (v26 < CGRectGetMaxX(v47) - v38)
    {
      v48.origin.x = v32;
      v48.origin.y = v25;
      v48.size.width = v12;
      v48.size.height = v14;
      if (v26 > v38 + CGRectGetMinX(v48))
        return 0;
    }
  }
  v49.origin.x = v32;
  v49.origin.y = v25;
  v49.size.width = v12;
  v49.size.height = v14;
  if (v26 > CGRectGetMaxX(v49) - v39)
    return 2;
  v50.origin.x = v32;
  v50.origin.y = v25;
  v50.size.width = v12;
  v50.size.height = v14;
  return v26 < v39 + CGRectGetMinX(v50);
}

- (BOOL)_tapLocationIsInTextOverlapArea:(CGPoint)a3
{
  double y;
  double x;
  void *v7;
  BOOL v8;
  CGPoint v9;
  CGRect v10;

  y = a3.y;
  x = a3.x;
  if ((isPad(self, a2) & 1) != 0
    || -[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:", x, y)
     - 4 < 0xFFFFFFFD)
  {
    return 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
  objc_msgSend(v7, "pageContentBoundsForBookContainerView:", self);
  v9.x = x;
  v9.y = y;
  v8 = CGRectContainsPoint(v10, v9);

  return v8;
}

- (void)tapGesture:(id)a3
{
  UITapGestureRecognizer *v4;
  unsigned __int8 v5;
  NSTimer *cancelRightTapTimer;
  NSTimer *cancelLeftTapTimer;
  UITapGestureRecognizer *v8;
  UITapGestureRecognizer *v9;

  v4 = (UITapGestureRecognizer *)a3;
  if (v4 && !self->_manualCurl)
  {
    if (!self->_cancelLeftTap && self->_leftTapRecognizer == v4)
    {
      v9 = v4;
      -[UITapGestureRecognizer locationInView:](v4, "locationInView:", self);
      v5 = -[BKBookContainerView unhandledClickAtPoint:](self, "unhandledClickAtPoint:");
      -[NSTimer invalidate](self->_cancelLeftTapTimer, "invalidate");
      cancelLeftTapTimer = self->_cancelLeftTapTimer;
      self->_cancelLeftTapTimer = 0;

      v4 = v9;
    }
    else
    {
      v5 = 0;
    }
    if (!self->_cancelRightTap && self->_rightTapRecognizer == v4)
    {
      v8 = v4;
      if ((v5 & 1) == 0)
      {
        -[UITapGestureRecognizer locationInView:](v4, "locationInView:", self);
        -[BKBookContainerView unhandledClickAtPoint:](self, "unhandledClickAtPoint:");
      }
      -[NSTimer invalidate](self->_cancelRightTapTimer, "invalidate");
      cancelRightTapTimer = self->_cancelRightTapTimer;
      self->_cancelRightTapTimer = 0;

      v4 = v8;
    }
  }

}

- (CGPoint)_startLocationInViewWithGesture:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  v4 = a3;
  if ((objc_opt_respondsToSelector(v4, "startLocationInView:") & 1) != 0)
    objc_msgSend(v4, "startLocationInView:", self);
  else
    objc_msgSend(v4, "locationInView:", self);
  v7 = v5;
  v8 = v6;

  v9 = v7;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (void)_startedManualCurlAnimation:(id)a3 isRightSide:(BOOL)a4
{
  id *p_manualCurl;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  p_manualCurl = &self->_manualCurl;
  objc_storeStrong(&self->_manualCurl, a3);
  self->_manualCurlIsRightSide = a4;
  if (*p_manualCurl && self->_swipeBeforeManualCurl)
  {
    v7 = _AESwipeLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "started so not swiping", v9, 2u);
    }

    self->_swipeBeforeManualCurl = 0;
  }
}

- (void)manualCurlGesture:(id)a3
{
  BKIndirectPanGestureRecognizer *v4;
  id v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  NSObject *v18;
  NSString *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  _BOOL4 v24;
  _BOOL4 trackingManualCurl;
  _BOOL4 swipeBeforeManualCurl;
  id v27;
  NSObject *v28;
  BOOL v29;
  void *v30;
  void *v31;
  int64_t swipeDirection;
  CGPoint *p_startPoint;
  CGFloat v34;
  CGFloat v35;
  id v36;
  NSObject *v37;
  NSString *v38;
  void *v39;
  unsigned int v40;
  BOOL *p_trackingManualCurl;
  id v42;
  NSObject *v43;
  unsigned int v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  const __CFString *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGPoint *p_lastPoint;
  unsigned int v59;
  double x;
  double y;
  double v62;
  id v63;
  NSString *v64;
  void *v65;
  id manualCurl;
  _BOOL8 v67;
  double v68;
  double v69;
  double v70;
  double v71;
  float v72;
  id v73;
  NSObject *v74;
  void *v75;
  void *v76;
  double v77;
  id v78;
  NSObject *v79;
  const __CFString *v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  id v85;
  NSObject *v86;
  void *v87;
  id v88;
  NSObject *v89;
  void *v90;
  double v91;
  id v92;
  id v93;
  double v94;
  double v95;
  double v96;
  double v97;
  unsigned int v98;
  double v99;
  _BOOL4 v100;
  double v101;
  _BOOL4 v102;
  double v103;
  double v104;
  double v105;
  _BOOL4 v106;
  _BOOL4 v107;
  double v108;
  _BOOL4 v109;
  unsigned int v110;
  double v112;
  double v113;
  double v114;
  _BOOL4 v115;
  id v116;
  _BOOL4 v117;
  void *v118;
  void *v119;
  _QWORD v120[2];
  _QWORD v121[2];
  _QWORD v122[4];
  id v123;
  BOOL v124;
  _QWORD v125[2];
  uint8_t buf[4];
  _BYTE v127[10];
  void *v128;
  CGPoint v129;
  CGPoint v130;
  CGRect v131;
  CGRect v132;

  v4 = (BKIndirectPanGestureRecognizer *)a3;
  if (-[BKBookContainerView ignoreNextGesture](self, "ignoreNextGesture"))
  {
    v5 = _AESwipeLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Ignoring gesture for manual curl", buf, 2u);
    }
LABEL_4:

    goto LABEL_5;
  }
  if (-[BKIndirectPanGestureRecognizer state](v4, "state") != (char *)&dword_0 + 1)
  {
    if (-[BKIndirectPanGestureRecognizer state](v4, "state") == (char *)&dword_0 + 2)
    {
      if (self->_finishingManualCurl || !self->_manualCurl && self->_indirectManualCurlRecognizer != v4)
        goto LABEL_5;
      -[BKIndirectPanGestureRecognizer locationInView:](v4, "locationInView:", self);
      v14 = v13;
      v16 = v15;
      if (self->_indirectManualCurlRecognizer == v4)
      {
        -[BKIndirectPanGestureRecognizer translationInView:](v4, "translationInView:", self);
        v69 = v68;
        v71 = v70;
        -[BKBookContainerView bounds](self, "bounds");
        v72 = CGRectGetWidth(v131) * 0.05;
        if (fabs(v69) < fmaxf(fminf(v72, 10.0), 3.0))
        {
          v73 = _AESwipeLog();
          v74 = objc_claimAutoreleasedReturnValue(v73);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            *(double *)v121 = v14;
            *(double *)&v121[1] = v16;
            v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v121, "{CGPoint=dd}"));
            *(double *)v120 = v69;
            *(double *)&v120[1] = v71;
            v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v120, "{CGPoint=dd}"));
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v127 = v75;
            *(_WORD *)&v127[8] = 2112;
            v128 = v76;
            _os_log_impl(&dword_0, v74, OS_LOG_TYPE_DEFAULT, "indirect translation/location was insufficient to update curl location:%@ translation:%@", buf, 0x16u);

          }
          goto LABEL_5;
        }
        if (!self->_manualCurl)
          -[BKBookContainerView _setupManualCurlForIndirectRecognizerForTranslation:](self, "_setupManualCurlForIndirectRecognizerForTranslation:", v69, v71);
        if (self->_manualCurlIsRightSide)
        {
          -[BKBookContainerView bounds](self, "bounds");
          v84 = v83;
        }
        else
        {
          v84 = 0.0;
        }
        -[BKBookContainerView bounds](self, "bounds");
        if (self->_manualCurlIsRightSide && v69 > 0.0)
        {
          v92 = _AESwipeLog();
          v6 = objc_claimAutoreleasedReturnValue(v92);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Swiping left, capping right translation", buf, 2u);
          }
          goto LABEL_4;
        }
        if (!self->_manualCurlIsRightSide && v69 < 0.0)
        {
          v93 = _AESwipeLog();
          v6 = objc_claimAutoreleasedReturnValue(v93);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Swiping right, capping left translation", buf, 2u);
          }
          goto LABEL_4;
        }
        v14 = v69 + v84;
        v16 = v71 + v91 * 0.5;
      }
      v17 = _AESwipeLog();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v129.x = v14;
        v129.y = v16;
        v19 = NSStringFromCGPoint(v129);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v127 = v20;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Update toLocation:%@", buf, 0xCu);

      }
      kdebug_trace(725353248, (unint64_t)(v14 * 100.0), (unint64_t)(v16 * 100.0), 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
      objc_msgSend(v21, "bookContainerView:updateManualCurl:toLocation:", self, self->_manualCurl, v14, v16);

      goto LABEL_5;
    }
    if (-[BKIndirectPanGestureRecognizer state](v4, "state") != (char *)&dword_0 + 3
      && -[BKIndirectPanGestureRecognizer state](v4, "state") != &dword_4
      && -[BKIndirectPanGestureRecognizer state](v4, "state") != (char *)&dword_4 + 1)
    {
      goto LABEL_5;
    }
    v22 = _AESwipeLog();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_manualCurl != 0;
      trackingManualCurl = self->_trackingManualCurl;
      swipeBeforeManualCurl = self->_swipeBeforeManualCurl;
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v127 = v24;
      *(_WORD *)&v127[4] = 1024;
      *(_DWORD *)&v127[6] = trackingManualCurl;
      LOWORD(v128) = 1024;
      *(_DWORD *)((char *)&v128 + 2) = swipeBeforeManualCurl;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Ended curl gesture.  Have manual Curl? %d. tracking? %d. _swipeBeforeManual? %d", buf, 0x14u);
    }

    if (self->_swipeBeforeManualCurl)
    {
      v27 = _AESwipeLog();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "swiping before curl", buf, 2u);
      }

      self->_swipeBeforeManualCurl = 0;
      self->_trackingManualCurl = 0;
      if (-[BKIndirectPanGestureRecognizer state](v4, "state") == (char *)&dword_0 + 3)
      {
        v29 = !self->_chapterTurn;
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
        v31 = v30;
        swipeDirection = self->_swipeDirection;
        if (v29)
          objc_msgSend(v30, "bookContainerView:turnPages:", self, swipeDirection);
        else
          objc_msgSend(v30, "bookContainerView:turnChapter:", self, swipeDirection);

      }
      goto LABEL_5;
    }
    if (self->_startedWhilePreviousFinishing)
    {
      v42 = _AESwipeLog();
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "Started another curl while previous was finishing", buf, 2u);
      }

      self->_startedWhilePreviousFinishing = 0;
      v44 = -[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:", self->_startPoint.x, self->_startPoint.y);
      if (v44 == 1)
        v45 = -1;
      else
        v45 = 0;
      if (v44 == 2)
        v45 = 1;
      self->_pagesToTurnAfterFinishing += v45;
      if (!self->_finishingManualCurl)
      {
        v46 = _AESwipeLog();
        v47 = objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v47, OS_LOG_TYPE_DEFAULT, "finished curl before ending previous curl", buf, 2u);
        }

        if (self->_pagesToTurnAfterFinishing)
        {
          -[BKBookContainerView _turnPendingPagesAfterFinishing](self, "_turnPendingPagesAfterFinishing");
        }
        else
        {
          v90 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
          objc_msgSend(v90, "bookContainerView:cancelManualCurl:", self, self->_manualCurl);

        }
      }
      goto LABEL_5;
    }
    manualCurl = self->_manualCurl;
    if (!self->_trackingManualCurl)
    {
      if (!manualCurl)
        goto LABEL_5;
      v85 = _AESwipeLog();
      v86 = objc_claimAutoreleasedReturnValue(v85);
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v86, OS_LOG_TYPE_ERROR, "Not tracking but we have a manual curl, cancelling", buf, 2u);
      }
      goto LABEL_95;
    }
    if (!manualCurl)
    {
      v88 = _AESwipeLog();
      v89 = objc_claimAutoreleasedReturnValue(v88);
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v89, OS_LOG_TYPE_ERROR, "Tracking a manual curl but no manual curl created when gesture recognizer hit an ending state. No longer tracking manual curl", buf, 2u);
      }

      self->_trackingManualCurl = 0;
      goto LABEL_5;
    }
    if ((BKIndirectPanGestureRecognizer *)self->_manualCurlRecognizer == v4)
    {
      -[BKIndirectPanGestureRecognizer locationInView:](v4, "locationInView:", self);
      v95 = v94;
      v97 = v96;
      v98 = -[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:", self->_startPoint.x, self->_startPoint.y);
      -[BKBookContainerView bounds](self, "bounds");
      v100 = v98 == 2 && v99 * 0.5 > v95;
      -[BKBookContainerView bounds](self, "bounds", v99 * 0.5);
      v102 = v98 == 1 && v101 * 0.5 < v95;
      -[BKIndirectPanGestureRecognizer velocityInView:](v4, "velocityInView:", self, v101 * 0.5);
      v105 = v104;
      v106 = v103 > 300.0 && v98 == 1;
      v107 = v103 < -300.0 && v98 == 2;
      if (v106 || v107 || v102 || v100)
      {
        v67 = 1;
        goto LABEL_145;
      }
      v110 = -[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:", v95, v97);
      if (v110)
      {
        v67 = v105 > 300.0 && v110 == v98;
        goto LABEL_145;
      }
    }
    else if (self->_indirectManualCurlRecognizer == v4)
    {
      -[BKIndirectPanGestureRecognizer velocityInView:](v4, "velocityInView:", self);
      v109 = v108 > 300.0 && !self->_manualCurlIsRightSide || v108 < -300.0 && self->_manualCurlIsRightSide;
      -[BKIndirectPanGestureRecognizer translationInView:](v4, "translationInView:", self);
      v113 = v112;
      -[BKBookContainerView bounds](self, "bounds");
      v114 = CGRectGetWidth(v132) * 0.4;
      if (v113 > v114 && !self->_manualCurlIsRightSide || v113 < -v114 && self->_manualCurlIsRightSide)
        v109 = 1;
      v67 = v109;
      goto LABEL_145;
    }
    v67 = 0;
LABEL_145:
    self->_finishingManualCurl = 1;
    v115 = -[BKIndirectPanGestureRecognizer state](v4, "state") == (char *)&dword_0 + 3 && v67;
    v116 = _AESwipeLog();
    v86 = objc_claimAutoreleasedReturnValue(v116);
    v117 = os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT);
    if (v115)
    {
      if (v117)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v86, OS_LOG_TYPE_DEFAULT, "finishing manual curl gesture", buf, 2u);
      }

      v118 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
      objc_msgSend(v118, "bookContainerView:finishManualCurl:", self, self->_manualCurl);

      goto LABEL_5;
    }
    if (v117)
    {
      v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v67));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v127 = v119;
      _os_log_impl(&dword_0, v86, OS_LOG_TYPE_DEFAULT, "Cancelling manual curl. Valid location? %@", buf, 0xCu);

    }
LABEL_95:

    v87 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
    objc_msgSend(v87, "bookContainerView:cancelManualCurl:", self, self->_manualCurl);

    goto LABEL_5;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
  v8 = objc_msgSend(v7, "bookContainerViewShouldBeginManualCurl:", self);

  if (v8)
  {
    if (self->_finishingManualCurl)
    {
      self->_startedWhilePreviousFinishing = 1;
      v9 = _AESwipeLog();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "began while previous finishing", buf, 2u);
      }

      -[BKBookContainerView _startLocationInViewWithGesture:](self, "_startLocationInViewWithGesture:", v4);
      self->_lastPoint.x = v11;
      self->_lastPoint.y = v12;
      self->_startPoint = self->_lastPoint;
      goto LABEL_59;
    }
    p_startPoint = &self->_startPoint;
    -[BKBookContainerView _startLocationInViewWithGesture:](self, "_startLocationInViewWithGesture:", v4);
    self->_lastPoint.x = v34;
    self->_lastPoint.y = v35;
    self->_startPoint = self->_lastPoint;
    v36 = _AESwipeLog();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v130.x = p_startPoint->x;
      v130.y = self->_startPoint.y;
      v38 = NSStringFromCGPoint(v130);
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v127 = v39;
      _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "curl began with start %@", buf, 0xCu);

    }
    v40 = -[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:", p_startPoint->x, self->_startPoint.y);
    if (self->_indirectManualCurlRecognizer == v4)
    {
      p_trackingManualCurl = &self->_trackingManualCurl;
      self->_trackingManualCurl = 1;
    }
    else
    {
      p_trackingManualCurl = &self->_trackingManualCurl;
      self->_trackingManualCurl = v40 - 1 < 2;
      if (v40 - 1 > 1)
        goto LABEL_53;
    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v48, "postEvent:sender:", kBETestDriverPageTurnStart, self);

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v49, "postEvent:sender:", kBETestDriverPageTurnSetupStart, self);

LABEL_53:
    v50 = _AESwipeLog();
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      if (*p_trackingManualCurl)
        v52 = &stru_1C3088;
      else
        v52 = CFSTR(" but not tracking");
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v127 = v52;
      _os_log_impl(&dword_0, v51, OS_LOG_TYPE_DEFAULT, "began new manual curl%@", buf, 0xCu);
    }

  }
LABEL_59:
  if (!self->_trackingManualCurl)
    goto LABEL_5;
  -[BKIndirectPanGestureRecognizer translationInView:](v4, "translationInView:", self);
  v55 = v53;
  v56 = v54;
  p_lastPoint = &self->_lastPoint;
  if (v53 == self->_lastPoint.x && v54 == self->_lastPoint.y)
  {
    v63 = _AESwipeLog();
    v6 = objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v64 = NSStringFromCGPoint(*p_lastPoint);
      v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v127 = v65;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Tracking manual curl - translation was the same as _lastPoint - %@", buf, 0xCu);

    }
    goto LABEL_4;
  }
  p_lastPoint->x = v53;
  self->_lastPoint.y = v54;
  if (!self->_manualCurl && self->_indirectManualCurlRecognizer != v4)
  {
    v59 = -[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:", self->_startPoint.x, self->_startPoint.y);
    x = self->_startPoint.x;
    y = self->_startPoint.y;
    if (v59 == 2)
    {
      -[BKBookContainerView bounds](self, "bounds");
      v77 = v62 - x + 20.0;
    }
    else
    {
      v77 = -(x + 20.0);
    }
    v78 = _AESwipeLog();
    v79 = objc_claimAutoreleasedReturnValue(v78);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      if (v59 == 2)
        v80 = CFSTR("Right");
      else
        v80 = CFSTR("Left");
      *(double *)v125 = v55;
      *(double *)&v125[1] = v56;
      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v125, "{CGPoint=dd}"));
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v127 = v80;
      *(_WORD *)&v127[8] = 2112;
      v128 = v81;
      _os_log_impl(&dword_0, v79, OS_LOG_TYPE_DEFAULT, "started on %@, with translation:%@", buf, 0x16u);

    }
    kdebug_trace(725353248, (unint64_t)((x + v77) * 100.0), (unint64_t)(y * 100.0), 0, 0);
    objc_initWeak((id *)buf, self);
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
    v122[0] = _NSConcreteStackBlock;
    v122[1] = 3221225472;
    v122[2] = sub_31CA4;
    v122[3] = &unk_1BF5D8;
    objc_copyWeak(&v123, (id *)buf);
    v124 = v59 == 2;
    objc_msgSend(v82, "bookContainerView:beginManualCurl:atLocation:completion:", self, v59 == 2, v122, x + v77, y);

    objc_destroyWeak(&v123);
    objc_destroyWeak((id *)buf);
  }
LABEL_5:

}

- (void)_setupManualCurlForIndirectRecognizerForTranslation:(CGPoint)a3
{
  double x;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  double v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  BOOL v19;
  uint8_t buf[4];
  const __CFString *v21;

  if (!self->_manualCurl)
  {
    x = a3.x;
    v5 = a3.x < 0.0;
    v6 = 0.0;
    if (a3.x < 0.0)
    {
      -[BKBookContainerView bounds](self, "bounds");
      v6 = v7;
    }
    -[BKBookContainerView bounds](self, "bounds");
    v9 = v8;
    if (self->_usePageCurlAnimation)
    {
      if (x >= 0.0)
      {
        v11 = -(v6 + 20.0);
      }
      else
      {
        -[BKBookContainerView bounds](self, "bounds");
        v11 = v10 - v6 + 20.0;
      }
      v6 = v6 + v11;
    }
    v12 = _AESwipeLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = CFSTR("Left");
      if (x < 0.0)
        v14 = CFSTR("Right");
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Indirect started on %@", buf, 0xCu);
    }

    v15 = v9 * 0.5;
    kdebug_trace(725353248, (unint64_t)(v6 * 100.0), (unint64_t)(v15 * 100.0), 0, 0);
    objc_initWeak((id *)buf, self);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_31F48;
    v17[3] = &unk_1BF5D8;
    objc_copyWeak(&v18, (id *)buf);
    v19 = v5;
    objc_msgSend(v16, "bookContainerView:beginManualCurl:atLocation:completion:", self, x < 0.0, v17, v6, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
}

- (void)leftPageGesture:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  if (-[BKBookContainerView shouldHandleSwipeGesture:](self, "shouldHandleSwipeGesture:", a3))
  {
    v4 = _AESwipeLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "swiping page reverse", v7, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
    objc_msgSend(v6, "bookContainerView:turnPages:", self, 1);

  }
}

- (void)rightPageGesture:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  if (-[BKBookContainerView shouldHandleSwipeGesture:](self, "shouldHandleSwipeGesture:", a3))
  {
    v4 = _AESwipeLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "swiping page forward", v7, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
    objc_msgSend(v6, "bookContainerView:turnPages:", self, 0);

  }
}

- (void)leftChapterGesture:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  if (-[BKBookContainerView shouldHandleSwipeGesture:](self, "shouldHandleSwipeGesture:", a3))
  {
    v4 = _AESwipeLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "swiping chapter reverse", v7, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
    objc_msgSend(v6, "bookContainerView:turnChapter:", self, 1);

  }
}

- (void)rightChapterGesture:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  if (-[BKBookContainerView shouldHandleSwipeGesture:](self, "shouldHandleSwipeGesture:", a3))
  {
    v4 = _AESwipeLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "swiping chapter forward", v7, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
    objc_msgSend(v6, "bookContainerView:turnChapter:", self, 0);

  }
}

+ (Class)_textRangeViewClass
{
  if (qword_20F4E8 != -1)
    dispatch_once(&qword_20F4E8, &stru_1BF5F8);
  return (Class)(id)qword_20F4E0;
}

- (BOOL)_touchIsNoNoClassOrMediaElement:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_opt_class(BKToolbarButton);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0
    || (objc_opt_class(UISlider), (objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    || (objc_opt_class(BKScrubberControl), (objc_opt_isKindOfClass(v5, v8) & 1) != 0)
    || (objc_opt_isKindOfClass(v5, +[BKBookContainerView _textRangeViewClass](BKBookContainerView, "_textRangeViewClass")) & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
    v9 = objc_msgSend(v11, "bookContainerView:hasMediaElementUnderTouch:", self, v4);

  }
  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  BKIndirectPanGestureRecognizer *v6;
  id v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char isKindOfClass;
  int *v19;
  int *v20;
  id v21;
  NSObject *v22;
  Class v23;
  NSString *v24;
  void *v25;
  uint64_t v26;
  objc_class *v27;
  void *v28;
  int v30;
  void *v31;

  v6 = (BKIndirectPanGestureRecognizer *)a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
  v9 = objc_msgSend(v8, "isShowingContent");

  if (!v9
    || -[BKBookContainerView externalGestureRecognizerCount](self, "externalGestureRecognizerCount")
    || -[BKBookContainerView _shouldIgnoreNavigationTouch:](self, "_shouldIgnoreNavigationTouch:", v7)
    || self->_indirectManualCurlRecognizer == v6
    && -[BKBookContainerView _touchIsNoNoClassOrMediaElement:](self, "_touchIsNoNoClassOrMediaElement:", v7))
  {
    goto LABEL_32;
  }
  if ((BKIndirectPanGestureRecognizer *)self->_leftTapRecognizer != v6
    && (BKIndirectPanGestureRecognizer *)self->_rightTapRecognizer != v6
    && (BKIndirectPanGestureRecognizer *)self->_manualCurlRecognizer != v6)
  {
    goto LABEL_9;
  }
  objc_msgSend(v7, "locationInView:", self);
  v11 = -[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_opt_class(UIControl);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
  {

LABEL_32:
    LOBYTE(v10) = 0;
    goto LABEL_33;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "superview"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "superview"));
  objc_opt_class(UITableView);
  isKindOfClass = objc_opt_isKindOfClass(v16, v17);

  if ((isKindOfClass & 1) != 0)
    goto LABEL_32;
  if (!v11)
  {
    v21 = _AESwipeLog();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_opt_class(v6);
      v24 = NSStringFromClass(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v30 = 138412290;
      v31 = v25;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Location for (%@) began in 'center'. Blocking touch events to gesture", (uint8_t *)&v30, 0xCu);

    }
    goto LABEL_32;
  }
  if ((BKIndirectPanGestureRecognizer *)self->_leftTapRecognizer == v6 && v11 == 1)
  {
    v19 = &OBJC_IVAR___BKBookContainerView__cancelLeftTap;
    v20 = &OBJC_IVAR___BKBookContainerView__cancelLeftTapTimer;
  }
  else
  {
    if ((BKIndirectPanGestureRecognizer *)self->_rightTapRecognizer != v6 || v11 != 2)
    {
      if ((BKIndirectPanGestureRecognizer *)self->_manualCurlRecognizer == v6)
      {
        v10 = !-[BKBookContainerView _touchIsNoNoClassOrMediaElement:](self, "_touchIsNoNoClassOrMediaElement:", v7);
        goto LABEL_33;
      }
      goto LABEL_32;
    }
    v19 = &OBJC_IVAR___BKBookContainerView__cancelRightTap;
    v20 = &OBJC_IVAR___BKBookContainerView__cancelRightTapTimer;
  }
  if ((BKIndirectPanGestureRecognizer *)self->_manualCurlRecognizer != v6)
  {
    v26 = *v20;
    if (!*(Class *)((char *)&self->super.super.super.isa + v26))
    {
      *((_BYTE *)&self->super.super.super.isa + *v19) = 0;
      v27 = (objc_class *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "cancelTapTimer:", 0, 0, 0.3));
      v28 = *(Class *)((char *)&self->super.super.super.isa + v26);
      *(Class *)((char *)&self->super.super.super.isa + v26) = v27;

    }
  }
LABEL_9:
  if (((BKIndirectPanGestureRecognizer *)self->_previousPageSwipeRecognizer == v6
     || (BKIndirectPanGestureRecognizer *)self->_nextPageSwipeRecognizer == v6
     || (BKIndirectPanGestureRecognizer *)self->_previousChapterSwipeRecognizer == v6
     || (BKIndirectPanGestureRecognizer *)self->_nextChapterSwipeRecognizer == v6)
    && -[BKBookContainerView _touchIsNoNoClassOrMediaElement:](self, "_touchIsNoNoClassOrMediaElement:", v7))
  {
    goto LABEL_32;
  }
  LOBYTE(v10) = 1;
LABEL_33:

  return v10;
}

- (BOOL)_shouldIgnoreNavigationTouch:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MaxY;
  double v14;
  double MaxX;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  v7 = v6;
  -[BKBookContainerView bounds](self, "bounds");
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  MinX = CGRectGetMinX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MaxY = CGRectGetMaxY(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  MaxX = CGRectGetMaxX(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v14 = CGRectGetMaxY(v20);
  return CGPointSquaredDistanceFromPoint(v5, v7, MinX, MaxY) < 2025.0
      || CGPointSquaredDistanceFromPoint(v5, v7, MaxX, v14) < 2025.0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UITapGestureRecognizer *v4;
  void *v5;
  unsigned int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;

  v4 = (UITapGestureRecognizer *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "isShowingContent");

  if (!v6)
    goto LABEL_7;
  -[UITapGestureRecognizer locationInView:](v4, "locationInView:", self);
  v9 = v7;
  v10 = v8;
  if (self->_leftTapRecognizer == v4 || self->_rightTapRecognizer == v4)
  {
    if (-[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:", v7, v8))
    {
      v11 = !-[BKBookContainerView _tapLocationIsInTextOverlapArea:](self, "_tapLocationIsInTextOverlapArea:", v9, v10);
      goto LABEL_8;
    }
LABEL_7:
    LOBYTE(v11) = 0;
    goto LABEL_8;
  }
  LOBYTE(v11) = 1;
LABEL_8:

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  BKPanGestureRecognizer *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  char v15;

  v6 = (BKPanGestureRecognizer *)a3;
  v7 = a4;
  objc_opt_class(BKSwipeGestureRecognizer);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0
    || self->_manualCurlRecognizer == v6
    || (BKPanGestureRecognizer *)self->_leftTapRecognizer == v6
    || (BKPanGestureRecognizer *)self->_rightTapRecognizer == v6)
  {
    objc_opt_class(UITapGestureRecognizer);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0 || sub_32A0C(v7))
      goto LABEL_12;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView gestureRecognizers](self, "gestureRecognizers"));
  if (objc_msgSend(v10, "indexOfObject:", v6) == (id)0x7FFFFFFFFFFFFFFFLL)
  {

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView gestureRecognizers](self, "gestureRecognizers"));
    v12 = objc_msgSend(v11, "indexOfObject:", v7);

    if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = 1;
      goto LABEL_13;
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView gestureRecognizers](self, "gestureRecognizers"));
  v14 = objc_msgSend(v13, "indexOfObject:", v7);

  if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
LABEL_12:
    v15 = 0;
  else
    v15 = !self->_trackingManualCurl;
LABEL_13:

  return v15;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  BKPanGestureRecognizer *v6;
  id v7;
  uint64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  unsigned __int8 v12;
  void *v13;
  char v14;

  v6 = (BKPanGestureRecognizer *)a3;
  v7 = a4;
  objc_opt_class(BKSwipeGestureRecognizer);
  v9 = (objc_opt_isKindOfClass(v6, v8) & 1) != 0
    || self->_manualCurlRecognizer == v6
    || (BKPanGestureRecognizer *)self->_leftTapRecognizer == v6
    || self->_rightTapRecognizer == (UITapGestureRecognizer *)v6;
  v10 = sub_32A0C(v7);
  if (v10)
  {
    objc_msgSend(v7, "locationInView:", self);
    v11 = -[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:") != 0;
    if (!v9)
    {
LABEL_8:
      v12 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v11 = 0;
    if (!v9)
      goto LABEL_8;
  }
  if (!v10 || v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
    v12 = objc_msgSend(v13, "bookContainerView:pageTurnShouldRequireFailureOf:", self, v7);

  }
  else
  {
    v12 = 1;
  }
LABEL_13:
  if (qword_20F4F8 != -1)
    dispatch_once(&qword_20F4F8, &stru_1BF618);
  v14 = v12 & ~objc_opt_isKindOfClass(v7, qword_20F4F0);

  return v14;
}

- (void)cancelTapTimer:(id)a3
{
  NSTimer *v4;
  NSTimer **p_cancelLeftTapTimer;
  int *v6;
  NSTimer *v7;
  NSTimer *v8;

  v4 = (NSTimer *)a3;
  p_cancelLeftTapTimer = &self->_cancelLeftTapTimer;
  if (self->_cancelLeftTapTimer == v4)
  {
    v8 = v4;
    v6 = &OBJC_IVAR___BKBookContainerView__cancelLeftTap;
    goto LABEL_5;
  }
  p_cancelLeftTapTimer = &self->_cancelRightTapTimer;
  if (self->_cancelRightTapTimer == v4)
  {
    v8 = v4;
    v6 = &OBJC_IVAR___BKBookContainerView__cancelRightTap;
LABEL_5:
    *((_BYTE *)&self->super.super.super.isa + *v6) = 1;
    -[NSTimer invalidate](*p_cancelLeftTapTimer, "invalidate");
    v7 = *p_cancelLeftTapTimer;
    *p_cancelLeftTapTimer = 0;

    v4 = v8;
  }

}

- (BOOL)shouldHandleSwipeGesture:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  id v9;
  NSObject *v10;
  int64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  unsigned __int8 v15;
  BOOL v16;
  id v17;
  id v18;
  __int16 v20;
  uint8_t v21[16];
  uint8_t v22[2];
  uint8_t buf[16];
  __int16 v24;

  v4 = a3;
  if (-[BKBookContainerView ignoreNextGesture](self, "ignoreNextGesture"))
  {
    -[BKBookContainerView setIgnoreNextGesture:](self, "setIgnoreNextGesture:", 0);
    v5 = _AESwipeLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 0;
      v7 = "Swipe Gesture was ignored";
      v8 = (uint8_t *)&v24;
LABEL_24:
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      goto LABEL_25;
    }
    goto LABEL_25;
  }
  if (self->_trackingManualCurl)
  {
    if (self->_manualCurl)
      goto LABEL_22;
    v9 = _AESwipeLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "swipe before curl", buf, 2u);
    }

    self->_swipeBeforeManualCurl = 1;
    if (objc_msgSend(v4, "direction") == (char *)&dword_0 + 2)
    {
      v11 = 0;
    }
    else
    {
      if (objc_msgSend(v4, "direction") != (char *)&dword_0 + 1)
      {
LABEL_21:
        self->_chapterTurn = (unint64_t)objc_msgSend(v4, "numberOfTouchesRequired") > 1;
LABEL_22:
        v18 = _AESwipeLog();
        v6 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v22 = 0;
          v7 = "Tracking manual curl -- won't swipe";
          v8 = v22;
          goto LABEL_24;
        }
        goto LABEL_25;
      }
      v11 = 1;
    }
    self->_swipeDirection = v11;
    goto LABEL_21;
  }
  objc_msgSend(v4, "locationInView:", self);
  if (-[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:"))
  {
    v12 = _AESwipeLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "swipe in the gutter", v21, 2u);
    }

    if ((unint64_t)objc_msgSend(v4, "numberOfTouchesRequired") < 2)
      goto LABEL_26;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookContainerView delegate](self, "delegate"));
  v15 = objc_msgSend(v14, "bookContainerViewShouldTurnPage:", self);

  if ((v15 & 1) == 0)
  {
    v17 = _AESwipeLog();
    v6 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 0;
      v7 = "Delegate told us to not swipe";
      v8 = (uint8_t *)&v20;
      goto LABEL_24;
    }
LABEL_25:

LABEL_26:
    v16 = 0;
    goto LABEL_27;
  }
  v16 = 1;
LABEL_27:

  return v16;
}

- (void)addGestureRecognizer:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (v4 && -[BKBookContainerView internalGestureRecognizersSet](self, "internalGestureRecognizersSet"))
    -[BKBookContainerView setExternalGestureRecognizerCount:](self, "setExternalGestureRecognizerCount:", (char *)-[BKBookContainerView externalGestureRecognizerCount](self, "externalGestureRecognizerCount") + 1);
  v5.receiver = self;
  v5.super_class = (Class)BKBookContainerView;
  -[BKBookContainerView addGestureRecognizer:](&v5, "addGestureRecognizer:", v4);

}

- (void)removeGestureRecognizer:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (v4 && -[BKBookContainerView internalGestureRecognizersSet](self, "internalGestureRecognizersSet"))
    -[BKBookContainerView setExternalGestureRecognizerCount:](self, "setExternalGestureRecognizerCount:", (char *)-[BKBookContainerView externalGestureRecognizerCount](self, "externalGestureRecognizerCount") - 1);
  v5.receiver = self;
  v5.super_class = (Class)BKBookContainerView;
  -[BKBookContainerView removeGestureRecognizer:](&v5, "removeGestureRecognizer:", v4);

}

- (NSArray)gestureRecognizers
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self->_leftTapRecognizer, self->_rightTapRecognizer, self->_manualCurlRecognizer, self->_indirectManualCurlRecognizer, self->_previousPageSwipeRecognizer, self->_nextPageSwipeRecognizer, self->_previousChapterSwipeRecognizer, self->_nextChapterSwipeRecognizer, 0);
}

- (BKBookContainerViewDelegate)delegate
{
  return (BKBookContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)spineLocation
{
  return self->_spineLocation;
}

- (BOOL)internalGestureRecognizersSet
{
  return self->_internalGestureRecognizersSet;
}

- (void)setInternalGestureRecognizersSet:(BOOL)a3
{
  self->_internalGestureRecognizersSet = a3;
}

- (unint64_t)externalGestureRecognizerCount
{
  return self->_externalGestureRecognizerCount;
}

- (void)setExternalGestureRecognizerCount:(unint64_t)a3
{
  self->_externalGestureRecognizerCount = a3;
}

- (BOOL)ignoreNextGesture
{
  return self->_ignoreNextGesture;
}

- (void)setIgnoreNextGesture:(BOOL)a3
{
  self->_ignoreNextGesture = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cancelRightTapTimer, 0);
  objc_storeStrong((id *)&self->_cancelLeftTapTimer, 0);
  objc_storeStrong(&self->_manualCurl, 0);
  objc_storeStrong((id *)&self->_nextChapterSwipeRecognizer, 0);
  objc_storeStrong((id *)&self->_previousChapterSwipeRecognizer, 0);
  objc_storeStrong((id *)&self->_nextPageSwipeRecognizer, 0);
  objc_storeStrong((id *)&self->_previousPageSwipeRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectManualCurlRecognizer, 0);
  objc_storeStrong((id *)&self->_manualCurlRecognizer, 0);
  objc_storeStrong((id *)&self->_rightTapRecognizer, 0);
  objc_storeStrong((id *)&self->_leftTapRecognizer, 0);
}

@end

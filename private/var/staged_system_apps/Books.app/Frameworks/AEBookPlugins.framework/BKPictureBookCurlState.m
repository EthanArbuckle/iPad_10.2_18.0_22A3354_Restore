@implementation BKPictureBookCurlState

- (BKPictureBookCurlState)init
{
  BKPictureBookCurlState *v2;
  BKPictureBookCurlState *v3;
  BKPictureBookCurlState *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKPictureBookCurlState;
  v2 = -[BKPictureBookCurlState init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_scale = 1.0;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BKPictureBookCurlState setCurlContainer:](self, "setCurlContainer:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BKPictureBookCurlState;
  -[BKPictureBookCurlState dealloc](&v3, "dealloc");
}

- (BOOL)generateWithOldLeftPageNumber:(int64_t)a3 oldRightPageNumber:(int64_t)a4 newLeftPageNumber:(int64_t)a5 newRightPageNumber:(int64_t)a6
{
  return -[BKPictureBookCurlState generateWithOldLeftPageNumber:oldRightPageNumber:newLeftPageNumber:newRightPageNumber:useMirrorForBackImage:](self, "generateWithOldLeftPageNumber:oldRightPageNumber:newLeftPageNumber:newRightPageNumber:useMirrorForBackImage:", a3, a4, a5, a6, 1);
}

- (BOOL)generateWithOldLeftPageNumber:(int64_t)a3 oldRightPageNumber:(int64_t)a4 newLeftPageNumber:(int64_t)a5 newRightPageNumber:(int64_t)a6 useMirrorForBackImage:(BOOL)a7
{
  id WeakRetained;
  void *v13;
  double x;
  double y;
  double height;
  double v17;
  double MidX;
  double v19;
  double v20;
  double v21;
  BKPictureBookCurlPageView *v22;
  BKPictureBookCurlPageView *v23;
  BKPictureBookCurlPageView *v24;
  BKPictureBookCurlPageView *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BKPictureBookCurlPageView *v30;
  void *v31;
  BOOL v32;
  BKPictureBookNavigationDelegate *navDelegate;
  double scale;
  void *v35;
  void *v36;
  BKPictureBookCurlPageView *v37;
  void *v38;
  void *v39;
  BKPictureBookNavigationDelegate *v40;
  double v41;
  int64_t v42;
  uint64_t v43;
  void *v44;
  BKPictureBookNavigationDelegate *v45;
  int64_t v46;
  double v47;
  id v48;
  BKPictureBookNavigationDelegate *v49;
  double v50;
  id v51;
  BKPictureBookNavigationDelegate *v52;
  double v53;
  int64_t v55;
  BKPictureBookCurlPageView *v56;
  BKPictureBookCurlPageView *v57;
  BKPictureBookCurlPageView *v58;
  int64_t v59;
  _BOOL4 forwardCurl;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[5];
  id v66;
  BOOL v67;
  _QWORD v68[4];
  BKPictureBookCurlPageView *v69;
  _QWORD v70[4];
  BKPictureBookCurlPageView *v71;
  CGRect v72;

  WeakRetained = objc_loadWeakRetained((id *)&self->_curlContainer);
  v13 = WeakRetained;
  if (WeakRetained && self->_navDelegate)
  {
    v55 = a4;
    v59 = a5;
    objc_msgSend(WeakRetained, "bounds");
    x = v72.origin.x;
    y = v72.origin.y;
    height = v72.size.height;
    v17 = v72.size.width * 0.5;
    MidX = CGRectGetMidX(v72);
    v19 = MidX + x;
    forwardCurl = self->_forwardCurl;
    if (self->_forwardCurl)
      v20 = x;
    else
      v20 = MidX + x;
    if (self->_forwardCurl)
      v21 = MidX + x;
    else
      v21 = x + -1.0;
    v22 = -[BKPictureBookCurlPageView initWithFrame:]([BKPictureBookCurlPageView alloc], "initWithFrame:", x, y, v17, height);
    v23 = -[BKPictureBookCurlPageView initWithFrame:]([BKPictureBookCurlPageView alloc], "initWithFrame:", v19, y, v17, height);
    v24 = -[BKPictureBookCurlPageView initWithFrame:]([BKPictureBookCurlPageView alloc], "initWithFrame:", v21, y, v17 + 1.0, height);
    v25 = -[BKPictureBookCurlPageView initWithFrame:]([BKPictureBookCurlPageView alloc], "initWithFrame:", v20, y, v17, height);
    objc_storeStrong((id *)&self->_leftPage, v22);
    objc_storeStrong((id *)&self->_rightPage, v23);
    v57 = v24;
    objc_storeStrong((id *)&self->_backPage, v24);
    v56 = v25;
    objc_storeStrong((id *)&self->_otherBackPage, v25);
    -[BKPictureBookCurlPageView setClipsToBounds:](self->_backPage, "setClipsToBounds:", 0);
    -[BKPictureBookCurlPageView setScale:](v22, "setScale:", self->_scale);
    -[BKPictureBookCurlPageView setDrawsSpine:](v22, "setDrawsSpine:", self->_applyMaskAndGutter);
    -[BKPictureBookCurlPageView setScale:](v23, "setScale:", self->_scale);
    -[BKPictureBookCurlPageView setDrawsSpine:](v23, "setDrawsSpine:", self->_applyMaskAndGutter);
    -[BKPictureBookCurlPageView setRight:](v23, "setRight:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlState leftSourceView](self, "leftSourceView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "window"));

    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlState leftSourceView](self, "leftSourceView"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlState leftSourceView](self, "leftSourceView"));
      objc_msgSend(v29, "bounds");
      v30 = v22;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0));
      -[BKPictureBookCurlPageView addSubview:](v30, "addSubview:", v31);

      v22 = v30;
    }
    else
    {
      navDelegate = self->_navDelegate;
      scale = self->_scale;
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = sub_17F18;
      v70[3] = &unk_1BEAB0;
      v71 = v22;
      -[BKPictureBookNavigationDelegate pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:](navDelegate, "pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:", a3, 0, 0, v70, v17, height, scale);

    }
    -[BKPictureBookCurlPageView setPageOffset:](v22, "setPageOffset:", a3);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlState rightSourceView](self, "rightSourceView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "window"));

    if (v36)
    {
      v37 = (BKPictureBookCurlPageView *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlState rightSourceView](self, "rightSourceView"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlState rightSourceView](self, "rightSourceView"));
      objc_msgSend(v38, "bounds");
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlPageView resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:](v37, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0));
      -[BKPictureBookCurlPageView addSubview:](v23, "addSubview:", v39);

    }
    else
    {
      v40 = self->_navDelegate;
      v41 = self->_scale;
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_17F24;
      v68[3] = &unk_1BEAB0;
      v69 = v23;
      -[BKPictureBookNavigationDelegate pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:](v40, "pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:", v55, 1, 0, v68, v17, height, v41);
      v37 = v69;
    }

    -[BKPictureBookCurlPageView setPageOffset:](v23, "setPageOffset:", v55);
    if (self->_forwardCurl)
      v42 = v59;
    else
      v42 = a6;
    -[BKPictureBookCurlPageView setPageOffset:](self->_backPage, "setPageOffset:", v42);
    -[BKPictureBookCurlPageView setScale:](self->_backPage, "setScale:", self->_scale);
    -[BKPictureBookCurlPageView setDrawsSpine:](self->_backPage, "setDrawsSpine:", self->_applyMaskAndGutter);
    v58 = v22;
    if (-[BKPictureBookCurlState _isNightMode](self, "_isNightMode"))
      v43 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    else
      v43 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v44 = (void *)v43;
    -[BKPictureBookCurlPageView setBackgroundColor:](self->_backPage, "setBackgroundColor:", v43);
    v45 = self->_navDelegate;
    if (self->_forwardCurl)
      v46 = v59;
    else
      v46 = a6;
    v47 = self->_scale;
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_17F30;
    v65[3] = &unk_1BECE0;
    v65[4] = self;
    v67 = !forwardCurl;
    v48 = v13;
    v66 = v48;
    -[BKPictureBookNavigationDelegate pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:](v45, "pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:", v46, !forwardCurl, 0, v65, v17, height, v47);
    v49 = self->_navDelegate;
    v50 = self->_scale;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_17FB0;
    v63[3] = &unk_1BEAB0;
    v51 = v48;
    v64 = v51;
    v32 = 1;
    -[BKPictureBookNavigationDelegate pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:](v49, "pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:", a6, 1, 0, v63, v17, height, v50);
    v52 = self->_navDelegate;
    v53 = self->_scale;
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_17FBC;
    v61[3] = &unk_1BEAB0;
    v62 = v51;
    -[BKPictureBookNavigationDelegate pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:](v52, "pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:", v59, 0, 0, v61, v17, height, v53);

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (BOOL)_isNightMode
{
  id WeakRetained;
  void *v3;
  BOOL v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_curlContainer);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceStyle") == (char *)&dword_0 + 2 || UIAccessibilityIsInvertColorsEnabled();

  return v4;
}

- (id)_getDummyImageForSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v5;
  UIImage *ImageFromCurrentImageContext;
  void *v7;
  CGRect v9;

  height = a3.height;
  width = a3.width;
  UIGraphicsBeginImageContextWithOptions(a3, 0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v5, "setFill");

  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  v9.size.width = width;
  v9.size.height = height;
  UIRectFill(v9);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v7 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v7;
}

- (void)startManualCurlAtPostion:(CGPoint)a3
{
  self->_manualCurlStartPosition = a3;
  self->_manualCurlCurrentTime = CFAbsoluteTimeGetCurrent();
}

- (void)updateManualCurlToPosition:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  self->_manualCurlCurrentTime = CFAbsoluteTimeGetCurrent();
  -[BKPageCurl updateManualCurlToLocation:](self->_pageCurl, "updateManualCurlToLocation:", x, y);
}

- (BOOL)finishManualCurlAtPostion:(CGPoint)a3
{
  double v4;
  BKPictureBookCurlContainerView **p_curlContainer;
  id WeakRetained;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double curlThreshold;
  double v16;
  void *v17;
  _BOOL4 forwardCurl;
  id v19;
  void *v20;
  void *v21;
  CGRect v23;

  v4 = vabdd_f64(a3.x, self->_manualCurlStartPosition.x);
  p_curlContainer = &self->_curlContainer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_curlContainer);
  objc_msgSend(WeakRetained, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  curlThreshold = self->_curlThreshold;
  v23.origin.x = v8;
  v23.origin.y = v10;
  v23.size.width = v12;
  v23.size.height = v14;
  v16 = curlThreshold * CGRectGetWidth(v23);
  if (v4 <= v16)
  {
    if (!self->_applyMaskAndGutter)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlState curlPage](self, "curlPage"));
      objc_msgSend(v21, "pageCurlWillCancel");

    }
    -[BKPictureBookCurlState cancelManualCurl](self, "cancelManualCurl");
  }
  else
  {
    -[BKPageCurl finishManualCurl](self->_pageCurl, "finishManualCurl");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlPageView image](self->_backPage, "image"));
    forwardCurl = self->_forwardCurl;
    v19 = objc_loadWeakRetained((id *)p_curlContainer);
    v20 = v19;
    if (forwardCurl)
      objc_msgSend(v19, "setLeftImage:", v17);
    else
      objc_msgSend(v19, "setRightImage:", v17);

  }
  return v4 > v16;
}

- (void)cancelManualCurl
{
  -[BKPageCurl cancelManualCurl](self->_pageCurl, "cancelManualCurl");
}

- (id)pagesImageArray
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlPageView image](self->_leftPage, "image"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlPageView image](self->_rightPage, "image"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, v4, 0));

  return v5;
}

- (id)backPagesImageArray
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlPageView image](self->_backPage, "image"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlPageView image](self->_otherBackPage, "image"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, v4, 0));

  return v5;
}

- (id)pageArray
{
  if (self->_autoCurl)
  {
    -[BKPictureBookCurlPageView setTopView:isRightPage:](self->_rightPage, "setTopView:isRightPage:", self->_rightSourceView, 1);
    -[BKPictureBookCurlPageView setTopView:isRightPage:](self->_leftPage, "setTopView:isRightPage:", self->_leftSourceView, 0);
  }
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self->_leftPage, self->_rightPage, 0);
}

- (id)backPageArray
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self->_backPage, self->_otherBackPage, 0);
}

- (id)leftPage
{
  return self->_leftPage;
}

- (id)rightPage
{
  return self->_rightPage;
}

- (id)backPage
{
  return self->_backPage;
}

- (int64_t)oldLeftPageNumber
{
  return self->_oldLeftPageNumber;
}

- (int64_t)oldRightPageNumber
{
  return self->_oldRightPageNumber;
}

- (int64_t)newLeftPageNumber
{
  return self->_newLeftPageNumber;
}

- (int64_t)newRightPageNumber
{
  return self->_newRightPageNumber;
}

- (id)curlPage
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;

  if (self->_forwardCurl)
    v3 = 176;
  else
    v3 = 168;
  v4 = *(id *)((char *)&self->super.isa + v3);
  if (self->_forwardCurl)
    v5 = 168;
  else
    v5 = 176;
  v6 = *(id *)((char *)&self->super.isa + v5);
  if (self->_forwardCurl)
    v7 = 24;
  else
    v7 = 16;
  v8 = *(id *)((char *)&self->super.isa + v7);
  if (self->_forwardCurl)
    v9 = 16;
  else
    v9 = 24;
  v10 = *(id *)((char *)&self->super.isa + v9);
  if (v4)
  {
    objc_msgSend(v8, "setScale:", self->_scale);
    objc_msgSend(v8, "setTopView:isRightPage:", v4, self->_forwardCurl);
  }
  if (v6)
  {
    objc_msgSend(v10, "setScale:", self->_scale);
    objc_msgSend(v10, "setTopView:isRightPage:", v6, !self->_forwardCurl);
  }
  if (!self->_applyMaskAndGutter)
  {
    objc_msgSend(v8, "setDuration:", 0.3);
    objc_msgSend(v8, "setShouldAnimate:", self->_autoCurl);
    objc_msgSend(v8, "setShouldHaveGradient:", 1);
  }

  return v8;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (BKPictureBookNavigationDelegate)navDelegate
{
  return self->_navDelegate;
}

- (void)setNavDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_navDelegate, a3);
}

- (BKPictureBookCurlContainerView)curlContainer
{
  return (BKPictureBookCurlContainerView *)objc_loadWeakRetained((id *)&self->_curlContainer);
}

- (void)setCurlContainer:(id)a3
{
  objc_storeWeak((id *)&self->_curlContainer, a3);
}

- (BOOL)isForwardCurl
{
  return self->_forwardCurl;
}

- (void)setForwardCurl:(BOOL)a3
{
  self->_forwardCurl = a3;
}

- (BKPageCurl)pageCurl
{
  return self->_pageCurl;
}

- (void)setPageCurl:(id)a3
{
  objc_storeStrong((id *)&self->_pageCurl, a3);
}

- (double)curlThreshold
{
  return self->_curlThreshold;
}

- (void)setCurlThreshold:(double)a3
{
  self->_curlThreshold = a3;
}

- (CGPoint)manualCurlStartPosition
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_manualCurlStartPosition, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (UIView)leftSourceView
{
  return self->_leftSourceView;
}

- (void)setLeftSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_leftSourceView, a3);
}

- (UIView)rightSourceView
{
  return self->_rightSourceView;
}

- (void)setRightSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_rightSourceView, a3);
}

- (BOOL)isAutoCurl
{
  return self->_autoCurl;
}

- (void)setAutoCurl:(BOOL)a3
{
  self->_autoCurl = a3;
}

- (BOOL)applyMaskAndGutter
{
  return self->_applyMaskAndGutter;
}

- (void)setApplyMaskAndGutter:(BOOL)a3
{
  self->_applyMaskAndGutter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightSourceView, 0);
  objc_storeStrong((id *)&self->_leftSourceView, 0);
  objc_storeStrong((id *)&self->_pageCurl, 0);
  objc_destroyWeak((id *)&self->_curlContainer);
  objc_storeStrong((id *)&self->_navDelegate, 0);
  objc_storeStrong((id *)&self->_otherBackPage, 0);
  objc_storeStrong((id *)&self->_rightPage, 0);
  objc_storeStrong((id *)&self->_leftPage, 0);
  objc_storeStrong((id *)&self->_backPage, 0);
}

@end

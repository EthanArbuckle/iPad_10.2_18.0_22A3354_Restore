@implementation PBTileController

- (PBTileController)initWithPhoto:(id)a3
{
  PBTileController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBTileController;
  v4 = -[PBTileController init](&v6, "init");
  v4->_photo = (PHAsset *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[PBTileController setDidEndZoomingBlock:](self, "setDidEndZoomingBlock:", 0);

  v3.receiver = self;
  v3.super_class = (Class)PBTileController;
  -[PBTileController dealloc](&v3, "dealloc");
}

- (void)loadView
{
  double v3;
  double v4;
  double v5;
  PHImageManager *v6;
  id v7;
  UIImageView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIScrollView *v13;
  uint64_t v14;

  v14 = 0;
  v3 = PHFullScreenSizeForScreen(+[UIScreen mainScreen](UIScreen, "mainScreen"), &v14);
  v5 = v4;
  v6 = +[PHImageManager defaultManager](PHImageManager, "defaultManager");
  v7 = -[PHImageManager synchronousImageForAsset:targetSize:contentMode:options:](v6, "synchronousImageForAsset:targetSize:contentMode:options:", self->_photo, v14, 0, v3, v5);
  v8 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v7);
  self->_imageView = v8;
  -[UIImageView setOpaque:](v8, "setOpaque:", 1);
  -[UIScreen bounds](+[UIScreen mainScreen](UIScreen, "mainScreen"), "bounds");
  v13 = (UIScrollView *)objc_msgSend(objc_alloc((Class)UIScrollView), "initWithFrame:", v9, v10, v11, v12);
  self->_scrollView = v13;
  objc_msgSend(v7, "size");
  -[UIScrollView setContentSize:](v13, "setContentSize:");
  -[UIScrollView setMaximumZoomScale:](self->_scrollView, "setMaximumZoomScale:", 3.0);
  -[UIScrollView setAutoresizingMask:](self->_scrollView, "setAutoresizingMask:", 18);
  -[UIScrollView setPreservesCenterDuringRotation:](self->_scrollView, "setPreservesCenterDuringRotation:", 1);
  -[UIScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_imageView);
  -[PBTileController setView:](self, "setView:", self->_scrollView);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  unsigned int v7;
  double v8;
  double v9;
  double v10;
  UIScrollView *scrollView;
  double v12;
  double v13;

  height = a3.height;
  width = a3.width;
  -[PBTileController zoomToFitScale](self, "zoomToFitScale", a4);
  v7 = -[PBTileController _testZoomScale:](self, "_testZoomScale:");
  -[PBTileController zoomScaleToFitScrollViewSize:](self, "zoomScaleToFitScrollViewSize:", width, height);
  v9 = v8;
  v10 = fmin(v8, 1.0);
  -[UIScrollView setMinimumZoomScale:](self->_scrollView, "setMinimumZoomScale:", v10);
  scrollView = self->_scrollView;
  if (v7)
  {
    v12 = v9;
  }
  else
  {
    -[UIScrollView zoomScale](scrollView, "zoomScale");
    if (v13 >= v10)
      return;
    scrollView = self->_scrollView;
    v12 = v10;
  }
  -[UIScrollView setZoomScale:animated:](scrollView, "setZoomScale:animated:", 1, v12);
}

- (void)viewWillAppear:(BOOL)a3
{
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBTileController;
  -[PBTileController viewWillAppear:](&v6, "viewWillAppear:", a3);
  -[PBTileController zoomToFitScale](self, "zoomToFitScale");
  v5 = v4;
  -[UIScrollView setMinimumZoomScale:](self->_scrollView, "setMinimumZoomScale:", fmin(v4, 1.0));
  -[UIScrollView setZoomScale:animated:](self->_scrollView, "setZoomScale:animated:", 0, v5);
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PBTileController;
  -[PBTileController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)toggleZoom:(id)a3
{
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  -[PBTileController zoomToFitScale](self, "zoomToFitScale");
  v6 = v5;
  if (-[PBTileController _testZoomScale:](self, "_testZoomScale:"))
  {
    v8 = objc_opt_class(UIGestureRecognizer, v7);
    if ((objc_opt_isKindOfClass(a3, v8) & 1) != 0)
    {
      objc_msgSend(a3, "locationInView:", self->_imageView);
      v10 = v9;
      v12 = v11;
      -[UIScrollView zoomScale](self->_scrollView, "zoomScale");
      v14 = v13;
      -[UIScrollView maximumZoomScale](self->_scrollView, "maximumZoomScale");
      v16 = v14 / v15;
      v36 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)&v39.a = *(_OWORD *)&CGAffineTransformIdentity.a;
      v35 = *(_OWORD *)&v39.a;
      *(_OWORD *)&v39.c = v36;
      *(_OWORD *)&v39.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
      v34 = *(_OWORD *)&v39.tx;
      -[UIImageView bounds](self->_imageView, "bounds");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      *(_OWORD *)&v38.a = *(_OWORD *)&v39.a;
      *(_OWORD *)&v38.c = v36;
      *(_OWORD *)&v38.tx = *(_OWORD *)&v39.tx;
      CGAffineTransformTranslate(&v39, &v38, -v10, -v12);
      v38 = v39;
      v40.origin.x = v18;
      v40.origin.y = v20;
      v40.size.width = v22;
      v40.size.height = v24;
      v41 = CGRectApplyAffineTransform(v40, &v38);
      v42 = CGRectIntegral(v41);
      x = v42.origin.x;
      y = v42.origin.y;
      width = v42.size.width;
      height = v42.size.height;
      *(_OWORD *)&v37.a = v35;
      *(_OWORD *)&v37.c = v36;
      *(_OWORD *)&v37.tx = v34;
      CGAffineTransformScale(&v38, &v37, v16, v16);
      v39 = v38;
      v43.origin.x = x;
      v43.origin.y = y;
      v43.size.width = width;
      v43.size.height = height;
      v44 = CGRectApplyAffineTransform(v43, &v38);
      v45 = CGRectIntegral(v44);
      v29 = v45.origin.x;
      v30 = v45.origin.y;
      v31 = v45.size.width;
      v32 = v45.size.height;
      *(_OWORD *)&v37.a = v35;
      *(_OWORD *)&v37.c = v36;
      *(_OWORD *)&v37.tx = v34;
      CGAffineTransformTranslate(&v38, &v37, v10, v12);
      v39 = v38;
      v46.origin.x = v29;
      v46.origin.y = v30;
      v46.size.width = v31;
      v46.size.height = v32;
      v47 = CGRectApplyAffineTransform(v46, &v38);
      v48 = CGRectIntegral(v47);
      -[UIScrollView zoomToRect:animated:](self->_scrollView, "zoomToRect:animated:", 1, v48.origin.x, v48.origin.y, v48.size.width, v48.size.height);
      return;
    }
    -[UIScrollView maximumZoomScale](self->_scrollView, "maximumZoomScale");
    v6 = v33;
  }
  -[UIScrollView setZoomScale:animated:](self->_scrollView, "setZoomScale:animated:", 1, v6);
}

- (void)zoomToFit:(id)a3
{
  UIScrollView *scrollView;

  scrollView = self->_scrollView;
  -[PBTileController zoomToFitScale](self, "zoomToFitScale", a3);
  -[UIScrollView setZoomScale:animated:](scrollView, "setZoomScale:animated:", 1);
  if (!self->_isAnimatingZoom)
    -[PBTileController _performDidEndZoomBlock](self, "_performDidEndZoomBlock");
}

- (BOOL)_testZoomScale:(double)a3
{
  double v4;

  -[UIScrollView zoomScale](self->_scrollView, "zoomScale");
  return vabdd_f64(v4, a3) < 0.00000011920929;
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return self->_imageView;
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  self->_isAnimatingZoom = 1;
  if (-[UIScrollView isZooming](self->_scrollView, "isZooming", a3, a4))
    -[NSNotificationCenter postNotificationName:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:", CFSTR("PBTileWillBeginZoomingNotification"), self);
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  -[PBTileController _performDidEndZoomBlock](self, "_performDidEndZoomBlock", a3, a4, a5);
  self->_isAnimatingZoom = 0;
}

- (void)setDidEndZoomingBlock:(id)a3
{
  id didEndZoomingBlock;

  didEndZoomingBlock = self->_didEndZoomingBlock;
  if (didEndZoomingBlock)
  {
    _Block_release(didEndZoomingBlock);
    self->_didEndZoomingBlock = 0;
  }
  if (a3)
    self->_didEndZoomingBlock = _Block_copy(a3);
}

- (void)_performDidEndZoomBlock
{
  void (**didEndZoomingBlock)(id, SEL);

  didEndZoomingBlock = (void (**)(id, SEL))self->_didEndZoomingBlock;
  if (didEndZoomingBlock)
  {
    didEndZoomingBlock[2](didEndZoomingBlock, a2);
    -[PBTileController setDidEndZoomingBlock:](self, "setDidEndZoomingBlock:", 0);
  }
}

- (double)zoomToFitScale
{
  double v3;
  double v4;
  double result;

  -[UIScrollView bounds](self->_scrollView, "bounds");
  -[PBTileController zoomScaleToFitScrollViewSize:](self, "zoomScaleToFitScrollViewSize:", v3, v4);
  return result;
}

- (double)zoomScaleToFitScrollViewSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;

  height = a3.height;
  width = a3.width;
  -[UIImage size](-[UIImageView image](self->_imageView, "image"), "size");
  return fmin(width / v5, height / v6);
}

- (id)imageView
{
  return self->_imageView;
}

@end

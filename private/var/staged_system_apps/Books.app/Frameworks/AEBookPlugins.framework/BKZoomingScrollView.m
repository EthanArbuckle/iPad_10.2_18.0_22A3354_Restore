@implementation BKZoomingScrollView

- (void)_commonInit
{
  self->_simulatedZoomScale = 1.0;
  self->_maxSimulatedZoomScale = 1.79769313e308;
}

- (BKZoomingScrollView)initWithFrame:(CGRect)a3
{
  BKZoomingScrollView *v3;
  BKZoomingScrollView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKZoomingScrollView;
  v3 = -[BKZoomingScrollView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[BKZoomingScrollView _commonInit](v3, "_commonInit");
  return v4;
}

- (BKZoomingScrollView)initWithCoder:(id)a3
{
  BKZoomingScrollView *v3;
  BKZoomingScrollView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKZoomingScrollView;
  v3 = -[BKZoomingScrollView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[BKZoomingScrollView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKZoomingScrollView;
  -[BKZoomingScrollView layoutSubviews](&v3, "layoutSubviews");
  -[BKZoomingScrollView centerContent](self, "centerContent");
}

- (void)centerContent
{
  void *v3;
  double Width;
  double v5;
  double Height;
  double v7;
  float v8;
  double v9;
  float v10;
  float v11;
  double v12;
  id v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKZoomingScrollView delegate](self, "delegate"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewForZoomingInScrollView:", self));

  if (v13)
  {
    -[BKZoomingScrollView bounds](self, "bounds");
    Width = CGRectGetWidth(v14);
    objc_msgSend(v13, "frame");
    v5 = Width - CGRectGetWidth(v15);
    -[BKZoomingScrollView bounds](self, "bounds");
    Height = CGRectGetHeight(v16);
    objc_msgSend(v13, "frame");
    v7 = Height - CGRectGetHeight(v17);
    v8 = v5 * 0.5;
    v9 = fmaxf(truncf(v8), 0.0);
    v10 = v5 - v9;
    v11 = v7 * 0.5;
    v12 = fmaxf(truncf(v11), 0.0);
    *(float *)&v7 = v7 - v12;
    -[BKZoomingScrollView setContentInset:](self, "setContentInset:", v12, v9, fmaxf(truncf(*(float *)&v7), 0.0), fmaxf(truncf(v10), 0.0));
  }

}

- (void)configureForImageSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  height = a3.height;
  width = a3.width;
  -[BKZoomingScrollView frame](self, "frame");
  v8 = v7 / width;
  v9 = 0.0;
  if (width == 0.0)
    v8 = 0.0;
  if (height != 0.0)
    v9 = v6 / height;
  if (v8 >= v9)
    v10 = v9;
  else
    v10 = v8;
  -[BKZoomingScrollView setContentSize:](self, "setContentSize:", width, height);
  -[BKZoomingScrollView setMinimumZoomScale:](self, "setMinimumZoomScale:", v10);
  -[BKZoomingScrollView maximumZoomScale](self, "maximumZoomScale");
  if (v11 < v10)
    -[BKZoomingScrollView setMaximumZoomScale:](self, "setMaximumZoomScale:", v10);
}

- (CGPoint)maximumContentOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[BKZoomingScrollView contentSize](self, "contentSize");
  v4 = v3;
  v6 = v5;
  -[BKZoomingScrollView bounds](self, "bounds");
  v8 = v4 - v7;
  v10 = v6 - v9;
  result.y = v10;
  result.x = v8;
  return result;
}

- (CGPoint)minimumContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)pointToCenterAfterRotation
{
  double MidX;
  double MidY;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;
  CGRect v14;
  CGRect v15;

  -[BKZoomingScrollView bounds](self, "bounds");
  MidX = CGRectGetMidX(v14);
  -[BKZoomingScrollView bounds](self, "bounds");
  MidY = CGRectGetMidY(v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKZoomingScrollView delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewForZoomingInScrollView:", self));

  -[BKZoomingScrollView convertPoint:toView:](self, "convertPoint:toView:", v6, MidX, MidY);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (double)scaleToRestoreAfterRotation
{
  double v3;
  double v4;
  double v5;
  BOOL v6;
  double result;

  -[BKZoomingScrollView zoomScale](self, "zoomScale");
  v4 = v3;
  -[BKZoomingScrollView minimumZoomScale](self, "minimumZoomScale");
  v6 = v4 > v5 + 0.00000011920929;
  result = 0.0;
  if (v6)
    return v4;
  return result;
}

- (void)configureForNewBoundsAndRestoreCenterPoint:(CGPoint)a3 andScale:(double)a4
{
  double y;
  double x;
  void *v8;
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
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;

  y = a3.y;
  x = a3.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKZoomingScrollView delegate](self, "delegate"));
  v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewForZoomingInScrollView:", self));

  objc_msgSend(v30, "bounds");
  -[BKZoomingScrollView configureForImageSize:](self, "configureForImageSize:", v9, v10);
  -[BKZoomingScrollView maximumZoomScale](self, "maximumZoomScale");
  v12 = v11;
  -[BKZoomingScrollView minimumZoomScale](self, "minimumZoomScale");
  if (v13 < a4)
    v13 = a4;
  if (v12 < v13)
    v13 = v12;
  -[BKZoomingScrollView setZoomScale:](self, "setZoomScale:", v13);
  -[BKZoomingScrollView convertPoint:fromView:](self, "convertPoint:fromView:", v30, x, y);
  v15 = v14;
  v17 = v16;
  -[BKZoomingScrollView bounds](self, "bounds");
  v19 = v15 - v18 * 0.5;
  -[BKZoomingScrollView bounds](self, "bounds");
  v21 = v17 - v20 * 0.5;
  -[BKZoomingScrollView maximumContentOffset](self, "maximumContentOffset");
  v23 = v22;
  v25 = v24;
  -[BKZoomingScrollView minimumContentOffset](self, "minimumContentOffset");
  if (v23 >= v26)
    v28 = v26;
  else
    v28 = v23;
  if (v23 >= v26)
    v26 = v23;
  if (v25 >= v27)
    v29 = v27;
  else
    v29 = v25;
  if (v25 >= v27)
    v27 = v25;
  if (v26 >= v19)
    v26 = v19;
  if (v28 >= v26)
    v26 = v28;
  if (v27 >= v21)
    v27 = v21;
  if (v29 >= v27)
    v27 = v29;
  -[BKZoomingScrollView setContentOffset:](self, "setContentOffset:", v26, v27);

}

- (void)setZoomScale:(double)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL4 v5;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  _QWORD v10[4];
  void (**v11)(_QWORD);
  _QWORD v12[6];

  v5 = a4;
  v8 = (void (**)(_QWORD))a5;
  v9 = v8;
  if (v5)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_AF560;
    v12[3] = &unk_1C03B0;
    v12[4] = self;
    *(double *)&v12[5] = a3;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_AF590;
    v10[3] = &unk_1BFE08;
    v11 = v8;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v12, v10, 0.2, 0.0);

  }
  else
  {
    -[BKZoomingScrollView setZoomScale:animated:](self, "setZoomScale:animated:", 0, a3);
    if (v9)
      v9[2](v9);
  }

}

- (void)zoomToRect:(CGRect)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  void (**v11)(_QWORD);
  void (**v12)(_QWORD);
  _QWORD v13[4];
  void (**v14)(_QWORD);
  _QWORD v15[9];

  v5 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = (void (**)(_QWORD))a5;
  v12 = v11;
  if (v5)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_AF6C0;
    v15[3] = &unk_1C0650;
    v15[4] = self;
    *(double *)&v15[5] = x;
    *(double *)&v15[6] = y;
    *(double *)&v15[7] = width;
    *(double *)&v15[8] = height;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_AF6F4;
    v13[3] = &unk_1BFE08;
    v14 = v11;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v15, v13, 0.2, 0.0);

  }
  else
  {
    -[BKZoomingScrollView zoomToRect:animated:](self, "zoomToRect:animated:", 0, x, y, width, height);
    if (v12)
      v12[2](v12);
  }

}

- (void)simulateZoomScaleByResizingView
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  unsigned int v10;
  void *v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;

  -[BKZoomingScrollView zoomScale](self, "zoomScale");
  v4 = fmin(v3, self->_maxSimulatedZoomScale / self->_simulatedZoomScale);
  if (v4 != 1.0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKZoomingScrollView delegate](self, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewForZoomingInScrollView:", self));

    self->_simulatedZoomScale = v4 * self->_simulatedZoomScale;
    memset(&v17, 0, sizeof(v17));
    CGAffineTransformMakeScale(&v17, v4, v4);
    if (v6)
      objc_msgSend(v6, "transform");
    else
      memset(&t1, 0, sizeof(t1));
    v13 = v17;
    CGAffineTransformInvert(&t2, &v13);
    CGAffineTransformConcat(&v16, &t1, &t2);
    v12 = v16;
    objc_msgSend(v6, "setTransform:", &v12);
    objc_msgSend(v6, "bounds");
    v13 = v17;
    v19 = CGRectApplyAffineTransform(v18, &v13);
    objc_msgSend(v6, "setBounds:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
    -[BKZoomingScrollView minimumZoomScale](self, "minimumZoomScale");
    -[BKZoomingScrollView setMinimumZoomScale:](self, "setMinimumZoomScale:", v7 / v4);
    -[BKZoomingScrollView maximumZoomScale](self, "maximumZoomScale");
    -[BKZoomingScrollView setMaximumZoomScale:](self, "setMaximumZoomScale:", v8 / v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKZoomingScrollView delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___BKZoomingScrollViewDelegate);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKZoomingScrollView delegate](self, "delegate"));
      objc_msgSend(v11, "zoomingScrollView:didSimulateZoomScale:onView:", self, v6, self->_simulatedZoomScale);

    }
  }
}

- (double)totalZoomScale
{
  double v3;

  -[BKZoomingScrollView zoomScale](self, "zoomScale");
  return v3 * self->_simulatedZoomScale;
}

- (void)setTotalZoomScale:(double)a3
{
  -[BKZoomingScrollView setZoomScale:](self, "setZoomScale:", a3 / self->_simulatedZoomScale);
}

- (double)maxSimulatedZoomScale
{
  return self->_maxSimulatedZoomScale;
}

- (void)setMaxSimulatedZoomScale:(double)a3
{
  self->_maxSimulatedZoomScale = a3;
}

@end

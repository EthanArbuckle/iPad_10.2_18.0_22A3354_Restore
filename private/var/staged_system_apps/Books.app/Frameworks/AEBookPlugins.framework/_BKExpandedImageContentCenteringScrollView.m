@implementation _BKExpandedImageContentCenteringScrollView

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_BKExpandedImageContentCenteringScrollView;
  -[_BKExpandedImageContentCenteringScrollView layoutSubviews](&v3, "layoutSubviews");
  -[_BKExpandedImageContentCenteringScrollView centerContent](self, "centerContent");
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_BKExpandedImageContentCenteringScrollView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v21.receiver = self;
  v21.super_class = (Class)_BKExpandedImageContentCenteringScrollView;
  -[_BKExpandedImageContentCenteringScrollView setBounds:](&v21, "setBounds:", x, y, width, height);
  v12 = v9 == width && v11 == height;
  if (!v12
    || !-[_BKExpandedImageContentCenteringScrollView hasCalculatedMinZoomScale](self, "hasCalculatedMinZoomScale"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_BKExpandedImageContentCenteringScrollView _bk_getDelegateZoomView](self, "_bk_getDelegateZoomView"));
    v14 = v13;
    if (v13)
    {
      v15 = objc_msgSend(v13, "bounds");
      v18 = CGSizeScaleThatFitsInCGSize(v15, v16, v17, width, height);
      if (v18 <= 2.0)
        v19 = v18;
      else
        v19 = 2.0;
      -[_BKExpandedImageContentCenteringScrollView setHasCalculatedMinZoomScale:](self, "setHasCalculatedMinZoomScale:", 1);
    }
    else
    {
      v19 = 1.0;
    }
    -[_BKExpandedImageContentCenteringScrollView setMinimumZoomScale:](self, "setMinimumZoomScale:", v19);
    -[_BKExpandedImageContentCenteringScrollView maximumZoomScale](self, "maximumZoomScale");
    if (v20 < v19)
      -[_BKExpandedImageContentCenteringScrollView setMaximumZoomScale:](self, "setMaximumZoomScale:", v19);
    -[_BKExpandedImageContentCenteringScrollView setZoomScale:](self, "setZoomScale:", v19);

  }
}

- (void)centerContent
{
  double Width;
  double v4;
  double Height;
  double v6;
  double v7;
  double v8;
  id v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[_BKExpandedImageContentCenteringScrollView _bk_getDelegateZoomView](self, "_bk_getDelegateZoomView"));
  if (v9)
  {
    -[_BKExpandedImageContentCenteringScrollView bounds](self, "bounds");
    Width = CGRectGetWidth(v10);
    objc_msgSend(v9, "frame");
    v4 = Width - CGRectGetWidth(v11);
    -[_BKExpandedImageContentCenteringScrollView bounds](self, "bounds");
    Height = CGRectGetHeight(v12);
    objc_msgSend(v9, "frame");
    v6 = Height - CGRectGetHeight(v13);
    v7 = fmax(trunc(v4 * 0.5), 0.0);
    v8 = fmax(trunc(v6 * 0.5), 0.0);
    -[_BKExpandedImageContentCenteringScrollView setContentInset:](self, "setContentInset:", v8, v7, fmax(trunc(v6 - v8), 0.0), fmax(trunc(v4 - v7), 0.0));
  }

}

- (id)_bk_getDelegateZoomView
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_BKExpandedImageContentCenteringScrollView delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "viewForZoomingInScrollView:") & 1) != 0)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewForZoomingInScrollView:", self));
  else
    v4 = 0;

  return v4;
}

- (BOOL)hasCalculatedMinZoomScale
{
  return self->_hasCalculatedMinZoomScale;
}

- (void)setHasCalculatedMinZoomScale:(BOOL)a3
{
  self->_hasCalculatedMinZoomScale = a3;
}

@end

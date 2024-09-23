@implementation BKExpandedImageContentViewController

+ (BOOL)supportsResource:(id)a3
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "resource"));
  objc_opt_class(UIImage);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (BKExpandedImageContentViewController)initWithResource:(id)a3
{
  id v4;
  BKExpandedImageContentViewController *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  UIImage *image;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BKExpandedImageContentViewController;
  v5 = -[BKExpandedContentViewController initWithResource:](&v14, "initWithResource:", v4);
  if (v5)
  {
    *(_QWORD *)&v6 = objc_opt_class(UIImage).n128_u64[0];
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resource", v6));
    v10 = BUDynamicCast(v8, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    image = v5->_image;
    v5->_image = (UIImage *)v11;

    v5->_showOriginal = 1;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[BKExpandedImageContentViewController releaseViews](self, "releaseViews");
  v3.receiver = self;
  v3.super_class = (Class)BKExpandedImageContentViewController;
  -[BKExpandedContentViewController dealloc](&v3, "dealloc");
}

- (void)releaseViews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKExpandedImageContentViewController;
  -[BKExpandedContentViewController releaseViews](&v5, "releaseViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedImageContentViewController imageScroller](self, "imageScroller"));
  objc_msgSend(v3, "setDelegate:", 0);

  -[BKExpandedImageContentViewController setImageScroller:](self, "setImageScroller:", 0);
  -[BKExpandedImageContentViewController setImageView:](self, "setImageView:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedImageContentViewController analysisInteraction](self, "analysisInteraction"));
  objc_msgSend(v4, "setDelegate:", 0);

}

- (id)leftToolbarItems
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v9;

  if (!self->_showingFilteredImage)
    return 0;
  v3 = BookEPUBBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Invert"), &stru_1C3088, 0));

  v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", v5, 0, self, "_invert:");
  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return v7;
}

- (void)_invert:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKExpandedImageContentViewController _prepareImageShowOriginal:](self, "_prepareImageShowOriginal:", !self->_showOriginal));
  -[UIImageView setImage:](self->_imageView, "setImage:", v4);

}

- (void)showInvertedImage
{
  CGImage *v3;

  v3 = -[UIImage CGImage](self->_image, "CGImage");
  if (v3)
  {
    if (+[BEImageFilter imageIsFilteringCandidate:](BEImageFilter, "imageIsFilteringCandidate:", v3))
    {
      self->_showingFilteredImage = 1;
      self->_showOriginal = 0;
    }
  }
}

- (id)_prepareImageShowOriginal:(BOOL)a3
{
  _BOOL4 v4;
  uint64_t v5;
  UIImage *v6;
  uint64_t v8;
  UIImage *v9;

  if (!self->_showingFilteredImage)
    goto LABEL_10;
  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_imageView, "image"));
  v6 = (UIImage *)v5;
  if (self->_showOriginal != v4 || v5 == 0)
  {
    self->_showOriginal = v4;
    v8 = objc_claimAutoreleasedReturnValue(-[BKExpandedImageContentViewController currentImage:withFilter:](self, "currentImage:withFilter:", self->_image, !v4));
    if (v8)
    {
      v9 = (UIImage *)v8;

      v6 = v9;
      return v6;
    }
    if (v6)
      return v6;
LABEL_10:
    v6 = self->_image;
  }
  return v6;
}

- (id)currentImage:(id)a3 withFilter:(BOOL)a4
{
  UIImage *image;
  CGImage *v5;
  void *v6;
  UIImage *v7;

  image = self->_image;
  if (a4)
  {
    v5 = -[UIImage CGImage](image, "CGImage", a3);
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[BEImageFilter invertedImage:](BEImageFilter, "invertedImage:", v5));
      if (v6)
        v7 = (UIImage *)objc_msgSend(objc_alloc((Class)UIImage), "initWithCIImage:", v6);
      else
        v7 = 0;

    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = image;
  }
  return v7;
}

- (id)contentView
{
  void *v3;
  _BKExpandedImageContentCenteringScrollView *v4;
  void *v5;
  UIScrollView *v6;
  UIScrollView *imageScroller;
  void *v8;
  UIImageView *v9;
  UIImageView *imageView;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIImageView *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void **v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedImageContentViewController imageScroller](self, "imageScroller"));

  if (!v3)
  {
    v4 = [_BKExpandedImageContentCenteringScrollView alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedImageContentViewController view](self, "view"));
    objc_msgSend(v5, "bounds");
    v6 = -[_BKExpandedImageContentCenteringScrollView initWithFrame:](v4, "initWithFrame:");
    imageScroller = self->_imageScroller;
    self->_imageScroller = v6;

    -[UIScrollView setMaximumZoomScale:](self->_imageScroller, "setMaximumZoomScale:", 32.0);
    -[UIScrollView setDelegate:](self->_imageScroller, "setDelegate:", self);
    -[UIScrollView setBouncesZoom:](self->_imageScroller, "setBouncesZoom:", 1);
    -[UIScrollView setDecelerationRate:](self->_imageScroller, "setDecelerationRate:", UIScrollViewDecelerationRateFast);
    -[UIScrollView setAutoresizingMask:](self->_imageScroller, "setAutoresizingMask:", 18);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedImageContentViewController _prepareImageShowOriginal:](self, "_prepareImageShowOriginal:", self->_showOriginal));
    v9 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v8);
    imageView = self->_imageView;
    self->_imageView = v9;

    -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
    -[UIImageView setAutoresizingMask:](self->_imageView, "setAutoresizingMask:", 0);
    -[UIImageView setUserInteractionEnabled:](self->_imageView, "setUserInteractionEnabled:", 1);
    v11 = objc_alloc_init((Class)VKCImageAnalysisInteraction);
    -[BKExpandedImageContentViewController setAnalysisInteraction:](self, "setAnalysisInteraction:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedImageContentViewController analysisInteraction](self, "analysisInteraction"));
    objc_msgSend(v12, "setActiveInteractionTypes:", 9);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedImageContentViewController analysisInteraction](self, "analysisInteraction"));
    objc_msgSend(v13, "setAutomaticallyShowVisualSearchResults:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedImageContentViewController analysisInteraction](self, "analysisInteraction"));
    objc_msgSend(v14, "setActionInfoViewHidden:", 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedImageContentViewController analysisInteraction](self, "analysisInteraction"));
    objc_msgSend(v15, "setAnalysisButtonRequiresVisibleContentGating:", 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedImageContentViewController analysisInteraction](self, "analysisInteraction"));
    objc_msgSend(v16, "setDelegate:", self);

    v17 = self->_imageView;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedImageContentViewController analysisInteraction](self, "analysisInteraction"));
    -[UIImageView addInteraction:](v17, "addInteraction:", v18);

    v19 = objc_alloc_init((Class)VKCImageAnalyzer);
    -[BKExpandedImageContentViewController setImageAnalyzer:](self, "setImageAnalyzer:", v19);

    v20 = objc_msgSend(objc_alloc((Class)VKCImageAnalyzerRequest), "initWithImage:requestType:", self->_image, -1);
    objc_initWeak(&location, self);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedImageContentViewController imageAnalyzer](self, "imageAnalyzer"));
    v29 = _NSConcreteStackBlock;
    v30 = 3221225472;
    v31 = sub_BCEF0;
    v32 = &unk_1C10F8;
    objc_copyWeak(&v33, &location);
    objc_msgSend(v21, "processRequest:progressHandler:completionHandler:", v20, 0, &v29);

    -[UIScrollView addSubview:](self->_imageScroller, "addSubview:", self->_imageView, v29, v30, v31, v32);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedImageContentViewController imageScroller](self, "imageScroller"));
    objc_msgSend(v22, "minimumZoomScale");
    v24 = v23;

    -[UIScrollView setMinimumZoomScale:](self->_imageScroller, "setMinimumZoomScale:", fmin(v24, 1.0));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedImageContentViewController imageScroller](self, "imageScroller"));
    objc_msgSend(v25, "minimumZoomScale");
    v27 = v26;

    -[UIScrollView setZoomScale:](self->_imageScroller, "setZoomScale:", fmin(v27, 2.0));
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

  }
  return (id)objc_claimAutoreleasedReturnValue(-[BKExpandedImageContentViewController imageScroller](self, "imageScroller"));
}

- (id)imageAnalysisInteraction:(id)a3 updateStringForCopy:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController delegate](self, "delegate"));
  v7 = v5;
  if ((objc_opt_respondsToSelector(v6, "expandedContentViewController:stringForCopyFromString:") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "expandedContentViewController:stringForCopyFromString:", self, v5));

  }
  return v7;
}

- (id)imageAnalysisInteraction:(id)a3 updateAttributedStringForCopy:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController delegate](self, "delegate"));
  v7 = v5;
  if ((objc_opt_respondsToSelector(v6, "expandedContentViewController:stringForCopyFromString:") & 1) != 0)
  {
    v8 = objc_alloc((Class)NSAttributedString);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "string"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "expandedContentViewController:stringForCopyFromString:", self, v9));
    v7 = objc_msgSend(v8, "initWithString:", v10);

  }
  return v7;
}

- (BOOL)imageAnalysisInteraction:(id)a3 shouldHandleShareWithRanges:(id)a4 boundingRect:(CGRect)a5 selectedText:(id)a6 selectedAttributedText:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v13, "expandedContentViewController:shareText:sourceRect:") & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedImageContentViewController imageView](self, "imageView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedImageContentViewController view](self, "view"));
    objc_msgSend(v14, "convertRect:toView:", v15, x, y, width, height);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    objc_msgSend(v13, "expandedContentViewController:shareText:sourceRect:", self, v12, v17, v19, v21, v23);
  }

  return 0;
}

- (UIScrollView)imageScroller
{
  return self->_imageScroller;
}

- (void)setImageScroller:(id)a3
{
  objc_storeStrong((id *)&self->_imageScroller, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)showOriginal
{
  return self->_showOriginal;
}

- (void)setShowOriginal:(BOOL)a3
{
  self->_showOriginal = a3;
}

- (BOOL)showingFilteredImage
{
  return self->_showingFilteredImage;
}

- (void)setShowingFilteredImage:(BOOL)a3
{
  self->_showingFilteredImage = a3;
}

- (VKCImageAnalysisInteraction)analysisInteraction
{
  return self->_analysisInteraction;
}

- (void)setAnalysisInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_analysisInteraction, a3);
}

- (VKCImageAnalyzer)imageAnalyzer
{
  return self->_imageAnalyzer;
}

- (void)setImageAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_imageAnalyzer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAnalyzer, 0);
  objc_storeStrong((id *)&self->_analysisInteraction, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_imageScroller, 0);
}

@end

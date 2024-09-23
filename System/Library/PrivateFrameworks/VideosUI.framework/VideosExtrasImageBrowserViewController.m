@implementation VideosExtrasImageBrowserViewController

- (VideosExtrasImageBrowserViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  VideosExtrasImageBrowserViewController *v4;
  VideosExtrasImageBrowserViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VideosExtrasImageBrowserViewController;
  v4 = -[VideosExtrasImageBrowserViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[VideosExtrasImageBrowserViewController setAutomaticallyAdjustsScrollViewInsets:](v4, "setAutomaticallyAdjustsScrollViewInsets:", 0);
    v5->_visibleImageIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[VideosExtrasImageBrowserViewController _removePageViewController](self, "_removePageViewController");
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasImageBrowserViewController;
  -[VideosExtrasImageBrowserViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VideosExtrasImageBrowserViewController;
  -[VideosExtrasImageBrowserViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[VideosExtrasImageBrowserViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[VideosExtrasImageBrowserViewController pageViewController](self, "pageViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[VideosExtrasImageBrowserViewController _addPageViewForController:toView:](self, "_addPageViewForController:toView:", v5, v3);

}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  char *v5;

  v5 = (char *)objc_msgSend(a4, "imageIndex", a3);
  if (v5)
  {
    -[VideosExtrasImageBrowserViewController _imageViewControllerAtIndex:](self, "_imageViewControllerAtIndex:", v5 - 1);
    v5 = (char *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  unint64_t v5;
  void *v6;

  v5 = objc_msgSend(a4, "imageIndex", a3) + 1;
  if (v5 >= -[VideosExtrasImageBrowserViewController _numberOfImages](self, "_numberOfImages"))
  {
    v6 = 0;
  }
  else
  {
    -[VideosExtrasImageBrowserViewController _imageViewControllerAtIndex:](self, "_imageViewControllerAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(a4, "firstObject", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsPinchingImageForInteractiveZoomingImageTransition:", -[VideosExtrasImageBrowserViewController allowsPinchingImageForInteractiveZoomingImageTransition](self, "allowsPinchingImageForInteractiveZoomingImageTransition"));
  -[VideosExtrasImageBrowserViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "imageBrowserViewController:willTransitionToImageAtIndex:", self, objc_msgSend(v6, "imageIndex"));

}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  _BOOL4 v6;
  void *v8;
  void *v9;
  id v10;

  v6 = a6;
  objc_msgSend(a3, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAllowsPinchingImageForInteractiveZoomingImageTransition:", -[VideosExtrasImageBrowserViewController allowsPinchingImageForInteractiveZoomingImageTransition](self, "allowsPinchingImageForInteractiveZoomingImageTransition"));
  self->_visibleImageIndex = objc_msgSend(v10, "imageIndex");
  -[VideosExtrasImageBrowserViewController _updateTitle](self, "_updateTitle");
  -[VideosExtrasImageBrowserViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "imageBrowserViewController:didCompleteTransitionToImageAtIndex:", self, objc_msgSend(v10, "imageIndex"));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "imageBrowserViewControllerDidCancelTransition:", self);
  }

}

- (void)prepareZoomingImageTransitionWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VideosExtrasImageBrowserViewController setVisibleImageIndex:](self, "setVisibleImageIndex:", objc_msgSend(v4, "itemIndex"));
  -[VideosExtrasImageBrowserViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[VideosExtrasImageBrowserViewController _visibleImageViewController](self, "_visibleImageViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareZoomingImageTransitionWithContext:", v4);

}

- (void)performZoomingImageTransitionWithContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VideosExtrasImageBrowserViewController _visibleImageViewController](self, "_visibleImageViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performZoomingImageTransitionWithContext:", v4);

}

- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[VideosExtrasImageBrowserViewController _visibleImageViewController](self, "_visibleImageViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finalizeZoomingImageTransitionWithContext:transitionFinished:", v6, v4);

  -[VideosExtrasImageBrowserViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 0);

}

- (void)handlePinchGestureForZoomingImageInteractiveTransitionWithContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VideosExtrasImageBrowserViewController zoomingImageInteractiveTransitionSource](self, "zoomingImageInteractiveTransitionSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handlePinchGestureForZoomingImageInteractiveTransitionWithContext:", v4);

}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[VideosExtrasImageBrowserViewController _updatePageViewController](self, "_updatePageViewController");
    v5 = obj;
  }

}

- (void)setAllowsPinchingImageForInteractiveZoomingImageTransition:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_allowsPinchingImageForInteractiveZoomingImageTransition != a3)
  {
    v3 = a3;
    self->_allowsPinchingImageForInteractiveZoomingImageTransition = a3;
    -[VideosExtrasImageBrowserViewController _visibleImageViewController](self, "_visibleImageViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAllowsPinchingImageForInteractiveZoomingImageTransition:", v3);

  }
}

- (void)setVisibleImageIndex:(unint64_t)a3
{
  if (self->_visibleImageIndex != a3)
  {
    self->_visibleImageIndex = a3;
    -[VideosExtrasImageBrowserViewController _updatePageViewController](self, "_updatePageViewController");
    -[VideosExtrasImageBrowserViewController _updateTitle](self, "_updateTitle");
  }
}

- (void)_addPageViewForController:(id)a3 toView:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  objc_msgSend(a3, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "addSubview:", v7);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v7, v5, 15, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConstraints:", v6);

}

- (id)_imageViewControllerAtIndex:(unint64_t)a3
{
  VideosExtrasImageViewController *v5;
  void *v6;
  uint64_t v7;
  VideosExtrasImageViewController *v8;
  void *v9;
  VideosExtrasImageViewController *v10;
  void *v11;
  VideosExtrasImageViewController *v12;
  void *v13;
  VideosExtrasImageViewController *v14;
  VideosExtrasImageViewController *v15;
  VideosExtrasImageViewController *v16;
  _QWORD v18[4];
  VideosExtrasImageViewController *v19;
  _QWORD v20[4];
  VideosExtrasImageViewController *v21;
  _QWORD v22[4];
  VideosExtrasImageViewController *v23;
  _QWORD v24[4];
  VideosExtrasImageViewController *v25;

  v5 = objc_alloc_init(VideosExtrasImageViewController);
  -[VideosExtrasImageViewController setImageIndex:](v5, "setImageIndex:", a3);
  -[VideosExtrasImageViewController setZoomingImageTransitionIdentifier:](v5, "setZoomingImageTransitionIdentifier:", CFSTR("VideosExtrasImageBrowserZoomingImageTransitionIdentifier"));
  -[VideosExtrasImageBrowserViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __70__VideosExtrasImageBrowserViewController__imageViewControllerAtIndex___block_invoke;
  v24[3] = &unk_1E9F9BAC8;
  v8 = v5;
  v25 = v8;
  objc_msgSend(v6, "imageBrowserViewController:loadImageAtIndex:withCompletionHandler:", self, a3, v24);

  -[VideosExtrasImageBrowserViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v7;
  v22[1] = 3221225472;
  v22[2] = __70__VideosExtrasImageBrowserViewController__imageViewControllerAtIndex___block_invoke_2;
  v22[3] = &unk_1E9F9BAF0;
  v10 = v8;
  v23 = v10;
  objc_msgSend(v9, "imageBrowserViewController:loadTitleAtIndex:withCompletionHandler:", self, a3, v22);

  -[VideosExtrasImageBrowserViewController dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  v20[1] = 3221225472;
  v20[2] = __70__VideosExtrasImageBrowserViewController__imageViewControllerAtIndex___block_invoke_3;
  v20[3] = &unk_1E9F9BAF0;
  v12 = v10;
  v21 = v12;
  objc_msgSend(v11, "imageBrowserViewController:loadSubtitleAtIndex:withCompletionHandler:", self, a3, v20);

  -[VideosExtrasImageBrowserViewController dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __70__VideosExtrasImageBrowserViewController__imageViewControllerAtIndex___block_invoke_4;
  v18[3] = &unk_1E9F9BAF0;
  v14 = v12;
  v19 = v14;
  objc_msgSend(v13, "imageBrowserViewController:loadDescriptionAtIndex:withCompletionHandler:", self, a3, v18);

  v15 = v19;
  v16 = v14;

  return v16;
}

uint64_t __70__VideosExtrasImageBrowserViewController__imageViewControllerAtIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:", a2);
}

uint64_t __70__VideosExtrasImageBrowserViewController__imageViewControllerAtIndex___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTitleString:", a2);
}

uint64_t __70__VideosExtrasImageBrowserViewController__imageViewControllerAtIndex___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSubtitleString:", a2);
}

uint64_t __70__VideosExtrasImageBrowserViewController__imageViewControllerAtIndex___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDescriptionString:", a2);
}

- (unint64_t)_numberOfImages
{
  void *v3;
  unint64_t v4;

  -[VideosExtrasImageBrowserViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfImagesForBrowserViewController:", self);

  return v4;
}

- (void)_removePageViewController
{
  void *v3;
  id v4;

  -[VideosExtrasImageBrowserViewController pageViewController](self, "pageViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "willMoveToParentViewController:", 0);
    if (-[VideosExtrasImageBrowserViewController isViewLoaded](self, "isViewLoaded"))
    {
      objc_msgSend(v4, "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeFromSuperview");

    }
    objc_msgSend(v4, "removeFromParentViewController");
    objc_msgSend(v4, "setDataSource:", 0);
    objc_msgSend(v4, "setDelegate:", 0);
    -[VideosExtrasImageBrowserViewController setPageViewController:](self, "setPageViewController:", 0);
  }

}

- (void)_updatePageViewController
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[VideosExtrasImageBrowserViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[VideosExtrasImageBrowserViewController visibleImageIndex](self, "visibleImageIndex");
  if (!v3 || (v5 = v4, v4 == 0x7FFFFFFFFFFFFFFFLL))
  {
    -[VideosExtrasImageBrowserViewController _removePageViewController](self, "_removePageViewController");
  }
  else
  {
    -[VideosExtrasImageBrowserViewController pageViewController](self, "pageViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v12 = *MEMORY[0x1E0DC51B0];
      v13[0] = &unk_1EA0BBBF8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A98]), "initWithTransitionStyle:navigationOrientation:options:", 1, 0, v7);
      objc_msgSend(v6, "setDataSource:", self);
      objc_msgSend(v6, "setDelegate:", self);
      -[VideosExtrasImageBrowserViewController addChildViewController:](self, "addChildViewController:", v6);
      if (-[VideosExtrasImageBrowserViewController isViewLoaded](self, "isViewLoaded"))
      {
        -[VideosExtrasImageBrowserViewController view](self, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[VideosExtrasImageBrowserViewController _addPageViewForController:toView:](self, "_addPageViewForController:toView:", v6, v8);

      }
      objc_msgSend(v6, "didMoveToParentViewController:", self);
      -[VideosExtrasImageBrowserViewController setPageViewController:](self, "setPageViewController:", v6);

    }
    -[VideosExtrasImageBrowserViewController _imageViewControllerAtIndex:](self, "_imageViewControllerAtIndex:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setViewControllers:direction:animated:completion:", v10, 0, 0, 0);

  }
}

- (void)_updateTitle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PAGE_NUMBER_WITH_COUNT_%lu_%lu"), 0, CFSTR("VideosExtras"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v5, -[VideosExtrasImageBrowserViewController visibleImageIndex](self, "visibleImageIndex") + 1, -[VideosExtrasImageBrowserViewController _numberOfImages](self, "_numberOfImages"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[VideosExtrasImageBrowserViewController setTitle:](self, "setTitle:", v6);
}

- (id)_visibleImageViewController
{
  void *v2;
  void *v3;
  void *v4;

  -[VideosExtrasImageBrowserViewController pageViewController](self, "pageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (VideosExtrasImageBrowserViewControllerDataSource)dataSource
{
  return (VideosExtrasImageBrowserViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (VideosExtrasImageBrowserViewControllerDelegate)delegate
{
  return (VideosExtrasImageBrowserViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VideosExtrasZoomingImageInteractiveTransitionSource)zoomingImageInteractiveTransitionSource
{
  return (VideosExtrasZoomingImageInteractiveTransitionSource *)objc_loadWeakRetained((id *)&self->_zoomingImageInteractiveTransitionSource);
}

- (void)setZoomingImageInteractiveTransitionSource:(id)a3
{
  objc_storeWeak((id *)&self->_zoomingImageInteractiveTransitionSource, a3);
}

- (BOOL)allowsPinchingImageForInteractiveZoomingImageTransition
{
  return self->_allowsPinchingImageForInteractiveZoomingImageTransition;
}

- (unint64_t)visibleImageIndex
{
  return self->_visibleImageIndex;
}

- (UIPageViewController)pageViewController
{
  return self->_pageViewController;
}

- (void)setPageViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pageViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageViewController, 0);
  objc_destroyWeak((id *)&self->_zoomingImageInteractiveTransitionSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end

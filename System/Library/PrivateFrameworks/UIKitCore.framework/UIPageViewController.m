@implementation UIPageViewController

+ (BOOL)_isSupportedTransitionStyle:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

+ (BOOL)_isNavigationOrientation:(int64_t)a3 supportedForTransitionStyle:(int64_t)a4
{
  return (unint64_t)a3 < 2;
}

+ (BOOL)_isSpineLocation:(int64_t)a3 supportedForTransitionStyle:(int64_t)a4
{
  BOOL v5;

  v5 = a3 == 101 || (unint64_t)(a3 - 1) < 3;
  if (a4)
    return a3 == 0;
  else
    return v5;
}

+ (BOOL)doesOverridePreferredInterfaceOrientationForPresentation
{
  return objc_msgSend(a1, "doesOverrideViewControllerMethod:inBaseClass:", sel_preferredInterfaceOrientationForPresentation, objc_opt_class());
}

- (UIPageViewController)initWithTransitionStyle:(UIPageViewControllerTransitionStyle)style navigationOrientation:(UIPageViewControllerNavigationOrientation)navigationOrientation options:(NSDictionary *)options
{
  NSDictionary *v8;
  UIPageViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  float v15;
  objc_super v17;

  v8 = options;
  v17.receiver = self;
  v17.super_class = (Class)UIPageViewController;
  v9 = -[UIViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  if (v9)
  {
    if (!objc_msgSend((id)objc_opt_class(), "_isSupportedTransitionStyle:", style))
      style = UIPageViewControllerTransitionStylePageCurl;
    if (objc_msgSend((id)objc_opt_class(), "_isNavigationOrientation:supportedForTransitionStyle:", navigationOrientation, style))v10 = (void *)navigationOrientation;
    else
      v10 = 0;
    UIPageViewControllerCommonInitWithTransitionStyleAndNavigationOrientation(v9, (void *)style, v10);
    if (v8)
    {
      if (style == UIPageViewControllerTransitionStyleScroll)
      {
        -[NSDictionary objectForKey:](v8, "objectForKey:", CFSTR("UIPageViewControllerOptionInterPageSpacingKey"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "floatValue");
        -[UIPageViewController _setPageSpacing:](v9, "_setPageSpacing:", v15);

      }
      else if (style == UIPageViewControllerTransitionStylePageCurl)
      {
        -[NSDictionary objectForKey:](v8, "objectForKey:", CFSTR("UIPageViewControllerOptionSpineLocationKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[NSDictionary objectForKey:](v8, "objectForKey:", CFSTR("UIPageViewControllerOptionSpineLocationKey"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "integerValue");

          if (objc_msgSend((id)objc_opt_class(), "_isSpineLocation:supportedForTransitionStyle:", v13, v9->_transitionStyle))-[UIPageViewController _setSpineLocation:](v9, "_setSpineLocation:", v13);
        }
      }
    }
  }

  return v9;
}

- (UIPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[UIPageViewController initWithTransitionStyle:navigationOrientation:options:](self, "initWithTransitionStyle:navigationOrientation:options:", 0, 0, 0);
}

- (BOOL)_shouldPersistViewWhenCoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  id v7;
  id v8;
  NSArray *viewControllers;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIPageViewController;
  -[UIViewController encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v4, "encodeConditionalObject:forKey:", v6, CFSTR("UIDelegate"));

  }
  v7 = objc_loadWeakRetained((id *)&self->_dataSource);

  if (v7)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v4, "encodeConditionalObject:forKey:", v8, CFSTR("UIDataSource"));

  }
  objc_msgSend(v4, "encodeInteger:forKey:", self->_transitionStyle, CFSTR("UITransitionStyle"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_navigationOrientation, CFSTR("UINavigationOrientation"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_spineLocation, CFSTR("UISpineLocation"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_doubleSided, CFSTR("UIDoubleSided"));
  viewControllers = self->_viewControllers;
  -[UIViewController childViewControllers](self, "childViewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(viewControllers) = -[NSArray isEqual:](viewControllers, "isEqual:", v10);

  if ((_DWORD)viewControllers)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIViewControllersAreChildren"));
  else
    objc_msgSend(v4, "encodeObject:forKey:", self->_viewControllers, CFSTR("UIViewControllers"));
  objc_msgSend(v4, "encodeInteger:forKey:", (uint64_t)self->_pageSpacing, CFSTR("UIPageSpacing"));

}

- (UIPageViewController)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UIPageViewController *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *viewControllers;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = coder;
  v15.receiver = self;
  v15.super_class = (Class)UIPageViewController;
  v5 = -[UIViewController initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UITransitionStyle")))
    {
      v6 = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UITransitionStyle"));
      if (!objc_msgSend((id)objc_opt_class(), "_isSupportedTransitionStyle:", v6))
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UINavigationOrientation")))
    {
      v7 = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UINavigationOrientation"));
      if (objc_msgSend((id)objc_opt_class(), "_isNavigationOrientation:supportedForTransitionStyle:", v7, v6))v8 = (void *)v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    UIPageViewControllerCommonInitWithTransitionStyleAndNavigationOrientation(v5, v6, v8);
    v5->_doubleSided = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIDoubleSided"));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISpineLocation")))
    {
      v9 = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UISpineLocation"));
      if (objc_msgSend((id)objc_opt_class(), "_isSpineLocation:supportedForTransitionStyle:", v9, v5->_transitionStyle))-[UIPageViewController _setSpineLocation:](v5, "_setSpineLocation:", v9);
    }
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIViewControllersAreChildren")))
      -[UIViewController childViewControllers](v5, "childViewControllers");
    else
      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIViewControllers"));
    v10 = objc_claimAutoreleasedReturnValue();
    viewControllers = v5->_viewControllers;
    v5->_viewControllers = (NSArray *)v10;

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIDelegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageViewController setDelegate:](v5, "setDelegate:", v12);

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIDataSource"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageViewController setDataSource:](v5, "setDataSource:", v13);

    -[UIPageViewController _setPageSpacing:](v5, "_setPageSpacing:", (double)-[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIPageSpacing")));
  }

  return v5;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CGRect *tapRegions;
  void *v10;
  void *v11;
  objc_super v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = WeakRetained;
  if (WeakRetained)
    objc_setAssociatedObject(WeakRetained, (char *)&self->super.super.super.isa + 2, 0, (void *)1);

  v5 = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = v5;
  if (v5)
    objc_setAssociatedObject(v5, (char *)&self->super.super.super.isa + 1, 0, (void *)1);

  -[UIGestureRecognizer view](self->_panGestureRecognizer, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeGestureRecognizer:", self->_panGestureRecognizer);

  -[UIGestureRecognizer removeTarget:action:](self->_panGestureRecognizer, "removeTarget:action:", self, sel__handlePanGesture_);
  -[UIGestureRecognizer view](self->_tapGestureRecognizer, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeGestureRecognizer:", self->_tapGestureRecognizer);

  -[UIGestureRecognizer removeTarget:action:](self->_tapGestureRecognizer, "removeTarget:action:", self, sel__handleTapGesture_);
  tapRegions = self->_tapRegions;
  if (tapRegions)
  {
    free(tapRegions);
    self->_tapRegions = 0;
  }
  -[UIPageViewController _contentView](self, "_contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIPageViewController _contentView](self, "_contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidatePageViewController");

  }
  v12.receiver = self;
  v12.super_class = (Class)UIPageViewController;
  -[UIViewController dealloc](&v12, sel_dealloc);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  id v4;
  char v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  UIPageViewControllerDelegate *v9;
  id WeakRetained;
  void *v11;
  UIPageViewControllerDelegate *v12;
  UIPageViewControllerDelegate *v13;
  unsigned int v14;
  _UIWeakHelper *v15;
  _UIWeakHelper *v16;
  __int16 v17;
  __int16 v18;
  __int16 delegateFlags;
  __int16 v20;
  __int16 v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id location;
  _QWORD block[4];
  id v30;
  UIPageViewController *v31;

  v4 = delegate;
  if (!v4)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v5 = dyld_program_sdk_at_least();
  v6 = v4;
  if ((v5 & 1) == 0)
  {
    v7 = objc_msgSend(v4, sel_allowsWeakReference);
    v6 = v4;
    if ((v7 & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__UIPageViewController_setDelegate___block_invoke;
      block[3] = &unk_1E16B1B50;
      v8 = v4;
      v30 = v8;
      v31 = self;
      if (setDelegate__once_1 != -1)
      {
        dispatch_once(&setDelegate__once_1, block);
        v8 = v30;
      }

      goto LABEL_7;
    }
  }
LABEL_8:
  v9 = v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = WeakRetained;
  if (self->_unsafeUnretainedDelegate != v9)
  {
    self->_unsafeUnretainedDelegate = v9;
    if (WeakRetained)
      objc_setAssociatedObject(WeakRetained, (char *)&self->super.super.super.isa + 1, 0, (void *)1);
    objc_storeWeak((id *)&self->_delegate, v9);
    v12 = v9;
    -[UIPageViewController delegate](self, "delegate");
    v13 = (UIPageViewControllerDelegate *)objc_claimAutoreleasedReturnValue();
    if (v12 == v13)
    {
      v14 = -[UIPageViewController allowsWeakReference](self, sel_allowsWeakReference);

      if (v12 && v14)
      {
        objc_initWeak(&location, self);
        v15 = [_UIWeakHelper alloc];
        v23 = MEMORY[0x1E0C809B0];
        v24 = 3221225472;
        v25 = __36__UIPageViewController_setDelegate___block_invoke_79;
        v26 = &unk_1E16B3F40;
        objc_copyWeak(&v27, &location);
        v16 = -[_UIWeakHelper initWithDeallocationBlock:](v15, "initWithDeallocationBlock:", &v23);
        objc_setAssociatedObject(v12, (char *)&self->super.super.super.isa + 1, v16, (void *)1);

        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }
    }
    else
    {

    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 2;
    else
      v17 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFD | v17;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = 4;
    else
      v18 = 0;
    delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFB | v18;
    *(_WORD *)&self->_delegateFlags = delegateFlags;
    if (self->_transitionStyle)
    {
      v20 = 0;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v20 = 8;
      else
        v20 = 0;
      delegateFlags = (__int16)self->_delegateFlags;
    }
    *(_WORD *)&self->_delegateFlags = delegateFlags & 0xFFF7 | v20;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = 16;
    else
      v21 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFEF | v21;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = 32;
    else
      v22 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFDF | v22;
    -[UIPageViewController _updatePageControlViaDataSourceIfNecessary](self, "_updatePageControlViaDataSourceIfNecessary", v23, v24, v25, v26);
  }

}

void __36__UIPageViewController_setDelegate___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = kUIPageViewControllerNavigationDirectionUndetermined_block_invoke___s_category;
  if (!kUIPageViewControllerNavigationDirectionUndetermined_block_invoke___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&kUIPageViewControllerNavigationDirectionUndetermined_block_invoke___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "You are trying to set a deallocating object as a delegate. This will be a hard crash in the future. Offending object: %@ hostObject: %@", (uint8_t *)&v6, 0x16u);
  }
}

void __36__UIPageViewController_setDelegate___block_invoke_79(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
      objc_msgSend(v3, "setDelegate:", 0);

    WeakRetained = v3;
  }

}

- (id)dataSource
{
  return objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)dataSource
{
  id v4;
  char v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  UIPageViewControllerDataSource *v9;
  id WeakRetained;
  void *v11;
  UIPageViewControllerDataSource *v12;
  UIPageViewControllerDataSource *v13;
  unsigned int v14;
  _UIWeakHelper *v15;
  _UIWeakHelper *v16;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  __int16 v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  id location;
  _QWORD block[4];
  id v34;
  UIPageViewController *v35;

  v4 = dataSource;
  if (!v4)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v5 = dyld_program_sdk_at_least();
  v6 = v4;
  if ((v5 & 1) == 0)
  {
    v7 = objc_msgSend(v4, sel_allowsWeakReference);
    v6 = v4;
    if ((v7 & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__UIPageViewController_setDataSource___block_invoke;
      block[3] = &unk_1E16B1B50;
      v8 = v4;
      v34 = v8;
      v35 = self;
      if (setDataSource__once_0 != -1)
      {
        dispatch_once(&setDataSource__once_0, block);
        v8 = v34;
      }

      goto LABEL_7;
    }
  }
LABEL_8:
  v9 = v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v11 = WeakRetained;
  if (self->_unsafeUnretainedDataSource != v9)
  {
    self->_unsafeUnretainedDataSource = v9;
    if (WeakRetained)
      objc_setAssociatedObject(WeakRetained, (char *)&self->super.super.super.isa + 2, 0, (void *)1);
    objc_storeWeak((id *)&self->_dataSource, v9);
    v12 = v9;
    -[UIPageViewController dataSource](self, "dataSource");
    v13 = (UIPageViewControllerDataSource *)objc_claimAutoreleasedReturnValue();
    if (v12 == v13)
    {
      v14 = -[UIPageViewController allowsWeakReference](self, sel_allowsWeakReference);

      if (v12 && v14)
      {
        objc_initWeak(&location, self);
        v15 = [_UIWeakHelper alloc];
        v27 = MEMORY[0x1E0C809B0];
        v28 = 3221225472;
        v29 = __38__UIPageViewController_setDataSource___block_invoke_92;
        v30 = &unk_1E16B3F40;
        objc_copyWeak(&v31, &location);
        v16 = -[_UIWeakHelper initWithDeallocationBlock:](v15, "initWithDeallocationBlock:", &v27);
        objc_setAssociatedObject(v12, (char *)&self->super.super.super.isa + 2, v16, (void *)1);

        objc_destroyWeak(&v31);
        objc_destroyWeak(&location);
      }
    }
    else
    {

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 64;
    else
      v17 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFBF | v17;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = 128;
    else
      v18 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFF7F | v18;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = 256;
    else
      v19 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFEFF | v19;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = 512;
    else
      v20 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFDFF | v20;
    if (-[UIViewController isViewLoaded](self, "isViewLoaded", v27, v28, v29, v30))
    {
      v21 = -[UIPageViewController _canHandleGestures](self, "_canHandleGestures");
      -[UIPageViewController _scrollView](self, "_scrollView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isScrollEnabled");

      if (v21 != v23)
      {
        -[UIPageViewController _scrollView](self, "_scrollView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setScrollEnabled:", -[UIPageViewController _canHandleGestures](self, "_canHandleGestures"));

      }
      -[UIPageViewController _scrollView](self, "_scrollView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_invalidateOffscreenViews");

      -[UIPageViewController _contentView](self, "_contentView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setNeedsLayout");

    }
  }

}

void __38__UIPageViewController_setDataSource___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = kUIPageViewControllerNavigationDirectionUndetermined_block_invoke_2___s_category;
  if (!kUIPageViewControllerNavigationDirectionUndetermined_block_invoke_2___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&kUIPageViewControllerNavigationDirectionUndetermined_block_invoke_2___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "You are trying to set a deallocating object as dataSource. This will be a hard crash in the future. Offending object: %@ hosting object: %@", (uint8_t *)&v6, 0x16u);
  }
}

void __38__UIPageViewController_setDataSource___block_invoke_92(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "dataSource");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
      objc_msgSend(v3, "setDataSource:", 0);

    WeakRetained = v3;
  }

}

- (int64_t)_transitionStyle
{
  return self->_transitionStyle;
}

- (int64_t)_navigationOrientation
{
  return self->_navigationOrientation;
}

- (void)_setSpineLocation:(int64_t)a3
{
  BOOL v3;

  if (self->_transitionStyle)
  {
    v3 = 0;
    self->_spineLocation = 0;
LABEL_3:
    self->_doubleSided = v3;
    return;
  }
  if (self->_spineLocation != a3)
  {
    self->_spineLocation = a3;
    if (a3 == 2)
    {
      v3 = 1;
      goto LABEL_3;
    }
  }
}

- (UIPageViewControllerSpineLocation)spineLocation
{
  return self->_spineLocation;
}

- (BOOL)isDoubleSided
{
  return self->_doubleSided;
}

- (void)setDoubleSided:(BOOL)doubleSided
{
  if (!self->_transitionStyle && self->_doubleSided != doubleSided)
  {
    self->_doubleSided = doubleSided;
    if (!self->_stashingViewControllersForRotation && !doubleSided && self->_spineLocation == 2)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("If 'UIPageViewControllerSpineLocationMid' is specified, 'doubleSided' must be 'YES'."));
  }
}

- (NSArray)gestureRecognizers
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->_panGestureRecognizer, self->_tapGestureRecognizer, 0);
}

- (NSArray)viewControllers
{
  int64_t transitionStyle;
  void *v4;
  NSArray *viewControllersStashedForRotation;
  void *v6;
  void *v7;
  void *v8;

  transitionStyle = self->_transitionStyle;
  if (transitionStyle == 1)
  {
    v6 = (void *)MEMORY[0x1E0C99D20];
    -[NSArray _ui_onlyObject](self->_viewControllers, "_ui_onlyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithObjects:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (transitionStyle)
  {
    v8 = 0;
  }
  else
  {
    if (self->_stashingViewControllersForRotation
      && -[NSArray count](self->_viewControllersStashedForRotation, "count"))
    {
      v4 = (void *)MEMORY[0x1E0C99D20];
      viewControllersStashedForRotation = self->_viewControllersStashedForRotation;
    }
    else
    {
      v4 = (void *)MEMORY[0x1E0C99D20];
      viewControllersStashedForRotation = self->_viewControllers;
    }
    objc_msgSend(v4, "arrayWithArray:", viewControllersStashedForRotation);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v8;
}

- (void)_invalidateEffectiveTapRegions
{
  CGRect *tapRegions;

  *(_OWORD *)&self->_effectiveTapRegionInsets.top = 0u;
  *(_OWORD *)&self->_effectiveTapRegionInsets.bottom = 0u;
  self->_effectiveTapRegionBreadths = (CGSize)*MEMORY[0x1E0C9D820];
  tapRegions = self->_tapRegions;
  if (tapRegions)
  {
    free(tapRegions);
    self->_tapRegions = 0;
  }
}

- (UIEdgeInsets)_effectiveTapRegionInsets
{
  UIEdgeInsets *p_effectiveTapRegionInsets;
  double top;
  double left;
  double bottom;
  double right;
  __int128 v8;
  void *v9;
  double Height;
  void *v11;
  double Width;
  double v13;
  double v14;
  CGRect v15;
  CGRect v16;
  UIEdgeInsets result;

  p_effectiveTapRegionInsets = &self->_effectiveTapRegionInsets;
  top = self->_effectiveTapRegionInsets.top;
  left = self->_effectiveTapRegionInsets.left;
  bottom = self->_effectiveTapRegionInsets.bottom;
  right = self->_effectiveTapRegionInsets.right;
  if (top == 0.0 && bottom == 0.0 && left == 0.0 && right == 0.0)
  {
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_tapRegionInsets.top), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_tapRegionInsets.bottom))))) & 1) != 0)
    {
      v8 = *(_OWORD *)&self->_tapRegionInsets.bottom;
      *(_OWORD *)&p_effectiveTapRegionInsets->top = *(_OWORD *)&self->_tapRegionInsets.top;
      *(_OWORD *)&self->_effectiveTapRegionInsets.bottom = v8;
    }
    -[UIGestureRecognizer view](self->_tapGestureRecognizer, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    Height = CGRectGetHeight(v15);

    -[UIGestureRecognizer view](self->_tapGestureRecognizer, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    Width = CGRectGetWidth(v16);

    v13 = p_effectiveTapRegionInsets->left;
    top = fmax(p_effectiveTapRegionInsets->top, 0.0);
    if (Height <= top)
      top = Height;
    bottom = Height - top;
    v14 = fmax(p_effectiveTapRegionInsets->bottom, 0.0);
    if (Height - top > v14)
      bottom = v14;
    right = fmax(p_effectiveTapRegionInsets->right, 0.0);
    if (Width <= right)
      right = Width;
    p_effectiveTapRegionInsets->bottom = bottom;
    p_effectiveTapRegionInsets->right = right;
    left = fmax(v13, 0.0);
    if (Width - right <= left)
      left = Width - right;
    p_effectiveTapRegionInsets->top = top;
    p_effectiveTapRegionInsets->left = left;
  }
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_setTapRegionInsets:(UIEdgeInsets)a3
{
  if (self->_tapRegionInsets.left != a3.left
    || self->_tapRegionInsets.top != a3.top
    || self->_tapRegionInsets.right != a3.right
    || self->_tapRegionInsets.bottom != a3.bottom)
  {
    self->_tapRegionInsets = a3;
    -[UIPageViewController _invalidateEffectiveTapRegions](self, "_invalidateEffectiveTapRegions");
  }
}

- (CGSize)_effectiveTapRegionBreadths
{
  CGSize *p_effectiveTapRegionBreadths;
  double width;
  double height;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGSize result;
  CGRect v17;
  CGRect v18;

  p_effectiveTapRegionBreadths = &self->_effectiveTapRegionBreadths;
  width = self->_effectiveTapRegionBreadths.width;
  height = self->_effectiveTapRegionBreadths.height;
  if (width == 0.0 && height == 0.0)
  {
    if (self->_tapRegionBreadths.width == 0.0 && self->_tapRegionBreadths.height == 0.0)
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "userInterfaceIdiom");

      v8 = 80.0;
      if (self->_spineLocation == 2)
        v8 = 60.0;
      if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v9 = dbl_18667A290[self->_spineLocation == 2];
      else
        v9 = v8;
      p_effectiveTapRegionBreadths->width = v9;
      p_effectiveTapRegionBreadths->height = v9;
    }
    else
    {
      *p_effectiveTapRegionBreadths = self->_tapRegionBreadths;
      v9 = p_effectiveTapRegionBreadths->width;
    }
    -[UIGestureRecognizer view](self->_tapGestureRecognizer, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v11 = CGRectGetWidth(v17) * 0.5;

    if (v9 <= v11)
      v12 = v9;
    else
      v12 = v11;
    p_effectiveTapRegionBreadths->width = v12;
    v13 = p_effectiveTapRegionBreadths->height;
    -[UIGestureRecognizer view](self->_tapGestureRecognizer, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v15 = CGRectGetHeight(v18) * 0.5;

    if (v13 <= v15)
      height = v13;
    else
      height = v15;
    p_effectiveTapRegionBreadths->height = height;
    width = p_effectiveTapRegionBreadths->width;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setTapRegionBreadths:(CGSize)a3
{
  if (self->_tapRegionBreadths.width != a3.width || self->_tapRegionBreadths.height != a3.height)
  {
    self->_tapRegionBreadths = a3;
    -[UIPageViewController _invalidateEffectiveTapRegions](self, "_invalidateEffectiveTapRegions");
  }
}

- (CGRect)_disabledScrollingRegion
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[UIPageViewController _scrollView](self, "_scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIPageViewController _scrollView](self, "_scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disabledScrollingRegion");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v6 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_setDisabledScrollingRegion:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  if (self->_transitionStyle == 1)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    -[UIPageViewController _scrollView](self, "_scrollView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisabledScrollingRegion:", x, y, width, height);

  }
}

- (_UIPageViewControllerContentView)_contentView
{
  void *v3;

  if (-[UIViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[UIViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (_UIPageViewControllerContentView *)v3;
}

- (_UIQueuingScrollView)_scrollView
{
  void *v2;
  void *v3;

  -[UIPageViewController _contentView](self, "_contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIQueuingScrollView *)v3;
}

- (BOOL)_isPageControlVisible
{
  return self->_transitionStyle == 1
      && (~*(_WORD *)&self->_delegateFlags & 0x300) == 0
      && self->_navigationOrientation == 0;
}

- (id)_pageControl
{
  void *v2;
  void *v3;

  -[UIPageViewController _contentView](self, "_contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pageControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGSize)_contentSizeForSize:(CGSize)a3
{
  double height;
  double width;
  int64_t v5;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = -[UIPageViewController _navigationOrientation](self, "_navigationOrientation");
  if (v5)
    v6 = width;
  else
    v6 = width * 3.0;
  if (v5)
    v7 = height * 3.0;
  else
    v7 = height;
  result.height = v7;
  result.width = v6;
  return result;
}

- (double)_pageSpacing
{
  return self->_pageSpacing;
}

- (void)_setPageSpacing:(double)a3
{
  double v3;
  double v4;
  BOOL v5;
  double v6;
  id v7;

  if (self->_transitionStyle == 1)
  {
    v3 = ceil(a3 * 0.5);
    v4 = v3 + v3;
    v5 = v3 <= 0.0;
    v6 = 0.0;
    if (!v5)
      v6 = v4;
    if (self->_pageSpacing != v6)
    {
      self->_pageSpacing = v6;
      -[UIPageViewController _contentView](self, "_contentView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setNeedsLayout");

    }
  }
}

- (void)loadView
{
  _UIPageViewControllerContentView *v3;
  int64_t transitionStyle;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  NSUInteger v13;
  _UIPageViewControllerContentView *v14;

  v3 = [_UIPageViewControllerContentView alloc];
  -[UIViewController _defaultInitialViewFrame](self, "_defaultInitialViewFrame");
  v14 = -[_UIPageViewControllerContentView initWithFrame:andPageViewController:](v3, "initWithFrame:andPageViewController:", self);
  -[UIViewController setView:](self, "setView:", v14);
  -[UIView setOpaque:](v14, "setOpaque:", 0);
  transitionStyle = self->_transitionStyle;
  if (transitionStyle == 1)
  {
    v7 = -[UIPageViewController _canHandleGestures](self, "_canHandleGestures");
    -[UIPageViewController _scrollView](self, "_scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isScrollEnabled");

    if (v7 != v9)
    {
      -[UIPageViewController _scrollView](self, "_scrollView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setScrollEnabled:", -[UIPageViewController _canHandleGestures](self, "_canHandleGestures"));

    }
    -[UIPageViewController _scrollView](self, "_scrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "visibleView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {

    }
    else
    {
      v13 = -[NSArray count](self->_viewControllers, "count");

      if (v13)
        -[UIPageViewController _setViewControllers:withScrollInDirection:animated:completion:](self, "_setViewControllers:withScrollInDirection:animated:completion:", self->_viewControllers, 0, 0, 0);
    }
  }
  else if (!transitionStyle)
  {
    -[UIGestureRecognizer view](self->_panGestureRecognizer, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[UIView addGestureRecognizer:](v14, "addGestureRecognizer:", self->_panGestureRecognizer);
    -[UIGestureRecognizer view](self->_tapGestureRecognizer, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      -[UIView addGestureRecognizer:](v14, "addGestureRecognizer:", self->_tapGestureRecognizer);
    if (!self->_pageCurl && -[NSArray count](self->_viewControllers, "count"))
      -[UIPageViewController _setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:](self, "_setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:", self->_viewControllers, 1, 0, 0, 0, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  }

}

- (void)viewWillUnload
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIPageViewController;
  -[UIViewController viewWillUnload](&v4, sel_viewWillUnload);
  -[UIPageViewController _contentView](self, "_contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidatePageViewController");

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
  return 0;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  *a4 = 1;
  -[UIViewController _contentOverlayInsets](self, "_contentOverlayInsets", a3);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5
{
  void *v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[UIViewController _existingView](self, "_existingView", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_shouldReverseLayoutDirection");

  -[UIViewController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
  if (v9)
    v12 = v11;
  else
    v12 = v10;
  *a4 = v12;
  if (v9)
    v13 = v10;
  else
    v13 = v11;
  *a5 = v13;
}

- (void)_child:(id)a3 beginAppearanceTransition:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  if (!-[UIViewController _forwardAppearanceMethods](self, "_forwardAppearanceMethods"))
  {
    v8 = (id)objc_msgSend(v9, "view");
    objc_msgSend(v9, "beginAppearanceTransition:animated:", v6, v5);
  }

}

- (BOOL)_child:(id)a3 canBeginAppearanceTransition:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BOOL v7;
  int v9;
  int v10;

  v4 = a4;
  v6 = a3;
  if (v6 && !-[UIViewController _forwardAppearanceMethods](self, "_forwardAppearanceMethods"))
  {
    v9 = objc_msgSend(v6, "_appearState");
    if (v4)
    {
      if (v9 != 3)
      {
        v10 = 0;
LABEL_11:
        v7 = objc_msgSend(v6, "_appearState") == v10;
        goto LABEL_4;
      }
    }
    else if (v9 != 1)
    {
      v10 = 2;
      goto LABEL_11;
    }
    v7 = 1;
    goto LABEL_4;
  }
  v7 = 0;
LABEL_4:

  return v7;
}

- (void)_child:(id)a3 beginAppearanceTransitionIfPossible:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (-[UIPageViewController _child:canBeginAppearanceTransition:](self, "_child:canBeginAppearanceTransition:"))
    -[UIPageViewController _child:beginAppearanceTransition:animated:](self, "_child:beginAppearanceTransition:animated:", v8, v6, v5);

}

- (void)_childEndAppearanceTransition:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[UIViewController _forwardAppearanceMethods](self, "_forwardAppearanceMethods"))
    objc_msgSend(v4, "endAppearanceTransition");

}

- (BOOL)_childCanEndAppearanceTransition:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && !-[UIViewController _forwardAppearanceMethods](self, "_forwardAppearanceMethods")
    && (objc_msgSend(v4, "_appearState") == 3 || objc_msgSend(v4, "_appearState") == 1);

  return v5;
}

- (void)_child:(id)a3 endAppearanceTransitionIfPossible:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  int v8;
  BOOL v9;
  id v10;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  v10 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "_appearState");
    v9 = v4 ? v8 == 3 : v8 == 1;
    v7 = v10;
    if (v9)
    {
      -[UIPageViewController _child:beginAppearanceTransitionIfPossible:animated:](self, "_child:beginAppearanceTransitionIfPossible:animated:", v10, v4, 0);
      v7 = v10;
    }
  }
  if (-[UIPageViewController _childCanEndAppearanceTransition:](self, "_childCanEndAppearanceTransition:", v7))
    -[UIPageViewController _childEndAppearanceTransition:](self, "_childEndAppearanceTransition:", v10);

}

- (void)_child:(id)a3 willRotateToInterfaceOrientation:(int64_t)a4 duration:(double)a5
{
  id v8;

  v8 = a3;
  if (!-[UIViewController _forwardRotationMethods](self, "_forwardRotationMethods"))
    objc_msgSend(v8, "willRotateToInterfaceOrientation:duration:", a4, a5);

}

- (void)_child:(id)a3 willAnimateRotationToInterfaceOrientation:(int64_t)a4 duration:(double)a5
{
  id v8;

  v8 = a3;
  if (!-[UIViewController _forwardRotationMethods](self, "_forwardRotationMethods"))
    objc_msgSend(v8, "willAnimateRotationToInterfaceOrientation:duration:", a4, a5);

}

- (void)_child:(id)a3 didRotateFromInterfaceOrientation:(int64_t)a4
{
  id v6;

  v6 = a3;
  if (!-[UIViewController _forwardRotationMethods](self, "_forwardRotationMethods"))
    objc_msgSend(v6, "didRotateFromInterfaceOrientation:", a4);

}

- (void)_sendChildViewWill:(BOOL)a3 appear:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL4 v7;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if (-[UIViewController isViewLoaded](self, "isViewLoaded") && -[NSArray count](self->_viewControllers, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = self->_viewControllers;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v14, "isViewLoaded", (_QWORD)v15))
          {
            if (v7)
              -[UIPageViewController _child:beginAppearanceTransitionIfPossible:animated:](self, "_child:beginAppearanceTransitionIfPossible:animated:", v14, v6, v5);
            else
              -[UIPageViewController _child:endAppearanceTransitionIfPossible:](self, "_child:endAppearanceTransitionIfPossible:", v14, v6);
          }
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[16];
  objc_super v14;

  v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIPageViewController;
  -[UIViewController viewWillAppear:](&v14, sel_viewWillAppear_);
  if (!self->_transitionStyle)
  {
    -[UIViewController _window](self, "_window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v13 = 0;
          _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "Window should be nonnil here unless a subclass is mistakenly sending this to a child when no window can be found", v13, 2u);
        }

      }
      else
      {
        v10 = viewWillAppear____s_category;
        if (!viewWillAppear____s_category)
        {
          v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v10, (unint64_t *)&viewWillAppear____s_category);
        }
        v11 = *(NSObject **)(v10 + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Window should be nonnil here unless a subclass is mistakenly sending this to a child when no window can be found", v13, 2u);
        }
      }
    }
    -[UIViewController _window](self, "_window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)UIApp;
      -[UIViewController _window](self, "_window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[UIPageViewController _requestSpineLocationForInterfaceOrientationAndUpdateStashedViewControllers:](self, "_requestSpineLocationForInterfaceOrientationAndUpdateStashedViewControllers:", objc_msgSend(v7, "_sceneInterfaceOrientationFromWindow:", v8));

    }
    else
    {
      v9 = -[UIPageViewController _requestSpineLocationForInterfaceOrientationAndUpdateStashedViewControllers:](self, "_requestSpineLocationForInterfaceOrientationAndUpdateStashedViewControllers:", 0);
    }

    if (v9 && v9 != self->_spineLocation)
    {
      -[UIPageViewController _setSpineLocation:](self, "_setSpineLocation:", v9);
      -[UIPageViewController _invalidatePageCurl](self, "_invalidatePageCurl");
      -[UIPageViewController _setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:](self, "_setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:", self->_viewControllersStashedForRotation, 1, 0, 0, 0, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    }
    -[UIPageViewController _setViewControllersStashedForRotation:](self, "_setViewControllersStashedForRotation:", 0);
  }
  -[UIPageViewController _sendChildViewWill:appear:animated:](self, "_sendChildViewWill:appear:animated:", 1, 1, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIPageViewController;
  -[UIViewController viewDidAppear:](&v5, sel_viewDidAppear_);
  -[UIPageViewController _sendChildViewWill:appear:animated:](self, "_sendChildViewWill:appear:animated:", 0, 1, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIPageViewController;
  -[UIViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  -[UIPageViewController _sendChildViewWill:appear:animated:](self, "_sendChildViewWill:appear:animated:", 1, 0, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIPageViewController;
  -[UIViewController viewDidDisappear:](&v5, sel_viewDidDisappear_);
  -[UIPageViewController _sendChildViewWill:appear:animated:](self, "_sendChildViewWill:appear:animated:", 0, 0, v3);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  NSArray *viewControllers;
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  viewControllers = self->_viewControllers;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__UIPageViewController_shouldAutorotateToInterfaceOrientation___block_invoke;
  v6[3] = &unk_1E16B5D60;
  v6[4] = &v7;
  v6[5] = a3;
  -[NSArray enumerateObjectsUsingBlock:](viewControllers, "enumerateObjectsUsingBlock:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __63__UIPageViewController_shouldAutorotateToInterfaceOrientation___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "shouldAutorotateToInterfaceOrientation:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  id WeakRetained;
  unint64_t v5;
  objc_super v6;

  if ((*(_WORD *)&self->_delegateFlags & 0x10) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_msgSend(WeakRetained, "pageViewControllerSupportedInterfaceOrientations:", self);

    return v5;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPageViewController;
    return -[UIViewController supportedInterfaceOrientations](&v6, sel_supportedInterfaceOrientations);
  }
}

- (BOOL)_hasPreferredInterfaceOrientationForPresentation
{
  int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIPageViewController;
  if (-[UIViewController _hasPreferredInterfaceOrientationForPresentation](&v5, sel__hasPreferredInterfaceOrientationForPresentation))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = dyld_program_sdk_at_least();
    if (v3)
      return (*(_WORD *)&self->_delegateFlags >> 5) & 1;
  }
  return v3;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  id WeakRetained;
  int64_t v5;
  objc_super v6;

  if ((*(_WORD *)&self->_delegateFlags & 0x20) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_msgSend(WeakRetained, "pageViewControllerPreferredInterfaceOrientationForPresentation:", self);

    return v5;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPageViewController;
    return -[UIViewController preferredInterfaceOrientationForPresentation](&v6, sel_preferredInterfaceOrientationForPresentation);
  }
}

+ (id)stringForSpineLocation:(int64_t)a3
{
  void *v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown Spine Location (%ld)"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a3 <= 3)
  {
    v5 = off_1E16C0E80[a3];

    v4 = v5;
  }
  return v4;
}

- (_NSRange)_validRangeForPresentationOfViewControllersWithSpineLocation:(int64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  if (a3 == 2)
    v3 = 2;
  else
    v3 = 1;
  v4 = 0;
  result.length = v3;
  result.location = v4;
  return result;
}

- (id)_validatedViewControllersForPresentationOfViewControllers:(id)a3 validRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  if (objc_msgSend(v6, "count") == length)
  {
    objc_msgSend(v6, "subarrayWithRange:", location, length);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_viewControllersForPendingSpineLocation:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *v8;
  void *v9;
  NSArray *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = -[UIPageViewController _validRangeForPresentationOfViewControllersWithSpineLocation:](self, "_validRangeForPresentationOfViewControllersWithSpineLocation:");
  v7 = v6;
  if (-[NSArray count](self->_viewControllersStashedForRotation, "count"))
  {
    v8 = self->_viewControllersStashedForRotation;
    -[UIPageViewController _validatedViewControllersForPresentationOfViewControllers:validRange:](self, "_validatedViewControllersForPresentationOfViewControllers:validRange:", v8, v5, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      goto LABEL_8;
  }
  else
  {
    v8 = 0;
  }
  if (-[NSArray count](self->_viewControllersStashedForRotation, "count")
    || (v10 = self->_viewControllers,
        v8,
        -[UIPageViewController _validatedViewControllersForPresentationOfViewControllers:validRange:](self, "_validatedViewControllersForPresentationOfViewControllers:validRange:", v10, v5, v7), v9 = (void *)objc_claimAutoreleasedReturnValue(), v8 = v10, !v9))
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = -[NSArray count](v8, "count");
    objc_msgSend((id)objc_opt_class(), "stringForSpineLocation:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "raise:format:", v12, CFSTR("The number of provided view controllers (%ld) doesn't match the number required (%ld) for the requested spine location (%@)"), v13, v7, v14);

    v9 = 0;
  }
LABEL_8:

  return v9;
}

- (void)_invalidatePageCurl
{
  _UIPageCurl *pageCurl;

  -[_UIPageCurl _cancelAllActiveTransitionsAndAbandonCallbacks:](self->_pageCurl, "_cancelAllActiveTransitionsAndAbandonCallbacks:", 1);
  pageCurl = self->_pageCurl;
  self->_pageCurl = 0;

}

- (int64_t)_requestSpineLocationForInterfaceOrientationAndUpdateStashedViewControllers:(int64_t)a3
{
  id WeakRetained;
  void *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if (WeakRetained && (*(_WORD *)&self->_delegateFlags & 8) != 0)
  {
    self->_stashingViewControllersForRotation = 1;
    v7 = objc_msgSend(WeakRetained, "pageViewController:spineLocationForInterfaceOrientation:", self, a3);
    if ((objc_msgSend((id)objc_opt_class(), "_isSpineLocation:supportedForTransitionStyle:", v7, self->_transitionStyle) & 1) == 0)
    {
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
      objc_msgSend((id)objc_opt_class(), "stringForSpineLocation:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise:format:", v9, CFSTR("'%@' is not a valid spine location"), v10);

    }
    self->_stashingViewControllersForRotation = 0;
    -[UIPageViewController _viewControllersForPendingSpineLocation:](self, "_viewControllersForPendingSpineLocation:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageViewController _setViewControllersStashedForRotation:](self, "_setViewControllersStashedForRotation:", v11);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id WeakRetained;
  __int16 delegateFlags;
  UISnapshotView *v14;
  void *v15;
  UISnapshotView *v16;
  NSMutableArray *rotationSnapshotViews;
  NSMutableArray *v18;
  NSMutableArray *v19;
  void *v20;
  int64_t v21;
  NSArray *v22;
  int64_t spineLocation;
  NSArray *v24;
  UISnapshotView *v25;
  void *v26;
  UISnapshotView *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  int64_t v41;
  void *v42;
  uint64_t v43;
  double Height;
  double Width;
  double MinY;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  _UIPageCurl *v63;
  int64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  BOOL v68;
  uint64_t v69;
  void *v70;
  _UIPageCurl *v71;
  _UIPageCurl *pageCurl;
  double v73;
  double MinX;
  double v75;
  double v76;
  UISnapshotView *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  uint64_t v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;

  v83 = *MEMORY[0x1E0C80C00];
  self->_interfaceRotating = 1;
  -[UIPageViewController _invalidatePageCurl](self, "_invalidatePageCurl");
  if (self->_transitionStyle)
    goto LABEL_2;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
    goto LABEL_2;
  delegateFlags = (__int16)self->_delegateFlags;

  if ((delegateFlags & 8) == 0)
    goto LABEL_2;
  v14 = [UISnapshotView alloc];
  -[UIViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v16 = -[UISnapshotView initWithFrame:](v14, "initWithFrame:");

  rotationSnapshotViews = self->_rotationSnapshotViews;
  if (!rotationSnapshotViews)
  {
    v18 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    v19 = self->_rotationSnapshotViews;
    self->_rotationSnapshotViews = v18;

    rotationSnapshotViews = self->_rotationSnapshotViews;
  }
  -[NSMutableArray addObject:](rotationSnapshotViews, "addObject:", v16);
  -[UIViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISnapshotView captureSnapshotOfView:withSnapshotType:](v16, "captureSnapshotOfView:withSnapshotType:", v20, 1);

  v21 = -[UIPageViewController _requestSpineLocationForInterfaceOrientationAndUpdateStashedViewControllers:](self, "_requestSpineLocationForInterfaceOrientationAndUpdateStashedViewControllers:", a3);
  v22 = self->_viewControllersStashedForRotation;
  spineLocation = self->_spineLocation;
  if (spineLocation == 2 || v21 != 2)
  {
    if (spineLocation == 2 && v21 != 2)
    {
      spineLocation = 2;
      goto LABEL_23;
    }
    if ((-[NSArray isEqual:](self->_viewControllers, "isEqual:", v22) & 1) == 0)
    {
      spineLocation = self->_spineLocation;
      goto LABEL_23;
    }

LABEL_2:
    -[UIPageViewController _setViewControllersStashedForRotation:](self, "_setViewControllersStashedForRotation:", self->_viewControllers);
    -[NSMutableArray removeAllObjects](self->_rotationSnapshotViews, "removeAllObjects");
    goto LABEL_3;
  }
LABEL_23:
  v77 = v16;
  self->_spineLocationPriorToInterfaceRotation = spineLocation;
  -[UIPageViewController _setSpineLocation:](self, "_setSpineLocation:", v21);
  v24 = self->_viewControllers;
  v25 = [UISnapshotView alloc];
  -[UIViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  v27 = -[UISnapshotView initWithFrame:](v25, "initWithFrame:");

  -[NSMutableArray addObject:](self->_rotationSnapshotViews, "addObject:", v27);
  if (self->_spineLocationPriorToInterfaceRotation == 2 && self->_spineLocation != 2)
  {
    -[NSArray _ui_onlyObject](v22, "_ui_onlyObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[NSArray containsObject:](v24, "containsObject:", v28);

    if (v29)
    {
      -[NSArray _ui_onlyObject](v22, "_ui_onlyObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "frame");
      -[UISnapshotView setFrame:](v27, "setFrame:");

    }
  }

  -[UIViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bounds");
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;

  v41 = self->_spineLocation;
  if (self->_spineLocationPriorToInterfaceRotation == 2)
  {
    if (v41 != 2)
    {
      -[NSArray _ui_onlyObject](v22, "_ui_onlyObject");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[NSArray indexOfObject:](v24, "indexOfObject:", v42);

      v84.origin.x = v34;
      v84.origin.y = v36;
      v84.size.width = v38;
      v84.size.height = v40;
      MinX = CGRectGetMinX(v84);
      Height = 0.0;
      Width = 0.0;
      if (!self->_navigationOrientation && v43 == 1)
      {
        v85.origin.x = v34;
        v85.origin.y = v36;
        v85.size.width = v38;
        v85.size.height = v40;
        Width = CGRectGetWidth(v85);
      }
      v86.origin.x = v34;
      v86.origin.y = v36;
      v86.size.width = v38;
      v86.size.height = v40;
      MinY = CGRectGetMinY(v86);
      if (self->_navigationOrientation == 1 && v43 == 1)
      {
        v87.origin.x = v34;
        v87.origin.y = v36;
        v87.size.width = v38;
        v87.size.height = v40;
        Height = CGRectGetHeight(v87);
      }
      v73 = MinY + Height;
      v75 = MinX + Width;
      v88.origin.x = v34;
      v88.origin.y = v36;
      v88.size.width = v38;
      v88.size.height = v40;
      v47 = CGRectGetWidth(v88);
      if (self->_navigationOrientation)
        v48 = 1.0;
      else
        v48 = 2.0;
      v49 = v47 / v48;
      v89.origin.x = v34;
      v89.origin.y = v36;
      v89.size.width = v38;
      v89.size.height = v40;
      v50 = CGRectGetHeight(v89);
      if (self->_navigationOrientation == 1)
        v51 = 2.0;
      else
        v51 = 1.0;
      v40 = v50 / v51;
LABEL_56:
      v36 = v73;
      v34 = v75;
      v38 = v49;
    }
  }
  else if (v41 == 2)
  {
    -[NSArray _ui_onlyObject](v24, "_ui_onlyObject");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[NSArray indexOfObject:](v22, "indexOfObject:", v52);

    v90.origin.x = v34;
    v90.origin.y = v36;
    v90.size.width = v38;
    v90.size.height = v40;
    v76 = CGRectGetMinX(v90);
    v54 = 0.0;
    v55 = 0.0;
    if (!self->_navigationOrientation && v53 == 1)
    {
      v91.origin.x = v34;
      v91.origin.y = v36;
      v91.size.width = v38;
      v91.size.height = v40;
      v55 = CGRectGetWidth(v91);
    }
    v92.origin.x = v34;
    v92.origin.y = v36;
    v92.size.width = v38;
    v92.size.height = v40;
    v56 = CGRectGetMinY(v92);
    if (self->_navigationOrientation == 1 && v53 == 1)
    {
      v93.origin.x = v34;
      v93.origin.y = v36;
      v93.size.width = v38;
      v93.size.height = v40;
      v54 = CGRectGetHeight(v93);
    }
    v73 = v56 - v54;
    v75 = v76 - v55;
    v94.origin.x = v34;
    v94.origin.y = v36;
    v94.size.width = v38;
    v94.size.height = v40;
    v57 = CGRectGetWidth(v94);
    if (self->_navigationOrientation)
      v58 = 1.0;
    else
      v58 = 2.0;
    v49 = v57 * v58;
    v95.origin.x = v34;
    v95.origin.y = v36;
    v95.size.width = v38;
    v95.size.height = v40;
    v59 = CGRectGetHeight(v95);
    if (self->_navigationOrientation == 1)
      v60 = 2.0;
    else
      v60 = 1.0;
    v40 = v59 * v60;
    -[NSArray objectAtIndex:](v22, "objectAtIndex:", v53 == 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "view");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setAlpha:", 0.0);

    goto LABEL_56;
  }
  v63 = [_UIPageCurl alloc];
  v64 = self->_spineLocation;
  if (v64 == 101)
  {
    v65 = 3;
  }
  else
  {
    v66 = 2;
    if (v64 == 2)
      v66 = 8;
    if (v64 == 3)
      v66 = 32;
    v67 = 4;
    if (v64 != 2)
      v67 = 1;
    v68 = v64 == 3;
    v69 = 16;
    if (!v68)
      v69 = v67;
    if (self->_navigationOrientation)
      v65 = v66;
    else
      v65 = v69;
  }
  -[UIViewController view](self, "view");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = -[_UIPageCurl initWithSpineLocation:andContentRect:inContentView:](v63, "initWithSpineLocation:andContentRect:inContentView:", v65, v70, v34, v36, v38, v40);
  pageCurl = self->_pageCurl;
  self->_pageCurl = v71;

  -[UIPageViewController _setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:](self, "_setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:", v22, 1, 0, 0, 0, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[UIPageViewController _setViewControllersStashedForRotation:](self, "_setViewControllersStashedForRotation:", v24);

LABEL_3:
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v7 = self->_viewControllers;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v79 != v10)
          objc_enumerationMutation(v7);
        -[UIPageViewController _child:willRotateToInterfaceOrientation:duration:](self, "_child:willRotateToInterfaceOrientation:duration:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i), a3, a4);
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
    }
    while (v9);
  }

  -[UIPageViewController _invalidatePageCurl](self, "_invalidatePageCurl");
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  NSArray *v8;
  int64_t spineLocation;
  NSArray *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double Height;
  double Width;
  void *v25;
  void *v26;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  NSArray *viewControllers;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  int64_t navigationOrientation;
  double v64;
  int64_t v65;
  double v66;
  double v67;
  void *v68;
  CGFloat v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSArray *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t k;
  void *v83;
  double v84;
  NSArray *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[5];
  NSArray *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  uint64_t v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;

  v103 = *MEMORY[0x1E0C80C00];
  if (self->_transitionStyle)
    goto LABEL_53;
  if (!-[NSArray count](self->_viewControllersStashedForRotation, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageViewController.m"), 1061, CFSTR("No view controllers"));

  }
  v8 = self->_viewControllersStashedForRotation;
  v85 = self->_viewControllers;
  -[UIPageViewController _setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:](self, "_setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[UIPageViewController _setViewControllersStashedForRotation:](self, "_setViewControllersStashedForRotation:", v8);
  spineLocation = self->_spineLocation;
  if (self->_spineLocationPriorToInterfaceRotation == 2)
  {
    v10 = v85;
    if (spineLocation != 2 && -[NSArray count](v8, "count"))
    {
      v11 = 0;
      do
      {
        -[NSArray objectAtIndex:](v8, "objectAtIndex:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSArray containsObject:](v85, "containsObject:", v12))
        {
          -[NSArray _ui_onlyObject](v85, "_ui_onlyObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "view");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "frame");
          v16 = v15;
          v18 = v17;
          v20 = v19;
          v22 = v21;

          if (self->_navigationOrientation)
          {
            v104.origin.x = v16;
            v104.origin.y = v18;
            v104.size.width = v20;
            v104.size.height = v22;
            Height = CGRectGetHeight(v104);
            if (!v11)
              Height = -Height;
            v18 = v18 + Height;
          }
          else
          {
            v105.origin.x = v16;
            v105.origin.y = v18;
            v105.size.width = v20;
            v105.size.height = v22;
            Width = CGRectGetWidth(v105);
            if (!v11)
              Width = -Width;
            v16 = v16 + Width;
          }
          objc_msgSend(v12, "view");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setFrame:", v16, v18, v20, v22);

          objc_msgSend(v12, "view");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setAlpha:", 0.0);

        }
        ++v11;
      }
      while (v11 < -[NSArray count](v8, "count"));
    }
  }
  else
  {
    v10 = v85;
    if (spineLocation == 2)
    {
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v27 = v85;
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v96, v102, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v97;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v97 != v30)
              objc_enumerationMutation(v27);
            v32 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
            if (!-[NSArray containsObject:](v8, "containsObject:", v32))
            {
              objc_msgSend(v32, "view");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setAlpha:", 1.0);

            }
          }
          v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v96, v102, 16);
        }
        while (v29);
      }

    }
  }
  if (-[NSMutableArray count](self->_rotationSnapshotViews, "count"))
  {
    -[UIViewController view](self, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "layoutBelowIfNeeded");

    -[NSMutableArray lastObject](self->_rotationSnapshotViews, "lastObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "captureSnapshotOfView:withSnapshotType:", v36, 0);

    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    -[UIViewController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "subviews");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v93;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v93 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * j);
          -[NSMutableArray _ui_firstObject](self->_rotationSnapshotViews, "_ui_firstObject");
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (v43 != v44)
            objc_msgSend(v43, "setHidden:", 1);
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
      }
      while (v40);
    }

    if (self->_spineLocationPriorToInterfaceRotation == 2 || self->_spineLocation != 2)
    {
      -[UIViewController view](self, "view");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray _ui_firstObject](self->_rotationSnapshotViews, "_ui_firstObject");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "addSubview:", v75);

      -[UIViewController view](self, "view");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray lastObject](self->_rotationSnapshotViews, "lastObject");
      v73 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      viewControllers = self->_viewControllers;
      -[NSArray _ui_onlyObject](v8, "_ui_onlyObject");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(viewControllers) = -[NSArray containsObject:](viewControllers, "containsObject:", v46);

      if ((_DWORD)viewControllers)
      {
        -[NSArray _ui_onlyObject](v8, "_ui_onlyObject");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "view");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "frame");
        v50 = v49;
        v52 = v51;
        v54 = v53;
        v56 = v55;

        -[NSMutableArray lastObject](self->_rotationSnapshotViews, "lastObject");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "frame");
        v58 = CGRectGetWidth(v106);
        v107.origin.x = v50;
        v107.origin.y = v52;
        v107.size.width = v54;
        v107.size.height = v56;
        v59 = v58 / CGRectGetWidth(v107);

        -[NSMutableArray lastObject](self->_rotationSnapshotViews, "lastObject");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "frame");
        v61 = CGRectGetHeight(v108);
        v109.origin.x = v50;
        v109.origin.y = v52;
        v109.size.width = v54;
        v109.size.height = v56;
        v62 = v61 / CGRectGetHeight(v109);

        navigationOrientation = self->_navigationOrientation;
        v110.origin.x = v50;
        v110.origin.y = v52;
        v110.size.width = v54;
        v110.size.height = v56;
        v64 = v59 * CGRectGetWidth(v110);
        if (!navigationOrientation)
          v64 = v64 + v64;
        v84 = v64;
        v65 = self->_navigationOrientation;
        v111.origin.x = v50;
        v111.origin.y = v52;
        v111.size.width = v54;
        v111.size.height = v56;
        v66 = v62 * CGRectGetHeight(v111);
        if (v65 == 1)
          v67 = v66 + v66;
        else
          v67 = v66;
        -[NSMutableArray lastObject](self->_rotationSnapshotViews, "lastObject");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v112.origin.x = v50;
        v112.origin.y = v52;
        v112.size.width = v54;
        v112.size.height = v56;
        v69 = -(CGRectGetMinX(v112) * v59);
        v113.origin.x = v50;
        v113.origin.y = v52;
        v113.size.width = v54;
        v113.size.height = v56;
        objc_msgSend(v68, "setFrame:", v69, -(CGRectGetMinY(v113) * v62), v84, v67);

      }
      -[UIViewController view](self, "view");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray lastObject](self->_rotationSnapshotViews, "lastObject");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "addSubview:", v71);

      -[UIViewController view](self, "view");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray _ui_firstObject](self->_rotationSnapshotViews, "_ui_firstObject");
      v73 = objc_claimAutoreleasedReturnValue();
    }
    v76 = (void *)v73;
    objc_msgSend(v72, "addSubview:", v73);
    v10 = v85;

    -[NSMutableArray lastObject](self->_rotationSnapshotViews, "lastObject");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setAlpha:", 0.0);

    v90[0] = MEMORY[0x1E0C809B0];
    v90[1] = 3221225472;
    v90[2] = __75__UIPageViewController_willAnimateRotationToInterfaceOrientation_duration___block_invoke;
    v90[3] = &unk_1E16B1B50;
    v90[4] = self;
    v91 = v8;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v90, a4);

  }
  if (self->_transitionStyle || !-[NSMutableArray count](self->_rotationSnapshotViews, "count"))
  {
LABEL_53:
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v78 = self->_viewControllers;
    v79 = -[NSArray countByEnumeratingWithState:objects:count:](v78, "countByEnumeratingWithState:objects:count:", &v86, v100, 16);
    if (v79)
    {
      v80 = v79;
      v81 = *(_QWORD *)v87;
      do
      {
        for (k = 0; k != v80; ++k)
        {
          if (*(_QWORD *)v87 != v81)
            objc_enumerationMutation(v78);
          -[UIPageViewController _child:willAnimateRotationToInterfaceOrientation:duration:](self, "_child:willAnimateRotationToInterfaceOrientation:duration:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * k), a3, a4);
        }
        v80 = -[NSArray countByEnumeratingWithState:objects:count:](v78, "countByEnumeratingWithState:objects:count:", &v86, v100, 16);
      }
      while (v80);
    }

  }
}

void __75__UIPageViewController_willAnimateRotationToInterfaceOrientation_duration___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void *v24;
  double Width;
  double v26;
  void *v27;
  double Height;
  double v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  double v33;
  id *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(v11 + 1000);
  if (*(_QWORD *)(v11 + 1080) == 2)
  {
    if (v12 != 2)
    {
      v13 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(v11 + 1016), "_ui_onlyObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v13) = objc_msgSend(v13, "containsObject:", v14);

      if ((v13 & 1) != 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "lastObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "frame");
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v23 = v22;

        objc_msgSend(*(id *)(a1 + 32), "view");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "bounds");
        Width = CGRectGetWidth(v48);
        v49.origin.x = v17;
        v49.origin.y = v19;
        v49.size.width = v21;
        v49.size.height = v23;
        v26 = Width / CGRectGetWidth(v49);

        objc_msgSend(*(id *)(a1 + 32), "view");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "bounds");
        Height = CGRectGetHeight(v50);
        v51.origin.x = v17;
        v51.origin.y = v19;
        v51.size.width = v21;
        v51.size.height = v23;
        v29 = Height / CGRectGetHeight(v51);

        v30 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992);
        v52.origin.x = v17;
        v52.origin.y = v19;
        v52.size.width = v21;
        v52.size.height = v23;
        v31 = v26 * CGRectGetWidth(v52);
        if (v30)
          v8 = v31;
        else
          v8 = v31 + v31;
        v32 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992);
        v53.origin.x = v17;
        v53.origin.y = v19;
        v53.size.width = v21;
        v53.size.height = v23;
        v33 = v29 * CGRectGetHeight(v53);
        if (v32 == 1)
          v10 = v33 + v33;
        else
          v10 = v33;
        v54.origin.x = v17;
        v54.origin.y = v19;
        v54.size.width = v21;
        v54.size.height = v23;
        v4 = -(CGRectGetMinX(v54) * v26);
        v55.origin.x = v17;
        v55.origin.y = v19;
        v55.size.width = v21;
        v55.size.height = v23;
        v6 = -(CGRectGetMinY(v55) * v29);
      }
      v34 = (id *)(*(_QWORD *)(a1 + 32) + 1072);
LABEL_16:
      objc_msgSend(*v34, "_ui_firstObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setAlpha:", 0.0);

      v11 = *(_QWORD *)(a1 + 32);
    }
  }
  else if (v12 == 2)
  {
    v35 = *(void **)(v11 + 1016);
    objc_msgSend(*(id *)(a1 + 40), "_ui_onlyObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v35) = objc_msgSend(v35, "containsObject:", v36);

    if ((_DWORD)v35)
    {
      objc_msgSend(*(id *)(a1 + 40), "_ui_onlyObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "frame");
      v4 = v39;
      v6 = v40;
      v8 = v41;
      v10 = v42;

    }
    v34 = (id *)(*(_QWORD *)(a1 + 32) + 1072);
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(v11 + 1072), "lastObject");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "_ui_firstObject");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setFrame:", v4, v6, v8, v10);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "lastObject");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "bounds");
  objc_msgSend(v47, "setFrame:");

}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!self->_transitionStyle)
  {
    if (!self->_pageCurl)
      -[UIPageViewController _setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:](self, "_setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:", self->_viewControllers, 1, 0, 0, 0, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    -[UIPageViewController _invalidateEffectiveTapRegions](self, "_invalidateEffectiveTapRegions");
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[UIViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (-[NSMutableArray containsObject:](self->_rotationSnapshotViews, "containsObject:", v11))
          {
            objc_msgSend(v11, "removeFromSuperview");
          }
          else
          {
            objc_msgSend(v11, "setHidden:", 0);
            objc_msgSend(v11, "setAlpha:", 1.0);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v8);
    }

    -[NSMutableArray removeAllObjects](self->_rotationSnapshotViews, "removeAllObjects");
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_viewControllers;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[UIPageViewController _child:didRotateFromInterfaceOrientation:](self, "_child:didRotateFromInterfaceOrientation:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), a3, (_QWORD)v17);
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

  self->_interfaceRotating = 0;
  -[UIPageViewController _setViewControllersStashedForRotation:](self, "_setViewControllersStashedForRotation:", 0);
}

- (void)_contentViewFrameOrBoundsDidChange
{
  _UIPageCurl *pageCurl;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  if (!self->_transitionStyle && !-[NSMutableArray count](self->_rotationSnapshotViews, "count"))
  {
    pageCurl = self->_pageCurl;
    if (pageCurl)
    {
      -[UIViewController view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bounds");
      -[_UIPageCurl _setContentRect:](pageCurl, "_setContentRect:");

      if (-[NSArray count](self->_viewControllers, "count"))
      {
        v5 = 0;
        do
        {
          -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v6, "isViewLoaded"))
          {
            objc_msgSend(v6, "view");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            if (v5)
              v8 = 0;
            else
              v8 = (self->_spineLocation & 0xFFFFFFFFFFFFFFFELL) == 2;
            -[_UIPageCurl _pageViewFrame:](self->_pageCurl, "_pageViewFrame:", v8);
            objc_msgSend(v7, "setFrame:");

          }
          ++v5;
        }
        while (v5 < -[NSArray count](self->_viewControllers, "count"));
      }
    }
    -[UIPageViewController _invalidateEffectiveTapRegions](self, "_invalidateEffectiveTapRegions");
  }
}

- (BOOL)_isCurrentViewControllerStateValid
{
  int64_t spineLocation;
  NSUInteger v4;

  if (self->_transitionStyle)
    return 0;
  spineLocation = self->_spineLocation;
  v4 = -[NSArray count](self->_viewControllers, "count");
  if (spineLocation == 2)
    return v4 == 2;
  else
    return v4 == 1;
}

- (id)_validatedViewControllersForTransitionWithViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int64_t transitionStyle;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  transitionStyle = self->_transitionStyle;
  if (transitionStyle == 1)
  {
    if (objc_msgSend(v6, "count") == 1)
    {
      v10 = v7;
      v9 = 1;
      if (v10)
        goto LABEL_18;
    }
    else
    {
      v9 = 1;
    }
LABEL_17:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The number of view controllers provided (%ld) doesn't match the number required (%ld) for the requested transition"), objc_msgSend(v7, "count"), v9);
    v10 = 0;
    goto LABEL_18;
  }
  if (transitionStyle)
  {
    v9 = 0;
    goto LABEL_17;
  }
  if (!v4)
  {
    v11 = -[UIPageViewController _validRangeForPresentationOfViewControllersWithSpineLocation:](self, "_validRangeForPresentationOfViewControllersWithSpineLocation:", self->_spineLocation);
    v9 = v12;
    -[UIPageViewController _validatedViewControllersForPresentationOfViewControllers:validRange:](self, "_validatedViewControllersForPresentationOfViewControllers:validRange:", v7, v11, v12);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_18;
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = objc_msgSend(v7, "count");
    objc_msgSend((id)objc_opt_class(), "stringForSpineLocation:", self->_spineLocation);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "raise:format:", v14, CFSTR("The number of provided view controllers (%ld) doesn't match the number required (%ld) for the requested spine location (%@)"), v15, v9, v16);

    goto LABEL_17;
  }
  if (self->_doubleSided)
    v9 = 2;
  else
    v9 = 1;
  if (objc_msgSend(v6, "count") != v9)
    goto LABEL_17;
  objc_msgSend(v7, "subarrayWithRange:", 0, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_17;
LABEL_18:

  return v10;
}

- (BOOL)_canHandleGestures
{
  id WeakRetained;
  $9D61448B49CE3ACBE30B7BC01FFD74FF delegateFlags;
  _BOOL4 v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained)
  {
    delegateFlags = self->_delegateFlags;
    if ((*(_BYTE *)&delegateFlags & 0x40) != 0)
      v5 = (*(unsigned int *)&delegateFlags >> 7) & 1;
    else
      LOBYTE(v5) = 0;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)_viewControllerBefore:(BOOL)a3 viewController:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;

  v6 = a4;
  if (-[UIPageViewController _canHandleGestures](self, "_canHandleGestures"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v8 = WeakRetained;
    if (a3)
      objc_msgSend(WeakRetained, "pageViewController:viewControllerBeforeViewController:", self, v6);
    else
      objc_msgSend(WeakRetained, "pageViewController:viewControllerAfterViewController:", self, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_viewControllerBeforeViewController:(id)a3
{
  return -[UIPageViewController _viewControllerBefore:viewController:](self, "_viewControllerBefore:viewController:", 1, a3);
}

- (id)_viewControllerAfterViewController:(id)a3
{
  return -[UIPageViewController _viewControllerBefore:viewController:](self, "_viewControllerBefore:viewController:", 0, a3);
}

- (id)_viewControllersForCurlWithViewControllers:(id)a3 direction:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t spineLocation;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  spineLocation = self->_spineLocation;
  if (spineLocation == 1 || spineLocation == 101)
  {
    if (!a4)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("UIPageCurlControllerOutgoingRightViewControllerKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_doubleSided)
        goto LABEL_18;
LABEL_13:
      v10 = 0;
      if (!v9)
        goto LABEL_21;
LABEL_20:
      objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("UIPageCurlControllerFrontViewControllerKey"));
      goto LABEL_21;
    }
    if (self->_doubleSided)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("UIPageCurlControllerIncomingLeftViewControllerKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v12 = CFSTR("UIPageCurlControllerIncomingRightViewControllerKey");
  }
  else
  {
    if (spineLocation == 2)
    {
      if (a4)
      {
        objc_msgSend(v6, "objectForKey:", CFSTR("UIPageCurlControllerOutgoingLeftViewControllerKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v11 = CFSTR("UIPageCurlControllerIncomingRightViewControllerKey");
        goto LABEL_19;
      }
      objc_msgSend(v6, "objectForKey:", CFSTR("UIPageCurlControllerOutgoingRightViewControllerKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
      v11 = CFSTR("UIPageCurlControllerIncomingLeftViewControllerKey");
LABEL_19:
      objc_msgSend(v6, "objectForKey:", v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_21;
      goto LABEL_20;
    }
    if (a4)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("UIPageCurlControllerOutgoingLeftViewControllerKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_doubleSided)
        goto LABEL_11;
      goto LABEL_13;
    }
    if (self->_doubleSided)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("UIPageCurlControllerIncomingRightViewControllerKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v12 = CFSTR("UIPageCurlControllerIncomingLeftViewControllerKey");
  }
  objc_msgSend(v6, "objectForKey:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    goto LABEL_20;
LABEL_21:
  if (v10)
    objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("UIPageCurlControllerBackViewControllerKey"));

  return v7;
}

- (void)_populateOutgoingViewControllersInMap:(id)a3
{
  int64_t spineLocation;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  spineLocation = self->_spineLocation;
  if ((spineLocation & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v10, "setObject:forKey:", v5, CFSTR("UIPageCurlControllerOutgoingLeftViewControllerKey"));

    }
    spineLocation = self->_spineLocation;
  }
  v7 = 0;
  if (spineLocation != 1 && spineLocation != 101)
  {
    if (spineLocation != 2)
      goto LABEL_11;
    v7 = 1;
  }
  -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("UIPageCurlControllerOutgoingRightViewControllerKey"));

  }
LABEL_11:

}

- (void)_populateIncomingViewControllersInMap:(id)a3 withViewControllers:(id)a4 forCurlInDirection:(int64_t)a5
{
  id v7;
  void *v8;
  int64_t spineLocation;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  v8 = v7;
  spineLocation = self->_spineLocation;
  if (spineLocation == 101 || spineLocation == 1)
  {
    objc_msgSend(v7, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v11, CFSTR("UIPageCurlControllerIncomingRightViewControllerKey"));

    if (self->_doubleSided)
    {
      objc_msgSend(v8, "objectAtIndex:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("UIPageCurlControllerIncomingLeftViewControllerKey");
LABEL_10:
      objc_msgSend(v15, "setObject:forKey:", v12, v13);

    }
  }
  else
  {
    objc_msgSend(v7, "objectAtIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v14, CFSTR("UIPageCurlControllerIncomingLeftViewControllerKey"));

    if (self->_doubleSided)
    {
      objc_msgSend(v8, "objectAtIndex:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("UIPageCurlControllerIncomingRightViewControllerKey");
      goto LABEL_10;
    }
  }

}

- (void)_invalidateViewControllersStashedForCurlFromDataSource
{
  -[NSMutableDictionary removeAllObjects](self->_cachedViewControllersForCurl, "removeAllObjects");
}

+ (id)_outgoingViewControllerKeys
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_outgoingViewControllerKeys___outgoingViewControllerKeys;
  if (!_outgoingViewControllerKeys___outgoingViewControllerKeys)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("UIPageCurlControllerOutgoingLeftViewControllerKey"), CFSTR("UIPageCurlControllerOutgoingRightViewControllerKey"), 0);
    v4 = (void *)_outgoingViewControllerKeys___outgoingViewControllerKeys;
    _outgoingViewControllerKeys___outgoingViewControllerKeys = v3;

    v2 = (void *)_outgoingViewControllerKeys___outgoingViewControllerKeys;
  }
  return v2;
}

+ (id)_incomingViewControllerKeys
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_incomingViewControllerKeys___incomingViewControllerKeys;
  if (!_incomingViewControllerKeys___incomingViewControllerKeys)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("UIPageCurlControllerIncomingLeftViewControllerKey"), CFSTR("UIPageCurlControllerIncomingRightViewControllerKey"), 0);
    v4 = (void *)_incomingViewControllerKeys___incomingViewControllerKeys;
    _incomingViewControllerKeys___incomingViewControllerKeys = v3;

    v2 = (void *)_incomingViewControllerKeys___incomingViewControllerKeys;
  }
  return v2;
}

- (void)_beginDisablingInterfaceAutorotation
{
  objc_super v3;

  if (!-[_UIPageCurl _areAnimationsInFlightOrPending](self->_pageCurl, "_areAnimationsInFlightOrPending"))
  {
    ++self->_disableAutorotationCount;
    v3.receiver = self;
    v3.super_class = (Class)UIPageViewController;
    -[UIViewController _beginDisablingInterfaceAutorotation](&v3, sel__beginDisablingInterfaceAutorotation);
  }
}

- (void)_endDisablingInterfaceAutorotation
{
  int64_t i;
  objc_super v4;

  if (!-[_UIPageCurl _areAnimationsInFlightOrPending](self->_pageCurl, "_areAnimationsInFlightOrPending"))
  {
    for (i = self->_disableAutorotationCount; i; i = self->_disableAutorotationCount)
    {
      self->_disableAutorotationCount = i - 1;
      v4.receiver = self;
      v4.super_class = (Class)UIPageViewController;
      -[UIViewController _endDisablingInterfaceAutorotation](&v4, sel__endDisablingInterfaceAutorotation);
    }
  }
}

- (void)_setViewControllers:(id)a3 withCurlOfType:(int64_t)a4 fromLocation:(CGPoint)a5 direction:(int64_t)a6 animated:(BOOL)a7 notifyDelegate:(BOOL)a8 completion:(id)a9
{
  void *WeakRetained;
  _BOOL4 v11;
  double y;
  double x;
  id v18;
  id v19;
  id v20;
  _UIPageCurl *v21;
  int64_t spineLocation;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  _UIPageCurl *v38;
  _UIPageCurl *pageCurl;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  NSArray *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _BOOL8 v63;
  char v64;
  void *v65;
  id v66;
  id v67;
  void (**v68)(void *, void *, uint64_t, _QWORD);
  void *v69;
  uint64_t v70;
  int64_t v71;
  unint64_t v72;
  _BOOL4 v73;
  void *v74;
  _BOOL8 v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  id v81;
  id v82;
  id v83;
  void *v84;
  _UIPageCurl *v85;
  char v86;
  unsigned int v87;
  unsigned int v88;
  void *v89;
  void *v90;
  void *v91;
  int64_t v92;
  id v93;
  void *v94;
  id v95;
  id v96;
  void *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _QWORD v102[5];
  _QWORD v103[5];
  id v104;
  id v105;
  id v106;
  int64_t v107;
  int64_t v108;
  char v109;
  _QWORD aBlock[5];
  id v111;
  BOOL v112;
  _BYTE v113[128];
  uint64_t v114;

  LODWORD(WeakRetained) = a8;
  v11 = a7;
  y = a5.y;
  x = a5.x;
  v114 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a9;
  if (self->_transitionStyle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v83 = v18;
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageViewController.m"), 1395, CFSTR("Invalid transition style"));

    v18 = v83;
  }
  if (self->_stashingViewControllersForRotation)
  {
    -[UIPageViewController _setViewControllersStashedForRotation:](self, "_setViewControllersStashedForRotation:", v18);
  }
  else
  {
    if (!self->_pageCurl)
    {
      v92 = a4;
      v20 = v18;
      v21 = [_UIPageCurl alloc];
      spineLocation = self->_spineLocation;
      v23 = (int)WeakRetained;
      if (spineLocation == 101)
      {
        v24 = 3;
      }
      else
      {
        v25 = 2;
        if (spineLocation == 2)
          v25 = 8;
        if (spineLocation == 3)
          v25 = 32;
        v26 = 4;
        if (spineLocation != 2)
          v26 = 1;
        v27 = spineLocation == 3;
        v28 = 16;
        if (!v27)
          v28 = v26;
        if (self->_navigationOrientation)
          v24 = v25;
        else
          v24 = v28;
      }
      -[UIViewController view](self, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "bounds");
      v31 = v30;
      v33 = v32;
      v35 = v34;
      v37 = v36;
      -[UIViewController view](self, "view");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[_UIPageCurl initWithSpineLocation:andContentRect:inContentView:](v21, "initWithSpineLocation:andContentRect:inContentView:", v24, WeakRetained, v31, v33, v35, v37);
      pageCurl = self->_pageCurl;
      self->_pageCurl = v38;

      v18 = v20;
      LODWORD(WeakRetained) = v23;
      a4 = v92;
    }
    if (-[UIPageViewController _isCurrentViewControllerStateValid](self, "_isCurrentViewControllerStateValid") && v11)
    {
      -[UIPageViewController _validatedViewControllersForTransitionWithViewControllers:animated:](self, "_validatedViewControllersForTransitionWithViewControllers:animated:", v18, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v40, "count")
        && -[_UIPageCurl _isPreviousCurlCompatibleWithCurlOfType:inDirection:](self->_pageCurl, "_isPreviousCurlCompatibleWithCurlOfType:inDirection:", a4, a6))
      {
        v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        -[UIPageViewController _populateOutgoingViewControllersInMap:](self, "_populateOutgoingViewControllersInMap:", v41);
        if (self->_spineLocation == 2)
        {
          v42 = v40;
        }
        else
        {
          objc_msgSend(v40, "subarrayWithRange:", 0, 1);
          v42 = (id)objc_claimAutoreleasedReturnValue();
        }
        v89 = v42;
        if ((_DWORD)WeakRetained && (*(_WORD *)&self->_delegateFlags & 1) != 0)
        {
          v64 = (char)WeakRetained;
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "pageViewController:willTransitionToViewControllers:", self, v89);

          LOBYTE(WeakRetained) = v64;
        }
        v94 = v19;
        -[UIPageViewController _populateIncomingViewControllersInMap:withViewControllers:forCurlInDirection:](self, "_populateIncomingViewControllersInMap:withViewControllers:forCurlInDirection:", v41, v40, a6);
        v96 = v18;
        if (a4 == 4 || a4 == 1)
          -[UIPageViewController _setViewControllers:](self, "_setViewControllers:", v89);
        else
          objc_storeStrong((id *)&self->_incomingAndOutgoingViewControllersForManualTransition, v41);
        -[UIPageViewController _viewControllersForCurlWithViewControllers:direction:](self, "_viewControllersForCurlWithViewControllers:direction:", v41, a6);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "objectForKey:", CFSTR("UIPageCurlControllerFrontViewControllerKey"));
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "objectForKey:", CFSTR("UIPageCurlControllerBackViewControllerKey"));
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke;
        aBlock[3] = &unk_1E16C0D20;
        aBlock[4] = self;
        v112 = v11;
        v67 = v66;
        v111 = v67;
        v68 = (void (**)(void *, void *, uint64_t, _QWORD))_Block_copy(aBlock);
        objc_msgSend(v41, "objectForKey:", CFSTR("UIPageCurlControllerIncomingRightViewControllerKey"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (a6)
        {
          v70 = 0;
        }
        else
        {
          v71 = self->_spineLocation;
          v72 = v71 - 1;
          v73 = v71 == 101;
          v70 = v72 < 2 || v73;
        }
        v86 = (char)WeakRetained;
        v68[2](v68, v69, v70, 0);

        objc_msgSend(v41, "objectForKey:", CFSTR("UIPageCurlControllerIncomingLeftViewControllerKey"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = 0;
        if (a6 == 1)
          v75 = (self->_spineLocation & 0xFFFFFFFFFFFFFFFELL) == 2;
        v68[2](v68, v74, v75, 1);

        objc_msgSend(v41, "objectForKey:", CFSTR("UIPageCurlControllerOutgoingLeftViewControllerKey"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPageViewController _child:beginAppearanceTransition:animated:](self, "_child:beginAppearanceTransition:animated:", v76, 0, 1);

        objc_msgSend(v41, "objectForKey:", CFSTR("UIPageCurlControllerOutgoingRightViewControllerKey"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPageViewController _child:beginAppearanceTransition:animated:](self, "_child:beginAppearanceTransition:animated:", v77, 0, 1);

        -[UIPageViewController _beginDisablingInterfaceAutorotation](self, "_beginDisablingInterfaceAutorotation");
        v85 = self->_pageCurl;
        objc_msgSend(v91, "view");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "view");
        v97 = v68;
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = MEMORY[0x1E0C809B0];
        v103[0] = MEMORY[0x1E0C809B0];
        v103[1] = 3221225472;
        v103[2] = __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_2;
        v103[3] = &unk_1E16C0DE8;
        v103[4] = self;
        v104 = v41;
        v105 = v67;
        v107 = a6;
        v108 = a4;
        v106 = v94;
        v109 = v86;
        v102[0] = v80;
        v102[1] = 3221225472;
        v102[2] = __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_7;
        v102[3] = &unk_1E16B1B28;
        v102[4] = self;
        v81 = v67;
        v82 = v41;
        -[_UIPageCurl _enqueueCurlOfType:fromLocation:inDirection:withView:revealingView:completion:finally:](v85, "_enqueueCurlOfType:fromLocation:inDirection:withView:revealingView:completion:finally:", a4, a6, v78, v79, v103, v102, x, y);

        v18 = v96;
        v19 = v94;
      }

    }
    else
    {
      v43 = -[UIGestureRecognizer isEnabled](self->_tapGestureRecognizer, "isEnabled");
      v44 = -[UIGestureRecognizer isEnabled](self->_panGestureRecognizer, "isEnabled");
      -[UIGestureRecognizer setEnabled:](self->_tapGestureRecognizer, "setEnabled:", 0);
      -[UIGestureRecognizer setEnabled:](self->_panGestureRecognizer, "setEnabled:", 0);
      -[_UIPageCurl _cancelAllActiveTransitionsAndAbandonCallbacks:](self->_pageCurl, "_cancelAllActiveTransitionsAndAbandonCallbacks:", 0);
      if (-[NSArray count](self->_viewControllers, "count") || objc_msgSend(v18, "count"))
      {
        -[UIPageViewController _validatedViewControllersForTransitionWithViewControllers:animated:](self, "_validatedViewControllersForTransitionWithViewControllers:animated:", v18, 0);
        v45 = objc_claimAutoreleasedReturnValue();
        if (v45)
        {
          v46 = (void *)v45;
          v87 = v44;
          v88 = v43;
          v93 = v19;
          v95 = v18;
          v47 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v98 = 0u;
          v99 = 0u;
          v100 = 0u;
          v101 = 0u;
          v48 = self->_viewControllers;
          v49 = -[NSArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v98, v113, 16);
          if (v49)
          {
            v50 = v49;
            v51 = *(_QWORD *)v99;
            do
            {
              for (i = 0; i != v50; ++i)
              {
                if (*(_QWORD *)v99 != v51)
                  objc_enumerationMutation(v48);
                v53 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
                if (objc_msgSend(v46, "containsObject:", v53))
                {
                  objc_msgSend(v47, "addObject:", v53);
                }
                else
                {
                  objc_msgSend(v53, "willMoveToParentViewController:", 0);
                  if (objc_msgSend(v53, "isViewLoaded"))
                  {
                    -[UIPageViewController _child:beginAppearanceTransition:animated:](self, "_child:beginAppearanceTransition:animated:", v53, 0, 0);
                    objc_msgSend(v53, "view");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "removeFromSuperview");

                    -[UIPageViewController _childEndAppearanceTransition:](self, "_childEndAppearanceTransition:", v53);
                  }
                  objc_msgSend(v53, "removeFromParentViewController");
                }
              }
              v50 = -[NSArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v98, v113, 16);
            }
            while (v50);
          }

          -[UIPageViewController _setViewControllers:](self, "_setViewControllers:", v46);
          v19 = v93;
          if (-[NSArray count](self->_viewControllers, "count"))
          {
            v55 = 0;
            do
            {
              -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", v55);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v47, "containsObject:", v56) & 1) == 0)
                -[UIViewController addChildViewController:](self, "addChildViewController:", v56);
              objc_msgSend(v56, "view");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "superview");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIViewController view](self, "view");
              v59 = (void *)objc_claimAutoreleasedReturnValue();

              if (v58 != v59)
              {
                -[UIPageViewController _child:beginAppearanceTransition:animated:](self, "_child:beginAppearanceTransition:animated:", v56, 1, 0);
                -[UIViewController view](self, "view");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "view");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "addSubview:", v61);

                -[UIPageViewController _childEndAppearanceTransition:](self, "_childEndAppearanceTransition:", v56);
              }
              if ((objc_msgSend(v47, "containsObject:", v56) & 1) == 0)
                objc_msgSend(v56, "didMoveToParentViewController:", self);
              objc_msgSend(v56, "view");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              if (v55)
                v63 = 0;
              else
                v63 = (self->_spineLocation & 0xFFFFFFFFFFFFFFFELL) == 2;
              -[_UIPageCurl _pageViewFrame:](self->_pageCurl, "_pageViewFrame:", v63);
              objc_msgSend(v62, "setFrame:");

              ++v55;
            }
            while (v55 < -[NSArray count](self->_viewControllers, "count"));
          }

          v18 = v95;
          v43 = v88;
          v44 = v87;
        }
      }
      if (v19)
        (*((void (**)(id, uint64_t))v19 + 2))(v19, 1);
      -[UIGestureRecognizer setEnabled:](self->_tapGestureRecognizer, "setEnabled:", v43);
      -[UIGestureRecognizer setEnabled:](self->_panGestureRecognizer, "setEnabled:", v44);
    }
  }
  -[UIPageViewController _invalidateViewControllersStashedForCurlFromDataSource](self, "_invalidateViewControllersStashedForCurlFromDataSource");

}

void __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a2;
  if (v7)
  {
    v11 = v7;
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "_pageViewFrame:", a4);
    objc_msgSend(v8, "setFrame:");

    objc_msgSend(*(id *)(a1 + 32), "_child:beginAppearanceTransition:animated:", v11, 1, *(unsigned __int8 *)(a1 + 48));
    v7 = v11;
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 32), "addChildViewController:", v11);
      objc_msgSend(*(id *)(a1 + 32), "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertSubview:atIndex:", v10, 0);

      objc_msgSend(v11, "didMoveToParentViewController:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
      v7 = v11;
    }
  }

}

void __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_2(uint64_t a1, unsigned int a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void (**v13)(void *, void *);
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void (**v18)(void *, void *, _BOOL8, uint64_t);
  void *v19;
  _BOOL8 v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void (**v24)(void *, void *);
  void *v25;
  void *v26;
  void (**v27)(void *, _QWORD, _BOOL8, _BOOL8);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  _BOOL8 v34;
  void *v35;
  _BOOL8 v36;
  uint64_t v37;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id WeakRetained;
  void *v46;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  _QWORD v54[4];
  id v55;
  uint64_t v56;
  _QWORD v57[4];
  id v58;
  uint64_t v59;
  _QWORD aBlock[5];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  objc_msgSend((id)objc_opt_class(), "_outgoingViewControllerKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v62 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v8);
  }

  if ((_DWORD)a3)
  {
    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_3;
    aBlock[3] = &unk_1E16C0D48;
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v13 = (void (**)(void *, void *))_Block_copy(aBlock);
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("UIPageCurlControllerOutgoingLeftViewControllerKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v14);

    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("UIPageCurlControllerOutgoingRightViewControllerKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v15);

    v57[0] = v12;
    v57[1] = 3221225472;
    v57[2] = __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_4;
    v57[3] = &unk_1E16C0D70;
    v16 = *(id *)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 32);
    v58 = v16;
    v59 = v17;
    v18 = (void (**)(void *, void *, _BOOL8, uint64_t))_Block_copy(v57);
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("UIPageCurlControllerIncomingLeftViewControllerKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 64))
      v20 = 0;
    else
      v20 = (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1000) & 0xFFFFFFFFFFFFFFFELL) == 2;
    v18[2](v18, v19, v20, 1);

    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("UIPageCurlControllerIncomingRightViewControllerKey"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 64) != 1
      || (v40 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1000), v41 = 1, (unint64_t)(v40 - 1) >= 2) && v40 != 101)
    {
      v41 = 0;
    }
    v18[2](v18, v39, v41, 0);

  }
  else
  {
    v21 = MEMORY[0x1E0C809B0];
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_5;
    v54[3] = &unk_1E16C0D98;
    v22 = *(id *)(a1 + 48);
    v23 = *(_QWORD *)(a1 + 32);
    v55 = v22;
    v56 = v23;
    v24 = (void (**)(void *, void *))_Block_copy(v54);
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("UIPageCurlControllerIncomingLeftViewControllerKey"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2](v24, v25);

    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("UIPageCurlControllerIncomingRightViewControllerKey"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2](v24, v26);

    v53[0] = v21;
    v53[1] = 3221225472;
    v53[2] = __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_6;
    v53[3] = &unk_1E16C0DC0;
    v53[4] = *(_QWORD *)(a1 + 32);
    v27 = (void (**)(void *, _QWORD, _BOOL8, _BOOL8))_Block_copy(v53);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v46 = v5;
    obj = v5;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v50 != v30)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "objectAtIndex:", 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v32 == v33 || *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1000) == 2;

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "objectAtIndex:", 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32 == v35)
          {
            v37 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1000);
            v36 = v37 != 1 && v37 != 101;
          }
          else
          {
            v36 = 0;
          }

          ((void (**)(void *, void *, _BOOL8, _BOOL8))v27)[2](v27, v32, v34, v36);
        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
      }
      while (v29);
    }

    a3 = 0;
    v5 = v46;
  }
  v42 = *(_QWORD *)(a1 + 72);
  if (v42 == 4 || v42 == 1)
  {
    v43 = *(_QWORD *)(a1 + 56);
    if (v43)
      (*(void (**)(uint64_t, _QWORD))(v43 + 16))(v43, a2);
  }
  if (*(_BYTE *)(a1 + 80))
  {
    v44 = *(_QWORD *)(a1 + 32);
    if ((*(_WORD *)(v44 + 1240) & 2) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v44 + 968));
      objc_msgSend(WeakRetained, "pageViewController:didFinishAnimating:previousViewControllers:transitionCompleted:", *(_QWORD *)(a1 + 32), a2, v5, a3);

    }
  }

}

void __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "willMoveToParentViewController:", 0);
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "_childEndAppearanceTransition:", v4);
  objc_msgSend(v4, "removeFromParentViewController");

}

void __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_4(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;

  v7 = a2;
  v8 = v7;
  if (v7)
  {
    v13 = v7;
    if (a3)
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7) & 1) == 0)
        objc_msgSend(*(id *)(a1 + 40), "addChildViewController:", v13);
      objc_msgSend(v13, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1024), "_pageViewFrame:", a4);
      objc_msgSend(v9, "setFrame:");

      objc_msgSend(*(id *)(a1 + 40), "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertSubview:atIndex:", v11, 0);

      v12 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v13);
      v8 = v13;
      if ((v12 & 1) == 0)
      {
        objc_msgSend(v13, "didMoveToParentViewController:", *(_QWORD *)(a1 + 40));
        v8 = v13;
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_childEndAppearanceTransition:", v8);
    v8 = v13;
  }

}

void __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (v3)
  {
    v5 = v3;
    if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3))
    {
      objc_msgSend(v5, "willMoveToParentViewController:", 0);
      objc_msgSend(v5, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeFromSuperview");

      objc_msgSend(v5, "removeFromParentViewController");
    }
    objc_msgSend(*(id *)(a1 + 40), "_childEndAppearanceTransition:", v5);
    v3 = v5;
  }

}

void __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_6(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a2;
  if (v7)
  {
    v14 = v7;
    if (a3)
    {
      objc_msgSend(v7, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "superview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != v10)
      {
        objc_msgSend(v14, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "_pageViewFrame:", a4);
        objc_msgSend(v11, "setFrame:");

        objc_msgSend(*(id *)(a1 + 32), "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addSubview:", v13);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_childEndAppearanceTransition:", v14);
    v7 = v14;
  }

}

uint64_t __117__UIPageViewController__setViewControllers_withCurlOfType_fromLocation_direction_animated_notifyDelegate_completion___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endDisablingInterfaceAutorotation");
}

- (void)_cacheViewControllerForScroll:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[NSHashTable containsObject:](self->_cachedViewControllersForScroll, "containsObject:"))
  {
    -[UIViewController addChildViewController:](self, "addChildViewController:", v4);
    objc_msgSend(v4, "didMoveToParentViewController:", self);
    -[NSHashTable addObject:](self->_cachedViewControllersForScroll, "addObject:", v4);
  }

}

- (void)_setViewControllers:(id)a3 withScrollInDirection:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  NSArray *v19;
  NSArray *viewControllers;
  void *v21;
  void *v22;
  char v23;
  id v24;
  _QWORD v25[5];
  id v26;

  v6 = a5;
  v10 = a6;
  -[UIPageViewController _validatedViewControllersForTransitionWithViewControllers:animated:](self, "_validatedViewControllersForTransitionWithViewControllers:animated:", a3, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray _ui_onlyObject](self->_viewControllers, "_ui_onlyObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_ui_onlyObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[UIPageViewController _scrollView](self, "_scrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "visibleView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = v15;
      if (v13 == v12 && v6)
      {

        goto LABEL_11;
      }
      -[UIPageViewController _scrollView](self, "_scrollView");
      v24 = v10;
      v17 = a4;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v18, "isPreviousScrollCompatibleWithScrollInDirection:", v17);

      a4 = v17;
      v10 = v24;

      if ((v23 & 1) == 0)
        goto LABEL_11;
    }
    else
    {

    }
    if (v6)
      v6 = -[NSArray count](self->_viewControllers, "count") != 0;
    objc_msgSend(v12, "willMoveToParentViewController:", 0);
    -[UIPageViewController _cacheViewControllerForScroll:](self, "_cacheViewControllerForScroll:", v13);
    v19 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v13, 0);
    viewControllers = self->_viewControllers;
    self->_viewControllers = v19;

    -[UIPageViewController _scrollView](self, "_scrollView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __86__UIPageViewController__setViewControllers_withScrollInDirection_animated_completion___block_invoke;
    v25[3] = &unk_1E16C0E10;
    v25[4] = self;
    v26 = v10;
    objc_msgSend(v21, "setView:direction:animated:completion:", v22, a4, v6, v25);

  }
LABEL_11:

}

void __86__UIPageViewController__setViewControllers_withScrollInDirection_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_contentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)setViewControllers:(NSArray *)viewControllers direction:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated completion:(void *)completion
{
  _BOOL8 v7;
  NSArray *v10;
  void *v11;
  void *v12;
  int64_t transitionStyle;
  _QWORD v14[4];
  id v15;

  v7 = animated;
  v10 = viewControllers;
  v11 = completion;
  v12 = v11;
  transitionStyle = self->_transitionStyle;
  if (transitionStyle == 1)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __73__UIPageViewController_setViewControllers_direction_animated_completion___block_invoke;
    v14[3] = &unk_1E16C0E38;
    v15 = v11;
    -[UIPageViewController _setViewControllers:withScrollInDirection:animated:completion:](self, "_setViewControllers:withScrollInDirection:animated:completion:", v10, direction, v7, v14);
    -[UIPageViewController _updatePageControlViaDataSourceIfNecessary](self, "_updatePageControlViaDataSourceIfNecessary");

  }
  else if (!transitionStyle && (!self->_interfaceRotating || self->_stashingViewControllersForRotation))
  {
    -[UIPageViewController _setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:](self, "_setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:", v10, 1, direction, v7, 0, v11, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  }

}

uint64_t __73__UIPageViewController_setViewControllers_direction_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_deepestActionResponder
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__UIPageViewController__deepestActionResponder__block_invoke;
  v3[3] = &unk_1E16BE5F0;
  v3[4] = self;
  -[UIViewController _deepestPresentedActionResponderOrBlock:](self, "_deepestPresentedActionResponderOrBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __47__UIPageViewController__deepestActionResponder__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "_hasDeepestActionResponder"))
        {
          if (v5)
          {

            goto LABEL_14;
          }
          v5 = v8;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }

    if (v5)
    {
      objc_msgSend(v5, "_deepestActionResponder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      return v9;
    }
  }
  else
  {
LABEL_14:

  }
  v11.receiver = *(id *)(a1 + 32);
  v11.super_class = (Class)UIPageViewController;
  objc_msgSendSuper2(&v11, sel__deepestActionResponder);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_incomingViewControllersForGestureDrivenCurlInDirection:(int64_t)a3
{
  NSMutableDictionary *cachedViewControllersForCurl;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *viewControllers;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;

  cachedViewControllersForCurl = self->_cachedViewControllersForCurl;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](cachedViewControllersForCurl, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[NSMutableDictionary removeAllObjects](self->_cachedViewControllersForCurl, "removeAllObjects");
    if (a3)
    {
      -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPageViewController _viewControllerBeforeViewController:](self, "_viewControllerBeforeViewController:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = (void *)MEMORY[0x1E0C99D20];
        if (self->_doubleSided)
        {
          -[UIPageViewController _viewControllerBeforeViewController:](self, "_viewControllerBeforeViewController:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "arrayWithObjects:", v11, v9, 0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v9, 0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v18 = self->_cachedViewControllersForCurl;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v18;
        goto LABEL_18;
      }
LABEL_13:
      v7 = 0;
LABEL_19:

      return v7;
    }
    viewControllers = self->_viewControllers;
    if (self->_spineLocation == 2)
    {
      -[NSArray objectAtIndex:](viewControllers, "objectAtIndex:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPageViewController _viewControllerAfterViewController:](self, "_viewControllerAfterViewController:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_13;
      v14 = (void *)MEMORY[0x1E0C99D20];
      -[UIPageViewController _viewControllerAfterViewController:](self, "_viewControllerAfterViewController:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "arrayWithObjects:", v9, v15, 0);
    }
    else
    {
      -[NSArray objectAtIndex:](viewControllers, "objectAtIndex:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPageViewController _viewControllerAfterViewController:](self, "_viewControllerAfterViewController:", v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_13;
      v17 = (void *)MEMORY[0x1E0C99D20];
      if (!self->_doubleSided)
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v9, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      -[UIPageViewController _viewControllerAfterViewController:](self, "_viewControllerAfterViewController:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "arrayWithObjects:", v15, v9, 0);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
    v21 = self->_cachedViewControllersForCurl;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v21;
LABEL_18:
    -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v7, v19);

    goto LABEL_19;
  }
  return v7;
}

- (CGRect)_tapRegions
{
  CGRect *result;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int64_t navigationOrientation;
  CGRect *tapRegions;
  void *v18;
  double MinX;
  void *v20;
  CGFloat MinY;
  void *v22;
  CGFloat Width;
  CGRect *v24;
  void *v25;
  CGFloat v26;
  void *v27;
  CGFloat v28;
  void *v29;
  CGFloat v30;
  void *v31;
  CGFloat Height;
  CGRect *v33;
  CGFloat v34;
  CGFloat v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  result = self->_tapRegions;
  if (!result)
  {
    self->_tapRegions = (CGRect *)malloc_type_malloc(0x40uLL, 0x1000040E0EAB150uLL);
    -[UIPageViewController _effectiveTapRegionInsets](self, "_effectiveTapRegionInsets");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[UIPageViewController _effectiveTapRegionBreadths](self, "_effectiveTapRegionBreadths");
    v13 = v12;
    v15 = v14;
    navigationOrientation = self->_navigationOrientation;
    tapRegions = self->_tapRegions;
    -[UIGestureRecognizer view](self->_tapGestureRecognizer, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    MinX = CGRectGetMinX(v36);
    -[UIGestureRecognizer view](self->_tapGestureRecognizer, "view");
    if (navigationOrientation)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bounds");
      MinY = CGRectGetMinY(v37);
      -[UIGestureRecognizer view](self->_tapGestureRecognizer, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bounds");
      Width = CGRectGetWidth(v38);
      tapRegions->origin.x = v7 + MinX;
      tapRegions->origin.y = MinY;
      tapRegions->size.width = Width - v7 - v11;
      tapRegions->size.height = v15;

      v24 = self->_tapRegions;
      -[UIGestureRecognizer view](self->_tapGestureRecognizer, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "bounds");
      v26 = v7 + CGRectGetMinX(v39);
      -[UIGestureRecognizer view](self->_tapGestureRecognizer, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bounds");
      v28 = CGRectGetMaxY(v40) - v15;
      -[UIGestureRecognizer view](self->_tapGestureRecognizer, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "bounds");
      v30 = CGRectGetWidth(v41);
      v24[1].origin.x = v26;
      v24[1].origin.y = v28;
      v24[1].size.width = v30 - v7 - v11;
      v24[1].size.height = v15;

    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "bounds");
      Height = CGRectGetHeight(v42);
      tapRegions->origin.x = MinX;
      tapRegions->origin.y = v5;
      tapRegions->size.width = v13;
      tapRegions->size.height = Height - v5 - v9;

      v33 = self->_tapRegions;
      -[UIGestureRecognizer view](self->_tapGestureRecognizer, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "bounds");
      v34 = CGRectGetMaxX(v43) - v13;
      -[UIGestureRecognizer view](self->_tapGestureRecognizer, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bounds");
      v35 = CGRectGetHeight(v44);
      v33[1].origin.x = v34;
      v33[1].origin.y = v5;
      v33[1].size.width = v13;
      v33[1].size.height = v35 - v5 - v9;
    }

    return self->_tapRegions;
  }
  return result;
}

- (BOOL)_shouldNavigateInDirection:(int64_t *)a3 inResponseToTapGestureRecognizer:(id)a4
{
  id v6;
  BOOL v7;
  CGRect *v8;
  char v9;
  uint64_t v10;
  char v11;
  CGRect *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  _BOOL4 v16;
  char v17;
  CGPoint v19;

  v6 = a4;
  if (self->_transitionStyle)
  {
    v7 = 0;
  }
  else
  {
    v8 = -[UIPageViewController _tapRegions](self, "_tapRegions");
    v9 = 0;
    v10 = 0;
    v11 = 1;
    while (1)
    {
      v12 = &v8[v10];
      objc_msgSend(v6, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "locationInView:", v13);
      v19.x = v14;
      v19.y = v15;
      v16 = CGRectContainsPoint(*v12, v19);

      if (a3)
      {
        if (v16)
          break;
      }
      if (v16)
        v9 = 1;
      v17 = v11 & ((v9 & 1) == 0);
      v10 = 1;
      v11 = 0;
      if ((v17 & 1) == 0)
      {
        v7 = v9 & 1;
        goto LABEL_11;
      }
    }
    *a3 = v11 & 1;
    v7 = 1;
  }
LABEL_11:

  return v7;
}

- (BOOL)_shouldFlipInRightToLeft
{
  unsigned int *v3;
  unint64_t v4;

  if (-[UIPageViewController navigationOrientation](self, "navigationOrientation") == UIPageViewControllerNavigationOrientationVertical
    || -[UIPageViewController transitionStyle](self, "transitionStyle") == UIPageViewControllerTransitionStylePageCurl)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    -[UIViewController view](self, "view");
    v3 = (unsigned int *)objc_claimAutoreleasedReturnValue();
    v4 = ((unint64_t)v3[30] >> 19) & 1;

  }
  return v4;
}

- (BOOL)_shouldNavigateInDirection:(int64_t *)a3 inResponseToVelocity:(double *)a4 ofGestureRecognizedByPanGestureRecognizer:(id)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int64_t navigationOrientation;
  double v15;
  int64_t v16;
  double v17;
  BOOL result;

  v8 = a5;
  -[UIViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "velocityInView:", v9);
  v11 = v10;
  v13 = v12;

  navigationOrientation = self->_navigationOrientation;
  if (navigationOrientation == 1)
  {
    v17 = -v13;
    if (v13 >= 0.0)
      v17 = v13;
    if (v17 > 300.0)
    {
      v11 = v13;
      if (!a4)
      {
LABEL_8:
        if (-[UIPageViewController _shouldFlipInRightToLeft](self, "_shouldFlipInRightToLeft"))
        {
          if (a3)
          {
            v16 = v11 < 0.0;
LABEL_20:
            *a3 = v16;
          }
        }
        else if (a3)
        {
          v16 = v11 >= 0.0;
          goto LABEL_20;
        }
        return 1;
      }
LABEL_7:
      *a4 = v11;
      goto LABEL_8;
    }
  }
  else if (!navigationOrientation)
  {
    v15 = -v11;
    if (v11 >= 0.0)
      v15 = v11;
    if (v15 > 300.0)
    {
      if (!a4)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  result = 0;
  if (a4)
    *a4 = 0.0;
  return result;
}

- (BOOL)_shouldBeginNavigationInDirection:(int64_t *)a3 inResponseToPanGestureRecognizer:(id)a4
{
  id v6;
  BOOL v7;
  int64_t v8;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;
  double v20;
  BOOL v21;
  int64_t v22;

  v6 = a4;
  if (!self->_transitionStyle)
  {
    v22 = 0;
    if (-[UIPageViewController _shouldNavigateInDirection:inResponseToVelocity:ofGestureRecognizedByPanGestureRecognizer:](self, "_shouldNavigateInDirection:inResponseToVelocity:ofGestureRecognizedByPanGestureRecognizer:", &v22, 0, v6))
    {
      if (!a3)
      {
LABEL_7:
        v7 = 1;
        goto LABEL_8;
      }
      v8 = v22;
LABEL_6:
      *a3 = v8;
      goto LABEL_7;
    }
    -[UIViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "translationInView:", v11);
    v13 = v12;
    v15 = v14;

    if (self->_navigationOrientation)
    {
      v16 = -v15;
      if (v15 >= 0.0)
        v16 = v15;
      v17 = -v13;
      if (v13 >= 0.0)
        v17 = v13;
      if (v16 <= v17)
        goto LABEL_2;
      if (-[UIPageViewController _shouldFlipInRightToLeft](self, "_shouldFlipInRightToLeft"))
      {
        if (!a3)
          goto LABEL_7;
        v18 = v15 < 0.0;
        goto LABEL_26;
      }
      if (!a3)
        goto LABEL_7;
      v21 = v15 < 0.0;
    }
    else
    {
      v19 = -v13;
      if (v13 >= 0.0)
        v19 = v13;
      v20 = -v15;
      if (v15 >= 0.0)
        v20 = v15;
      if (v19 <= v20)
        goto LABEL_2;
      if (-[UIPageViewController _shouldFlipInRightToLeft](self, "_shouldFlipInRightToLeft"))
      {
        if (!a3)
          goto LABEL_7;
        v18 = v13 < 0.0;
LABEL_26:
        v8 = v18;
        goto LABEL_6;
      }
      if (!a3)
        goto LABEL_7;
      v21 = v13 < 0.0;
    }
    v8 = !v21;
    goto LABEL_6;
  }
LABEL_2:
  v7 = 0;
LABEL_8:

  return v7;
}

- (BOOL)_gestureRecognizerShouldBegin:(id)a3
{
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *v5;
  UIPanGestureRecognizer *panGestureRecognizer;
  BOOL v7;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v14;

  v4 = (UITapGestureRecognizer *)a3;
  v5 = v4;
  v14 = -1;
  panGestureRecognizer = self->_panGestureRecognizer;
  if (panGestureRecognizer)
    v7 = panGestureRecognizer == (UIPanGestureRecognizer *)v4;
  else
    v7 = 0;
  if (!v7)
  {
    tapGestureRecognizer = self->_tapGestureRecognizer;
    if (!tapGestureRecognizer || tapGestureRecognizer != v4)
      goto LABEL_16;
  }
  if (!-[UIPageViewController _canHandleGestures](self, "_canHandleGestures")
    || !-[UIPageViewController _isCurrentViewControllerStateValid](self, "_isCurrentViewControllerStateValid"))
  {
    goto LABEL_17;
  }
  if (self->_tapGestureRecognizer != v5)
  {
    -[UIPageViewController _shouldBeginNavigationInDirection:inResponseToPanGestureRecognizer:](self, "_shouldBeginNavigationInDirection:inResponseToPanGestureRecognizer:", &v14, self->_panGestureRecognizer);
    goto LABEL_15;
  }
  if (!-[UIPageViewController _shouldNavigateInDirection:inResponseToTapGestureRecognizer:](self, "_shouldNavigateInDirection:inResponseToTapGestureRecognizer:", &v14, v5))
  {
LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
LABEL_15:
  -[UIPageViewController _incomingViewControllersForGestureDrivenCurlInDirection:](self, "_incomingViewControllersForGestureDrivenCurlInDirection:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
    goto LABEL_17;
LABEL_16:
  v12 = -[UIGestureRecognizer state](v5, "state") == UIGestureRecognizerStatePossible;
LABEL_18:

  return v12;
}

- (int64_t)_navigationEndDirectionInResponseToPanGestureRecognizer:(id)a3 suggestedVelocity:(double *)a4
{
  id v6;
  int64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t navigationOrientation;
  BOOL v14;
  void *v15;
  uint64_t v16;
  double MidY;
  BOOL v21;
  double MidX;
  unsigned int v23;
  int v24;
  int64_t v26;

  v6 = a3;
  if (self->_transitionStyle)
  {
    v7 = 1;
  }
  else
  {
    v26 = 0;
    if (-[UIPageViewController _shouldNavigateInDirection:inResponseToVelocity:ofGestureRecognizedByPanGestureRecognizer:](self, "_shouldNavigateInDirection:inResponseToVelocity:ofGestureRecognizedByPanGestureRecognizer:", &v26, a4, v6))
    {
      v7 = v26;
    }
    else
    {
      if (a4)
        *a4 = 0.0;
      -[UIViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "locationInView:", v8);
      v10 = v9;
      v12 = v11;

      navigationOrientation = self->_navigationOrientation;
      v14 = -[UIPageViewController _shouldFlipInRightToLeft](self, "_shouldFlipInRightToLeft");
      -[UIViewController view](self, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      if (navigationOrientation)
      {
        MidY = CGRectGetMidY(*(CGRect *)&v16);

        v21 = v12 <= MidY;
      }
      else
      {
        MidX = CGRectGetMidX(*(CGRect *)&v16);

        v21 = v10 <= MidX;
      }
      v23 = v21;
      v24 = !v21;
      if (!v14)
        v23 = v24;
      v7 = v23;
    }
  }

  return v7;
}

- (BOOL)_shouldCompleteManualCurlWithSuggestedVelocity:(double *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  -[_UIPageCurl _wrappedManualPageCurlDirection](self->_pageCurl, "_wrappedManualPageCurlDirection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "integerValue");
    v8 = v7 == -[UIPageViewController _navigationEndDirectionInResponseToPanGestureRecognizer:suggestedVelocity:](self, "_navigationEndDirectionInResponseToPanGestureRecognizer:suggestedVelocity:", self->_panGestureRecognizer, a3);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_handlePanGesture:(id)a3
{
  UIPanGestureRecognizer *v4;
  UIPanGestureRecognizer *v5;
  UIPanGestureRecognizer *panGestureRecognizer;
  BOOL v7;
  void *v8;
  UIPanGestureRecognizer *v9;
  void *v10;
  _UIPageCurl *v11;
  UIPanGestureRecognizer *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int64_t spineLocation;
  void *v22;
  _UIPageCurl *v23;
  UIPanGestureRecognizer *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  _UIPageCurl *pageCurl;
  UIPanGestureRecognizer *v39;
  NSDictionary *incomingAndOutgoingViewControllersForManualTransition;
  void *v41;
  uint64_t v42;
  UIPanGestureRecognizer *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = (UIPanGestureRecognizer *)a3;
  v5 = v4;
  panGestureRecognizer = self->_panGestureRecognizer;
  if (panGestureRecognizer)
    v7 = panGestureRecognizer == v4;
  else
    v7 = 0;
  if (!v7)
    goto LABEL_53;
  if (-[UIGestureRecognizer state](v4, "state") == UIGestureRecognizerStateBegan)
  {
    v57 = 0;
    if (-[_UIPageCurl _isManualPageCurlInProgressAndUncommitted](self->_pageCurl, "_isManualPageCurlInProgressAndUncommitted")|| !-[UIPageViewController _shouldBeginNavigationInDirection:inResponseToPanGestureRecognizer:](self, "_shouldBeginNavigationInDirection:inResponseToPanGestureRecognizer:", &v57, self->_panGestureRecognizer))
    {
      goto LABEL_53;
    }
LABEL_9:
    -[UIPageViewController _incomingViewControllersForGestureDrivenCurlInDirection:](self, "_incomingViewControllersForGestureDrivenCurlInDirection:", v57);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_panGestureRecognizer;
    -[UIViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanGestureRecognizer locationInView:](v9, "locationInView:", v10);
    -[UIPageViewController _setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:](self, "_setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:", v8, 0, v57, 1, 1, 0);

    goto LABEL_53;
  }
  if (-[UIGestureRecognizer state](self->_panGestureRecognizer, "state") != UIGestureRecognizerStateChanged)
  {
    if (-[UIGestureRecognizer state](self->_panGestureRecognizer, "state") != UIGestureRecognizerStateEnded
      && -[UIGestureRecognizer state](self->_panGestureRecognizer, "state") != UIGestureRecognizerStateCancelled)
    {
      goto LABEL_53;
    }
    v57 = 0;
    if (!-[UIGestureRecognizer isEnabled](v5, "isEnabled")
      || !-[UIPageViewController _shouldCompleteManualCurlWithSuggestedVelocity:](self, "_shouldCompleteManualCurlWithSuggestedVelocity:", &v57))
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      objc_msgSend((id)objc_opt_class(), "_incomingViewControllerKeys");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v50 != v29)
              objc_enumerationMutation(v26);
            -[NSDictionary objectForKey:](self->_incomingAndOutgoingViewControllersForManualTransition, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIPageViewController _child:beginAppearanceTransition:animated:](self, "_child:beginAppearanceTransition:animated:", v31, 0, 1);

          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
        }
        while (v28);
      }

      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      objc_msgSend((id)objc_opt_class(), "_outgoingViewControllerKeys");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v46;
        do
        {
          for (j = 0; j != v34; ++j)
          {
            if (*(_QWORD *)v46 != v35)
              objc_enumerationMutation(v32);
            -[NSDictionary objectForKey:](self->_incomingAndOutgoingViewControllersForManualTransition, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIPageViewController _child:beginAppearanceTransition:animated:](self, "_child:beginAppearanceTransition:animated:", v37, 1, 1);

          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
        }
        while (v34);
      }

      pageCurl = self->_pageCurl;
      v39 = self->_panGestureRecognizer;
      -[UIViewController view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPanGestureRecognizer locationInView:](v39, "locationInView:", v22);
      -[_UIPageCurl _abortManualCurlAtLocation:withSuggestedVelocity:](pageCurl, "_abortManualCurlAtLocation:withSuggestedVelocity:");
LABEL_49:

      incomingAndOutgoingViewControllersForManualTransition = self->_incomingAndOutgoingViewControllersForManualTransition;
      self->_incomingAndOutgoingViewControllersForManualTransition = 0;

      goto LABEL_53;
    }
    v43 = v5;
    v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend((id)objc_opt_class(), "_incomingViewControllerKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    if (!v15)
      goto LABEL_33;
    v16 = v15;
    v17 = *(_QWORD *)v54;
LABEL_19:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v54 != v17)
        objc_enumerationMutation(v14);
      v19 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v18);
      -[NSDictionary objectForKey:](self->_incomingAndOutgoingViewControllersForManualTransition, "objectForKey:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
        goto LABEL_31;
      spineLocation = self->_spineLocation;
      if (spineLocation != 101)
      {
        if (spineLocation == 2)
          goto LABEL_30;
        if (spineLocation != 1)
          goto LABEL_28;
      }
      if ((objc_msgSend(v19, "isEqual:", CFSTR("UIPageCurlControllerIncomingRightViewControllerKey")) & 1) == 0)
      {
        spineLocation = self->_spineLocation;
LABEL_28:
        if (spineLocation != 3
          || !objc_msgSend(v19, "isEqual:", CFSTR("UIPageCurlControllerIncomingLeftViewControllerKey")))
        {
          goto LABEL_31;
        }
      }
LABEL_30:
      objc_msgSend(v44, "addObject:", v20);
LABEL_31:

      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
        if (!v16)
        {
LABEL_33:

          v22 = v44;
          -[UIPageViewController _setViewControllers:](self, "_setViewControllers:", v44);
          v23 = self->_pageCurl;
          v24 = self->_panGestureRecognizer;
          -[UIViewController view](self, "view");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPanGestureRecognizer locationInView:](v24, "locationInView:", v25);
          -[_UIPageCurl _completeManualCurlAtLocation:withSuggestedVelocity:](v23, "_completeManualCurlAtLocation:withSuggestedVelocity:");

          v5 = v43;
          goto LABEL_49;
        }
        goto LABEL_19;
      }
    }
  }
  if (-[_UIPageCurl _isManualPageCurlInProgressAndUncommitted](self->_pageCurl, "_isManualPageCurlInProgressAndUncommitted"))
  {
    v11 = self->_pageCurl;
    v12 = self->_panGestureRecognizer;
    -[UIViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanGestureRecognizer locationInView:](v12, "locationInView:", v13);
    -[_UIPageCurl _updateManualCurlToLocation:](v11, "_updateManualCurlToLocation:");

    goto LABEL_53;
  }
  v57 = 0;
  if (-[UIPageViewController _shouldBeginNavigationInDirection:inResponseToPanGestureRecognizer:](self, "_shouldBeginNavigationInDirection:inResponseToPanGestureRecognizer:", &v57, self->_panGestureRecognizer))
  {
    if (-[_UIPageCurl _isPreviousCurlCompatibleWithCurlOfType:inDirection:](self->_pageCurl, "_isPreviousCurlCompatibleWithCurlOfType:inDirection:", 0, v57))
    {
      -[UIPageViewController _incomingViewControllersForGestureDrivenCurlInDirection:](self, "_incomingViewControllersForGestureDrivenCurlInDirection:", v57);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "count");

      if (v42)
        goto LABEL_9;
    }
  }
LABEL_53:

}

- (void)_handleTapGesture:(id)a3
{
  UITapGestureRecognizer *tapGestureRecognizer;
  BOOL v4;
  void *v6;
  uint64_t v7;

  tapGestureRecognizer = self->_tapGestureRecognizer;
  if (tapGestureRecognizer)
    v4 = tapGestureRecognizer == a3;
  else
    v4 = 0;
  if (v4 && objc_msgSend(a3, "state") == 3)
  {
    v7 = 0;
    if (-[UIPageViewController _shouldNavigateInDirection:inResponseToTapGestureRecognizer:](self, "_shouldNavigateInDirection:inResponseToTapGestureRecognizer:", &v7, self->_tapGestureRecognizer))
    {
      -[UIPageViewController _incomingViewControllersForGestureDrivenCurlInDirection:](self, "_incomingViewControllersForGestureDrivenCurlInDirection:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPageViewController _setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:](self, "_setViewControllers:withCurlOfType:fromLocation:direction:animated:notifyDelegate:completion:", v6, 1, v7, 1, 1, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

    }
  }
}

- (void)_handlePagingInDirection:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id WeakRetained;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v5 = a4;
  v8 = a5;
  -[UIPageViewController _scrollView](self, "_scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isTracking"))
  {
LABEL_8:

    goto LABEL_9;
  }
  -[UIPageViewController _scrollView](self, "_scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isDecelerating");

  if ((v11 & 1) == 0)
  {
    -[NSArray _ui_onlyObject](self->_viewControllers, "_ui_onlyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageViewController _viewControllerBefore:viewController:](self, "_viewControllerBefore:viewController:", a3 == 1, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((*(_WORD *)&self->_delegateFlags & 1) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "pageViewController:willTransitionToViewControllers:", self, v13);

      }
      objc_initWeak(&location, self);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __69__UIPageViewController__handlePagingInDirection_animated_completion___block_invoke;
      v15[3] = &unk_1E16C0E60;
      objc_copyWeak(&v18, &location);
      v16 = v9;
      v17 = v8;
      -[UIPageViewController _setViewControllers:withScrollInDirection:animated:completion:](self, "_setViewControllers:withScrollInDirection:animated:completion:", v13, a3, v5, v15);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);

    }
    goto LABEL_8;
  }
LABEL_9:

}

void __69__UIPageViewController__handlePagingInDirection_animated_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *WeakRetained;
  id *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id *v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  v11 = WeakRetained;
  if (WeakRetained && ((_WORD)WeakRetained[155] & 2) != 0)
  {
    v8 = objc_loadWeakRetained(WeakRetained + 121);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *(_QWORD *)(a1 + 32), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pageViewController:didFinishAnimating:previousViewControllers:transitionCompleted:", v11, a2, v9, a3);

    v7 = v11;
  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, a2, a3);
    v7 = v11;
  }

}

- (void)_updatePageControlViaDataSourceIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if (-[UIPageViewController _isPageControlVisible](self, "_isPageControlVisible"))
  {
    -[UIPageViewController _pageControl](self, "_pageControl");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "numberOfPages");

    -[UIPageViewController _pageControl](self, "_pageControl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "currentPage");

    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v8 = objc_msgSend(WeakRetained, "presentationCountForPageViewController:", self);
    v9 = objc_msgSend(WeakRetained, "presentationIndexForPageViewController:", self);
    v10 = v9;
    if (v4 == v8)
    {
      if (v9 < 0 || v6 == v9 || v4 < 1 || v9 >= v4)
        goto LABEL_12;
    }
    else if (v8 < 1 || v9 < 0 || v9 >= v8)
    {
      goto LABEL_12;
    }
    -[UIPageViewController _pageControl](self, "_pageControl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNumberOfPages:", v8);

    -[UIPageViewController _pageControl](self, "_pageControl");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCurrentPage:", v10);

LABEL_12:
  }
  self->_pageControlRequiresValidation = 0;
}

- (void)queuingScrollView:(id)a3 willManuallyScroll:(BOOL)a4 toRevealView:(id)a5 concealView:(id)a6 animated:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL4 v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  NSHashTable *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v7 = a7;
  v9 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageViewController.m"), 1966, CFSTR("No view controller managing revealed view %@"), v12);

  }
  if (!-[NSHashTable containsObject:](self->_cachedViewControllersForScroll, "containsObject:", v14))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageViewController.m"), 1967, CFSTR("Unexpected view controller: %@"), v14);

  }
  +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && !-[NSHashTable containsObject:](self->_cachedViewControllersForScroll, "containsObject:", v15))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = v12;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageViewController.m"), 1969, CFSTR("Unexpected view controller: %@"), v15);

    v12 = v27;
    if (!v9)
      goto LABEL_11;
  }
  else if (!v9)
  {
    goto LABEL_11;
  }
  if (v14 && (*(_WORD *)&self->_delegateFlags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "pageViewController:willTransitionToViewControllers:", self, v17);

  }
LABEL_11:
  if (((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 <= 1)
  {
    v29 = v15;
    v30 = v12;
    -[UIPageViewController _child:beginAppearanceTransitionIfPossible:animated:](self, "_child:beginAppearanceTransitionIfPossible:animated:", v14, 1, v7);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v18 = self->_cachedViewControllersForScroll;
    v19 = -[NSHashTable countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (v23 != v14)
          {
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "isViewLoaded")
              || (objc_msgSend(v23, "view"), v24 = (id)objc_claimAutoreleasedReturnValue(),
                                             v24,
                                             v24 == v13))
            {
              -[UIPageViewController _child:beginAppearanceTransitionIfPossible:animated:](self, "_child:beginAppearanceTransitionIfPossible:animated:", v23, 0, v7);
            }
            else
            {
              -[UIPageViewController _child:endAppearanceTransitionIfPossible:](self, "_child:endAppearanceTransitionIfPossible:", v23, 0);
            }
          }
        }
        v20 = -[NSHashTable countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v20);
    }

    v15 = v29;
    v12 = v30;
  }

}

- (void)queuingScrollView:(id)a3 didCommitManualScroll:(BOOL)a4 toRevealView:(id)a5 concealView:(id)a6 direction:(int64_t)a7 animated:(BOOL)a8 canComplete:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL4 v11;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *viewControllers;
  void *v19;
  id v20;
  void *v21;
  NSHashTable *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  _BOOL4 v43;
  void *v44;
  void *v45;
  id v46;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v9 = a8;
  v11 = a4;
  v54 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a6;
  -[NSArray _ui_onlyObject](self->_viewControllers, "_ui_onlyObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageViewController.m"), 1991, CFSTR("No view controller managing revealed view %@"), v13);

  }
  if (v11 && a9)
  {
    v17 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v16, 0);
    viewControllers = self->_viewControllers;
    self->_viewControllers = v17;

  }
  +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21 = v20;
  v43 = v11;
  if (v11 && v19)
    objc_msgSend(v20, "setObject:forKey:", v19, CFSTR("UIPageCurlControllerOutgoingLeftViewControllerKey"));
  v48 = v21;
  objc_storeStrong((id *)&self->_incomingAndOutgoingViewControllersForManualTransition, v21);
  if (!dyld_program_sdk_at_least() || ((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 <= 1)
  {
    v44 = v19;
    v45 = v15;
    v46 = v13;
    -[UIPageViewController _child:beginAppearanceTransitionIfPossible:animated:](self, "_child:beginAppearanceTransitionIfPossible:animated:", v16, 1, v9);
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v22 = self->_cachedViewControllersForScroll;
    v23 = -[NSHashTable countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v50 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          if (v27 != v16)
          {
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "isViewLoaded")
              || (objc_msgSend(v27, "view"), v28 = (id)objc_claimAutoreleasedReturnValue(),
                                             v28,
                                             v28 == v14))
            {
              -[UIPageViewController _child:beginAppearanceTransitionIfPossible:animated:](self, "_child:beginAppearanceTransitionIfPossible:animated:", v27, 0, v9);
            }
            else
            {
              -[UIPageViewController _child:endAppearanceTransitionIfPossible:](self, "_child:endAppearanceTransitionIfPossible:", v27, 0);
            }
          }
        }
        v24 = -[NSHashTable countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v24);
    }

    v15 = v45;
    v13 = v46;
    v19 = v44;
  }
  -[UIPageViewController _pageControl](self, "_pageControl");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "numberOfPages");

  v31 = v48;
  if (a9 && -[UIPageViewController _isPageControlVisible](self, "_isPageControlVisible") && v30)
  {
    if (self->_pageControlRequiresValidation)
    {
      -[UIPageViewController _updatePageControlViaDataSourceIfNecessary](self, "_updatePageControlViaDataSourceIfNecessary");
    }
    else if (v43 && v15 != v16)
    {
      v32 = v19;
      if (-[UIPageViewController _shouldFlipInRightToLeft](self, "_shouldFlipInRightToLeft"))
        v33 = a7 == 0;
      else
        v33 = a7;
      -[UIPageViewController _pageControl](self, "_pageControl");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "currentPage");
      v36 = v35 - 1;
      if (!v33)
        v36 = v35 + 1;
      v37 = v36 % v30;

      v38 = (v30 & (v37 >> 63)) + v37;
      v19 = v32;
      -[UIPageViewController _pageControl](self, "_pageControl");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v38;
      v31 = v48;
      objc_msgSend(v39, "setCurrentPage:", v40);

    }
  }

}

- (void)queuingScrollView:(id)a3 didEndManualScroll:(BOOL)a4 toRevealView:(id)a5 direction:(int64_t)a6 animated:(BOOL)a7 didFinish:(BOOL)a8 didComplete:(BOOL)a9
{
  _BOOL4 v9;
  _BOOL8 v10;
  _BOOL4 v12;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSHashTable *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  id WeakRetained;
  void *v27;
  NSDictionary *incomingAndOutgoingViewControllersForManualTransition;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v9 = a8;
  v10 = a7;
  v12 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  if (!v12 || a9)
  {
    +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSDictionary objectForKey:](self->_incomingAndOutgoingViewControllersForManualTransition, "objectForKey:", CFSTR("UIPageCurlControllerOutgoingLeftViewControllerKey"));
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageViewController.m"), 2045, CFSTR("No view controller managing visible view %@"), v16);

  }
  v32 = v16;
  v33 = v15;
  if (!dyld_program_sdk_at_least()
    || self && ((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 <= 1)
  {
    -[UIPageViewController _child:beginAppearanceTransitionIfPossible:animated:](self, "_child:beginAppearanceTransitionIfPossible:animated:", v18, 1, v10);
    if (v9)
      -[UIPageViewController _child:endAppearanceTransitionIfPossible:](self, "_child:endAppearanceTransitionIfPossible:", v18, 1);
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v19 = self->_cachedViewControllersForScroll;
  v20 = -[NSHashTable countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (v24 != v18)
        {
          -[UIPageViewController _child:beginAppearanceTransitionIfPossible:animated:](self, "_child:beginAppearanceTransitionIfPossible:animated:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i), 0, v10);
          if (v9)
            -[UIPageViewController _child:endAppearanceTransitionIfPossible:](self, "_child:endAppearanceTransitionIfPossible:", v24, 0);
        }
      }
      v21 = -[NSHashTable countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v21);
  }

  if (v12 && (*(_WORD *)&self->_delegateFlags & 2) != 0)
  {
    -[NSDictionary objectForKey:](self->_incomingAndOutgoingViewControllersForManualTransition, "objectForKey:", CFSTR("UIPageCurlControllerOutgoingLeftViewControllerKey"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v25, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "pageViewController:didFinishAnimating:previousViewControllers:transitionCompleted:", self, v10, v27, a9);

    incomingAndOutgoingViewControllersForManualTransition = self->_incomingAndOutgoingViewControllersForManualTransition;
    self->_incomingAndOutgoingViewControllersForManualTransition = 0;

  }
  if (-[UIPageViewController _isPageControlVisible](self, "_isPageControlVisible"))
  {
    -[UIPageViewController _pageControl](self, "_pageControl");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v29, "numberOfPages") || v12 || a9)
    {

    }
    else
    {
      v30 = objc_msgSend(v33, "isManualScrollInProgress");

      if (v30)
        self->_pageControlRequiresValidation = 1;
    }
  }

}

- (void)queuingScrollView:(id)a3 didBailoutOfScrollAndRevealedView:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *viewControllers;
  void *v11;
  id v12;

  v12 = a4;
  +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageViewController.m"), 2074, CFSTR("No view controller managing visible view %@"), v12);

  }
  -[UIPageViewController _viewControllers](self, "_viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_ui_onlyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
  {
    v9 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v6, 0);
    viewControllers = self->_viewControllers;
    self->_viewControllers = v9;

  }
  -[UIPageViewController _updatePageControlViaDataSourceIfNecessary](self, "_updatePageControlViaDataSourceIfNecessary");

}

- (void)queuingScrollViewDidFinishScrolling:(id)a3
{
  id WeakRetained;

  if ((*(_WORD *)&self->_delegateFlags & 4) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "_pageViewControllerDidFinishTransitions:", self);

  }
}

- (id)_queuingScrollView:(id)a3 viewBefore:(BOOL)a4 view:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  __CFString *v10;
  int v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if ((objc_msgSend(v8, "isTracking") & 1) != 0 || objc_msgSend(v8, "isManualScrollInProgress"))
  {
    v10 = 0;
    v11 = 1;
  }
  else
  {
    v11 = 0;
    v10 = CFSTR("kUIFaultingViewSentinel");
  }
  v12 = v10;
  +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIPageViewController _shouldFlipInRightToLeft](self, "_shouldFlipInRightToLeft"))
  {
    if (!v11)
      goto LABEL_11;
    v6 = v6 ^ 1;
  }
  else if ((v11 & 1) == 0)
  {
    goto LABEL_11;
  }
  -[UIPageViewController _viewControllerBefore:viewController:](self, "_viewControllerBefore:viewController:", v6, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[UIPageViewController _cacheViewControllerForScroll:](self, "_cacheViewControllerForScroll:", v14);
    objc_msgSend(v15, "view");
    v16 = objc_claimAutoreleasedReturnValue();

    v12 = (__CFString *)v16;
  }
LABEL_11:

  return v12;
}

- (id)queuingScrollView:(id)a3 viewBeforeView:(id)a4
{
  return -[UIPageViewController _queuingScrollView:viewBefore:view:](self, "_queuingScrollView:viewBefore:view:", a3, 1, a4);
}

- (id)queuingScrollView:(id)a3 viewAfterView:(id)a4
{
  return -[UIPageViewController _queuingScrollView:viewBefore:view:](self, "_queuingScrollView:viewBefore:view:", a3, 0, a4);
}

- (void)_flushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v7 = a3;
  v11 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageViewController.m"), 2116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewController"));

    v7 = 0;
  }
  if (!-[NSHashTable containsObject:](self->_cachedViewControllersForScroll, "containsObject:", v7))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageViewController.m"), 2117, CFSTR("Don't know about flushed view %@"), v10);

  }
  -[UIPageViewController _child:beginAppearanceTransitionIfPossible:animated:](self, "_child:beginAppearanceTransitionIfPossible:animated:", v11, 0, v4);
  -[UIPageViewController _child:endAppearanceTransitionIfPossible:](self, "_child:endAppearanceTransitionIfPossible:", v11, v4);
  objc_msgSend(v11, "willMoveToParentViewController:", 0);
  -[UIViewController removeChildViewController:](self, "removeChildViewController:", v11);
  -[NSHashTable removeObject:](self->_cachedViewControllersForScroll, "removeObject:", v11);

}

- (void)queuingScrollView:(id)a3 didFlushView:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a5;
  +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[UIPageViewController viewControllers](self, "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v9);

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      -[UIPageViewController _flushViewController:animated:](self, "_flushViewController:animated:", v9, v5);
  }

}

- (void)queuingScrollView:(id)a3 attemptToPageInDirection:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;

  -[UIPageViewController _pageControl](self, "_pageControl", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "currentPage");
  if (a4)
    v7 = v6 - 1;
  else
    v7 = v6 + 1;
  objc_msgSend(v8, "setCurrentPage:", v7);
  -[UIPageViewController _handlePagingInDirection:animated:completion:](self, "_handlePagingInDirection:animated:completion:", a4, 1, 0);

}

- (BOOL)queuingScrollViewShouldLayoutSubviews:(id)a3
{
  return !self->_interfaceRotating;
}

- (void)_pageControlValueChanged:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  -[UIPageViewController _scrollView](self, "_scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isTracking"))
  {
    -[UIPageViewController _scrollView](self, "_scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isDecelerating");

    if ((v6 & 1) != 0)
      goto LABEL_17;
    v7 = objc_msgSend(v11, "currentPage");
    v8 = objc_msgSend(v11, "previousPage");
    v9 = objc_msgSend(v11, "interactionState");
    if (-[UIPageViewController _shouldFlipInRightToLeft](self, "_shouldFlipInRightToLeft"))
    {
      if (v7 < v8)
        v10 = 0;
      else
        v10 = -1;
      if (v7 > v8)
      {
        v10 = 1;
LABEL_16:
        -[UIPageViewController _handlePagingInDirection:animated:completion:](self, "_handlePagingInDirection:animated:completion:", v10, v9 == 1, 0);
        goto LABEL_17;
      }
    }
    else
    {
      if (v7 < v8)
        v10 = 1;
      else
        v10 = -1;
      if (v7 > v8)
      {
        v10 = 0;
        goto LABEL_16;
      }
    }
    if (v10 == -1)
    {
      -[UIPageViewController _updatePageControlViaDataSourceIfNecessary](self, "_updatePageControlViaDataSourceIfNecessary");
      goto LABEL_17;
    }
    goto LABEL_16;
  }

LABEL_17:
}

- (NSArray)_viewControllers
{
  return self->_viewControllers;
}

- (void)_setViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllers, a3);
}

- (NSArray)_viewControllersStashedForRotation
{
  return self->_viewControllersStashedForRotation;
}

- (void)_setViewControllersStashedForRotation:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllersStashedForRotation, a3);
}

- (BOOL)_isInterfaceRotating
{
  return self->_interfaceRotating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingAndOutgoingViewControllersForManualTransition, 0);
  objc_storeStrong((id *)&self->_cachedViewControllersForScroll, 0);
  objc_storeStrong((id *)&self->_cachedViewControllersForCurl, 0);
  objc_storeStrong((id *)&self->_rotationSnapshotViews, 0);
  objc_storeStrong((id *)&self->_viewControllersStashedForRotation, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pageCurl, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

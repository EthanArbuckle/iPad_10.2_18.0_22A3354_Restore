@implementation SXStripGalleryComponentView

- (SXStripGalleryComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 mediaSharingPolicyProvider:(id)a9 imageViewFactory:(id)a10 canvasControllerFactory:(id)a11
{
  SXStripGalleryComponentView *v18;
  SXStripGalleryComponentView *v19;
  SXItemizedScrollView *v20;
  SXItemizedScrollView *itemizedScrollView;
  void *v22;
  uint64_t v23;
  NSMutableSet *exposedGalleryItems;
  id v26;
  id v27;
  objc_super v28;

  v27 = a10;
  v26 = a11;
  v28.receiver = self;
  v28.super_class = (Class)SXStripGalleryComponentView;
  v18 = -[SXGalleryComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:analyticsReporting:appStateMonitor:mediaSharingPolicyProvider:](&v28, sel_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor_mediaSharingPolicyProvider_, a3, a4, a5, a6, a7, a8, a9);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_imageViewFactory, a10);
    objc_storeStrong((id *)&v19->_canvasControllerFactory, a11);
    v19->_lastPreloadViewIndex = 0x7FFFFFFFFFFFFFFFLL;
    v19->_visibleImageViewIndex = 0x7FFFFFFFFFFFFFFFLL;
    v20 = objc_alloc_init(SXItemizedScrollView);
    itemizedScrollView = v19->_itemizedScrollView;
    v19->_itemizedScrollView = v20;

    -[SXItemizedScrollView setDataSource:](v19->_itemizedScrollView, "setDataSource:", v19);
    -[SXItemizedScrollView setDelegate:](v19->_itemizedScrollView, "setDelegate:", v19);
    -[SXItemizedScrollView setPagingEnabled:](v19->_itemizedScrollView, "setPagingEnabled:", 0);
    -[SXComponentView contentView](v19, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v19->_itemizedScrollView);

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v23 = objc_claimAutoreleasedReturnValue();
    exposedGalleryItems = v19->_exposedGalleryItems;
    v19->_exposedGalleryItems = (NSMutableSet *)v23;

  }
  return v19;
}

- (void)loadComponent:(id)a3
{
  void *v4;
  SXFullscreenCanvasController *v5;
  SXFullscreenCanvasController *fullScreenCanvasController;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  NSArray *imageResources;
  NSMutableArray *imageViews;
  NSMutableArray *v23;
  NSArray *v24;
  NSArray *accessibilityCaptions;
  void *v26;
  NSMutableArray *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)SXStripGalleryComponentView;
  -[SXComponentView loadComponent:](&v33, sel_loadComponent_, a3);
  if (!self->_imageResources)
  {
    -[SXStripGalleryComponentView canvasControllerFactory](self, "canvasControllerFactory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fullscreenCanvasControllerForShowable:", self);
    v5 = (SXFullscreenCanvasController *)objc_claimAutoreleasedReturnValue();
    fullScreenCanvasController = self->_fullScreenCanvasController;
    self->_fullScreenCanvasController = v5;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v27 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[SXComponentView component](self, "component");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "imageIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "imageResourceForIdentifier:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v26, "addObject:", v16);
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](v27, "addObject:", v17);

            objc_msgSend(v13, "accessibilityCaption");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              objc_msgSend(v28, "addObject:", v18);
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDBCEF8], "null");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "addObject:", v19);

            }
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v10);
    }

    v20 = (NSArray *)objc_msgSend(v26, "copy");
    imageResources = self->_imageResources;
    self->_imageResources = v20;

    imageViews = self->_imageViews;
    self->_imageViews = v27;
    v23 = v27;

    v24 = (NSArray *)objc_msgSend(v28, "copy");
    accessibilityCaptions = self->_accessibilityCaptions;
    self->_accessibilityCaptions = v24;

  }
}

- (void)receivedInfo:(id)a3 fromLayoutingPhaseWithIdentifier:(id)a4
{
  id v6;
  id v7;
  int *v8;
  float v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SXStripGalleryComponentView;
  -[SXComponentView receivedInfo:fromLayoutingPhaseWithIdentifier:](&v10, sel_receivedInfo_fromLayoutingPhaseWithIdentifier_, v6, v7);
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ContentWidth")) & 1) != 0)
  {
    v8 = &OBJC_IVAR___SXStripGalleryComponentView__contentWidth;
LABEL_7:
    objc_msgSend(v6, "floatValue");
    *(double *)((char *)&self->super.super.super.super.super.super.isa + *v8) = v9;
    goto LABEL_8;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("leftOffset")) & 1) != 0)
  {
    v8 = &OBJC_IVAR___SXStripGalleryComponentView__xOffset;
    goto LABEL_7;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("rightOffset")))
  {
    v8 = &OBJC_IVAR___SXStripGalleryComponentView__rightContentInset;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)presentComponentWithChanges:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double Width;
  double v27;
  void *v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;

  v29.receiver = self;
  v29.super_class = (Class)SXStripGalleryComponentView;
  -[SXComponentView presentComponentWithChanges:](&v29, sel_presentComponentWithChanges_, *(_QWORD *)&a3.var0 & 0xFFFFFFLL);
  -[SXStripGalleryComponentView xOffset](self, "xOffset");
  v5 = v4;
  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXStripGalleryComponentView rightContentInset](self, "rightContentInset");
  objc_msgSend(v6, "setContentInset:", 0.0, v5, 0.0, v7);

  -[SXComponentView contentFrame](self, "contentFrame");
  v9 = v8;
  -[SXStripGalleryComponentView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", 0.0, v9, v11, v13);

  if (-[SXStripGalleryComponentView visibleImageViewIndex](self, "visibleImageViewIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActiveViewIndex:animated:", -[SXStripGalleryComponentView visibleImageViewIndex](self, "visibleImageViewIndex"), 0);

  }
  -[SXStripGalleryComponentView fullScreenCanvasController](self, "fullScreenCanvasController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isFullscreen");

  if ((v17 & 1) == 0)
  {
    -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentSize");
    v20 = v19;
    -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contentSize");
    v23 = v22;
    -[SXStripGalleryComponentView fullscreenGestureView](self, "fullscreenGestureView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFrame:", 0.0, 0.0, v20, v23);

  }
  -[SXComponentView viewport](self, "viewport");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "dynamicBounds");
  Width = CGRectGetWidth(v30);
  -[SXStripGalleryComponentView bounds](self, "bounds");
  v27 = CGRectGetWidth(v31);

  if (Width == v27)
  {
    -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setClipsToBounds:", 0);

  }
}

- (void)discardContents
{
  void *v3;
  uint64_t v4;
  unint64_t i;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SXStripGalleryComponentView;
  -[SXComponentView discardContents](&v14, sel_discardContents);
  -[SXStripGalleryComponentView imageViews](self, "imageViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      -[SXStripGalleryComponentView imageViews](self, "imageViews");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "visibleRange");
      v11 = v10;

      if (i < v9 || i - v9 >= v11)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v7, "objectHasQualityInterest:quality:", self, 0))
            objc_msgSend(v7, "giveUpInterestForObject:", self);
          objc_msgSend(v7, "setImage:", 0);
          -[SXStripGalleryComponentView imageViews](self, "imageViews");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "replaceObjectAtIndex:withObject:", i, v13);

        }
      }

    }
  }
  -[SXStripGalleryComponentView setLastPreloadViewIndex:](self, "setLastPreloadViewIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

- (id)createViewForViewIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;

  -[SXStripGalleryComponentView imageResources](self, "imageResources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXStripGalleryComponentView imageViewFactory](self, "imageViewFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageViewForResource:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDelegate:", self);
  -[SXStripGalleryComponentView accessibilityCaptions](self, "accessibilityCaptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 != v11)
    objc_msgSend(v8, "setAccessibilityLabel:", v10);
  -[SXStripGalleryComponentView imageViews](self, "imageViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "replaceObjectAtIndex:withObject:", a3, v8);

  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXStripGalleryComponentView itemizedScrollView:frameForViewAtIndex:](self, "itemizedScrollView:frameForViewAtIndex:", v13, a3);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  objc_msgSend(v8, "setFrame:", v15, v17, v19, v21);
  objc_msgSend(v8, "setPreferredImageSize:", v19, v21);
  objc_msgSend(v8, "addInterestInImageQuality:forObject:", 0, self);
  -[SXGalleryComponentView dragManager](self, "dragManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "updateAccessibilityDragSourceDescriptorsForDraggableElement:", v8);

  return v8;
}

- (unint64_t)numberOfViewsInItemizedScrollView:(id)a3
{
  void *v3;
  unint64_t v4;

  -[SXStripGalleryComponentView imageViews](self, "imageViews", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (CGRect)itemizedScrollView:(id)a3 frameForViewAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  CGRect result;

  -[SXStripGalleryComponentView imageResources](self, "imageResources", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXComponentView contentFrame](self, "contentFrame");
  v9 = v8;
  objc_msgSend(v7, "widthForImageHeight:", v8);
  v19.size.width = v10;
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.height = v9;
  v20 = CGRectIntegral(v19);
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;

  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)itemizedScrollView:(id)a3 viewAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;

  -[SXStripGalleryComponentView imageViews](self, "imageViews", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SXStripGalleryComponentView createViewForViewIndex:](self, "createViewForViewIndex:", a4);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  -[SXStripGalleryComponentView preloadAdjacentViewsForIndex:](self, "preloadAdjacentViewsForIndex:", a4);
  return v7;
}

- (double)gutterBetweenItemsInNotPagingItemizedScrollView:(id)a3
{
  return 5.0;
}

- (void)itemizedScrollView:(id)a3 didChangeToActiveViewIndex:(unint64_t)a4
{
  self->_visibleImageViewIndex = a4;
}

- (void)itemizedScrollView:(id)a3 didShowViewWithIndex:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  id v13;

  -[SXStripGalleryComponentView fullscreenGestureView](self, "fullscreenGestureView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXStripGalleryComponentView fullscreenGestureView](self, "fullscreenGestureView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bringSubviewToFront:", v7);

  -[SXStripGalleryComponentView fullscreenGestureView](self, "fullscreenGestureView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentSize");
  v10 = v9;
  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentSize");
  objc_msgSend(v13, "setFrame:", 0.0, 0.0, v10, v12);

}

- (BOOL)itemizedScrollView:(id)a3 isAllowedToAddViewInHierarchy:(unint64_t)a4
{
  void *v5;

  -[SXStripGalleryComponentView fullScreenCanvasController](self, "fullScreenCanvasController", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v5, "activeViewIndex") != a4;

  return a4;
}

- (BOOL)itemizedScrollViewWillReindex:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[SXStripGalleryComponentView fullScreenCanvasController](self, "fullScreenCanvasController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isFullscreen"))
  {
    -[SXStripGalleryComponentView fullScreenCanvasController](self, "fullScreenCanvasController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isTransitioning");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)scrollViewDidScroll:(id)a3
{
  -[SXStripGalleryComponentView preloadAdjacentViewsForIndex:](self, "preloadAdjacentViewsForIndex:", -[SXStripGalleryComponentView visibleImageViewIndex](self, "visibleImageViewIndex", a3));
  -[SXStripGalleryComponentView trackExposedGalleryItems](self, "trackExposedGalleryItems");
}

- (CGRect)transitionVisibleFrame
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SXStripGalleryComponentView xOffset](self, "xOffset");
  v4 = v3;
  -[SXStripGalleryComponentView targetGalleryItem](self, "targetGalleryItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  -[SXStripGalleryComponentView targetGalleryItem](self, "targetGalleryItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;

  v11 = 0.0;
  v12 = v4;
  v13 = v7;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v11;
  result.origin.x = v12;
  return result;
}

- (CGRect)transitionContentFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[SXStripGalleryComponentView xOffset](self, "xOffset");
  v4 = v3;
  -[SXComponentView contentFrame](self, "contentFrame");
  v6 = v5;
  -[SXStripGalleryComponentView targetGalleryItem](self, "targetGalleryItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  -[SXStripGalleryComponentView targetGalleryItem](self, "targetGalleryItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;

  v13 = v4;
  v14 = v6;
  v15 = v9;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)usesThumbnailWithImageIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[SXStripGalleryComponentView targetGalleryItem](self, "targetGalleryItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageResource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqualToString:", v7);

  return v8;
}

- (unint64_t)analyticsMediaType
{
  return 1;
}

- (unint64_t)analyticsGalleryType
{
  return 1;
}

- (id)visibleGalleryItemViewForImageIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  BOOL v28;
  SXStripGalleryComponentView *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;
  CGRect v38;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v30 = self;
  -[SXStripGalleryComponentView imageViews](self, "imageViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          objc_msgSend(v11, "imageResource");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "imageIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v4);

          if (v14)
          {
            -[SXStripGalleryComponentView itemizedScrollView](v30, "itemizedScrollView");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "bounds");
            v17 = v16;
            v19 = v18;
            v21 = v20;
            v23 = v22;
            objc_msgSend(v11, "frame");
            v38.origin.x = v24;
            v38.origin.y = v25;
            v38.size.width = v26;
            v38.size.height = v27;
            v37.origin.x = v17;
            v37.origin.y = v19;
            v37.size.width = v21;
            v37.size.height = v23;
            v28 = CGRectContainsRect(v37, v38);

            if (v28)
            {
              -[SXStripGalleryComponentView setTargetGalleryItem:](v30, "setTargetGalleryItem:", v11);
              goto LABEL_14;
            }
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_14:

  return v11;
}

- (void)willSubmitMediaExposureEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SXStripGalleryComponentView;
  v4 = a3;
  -[SXMediaComponentView willSubmitMediaExposureEvent:](&v9, sel_willSubmitMediaExposureEvent_, v4);
  -[SXComponentView component](self, "component", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfImages:", objc_msgSend(v6, "count"));

  -[SXStripGalleryComponentView exposedGalleryItems](self, "exposedGalleryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfImagesExposed:", objc_msgSend(v7, "count"));

  -[SXStripGalleryComponentView exposedGalleryItems](self, "exposedGalleryItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (void)imageView:(id)a3 didLoadImage:(id)a4 ofQuality:(int)a5
{
  -[SXMediaComponentView setIsDisplayingMedia:](self, "setIsDisplayingMedia:", 1, a4, *(_QWORD *)&a5);
}

- (void)imageView:(id)a3 didLoadAnimatedImage:(id)a4
{
  -[SXMediaComponentView setIsDisplayingMedia:](self, "setIsDisplayingMedia:", 1, a4);
}

- (BOOL)requestInteractivityFocusForFullScreenCanvasController:(id)a3
{
  SXStripGalleryComponentView *v3;
  void *v4;

  v3 = self;
  -[SXComponentView presentationDelegate](self, "presentationDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "allowInteractivityFocusForComponent:", v3);

  return (char)v3;
}

- (id)fullScreenCanvasController:(id)a3 canvasViewControllerForShowable:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a3;
  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestFullScreenCanvasViewControllerForComponent:canvasController:withCompletionBlock:", self, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)fullScreenCanvasController:(id)a3 shouldAddGestureView:(id)a4 forShowable:(id)a5
{
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  id v12;

  v12 = a4;
  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentSize");
  v8 = v7;
  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentSize");
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, v8, v10);

  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  -[SXStripGalleryComponentView setFullscreenGestureView:](self, "setFullscreenGestureView:", v12);
}

- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 shouldTransferToOriginalViewWithIndex:(unint64_t)a5
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  -[SXStripGalleryComponentView imageViews](self, "imageViews", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a5);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frameForViewAtIndex:", a5);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);
  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v18);

}

- (unint64_t)fullScreenCanvasController:(id)a3 numberOfViewsForShowable:(id)a4
{
  void *v4;
  unint64_t v5;

  -[SXStripGalleryComponentView imageViews](self, "imageViews", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)fullScreenCanvasController:(id)a3 originalViewForShowable:(id)a4 viewIndex:(unint64_t)a5
{
  void *v7;
  void *v8;

  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXStripGalleryComponentView itemizedScrollView:viewAtIndex:](self, "itemizedScrollView:viewAtIndex:", v7, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGRect)fullScreenCanvasController:(id)a3 originalFrameForShowable:(id)a4 onCanvasView:(id)a5 viewIndex:(unint64_t)a6
{
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
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
  double v30;
  CGRect result;

  v8 = a5;
  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frameForViewAtIndex:", a6);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "convertRect:toView:", v8, v11, v13, v15, v17);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v27 = v20;
  v28 = v22;
  v29 = v24;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (CGRect)fullScreenCanvasController:(id)a3 fullScreenFrameForShowable:(id)a4 viewIndex:(unint64_t)a5 withinRect:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat rect;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect result;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  rect = a6.origin.x;
  v12 = a3;
  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXStripGalleryComponentView itemizedScrollView:frameForViewAtIndex:](self, "itemizedScrollView:frameForViewAtIndex:", v13, a5);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  objc_msgSend(v12, "fitSizeForRect:", v15, v17, v19, v21);
  v23 = v22;
  v25 = v24;

  v37.origin.x = x;
  v37.origin.y = y;
  v26 = y;
  v37.size.width = width;
  v27 = width;
  v37.size.height = height;
  v28 = height;
  v29 = CGRectGetHeight(v37);
  v38.origin.x = v15;
  v38.origin.y = v17;
  v38.size.width = v23;
  v38.size.height = v25;
  v30 = (v29 - CGRectGetHeight(v38)) * 0.5;
  v39.origin.x = rect;
  v39.origin.y = v26;
  v39.size.width = v27;
  v39.size.height = v28;
  v31 = CGRectGetWidth(v39);
  v40.origin.x = v15;
  v40.origin.y = v30;
  v40.size.width = v23;
  v40.size.height = v25;
  v32 = (v31 - CGRectGetWidth(v40)) * 0.5;
  v33 = v30;
  v34 = v23;
  v35 = v25;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (unint64_t)fullScreenCanvasController:(id)a3 viewIndexForPoint:(CGPoint)a4 inShowable:(id)a5
{
  CGFloat y;
  CGFloat x;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  unint64_t v21;
  CGPoint v23;
  CGRect v24;

  y = a4.y;
  x = a4.x;
  -[SXStripGalleryComponentView imageViews](self, "imageViews", a3, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
    return 0x7FFFFFFFFFFFFFFFLL;
  v10 = 0;
  while (1)
  {
    -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frameForViewAtIndex:", v10);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v24.origin.x = v13;
    v24.origin.y = v15;
    v24.size.width = v17;
    v24.size.height = v19;
    v23.x = x;
    v23.y = y;
    if (CGRectContainsPoint(v24, v23))
      break;
    ++v10;
    -[SXStripGalleryComponentView imageViews](self, "imageViews");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v10 >= v21)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v10;
}

- (id)fullScreenCanvasController:(id)a3 captionForShowable:(id)a4 viewIndex:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SXFullscreenCaption *v11;
  void *v12;
  id *v13;
  void *v14;
  SXFullscreenCaption *v15;
  id *v16;

  -[SXComponentView component](self, "component", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "captionComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = [SXFullscreenCaption alloc];
    objc_msgSend(v9, "captionComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SXFullscreenCaption initWithCaption:dataSource:]((id *)&v11->super.isa, v12, self);
  }
  else
  {
    objc_msgSend(v9, "caption");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v16 = 0;
      goto LABEL_6;
    }
    v15 = [SXFullscreenCaption alloc];
    objc_msgSend(v9, "caption");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SXFullscreenCaption initWithText:dataSource:]((id *)&v15->super.isa, v12, self);
  }
  v16 = v13;

LABEL_6:
  return v16;
}

- (BOOL)fullScreenCanvasController:(id)a3 willShowShowable:(id)a4 viewIndex:(unint64_t)a5
{
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;

  -[SXStripGalleryComponentView imageViews](self, "imageViews", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "hasLoadedImage");
  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isDecelerating");
  if ((v11 & 1) != 0)
  {
LABEL_6:
    v14 = v11 ^ 1;

    goto LABEL_7;
  }
  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isDragging");

  v14 = 0;
  if ((v13 & 1) == 0 && ((v9 ^ 1) & 1) == 0)
  {
    -[SXComponentView presentationDelegate](self, "presentationDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "addInteractivityFocusForComponent:", self);

    if (!v16)
    {
      v14 = 0;
      goto LABEL_7;
    }
    -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setScrollEnabled:", 0);

    -[SXComponentView presentationDelegate](self, "presentationDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "animationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stopUpdatingAnimationForComponentView:finishAnimation:", self, 1);

    goto LABEL_6;
  }
LABEL_7:

  return v14;
}

- (void)fullScreenCanvasController:(id)a3 willHideShowable:(id)a4 viewIndex:(unint64_t)a5
{
  void *v7;
  void *v8;
  id v9;

  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reindexate");

  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActiveViewIndex:animated:", a5, 0);

  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "forceCorrectFrames");

}

- (void)fullScreenCanvasController:(id)a3 didHideShowable:(id)a4 viewIndex:(unint64_t)a5
{
  void *v6;
  void *v7;
  void *v8;

  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScrollEnabled:", 1);

  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeInteractivityFocusForComponent:", self);

  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dismissFullscreenCanvasForComponent:", self);

  -[SXStripGalleryComponentView finishMediaViewEvent](self, "finishMediaViewEvent");
}

- (void)fullScreenCanvasController:(id)a3 didShowShowable:(id)a4 viewIndex:(unint64_t)a5
{
  void *v7;
  void *v8;
  id v9;

  -[SXComponentView component](self, "component", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[SXStripGalleryComponentView createMediaViewEventForGalleryItem:](self, "createMediaViewEventForGalleryItem:", v9);
}

- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 didShowViewWithIndex:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[SXComponentView component](self, "component", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[SXStripGalleryComponentView finishMediaViewEvent](self, "finishMediaViewEvent");
  -[SXStripGalleryComponentView createMediaViewEventForGalleryItem:](self, "createMediaViewEventForGalleryItem:", v11);
  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "animationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stopUpdatingAnimationForComponentView:finishAnimation:", self, 1);

}

- (id)fullScreenCanvasController:(id)a3 copyViewForShowable:(id)a4 viewIndex:(unint64_t)a5
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  -[SXStripGalleryComponentView imageViews](self, "imageViews", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x24BDF6AE8]);
  objc_msgSend(v7, "frame");
  v9 = (void *)objc_msgSend(v8, "initWithFrame:");
  objc_msgSend(v7, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v10);

  return v9;
}

- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 willShowViewWithIndex:(unint64_t)a5
{
  void *v7;
  void *v8;
  int v9;

  -[SXStripGalleryComponentView imageViews](self, "imageViews", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = 0;
    if (objc_msgSend(v8, "objectHasQualityInterest:quality:", self, &v9))
    {
      if (!v9)
        objc_msgSend(v8, "addInterestInImageQuality:forObject:", 1, self);
    }
  }

}

- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 didHideViewWithIndex:(unint64_t)a5
{
  void *v7;
  id v8;

  -[SXStripGalleryComponentView imageViews](self, "imageViews", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "giveUpInterestForObject:", self);
  objc_msgSend(v8, "addInterestInImageQuality:forObject:", 0, self);

}

- (BOOL)fullScreenCanvasController:(id)a3 showable:(id)a4 gestureRecognizerShouldBegin:(id)a5
{
  void *v5;
  char v6;

  -[SXComponentView presentationDelegate](self, "presentationDelegate", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isScrolling") ^ 1;

  return v6;
}

- (id)imageViewForLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  id v27;
  id v28;
  void *v29;
  unint64_t v30;
  CGPoint v32;
  CGRect v33;

  y = a3.y;
  x = a3.x;
  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "forceCorrectFrames");

  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:fromView:", self, x, y);
  v9 = v8;
  v11 = v10;

  -[SXStripGalleryComponentView imageViews](self, "imageViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v14 = 0;
    v15 = 0;
    do
    {
      -[SXStripGalleryComponentView imageViews](self, "imageViews");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndex:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "frameForViewAtIndex:", v14);
        v20 = v19;
        v22 = v21;
        v24 = v23;
        v26 = v25;

        v27 = v17;
        v33.origin.x = v20;
        v33.origin.y = v22;
        v33.size.width = v24;
        v33.size.height = v26;
        v32.x = v9;
        v32.y = v11;
        if (CGRectContainsPoint(v33, v32))
        {
          v28 = v27;

          v15 = v28;
        }

      }
      ++v14;
      -[SXStripGalleryComponentView imageViews](self, "imageViews");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");

    }
    while (v14 < v30);
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (void)forceImageViewFullscreen:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[SXStripGalleryComponentView imageViews](self, "imageViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  -[SXStripGalleryComponentView fullScreenCanvasController](self, "fullScreenCanvasController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentFullscreenWithIndex:", v6);

}

- (CGRect)snapRegion
{
  double v3;
  double v4;
  double v5;
  double v6;
  double Height;
  double v8;
  double v9;
  double v10;
  CGRect v11;
  CGRect result;

  -[SXStripGalleryComponentView xOffset](self, "xOffset");
  v4 = v3;
  -[SXStripGalleryComponentView contentWidth](self, "contentWidth");
  v6 = v5;
  -[SXComponentView contentFrame](self, "contentFrame");
  Height = CGRectGetHeight(v11);
  v8 = 0.0;
  v9 = v4;
  v10 = v6;
  result.size.height = Height;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v9;
  return result;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  unint64_t v23;
  uint64_t v24;
  double v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  double v39;
  double v40;
  double Width;
  BOOL v42;
  void *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double MinX;
  CGFloat v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  BOOL v67;
  double MaxX;
  double v69;
  CGFloat y;
  id v71;
  double v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  id v76;
  id v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;

  x = a4.x;
  v8 = a5->x;
  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView", a3, a4.x, a4.y);
  v76 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "bounds");
  v9 = v8 + CGRectGetWidth(v78);
  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentSize");
  if (v9 >= v11)
  {

    v45 = v76;
LABEL_24:

    return;
  }
  v12 = a5->x;

  if (x == 0.0 || v12 <= 0.0)
    return;
  -[SXStripGalleryComponentView snapRegion](self, "snapRegion");
  v14 = v13;
  v16 = v15;
  v75 = v18;
  v77 = v17;
  v19 = a5->x;
  -[SXStripGalleryComponentView imageViews](self, "imageViews");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  v72 = x;
  v73 = v16;
  v74 = v14;
  v22 = 0;
  if (v21)
  {
    v23 = 0;
    v24 = 0x7FFFFFFFFFFFFFFFLL;
    v25 = 1.79769313e308;
    while (1)
    {
      -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "frameForViewAtIndex:", v23);
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;

      v79.origin.x = v28;
      v79.origin.y = v30;
      v79.size.width = v32;
      v79.size.height = v34;
      v35 = v19 - CGRectGetMinX(v79);
      v36 = v35 >= 0.0 ? v35 : -v35;
      -[SXStripGalleryComponentView imageViews](self, "imageViews");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "count") - 1;

      if (v23 == v38)
        break;
      v82.origin.x = v28;
      v82.origin.y = v30;
      v82.size.width = v32;
      v82.size.height = v34;
      Width = CGRectGetWidth(v82);
      v83.origin.x = v28;
      v83.origin.y = v30;
      v83.size.width = v32;
      v83.size.height = v34;
      if (Width / CGRectGetHeight(v83) > 2.0)
      {
        v84.origin.x = v28;
        v84.origin.y = v30;
        v84.size.width = v32;
        v84.size.height = v34;
        v40 = v19 - CGRectGetMaxX(v84);
        goto LABEL_13;
      }
      v42 = 0;
LABEL_19:
      if (v36 < v25)
      {
        v24 = v23;
        v25 = v36;
        v22 = v42;
      }
      ++v23;
      -[SXStripGalleryComponentView imageViews](self, "imageViews");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "count");

      if (v23 >= v44)
        goto LABEL_26;
    }
    v80.origin.y = v73;
    v80.origin.x = v74;
    v80.size.height = v75;
    *(_QWORD *)&v80.size.width = v77;
    v39 = v19 + CGRectGetMaxX(v80);
    v81.origin.x = v28;
    v81.origin.y = v30;
    v81.size.width = v32;
    v81.size.height = v34;
    v40 = v39 - CGRectGetMaxX(v81);
LABEL_13:
    if (v40 < 0.0)
      v40 = -v40;
    v42 = v40 < v36;
    if (v40 < v36)
      v36 = v40;
    goto LABEL_19;
  }
  v24 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_26:
  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "frameForViewAtIndex:", v24);
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v54 = v53;

  if (v72 >= 0.0)
  {
    v57 = v73;
    v56 = v74;
    if (v72 <= 0.0)
      return;
    goto LABEL_32;
  }
  v85.origin.x = v48;
  v85.origin.y = v50;
  v85.size.width = v52;
  v85.size.height = v54;
  MinX = CGRectGetMinX(v85);
  v57 = v73;
  v56 = v74;
  v86.origin.x = v74;
  v86.origin.y = v73;
  v86.size.height = v75;
  *(_QWORD *)&v86.size.width = v77;
  v58 = MinX - CGRectGetMinX(v86);
  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v71 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "contentOffset");
  if (v58 < v59)
  {

LABEL_35:
    v89.origin.x = v48;
    v89.origin.y = v50;
    v89.size.width = v52;
    v89.size.height = v54;
    MaxX = CGRectGetMinX(v89);
    v90.origin.x = v56;
    v90.origin.y = v57;
    *(_QWORD *)&v90.size.width = v77;
    v90.size.height = v75;
    v69 = CGRectGetMinX(v90);
    if (v22)
    {
      v91.origin.x = v48;
      v91.origin.y = v50;
      v91.size.width = v52;
      v91.size.height = v54;
      MaxX = CGRectGetMaxX(v91);
      v92.origin.x = v56;
      v92.origin.y = v57;
      *(_QWORD *)&v92.size.width = v77;
      v92.size.height = v75;
      v69 = CGRectGetMaxX(v92);
    }
    a5->x = MaxX - v69;
    return;
  }
  if (v72 <= 0.0)
  {
    v45 = v71;
    goto LABEL_24;
  }
LABEL_32:
  v87.origin.y = v50;
  v60 = v48;
  v87.origin.x = v48;
  v87.size.width = v52;
  y = v87.origin.y;
  v61 = v54;
  v87.size.height = v54;
  v62 = CGRectGetMinX(v87);
  v88.origin.x = v56;
  v88.origin.y = v57;
  v88.size.height = v75;
  *(_QWORD *)&v88.size.width = v77;
  v63 = v62 - CGRectGetMinX(v88);
  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "contentOffset");
  v66 = v65;

  if (v72 < 0.0)
  v67 = v63 <= v66;
  v54 = v61;
  v48 = v60;
  v50 = y;
  if (!v67)
    goto LABEL_35;
}

- (BOOL)gestureShouldBegin:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SXStripGalleryComponentView fullScreenCanvasController](self, "fullScreenCanvasController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "otherInteractivityGestureShouldBegin:", v4);

  return v6;
}

- (id)textResizerForCaption:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  SXTextResizer *v21;
  void *v22;
  id *v23;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SXDefaultTextStyleIdentifierForRole((uint64_t)CFSTR("body"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentTextStyleForIdentifiers:component:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = CFSTR("default");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView component](self, "component");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentTextStyleForIdentifiers:component:", v11, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCaption caption]((uint64_t)v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "textStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "classification");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentTextStyleForIdentifier:classification:component:", v15, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    v20 = objc_msgSend(v19, "fontScaling");
  else
    v20 = 1;
  v21 = [SXTextResizer alloc];
  -[SXComponentView documentColumnLayout](self, "documentColumnLayout");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[SXTextResizer initWithColumnLayout:defaultTextStyle:fontScalingEnabled:]((id *)&v21->super.isa, v22, v9, v20);

  return v23;
}

- (id)textRulesForCaption:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SXComponentView component](self, "component", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)textStyleForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textStyleForIdentifier:component:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)componentTextStyleForIdentifier:(id)a3 inheritingFromComponentTextStyle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentTextStyleForIdentifier:inheritingFromComponentTextStyle:component:", v7, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)contentSizeCategoryForCaption:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SXComponentView presentationDelegate](self, "presentationDelegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)visibilityStateDidChangeFromState:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXStripGalleryComponentView;
  -[SXMediaComponentView visibilityStateDidChangeFromState:](&v4, sel_visibilityStateDidChangeFromState_, a3);
  if (-[SXComponentView visibilityState](self, "visibilityState") == 1)
    -[SXStripGalleryComponentView trackExposedGalleryItems](self, "trackExposedGalleryItems");
}

- (void)trackExposedGalleryItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[SXComponentView component](self, "component");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "NSArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXStripGalleryComponentView itemizedScrollView](self, "itemizedScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "visibleRange");
  objc_msgSend(v5, "subarrayWithRange:", v7, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[SXStripGalleryComponentView exposedGalleryItems](self, "exposedGalleryItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v10);

}

- (void)submitEvents
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SXStripGalleryComponentView;
  -[SXMediaComponentView submitEvents](&v3, sel_submitEvents);
  -[SXStripGalleryComponentView finishMediaViewEvent](self, "finishMediaViewEvent");
}

- (void)createMediaViewEventForGalleryItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SXStripGalleryComponentView mediaViewEvent](self, "mediaViewEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && !v5)
  {
    -[SXMediaComponentView mediaEventForClass:](self, "mediaEventForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView component](self, "component");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGalleryImageCount:", objc_msgSend(v8, "count"));

    objc_msgSend(v4, "imageIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGalleryImageIds:", v10);

    objc_msgSend(v6, "setMediaType:", 4);
    -[SXStripGalleryComponentView setMediaViewEvent:](self, "setMediaViewEvent:", v6);

  }
}

- (void)finishMediaViewEvent
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SXStripGalleryComponentView mediaViewEvent](self, "mediaViewEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;

  if (v6 < 0.0)
    v6 = -v6;
  -[SXStripGalleryComponentView mediaViewEvent](self, "mediaViewEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v6 >= 1.0)
    {
      -[SXStripGalleryComponentView mediaViewEvent](self, "mediaViewEvent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "determineEndDate");

      -[SXMediaComponentView analyticsReporting](self, "analyticsReporting");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXStripGalleryComponentView mediaViewEvent](self, "mediaViewEvent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reportEvent:", v10);

      -[SXStripGalleryComponentView setMediaViewEvent:](self, "setMediaViewEvent:", 0);
    }
  }
}

- (void)preloadAdjacentViewsForIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  if (-[SXStripGalleryComponentView lastPreloadViewIndex](self, "lastPreloadViewIndex") != a3)
  {
    -[SXStripGalleryComponentView imageViews](self, "imageViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") - 1;

    if (v6 >= a3)
      v7 = a3;
    else
      v7 = v6;
    if (a3 + 2 >= v6)
      v8 = v6;
    else
      v8 = a3 + 2;
    for (; v7 <= v8; ++v7)
    {
      if (a3 != v7)
      {
        -[SXStripGalleryComponentView imageViews](self, "imageViews");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndex:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 == v11)
        {
          -[SXStripGalleryComponentView createViewForViewIndex:](self, "createViewForViewIndex:", v7);
          v12 = objc_claimAutoreleasedReturnValue();

          -[SXStripGalleryComponentView imageViews](self, "imageViews");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "replaceObjectAtIndex:withObject:", v7, v12);

          v10 = (void *)v12;
        }

      }
    }
    -[SXStripGalleryComponentView setLastPreloadViewIndex:](self, "setLastPreloadViewIndex:", a3);
  }
}

- (BOOL)allowHierarchyRemoval
{
  unsigned __int8 v3;
  void *v4;
  char v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXStripGalleryComponentView;
  v3 = -[SXComponentView allowHierarchyRemoval](&v7, sel_allowHierarchyRemoval);
  -[SXStripGalleryComponentView fullScreenCanvasController](self, "fullScreenCanvasController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFullscreen");

  return v3 & ~v5;
}

- (SXImageViewFactory)imageViewFactory
{
  return self->_imageViewFactory;
}

- (SXFullscreenCanvasControllerFactory)canvasControllerFactory
{
  return self->_canvasControllerFactory;
}

- (double)xOffset
{
  return self->_xOffset;
}

- (double)rightContentInset
{
  return self->_rightContentInset;
}

- (NSArray)imageResources
{
  return self->_imageResources;
}

- (void)setImageResources:(id)a3
{
  objc_storeStrong((id *)&self->_imageResources, a3);
}

- (NSMutableArray)imageViews
{
  return self->_imageViews;
}

- (void)setImageViews:(id)a3
{
  objc_storeStrong((id *)&self->_imageViews, a3);
}

- (NSArray)accessibilityCaptions
{
  return self->_accessibilityCaptions;
}

- (void)setAccessibilityCaptions:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityCaptions, a3);
}

- (SXItemizedScrollView)itemizedScrollView
{
  return self->_itemizedScrollView;
}

- (void)setItemizedScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_itemizedScrollView, a3);
}

- (int64_t)visibleImageViewIndex
{
  return self->_visibleImageViewIndex;
}

- (void)setVisibleImageViewIndex:(int64_t)a3
{
  self->_visibleImageViewIndex = a3;
}

- (UIView)fullscreenGestureView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_fullscreenGestureView);
}

- (void)setFullscreenGestureView:(id)a3
{
  objc_storeWeak((id *)&self->_fullscreenGestureView, a3);
}

- (SXFullscreenCanvasController)fullScreenCanvasController
{
  return self->_fullScreenCanvasController;
}

- (void)setFullScreenCanvasController:(id)a3
{
  objc_storeStrong((id *)&self->_fullScreenCanvasController, a3);
}

- (SXMediaViewEvent)mediaViewEvent
{
  return self->_mediaViewEvent;
}

- (void)setMediaViewEvent:(id)a3
{
  objc_storeStrong((id *)&self->_mediaViewEvent, a3);
}

- (BOOL)loadedAtleastOneImage
{
  return self->_loadedAtleastOneImage;
}

- (void)setLoadedAtleastOneImage:(BOOL)a3
{
  self->_loadedAtleastOneImage = a3;
}

- (double)contentOffset
{
  return self->_contentOffset;
}

- (double)contentWidth
{
  return self->_contentWidth;
}

- (unint64_t)lastPreloadViewIndex
{
  return self->_lastPreloadViewIndex;
}

- (void)setLastPreloadViewIndex:(unint64_t)a3
{
  self->_lastPreloadViewIndex = a3;
}

- (SXImageView)targetGalleryItem
{
  return self->_targetGalleryItem;
}

- (void)setTargetGalleryItem:(id)a3
{
  objc_storeStrong((id *)&self->_targetGalleryItem, a3);
}

- (NSMutableSet)exposedGalleryItems
{
  return self->_exposedGalleryItems;
}

- (void)setExposedGalleryItems:(id)a3
{
  objc_storeStrong((id *)&self->_exposedGalleryItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exposedGalleryItems, 0);
  objc_storeStrong((id *)&self->_targetGalleryItem, 0);
  objc_storeStrong((id *)&self->_mediaViewEvent, 0);
  objc_storeStrong((id *)&self->_fullScreenCanvasController, 0);
  objc_destroyWeak((id *)&self->_fullscreenGestureView);
  objc_storeStrong((id *)&self->_itemizedScrollView, 0);
  objc_storeStrong((id *)&self->_accessibilityCaptions, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_imageResources, 0);
  objc_storeStrong((id *)&self->_canvasControllerFactory, 0);
  objc_storeStrong((id *)&self->_imageViewFactory, 0);
}

@end

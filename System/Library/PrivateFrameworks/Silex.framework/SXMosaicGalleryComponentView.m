@implementation SXMosaicGalleryComponentView

- (SXMosaicGalleryComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 mediaSharingPolicyProvider:(id)a9 imageViewFactory:(id)a10 canvasControllerFactory:(id)a11
{
  id v18;
  SXMosaicGalleryComponentView *v19;
  SXMosaicGalleryComponentView *v20;
  UIView *v21;
  UIView *galleryView;
  void *v23;
  uint64_t v24;
  NSMutableArray *imageViews;
  uint64_t v26;
  NSMutableArray *visibleImageViews;
  uint64_t v28;
  NSMutableSet *exposedGalleryItems;
  uint64_t v30;
  SXFullscreenCanvasController *fullScreenCanvasController;
  id v33;
  objc_super v34;

  v33 = a10;
  v18 = a11;
  v34.receiver = self;
  v34.super_class = (Class)SXMosaicGalleryComponentView;
  v19 = -[SXGalleryComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:analyticsReporting:appStateMonitor:mediaSharingPolicyProvider:](&v34, sel_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor_mediaSharingPolicyProvider_, a3, a4, a5, a6, a7, a8, a9);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_imageViewFactory, a10);
    v21 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    galleryView = v20->_galleryView;
    v20->_galleryView = v21;

    -[SXComponentView contentView](v20, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v20->_galleryView);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v24 = objc_claimAutoreleasedReturnValue();
    imageViews = v20->_imageViews;
    v20->_imageViews = (NSMutableArray *)v24;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v26 = objc_claimAutoreleasedReturnValue();
    visibleImageViews = v20->_visibleImageViews;
    v20->_visibleImageViews = (NSMutableArray *)v26;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v28 = objc_claimAutoreleasedReturnValue();
    exposedGalleryItems = v20->_exposedGalleryItems;
    v20->_exposedGalleryItems = (NSMutableSet *)v28;

    v20->_layoutRequired = 1;
    objc_msgSend(v18, "fullscreenCanvasControllerForShowable:", v20);
    v30 = objc_claimAutoreleasedReturnValue();
    fullScreenCanvasController = v20->_fullScreenCanvasController;
    v20->_fullScreenCanvasController = (SXFullscreenCanvasController *)v30;

  }
  return v20;
}

- (void)presentComponentWithChanges:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SXMosaicGalleryComponentView;
  -[SXComponentView presentComponentWithChanges:](&v10, sel_presentComponentWithChanges_, *(_QWORD *)&a3.var0 & 0xFFFFFFLL);
  if (-[SXMosaicGalleryComponentView isLayoutRequired](self, "isLayoutRequired"))
  {
    -[SXMosaicGalleryComponentView galleryView](self, "galleryView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView contentFrame](self, "contentFrame");
    objc_msgSend(v4, "setFrame:");

    -[SXComponentView component](self, "component");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[SXMosaicGalleryComponentView galleryLayouter](self, "galleryLayouter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDataSource:", self);

      -[SXMosaicGalleryComponentView galleryLayouter](self, "galleryLayouter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXMosaicGalleryComponentView galleryView](self, "galleryView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "layoutGalleryOnView:", v9);

      -[SXMosaicGalleryComponentView setLayoutRequired:](self, "setLayoutRequired:", 0);
    }
  }
}

- (void)renderContents
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SXMosaicGalleryComponentView;
  -[SXComponentView renderContents](&v3, sel_renderContents);
  -[SXMosaicGalleryComponentView renderContentsInDrawableRect](self, "renderContentsInDrawableRect");
}

- (void)discardContents
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)SXMosaicGalleryComponentView;
  -[SXComponentView discardContents](&v14, sel_discardContents);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SXMosaicGalleryComponentView visibleImageViews](self, "visibleImageViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "objectHasQualityInterest:quality:", self, 0))
          objc_msgSend(v8, "giveUpInterestForObject:", self);
        objc_msgSend(v8, "setImage:", 0);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v5);
  }

  -[SXMosaicGalleryComponentView visibleImageViews](self, "visibleImageViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

}

- (void)visibleBoundsChanged
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v34 = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)SXMosaicGalleryComponentView;
  -[SXMediaComponentView visibleBoundsChanged](&v32, sel_visibleBoundsChanged);
  -[SXMosaicGalleryComponentView renderContentsInDrawableRect](self, "renderContentsInDrawableRect");
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[SXMosaicGalleryComponentView visibleImageViews](self, "visibleImageViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v8, "frame");
        v10 = v9;
        v12 = v11;
        v14 = v13;
        v16 = v15;
        -[SXMediaComponentView visibleBounds](self, "visibleBounds");
        v39.origin.x = v17;
        v39.origin.y = v18;
        v39.size.width = v19;
        v39.size.height = v20;
        v35.origin.x = v10;
        v35.origin.y = v12;
        v35.size.width = v14;
        v35.size.height = v16;
        v36 = CGRectIntersection(v35, v39);
        x = v36.origin.x;
        y = v36.origin.y;
        width = v36.size.width;
        height = v36.size.height;
        if (!CGRectIsNull(v36))
        {
          v37.origin.x = x;
          v37.origin.y = y;
          v37.size.width = width;
          v37.size.height = height;
          v25 = CGRectGetHeight(v37);
          objc_msgSend(v8, "frame");
          if (v25 >= CGRectGetHeight(v38) * 0.5)
          {
            -[SXMosaicGalleryComponentView exposedGalleryItems](self, "exposedGalleryItems");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "galleryItem");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v27);

          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v5);
  }

}

- (void)renderContentsInDrawableRect
{
  void *v3;
  double v4;
  double v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  _BOOL4 v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v26 = *MEMORY[0x24BDAC8D0];
  -[SXComponentView viewport](self, "viewport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[SXMediaComponentView visibleBounds](self, "visibleBounds");
  v28 = CGRectInset(v27, 0.0, v5 * -0.5);
  x = v28.origin.x;
  y = v28.origin.y;
  width = v28.size.width;
  height = v28.size.height;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[SXMosaicGalleryComponentView imageViews](self, "imageViews", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v15, "frame");
        v30.origin.x = x;
        v30.origin.y = y;
        v30.size.width = width;
        v30.size.height = height;
        v16 = CGRectIntersectsRect(v29, v30);
        -[SXMosaicGalleryComponentView visibleImageViews](self, "visibleImageViews");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "containsObject:", v15);

        if (v16)
        {
          if ((v18 & 1) == 0)
          {
            -[SXMosaicGalleryComponentView visibleImageViews](self, "visibleImageViews");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v15);

            objc_msgSend(v15, "addInterestInImageQuality:forObject:", 0, self);
          }
        }
        else if (v18)
        {
          -[SXMosaicGalleryComponentView visibleImageViews](self, "visibleImageViews");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "removeObject:", v15);

          if (objc_msgSend(v15, "objectHasQualityInterest:quality:", self, 0))
            objc_msgSend(v15, "giveUpInterestForObject:", self);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

}

- (void)receivedInfo:(id)a3 fromLayoutingPhaseWithIdentifier:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXMosaicGalleryComponentView;
  v7 = a4;
  -[SXComponentView receivedInfo:fromLayoutingPhaseWithIdentifier:](&v11, sel_receivedInfo_fromLayoutingPhaseWithIdentifier_, v6, v7);
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Layouter"), v11.receiver, v11.super_class);

  if (v8)
  {
    -[SXMosaicGalleryComponentView galleryLayouter](self, "galleryLayouter");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 != v6)
    {
      -[SXMosaicGalleryComponentView galleryLayouter](self, "galleryLayouter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "reset");

      -[SXMosaicGalleryComponentView setGalleryLayouter:](self, "setGalleryLayouter:", v6);
      -[SXMosaicGalleryComponentView setLayoutRequired:](self, "setLayoutRequired:", 1);
    }
  }

}

- (id)imageViewForItemAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
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

  -[SXMosaicGalleryComponentView imageViews](self, "imageViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    -[SXComponentView component](self, "component");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageResourceForIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[SXMosaicGalleryComponentView imageViewFactory](self, "imageViewFactory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageViewForGalleryItem:imageResource:", v7, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setContentMode:", 2);
    objc_msgSend(v8, "setClipsToBounds:", 1);
    objc_msgSend(v8, "setDelegate:", self);
    -[SXGalleryComponentView dragManager](self, "dragManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateAccessibilityDragSourceDescriptorsForDraggableElement:", v8);

    -[SXMosaicGalleryComponentView imageViews](self, "imageViews");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v8);

  }
  else
  {
    -[SXMosaicGalleryComponentView imageViews](self, "imageViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)imageView:(id)a3 didLoadImage:(id)a4 ofQuality:(int)a5
{
  -[SXMediaComponentView setIsDisplayingMedia:](self, "setIsDisplayingMedia:", 1, a4, *(_QWORD *)&a5);
}

- (void)imageView:(id)a3 didLoadAnimatedImage:(id)a4
{
  -[SXMediaComponentView setIsDisplayingMedia:](self, "setIsDisplayingMedia:", 1, a4);
}

- (unint64_t)numberOfItemsForGalleryLayouter:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[SXComponentView component](self, "component", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (CGSize)galleryLayouter:(id)a3 dimensionsForItemAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  -[SXComponentView component](self, "component", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageResourceForIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "dimensions");
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (id)galleryLayouter:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v6 = a3;
  -[SXMosaicGalleryComponentView imageViewForItemAtIndex:](self, "imageViewForItemAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frameForItemAtIndex:", a4);
  v9 = v8;
  v11 = v10;

  objc_msgSend(v7, "imageResource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dimensions");
  v14 = v13;
  v16 = v15;

  objc_msgSend(v7, "setPreferredImageSize:", CGSizeAspectFill(v14, v16, v9, v11));
  return v7;
}

- (BOOL)galleryLayouter:(id)a3 viewIsCurrentlyFullscreenForItemAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  BOOL v8;

  -[SXMosaicGalleryComponentView fullScreenCanvasController](self, "fullScreenCanvasController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return 0;
  -[SXMosaicGalleryComponentView fullScreenCanvasController](self, "fullScreenCanvasController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "activeViewIndex") == a4;

  return v8;
}

- (BOOL)requestInteractivityFocusForFullScreenCanvasController:(id)a3
{
  SXMosaicGalleryComponentView *v3;
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

- (void)fullScreenCanvasController:(id)a3 didHideShowable:(id)a4 viewIndex:(unint64_t)a5
{
  void *v6;
  void *v7;

  -[SXComponentView presentationDelegate](self, "presentationDelegate", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeInteractivityFocusForComponent:", self);

  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissFullscreenCanvasForComponent:", self);

  -[SXMosaicGalleryComponentView finishMediaViewEvent](self, "finishMediaViewEvent");
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

  -[SXMosaicGalleryComponentView createMediaViewEventForGalleryItem:](self, "createMediaViewEventForGalleryItem:", v9);
}

- (CGRect)fullScreenCanvasController:(id)a3 fullScreenFrameForShowable:(id)a4 viewIndex:(unint64_t)a5 withinRect:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect result;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v12 = a3;
  -[SXComponentView component](self, "component");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndex:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageResourceForIdentifier:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "dimensions");
  v20 = v19;
  objc_msgSend(v18, "dimensions");
  objc_msgSend(v12, "fitSizeForRect:", 0.0, 0.0, v20, v21);
  v23 = v22;
  v25 = v24;

  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v26 = CGRectGetHeight(v34);
  v35.origin.x = 0.0;
  v35.origin.y = 0.0;
  v35.size.width = v23;
  v35.size.height = v25;
  v27 = (v26 - CGRectGetHeight(v35)) * 0.5;
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  v28 = CGRectGetWidth(v36);
  v37.origin.x = 0.0;
  v37.origin.y = v27;
  v37.size.width = v23;
  v37.size.height = v25;
  v29 = (v28 - CGRectGetWidth(v37)) * 0.5;

  v30 = v29;
  v31 = v27;
  v32 = v23;
  v33 = v25;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (unint64_t)fullScreenCanvasController:(id)a3 numberOfViewsForShowable:(id)a4
{
  void *v5;
  unint64_t v6;

  -[SXMosaicGalleryComponentView galleryLayouter](self, "galleryLayouter", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SXMosaicGalleryComponentView numberOfItemsForGalleryLayouter:](self, "numberOfItemsForGalleryLayouter:", v5);

  return v6;
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
  -[SXMosaicGalleryComponentView galleryLayouter](self, "galleryLayouter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frameForItemAtIndex:", a6);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[SXMosaicGalleryComponentView galleryView](self, "galleryView");
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

- (id)fullScreenCanvasController:(id)a3 originalViewForShowable:(id)a4 viewIndex:(unint64_t)a5
{
  void *v6;
  void *v7;

  -[SXMosaicGalleryComponentView galleryLayouter](self, "galleryLayouter", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewForItemAtIndex:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)fullScreenCanvasController:(id)a3 shouldAddGestureView:(id)a4 forShowable:(id)a5
{
  id v6;
  id v7;

  v6 = a4;
  -[SXComponentView contentFrame](self, "contentFrame");
  objc_msgSend(v6, "setFrame:");
  -[SXComponentView contentView](self, "contentView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v6);

}

- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 didShowViewWithIndex:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double x;
  double y;
  double width;
  double height;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  void *v35;
  id v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  -[SXComponentView component](self, "component", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a5);
  v36 = (id)objc_claimAutoreleasedReturnValue();

  -[SXMosaicGalleryComponentView finishMediaViewEvent](self, "finishMediaViewEvent");
  -[SXMosaicGalleryComponentView createMediaViewEventForGalleryItem:](self, "createMediaViewEventForGalleryItem:", v36);
  -[SXMosaicGalleryComponentView galleryLayouter](self, "galleryLayouter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frameForItemAtIndex:", a5);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[SXComponentView absoluteFrame](self, "absoluteFrame");
  v19 = v18;
  -[SXComponentView absoluteFrame](self, "absoluteFrame");
  v21 = v20;
  v37.origin.x = v11;
  v37.origin.y = v13;
  v37.size.width = v15;
  v37.size.height = v17;
  v38 = CGRectOffset(v37, v19, v21);
  x = v38.origin.x;
  y = v38.origin.y;
  width = v38.size.width;
  height = v38.size.height;
  -[SXComponentView viewport](self, "viewport");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dynamicBounds");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v39.origin.x = v28;
  v39.origin.y = v30;
  v39.size.width = v32;
  v39.size.height = v34;
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  if (!CGRectContainsRect(v39, v40))
  {
    -[SXComponentView presentationDelegate](self, "presentationDelegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "scrollToRect:animated:", 0, x, y, width, height);

  }
}

- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 shouldTransferToOriginalViewWithIndex:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SXMosaicGalleryComponentView galleryLayouter](self, "galleryLayouter", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewForItemAtIndex:", a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[SXMosaicGalleryComponentView galleryLayouter](self, "galleryLayouter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frameForItemAtIndex:", a5);
  objc_msgSend(v10, "setFrame:");

  -[SXMosaicGalleryComponentView galleryView](self, "galleryView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

}

- (unint64_t)fullScreenCanvasController:(id)a3 viewIndexForPoint:(CGPoint)a4 inShowable:(id)a5
{
  CGFloat y;
  CGFloat x;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  CGPoint v16;
  CGRect v17;

  y = a4.y;
  x = a4.x;
  -[SXMosaicGalleryComponentView galleryLayouter](self, "galleryLayouter", a3, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SXMosaicGalleryComponentView numberOfItemsForGalleryLayouter:](self, "numberOfItemsForGalleryLayouter:", v8);

  if (!v9)
    return 0x7FFFFFFFFFFFFFFFLL;
  v10 = 0;
  while (1)
  {
    -[SXMosaicGalleryComponentView galleryLayouter](self, "galleryLayouter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewForItemAtIndex:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "frame");
      v16.x = x;
      v16.y = y;
      if (CGRectContainsPoint(v17, v16))
        break;
    }

    ++v10;
    -[SXMosaicGalleryComponentView galleryLayouter](self, "galleryLayouter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SXMosaicGalleryComponentView numberOfItemsForGalleryLayouter:](self, "numberOfItemsForGalleryLayouter:", v13);

    if (v10 >= v14)
      return 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (void)fullScreenCanvasController:(id)a3 willHideShowable:(id)a4 viewIndex:(unint64_t)a5
{
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double x;
  double y;
  double width;
  double height;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  id v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  -[SXMosaicGalleryComponentView galleryLayouter](self, "galleryLayouter", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frameForItemAtIndex:", a5);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[SXComponentView absoluteFrame](self, "absoluteFrame");
  v17 = v16;
  -[SXComponentView absoluteFrame](self, "absoluteFrame");
  v19 = v18;
  v34.origin.x = v9;
  v34.origin.y = v11;
  v34.size.width = v13;
  v34.size.height = v15;
  v35 = CGRectOffset(v34, v17, v19);
  x = v35.origin.x;
  y = v35.origin.y;
  width = v35.size.width;
  height = v35.size.height;
  -[SXComponentView viewport](self, "viewport");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dynamicBounds");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  v36.origin.x = v26;
  v36.origin.y = v28;
  v36.size.width = v30;
  v36.size.height = v32;
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  if (!CGRectContainsRect(v36, v37))
  {
    -[SXComponentView presentationDelegate](self, "presentationDelegate");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "scrollToRect:animated:", 0, x, y, width, height);

  }
}

- (BOOL)fullScreenCanvasController:(id)a3 willShowShowable:(id)a4 viewIndex:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  -[SXMosaicGalleryComponentView imageViews](self, "imageViews", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "hasLoadedImage"))
  {
    -[SXComponentView presentationDelegate](self, "presentationDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "addInteractivityFocusForComponent:", self);

    if (v10)
      objc_msgSend(v8, "addInterestInImageQuality:forObject:", 1, self);
    -[SXComponentView presentationDelegate](self, "presentationDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "animationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stopUpdatingAnimationForComponentView:finishAnimation:", self, 1);

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 willShowViewWithIndex:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  int v11;
  double v12;

  -[SXMosaicGalleryComponentView imageViews](self, "imageViews", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setShouldShowLoadingIndicator:", 1);
  v12 = 0.0;
  -[SXMosaicGalleryComponentView backgroundColor](self, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getHue:saturation:brightness:alpha:", 0, 0, &v12, 0);

  v10 = v12;
  if (v12 < 0.5)
    objc_msgSend(v8, "setLoadingIndicatorStyle:", 1, v12);
  v11 = 0;
  if (objc_msgSend(v8, "objectHasQualityInterest:quality:", self, &v11, v10) && !v11)
    objc_msgSend(v8, "addInterestInImageQuality:forObject:", 1, self);

}

- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 didHideViewWithIndex:(unint64_t)a5
{
  void *v7;
  id v8;

  -[SXMosaicGalleryComponentView imageViews](self, "imageViews", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setShouldShowLoadingIndicator:", 0);
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
  CGFloat y;
  CGFloat x;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;
  CGPoint v17;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SXMosaicGalleryComponentView imageViews](self, "imageViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "frame");
        v17.x = x;
        v17.y = y;
        if (CGRectContainsPoint(v18, v17))
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)forceImageViewFullscreen:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[SXMosaicGalleryComponentView imageViews](self, "imageViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  -[SXMosaicGalleryComponentView fullScreenCanvasController](self, "fullScreenCanvasController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentFullscreenWithIndex:", v6);

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

- (void)submitEvents
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SXMosaicGalleryComponentView;
  -[SXMediaComponentView submitEvents](&v3, sel_submitEvents);
  -[SXMosaicGalleryComponentView finishMediaViewEvent](self, "finishMediaViewEvent");
}

- (unint64_t)analyticsMediaType
{
  return 1;
}

- (unint64_t)analyticsGalleryType
{
  return 2;
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
  -[SXMosaicGalleryComponentView mediaViewEvent](self, "mediaViewEvent");
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
    -[SXMosaicGalleryComponentView setMediaViewEvent:](self, "setMediaViewEvent:", v6);

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

  -[SXMosaicGalleryComponentView mediaViewEvent](self, "mediaViewEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;

  if (v6 < 0.0)
    v6 = -v6;
  -[SXMosaicGalleryComponentView mediaViewEvent](self, "mediaViewEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v6 >= 1.0)
  {
    -[SXMosaicGalleryComponentView mediaViewEvent](self, "mediaViewEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "determineEndDate");

    -[SXMediaComponentView analyticsReporting](self, "analyticsReporting");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXMosaicGalleryComponentView mediaViewEvent](self, "mediaViewEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reportEvent:", v10);

  }
  -[SXMosaicGalleryComponentView setMediaViewEvent:](self, "setMediaViewEvent:", 0);
}

- (BOOL)shouldSubmitMediaExposureEventForExposedBounds:(CGRect)a3
{
  void *v3;
  BOOL v4;

  -[SXMosaicGalleryComponentView exposedGalleryItems](self, "exposedGalleryItems", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
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
  v9.super_class = (Class)SXMosaicGalleryComponentView;
  v4 = a3;
  -[SXMediaComponentView willSubmitMediaExposureEvent:](&v9, sel_willSubmitMediaExposureEvent_, v4);
  -[SXComponentView component](self, "component", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfImages:", objc_msgSend(v6, "count"));

  -[SXMosaicGalleryComponentView exposedGalleryItems](self, "exposedGalleryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfImagesExposed:", objc_msgSend(v7, "count"));

  -[SXMosaicGalleryComponentView exposedGalleryItems](self, "exposedGalleryItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (BOOL)allowHierarchyRemoval
{
  unsigned __int8 v3;
  void *v4;
  char v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXMosaicGalleryComponentView;
  v3 = -[SXComponentView allowHierarchyRemoval](&v7, sel_allowHierarchyRemoval);
  -[SXMosaicGalleryComponentView fullScreenCanvasController](self, "fullScreenCanvasController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFullscreen");

  return v3 & ~v5;
}

- (SXGalleryItemImageViewFactory)imageViewFactory
{
  return self->_imageViewFactory;
}

- (SXFullscreenCanvasController)fullScreenCanvasController
{
  return self->_fullScreenCanvasController;
}

- (UIView)galleryView
{
  return self->_galleryView;
}

- (void)setGalleryView:(id)a3
{
  objc_storeStrong((id *)&self->_galleryView, a3);
}

- (NSMutableArray)imageViews
{
  return self->_imageViews;
}

- (NSMutableArray)visibleImageViews
{
  return self->_visibleImageViews;
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

- (SXMosaicGalleryLayouter)galleryLayouter
{
  return self->_galleryLayouter;
}

- (void)setGalleryLayouter:(id)a3
{
  objc_storeStrong((id *)&self->_galleryLayouter, a3);
}

- (NSMutableSet)exposedGalleryItems
{
  return self->_exposedGalleryItems;
}

- (void)setExposedGalleryItems:(id)a3
{
  objc_storeStrong((id *)&self->_exposedGalleryItems, a3);
}

- (BOOL)isLayoutRequired
{
  return self->_layoutRequired;
}

- (void)setLayoutRequired:(BOOL)a3
{
  self->_layoutRequired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exposedGalleryItems, 0);
  objc_storeStrong((id *)&self->_galleryLayouter, 0);
  objc_storeStrong((id *)&self->_mediaViewEvent, 0);
  objc_storeStrong((id *)&self->_visibleImageViews, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_galleryView, 0);
  objc_storeStrong((id *)&self->_fullScreenCanvasController, 0);
  objc_storeStrong((id *)&self->_imageViewFactory, 0);
}

@end

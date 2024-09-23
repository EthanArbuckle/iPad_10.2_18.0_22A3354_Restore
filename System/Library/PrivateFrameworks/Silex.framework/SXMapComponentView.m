@implementation SXMapComponentView

- (SXMapComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 documentTitleProvider:(id)a9
{
  id v16;
  SXMapComponentView *v17;
  SXMapComponentView *v18;
  SXMapSnapShotter *v19;
  SXMapSnapShotter *snapShotter;
  UIImageView *v21;
  UIImageView *imageView;
  void *v23;
  NSCache *v24;
  NSCache *cachedSnapshots;
  uint64_t v26;
  UITapGestureRecognizer *tapGesture;
  void *v28;
  objc_super v30;

  v16 = a9;
  v30.receiver = self;
  v30.super_class = (Class)SXMapComponentView;
  v17 = -[SXMediaComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:analyticsReporting:appStateMonitor:](&v30, sel_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor_, a3, a4, a5, a6, a7, a8);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_documentTitleProvider, a9);
    v19 = objc_alloc_init(SXMapSnapShotter);
    snapShotter = v18->_snapShotter;
    v18->_snapShotter = v19;

    v21 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    imageView = v18->_imageView;
    v18->_imageView = v21;

    -[UIImageView setUserInteractionEnabled:](v18->_imageView, "setUserInteractionEnabled:", 1);
    -[SXComponentView contentView](v18, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v18->_imageView);

    v24 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    cachedSnapshots = v18->_cachedSnapshots;
    v18->_cachedSnapshots = v24;

    v26 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v18, sel_handleTap_);
    tapGesture = v18->_tapGesture;
    v18->_tapGesture = (UITapGestureRecognizer *)v26;

    -[UIImageView addGestureRecognizer:](v18->_imageView, "addGestureRecognizer:", v18->_tapGesture);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v18, sel_memoryWarning_, *MEMORY[0x24BDF7538], 0);

  }
  return v18;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7538], 0);

  v4.receiver = self;
  v4.super_class = (Class)SXMapComponentView;
  -[SXComponentView dealloc](&v4, sel_dealloc);
}

- (void)memoryWarning:(id)a3
{
  id v3;

  -[SXMapComponentView cachedSnapshots](self, "cachedSnapshots", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

- (void)renderContents
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SXMapComponentView;
  -[SXComponentView renderContents](&v3, sel_renderContents);
  -[SXMapComponentView createSnapShot](self, "createSnapShot");
}

- (void)presentComponentWithChanges:(id)a3
{
  BOOL var0;
  void *v5;
  objc_super v6;

  var0 = a3.var0;
  v6.receiver = self;
  v6.super_class = (Class)SXMapComponentView;
  -[SXComponentView presentComponentWithChanges:](&v6, sel_presentComponentWithChanges_, *(_QWORD *)&a3.var0 & 0xFFFFFFLL);
  -[SXMapComponentView imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView contentFrame](self, "contentFrame");
  objc_msgSend(v5, "setFrame:");

  if (-[SXComponentView hasRenderedContents](self, "hasRenderedContents"))
  {
    if (var0)
      -[SXMapComponentView discardContents](self, "discardContents");
  }
}

- (void)discardContents
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXMapComponentView;
  -[SXComponentView discardContents](&v4, sel_discardContents);
  -[SXMapComponentView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[SXMapComponentView cancelSnapShot](self, "cancelSnapShot");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXMapComponentView;
  -[SXMapComponentView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  if (-[SXComponentView hasRenderedContents](self, "hasRenderedContents"))
    -[SXMapComponentView createSnapShot](self, "createSnapShot");
}

- (void)createSnapShot
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  -[SXComponentView contentFrame](self, "contentFrame");
  v4 = v3;
  v6 = v5;
  v7 = objc_alloc_init(MEMORY[0x24BDDB120]);
  -[SXComponentView component](self, "component");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMapType:", objc_msgSend(v8, "defaultMapType"));

  -[SXMapComponentView mapRect](self, "mapRect");
  objc_msgSend(v7, "setMapRect:");
  objc_msgSend(v7, "setSize:", v4, v6);
  -[SXMapComponentView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTraitCollection:", v9);

  -[SXMapComponentView cachedSnapshots](self, "cachedSnapshots");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SXMapComponentView imageView](self, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", v11);

  }
  else
  {
    -[SXMapComponentView cancelSnapShot](self, "cancelSnapShot");
    objc_initWeak(&location, self);
    -[SXMapComponentView snapShotter](self, "snapShotter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXMapComponentView annotations](self, "annotations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __36__SXMapComponentView_createSnapShot__block_invoke;
    v16[3] = &unk_24D68DAF8;
    objc_copyWeak(&v18, &location);
    v17 = v7;
    objc_msgSend(v13, "snapShotWithOptions:annotations:completionBlock:", v17, v14, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXMapComponentView setSnapShotCancelHandler:](self, "setSnapShotCancelHandler:", v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

void __36__SXMapComponentView_createSnapShot__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", v6))
  {
    objc_msgSend(WeakRetained, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v5);

    objc_msgSend(WeakRetained, "setSnapShotCancelHandler:", 0);
    objc_msgSend(WeakRetained, "imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlpha:", 0.0);

    objc_msgSend(WeakRetained, "setIsDisplayingMedia:", 1);
    if (v5)
    {
      objc_msgSend(WeakRetained, "cachedSnapshots");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v5, v6);

    }
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __36__SXMapComponentView_createSnapShot__block_invoke_2;
    v11[3] = &unk_24D6874A8;
    v11[4] = WeakRetained;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 2, v11, 0, 0.2, 0.0);
  }

}

void __36__SXMapComponentView_createSnapShot__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)cancelSnapShot
{
  void *v3;
  void (**v4)(void);

  -[SXMapComponentView snapShotCancelHandler](self, "snapShotCancelHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SXMapComponentView snapShotCancelHandler](self, "snapShotCancelHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    -[SXMapComponentView setSnapShotCancelHandler:](self, "setSnapShotCancelHandler:", 0);
  }
}

- (NSArray)annotations
{
  NSArray *annotations;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SXMapComponentAnnotation *v11;
  NSArray *v12;
  NSArray *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  annotations = self->_annotations;
  if (!annotations)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[SXComponentView component](self, "component", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = -[SXMapComponentAnnotation initWithMapItem:]([SXMapComponentAnnotation alloc], "initWithMapItem:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10));
          objc_msgSend(v4, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v4);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v13 = self->_annotations;
    self->_annotations = v12;

    annotations = self->_annotations;
  }
  return annotations;
}

- ($492624663365B345F6CF51E8DFCF0145)mapRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  $492624663365B345F6CF51E8DFCF0145 result;

  -[SXMapComponentView region](self, "region");
  +[SXMapComponentSizer mapRectForRegion:](SXMapComponentSizer, "mapRectForRegion:");
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

- ($E660A970F15D2F953EA027EB4C298F67)region
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  $E660A970F15D2F953EA027EB4C298F67 *result;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SXComponentView component](self, "component", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)MEMORY[0x24BDD1968];
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "coordinate");
        objc_msgSend(v11, "valueWithMKCoordinate:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[SXComponentView component](self, "component");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "region");
  +[SXMapComponentSizer regionFromRegion:coordinates:](SXMapComponentSizer, "regionFromRegion:coordinates:", v4);

  return result;
}

- (void)presentFullScreen
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[SXMapComponentView configureMapView](self, "configureMapView");
  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__SXMapComponentView_presentFullScreen__block_invoke;
  v7[3] = &unk_24D6874A8;
  v7[4] = self;
  objc_msgSend(v3, "requestFullScreenCanvasViewControllerForComponent:withCompletionBlock:", self, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMapComponentView setFullScreenCanvasViewController:](self, "setFullScreenCanvasViewController:", v4);

  -[SXMapComponentView mapTitle](self, "mapTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMapComponentView fullScreenCanvasViewController](self, "fullScreenCanvasViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v5);

}

uint64_t __39__SXMapComponentView_presentFullScreen__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[5];
  _QWORD v29[4];
  uint64_t v30;

  objc_msgSend(*(id *)(a1 + 32), "fullScreenCanvasViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDelegate:", *(_QWORD *)(a1 + 32));

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "mapView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");
  v6 = v5;
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "fullScreenCanvasViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertPoint:toView:", v10, v6, v8);
  v12 = v11;
  v14 = v13;

  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCenter:", v12, v14);

  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCenter:", v12, v14);

  objc_msgSend(*(id *)(a1 + 32), "fullScreenCanvasViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

  objc_msgSend(*(id *)(a1 + 32), "fullScreenCanvasViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v22);

  objc_msgSend(*(id *)(a1 + 32), "setupNavigationBar");
  objc_msgSend(*(id *)(a1 + 32), "setupToolbar");
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __39__SXMapComponentView_presentFullScreen__block_invoke_2;
  v29[3] = &unk_24D6874A8;
  v30 = *(_QWORD *)(a1 + 32);
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __39__SXMapComponentView_presentFullScreen__block_invoke_3;
  v28[3] = &unk_24D689490;
  v28[4] = v30;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v29, v28, 0.3);
  objc_msgSend(*(id *)(a1 + 32), "fullScreenCanvasViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "navigationController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setToolbarHidden:animated:", 0, 1);

  objc_msgSend(*(id *)(a1 + 32), "fullScreenCanvasViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "navigationController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setNavigationBarHidden:animated:", 0, 1);

  return objc_msgSend(*(id *)(a1 + 32), "createMediaEngageEvent");
}

void __39__SXMapComponentView_presentFullScreen__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double Width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CGFloat v10;
  void *v11;
  void *v12;
  id v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fullScreenCanvasViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  Width = CGRectGetWidth(v14);
  objc_msgSend(*(id *)(a1 + 32), "fullScreenCanvasViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  objc_msgSend(v2, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v15));

  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fullScreenCanvasViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v10 = CGRectGetWidth(v16) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "fullScreenCanvasViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  objc_msgSend(v13, "setCenter:", v10, CGRectGetHeight(v17) * 0.5);

}

void __39__SXMapComponentView_presentFullScreen__block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  _QWORD v4[4];
  uint64_t v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39__SXMapComponentView_presentFullScreen__block_invoke_4;
  v4[3] = &unk_24D6874A8;
  v5 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __39__SXMapComponentView_presentFullScreen__block_invoke_5;
  v3[3] = &unk_24D689490;
  v3[4] = v5;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v4, v3, 0.2);
  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAutoresizingMask:", 18);

}

void __39__SXMapComponentView_presentFullScreen__block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __39__SXMapComponentView_presentFullScreen__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "enableMapViewInteraction:", 1);
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentFrame");
  objc_msgSend(v5, "setFrame:");

}

- (void)dismissFullScreen
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[SXMapComponentView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  -[SXMapComponentView fullScreenCanvasViewController](self, "fullScreenCanvasViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__SXMapComponentView_dismissFullScreen__block_invoke;
  v6[3] = &unk_24D6874A8;
  v6[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v6);

  -[SXMapComponentView finishMediaEngageEvent](self, "finishMediaEngageEvent");
  -[SXMapComponentView submitMediaEngageCompleteEvent](self, "submitMediaEngageCompleteEvent");
  -[SXMapComponentView fullScreenCanvasViewController](self, "fullScreenCanvasViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsStatusBarAppearanceUpdate");

}

uint64_t __39__SXMapComponentView_dismissFullScreen__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setMapView:", 0);
  objc_msgSend(*(id *)(a1 + 32), "presentationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissFullscreenCanvasForComponent:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 32), "setFullScreenCanvasViewController:", 0);
}

- (void)handleTap:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[SXMapComponentView imageView](self, "imageView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    v6 = -[SXMapComponentView isPresentingFullscreen](self, "isPresentingFullscreen");

    if (!v6)
      return;
  }
  if (-[SXMapComponentView isPresentingFullscreen](self, "isPresentingFullscreen"))
  {
    if (!-[SXMapComponentView hasSelectedAnnotations](self, "hasSelectedAnnotations"))
    {
      v7 = -[SXMapComponentView areBarsHidden](self, "areBarsHidden") ^ 1;
      -[SXMapComponentView fullScreenCanvasViewController](self, "fullScreenCanvasViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setNavigationBarHidden:animated:", v7, 1);

      -[SXMapComponentView fullScreenCanvasViewController](self, "fullScreenCanvasViewController");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setToolbarHidden:animated:", v7, 1);

    }
  }
  else
  {
    -[SXMapComponentView presentFullScreen](self, "presentFullScreen");
  }
}

- (void)configureMapView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SXMapComponentView mapView](self, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMapComponentView mapView](self, "mapView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "annotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnnotations:", v5);

  -[SXMapComponentView mapView](self, "mapView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMapComponentView annotations](self, "annotations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAnnotations:", v7);

  -[SXMapComponentView mapView](self, "mapView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMapComponentView mapRect](self, "mapRect");
  objc_msgSend(v8, "setVisibleMapRect:");

  -[SXMapComponentView mapView](self, "mapView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMapType:", objc_msgSend(v9, "defaultMapType"));

}

- (void)setupNavigationBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SXMapComponentView doneBarButtonItem](self, "doneBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_handleDoneTap_);
    -[SXMapComponentView setDoneBarButtonItem:](self, "setDoneBarButtonItem:", v4);

  }
  -[SXMapComponentView fullScreenCanvasViewController](self, "fullScreenCanvasViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMapComponentView doneBarButtonItem](self, "doneBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v6);

}

- (void)setupToolbar
{
  void *v3;
  void *v4;
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
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  -[SXMapComponentView segmentedControl](self, "segmentedControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    SXBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Standard"), &stru_24D68E0F8, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v5;
    SXBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Hybrid"), &stru_24D68E0F8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v7;
    SXBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Satellite"), &stru_24D68E0F8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6D78]), "initWithItems:", v10);
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel_mapTypeChanged_, 4096);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v11);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v20[0] = v13;
    v20[1] = v12;
    v20[2] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXMapComponentView setToolbarItems:](self, "setToolbarItems:", v15);

    -[SXMapComponentView setSegmentedControl:](self, "setSegmentedControl:", v11);
  }
  -[SXMapComponentView segmentedControl](self, "segmentedControl");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMapComponentView mapView](self, "mapView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSelectedSegmentIndex:", -[SXMapComponentView segmentIndexForMapType:](self, "segmentIndexForMapType:", objc_msgSend(v17, "mapType")));

  -[SXMapComponentView fullScreenCanvasViewController](self, "fullScreenCanvasViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMapComponentView toolbarItems](self, "toolbarItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setToolbarItems:", v19);

}

- (unint64_t)segmentIndexForMapType:(unint64_t)a3
{
  if (a3 > 2)
    return -1;
  else
    return qword_21713C858[a3];
}

- (unint64_t)mapTypeForSegmentIndex:(unint64_t)a3
{
  if (a3 == 2)
    return 1;
  else
    return 2 * (a3 == 1);
}

- (void)mapTypeChanged:(id)a3
{
  unint64_t v4;
  id v5;

  v4 = -[SXMapComponentView mapTypeForSegmentIndex:](self, "mapTypeForSegmentIndex:", objc_msgSend(a3, "selectedSegmentIndex"));
  -[SXMapComponentView mapView](self, "mapView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMapType:", v4);

}

- (MKMapView)mapView
{
  MKMapView *mapView;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  mapView = self->_mapView;
  if (!mapView)
  {
    v4 = objc_alloc(MEMORY[0x24BDDB130]);
    -[SXMapComponentView bounds](self, "bounds");
    v5 = (void *)objc_msgSend(v4, "initWithFrame:");
    objc_msgSend(v5, "_setUseBalloonCalloutsForLabels:", 1);
    objc_msgSend(v5, "setDelegate:", self);
    -[SXComponentView contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXMapComponentView imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertSubview:belowSubview:", v5, v7);

    -[SXMapComponentView setMapView:](self, "setMapView:", v5);
    -[SXMapComponentView enableMapViewInteraction:](self, "enableMapViewInteraction:", 0);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_handleTap_);
    objc_msgSend(v8, "setDelegate:", self);
    -[SXMapComponentView mapView](self, "mapView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_selectingTapGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requireGestureRecognizerToFail:", v10);

    objc_msgSend(v5, "addGestureRecognizer:", v8);
    -[SXMapComponentView setTapGesture:](self, "setTapGesture:", v8);

    mapView = self->_mapView;
  }
  return mapView;
}

- (void)enableMapViewInteraction:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[MKMapView setZoomEnabled:](self->_mapView, "setZoomEnabled:");
  -[MKMapView setScrollEnabled:](self->_mapView, "setScrollEnabled:", v3);
}

- (BOOL)isUserInteractingWithMap
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[SXMapComponentView mapView](self, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gestureRecognizers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "numberOfTouches"))
        {
LABEL_26:
          LOBYTE(v10) = 1;
          goto LABEL_27;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v6)
        continue;
      break;
    }
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[SXMapComponentView mapView](self, "mapView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v4);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v13, "gestureRecognizers", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v21;
          while (2)
          {
            for (k = 0; k != v16; ++k)
            {
              if (*(_QWORD *)v21 != v17)
                objc_enumerationMutation(v14);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * k), "numberOfTouches"))
              {

                goto LABEL_26;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
            if (v16)
              continue;
            break;
          }
        }

      }
      v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v10);
  }
LABEL_27:

  return v10;
}

- (BOOL)isPresentingFullscreen
{
  void *v2;
  BOOL v3;

  -[SXMapComponentView fullScreenCanvasViewController](self, "fullScreenCanvasViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)areBarsHidden
{
  void *v2;
  void *v3;
  char v4;

  -[SXMapComponentView fullScreenCanvasViewController](self, "fullScreenCanvasViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isNavigationBarHidden");

  return v4;
}

- (BOOL)hasSelectedAnnotations
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SXMapComponentView mapView](self, "mapView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedAnnotations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)mapTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SXComponentView component](self, "component");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "caption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXMapComponentView mapView](self, "mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "annotations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (objc_msgSend(v6, "count") != 1
      || (objc_msgSend(v6, "firstObject"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "title"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          !v4))
    {
      -[SXMapComponentView documentTitleProvider](self, "documentTitleProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "title");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v4;
}

- (void)submitEvents
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SXMapComponentView;
  -[SXMediaComponentView submitEvents](&v3, sel_submitEvents);
  -[SXMapComponentView finishMediaEngageEvent](self, "finishMediaEngageEvent");
}

- (unint64_t)analyticsMediaType
{
  return 5;
}

- (void)createMediaEngageEvent
{
  void *v3;
  id v4;

  -[SXMapComponentView activeMediaEngageEvent](self, "activeMediaEngageEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[SXMediaComponentView mediaEventForClass:](self, "mediaEventForClass:", objc_opt_class());
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SXMapComponentView setActiveMediaEngageEvent:](self, "setActiveMediaEngageEvent:", v4);

  }
}

- (void)finishMediaEngageEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SXMapComponentView activeMediaEngageEvent](self, "activeMediaEngageEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SXMapComponentView activeMediaEngageEvent](self, "activeMediaEngageEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "determineEndDate");

    -[SXMediaComponentView analyticsReporting](self, "analyticsReporting");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXMapComponentView activeMediaEngageEvent](self, "activeMediaEngageEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reportEvent:", v6);

    -[SXMapComponentView setActiveMediaEngageEvent:](self, "setActiveMediaEngageEvent:", 0);
  }
}

- (void)submitMediaEngageCompleteEvent
{
  void *v3;
  id v4;

  -[SXMediaComponentView mediaEventForClass:](self, "mediaEventForClass:", objc_opt_class());
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "determineEndDate");
  -[SXMediaComponentView analyticsReporting](self, "analyticsReporting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportEvent:", v4);

}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
{
  objc_storeStrong((id *)&self->_tapGesture, a3);
}

- (void)setAnnotations:(id)a3
{
  objc_storeStrong((id *)&self->_annotations, a3);
}

- (SXDocumentTitleProviding)documentTitleProvider
{
  return self->_documentTitleProvider;
}

- (UIBarButtonItem)doneBarButtonItem
{
  return self->_doneBarButtonItem;
}

- (void)setDoneBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_doneBarButtonItem, a3);
}

- (SXFullscreenCanvasViewController)fullScreenCanvasViewController
{
  return self->_fullScreenCanvasViewController;
}

- (void)setFullScreenCanvasViewController:(id)a3
{
  objc_storeStrong((id *)&self->_fullScreenCanvasViewController, a3);
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedControl, a3);
}

- (NSArray)toolbarItems
{
  return self->_toolbarItems;
}

- (void)setToolbarItems:(id)a3
{
  objc_storeStrong((id *)&self->_toolbarItems, a3);
}

- (SXMapSnapShotter)snapShotter
{
  return self->_snapShotter;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setMapRect:(id)a3
{
  self->_mapRect = ($896EC892FE0B5DBDF54C4B6D4353C147)a3;
}

- (id)snapShotCancelHandler
{
  return self->_snapShotCancelHandler;
}

- (void)setSnapShotCancelHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 960);
}

- (NSCache)cachedSnapshots
{
  return self->_cachedSnapshots;
}

- (SXMediaEngageEvent)activeMediaEngageEvent
{
  return self->_activeMediaEngageEvent;
}

- (void)setActiveMediaEngageEvent:(id)a3
{
  objc_storeStrong((id *)&self->_activeMediaEngageEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeMediaEngageEvent, 0);
  objc_storeStrong((id *)&self->_cachedSnapshots, 0);
  objc_storeStrong(&self->_snapShotCancelHandler, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_snapShotter, 0);
  objc_storeStrong((id *)&self->_toolbarItems, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_fullScreenCanvasViewController, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_documentTitleProvider, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end

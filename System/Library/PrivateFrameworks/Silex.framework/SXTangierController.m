@implementation SXTangierController

- (SXTangierController)initWithViewport:(id)a3 scrollView:(id)a4 componentActionHandler:(id)a5 dragItemProvider:(id)a6 componentController:(id)a7 componentInteractionManager:(id)a8 DOMObjectProvider:(id)a9 adIgnorableViewFactory:(id)a10 config:(id)a11
{
  id v18;
  id v19;
  id v20;
  SXTangierController *v21;
  SXTangierController *v22;
  id v23;
  id v24;
  SXTextTangierDocumentRoot *v25;
  SXTextTangierDocumentRoot *documentRoot;
  SXTangierRepDirectLayerHostProvider *v27;
  SXTangierRepDirectLayerHostProvider *directLayerHostProvider;
  SXTangierTextRenderCollector *v29;
  SXTangierTextRenderCollector *textRenderCollector;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  SXTangierRepDirectLayerHostProvider *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  UIView *underRepsHost;
  UIView *v64;
  void *v65;
  uint64_t v66;
  UIView *overlayRepsHost;
  UIView *v68;
  void *v69;
  uint64_t v70;
  UIView *aboveRepsHost;
  UIView *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  NSMutableSet *presentedTextViews;
  void *v79;
  void *v80;
  void *v82;
  id obj;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  objc_super v92;

  v87 = a3;
  v88 = a4;
  v86 = a5;
  obj = a6;
  v85 = a6;
  v18 = a7;
  v19 = a8;
  v84 = a9;
  v20 = a10;
  v89 = a11;
  v92.receiver = self;
  v92.super_class = (Class)SXTangierController;
  v21 = -[SXTangierController init](&v92, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_viewport, a3);
    -[SXViewport addViewportChangeListener:forOptions:](v22->_viewport, "addViewportChangeListener:forOptions:", v22, 8);
    objc_storeStrong((id *)&v22->_scrollView, a4);
    objc_storeStrong((id *)&v22->_componentActionHandler, a5);
    objc_storeStrong((id *)&v22->_dragItemProvider, obj);
    v23 = v18;
    objc_storeWeak((id *)&v22->_componentController, v18);
    v24 = v19;
    objc_storeWeak((id *)&v22->_componentInteractionManager, v19);
    objc_storeStrong((id *)&v22->_DOMObjectProvider, a9);
    objc_storeStrong((id *)&v22->_config, a11);
    v22->_unfairLock._os_unfair_lock_opaque = 0;
    +[SXTextTangierApplicationDelegate setup](SXTextTangierApplicationDelegate, "setup");
    v25 = objc_alloc_init(SXTextTangierDocumentRoot);
    documentRoot = v22->_documentRoot;
    v22->_documentRoot = v25;

    v27 = objc_alloc_init(SXTangierRepDirectLayerHostProvider);
    directLayerHostProvider = v22->_directLayerHostProvider;
    v22->_directLayerHostProvider = v27;

    v29 = objc_alloc_init(SXTangierTextRenderCollector);
    textRenderCollector = v22->_textRenderCollector;
    v22->_textRenderCollector = v29;

    v90 = 0;
    v91 = 0;
    v31 = objc_opt_class();
    +[SXTextTangierInteractiveCanvasController createCanvasWithDelegate:outICC:outLayerHost:iccClass:layerHostClass:](SXTextTangierInteractiveCanvasController, "createCanvasWithDelegate:outICC:outLayerHost:iccClass:layerHostClass:", v22, &v91, &v90, v31, objc_opt_class());
    v32 = v91;
    v33 = v91;
    v34 = v90;
    v35 = v90;
    objc_msgSend(v33, "setForceLayoutAndRenderOnThread:", 1);
    objc_storeStrong((id *)&v22->_icc, v32);
    objc_storeStrong((id *)&v22->_cvc, v34);
    -[SXTextTangierDocumentRoot setViewController:](v22->_documentRoot, "setViewController:", v22->_cvc);
    -[SXTangierController icc](v22, "icc");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setCreateRepsForOffscreenLayouts:", 1);

    -[SXTangierController icc](v22, "icc");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setAllowLayoutAndRenderOnThread:", 1);

    -[SXTangierController icc](v22, "icc");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setNestedCanvasAllowLayoutAndRenderOnThread:", 1);

    -[SXTangierController icc](v22, "icc");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v34) = objc_opt_respondsToSelector();

    if ((v34 & 1) != 0)
    {
      -[SXTangierController icc](v22, "icc");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setForceTilingLayoutOnThreadWhenScrolling:", 1);

    }
    v41 = v22->_directLayerHostProvider;
    -[SXTangierController icc](v22, "icc", v20);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setDirectLayerHostProvider:", v41);

    -[SXTangierController cvc](v22, "cvc");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "view");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setClipsToBounds:", 0);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTangierController cvc](v22, "cvc");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "view");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setBackgroundColor:", v45);

    -[SXTangierController cvc](v22, "cvc");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setDelegate:", v22);

    -[SXTangierController setSelectionEnabled:](v22, "setSelectionEnabled:", 1);
    -[SXTangierController setSelectAllEnabled:](v22, "setSelectAllEnabled:", objc_msgSend(v89, "limitTextSelectionEnabled") ^ 1);
    v49 = *MEMORY[0x24BDBF148];
    v50 = *(double *)(MEMORY[0x24BDBF148] + 8);
    -[SXTangierController cvc](v22, "cvc");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "canvasLayer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setUnscaledSize:", v49, v50);

    v53 = *MEMORY[0x24BDBF090];
    v54 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v55 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v56 = *(double *)(MEMORY[0x24BDBF090] + 24);
    -[SXTangierController icc](v22, "icc");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "canvasView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setFrame:", v53, v54, v55, v56);

    -[SXTangierController icc](v22, "icc");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setDataSource:", v22);

    -[SXTangierController icc](v22, "icc");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "canvasView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v82;
    objc_msgSend(v82, "createView");
    v62 = objc_claimAutoreleasedReturnValue();
    underRepsHost = v22->_underRepsHost;
    v22->_underRepsHost = (UIView *)v62;

    v64 = v22->_underRepsHost;
    objc_msgSend(v61, "bounds");
    -[UIView setBounds:](v64, "setBounds:");
    -[UIView setAutoresizingMask:](v22->_underRepsHost, "setAutoresizingMask:", 18);
    -[UIView layer](v22->_underRepsHost, "layer");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setZPosition:", -1.0);

    objc_msgSend(v82, "createView");
    v66 = objc_claimAutoreleasedReturnValue();
    overlayRepsHost = v22->_overlayRepsHost;
    v22->_overlayRepsHost = (UIView *)v66;

    v68 = v22->_overlayRepsHost;
    objc_msgSend(v61, "bounds");
    -[UIView setBounds:](v68, "setBounds:");
    -[UIView setAutoresizingMask:](v22->_overlayRepsHost, "setAutoresizingMask:", 18);
    -[UIView layer](v22->_overlayRepsHost, "layer");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setZPosition:", 1.0);

    -[UIView setTag:](v22->_overlayRepsHost, "setTag:", 45366);
    objc_msgSend(v82, "createView");
    v70 = objc_claimAutoreleasedReturnValue();
    aboveRepsHost = v22->_aboveRepsHost;
    v22->_aboveRepsHost = (UIView *)v70;

    v72 = v22->_aboveRepsHost;
    objc_msgSend(v61, "bounds");
    -[UIView setBounds:](v72, "setBounds:");
    -[UIView setAutoresizingMask:](v22->_aboveRepsHost, "setAutoresizingMask:", 18);
    -[UIView layer](v22->_aboveRepsHost, "layer");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setZPosition:", 2.0);

    -[UIView setTag:](v22->_aboveRepsHost, "setTag:", 45366);
    objc_msgSend(v61, "addSubview:", v22->_underRepsHost);
    objc_msgSend(v61, "addSubview:", v22->_overlayRepsHost);
    objc_msgSend(v61, "addSubview:", v22->_aboveRepsHost);
    -[UIView setUserInteractionEnabled:](v22->_underRepsHost, "setUserInteractionEnabled:", 0);
    -[UIView setUserInteractionEnabled:](v22->_overlayRepsHost, "setUserInteractionEnabled:", 0);
    -[UIView setUserInteractionEnabled:](v22->_aboveRepsHost, "setUserInteractionEnabled:", 0);
    -[UIView layer](v22->_underRepsHost, "layer");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTangierRepDirectLayerHostProvider setUnderRepsLayerHost:](v22->_directLayerHostProvider, "setUnderRepsLayerHost:", v74);

    -[UIView layer](v22->_aboveRepsHost, "layer");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTangierRepDirectLayerHostProvider setAboveRepsLayerHost:](v22->_directLayerHostProvider, "setAboveRepsLayerHost:", v75);

    -[UIView layer](v22->_overlayRepsHost, "layer");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTangierRepDirectLayerHostProvider setOverlayLayerHost:](v22->_directLayerHostProvider, "setOverlayLayerHost:", v76);

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v77 = objc_claimAutoreleasedReturnValue();
    presentedTextViews = v22->_presentedTextViews;
    v22->_presentedTextViews = (NSMutableSet *)v77;

    objc_msgSend(v61, "subviews");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v22->_initialSubviewCount = objc_msgSend(v79, "count");

    -[SXTangierController icc](v22, "icc");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setScrollView:", v88);

    -[SXTangierController updatePresentationState](v22, "updatePresentationState");
    v18 = v23;
    v19 = v24;
  }

  return v22;
}

- (void)updatePresentationState
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  -[SXTangierController viewport](self, "viewport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "appearState");

  if (v4 == 1)
  {
    -[SXTangierController willTransitionToPresented](self, "willTransitionToPresented");
  }
  else
  {
    -[SXTangierController viewport](self, "viewport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "appearState");

    if (v6 == 2)
      -[SXTangierController didTransitionToPresented](self, "didTransitionToPresented");
  }
}

- (void)teardown
{
  void *v3;
  void *v4;
  SXTextTangierInteractiveCanvasController *icc;
  SXTextTangierCanvasViewController *cvc;

  -[SXTangierController icc](self, "icc");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "teardown");

  -[SXTangierController cvc](self, "cvc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "teardown");

  icc = self->_icc;
  self->_icc = 0;

  cvc = self->_cvc;
  self->_cvc = 0;

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SXTangierController;
  -[SXTangierController dealloc](&v2, sel_dealloc);
}

- (void)didStartPresentingTextView:(id)a3
{
  os_unfair_lock_s *p_unfairLock;
  id v5;
  void *v6;
  void *v7;
  id v8;

  p_unfairLock = &self->_unfairLock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  -[SXTangierController presentedTextViews](self, "presentedTextViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);

  os_unfair_lock_unlock(p_unfairLock);
  -[SXTangierController icc](self, "icc");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "canvas");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

}

- (void)didStopPresentingTextView:(id)a3
{
  os_unfair_lock_s *p_unfairLock;
  id v5;
  void *v6;

  p_unfairLock = &self->_unfairLock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  -[SXTangierController presentedTextViews](self, "presentedTextViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v5);

  os_unfair_lock_unlock(p_unfairLock);
}

- (BOOL)selectionEnabled
{
  return -[SXTextTangierCanvasViewController selectionEnabled](self->_cvc, "selectionEnabled");
}

- (void)setSelectionEnabled:(BOOL)a3
{
  -[SXTextTangierCanvasViewController setSelectionEnabled:](self->_cvc, "setSelectionEnabled:", a3);
}

- (BOOL)selectAllEnabled
{
  return -[SXTextTangierCanvasViewController selectionEnabled](self->_cvc, "selectionEnabled");
}

- (void)setSelectAllEnabled:(BOOL)a3
{
  -[SXTextTangierCanvasViewController setSelectAllEnabled:](self->_cvc, "setSelectAllEnabled:", a3);
}

- (void)clearSelection
{
  id v2;

  -[SXTangierController icc](self, "icc");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEditing");

}

- (void)updateCanvasSize:(CGSize)a3 forComponentViews:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[SXTangierController setUnscaledCanvasRect:](self, "setUnscaledCanvasRect:", 0.0, 0.0, width, height);
  -[SXTangierController icc](self, "icc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "canvas");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutIfNeeded");

  if (-[SXTangierController rebuildFlows](self, "rebuildFlows"))
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __58__SXTangierController_updateCanvasSize_forComponentViews___block_invoke;
    v12[3] = &unk_24D68AAE8;
    v13 = v7;
    -[SXTangierController updateInfosWithBlock:](self, "updateInfosWithBlock:", v12);

  }
  -[SXTangierController icc](self, "icc");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "canvas");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutIfNeeded");

  -[SXTangierController _fixLayoutOffsets](self, "_fixLayoutOffsets");
}

void __58__SXTangierController_updateCanvasSize_forComponentViews___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "provideInfosLayoutTo:", v3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)setUnscaledCanvasRect:(CGRect)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;
  void *v15;
  void *v16;

  height = a3.size.height;
  width = a3.size.width;
  -[SXTangierController icc](self, "icc", a3.origin.x, a3.origin.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layerHost");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "canvasLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unscaledSize");
  v10 = v9;
  v12 = v11;

  if (v10 != width || v12 != height)
  {
    self->_preventScrollViewDidScrollReentrance = 1;
    -[SXTangierController icc](self, "icc");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layerHost");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "canvasLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUnscaledSize:", width, height);

    self->_preventScrollViewDidScrollReentrance = 0;
  }
}

- (id)scrollPositionForVisibleBounds:(CGRect)a3 canvasWidth:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;
  SXTextComponentScrollPosition *v13;
  uint64_t v14;
  double v15;
  double v16;
  SXTextComponentScrollPosition *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  void *v45;
  double v46;
  double v47;
  unint64_t v48;
  void *v49;
  unint64_t v50;
  int v51;
  void *v52;
  unint64_t v53;
  char v54;
  CGFloat v55;
  double v56;
  double v57;
  SXTextComponentScrollPosition *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  SXTangierController *v67;
  double v68;
  double v69;
  uint64_t v70;
  SXTextComponentScrollPosition *v71;
  id obj;
  CGFloat rect1;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  uint64_t v79;
  CGRect v80;
  CGRect v81;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v79 = *MEMORY[0x24BDAC8D0];
  -[SXTangierController icc](self, "icc");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  rect1 = width;
  objc_msgSend(v11, "layoutsInRect:", x, y, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v12;
  v13 = (SXTextComponentScrollPosition *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
  if (v13)
  {
    v67 = self;
    v69 = a4;
    v14 = *(_QWORD *)v75;
    v68 = y;
    v15 = y + height * 0.2;
    v16 = height - height * 0.2;
    v70 = *(_QWORD *)v75;
    do
    {
      v17 = 0;
      v71 = v13;
      do
      {
        if (*(_QWORD *)v75 != v14)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)v17);
        objc_msgSend(v18, "info");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "storage");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "flowName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("body"));

        if (v22)
        {
          objc_msgSend(v18, "info");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "columns");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "firstObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "storage");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v23, "range");
          v29 = objc_msgSend(v26, "paragraphIndexRangeForCharRange:", v27, v28);
          v31 = v30;

          v32 = v29 + v31;
          if (v29 < v29 + v31)
          {
            do
            {
              objc_msgSend(v23, "storage");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "textRangeForParagraphAtIndex:", v29);
              v36 = v35;

              objc_msgSend(v25, "glyphRectForRange:includingLabel:", v34, v36, 0);
              v38 = v37;
              v40 = v39;
              v42 = v41;
              v44 = v43;
              objc_msgSend(v18, "geometry");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "frame");
              v47 = v46;

              v48 = v34 - objc_msgSend(v23, "range");
              if (v48 != 0x7FFFFFFFFFFFFFFFLL)
              {
                while (1)
                {
                  objc_msgSend(v25, "storage");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = objc_msgSend(v49, "length");
                  if (v48 >= v50)
                    break;
                  v51 = __66__SXTangierController_scrollPositionForVisibleBounds_canvasWidth___block_invoke(v50, v25, v48);

                  if (!v51)
                    goto LABEL_13;
                  ++v48;
                }

LABEL_13:
                objc_msgSend(v25, "storage");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = objc_msgSend(v52, "length");
                if (v48 >= v53)
                {

                }
                else
                {
                  v54 = __66__SXTangierController_scrollPositionForVisibleBounds_canvasWidth___block_invoke(v53, v25, v48);

                  if ((v54 & 1) == 0)
                  {
                    v55 = v40 + v47;
                    objc_msgSend(v18, "pointForCharacterPosition:", objc_msgSend(v23, "range") + v48);
                    v57 = v56;
                    v80.origin.x = x;
                    v80.origin.y = v15;
                    v80.size.width = rect1;
                    v80.size.height = v16;
                    v81.origin.x = v38;
                    v81.origin.y = v55;
                    v81.size.width = v42;
                    v81.size.height = v44;
                    if (CGRectIntersectsRect(v80, v81))
                    {
                      v58 = [SXTextComponentScrollPosition alloc];
                      -[SXTangierController textRenderCollector](v67, "textRenderCollector");
                      v59 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v59, "componentIdentifierForFlowLayout:", v18);
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v18, "geometry");
                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v61, "frame");
                      v63 = v62 - v68;
                      objc_msgSend(v18, "geometry");
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v64, "frame");
                      v13 = -[SXTextComponentScrollPosition initWithComponentIdentifier:canvasWidth:relativePageOffset:characterIndex:relativeTextOffset:](v58, "initWithComponentIdentifier:canvasWidth:relativePageOffset:characterIndex:relativeTextOffset:", v60, v48, v69, v63, v57 + v65 - v68);

                      goto LABEL_22;
                    }
                  }
                }
              }
              ++v29;
            }
            while (v29 != v32);
          }

          v14 = v70;
          v13 = v71;
        }
        v17 = (SXTextComponentScrollPosition *)((char *)v17 + 1);
      }
      while (v17 != v13);
      v13 = (SXTextComponentScrollPosition *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
    }
    while (v13);
  }
LABEL_22:

  return v13;
}

uint64_t __66__SXTangierController_scrollPositionForVisibleBounds_canvasWidth___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (void *)MEMORY[0x24BDD14A8];
  v5 = a2;
  objc_msgSend(v4, "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "characterIsMember:", objc_msgSend(v7, "characterAtIndex:", a3));
  return v8;
}

- (CGPoint)pointForCharacterAtIndex:(unint64_t)a3 inComponentWithIdentifier:(id)a4
{
  void *v5;
  void *v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  -[SXTangierTextRenderCollector flowLayoutForComponentIdentifier:](self->_textRenderCollector, "flowLayoutForComponentIdentifier:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "range") + a3;

  objc_msgSend(v5, "pointForCharacterPosition:", v7);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (id)topLevelRepsForInteractiveCanvasController:(id)a3
{
  os_unfair_lock_s *p_unfairLock;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock_with_options();
  -[SXTangierController presentedTextViews](self, "presentedTextViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  os_unfair_lock_unlock(p_unfairLock);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "rep", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v13, "rep");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)topLevelLayersForInteractiveCanvasController:(id)a3
{
  os_unfair_lock_s *p_unfairLock;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock_with_options();
  -[SXTangierController presentedTextViews](self, "presentedTextViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  os_unfair_lock_unlock(p_unfairLock);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "rep", (_QWORD)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "textLayer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v13, "rep");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "textLayer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v17);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  return v7;
}

- (CGRect)visibleBounds
{
  void *v2;
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

  -[SXTangierController icc](self, "icc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "canvasView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enclosingScrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

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

- (void)interactiveCanvasController:(id)a3 interactedWithHyperlink:(id)a4 info:(id)a5 range:(_NSRange)a6 touchPoint:(CGPoint)a7 touchAndHold:(BOOL)a8
{
  _BOOL4 v8;
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  v8 = a8;
  length = a6.length;
  location = a6.location;
  v40 = a3;
  v14 = a4;
  v15 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v14;
    objc_msgSend(v15, "directLayerHost");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SXTangierController icc](self, "icc");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "repForInfo:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "glyphRectForRange:includingLabel:", location, length, 0);
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;
      objc_msgSend(v40, "canvasView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "convertRect:toView:", v28, v21, v23, v25, v27);
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;

      -[SXTangierController componentActionHandler](self, "componentActionHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "action");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "canvasView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleAction:sourceView:sourceRect:invocationType:", v38, v39, v8, v30, v32, v34, v36);

    }
  }

}

- (void)interactiveCanvasControllerDidScroll:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  -[SXTangierController icc](self, "icc", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[SXTangierController _fixLayoutOffsets](self, "_fixLayoutOffsets");
  -[SXTangierController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SXTangierController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tangierControllerDidScroll:", self);

  }
  -[SXTangierController icc](self, "icc");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidateVisibleBounds");

}

- (void)interactiveCanvasControllerDidStopScrolling:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[SXTangierController _fixLayoutOffsets](self, "_fixLayoutOffsets", a3);
  -[SXTangierController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SXTangierController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tangierControllerDidStopScrolling:", self);

  }
}

- (void)_fixLayoutOffsets
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SXTangierController icc](self, "icc", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topLevelRepsForHitTesting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v5)
    goto LABEL_10;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v4);
      v7 |= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "updateFromVisualPosition");
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v6);

  if ((v7 & 1) != 0)
  {
    -[SXTangierController icc](self, "icc");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateLayers");
LABEL_10:

  }
}

- (void)interactiveCanvasController:(id)a3 scrollViewWillEndDragging:(id)a4 withVelocity:(CGPoint)a5 targetContentOffset:(CGPoint *)a6
{
  double y;
  double x;
  void *v10;
  char v11;
  void *v12;
  id v13;

  y = a5.y;
  x = a5.x;
  v13 = a4;
  -[SXTangierController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[SXTangierController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tangierController:scrollViewWillEndDragging:withVelocity:targetContentOffset:", self, v13, a6, x, y);

  }
}

- (void)interactiveCanvasController:(id)a3 scrollViewWillBeginDragging:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[SXTangierController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SXTangierController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tangierController:scrollViewWillBeginDragging:", self, v6);

  }
  objc_msgSend(v10, "endUISession");

}

- (void)interactiveCanvasController:(id)a3 scrollViewDidEndDragging:(id)a4 willDecelerate:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v5 = a5;
  v10 = a4;
  -[SXTangierController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SXTangierController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tangierController:scrollViewDidEndDragging:willDecelerate:", self, v10, v5);

  }
  if (!v5)
    -[SXTangierController _fixLayoutOffsets](self, "_fixLayoutOffsets");

}

- (CGRect)interactiveCanvasController:(id)a3 expandVisibleBoundsForTiling:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGRect v9;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = -CGRectGetWidth(a4);
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  return CGRectInset(v9, v8, 0.0);
}

- (void)interactiveCanvasControllerWillStartInteraction:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[SXTangierController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SXTangierController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tangierControllerWillStartScrolling:", self);

  }
}

- (void)interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:(id)a3
{
  if (!-[SXTangierController performedInitialLayoutAndRender](self, "performedInitialLayoutAndRender", a3))
  {
    -[SXTangierController _fixLayoutOffsets](self, "_fixLayoutOffsets");
    -[SXTangierController setPerformedInitialLayoutAndRender:](self, "setPerformedInitialLayoutAndRender:", 1);
  }
}

- (BOOL)interactiveCanvasController:(id)a3 shouldBeginInteraction:(id)a4 atPoint:(CGPoint)a5
{
  double y;
  double x;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;

  y = a5.y;
  x = a5.x;
  if (!-[SXTangierController selectionEnabled](self, "selectionEnabled", a3, a4))
    return 0;
  -[SXTangierController componentController](self, "componentController");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "componentViewForPoint:", x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXTangierController componentInteractionManager](self, "componentInteractionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v10, "hasInteractionForLocation:", x, y);

  v11 = (v8 & 1) == 0
     && (!v9
      || !objc_msgSend(v9, "conformsToProtocol:", &unk_254EF2470)
      || (objc_msgSend(v9, "userInteractable") & 1) == 0);

  return v11;
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (id)interactiveCanvasController:(id)a3 dragItemForSmartField:(id)a4 interaction:(id)a5 session:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  -[SXTangierController dragItemProvider](self, "dragItemProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dragItemForSmartField:interaction:session:", v13, v12, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v10, "endUISession");

  return v15;
}

- (id)interactiveCanvasController:(id)a3 infoForModel:(id)a4 withSelection:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_254F0A928))
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;
  v11 = v7;
  NSClassFromString(CFSTR("TSWPStorage"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v8;
    NSClassFromString(CFSTR("TSWPSelection"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SXTangierTextRenderCollector infoForStorage:selection:](self->_textRenderCollector, "infoForStorage:selection:", v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v13;
    }

  }
  return v10;
}

- (void)updateInfosWithBlock:(id)a3
{
  id v4;
  SXTangierTextRenderCollector *textRenderCollector;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  textRenderCollector = self->_textRenderCollector;
  -[SXTangierController icc](self, "icc");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__SXTangierController_updateInfosWithBlock___block_invoke;
  v8[3] = &unk_24D68AFA0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SXTangierTextRenderCollector buildFlowsAndUpdateInfosWithICC:updateBlock:](textRenderCollector, "buildFlowsAndUpdateInfosWithICC:updateBlock:", v6, v8);

}

uint64_t __44__SXTangierController_updateInfosWithBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
  return result;
}

- (CGRect)interactiveCanvasController:(id)a3 expandVisibleBoundsForClippingReps:(CGRect)a4
{
  return CGRectInset(a4, -a4.size.width, -a4.size.height);
}

- (id)visibleBoundsClipViewForInteractiveCanvasController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (-[SXTangierController disableClippingForTiles](self, "disableClippingForTiles", a3))
  {
    v4 = 0;
  }
  else
  {
    -[SXTangierController icc](self, "icc");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "canvasView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)willTransitionToPresented
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SXTangierController setEnclosingCanvasScrolling:](self, "setEnclosingCanvasScrolling:", 1);
  -[SXTangierController setDisableClippingForTiles:](self, "setDisableClippingForTiles:", 1);
  -[SXTangierController icc](self, "icc");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateVisibleBounds");

  -[SXTangierController icc](self, "icc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layerHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asiOSCVC");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cancelDelayedTapAction");
}

- (void)didTransitionToPresented
{
  id v3;

  -[SXTangierController setEnclosingCanvasScrolling:](self, "setEnclosingCanvasScrolling:", 0);
  -[SXTangierController setDisableClippingForTiles:](self, "setDisableClippingForTiles:", 0);
  -[SXTangierController _fixLayoutOffsets](self, "_fixLayoutOffsets");
  -[SXTangierController icc](self, "icc");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateVisibleBounds");

}

- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5
{
  SXTangierTextRenderCollector *v6;

  if (protocol_isEqual((Protocol *)a4, (Protocol *)&unk_254F68B90))
    v6 = self->_textRenderCollector;
  else
    v6 = 0;
  return v6;
}

- (BOOL)shouldClipToScrollViewBoundsInVisibleBounds
{
  return 1;
}

- (unint64_t)selectableWordLimit
{
  void *v3;
  int v4;
  void *v5;
  unint64_t v6;

  -[SXTangierController config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "limitTextSelectionEnabled");

  if (!v4)
    return 0;
  -[SXTangierController config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(v5, "textSelectionLimit");

  return v6;
}

- (NSString)selectedText
{
  void *v2;
  void *v3;

  -[SXTangierController icc](self, "icc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)layoutDescriptionForComponent:(id)a3
{
  id v4;
  SXTangierTextRenderCollector *textRenderCollector;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  id obj;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  const __CFString *v45;
  id v46;
  _QWORD v47[3];
  _QWORD v48[3];
  _BYTE v49[128];
  uint64_t v50;
  NSRange v51;
  CGRect v52;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v38 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  textRenderCollector = self->_textRenderCollector;
  v35 = v4;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTangierTextRenderCollector flowLayoutForComponentIdentifier:](textRenderCollector, "flowLayoutForComponentIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v34 = v7;
  objc_msgSend(v7, "columns");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v39)
  {
    v37 = *(_QWORD *)v42;
    v10 = CFSTR("bounds");
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v42 != v37)
          objc_enumerationMutation(obj);
        v40 = v11;
        v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "countLines");
        if (v13)
        {
          v14 = v13;
          for (i = 0; i != v14; ++i)
          {
            objc_msgSend(v12, "boundsOfLineFragmentAtIndex:", i);
            v17 = v16;
            v19 = v18;
            v21 = v20;
            v23 = v22;
            v24 = objc_msgSend(v12, "rangeOfLineFragmentAtIndex:", i);
            v26 = v25;
            objc_msgSend(v9, "substringWithRange:", v24, v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v47[0] = v10;
            v52.origin.x = v17;
            v52.origin.y = v19;
            v52.size.width = v21;
            v52.size.height = v23;
            NSStringFromCGRect(v52);
            v28 = v10;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v48[0] = v29;
            v47[1] = CFSTR("range");
            v51.location = v24;
            v51.length = v26;
            NSStringFromRange(v51);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v47[2] = CFSTR("text");
            v48[1] = v30;
            v48[2] = v27;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "addObject:", v31);

            v10 = v28;
          }
        }
        v11 = v40 + 1;
      }
      while (v40 + 1 != v39);
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v39);
  }

  v45 = CFSTR("lineFragments");
  v46 = v38;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (TSKDocumentRoot)documentRoot
{
  return (TSKDocumentRoot *)self->_documentRoot;
}

- (id)backgroundColorForDragUIPlatter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  unint64_t v19;
  double v20;
  void *v21;
  uint64_t v22;

  objc_opt_class();
  -[SXTangierController icc](self, "icc");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editorController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputEditor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TSUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "selection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTangierController textRenderCollector](self, "textRenderCollector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "infoForStorage:selection:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v7, "start");
  if (v11 >= objc_msgSend(v7, "end"))
  {
    v12 = 0;
    v13 = 0.0;
  }
  else
  {
    v12 = 0;
    v13 = 0.0;
    do
    {
      objc_msgSend(v10, "storage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "characterStyleAtCharIndex:effectiveRange:", v11, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "valueForProperty:", 18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "luminance");
        v13 = v13 + v18;
        ++v12;
      }

      ++v11;
    }
    while (v11 < objc_msgSend(v7, "end"));
  }
  if (v12 <= 1)
    v19 = 1;
  else
    v19 = v12;
  v20 = v13 / (double)v19;
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 > 0.5)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v22 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v22;
  }

  return v21;
}

- (BOOL)isEnclosingCanvasScrolling
{
  return self->_enclosingCanvasScrolling;
}

- (void)setEnclosingCanvasScrolling:(BOOL)a3
{
  self->_enclosingCanvasScrolling = a3;
}

- (SXTangierControllerDelegate)delegate
{
  return (SXTangierControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SXTextTangierCanvasViewController)cvc
{
  return self->_cvc;
}

- (SXTextTangierInteractiveCanvasController)icc
{
  return self->_icc;
}

- (BOOL)rebuildFlows
{
  return self->_rebuildFlows;
}

- (void)setRebuildFlows:(BOOL)a3
{
  self->_rebuildFlows = a3;
}

- (unint64_t)initialSubviewCount
{
  return self->_initialSubviewCount;
}

- (void)setInitialSubviewCount:(unint64_t)a3
{
  self->_initialSubviewCount = a3;
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (void)setViewport:(id)a3
{
  objc_storeStrong((id *)&self->_viewport, a3);
}

- (SXScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (SXComponentActionHandler)componentActionHandler
{
  return self->_componentActionHandler;
}

- (SXTangierDragItemProvider)dragItemProvider
{
  return self->_dragItemProvider;
}

- (SXComponentController)componentController
{
  return (SXComponentController *)objc_loadWeakRetained((id *)&self->_componentController);
}

- (SXComponentInteractionManager)componentInteractionManager
{
  return (SXComponentInteractionManager *)objc_loadWeakRetained((id *)&self->_componentInteractionManager);
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXFeatures)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (SXTangierTextRenderCollector)textRenderCollector
{
  return self->_textRenderCollector;
}

- (SXTangierRepDirectLayerHostProvider)directLayerHostProvider
{
  return self->_directLayerHostProvider;
}

- (UIView)underRepsHost
{
  return self->_underRepsHost;
}

- (UIView)aboveRepsHost
{
  return self->_aboveRepsHost;
}

- (UIView)overlayRepsHost
{
  return self->_overlayRepsHost;
}

- (BOOL)preventScrollViewDidScrollReentrance
{
  return self->_preventScrollViewDidScrollReentrance;
}

- (void)setPreventScrollViewDidScrollReentrance:(BOOL)a3
{
  self->_preventScrollViewDidScrollReentrance = a3;
}

- (BOOL)disableClippingForTiles
{
  return self->_disableClippingForTiles;
}

- (void)setDisableClippingForTiles:(BOOL)a3
{
  self->_disableClippingForTiles = a3;
}

- (TSWPSelection)storedSelection
{
  return self->_storedSelection;
}

- (void)setStoredSelection:(id)a3
{
  objc_storeStrong((id *)&self->_storedSelection, a3);
}

- (BOOL)performedInitialLayoutAndRender
{
  return self->_performedInitialLayoutAndRender;
}

- (void)setPerformedInitialLayoutAndRender:(BOOL)a3
{
  self->_performedInitialLayoutAndRender = a3;
}

- (NSMutableSet)presentedTextViews
{
  return self->_presentedTextViews;
}

- (os_unfair_lock_s)unfairLock
{
  return self->_unfairLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedTextViews, 0);
  objc_storeStrong((id *)&self->_storedSelection, 0);
  objc_storeStrong((id *)&self->_overlayRepsHost, 0);
  objc_storeStrong((id *)&self->_aboveRepsHost, 0);
  objc_storeStrong((id *)&self->_underRepsHost, 0);
  objc_storeStrong((id *)&self->_directLayerHostProvider, 0);
  objc_storeStrong((id *)&self->_textRenderCollector, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
  objc_destroyWeak((id *)&self->_componentInteractionManager);
  objc_destroyWeak((id *)&self->_componentController);
  objc_storeStrong((id *)&self->_dragItemProvider, 0);
  objc_storeStrong((id *)&self->_componentActionHandler, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_storeStrong((id *)&self->_icc, 0);
  objc_storeStrong((id *)&self->_cvc, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_documentRoot, 0);
}

@end

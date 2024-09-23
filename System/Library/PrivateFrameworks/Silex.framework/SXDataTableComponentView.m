@implementation SXDataTableComponentView

- (SXDataTableComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 imageViewFactory:(id)a7 componentActionHandler:(id)a8 textComponentLayoutHosting:(id)a9 componentController:(id)a10 adIgnorableViewFactory:(id)a11 config:(id)a12
{
  id v18;
  id v19;
  id v20;
  SXDataTableComponentView *v21;
  SXDataTableComponentView *v22;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a7;
  v26 = a8;
  v18 = a9;
  v19 = a10;
  v25 = a11;
  v20 = a12;
  v28.receiver = self;
  v28.super_class = (Class)SXDataTableComponentView;
  v21 = -[SXComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:](&v28, sel_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_, a3, a4, a5, a6);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_imageViewFactory, a7);
    objc_storeStrong((id *)&v22->_componentActionHandler, a8);
    objc_storeWeak((id *)&v22->_textComponentLayoutHosting, v18);
    objc_storeWeak((id *)&v22->_componentController, v19);
    objc_storeStrong((id *)&v22->_adIgnorableViewFactory, a11);
    objc_storeStrong((id *)&v22->_config, a12);
  }

  return v22;
}

- (void)presentComponentWithChanges:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SXScrollView *v13;
  SXTangierDragItemProvider *v14;
  SXTangierController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SXTangierController *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  SXScrollView *v27;
  SXScrollView *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id *v43;
  void *v44;
  id *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)SXDataTableComponentView;
  -[SXComponentView presentComponentWithChanges:](&v52, sel_presentComponentWithChanges_, *(_QWORD *)&a3.var0 & 0xFFFFFFLL);
  -[SXDataTableComponentView tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SXDataTableComponentView dataTableComponentController](self, "dataTableComponentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "numberOfRows");
    -[SXDataTableComponentView dataTableComponentController](self, "dataTableComponentController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SXDataTableDictionary dataTableDictionaryWithRows:andColumns:](SXDataTableDictionary, "dataTableDictionaryWithRows:andColumns:", v6, objc_msgSend(v7, "numberOfColumns"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableComponentView setTextViews:](self, "setTextViews:", v8);

    -[SXDataTableComponentView dataTableComponentController](self, "dataTableComponentController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "numberOfRows");
    -[SXDataTableComponentView dataTableComponentController](self, "dataTableComponentController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SXDataTableDictionary dataTableDictionaryWithRows:andColumns:](SXDataTableDictionary, "dataTableDictionaryWithRows:andColumns:", v10, objc_msgSend(v11, "numberOfColumns"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableComponentView setImageViews:](self, "setImageViews:", v12);

    v13 = objc_alloc_init(SXScrollView);
    v14 = objc_alloc_init(SXTangierDragItemProvider);
    v15 = [SXTangierController alloc];
    -[SXComponentView viewport](self, "viewport");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableComponentView componentActionHandler](self, "componentActionHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableComponentView componentController](self, "componentController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableComponentView adIgnorableViewFactory](self, "adIgnorableViewFactory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableComponentView config](self, "config");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[SXTangierController initWithViewport:scrollView:componentActionHandler:dragItemProvider:componentController:componentInteractionManager:DOMObjectProvider:adIgnorableViewFactory:config:](v15, "initWithViewport:scrollView:componentActionHandler:dragItemProvider:componentController:componentInteractionManager:DOMObjectProvider:adIgnorableViewFactory:config:", v16, v13, v17, v14, v18, 0, v19, v20, v21);
    -[SXDataTableComponentView setTangierController:](self, "setTangierController:", v22);

    -[SXDataTableComponentView tangierController](self, "tangierController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDelegate:", self);

    -[SXComponentView presentationDelegate](self, "presentationDelegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "textSelectionManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableComponentView tangierController](self, "tangierController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addTextSelecting:", v26);

    v27 = [SXScrollView alloc];
    v28 = -[SXScrollView initWithFrame:](v27, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[SXDataTableComponentView setScrollView:](self, "setScrollView:", v28);

    -[SXDataTableComponentView scrollView](self, "scrollView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableComponentView tangierController](self, "tangierController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "cvc");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v32);

    -[SXDataTableComponentView scrollView](self, "scrollView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableComponentView tangierController](self, "tangierController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "icc");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setDelegate:", v35);

    v36 = -[SXDataTableView initWithDataSource:]((id *)[SXDataTableView alloc], self);
    -[SXDataTableComponentView setTableView:](self, "setTableView:", v36);

    -[SXDataTableComponentView tangierController](self, "tangierController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "cvc");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableComponentView tableView](self, "tableView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addSubview:", v40);

    -[SXComponentView contentView](self, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableComponentView scrollView](self, "scrollView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addSubview:", v42);

  }
  -[SXDataTableComponentView tableView](self, "tableView");
  v43 = (id *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentView dataTableComponentController](self, "dataTableComponentController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableView setDataSource:](v43, v44);

  -[SXDataTableComponentView tableView](self, "tableView");
  v45 = (id *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentView blueprint](self, "blueprint");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableView setBlueprint:](v45, v46);

  -[SXDataTableComponentView scrollView](self, "scrollView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView contentFrame](self, "contentFrame");
  objc_msgSend(v47, "setFrame:");

  -[SXDataTableComponentView scrollView](self, "scrollView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentView tableView](self, "tableView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bounds");
  objc_msgSend(v48, "setContentSize:", v50, v51);

  -[SXDataTableComponentView setupShadowsIfNeeded](self, "setupShadowsIfNeeded");
  -[SXDataTableComponentView updateTangierController](self, "updateTangierController");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SXDataTableComponentView tangierController](self, "tangierController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "teardown");

  v4.receiver = self;
  v4.super_class = (Class)SXDataTableComponentView;
  -[SXComponentView dealloc](&v4, sel_dealloc);
}

- (void)receivedInfo:(id)a3 fromLayoutingPhaseWithIdentifier:(id)a4
{
  id v7;
  id v8;
  int *v9;
  objc_super v10;

  v7 = a3;
  v8 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SXDataTableComponentView;
  -[SXComponentView receivedInfo:fromLayoutingPhaseWithIdentifier:](&v10, sel_receivedInfo_fromLayoutingPhaseWithIdentifier_, v7, v8);
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("blueprint")) & 1) != 0)
  {
    v9 = &OBJC_IVAR___SXDataTableComponentView__blueprint;
LABEL_5:
    objc_storeStrong((id *)((char *)&self->super.super.super.super.isa + *v9), a3);
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("component_controller")))
  {
    v9 = &OBJC_IVAR___SXDataTableComponentView__dataTableComponentController;
    goto LABEL_5;
  }
LABEL_6:

}

- (id)dataTableView:(id)a3 viewForCellAtIndexPath:(id)a4 constraintToSize:(CGSize)a5
{
  double height;
  double width;
  unint64_t var1;
  unint64_t var0;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  SXTextView *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;

  height = a5.height;
  width = a5.width;
  var1 = a4.var1;
  var0 = a4.var0;
  -[SXDataTableComponentView dataTableComponentController](self, "dataTableComponentController", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cellObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForIndexPath:", var0, var1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SXDataTableComponentView dataTableComponentController](self, "dataTableComponentController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textLayouters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForIndexPath:", var0, var1);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "boundingSize");
    v17 = v16;
    -[SXDataTableComponentView textViews](self, "textViews");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForIndexPath:", var0, var1);
    v19 = (SXTextView *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v19 = -[SXTextView initWithFrame:]([SXTextView alloc], "initWithFrame:", 0.0, 0.0, width, v17);
      -[SXDataTableComponentView textViews](self, "textViews");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setObject:forIndexPath:", v19, var0, var1);

      -[SXDataTableComponentView tangierController](self, "tangierController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "didStartPresentingTextView:", v19);

    }
    -[SXTextView setFrame:](v19, "setFrame:", 0.0, 0.0, width, v17);
    -[SXTextView setTextLayouter:](v19, "setTextLayouter:", v15);
LABEL_17:

    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v12;
    -[SXDataTableComponentView descriptorForIndexPath:](self, "descriptorForIndexPath:", var0, var1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "format");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "maximumWidth");
    if (v22)
    {
      -[SXComponentView unitConverter](self, "unitConverter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v21, "maximumWidth");
      objc_msgSend(v23, "convertValueToPoints:", v24, v25);
      v27 = v26;

      if (width >= v27)
        width = v27;
    }
    objc_msgSend(v21, "maximumHeight");
    if (v28)
    {
      -[SXComponentView unitConverter](self, "unitConverter");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v21, "maximumHeight");
      objc_msgSend(v29, "convertValueToPoints:", v30, v31);
      v33 = v32;

      if (height >= v33)
        height = v33;
    }
    -[SXDataTableComponentView imageViews](self, "imageViews");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForIndexPath:", var0, var1);
    v19 = (SXTextView *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      -[SXDataTableComponentView imageViewFactory](self, "imageViewFactory");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "imageViewForResource:", v15);
      v19 = (SXTextView *)objc_claimAutoreleasedReturnValue();

      -[SXTextView addInterestInImageQuality:forObject:](v19, "addInterestInImageQuality:forObject:", 0, self);
      -[SXDataTableComponentView imageViews](self, "imageViews");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forIndexPath:", v19, var0, var1);

    }
    objc_msgSend(v15, "sizeThatFits:", width, height);
    -[SXTextView setFrame:](v19, "setFrame:", 0.0, 0.0, v37, v38);
    -[SXTextView bounds](v19, "bounds");
    -[SXTextView setPreferredImageSize:](v19, "setPreferredImageSize:", v39, v40);

    goto LABEL_17;
  }
  v19 = 0;
LABEL_18:

  return v19;
}

- (void)updateTangierController
{
  void *v3;
  void *v4;
  double Width;
  void *v6;
  void *v7;
  _QWORD v8[5];
  CGRect v9;
  CGRect v10;

  -[SXDataTableComponentView tangierController](self, "tangierController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentView tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  Width = CGRectGetWidth(v9);
  -[SXDataTableComponentView tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v3, "setUnscaledCanvasRect:", 0.0, 0.0, Width, CGRectGetHeight(v10));

  -[SXDataTableComponentView tangierController](self, "tangierController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__SXDataTableComponentView_updateTangierController__block_invoke;
  v8[3] = &unk_24D68AAE8;
  v8[4] = self;
  objc_msgSend(v7, "updateInfosWithBlock:", v8);

}

void __51__SXDataTableComponentView_updateTangierController__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "blueprint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfRows");

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableView blueprint]((uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfColumns");

  objc_msgSend(*(id *)(a1 + 32), "component");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "dataOrientation");

  if (v9)
  {
    v10 = v15;
    if (v7)
    {
      for (i = 0; i != v7; ++i)
      {
        if (v4)
        {
          for (j = 0; j != v4; ++j)
          {
            objc_msgSend(*(id *)(a1 + 32), "addTextStorageForIndexPath:toCollectior:", j, i, v15);
            v10 = v15;
          }
        }
      }
    }
  }
  else
  {
    v10 = v15;
    if (v4)
    {
      for (k = 0; k != v4; ++k)
      {
        if (v7)
        {
          for (m = 0; m != v7; ++m)
          {
            objc_msgSend(*(id *)(a1 + 32), "addTextStorageForIndexPath:toCollectior:", k, m, v15);
            v10 = v15;
          }
        }
      }
    }
  }

}

- (void)addTextStorageForIndexPath:(id)a3 toCollectior:(id)a4
{
  unint64_t var1;
  unint64_t var0;
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
  id v17;

  var1 = a3.var1;
  var0 = a3.var0;
  v17 = a4;
  -[SXDataTableComponentView textViews](self, "textViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForIndexPath:", var0, var1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXDataTableComponentView dataTableComponentController](self, "dataTableComponentController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textLayouters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForIndexPath:", var0, var1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && v11)
  {
    objc_msgSend(v11, "wpStorage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "wpLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView component](self, "component");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{row: %lu, column: %lu}"), var0, var1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addTextStorage:withLayout:forNamedFlow:directLayerHostView:selectable:componentIdentifier:", v12, v13, v15, v8, 1, v16);

  }
}

- (BOOL)userInteractable
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  char v18;

  v6 = a4;
  objc_msgSend(a3, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  -[SXDataTableComponentView tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SXDataTableView indexPathForPoint:]((uint64_t)v12, v9, v11);
  v15 = v14;

  if (v15 == -1 && v13 == -1)
    return 0;
  -[SXDataTableComponentView dataTableComponentController](self, "dataTableComponentController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "indexPathIsHeader:", v13, v15);

  return v18;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)setupShadowsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double Width;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  CGFloat v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  CGFloat v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  -[SXDataTableComponentView leftShadow](self, "leftShadow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[SXDataTableComponentView rightShadow](self, "rightShadow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_5;
  }
  -[SXDataTableComponentView leftShadow](self, "leftShadow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperlayer");

  -[SXDataTableComponentView rightShadow](self, "rightShadow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperlayer");

LABEL_5:
  -[SXDataTableComponentView scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentSize");
  v9 = v8;
  -[SXDataTableComponentView scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  Width = CGRectGetWidth(v60);

  if (v9 > Width)
  {
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableComponentView setLeftShadow:](self, "setLeftShadow:", v12);

    -[SXDataTableComponentView leftShadow](self, "leftShadow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v13, "setBackgroundColor:", objc_msgSend(v14, "CGColor"));

    -[SXDataTableComponentView leftShadow](self, "leftShadow");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableComponentView scrollView](self, "scrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v17 = CGRectGetMinX(v61) + -4.0;
    -[SXDataTableComponentView scrollView](self, "scrollView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    objc_msgSend(v15, "setFrame:", v17, 0.0, 0.0, CGRectGetHeight(v62));

    -[SXDataTableComponentView leftShadow](self, "leftShadow");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BDF6870];
    -[SXDataTableComponentView scrollView](self, "scrollView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    objc_msgSend(v20, "bezierPathWithRect:", 1.0, -4.0, 1.0, CGRectGetHeight(v63) + 8.0);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v19, "setShadowPath:", objc_msgSend(v22, "CGPath"));

    -[SXDataTableComponentView leftShadow](self, "leftShadow");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v23, "setShadowColor:", objc_msgSend(v24, "CGColor"));

    -[SXDataTableComponentView leftShadow](self, "leftShadow");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setShadowRadius:", 3.0);

    -[SXDataTableComponentView leftShadow](self, "leftShadow");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = 1.0;
    objc_msgSend(v26, "setShadowOpacity:", v27);

    -[SXDataTableComponentView leftShadow](self, "leftShadow");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setShadowOffset:", 0.0, 0.0);

    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v59 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v59, "setBackgroundColor:", objc_msgSend(v29, "CGColor"));

    -[SXDataTableComponentView scrollView](self, "scrollView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    objc_msgSend(v59, "setFrame:", 4.0, -8.0, 16.0, CGRectGetHeight(v64) + 16.0);

    -[SXDataTableComponentView leftShadow](self, "leftShadow");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setMask:", v59);

    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableComponentView setRightShadow:](self, "setRightShadow:", v32);

    -[SXDataTableComponentView rightShadow](self, "rightShadow");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v33, "setBackgroundColor:", objc_msgSend(v34, "CGColor"));

    -[SXDataTableComponentView rightShadow](self, "rightShadow");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableComponentView scrollView](self, "scrollView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bounds");
    v37 = CGRectGetWidth(v65) + 4.0;
    -[SXDataTableComponentView scrollView](self, "scrollView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bounds");
    objc_msgSend(v35, "setFrame:", v37, 0.0, 0.0, CGRectGetHeight(v66));

    -[SXDataTableComponentView rightShadow](self, "rightShadow");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x24BDF6870];
    -[SXDataTableComponentView scrollView](self, "scrollView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "bounds");
    objc_msgSend(v40, "bezierPathWithRect:", -1.0, -4.0, 1.0, CGRectGetHeight(v67) + 8.0);
    v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v39, "setShadowPath:", objc_msgSend(v42, "CGPath"));

    -[SXDataTableComponentView rightShadow](self, "rightShadow");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v43, "setShadowColor:", objc_msgSend(v44, "CGColor"));

    -[SXDataTableComponentView rightShadow](self, "rightShadow");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setShadowRadius:", 3.0);

    -[SXDataTableComponentView rightShadow](self, "rightShadow");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v47) = 1.0;
    objc_msgSend(v46, "setShadowOpacity:", v47);

    -[SXDataTableComponentView rightShadow](self, "rightShadow");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setShadowOffset:", 0.0, 0.0);

    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v49, "setBackgroundColor:", objc_msgSend(v50, "CGColor"));

    -[SXDataTableComponentView scrollView](self, "scrollView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bounds");
    objc_msgSend(v49, "setFrame:", -20.0, -8.0, 16.0, CGRectGetHeight(v68) + 16.0);

    -[SXDataTableComponentView rightShadow](self, "rightShadow");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setMask:", v49);

    -[SXDataTableComponentView updateShadowOpacity](self, "updateShadowOpacity");
    -[SXComponentView contentView](self, "contentView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "layer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableComponentView leftShadow](self, "leftShadow");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addSublayer:", v55);

    -[SXComponentView contentView](self, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "layer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableComponentView rightShadow](self, "rightShadow");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "addSublayer:", v58);

  }
}

- (void)updateShadowOpacity
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  float v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  float v23;
  double v24;
  void *v25;
  double v26;
  id v27;
  CGRect v28;

  -[SXDataTableComponentView scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v6 = 0.0;
  if (v4 <= 0.0)
    v7 = 0.0;
  else
    v7 = 1.0;

  -[SXDataTableComponentView scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentOffset");
  v10 = v9;
  -[SXDataTableComponentView scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v12 = v10 + CGRectGetWidth(v28);
  -[SXDataTableComponentView scrollView](self, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentSize");
  v15 = v14;
  if (v12 < v14)
    v6 = 1.0;

  -[SXDataTableComponentView leftShadow](self, "leftShadow");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "opacity");
  v18 = v17;

  if (v7 != v18)
  {
    -[SXDataTableComponentView leftShadow](self, "leftShadow");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    LODWORD(v21) = 0;
    if (v5 > 0.0)
      *(float *)&v21 = 1.0;
    objc_msgSend(v19, "setOpacity:", v21);

  }
  -[SXDataTableComponentView rightShadow](self, "rightShadow");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "opacity");
  v24 = v23;

  if (v6 != v24)
  {
    -[SXDataTableComponentView rightShadow](self, "rightShadow");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v25;
    LODWORD(v26) = 0;
    if (v12 < v15)
      *(float *)&v26 = 1.0;
    objc_msgSend(v25, "setOpacity:", v26);

  }
}

- (id)contentViewForBehavior:(id)a3
{
  id v4;
  SXDataTableComponentView *v5;
  SXDataTableComponentView *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "windowed")
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[SXComponentView fillView](self, "fillView");
    v5 = (SXDataTableComponentView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self;
  }
  v6 = v5;

  return v6;
}

- (id)descriptorForIndexPath:(id)a3
{
  unint64_t var1;
  unint64_t var0;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  var1 = a3.var1;
  var0 = a3.var0;
  -[SXComponentView component](self, "component");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "dataOrientation"))
    var1 = var0;

  -[SXComponentView component](self, "component");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "descriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", var1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (SXImageViewFactory)imageViewFactory
{
  return self->_imageViewFactory;
}

- (SXComponentActionHandler)componentActionHandler
{
  return self->_componentActionHandler;
}

- (SXTextComponentLayoutHosting)textComponentLayoutHosting
{
  return (SXTextComponentLayoutHosting *)objc_loadWeakRetained((id *)&self->_textComponentLayoutHosting);
}

- (SXComponentController)componentController
{
  return (SXComponentController *)objc_loadWeakRetained((id *)&self->_componentController);
}

- (SXAdIgnorableViewFactory)adIgnorableViewFactory
{
  return self->_adIgnorableViewFactory;
}

- (SXDataTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (SXDataTableComponentController)dataTableComponentController
{
  return self->_dataTableComponentController;
}

- (void)setDataTableComponentController:(id)a3
{
  objc_storeStrong((id *)&self->_dataTableComponentController, a3);
}

- (SXDataTableBlueprint)blueprint
{
  return self->_blueprint;
}

- (void)setBlueprint:(id)a3
{
  objc_storeStrong((id *)&self->_blueprint, a3);
}

- (SXDataTableDictionary)textViews
{
  return self->_textViews;
}

- (void)setTextViews:(id)a3
{
  objc_storeStrong((id *)&self->_textViews, a3);
}

- (SXDataTableDictionary)imageViews
{
  return self->_imageViews;
}

- (void)setImageViews:(id)a3
{
  objc_storeStrong((id *)&self->_imageViews, a3);
}

- (SXScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (SXTangierController)tangierController
{
  return self->_tangierController;
}

- (void)setTangierController:(id)a3
{
  objc_storeStrong((id *)&self->_tangierController, a3);
}

- (CALayer)rightShadow
{
  return self->_rightShadow;
}

- (void)setRightShadow:(id)a3
{
  objc_storeStrong((id *)&self->_rightShadow, a3);
}

- (CALayer)leftShadow
{
  return self->_leftShadow;
}

- (void)setLeftShadow:(id)a3
{
  objc_storeStrong((id *)&self->_leftShadow, a3);
}

- (SXFeatures)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_leftShadow, 0);
  objc_storeStrong((id *)&self->_rightShadow, 0);
  objc_storeStrong((id *)&self->_tangierController, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_textViews, 0);
  objc_storeStrong((id *)&self->_blueprint, 0);
  objc_storeStrong((id *)&self->_dataTableComponentController, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_adIgnorableViewFactory, 0);
  objc_destroyWeak((id *)&self->_componentController);
  objc_destroyWeak((id *)&self->_textComponentLayoutHosting);
  objc_storeStrong((id *)&self->_componentActionHandler, 0);
  objc_storeStrong((id *)&self->_imageViewFactory, 0);
}

@end

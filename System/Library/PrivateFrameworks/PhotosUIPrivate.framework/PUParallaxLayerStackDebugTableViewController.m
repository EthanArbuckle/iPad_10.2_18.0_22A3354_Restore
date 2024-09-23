@implementation PUParallaxLayerStackDebugTableViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUParallaxLayerStackDebugTableViewController;
  -[PUParallaxLayerStackDebugTableViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[PUParallaxLayerStackDebugTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("layerCell"));

  -[PUParallaxLayerStackDebugTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setAllowsReorderingWhenNotEditing:", 1);

}

- (void)setLayerStackView:(id)a3
{
  PUParallaxLayerStackView *v5;
  void *v6;
  PUParallaxLayerStackView *v7;

  v5 = (PUParallaxLayerStackView *)a3;
  if (self->_layerStackView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_layerStackView, a3);
    -[PUParallaxLayerStackDebugTableViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

    v5 = v7;
  }

}

- (id)labelForLayer:(id)a3
{
  return (id)objc_msgSend(a3, "identifier");
}

- (id)layersSortedByViewDepth
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  -[PUParallaxLayerStackDebugTableViewController layerStackView](self, "layerStackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "viewManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLayerStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__PUParallaxLayerStackDebugTableViewController_layersSortedByViewDepth__block_invoke;
  v10[3] = &unk_1E58A8E78;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "sortedArrayUsingComparator:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)layerForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[PUParallaxLayerStackDebugTableViewController layersSortedByViewDepth](self, "layersSortedByViewDepth");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");

  objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[PUParallaxLayerStackDebugTableViewController layerStackView](self, "layerStackView", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentLayerStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("layerCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugTableViewController layerStackView](self, "layerStackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "viewManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugTableViewController layerForIndexPath:](self, "layerForIndexPath:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v12;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;

  v15 = v13;
  v36 = v10;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;

  objc_msgSend(v11, "viewForLayer:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v16;
  if (v14)
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithIOSurface:", CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v14, "image")));
  }
  else
  {
    if (!v16)
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("video"));
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;
  objc_msgSend(v8, "setImage:", v18);

LABEL_14:
  objc_msgSend(v8, "imageProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMaximumSize:", 90.0, 120.0);

  v21 = objc_msgSend(v17, "isHidden");
  v22 = &stru_1E58AD278;
  if (v21)
    v22 = CFSTR("🚫 ");
  v23 = v22;
  -[PUParallaxLayerStackDebugTableViewController labelForLayer:](self, "labelForLayer:", v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingString:](v23, "stringByAppendingString:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setText:", v25);
  v26 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v17, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "zPosition");
  objc_msgSend(v26, "stringWithFormat:", CFSTR("Z: %g"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSecondaryText:", v29);

  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textProperties");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setColor:", v30);

    objc_msgSend(MEMORY[0x1E0DC34D8], "listPlainCellConfiguration");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setBackgroundColor:", v33);

  }
  else
  {
    v32 = 0;
  }
  objc_msgSend(v7, "setContentConfiguration:", v8);
  objc_msgSend(v7, "setBackgroundConfiguration:", v32);

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 120.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[PUParallaxLayerStackDebugTableViewController layerStackView](self, "layerStackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "viewManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugTableViewController layerForIndexPath:](self, "layerForIndexPath:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewForLayer:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", objc_msgSend(v12, "isHidden") ^ 1);
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reconfigureRowsAtIndexPaths:", v13);

  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x1E0DC36B8];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __106__PUParallaxLayerStackDebugTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
  v13[3] = &unk_1E58A8EA0;
  objc_copyWeak(&v15, &location);
  v10 = v8;
  v14 = v10;
  objc_msgSend(v9, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

- (void)requestNewZPositionForCellAtIndexPath:(id)a3
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
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  PUParallaxLayerStackDebugTableViewController *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  v4 = a3;
  -[PUParallaxLayerStackDebugTableViewController layerStackView](self, "layerStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "viewManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugTableViewController layerForIndexPath:](self, "layerForIndexPath:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewForLayer:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC3450];
  -[PUParallaxLayerStackDebugTableViewController labelForLayer:](self, "labelForLayer:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v11, CFSTR("Z position:"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v12);
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __86__PUParallaxLayerStackDebugTableViewController_requestNewZPositionForCellAtIndexPath___block_invoke;
  v22[3] = &unk_1E58A8EC8;
  v14 = v9;
  v23 = v14;
  objc_msgSend(v12, "addTextFieldWithConfigurationHandler:", v22);
  v15 = (void *)MEMORY[0x1E0DC3448];
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __86__PUParallaxLayerStackDebugTableViewController_requestNewZPositionForCellAtIndexPath___block_invoke_2;
  v18[3] = &unk_1E58A8EF0;
  objc_copyWeak(&v21, &location);
  v16 = v14;
  v19 = v16;
  v20 = self;
  objc_msgSend(v15, "actionWithTitle:style:handler:", CFSTR("OK"), 0, v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v17);

  -[PUParallaxLayerStackDebugTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&location);
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  unint64_t v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  dispatch_time_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD block[4];
  id v49;
  id v50;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v9, "isEqual:", v10) & 1) == 0)
  {
    v45 = v8;
    -[PUParallaxLayerStackDebugTableViewController layerStackView](self, "layerStackView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "viewManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUParallaxLayerStackDebugTableViewController layerForIndexPath:](self, "layerForIndexPath:", v9);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "viewForLayer:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUParallaxLayerStackDebugTableViewController layerForIndexPath:](self, "layerForIndexPath:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "viewForLayer:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUParallaxLayerStackDebugTableViewController layersSortedByViewDepth](self, "layersSortedByViewDepth");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "indexOfObject:", v15);
    v46 = v14;
    objc_msgSend(v14, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "zPosition");
    v21 = v20;
    objc_msgSend(v16, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "zPosition");
    v24 = v23;

    v47 = v12;
    if (v21 >= v24)
    {
      v33 = v18 + 1;
      if (v33 < objc_msgSend(v17, "count"))
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", v33);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "viewForLayer:", v25);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "layer");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "zPosition");
        v37 = v36;
        objc_msgSend(v34, "layer");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "zPosition");
        v32 = (v37 + v39) * 0.5;

        goto LABEL_10;
      }
      objc_msgSend(v16, "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "zPosition");
      v41 = -5.0;
    }
    else
    {
      if (v18)
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", v18 - 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "viewForLayer:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "layer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "zPosition");
        v29 = v28;
        objc_msgSend(v26, "layer");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "zPosition");
        v32 = (v29 + v31) * 0.5;

LABEL_10:
        v8 = v45;

        objc_msgSend(v46, "layer");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setZPosition:", v32);

        v43 = dispatch_time(0, 250000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __89__PUParallaxLayerStackDebugTableViewController_tableView_moveRowAtIndexPath_toIndexPath___block_invoke;
        block[3] = &unk_1E58ABCA8;
        v49 = v45;
        v50 = v10;
        dispatch_after(v43, MEMORY[0x1E0C80D38], block);

        goto LABEL_11;
      }
      objc_msgSend(v16, "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "zPosition");
      v41 = 5.0;
    }
    v32 = v40 + v41;
    goto LABEL_10;
  }
LABEL_11:

}

- (PUParallaxLayerStackView)layerStackView
{
  return self->_layerStackView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerStackView, 0);
}

void __89__PUParallaxLayerStackDebugTableViewController_tableView_moveRowAtIndexPath_toIndexPath___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reconfigureRowsAtIndexPaths:", v2);

}

void __86__PUParallaxLayerStackDebugTableViewController_requestNewZPositionForCellAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zPosition");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%g"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v6);

}

void __86__PUParallaxLayerStackDebugTableViewController_requestNewZPositionForCellAtIndexPath___block_invoke_2(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "textFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "doubleValue");
  v7 = v6;
  objc_msgSend(a1[4], "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setZPosition:", v7);

  objc_msgSend(a1[5], "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadData");

  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, 0);

}

id __106__PUParallaxLayerStackDebugTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.stack.3d.down.right"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __106__PUParallaxLayerStackDebugTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
  v14 = &unk_1E58A9FA8;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  v15 = *(id *)(a1 + 32);
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", CFSTR("Change Z Position"), v5, 0, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC39D0];
  v17[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1, v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "menuWithChildren:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v16);
  return v9;
}

void __106__PUParallaxLayerStackDebugTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "requestNewZPositionForCellAtIndexPath:", *(_QWORD *)(a1 + 32));

}

uint64_t __71__PUParallaxLayerStackDebugTableViewController_layersSortedByViewDepth__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "viewForLayer:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewForLayer:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "zPosition");
  v11 = v10;

  objc_msgSend(v8, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "zPosition");
  v14 = v13;

  if (v11 <= v14)
    v15 = 1;
  else
    v15 = -1;

  return v15;
}

@end

@implementation PUParallaxLayerStackDebugPaletteViewController

- (PUParallaxLayerStackDebugPaletteViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUParallaxLayerStackDebugPaletteViewController;
  return -[PUParallaxLayerStackDebugPaletteViewController initWithNibName:bundle:](&v3, sel_initWithNibName_bundle_, 0, 0);
}

- (void)addSwitchableView:(id)a3
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUParallaxLayerStackDebugPaletteViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v4, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugPaletteViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "safeAreaLayoutGuide");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  objc_msgSend(v4, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugPaletteViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "safeAreaLayoutGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v15;
  objc_msgSend(v4, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugPaletteViewController switchControl](self, "switchControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v9;
  objc_msgSend(v4, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugPaletteViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v14);

  objc_msgSend(v4, "setHidden:", 1);
}

- (void)viewDidLoad
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
  PUParallaxLayerStackDebugPaletteView *v18;
  void *v19;
  PUParallaxLayerStackDebugPaletteView *v20;
  void *v21;
  PUParallaxLayerStackDebugPaletteView *v22;
  void *v23;
  PUParallaxLayerStackDebugPaletteView *v24;
  void *v25;
  PUParallaxLayerStackDebugPaletteView *v26;
  void *v27;
  PUParallaxLayerStackDebugPaletteView *v28;
  void *v29;
  PUParallaxLayerStackDebugPaletteView *v30;
  void *v31;
  PUParallaxLayerStackDebugPaletteView *v32;
  void *v33;
  PUParallaxLayerStackDebugPaletteView *v34;
  void *v35;
  PUParallaxLayerStackDebugPaletteView *v36;
  void *v37;
  PUParallaxLayerStackDebugPaletteView *v38;
  void *v39;
  PUParallaxLayerStackDebugPaletteView *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_super v49;
  _QWORD v50[3];

  v50[2] = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)PUParallaxLayerStackDebugPaletteViewController;
  -[PUParallaxLayerStackDebugPaletteViewController viewDidLoad](&v49, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", &unk_1E59BA468);
  -[PUParallaxLayerStackDebugPaletteViewController setSwitchControl:](self, "setSwitchControl:", v3);

  -[PUParallaxLayerStackDebugPaletteViewController switchControl](self, "switchControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedSegmentIndex:", 0);

  -[PUParallaxLayerStackDebugPaletteViewController switchControl](self, "switchControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_modeChanged_, 4096);

  -[PUParallaxLayerStackDebugPaletteViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugPaletteViewController switchControl](self, "switchControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  -[PUParallaxLayerStackDebugPaletteViewController switchControl](self, "switchControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v45 = (void *)MEMORY[0x1E0CB3718];
  -[PUParallaxLayerStackDebugPaletteViewController switchControl](self, "switchControl");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "centerXAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugPaletteViewController view](self, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v10;
  -[PUParallaxLayerStackDebugPaletteViewController switchControl](self, "switchControl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugPaletteViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeAreaLayoutGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v15, 20.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "activateConstraints:", v17);

  v18 = [PUParallaxLayerStackDebugPaletteView alloc];
  objc_msgSend(MEMORY[0x1E0D71218], "colorBGPalette");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PUParallaxLayerStackDebugPaletteView initWithColorPalette:](v18, "initWithColorPalette:", v19);
  -[PUParallaxLayerStackDebugPaletteViewController setColorBGPaletteView:](self, "setColorBGPaletteView:", v20);

  -[PUParallaxLayerStackDebugPaletteViewController colorBGPaletteView](self, "colorBGPaletteView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugPaletteViewController addSwitchableView:](self, "addSwitchableView:", v21);

  v22 = [PUParallaxLayerStackDebugPaletteView alloc];
  objc_msgSend(MEMORY[0x1E0D71218], "colorWashSinglePalette");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[PUParallaxLayerStackDebugPaletteView initWithColorPalette:](v22, "initWithColorPalette:", v23);
  -[PUParallaxLayerStackDebugPaletteViewController setColorWashSinglePaletteView:](self, "setColorWashSinglePaletteView:", v24);

  -[PUParallaxLayerStackDebugPaletteViewController colorWashSinglePaletteView](self, "colorWashSinglePaletteView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugPaletteViewController addSwitchableView:](self, "addSwitchableView:", v25);

  v26 = [PUParallaxLayerStackDebugPaletteView alloc];
  objc_msgSend(MEMORY[0x1E0D71218], "colorWashDuotonePalette");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[PUParallaxLayerStackDebugPaletteView initWithColorPalette:](v26, "initWithColorPalette:", v27);
  -[PUParallaxLayerStackDebugPaletteViewController setColorWashDuotonePaletteView:](self, "setColorWashDuotonePaletteView:", v28);

  -[PUParallaxLayerStackDebugPaletteViewController colorWashDuotonePaletteView](self, "colorWashDuotonePaletteView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugPaletteViewController addSwitchableView:](self, "addSwitchableView:", v29);

  v30 = [PUParallaxLayerStackDebugPaletteView alloc];
  objc_msgSend(MEMORY[0x1E0D71218], "greenScreenMutedPalette");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[PUParallaxLayerStackDebugPaletteView initWithColorPalette:](v30, "initWithColorPalette:", v31);
  -[PUParallaxLayerStackDebugPaletteViewController setGreenScreenMutedPaletteView:](self, "setGreenScreenMutedPaletteView:", v32);

  -[PUParallaxLayerStackDebugPaletteViewController greenScreenMutedPaletteView](self, "greenScreenMutedPaletteView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugPaletteViewController addSwitchableView:](self, "addSwitchableView:", v33);

  v34 = [PUParallaxLayerStackDebugPaletteView alloc];
  objc_msgSend(MEMORY[0x1E0D71218], "greenScreenVibrantPalette");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[PUParallaxLayerStackDebugPaletteView initWithColorPalette:](v34, "initWithColorPalette:", v35);
  -[PUParallaxLayerStackDebugPaletteViewController setGreenScreenVibrantPaletteView:](self, "setGreenScreenVibrantPaletteView:", v36);

  -[PUParallaxLayerStackDebugPaletteViewController greenScreenVibrantPaletteView](self, "greenScreenVibrantPaletteView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugPaletteViewController addSwitchableView:](self, "addSwitchableView:", v37);

  v38 = [PUParallaxLayerStackDebugPaletteView alloc];
  objc_msgSend(MEMORY[0x1E0D71218], "customPalette");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[PUParallaxLayerStackDebugPaletteView initWithColorPalette:](v38, "initWithColorPalette:", v39);
  -[PUParallaxLayerStackDebugPaletteViewController setCustomPaletteView:](self, "setCustomPaletteView:", v40);

  -[PUParallaxLayerStackDebugPaletteViewController customPaletteView](self, "customPaletteView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugPaletteViewController addSwitchableView:](self, "addSwitchableView:", v41);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugPaletteViewController view](self, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setBackgroundColor:", v42);

  -[PUParallaxLayerStackDebugPaletteViewController switchControl](self, "switchControl");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugPaletteViewController modeChanged:](self, "modeChanged:", v44);

}

- (void)modeChanged:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  uint64_t v15;
  id v16;

  v4 = a3;
  v5 = objc_msgSend(v4, "selectedSegmentIndex") != 0;
  -[PUParallaxLayerStackDebugPaletteViewController colorBGPaletteView](self, "colorBGPaletteView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5);

  v7 = objc_msgSend(v4, "selectedSegmentIndex") != 1;
  -[PUParallaxLayerStackDebugPaletteViewController colorWashSinglePaletteView](self, "colorWashSinglePaletteView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v7);

  v9 = objc_msgSend(v4, "selectedSegmentIndex") != 2;
  -[PUParallaxLayerStackDebugPaletteViewController colorWashDuotonePaletteView](self, "colorWashDuotonePaletteView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v9);

  v11 = objc_msgSend(v4, "selectedSegmentIndex") != 3;
  -[PUParallaxLayerStackDebugPaletteViewController greenScreenMutedPaletteView](self, "greenScreenMutedPaletteView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", v11);

  v13 = objc_msgSend(v4, "selectedSegmentIndex") != 4;
  -[PUParallaxLayerStackDebugPaletteViewController greenScreenVibrantPaletteView](self, "greenScreenVibrantPaletteView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", v13);

  v15 = objc_msgSend(v4, "selectedSegmentIndex");
  -[PUParallaxLayerStackDebugPaletteViewController customPaletteView](self, "customPaletteView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", v15 != 5);

}

- (UISegmentedControl)switchControl
{
  return self->_switchControl;
}

- (void)setSwitchControl:(id)a3
{
  objc_storeStrong((id *)&self->_switchControl, a3);
}

- (PUParallaxLayerStackDebugPaletteView)colorBGPaletteView
{
  return self->_colorBGPaletteView;
}

- (void)setColorBGPaletteView:(id)a3
{
  objc_storeStrong((id *)&self->_colorBGPaletteView, a3);
}

- (PUParallaxLayerStackDebugPaletteView)colorWashSinglePaletteView
{
  return self->_colorWashSinglePaletteView;
}

- (void)setColorWashSinglePaletteView:(id)a3
{
  objc_storeStrong((id *)&self->_colorWashSinglePaletteView, a3);
}

- (PUParallaxLayerStackDebugPaletteView)colorWashDuotonePaletteView
{
  return self->_colorWashDuotonePaletteView;
}

- (void)setColorWashDuotonePaletteView:(id)a3
{
  objc_storeStrong((id *)&self->_colorWashDuotonePaletteView, a3);
}

- (PUParallaxLayerStackDebugPaletteView)greenScreenMutedPaletteView
{
  return self->_greenScreenMutedPaletteView;
}

- (void)setGreenScreenMutedPaletteView:(id)a3
{
  objc_storeStrong((id *)&self->_greenScreenMutedPaletteView, a3);
}

- (PUParallaxLayerStackDebugPaletteView)greenScreenVibrantPaletteView
{
  return self->_greenScreenVibrantPaletteView;
}

- (void)setGreenScreenVibrantPaletteView:(id)a3
{
  objc_storeStrong((id *)&self->_greenScreenVibrantPaletteView, a3);
}

- (PUParallaxLayerStackDebugPaletteView)customPaletteView
{
  return self->_customPaletteView;
}

- (void)setCustomPaletteView:(id)a3
{
  objc_storeStrong((id *)&self->_customPaletteView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customPaletteView, 0);
  objc_storeStrong((id *)&self->_greenScreenVibrantPaletteView, 0);
  objc_storeStrong((id *)&self->_greenScreenMutedPaletteView, 0);
  objc_storeStrong((id *)&self->_colorWashDuotonePaletteView, 0);
  objc_storeStrong((id *)&self->_colorWashSinglePaletteView, 0);
  objc_storeStrong((id *)&self->_colorBGPaletteView, 0);
  objc_storeStrong((id *)&self->_switchControl, 0);
}

@end

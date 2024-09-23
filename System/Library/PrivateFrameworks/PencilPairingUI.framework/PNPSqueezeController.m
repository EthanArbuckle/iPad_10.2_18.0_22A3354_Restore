@implementation PNPSqueezeController

+ (id)_controllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6
{
  id v8;
  PNPSqueezeController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PNPSqueezeController *v14;

  v8 = a6;
  v9 = [PNPSqueezeController alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SQUEEZE_TITLE"), &stru_24F4E5CD0, CFSTR("PencilPairingSqueeze-B532"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SQUEEZE_DESCRIPTION"), &stru_24F4E5CD0, CFSTR("PencilPairingSqueeze-B532"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PNPSqueezeController initWithTitle:detailText:icon:](v9, "initWithTitle:detailText:icon:", v11, v13, 0);

  -[PNPWelcomeController setControllerType:buttonType:deviceType:delegate:](v14, "setControllerType:buttonType:deviceType:delegate:", a3, a4, a5, v8);
  return v14;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PNPSqueezeController toolPicker](self, "toolPicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PNPSqueezeController;
  -[PNPSqueezeController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PNPSqueezeController;
  -[OBBaseWelcomeController viewDidLoad](&v23, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x24BDE3378]);
  -[PNPSqueezeController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v5 = (void *)objc_msgSend(v3, "initWithFrame:");

  objc_msgSend(v5, "setAutoresizingMask:", 18);
  objc_msgSend(v5, "setDrawingPolicy:", 2);
  -[PNPSqueezeController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v5);

  -[PNPSqueezeController setCanvasView:](self, "setCanvasView:", v5);
  -[PNPSqueezeController canvasView](self, "canvasView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPSqueezeController canvasView](self, "canvasView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  v10 = objc_alloc_init(MEMORY[0x24BDE33F8]);
  -[PNPSqueezeController setToolPicker:](self, "setToolPicker:", v10);

  -[PNPSqueezeController toolPicker](self, "toolPicker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPSqueezeController canvasView](self, "canvasView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setVisible:forFirstResponder:", 0, v12);

  -[PNPSqueezeController toolPicker](self, "toolPicker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:", self);

  -[PNPSqueezeController loadSqueezeAnimationLayer](self, "loadSqueezeAnimationLayer");
  -[PNPSqueezeController pencilLayer](self, "pencilLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", 1);

  -[PNPSqueezeController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPSqueezeController pencilLayer](self, "pencilLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSublayer:", v17);

  v18 = objc_alloc(MEMORY[0x24BDE33B8]);
  v19 = *MEMORY[0x24BDE3450];
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithInkType:color:", v19, v20);
  -[PNPSqueezeController toolPicker](self, "toolPicker");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSelectedTool:", v21);

}

- (void)toolPickerSelectedToolDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "selectedTool");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PNPSqueezeController canvasView](self, "canvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTool:", v5);

}

- (void)toolPickerVisibilityDidChange:(id)a3
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
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "isVisible")
    && !-[PNPSqueezeController pencilLayerHiddenByInteraction](self, "pencilLayerHiddenByInteraction"))
  {
    -[PNPSqueezeController toolPicker](self, "toolPicker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_paletteView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAutoHideEnabled:", 1);

    -[PNPSqueezeController toolPicker](self, "toolPicker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PNPSqueezeController canvasView](self, "canvasView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setVisible:forFirstResponder:", 1, v8);

    -[PNPSqueezeController toolPicker](self, "toolPicker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectedTool");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PNPSqueezeController canvasView](self, "canvasView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTool:", v10);

    -[PNPSqueezeController setPencilLayerHiddenByInteraction:](self, "setPencilLayerHiddenByInteraction:", 1);
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", 0.25);
    objc_initWeak(&location, self);
    v12 = (void *)MEMORY[0x24BDE57D8];
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __54__PNPSqueezeController_toolPickerVisibilityDidChange___block_invoke;
    v16 = &unk_24F4E56C8;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v12, "setCompletionBlock:", &v13);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit", v13, v14, v15, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

void __54__PNPSqueezeController_toolPickerVisibilityDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  double v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "pencilLayer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setHidden:", 1);

    objc_msgSend(v5, "pencilLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = 1.0;
    objc_msgSend(v3, "setOpacity:", v4);

    WeakRetained = v5;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PNPSqueezeController;
  -[PNPSqueezeController viewWillAppear:](&v14, sel_viewWillAppear_, a3);
  v4 = objc_alloc_init(MEMORY[0x24BDE3380]);
  -[PNPSqueezeController canvasView](self, "canvasView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDrawing:", v4);

  -[PNPSqueezeController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPSqueezeController pencilLayer](self, "pencilLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  objc_msgSend(v6, "bounds");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  CGAffineTransformMakeScale(&v13, 0.5, 0.5);
  v12 = v13;
  objc_msgSend(v7, "setAffineTransform:", &v12);
  objc_msgSend(v7, "setPosition:", v9 * 0.5, v11 * 0.5);
  objc_msgSend(v7, "setHidden:", 0);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PNPSqueezeController;
  -[OBBaseWelcomeController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[PNPSqueezeController canvasView](self, "canvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  -[PNPSqueezeController canvasView](self, "canvasView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "becomeFirstResponder");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PNPSqueezeController;
  -[PNPSqueezeController viewWillDisappear:](&v11, sel_viewWillDisappear_, a3);
  -[PNPSqueezeController canvasView](self, "canvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

  v5 = (void *)MEMORY[0x24BDE33C8];
  -[PNPSqueezeController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_existingInteractionForWindowScene:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PNPSqueezeController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PNPPreDeclare squeezeInteraction:setMiniPaletteVisible:hoverLocation:inView:](PNPPreDeclare, "squeezeInteraction:setMiniPaletteVisible:hoverLocation:inView:", v9, 0, v10, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

}

- (void)loadSqueezeAnimationLayer
{
  void *v3;
  void *v4;
  id v5;

  -[PNPSqueezeController loadSqueezeAnimationPackage](self, "loadSqueezeAnimationPackage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPSqueezeController setPencilLayer:](self, "setPencilLayer:", v3);

  -[PNPSqueezeController pencilLayer](self, "pencilLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGeometryFlipped:", 1);

}

- (id)loadSqueezeAnimationPackage
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("welcomeSqueezePane-B532"), CFSTR("caar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x24BDE5D48];
  v9 = 0;
  objc_msgSend(MEMORY[0x24BDE5718], "packageWithContentsOfURL:type:options:error:", v3, v4, 0, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v6)
  {
    v7 = os_log_create("com.apple.pencilpairingui", ");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl(&dword_22ACC1000, v7, OS_LOG_TYPE_DEFAULT, "Error getting squeeze animation package: %@", buf, 0xCu);
    }

  }
  return v5;
}

- (CALayer)pencilLayer
{
  return self->_pencilLayer;
}

- (void)setPencilLayer:(id)a3
{
  objc_storeStrong((id *)&self->_pencilLayer, a3);
}

- (PKCanvasView)canvasView
{
  return self->_canvasView;
}

- (void)setCanvasView:(id)a3
{
  objc_storeStrong((id *)&self->_canvasView, a3);
}

- (PKToolPicker)toolPicker
{
  return self->_toolPicker;
}

- (void)setToolPicker:(id)a3
{
  objc_storeStrong((id *)&self->_toolPicker, a3);
}

- (CGPoint)paletteHoverLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_paletteHoverLocation.x;
  y = self->_paletteHoverLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPaletteHoverLocation:(CGPoint)a3
{
  self->_paletteHoverLocation = a3;
}

- (BOOL)pencilLayerHiddenByInteraction
{
  return self->_pencilLayerHiddenByInteraction;
}

- (void)setPencilLayerHiddenByInteraction:(BOOL)a3
{
  self->_pencilLayerHiddenByInteraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolPicker, 0);
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_storeStrong((id *)&self->_pencilLayer, 0);
}

@end

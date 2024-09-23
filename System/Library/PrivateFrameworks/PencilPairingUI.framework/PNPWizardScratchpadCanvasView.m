@implementation PNPWizardScratchpadCanvasView

- (void)layoutSubviews
{
  PKCanvasView *canvasView;
  PKCanvasView *v4;
  double v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)PNPWizardScratchpadCanvasView;
  -[PNPWizardScratchpadCanvasView layoutSubviews](&v17, sel_layoutSubviews);
  canvasView = self->_canvasView;
  -[PNPWizardScratchpadCanvasView bounds](self, "bounds");
  -[PKCanvasView setFrame:](canvasView, "setFrame:");
  v4 = self->_canvasView;
  if (-[PNPWizardScratchpadCanvasView showingSnapshot](self, "showingSnapshot"))
    v5 = 0.0;
  else
    v5 = 1.0;
  -[PKCanvasView setAlpha:](v4, "setAlpha:", v5);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_snapshotImageViews;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        -[PNPWizardScratchpadCanvasView bounds](self, "bounds", (_QWORD)v13);
        objc_msgSend(v11, "setFrame:");
        if (-[PNPWizardScratchpadCanvasView showingSnapshot](self, "showingSnapshot"))
          v12 = 1.0;
        else
          v12 = 0.0;
        objc_msgSend(v11, "setAlpha:", v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v8);
  }

}

- (void)_playClearAnimationWithImage:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  PKCanvasView *canvasView;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PNPWizardScratchpadCanvasView *v13;
  _QWORD v14[5];

  v4 = (objc_class *)MEMORY[0x24BDF6AE8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithImage:", v5);

  -[NSMutableArray addObject:](self->_snapshotImageViews, "addObject:", v6);
  -[PNPWizardScratchpadCanvasView addSubview:](self, "addSubview:", v6);
  -[PNPWizardScratchpadCanvasView setShowingSnapshot:](self, "setShowingSnapshot:", 1);
  canvasView = self->_canvasView;
  v8 = (void *)objc_opt_new();
  -[PKCanvasView setDrawing:](canvasView, "setDrawing:", v8);

  -[PNPWizardScratchpadCanvasView layoutIfNeeded](self, "layoutIfNeeded");
  v9 = (void *)MEMORY[0x24BDF6F90];
  v13 = self;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __62__PNPWizardScratchpadCanvasView__playClearAnimationWithImage___block_invoke;
  v14[3] = &unk_24F4E50A0;
  v14[4] = self;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__PNPWizardScratchpadCanvasView__playClearAnimationWithImage___block_invoke_2;
  v11[3] = &unk_24F4E5298;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v14, v11);

}

uint64_t __62__PNPWizardScratchpadCanvasView__playClearAnimationWithImage___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setShowingSnapshot:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __62__PNPWizardScratchpadCanvasView__playClearAnimationWithImage___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 416), "removeObject:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
}

- (void)clearDrawingAnimated
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  -[PNPWizardScratchpadCanvasView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[PNPWizardScratchpadCanvasView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v9 = v8;

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE33A8]), "initWithSize:scale:", v4, v6, v9);
  -[PNPWizardScratchpadCanvasView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInvertColors:", objc_msgSend(v11, "userInterfaceStyle") == 2);

  -[PKCanvasView drawing](self->_canvasView, "drawing");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__PNPWizardScratchpadCanvasView_clearDrawingAnimated__block_invoke;
  v13[3] = &unk_24F4E5300;
  v13[4] = self;
  objc_msgSend(v10, "renderDrawing:completion:", v12, v13);

}

void __53__PNPWizardScratchpadCanvasView_clearDrawingAnimated__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__PNPWizardScratchpadCanvasView_clearDrawingAnimated__block_invoke_2;
  v5[3] = &unk_24F4E5270;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __53__PNPWizardScratchpadCanvasView_clearDrawingAnimated__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_playClearAnimationWithImage:", *(_QWORD *)(a1 + 40));
}

- (void)setInk:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_ink, a3);
  v5 = a3;
  -[PKCanvasView setInk:](self->_canvasView, "setInk:", v5);

}

- (PKInk)ink
{
  return self->_ink;
}

- (void)setDelegate:(id)a3
{
  PKCanvasViewDelegate **p_canvasViewDelegate;
  id v5;

  p_canvasViewDelegate = &self->_canvasViewDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_canvasViewDelegate, v5);
  -[PKCanvasView setDelegate:](self->_canvasView, "setDelegate:", v5);

}

- (PKCanvasViewDelegate)delegate
{
  return (PKCanvasViewDelegate *)objc_loadWeakRetained((id *)&self->_canvasViewDelegate);
}

- (UIGestureRecognizer)drawingGestureRecognizer
{
  return -[PKCanvasView drawingGestureRecognizer](self->_canvasView, "drawingGestureRecognizer");
}

- (void)setShowingSnapshot:(BOOL)a3
{
  self->_showingSnapshot = a3;
  -[PNPWizardScratchpadCanvasView setNeedsLayout](self, "setNeedsLayout");
}

- (PNPWizardScratchpadCanvasView)initWithFrame:(CGRect)a3
{
  PNPWizardScratchpadCanvasView *v3;
  uint64_t v4;
  NSMutableArray *snapshotImageViews;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PNPWizardScratchpadCanvasView;
  v3 = -[PNPWizardScratchpadCanvasView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = objc_claimAutoreleasedReturnValue();
  snapshotImageViews = v3->_snapshotImageViews;
  v3->_snapshotImageViews = (NSMutableArray *)v4;

  return v3;
}

- (void)prepareCanvasView
{
  PKCanvasView *v3;
  PKCanvasView *canvasView;
  PKCanvasView *v5;
  id WeakRetained;

  if (!self->_canvasView)
  {
    v3 = (PKCanvasView *)objc_alloc_init(MEMORY[0x24BDE3378]);
    canvasView = self->_canvasView;
    self->_canvasView = v3;

    -[PKCanvasView setOpaque:](self->_canvasView, "setOpaque:", 0);
    -[PNPWizardScratchpadCanvasView addSubview:](self, "addSubview:", self->_canvasView);
    -[PKCanvasView setInk:](self->_canvasView, "setInk:", self->_ink);
    v5 = self->_canvasView;
    WeakRetained = objc_loadWeakRetained((id *)&self->_canvasViewDelegate);
    -[PKCanvasView setDelegate:](v5, "setDelegate:", WeakRetained);

  }
}

- (PKCanvasView)canvasView
{
  return self->_canvasView;
}

- (BOOL)showingSnapshot
{
  return self->_showingSnapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_destroyWeak((id *)&self->_canvasViewDelegate);
  objc_storeStrong((id *)&self->_ink, 0);
  objc_storeStrong((id *)&self->_snapshotImageViews, 0);
}

@end

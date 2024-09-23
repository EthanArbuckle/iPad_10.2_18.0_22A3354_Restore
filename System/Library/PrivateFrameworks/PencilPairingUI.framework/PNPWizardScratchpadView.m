@implementation PNPWizardScratchpadView

- (void)layoutSubviews
{
  UIView *backgroundView;
  PNPWizardScratchpadCanvasView *canvasView;
  PNPWizardScratchpadCanvasView *fingerDrawingCanvasView;
  UIView *v6;
  void *v7;
  UIView *toolsBackgroundPillView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CAShapeLayer *frameLayer;
  CAShapeLayer *v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  PNPWizardScratchpadToast *toastView;
  _BOOL4 v59;
  double v60;
  uint64_t v61;
  id v62;
  double v63;
  double v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  backgroundView = self->_backgroundView;
  -[PNPWizardScratchpadView bounds](self, "bounds");
  -[UIView setFrame:](backgroundView, "setFrame:");
  canvasView = self->_canvasView;
  -[PNPWizardScratchpadView bounds](self, "bounds");
  -[PNPWizardScratchpadCanvasView setFrame:](canvasView, "setFrame:");
  fingerDrawingCanvasView = self->_fingerDrawingCanvasView;
  -[PNPWizardScratchpadView bounds](self, "bounds");
  -[PNPWizardScratchpadCanvasView setFrame:](fingerDrawingCanvasView, "setFrame:");
  v6 = self->_backgroundView;
  objc_msgSend(MEMORY[0x24BDF6950], "scratchpadBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

  toolsBackgroundPillView = self->_toolsBackgroundPillView;
  objc_msgSend(MEMORY[0x24BDF6950], "toolBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](toolsBackgroundPillView, "setBackgroundColor:", v9);

  -[UIView setAlpha:](self->_toolsBackgroundPillView, "setAlpha:", 0.91);
  v10 = (void *)MEMORY[0x24BDF6870];
  -[PNPWizardScratchpadView bounds](self, "bounds");
  objc_msgSend(v10, "bezierPathWithRect:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDF6870];
  -[PNPWizardScratchpadView bounds](self, "bounds");
  objc_msgSend(v12, "bezierPathWithRoundedRect:cornerRadius:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bezierPathByReversingPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendPath:", v14);

  frameLayer = self->_frameLayer;
  v62 = objc_retainAutorelease(v11);
  -[CAShapeLayer setPath:](frameLayer, "setPath:", objc_msgSend(v62, "CGPath"));
  v16 = self->_frameLayer;
  objc_msgSend(MEMORY[0x24BDF6950], "platterContainerColor");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](v16, "setFillColor:", objc_msgSend(v17, "CGColor"));

  -[NSMutableArray firstObject](self->_inkViews, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "intrinsicContentSize");
  v20 = v19;

  v21 = -[NSMutableArray count](self->_inkViews, "count");
  v22 = -[NSMutableArray count](self->_inkViews, "count");
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  if (-[NSMutableArray count](self->_inkViews, "count"))
  {
    v27 = 0;
    v63 = v20 + 16.0;
    v64 = v20 * (double)v21 + ((double)v22 + -1.0) * 16.0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_inkViews, "objectAtIndex:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PNPWizardScratchpadView bounds](self, "bounds");
      v30 = v29 + -30.0;
      +[PNPWizardScratchpadInkView preferredHeight](PNPWizardScratchpadInkView, "preferredHeight");
      v32 = v31;
      v33 = v30 - v31;
      objc_msgSend(v28, "intrinsicContentSize");
      v35 = v34 + 16.0;
      -[PNPWizardScratchpadView bounds](self, "bounds");
      v37 = v63 * (double)v27 + (v36 - v64) * 0.5;
      objc_msgSend(v28, "setFrame:", v37, v33, v35, v32);
      v65.origin.x = x;
      v65.origin.y = y;
      v65.size.width = width;
      v65.size.height = height;
      if (CGRectIsNull(v65))
      {
        height = v32;
        width = v35;
        y = v33;
        x = v37;
      }
      else
      {
        v66.origin.x = x;
        v66.origin.y = y;
        v66.size.width = width;
        v66.size.height = height;
        v68.origin.x = v37;
        v68.origin.y = v33;
        v68.size.width = v35;
        v68.size.height = v32;
        v67 = CGRectUnion(v66, v68);
        x = v67.origin.x;
        y = v67.origin.y;
        width = v67.size.width;
        height = v67.size.height;
      }

      ++v27;
    }
    while (v27 < (unint64_t)-[NSMutableArray count](self->_inkViews, "count"));
  }
  UIRectInset();
  UIRectInset();
  -[UIView setFrame:](self->_toolsBackgroundPillView, "setFrame:");
  -[UIView _setContinuousCornerRadius:](self->_toolsBackgroundPillView, "_setContinuousCornerRadius:", 12.0);
  -[PNPWizardScratchpadView _selectedInkView](self, "_selectedInkView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPWizardInkWeightControl intrinsicContentSize](self->_inkWeightControl, "intrinsicContentSize");
  objc_msgSend(v38, "frame");
  UIRectCenteredXInRect();
  v40 = v39;
  v42 = v41;
  v44 = v43;
  if (self->_inkWeightControlVisible)
    v45 = 19.0;
  else
    v45 = 9.0;
  objc_msgSend(v38, "frame");
  -[PNPWizardInkWeightControl setFrame:](self->_inkWeightControl, "setFrame:", v40, v46 - (v44 + v45), v42, v44);
  v47 = 0.8;
  if (!self->_inkWeightControlVisible)
    v47 = 0.0;
  -[PNPWizardInkWeightControl setAlpha:](self->_inkWeightControl, "setAlpha:", v47);
  -[PNPWizardScratchpadToast intrinsicContentSize](self->_toastView, "intrinsicContentSize");
  -[PNPWizardScratchpadView bounds](self, "bounds");
  -[PNPWizardScratchpadView traitCollection](self, "traitCollection");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "displayScale");
  v61 = v49;
  UIRectCenteredIntegralRectScale();
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v57 = v56;

  -[PNPWizardScratchpadToast setFrame:](self->_toastView, "setFrame:", v51, v53, v55, v57, v61);
  toastView = self->_toastView;
  v59 = -[PNPWizardScratchpadView showingToast](self, "showingToast");
  v60 = 1.0;
  if (!v59)
    v60 = 0.0;
  -[PNPWizardScratchpadToast setAlpha:](toastView, "setAlpha:", v60);

}

- (CGPoint)pointForFirstTool
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[NSMutableArray firstObject](self->_inkViews, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PNPWizardScratchpadView convertRect:fromView:](self, "convertRect:fromView:", v3);
  UIRectGetCenter();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)_animateLayoutChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];

  v4 = a3;
  -[PNPWizardScratchpadView setNeedsLayout](self, "setNeedsLayout");
  v5 = (void *)MEMORY[0x24BDF6F90];
  v8 = v4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__PNPWizardScratchpadView__animateLayoutChange___block_invoke;
  v9[3] = &unk_24F4E50A0;
  v9[4] = self;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__PNPWizardScratchpadView__animateLayoutChange___block_invoke_2;
  v7[3] = &unk_24F4E5240;
  v6 = v4;
  objc_msgSend(v5, "_animateUsingDefaultTimingWithOptions:animations:completion:", 4, v9, v7);

}

uint64_t __48__PNPWizardScratchpadView__animateLayoutChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __48__PNPWizardScratchpadView__animateLayoutChange___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_animateInkChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];

  v4 = a3;
  -[PNPWizardScratchpadView setNeedsLayout](self, "setNeedsLayout");
  v5 = (void *)MEMORY[0x24BDF6F90];
  v8 = v4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__PNPWizardScratchpadView__animateInkChange___block_invoke;
  v9[3] = &unk_24F4E50A0;
  v9[4] = self;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__PNPWizardScratchpadView__animateInkChange___block_invoke_2;
  v7[3] = &unk_24F4E5240;
  v6 = v4;
  objc_msgSend(v5, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v9, v7, 0.475, 0.0, 0.8, 0.0);

}

uint64_t __45__PNPWizardScratchpadView__animateInkChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __45__PNPWizardScratchpadView__animateInkChange___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_animateAdjustmentSliderAppearance:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  double v19;

  v4 = a3;
  -[PNPWizardScratchpadView setNeedsLayout](self, "setNeedsLayout");
  v19 = 0.0;
  v17 = 0u;
  v18 = 0u;
  PNPWizardScratchpadOpacitySliderAnimationParameters((uint64_t)&v17);
  v5 = objc_alloc(MEMORY[0x24BDF69A0]);
  v6 = (void *)objc_msgSend(v5, "initWithControlPoint1:controlPoint2:", v17, v18);
  v7 = objc_alloc(MEMORY[0x24BDF6FA8]);
  v8 = (void *)objc_msgSend(v7, "initWithDuration:timingParameters:", v6, v19);
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __62__PNPWizardScratchpadView__animateAdjustmentSliderAppearance___block_invoke;
  v16[3] = &unk_24F4E50A0;
  v16[4] = self;
  objc_msgSend(v8, "addAnimations:", v16);
  v11 = v9;
  v12 = 3221225472;
  v13 = __62__PNPWizardScratchpadView__animateAdjustmentSliderAppearance___block_invoke_2;
  v14 = &unk_24F4E55F0;
  v15 = v4;
  v10 = v4;
  objc_msgSend(v8, "addCompletion:", &v11);
  objc_msgSend(v8, "startAnimation", v11, v12, v13, v14);

}

uint64_t __62__PNPWizardScratchpadView__animateAdjustmentSliderAppearance___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __62__PNPWizardScratchpadView__animateAdjustmentSliderAppearance___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)eventSource:(id)a3 hadPencilDoubleTapped:(id)a4
{
  void *v5;
  void *v6;
  int64_t previousMarkingToolIndex;
  void (**v8)(void);

  v8 = (void (**)(void))a4;
  -[PNPWizardScratchpadView _selectedInk](self, "_selectedInk");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == (void *)*MEMORY[0x24BDE3430])
  {
    previousMarkingToolIndex = self->_previousMarkingToolIndex;
  }
  else
  {
    self->_previousMarkingToolIndex = self->_selectedInkIndex;
    previousMarkingToolIndex = -[NSMutableArray count](self->_inkViews, "count") - 1;
  }
  -[PNPWizardScratchpadView _selectInkAtIndex:](self, "_selectInkAtIndex:", previousMarkingToolIndex);
  -[PNPWizardScratchpadView _animateLayoutChange:](self, "_animateLayoutChange:", 0);
  if (v8)
    v8[2]();

}

- (void)_deselectAllInks
{
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_inkViews, "enumerateObjectsUsingBlock:", &__block_literal_global_4);
}

uint64_t __43__PNPWizardScratchpadView__deselectAllInks__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelected:", 0);
}

- (void)_selectInkAtIndex:(int64_t)a3
{
  void *v5;
  PNPWizardScratchpadCanvasView *canvasView;
  id v7;

  if (!self->_isDrawing)
  {
    -[PNPWizardScratchpadView _deselectAllInks](self, "_deselectAllInks");
    self->_selectedInkIndex = a3;
    -[NSMutableArray objectAtIndex:](self->_inkViews, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelected:", 1);

    canvasView = self->_canvasView;
    -[PNPWizardScratchpadView _selectedInk](self, "_selectedInk");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PNPWizardScratchpadCanvasView setInk:](canvasView, "setInk:", v7);

  }
}

- (id)_selectedInkView
{
  NSMutableArray *inkViews;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  inkViews = self->_inkViews;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__PNPWizardScratchpadView__selectedInkView__block_invoke;
  v5[3] = &unk_24F4E5658;
  v5[4] = &v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](inkViews, "enumerateObjectsUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__PNPWizardScratchpadView__selectedInkView__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "selected"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)_selectedInk
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PNPWizardScratchpadView _selectedInkView](self, "_selectedInkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPWizardInkWeightControl value](self->_inkWeightControl, "value");
  BSIntervalValueForFraction();
  v6 = v5;
  v7 = (void *)MEMORY[0x24BDE33B0];
  objc_msgSend(v4, "identifier", 0xBFF0000000000000, 1, 0x3FF0000000000000, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inkWithIdentifier:color:weight:", v8, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_inkViewPressed:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSMutableArray indexOfObject:](self->_inkViews, "indexOfObject:", v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    objc_msgSend(v13, "locationInView:", v4);
    v7 = objc_msgSend(v4, "pointInside:withEvent:", 0);
    objc_msgSend(v4, "setPressed:", 0);
    if (objc_msgSend(v13, "state") == 1 || objc_msgSend(v13, "state") == 2)
    {
      objc_msgSend(v4, "setPressed:", v7);
      if (objc_msgSend(v13, "state") == 3)
        v8 = v7;
      else
        v8 = 0;
      if ((v8 & 1) == 0)
      {
LABEL_16:
        -[PNPWizardScratchpadView _animateInkChange:](self, "_animateInkChange:", 0);
LABEL_17:
        -[PNPWizardScratchpadView delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "scratchPadViewHadInteractionEvent:", self);

        goto LABEL_18;
      }
    }
    else
    {
      if (objc_msgSend(v13, "state") == 3)
        v9 = v7;
      else
        v9 = 0;
      if (v9 != 1)
        goto LABEL_17;
    }
    -[PNPWizardScratchpadView _selectedInk](self, "_selectedInk");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v11, "isEqual:", *MEMORY[0x24BDE3430]) & 1) == 0)
      self->_previousMarkingToolIndex = self->_selectedInkIndex;
    -[PNPWizardScratchpadView _selectInkAtIndex:](self, "_selectInkAtIndex:", v6);

    goto LABEL_16;
  }
LABEL_18:

}

- (BOOL)_viewIsPartOfStylusCanvasView:(id)a3
{
  PNPWizardScratchpadCanvasView *v4;
  BOOL v5;

  v4 = (PNPWizardScratchpadCanvasView *)a3;
  v5 = (-[PNPWizardScratchpadCanvasView containsView:](self->_canvasView, "containsView:", v4) & 1) != 0
    || self->_canvasView == v4;

  return v5;
}

- (void)_showToastNotificationWithInitialAnimation
{
  _QWORD v3[5];

  -[PNPWizardScratchpadView _initializeToastViewIfNecessary](self, "_initializeToastViewIfNecessary");
  -[PNPWizardScratchpadView setShowingToast:](self, "setShowingToast:", 0);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __69__PNPWizardScratchpadView__showToastNotificationWithInitialAnimation__block_invoke;
  v3[3] = &unk_24F4E50A0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 4, v3, 0, 0.3, 0.0);
}

uint64_t __69__PNPWizardScratchpadView__showToastNotificationWithInitialAnimation__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setShowingToast:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_initializeToastViewIfNecessary
{
  PNPWizardScratchpadToast *v3;
  PNPWizardScratchpadToast *toastView;
  void *v5;
  id v6;

  if (!self->_toastView)
  {
    v3 = objc_alloc_init(PNPWizardScratchpadToast);
    toastView = self->_toastView;
    self->_toastView = v3;

  }
  PencilPairingUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("USE_APPLE_PENCIL_PROMPT"), &stru_24F4E5CD0, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PNPWizardScratchpadToast setText:](self->_toastView, "setText:", v6);
}

- (void)_showToastNotificationAndAnimateStrokeAway
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  _QWORD v7[6];
  _QWORD v8[3];
  BOOL v9;

  -[PNPWizardScratchpadView _initializeToastViewIfNecessary](self, "_initializeToastViewIfNecessary");
  -[PNPWizardScratchpadView setShowingToast:](self, "setShowingToast:", 1);
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  -[PNPWizardScratchpadCanvasView canvasView](self->_canvasView, "canvasView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "drawing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_visibleStrokes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  v9 = v6;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__PNPWizardScratchpadView__showToastNotificationAndAnimateStrokeAway__block_invoke;
  v7[3] = &unk_24F4E5680;
  v7[4] = self;
  v7[5] = v8;
  -[PNPWizardScratchpadView _animateLayoutChange:](self, "_animateLayoutChange:", v7);
  _Block_object_dispose(v8, 8);
}

void __69__PNPWizardScratchpadView__showToastNotificationAndAnimateStrokeAway__block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[4];
  __int128 v4;

  v2 = dispatch_time(0, 500000000);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __69__PNPWizardScratchpadView__showToastNotificationAndAnimateStrokeAway__block_invoke_2;
  v3[3] = &unk_24F4E5680;
  v4 = *(_OWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], v3);
}

uint64_t __69__PNPWizardScratchpadView__showToastNotificationAndAnimateStrokeAway__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "clearDrawingAnimated");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "setShowingToast:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_animateLayoutChange:", 0);
}

- (void)_dismissToastNotification
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __52__PNPWizardScratchpadView__dismissToastNotification__block_invoke;
  v2[3] = &unk_24F4E50A0;
  v2[4] = self;
  -[PNPWizardScratchpadView _animateLayoutChange:](self, "_animateLayoutChange:", v2);
}

uint64_t __52__PNPWizardScratchpadView__dismissToastNotification__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "clearDrawingAnimated");
  objc_msgSend(*(id *)(a1 + 32), "setShowingToast:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_animateLayoutChange:", 0);
}

- (void)setShowingToast:(BOOL)a3
{
  self->_showingToast = a3;
  -[PNPWizardScratchpadView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_canvasViewWillBeginDrawing:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  BOOL v9;

  if (-[PNPWizardScratchpadView _viewIsPartOfStylusCanvasView:](self, "_viewIsPartOfStylusCanvasView:", a3))
  {
    -[PNPWizardScratchpadCanvasView ink](self->_canvasView, "ink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", *MEMORY[0x24BDE3430]);

    -[PNPWizardScratchpadView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "scratchPadViewIsPlayingAnimation:", self);

    if (v6)
      v9 = v8 == 0;
    else
      v9 = 1;
    if (!v9)
    {
      -[PNPWizardScratchpadView _selectInkAtIndex:](self, "_selectInkAtIndex:", self->_previousMarkingToolIndex);
      -[PNPWizardScratchpadView _animateLayoutChange:](self, "_animateLayoutChange:", 0);
    }
  }
}

- (void)canvasViewDidBeginDrawing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSTimer *showToastTimer;

  if (-[PNPWizardScratchpadView _viewIsPartOfStylusCanvasView:](self, "_viewIsPartOfStylusCanvasView:", a3))
  {
    self->_isDrawing = 1;
    -[PNPWizardScratchpadView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scratchPadViewHadInteractionEvent:", self);

    -[PNPWizardScratchpadCanvasView ink](self->_canvasView, "ink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", *MEMORY[0x24BDE3430]);

    if ((v7 & 1) == 0)
    {
      -[NSTimer invalidate](self->_showToastTimer, "invalidate");
      showToastTimer = self->_showToastTimer;
      self->_showToastTimer = 0;

      -[PNPWizardScratchpadView _dismissToastNotification](self, "_dismissToastNotification");
    }
  }
}

- (void)canvasViewDidEndDrawing:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSTimer *showToastTimer;
  id v8;

  v8 = a3;
  if (-[PNPWizardScratchpadView _viewIsPartOfStylusCanvasView:](self, "_viewIsPartOfStylusCanvasView:"))
    self->_isDrawing = 0;
  if (!-[PNPWizardScratchpadView _viewIsPartOfStylusCanvasView:](self, "_viewIsPartOfStylusCanvasView:", v8))
    -[PNPWizardScratchpadView _showToastNotificationAndAnimateStrokeAway](self, "_showToastNotificationAndAnimateStrokeAway");
  objc_msgSend(v8, "drawing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_visibleStrokes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[NSTimer invalidate](self->_showToastTimer, "invalidate");
    showToastTimer = self->_showToastTimer;
    self->_showToastTimer = 0;

  }
}

- (void)clearCanvas
{
  -[PNPWizardScratchpadCanvasView clearDrawingAnimated](self->_canvasView, "clearDrawingAnimated");
  -[PNPWizardScratchpadView setShowingToast:](self, "setShowingToast:", 0);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PNPWizardScratchpadView;
  -[PNPWizardScratchpadView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PNPWizardScratchpadView _viewIsPartOfStylusCanvasView:](self, "_viewIsPartOfStylusCanvasView:", v8)
    && !objc_msgSend(v7, "pnp_isPencilEvent"))
  {
    -[PNPWizardScratchpadCanvasView convertPoint:fromView:](self->_fingerDrawingCanvasView, "convertPoint:fromView:", self, x, y);
    -[PNPWizardScratchpadCanvasView hitTest:withEvent:](self->_fingerDrawingCanvasView, "hitTest:withEvent:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v8;
  }
  v10 = v9;

  return v10;
}

- (PNPWizardScratchpadView)initWithFrame:(CGRect)a3
{
  PNPWizardScratchpadView *v3;
  UIView *v4;
  UIView *backgroundView;
  PNPWizardScratchpadCanvasView *v6;
  PNPWizardScratchpadCanvasView *canvasView;
  PNPWizardScratchpadCanvasView *v8;
  PNPWizardScratchpadCanvasView *fingerDrawingCanvasView;
  PNPWizardScratchpadCanvasView *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CAShapeLayer *frameLayer;
  void *v17;
  CAShapeLayer *v18;
  id v19;
  UIView *v20;
  UIView *toolsBackgroundPillView;
  PNPWizardInkWeightControl *v22;
  PNPWizardInkWeightControl *inkWeightControl;
  uint64_t v24;
  NSMutableArray *inkViews;
  uint64_t i;
  PNPWizardScratchpadInkView *v27;
  void *v28;
  PNPWizardScratchpadToast *v29;
  PNPWizardScratchpadToast *toastView;
  void *v31;
  void *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)PNPWizardScratchpadView;
  v3 = -[PNPWizardScratchpadView initWithFrame:](&v34, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
  backgroundView = v3->_backgroundView;
  v3->_backgroundView = v4;

  -[PNPWizardScratchpadView addSubview:](v3, "addSubview:", v3->_backgroundView);
  v6 = objc_alloc_init(PNPWizardScratchpadCanvasView);
  canvasView = v3->_canvasView;
  v3->_canvasView = v6;

  v8 = objc_alloc_init(PNPWizardScratchpadCanvasView);
  fingerDrawingCanvasView = v3->_fingerDrawingCanvasView;
  v3->_fingerDrawingCanvasView = v8;

  -[PNPWizardScratchpadCanvasView setDelegate:](v3->_canvasView, "setDelegate:", v3);
  -[PNPWizardScratchpadCanvasView setOpaque:](v3->_canvasView, "setOpaque:", 0);
  -[PNPWizardScratchpadCanvasView setDelegate:](v3->_fingerDrawingCanvasView, "setDelegate:", v3);
  -[PNPWizardScratchpadCanvasView setOpaque:](v3->_fingerDrawingCanvasView, "setOpaque:", 0);
  v10 = v3->_fingerDrawingCanvasView;
  v11 = (void *)MEMORY[0x24BDE33B0];
  v12 = *MEMORY[0x24BDE3438];
  objc_msgSend(MEMORY[0x24BDF6950], "fingerDrawingInkColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inkWithIdentifier:color:weight:", v12, v13, 0.2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPWizardScratchpadCanvasView setInk:](v10, "setInk:", v14);

  -[PNPWizardScratchpadView addSubview:](v3, "addSubview:", v3->_fingerDrawingCanvasView);
  -[PNPWizardScratchpadView addSubview:](v3, "addSubview:", v3->_canvasView);
  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v15 = objc_claimAutoreleasedReturnValue();
  frameLayer = v3->_frameLayer;
  v3->_frameLayer = (CAShapeLayer *)v15;

  -[PNPWizardScratchpadView layer](v3, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSublayer:", v3->_frameLayer);

  v18 = v3->_frameLayer;
  objc_msgSend(MEMORY[0x24BDF6950], "scratchpadFrameColor");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](v18, "setFillColor:", objc_msgSend(v19, "CGColor"));

  v20 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
  toolsBackgroundPillView = v3->_toolsBackgroundPillView;
  v3->_toolsBackgroundPillView = v20;

  -[PNPWizardScratchpadView addSubview:](v3, "addSubview:", v3->_toolsBackgroundPillView);
  v22 = objc_alloc_init(PNPWizardInkWeightControl);
  inkWeightControl = v3->_inkWeightControl;
  v3->_inkWeightControl = v22;

  -[PNPWizardScratchpadView addSubview:](v3, "addSubview:", v3->_inkWeightControl);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v24 = objc_claimAutoreleasedReturnValue();
  inkViews = v3->_inkViews;
  v3->_inkViews = (NSMutableArray *)v24;

  for (i = 0; i != 8; ++i)
  {
    v27 = -[PNPWizardScratchpadInkView initWithIndex:]([PNPWizardScratchpadInkView alloc], "initWithIndex:", i);
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", v3, sel__inkViewPressed_);
    objc_msgSend(v28, "setMinimumPressDuration:", 0.0);
    -[PNPWizardScratchpadInkView addGestureRecognizer:](v27, "addGestureRecognizer:", v28);
    -[NSMutableArray addObject:](v3->_inkViews, "addObject:", v27);
    -[PNPWizardScratchpadView addSubview:](v3, "addSubview:", v27);

  }
  -[PNPWizardScratchpadView _selectInkAtIndex:](v3, "_selectInkAtIndex:", 1);
  v3->_previousMarkingToolIndex = 1;
  v29 = objc_alloc_init(PNPWizardScratchpadToast);
  toastView = v3->_toastView;
  v3->_toastView = v29;

  -[PNPWizardScratchpadToast setUserInteractionEnabled:](v3->_toastView, "setUserInteractionEnabled:", 0);
  -[PNPWizardScratchpadView addSubview:](v3, "addSubview:", v3->_toastView);
  PencilPairingUIBundle();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("USE_APPLE_PENCIL_PROMPT"), &stru_24F4E5CD0, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[PNPWizardScratchpadToast setText:](v3->_toastView, "setText:", v32);
  return v3;
}

- (void)prepareCanvasViews
{
  void *v3;
  id v4;

  -[PNPWizardScratchpadCanvasView prepareCanvasView](self->_fingerDrawingCanvasView, "prepareCanvasView");
  -[PNPWizardScratchpadCanvasView prepareCanvasView](self->_canvasView, "prepareCanvasView");
  -[PNPWizardScratchpadCanvasView drawingGestureRecognizer](self->_canvasView, "drawingGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowedTouchTypes:", &unk_24F4F63D0);

  -[PNPWizardScratchpadCanvasView drawingGestureRecognizer](self->_fingerDrawingCanvasView, "drawingGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowedTouchTypes:", &unk_24F4F63E8);

}

- (void)setStep:(unint64_t)a3
{
  self->_step = a3;
  if (a3 == 1)
    -[PNPWizardScratchpadView _triggerShowToastTimer](self, "_triggerShowToastTimer");
}

- (void)_triggerShowToastTimer
{
  NSTimer *showToastTimer;
  NSTimer *v4;
  NSTimer *v5;
  NSTimer *v6;

  showToastTimer = self->_showToastTimer;
  if (showToastTimer)
  {
    -[NSTimer invalidate](showToastTimer, "invalidate");
    v4 = self->_showToastTimer;
    self->_showToastTimer = 0;

  }
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__showToastNotificationWithInitialAnimation, 0, 0, 3.0);
  v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v6 = self->_showToastTimer;
  self->_showToastTimer = v5;

}

- (void)viewWillMoveToSuperview:(id)a3
{
  NSTimer *showToastTimer;

  if (!a3)
  {
    -[NSTimer invalidate](self->_showToastTimer, "invalidate");
    showToastTimer = self->_showToastTimer;
    self->_showToastTimer = 0;

  }
}

- (unint64_t)step
{
  return self->_step;
}

- (PNPWizardScratchpadViewDelegate)delegate
{
  return (PNPWizardScratchpadViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showingToast
{
  return self->_showingToast;
}

- (BOOL)isDrawing
{
  return self->_isDrawing;
}

- (void)setIsDrawing:(BOOL)a3
{
  self->_isDrawing = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_showToastTimer, 0);
  objc_storeStrong((id *)&self->_toastView, 0);
  objc_storeStrong((id *)&self->_toolsBackgroundPillView, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_inkViews, 0);
  objc_storeStrong((id *)&self->_inkWeightControl, 0);
  objc_storeStrong((id *)&self->_frameLayer, 0);
  objc_storeStrong((id *)&self->_fingerDrawingCanvasView, 0);
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end

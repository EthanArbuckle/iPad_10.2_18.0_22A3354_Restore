@implementation UIBandSelectionInteraction

- (void)_viewTraitCollectionDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = objc_msgSend(a3, "userInterfaceIdiom");
  -[UIBandSelectionInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v4 != v7)
    -[UIBandSelectionInteraction _updateInteractionEnabled](self, "_updateInteractionEnabled");
}

- (void)_updateInteractionEnabled
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;

  -[UIBandSelectionInteraction view](self, "view");
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIBandSelectionInteraction view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    v7 = -[UIBandSelectionInteraction isEnabled](self, "isEnabled");
    v3 = (v6 & 0xFFFFFFFFFFFFFFFBLL) == 1 && v7;
  }
  -[UIBandSelectionInteraction visualProvider](self, "visualProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v3);

  -[UIBandSelectionInteraction hoverGR](self, "hoverGR");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v3);

  -[UIBandSelectionInteraction pressGR](self, "pressGR");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v3);

}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setShouldBeginHandler:(void *)shouldBeginHandler
{
  objc_setProperty_nonatomic_copy(self, a2, shouldBeginHandler, 64);
}

- (UIBandSelectionInteraction)initWithSelectionHandler:(void *)selectionHandler
{
  void *v4;
  UIBandSelectionInteraction *v5;
  UIBandSelectionInteraction *v6;
  objc_super v8;

  v4 = selectionHandler;
  v8.receiver = self;
  v8.super_class = (Class)UIBandSelectionInteraction;
  v5 = -[UIBandSelectionInteraction init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[UIBandSelectionInteraction setSelectionHandler:](v5, "setSelectionHandler:", v4);
    v6->_enabled = 1;
    v6->_internalState = 1;
  }

  return v6;
}

- (void)setSelectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)_setBandVisibilityHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)dealloc
{
  objc_super v3;

  -[UIBandSelectionInteraction willMoveToView:](self, "willMoveToView:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIBandSelectionInteraction;
  -[UIBandSelectionInteraction dealloc](&v3, sel_dealloc);
}

- (void)didMoveToView:(id)a3
{
  UIView **p_view;
  void *v5;
  UIHoverGestureRecognizer *v6;
  void *v7;
  void *v8;
  UILongPressGestureRecognizer *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;

  p_view = &self->_view;
  objc_storeWeak((id *)&self->_view, a3);
  -[UIBandSelectionInteraction hoverGR](self, "hoverGR");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = -[UIHoverGestureRecognizer initWithTarget:action:]([UIHoverGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleHoverGesture_);
    -[UIBandSelectionInteraction setHoverGR:](self, "setHoverGR:", v6);

    -[UIBandSelectionInteraction hoverGR](self, "hoverGR");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", CFSTR("com.apple.UIKit.bandSelectionHover"));

    -[UIBandSelectionInteraction hoverGR](self, "hoverGR");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setPausesWhilePanning:", 0);

    v9 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__handlePressGesture_);
    -[UIBandSelectionInteraction setPressGR:](self, "setPressGR:", v9);

    -[UIBandSelectionInteraction pressGR](self, "pressGR");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setName:", CFSTR("com.apple.UIKit.bandSelectionInitiationPress"));

    -[UIBandSelectionInteraction pressGR](self, "pressGR");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMinimumPressDuration:", 0.0);

    -[UIBandSelectionInteraction pressGR](self, "pressGR");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setButtonMaskRequired:", 1);

    -[UIBandSelectionInteraction pressGR](self, "pressGR");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", self);

    -[UIBandSelectionInteraction pressGR](self, "pressGR");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelaysTouchesEnded:", 0);

    -[UIBandSelectionInteraction pressGR](self, "pressGR");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCancelsTouchesInView:", 0);

    v16 = (void *)objc_opt_new();
    -[UIBandSelectionInteraction setVisualProvider:](self, "setVisualProvider:", v16);

  }
  WeakRetained = objc_loadWeakRetained((id *)p_view);
  -[UIBandSelectionInteraction hoverGR](self, "hoverGR");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "addGestureRecognizer:", v18);

  v19 = objc_loadWeakRetained((id *)p_view);
  -[UIBandSelectionInteraction pressGR](self, "pressGR");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addGestureRecognizer:", v20);

  -[UIBandSelectionInteraction visualProvider](self, "visualProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(v21, "setView:", v22);

  -[UIBandSelectionInteraction _updateInteractionEnabled](self, "_updateInteractionEnabled");
}

- (UILongPressGestureRecognizer)pressGR
{
  return self->_pressGR;
}

- (UIHoverGestureRecognizer)hoverGR
{
  return self->_hoverGR;
}

- (void)willMoveToView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[UIBandSelectionInteraction hoverGR](self, "hoverGR", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBandSelectionInteraction hoverGR](self, "hoverGR");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeGestureRecognizer:", v6);

  -[UIBandSelectionInteraction pressGR](self, "pressGR");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBandSelectionInteraction pressGR](self, "pressGR");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeGestureRecognizer:", v9);

  -[UIBandSelectionInteraction visualProvider](self, "visualProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setView:", 0);

  objc_storeWeak((id *)&self->_view, 0);
}

- (_UISelectionBandVisualProviding)visualProvider
{
  return self->_visualProvider;
}

- (void)setVisualProvider:(id)a3
{
  objc_storeStrong((id *)&self->_visualProvider, a3);
}

- (void)setPressGR:(id)a3
{
  objc_storeStrong((id *)&self->_pressGR, a3);
}

- (void)setHoverGR:(id)a3
{
  objc_storeStrong((id *)&self->_hoverGR, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__bandVisibilityHandler, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_storeStrong((id *)&self->_pressGR, 0);
  objc_storeStrong((id *)&self->_hoverGR, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong(&self->_shouldBeginHandler, 0);
  objc_destroyWeak((id *)&self->_view);
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    -[UIBandSelectionInteraction _updateInteractionEnabled](self, "_updateInteractionEnabled");
  }
}

- (CGRect)selectionRect
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  if (self->_internalState < 2)
  {
    v8 = *MEMORY[0x1E0C9D628];
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    -[UIBandSelectionInteraction view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBandSelectionInteraction _locationInView:](self, "_locationInView:", v3);
    v5 = v4;
    v7 = v6;

    -[UIBandSelectionInteraction _selectionRectWithLocation:](self, "_selectionRectWithLocation:", v5, v7);
  }
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)_selectionRectWithLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  _BOOL4 v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect result;

  y = a3.y;
  x = a3.x;
  -[UIBandSelectionInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_initialLocation.x;
  v8 = self->_initialLocation.y;
  objc_msgSend(v6, "_currentScreenScale");
  v10 = UIPointRoundToScale(v7, v8, v9);
  v12 = v11;
  -[UIBandSelectionInteraction view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_currentScreenScale");
  v15 = UIPointRoundToScale(x, y, v14);
  if (v10 >= v15)
    v17 = v15;
  else
    v17 = v10;
  if (v12 >= v16)
    v18 = v16;
  else
    v18 = v12;
  v19 = vabdd_f64(v10, v15);
  v20 = vabdd_f64(v12, v16);

  v28.origin.x = v17;
  v28.origin.y = v18;
  v28.size.width = v19;
  v28.size.height = v20;
  v21 = CGRectEqualToRect(v28, *MEMORY[0x1E0C9D648]);
  v22 = 1.0;
  if (v20 >= 1.0)
    v23 = v20;
  else
    v23 = 1.0;
  if (v19 >= 1.0)
    v22 = v19;
  if (v21)
    v24 = v20;
  else
    v24 = v23;
  if (v21)
    v25 = v19;
  else
    v25 = v22;
  v26 = v17;
  v27 = v18;
  result.size.height = v24;
  result.size.width = v25;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGPoint)_locationInView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a3;
  -[UIBandSelectionInteraction hoverGR](self, "hoverGR");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)_handlePressGesture:(id)a3
{
  unint64_t internalState;
  uint64_t *p_internalState;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "state") == 1)
  {
    p_internalState = (uint64_t *)&self->_internalState;
    internalState = self->_internalState;
    v6 = 0;
LABEL_5:
    handleEvent(stateMachineSpec_2, internalState, v6, (uint64_t)self, p_internalState);
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "state") >= 3)
  {
    p_internalState = (uint64_t *)&self->_internalState;
    internalState = self->_internalState;
    v6 = 2;
    goto LABEL_5;
  }
LABEL_6:
  -[UIBandSelectionInteraction hoverGR](self, "hoverGR");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBandSelectionInteraction _updateDebugUIWithGesture:](self, "_updateDebugUIWithGesture:", v7);

}

- (void)_handleHoverGesture:(id)a3
{
  void *v4;
  CGFloat v5;
  CGFloat v6;
  id v7;

  if (objc_msgSend(a3, "state") == 2)
    handleEvent(stateMachineSpec_2, self->_internalState, 1, (uint64_t)self, (uint64_t *)&self->_internalState);
  if (!-[UIBandSelectionInteraction _isSelecting](self, "_isSelecting"))
  {
    -[UIBandSelectionInteraction view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBandSelectionInteraction _locationInView:](self, "_locationInView:", v4);
    self->_initialLocation.x = v5;
    self->_initialLocation.y = v6;

  }
  -[UIBandSelectionInteraction hoverGR](self, "hoverGR");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIBandSelectionInteraction _updateDebugUIWithGesture:](self, "_updateDebugUIWithGesture:", v7);

}

- (BOOL)_isSelecting
{
  return self->_internalState == 3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  id v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[UIBandSelectionInteraction pressGR](self, "pressGR");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
    v9 = objc_msgSend(v6, "_isPointerTouch");
  else
    v9 = 1;

  return v9;
}

- (BOOL)_gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[UIBandSelectionInteraction pressGR](self, "pressGR");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 != v5;
}

- (BOOL)_gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  char isDragInteractionGestureRecognizer;

  v6 = a4;
  v7 = a3;
  -[UIBandSelectionInteraction pressGR](self, "pressGR");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
    isDragInteractionGestureRecognizer = _isDragInteractionGestureRecognizer(v6);
  else
    isDragInteractionGestureRecognizer = 1;

  return isDragInteractionGestureRecognizer;
}

- (unint64_t)_handleBeginEvent
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  void *v6;
  void *v7;
  uint64_t (**v8)(_QWORD, _QWORD, double, double);
  int v9;

  -[UIBandSelectionInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBandSelectionInteraction _locationInView:](self, "_locationInView:", v3);
  self->_initialLocation.x = v4;
  self->_initialLocation.y = v5;

  -[UIBandSelectionInteraction pressGR](self, "pressGR");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_initialModifierFlags = objc_msgSend(v6, "modifierFlags");

  -[UIBandSelectionInteraction shouldBeginHandler](self, "shouldBeginHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 2;
  -[UIBandSelectionInteraction shouldBeginHandler](self, "shouldBeginHandler");
  v8 = (uint64_t (**)(_QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
  v9 = ((uint64_t (**)(_QWORD, UIBandSelectionInteraction *, double, double))v8)[2](v8, self, self->_initialLocation.x, self->_initialLocation.y);

  if (v9)
    return 2;
  else
    return 1;
}

- (void)_handleDidBegin
{
  void *v3;
  uint64_t (**v4)(double, double);
  BOOL *p_hidesVisuals;
  void *v6;

  -[UIBandSelectionInteraction _bandVisibilityHandler](self, "_bandVisibilityHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIBandSelectionInteraction _bandVisibilityHandler](self, "_bandVisibilityHandler");
    v4 = (uint64_t (**)(double, double))objc_claimAutoreleasedReturnValue();
    self->_hidesVisuals = v4[2](self->_initialLocation.x, self->_initialLocation.y) ^ 1;
    p_hidesVisuals = &self->_hidesVisuals;

  }
  else
  {
    self->_hidesVisuals = 0;
    p_hidesVisuals = &self->_hidesVisuals;
  }

  if (!*p_hidesVisuals)
  {
    -[UIBandSelectionInteraction visualProvider](self, "visualProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginAtPoint:", self->_initialLocation.x, self->_initialLocation.y);

  }
  -[UIBandSelectionInteraction _callHandlerWithState:](self, "_callHandlerWithState:", 1);
}

- (void)_handleDidMove
{
  void *v3;
  void *v4;

  if (!self->_hidesVisuals)
  {
    -[UIBandSelectionInteraction visualProvider](self, "visualProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBandSelectionInteraction view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBandSelectionInteraction _locationInView:](self, "_locationInView:", v4);
    objc_msgSend(v3, "updateWithPoint:");

  }
  -[UIBandSelectionInteraction _callHandlerWithState:](self, "_callHandlerWithState:", 2);
}

- (void)_handleDidEndFromState:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (!self->_hidesVisuals)
  {
    -[UIBandSelectionInteraction visualProvider](self, "visualProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBandSelectionInteraction view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBandSelectionInteraction _locationInView:](self, "_locationInView:", v6);
    objc_msgSend(v5, "endAtPoint:");

  }
  if (a3 != 1)
    -[UIBandSelectionInteraction _callHandlerWithState:](self, "_callHandlerWithState:", 3);
  self->_initialLocation = (CGPoint)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  self->_hidesVisuals = 0;
  self->_state = 0;
  self->_initialModifierFlags = 0;
}

- (void)_callHandlerWithState:(int64_t)a3
{
  void (**v4)(id, UIBandSelectionInteraction *);

  self->_state = a3;
  -[UIBandSelectionInteraction selectionHandler](self, "selectionHandler");
  v4 = (void (**)(id, UIBandSelectionInteraction *))objc_claimAutoreleasedReturnValue();
  v4[2](v4, self);

}

- (void)_updateDebugUIWithGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _UIMIDebugPointerView *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  id v60;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v65;
  double v66;
  double v67;
  double v68;
  CGFloat v69;
  CGFloat v70;
  void *v71;
  uint64_t v72;
  id v73;
  double v74;
  void *v75;
  void *v76;
  double v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[8];
  _QWORD v81[4];
  id v82;
  uint64_t v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  v4 = a3;
  if (-[UIBandSelectionInteraction _debugUIEnabled](self, "_debugUIEnabled") && objc_msgSend(v4, "state") < 3)
  {
    if (!_MergedGlobals_1127)
    {
      -[UIBandSelectionInteraction view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "window");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)qword_1ECD7EF68;
      qword_1ECD7EF68 = v10;

      v12 = -[_UIMIDebugPointerView initWithFrame:]([_UIMIDebugPointerView alloc], "initWithFrame:", 0.0, 0.0, 19.0, 19.0);
      v13 = (void *)_MergedGlobals_1127;
      _MergedGlobals_1127 = (uint64_t)v12;

      objc_msgSend((id)_MergedGlobals_1127, "setUserInteractionEnabled:", 0);
      objc_msgSend((id)_MergedGlobals_1127, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setZPosition:", 100000.0);

      objc_msgSend((id)qword_1ECD7EF68, "addSubview:", _MergedGlobals_1127);
    }
    if (!qword_1ECD7EF60)
    {
      v15 = objc_opt_new();
      v16 = (void *)qword_1ECD7EF60;
      qword_1ECD7EF60 = v15;

      objc_msgSend((id)qword_1ECD7EF60, "shapeLayer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFillColor:", 0);

      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.5);
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v19 = objc_msgSend(v18, "CGColor");
      objc_msgSend((id)qword_1ECD7EF60, "shapeLayer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setStrokeColor:", v19);

      v21 = *MEMORY[0x1E0CD3028];
      objc_msgSend((id)qword_1ECD7EF60, "shapeLayer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setLineJoin:", v21);

      objc_msgSend((id)qword_1ECD7EF60, "shapeLayer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setLineDashPattern:", &unk_1E1A940B8);

      objc_msgSend((id)qword_1ECD7EF68, "addSubview:", qword_1ECD7EF60);
    }
    -[UIBandSelectionInteraction selectionRect](self, "selectionRect");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    objc_msgSend((id)qword_1ECD7EF60, "frame");
    if (v29 != v33 || v31 != v32)
    {
      -[UIBandSelectionInteraction view](self, "view");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "convertRect:toView:", qword_1ECD7EF68, v25, v27, v29, v31);
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v43 = v42;

      objc_msgSend((id)qword_1ECD7EF60, "setFrame:", v37, v39, v41, v43);
      +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v41, v43);
      v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v45 = objc_msgSend(v44, "CGPath");
      objc_msgSend((id)qword_1ECD7EF60, "shapeLayer");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setPath:", v45);

    }
    if (!qword_1ECD7EF70)
    {
      +[UIColor systemPurpleColor](UIColor, "systemPurpleColor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIDebugDot dotWithTitle:color:](_UIDebugDot, "dotWithTitle:color:", CFSTR("Initial Location"), v47);
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = (void *)qword_1ECD7EF70;
      qword_1ECD7EF70 = v48;

      objc_msgSend((id)qword_1ECD7EF68, "addSubview:", qword_1ECD7EF70);
    }
    if (!qword_1ECD7EF78)
    {
      +[UIColor systemBlueColor](UIColor, "systemBlueColor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIDebugDot dotWithTitle:color:](_UIDebugDot, "dotWithTitle:color:", CFSTR("Current Location"), v50);
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = (void *)qword_1ECD7EF78;
      qword_1ECD7EF78 = v51;

      objc_msgSend((id)qword_1ECD7EF68, "addSubview:", qword_1ECD7EF78);
    }
    -[UIBandSelectionInteraction view](self, "view");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v53);
    v55 = v54;
    v57 = v56;

    -[UIBandSelectionInteraction view](self, "view");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "convertPoint:toView:", qword_1ECD7EF68, self->_initialLocation.x, self->_initialLocation.y);
    objc_msgSend((id)qword_1ECD7EF70, "setCenter:");

    -[UIBandSelectionInteraction view](self, "view");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "convertPoint:toView:", qword_1ECD7EF68, v55, v57);
    objc_msgSend((id)qword_1ECD7EF78, "setCenter:");

    v60 = (id)*MEMORY[0x1E0CD2A60];
    -[UIBandSelectionInteraction selectionRect](self, "selectionRect");
    v85 = CGRectInset(v84, -9.5, -9.5);
    x = v85.origin.x;
    y = v85.origin.y;
    width = v85.size.width;
    height = v85.size.height;
    if (CGRectGetHeight(v85) > 19.0
      || (v86.origin.x = x,
          v86.origin.y = y,
          v86.size.width = width,
          v86.size.height = height,
          CGRectGetWidth(v86) > 19.0))
    {
      v65 = (id)*MEMORY[0x1E0CD2A68];

      v60 = v65;
    }
    v87.origin.x = x;
    v87.origin.y = y;
    v87.size.width = width;
    v87.size.height = height;
    v66 = CGRectGetMinX(v87) - v55 + 9.5;
    v88.origin.x = x;
    v88.origin.y = y;
    v88.size.width = width;
    v88.size.height = height;
    v67 = CGRectGetMinY(v88) - v57 + 9.5;
    v89.origin.x = x;
    v89.origin.y = y;
    v89.size.width = width;
    v89.size.height = height;
    v77 = v57;
    v68 = v55;
    v69 = CGRectGetWidth(v89);
    v90.origin.x = x;
    v90.origin.y = y;
    v90.size.width = width;
    v90.size.height = height;
    v70 = CGRectGetHeight(v90);
    v71 = (void *)objc_opt_new();
    objc_msgSend(v71, "setDampingRatio:response:", 1.0, 0.3);
    v72 = MEMORY[0x1E0C809B0];
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = __56__UIBandSelectionInteraction__updateDebugUIWithGesture___block_invoke;
    v81[3] = &unk_1E16B1888;
    v82 = v60;
    v83 = 0x3FF0000000000000;
    v73 = v60;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v71, 0, v81, 0);
    if (-[UIBandSelectionInteraction _isSelecting](self, "_isSelecting"))
      v74 = 0.0001;
    else
      v74 = 0.15;
    v75 = (void *)objc_opt_new();
    objc_msgSend(v75, "setDampingRatio:response:", 1.0, v74);
    v80[0] = v72;
    v80[1] = 3221225472;
    v80[2] = __56__UIBandSelectionInteraction__updateDebugUIWithGesture___block_invoke_2;
    v80[3] = &__block_descriptor_64_e5_v8__0l;
    *(double *)&v80[4] = v66;
    *(double *)&v80[5] = v67;
    *(CGFloat *)&v80[6] = v69;
    *(CGFloat *)&v80[7] = v70;
    v78[0] = v72;
    v78[1] = 3221225472;
    v78[2] = __56__UIBandSelectionInteraction__updateDebugUIWithGesture___block_invoke_3;
    v78[3] = &unk_1E16B2588;
    v79 = v4;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v75, 0, v80, v78);
    -[UIBandSelectionInteraction view](self, "view");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "convertPoint:toView:", qword_1ECD7EF68, v68, v77);
    objc_msgSend((id)_MergedGlobals_1127, "setCenter:");

  }
  else
  {
    objc_msgSend((id)_MergedGlobals_1127, "removeFromSuperview");
    v5 = (void *)_MergedGlobals_1127;
    _MergedGlobals_1127 = 0;

    objc_msgSend((id)qword_1ECD7EF60, "removeFromSuperview");
    v6 = (void *)qword_1ECD7EF60;
    qword_1ECD7EF60 = 0;

    objc_msgSend((id)qword_1ECD7EF70, "removeFromSuperview");
    v7 = (void *)qword_1ECD7EF70;
    qword_1ECD7EF70 = 0;

    objc_msgSend((id)qword_1ECD7EF78, "removeFromSuperview");
    v8 = (void *)qword_1ECD7EF78;
    qword_1ECD7EF78 = 0;

  }
}

void __56__UIBandSelectionInteraction__updateDebugUIWithGesture___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend((id)_MergedGlobals_1127, "setAlpha:", *(double *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend((id)_MergedGlobals_1127, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCornerCurve:", v2);

}

uint64_t __56__UIBandSelectionInteraction__updateDebugUIWithGesture___block_invoke_2(double *a1)
{
  return objc_msgSend((id)_MergedGlobals_1127, "setBounds:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __56__UIBandSelectionInteraction__updateDebugUIWithGesture___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (result >= 3)
    return objc_msgSend((id)_MergedGlobals_1127, "setAlpha:", 0.0);
  return result;
}

- (UIBandSelectionInteractionState)state
{
  return self->_state;
}

- (UIKeyModifierFlags)initialModifierFlags
{
  return self->_initialModifierFlags;
}

- (void)shouldBeginHandler
{
  return self->_shouldBeginHandler;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (BOOL)_debugUIEnabled
{
  return self->__debugUIEnabled;
}

- (void)set_debugUIEnabled:(BOOL)a3
{
  self->__debugUIEnabled = a3;
}

- (id)_bandVisibilityHandler
{
  return self->__bandVisibilityHandler;
}

@end

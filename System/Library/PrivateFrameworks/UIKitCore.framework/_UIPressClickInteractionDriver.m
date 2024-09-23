@implementation _UIPressClickInteractionDriver

- (void)setView:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_view, obj);
    -[_UIPressClickInteractionDriver _removeFromView](self, "_removeFromView");
    v6 = objc_loadWeakRetained((id *)&self->_view);

    v5 = obj;
    if (v6)
    {
      v7 = objc_loadWeakRetained((id *)&self->_view);
      -[_UIPressClickInteractionDriver _addToView:](self, "_addToView:", v7);

      v5 = obj;
    }
  }

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UIPressClickInteractionDriver)init
{
  _UIPressClickInteractionDriver *v2;
  void *v3;
  void *v4;
  void *v5;
  _OWORD v7[2];
  _OWORD v8[2];
  objc_super v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_UIPressClickInteractionDriver;
  v2 = -[_UIPressClickInteractionDriver init](&v9, sel_init);
  if (v2)
  {
    v8[0] = xmmword_18667AD90;
    v8[1] = unk_18667ADA0;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v8, "{_UIPressTrigger=qqdB}");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    v7[0] = xmmword_18667ADB0;
    v7[1] = unk_18667ADC0;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v7, "{_UIPressTrigger=qqdB}");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPressClickInteractionDriver setTriggers:](v2, "setTriggers:", v5);

  }
  return v2;
}

- (void)_removeFromView
{
  void *v3;
  void *v4;
  id v5;

  -[_UIPressClickInteractionDriver pressGR](self, "pressGR");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPressClickInteractionDriver pressGR](self, "pressGR");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", v4);

}

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (void)_addToView:(id)a3
{
  id v4;
  void *v5;
  _UISimplePressGestureRecognizer *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[_UIPressClickInteractionDriver pressGR](self, "pressGR");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = -[_UISimplePressGestureRecognizer initWithTarget:action:]([_UISimplePressGestureRecognizer alloc], "initWithTarget:action:", self, sel__handlePressGesture_);
    -[_UIPressClickInteractionDriver setPressGR:](self, "setPressGR:", v6);

    -[_UIPressClickInteractionDriver pressGR](self, "pressGR");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", CFSTR("com.apple.UIKit.keyPressClickDriverPrimary"));

    -[_UIPressClickInteractionDriver pressGR](self, "pressGR");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);

    -[_UIPressClickInteractionDriver pressGR](self, "pressGR");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPressClickInteractionDriver triggers](self, "triggers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTriggers:", v10);

  }
  -[_UIPressClickInteractionDriver pressGR](self, "pressGR");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v11);

}

- (_UISimplePressGestureRecognizer)pressGR
{
  return self->_pressGR;
}

- (void)setTriggers:(id)a3
{
  NSArray *v5;
  void *v6;
  void *v7;
  NSArray *v8;

  v5 = (NSArray *)a3;
  if (self->_triggers != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_triggers, a3);
    -[_UIPressClickInteractionDriver pressGR](self, "pressGR");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPressClickInteractionDriver triggers](self, "triggers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTriggers:", v7);

    v5 = v8;
  }

}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setPressGR:(id)a3
{
  objc_storeStrong((id *)&self->_pressGR, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressGR, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (BOOL)requiresForceCapability
{
  return 0;
}

+ (BOOL)prefersCancelsTouchesInView
{
  return 0;
}

- (double)touchDuration
{
  return 0.0;
}

- (BOOL)hasExceededAllowableMovement
{
  return 0;
}

- (BOOL)isCurrentlyAcceleratedByForce
{
  return 0;
}

- (BOOL)clicksUpAutomaticallyAfterTimeout
{
  return 0;
}

- (double)maximumEffectProgress
{
  return 1.0;
}

- (unint64_t)inputPrecision
{
  return 1;
}

- (BOOL)allowsFeedback
{
  return 1;
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
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
  CGPoint result;

  v4 = a3;
  -[_UIPressClickInteractionDriver view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "_focusSystem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "focusedItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    _UIParentCoordinateSpaceForFocusItem(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "frame");
    v19 = v18 + v17 * 0.5;
    v22 = v21 + v20 * 0.5;
  }
  else
  {
    v19 = v7 + v11 * 0.5;
    v22 = v9 + v13 * 0.5;
    v16 = v5;
  }
  objc_msgSend(v16, "convertPoint:toCoordinateSpace:", v4, v19, v22);
  v24 = v23;
  v26 = v25;

  v27 = v24;
  v28 = v26;
  result.y = v28;
  result.x = v27;
  return result;
}

- (void)cancelInteraction
{
  void *v3;
  id v4;

  -[_UIPressClickInteractionDriver pressGR](self, "pressGR");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  -[_UIPressClickInteractionDriver pressGR](self, "pressGR");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

}

- (unint64_t)driverStyle
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  unsigned __int8 v7;

  -[_UIPressClickInteractionDriver pressGR](self, "pressGR");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_UIPressTriggerValue");
    v5 = v7;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_handlePressGesture:(id)a3
{
  void *v4;
  _QWORD v5[5];

  if (objc_msgSend(a3, "state") == 1)
  {
    -[_UIPressClickInteractionDriver delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54___UIPressClickInteractionDriver__handlePressGesture___block_invoke;
    v5[3] = &unk_1E16C3F48;
    v5[4] = self;
    objc_msgSend(v4, "clickDriver:shouldBegin:", self, v5);

  }
}

- (void)_gestureRecognizerFailed:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  -[_UIPressClickInteractionDriver pressGR](self, "pressGR");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[_UIPressClickInteractionDriver delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clickDriver:didPerformEvent:", self, 3);

  }
}

- (_UIClickInteractionDriverDelegate)delegate
{
  return (_UIClickInteractionDriverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (BOOL)cancelsTouchesInView
{
  return self->_cancelsTouchesInView;
}

- (void)setCancelsTouchesInView:(BOOL)a3
{
  self->_cancelsTouchesInView = a3;
}

@end

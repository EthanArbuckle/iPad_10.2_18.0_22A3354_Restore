@implementation SBHIconDragAutoScrollAssistant

- (SBHIconDragAutoScrollAssistant)initWithDelegate:(id)a3 referenceView:(id)a4
{
  id v6;
  id v7;
  SBHIconDragAutoScrollAssistant *v8;
  SBHIconDragAutoScrollAssistant *v9;
  uint64_t v10;
  CADisplayLink *displayLink;
  CADisplayLink *v12;
  void *v13;
  CADisplayLink *v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBHIconDragAutoScrollAssistant;
  v8 = -[SBHIconDragAutoScrollAssistant init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_referenceView, a4);
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", v9, sel__displayLinkFired_);
    v10 = objc_claimAutoreleasedReturnValue();
    displayLink = v9->_displayLink;
    v9->_displayLink = (CADisplayLink *)v10;

    v12 = v9->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v12, "addToRunLoop:forMode:", v13, *MEMORY[0x1E0C99860]);

    v14 = v9->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v14, "addToRunLoop:forMode:", v15, *MEMORY[0x1E0DC55B0]);

    -[CADisplayLink setPaused:](v9->_displayLink, "setPaused:", 1);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[SBHIconDragAutoScrollAssistant invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBHIconDragAutoScrollAssistant;
  -[SBHIconDragAutoScrollAssistant dealloc](&v3, sel_dealloc);
}

- (void)setActiveDropSession:(id)a3
{
  UIDropSession *v5;

  v5 = (UIDropSession *)a3;
  if (self->_activeDropSession != v5)
  {
    objc_storeStrong((id *)&self->_activeDropSession, a3);
    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", v5 == 0);
  }

}

- (void)invalidate
{
  CADisplayLink *displayLink;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

}

- (CGPoint)_currentLocation
{
  double v2;
  double v3;
  CGPoint result;

  -[UIDropSession locationInView:](self->_activeDropSession, "locationInView:", self->_referenceView);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)_displayLinkFired:(id)a3
{
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v10;
  double v11;
  int64_t v12;
  void *v13;
  double v14;
  double v15;
  id v16;

  v16 = a3;
  -[SBHIconDragAutoScrollAssistant _currentLocation](self, "_currentLocation");
  v5 = v4;
  v7 = v6;
  self->_location.x = v4;
  self->_location.y = v6;
  UIDistanceBetweenPoints();
  if (!self->_started || v8 <= 40.0)
  {
    if (!self->_started && v8 > 20.0)
      self->_lastTimestamp = CACurrentMediaTime();
  }
  else
  {
    self->_started = 0;
  }
  v10 = self->_lastTimestamp + 0.75;
  objc_msgSend(v16, "timestamp");
  if (!self->_started && v10 < v11)
    self->_started = 1;
  if (v10 < v11)
  {
    v12 = -[SBHIconDragAutoScrollAssistant _autoScrollDirectionForLocation:](self, "_autoScrollDirectionForLocation:", v5, v7);
    -[SBHIconDragAutoScrollAssistant delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "autoScrollAssistant:triggeredAutoScrollInDirection:", self, v12);

    objc_msgSend(v16, "timestamp");
    self->_lastTimestamp = v14;
  }
  if (BSFloatIsZero())
  {
    objc_msgSend(v16, "timestamp");
    self->_lastTimestamp = v15;
  }

}

- (int64_t)_autoScrollDirectionForLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int (**v21)(_QWORD, double, double, double, double);
  unsigned int (**v22)(_QWORD, double, double, double, double);
  int64_t v23;
  _QWORD v25[8];
  _QWORD aBlock[8];

  y = a3.y;
  x = a3.x;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  v8 = -25.0;
  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v8 = -50.0;
  v9 = x + v8;
  v10 = y + -50.0;
  v11 = 0.0 - (v8 + v8);
  -[UIView bounds](self->_referenceView, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__SBHIconDragAutoScrollAssistant__autoScrollDirectionForLocation___block_invoke;
  aBlock[3] = &__block_descriptor_64_e39_B40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  aBlock[4] = v12;
  aBlock[5] = v14;
  aBlock[6] = v16;
  aBlock[7] = v18;
  v21 = (unsigned int (**)(_QWORD, double, double, double, double))_Block_copy(aBlock);
  v25[0] = v20;
  v25[1] = 3221225472;
  v25[2] = __66__SBHIconDragAutoScrollAssistant__autoScrollDirectionForLocation___block_invoke_2;
  v25[3] = &__block_descriptor_64_e39_B40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  v25[4] = v13;
  v25[5] = v15;
  v25[6] = v17;
  v25[7] = v19;
  v22 = (unsigned int (**)(_QWORD, double, double, double, double))_Block_copy(v25);
  if (v21[2](v21, v9, v10, v11, 100.0))
  {
    if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
      v23 = 1;
    else
      v23 = 2;
  }
  else if (v22[2](v22, v9, v10, v11, 100.0))
  {
    if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
      v23 = 2;
    else
      v23 = 1;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

BOOL __66__SBHIconDragAutoScrollAssistant__autoScrollDirectionForLocation___block_invoke(CGRect *a1, double a2, double a3, double a4, double a5)
{
  double MaxX;

  MaxX = CGRectGetMaxX(*(CGRect *)&a2);
  return MaxX > CGRectGetMaxX(a1[1]) + -5.0;
}

BOOL __66__SBHIconDragAutoScrollAssistant__autoScrollDirectionForLocation___block_invoke_2(CGRect *a1, double a2, double a3, double a4, double a5)
{
  double MinX;

  MinX = CGRectGetMinX(*(CGRect *)&a2);
  return MinX < CGRectGetMinX(a1[1]) + 5.0;
}

- (UIDropSession)activeDropSession
{
  return self->_activeDropSession;
}

- (SBHIconDragAutoScrollAssistantDelegate)delegate
{
  return (SBHIconDragAutoScrollAssistantDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)referenceView
{
  return self->_referenceView;
}

- (void)setReferenceView:(id)a3
{
  objc_storeStrong((id *)&self->_referenceView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeDropSession, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end

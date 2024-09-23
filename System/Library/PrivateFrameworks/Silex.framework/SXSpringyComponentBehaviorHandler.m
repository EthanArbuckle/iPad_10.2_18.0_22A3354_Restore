@implementation SXSpringyComponentBehaviorHandler

- (SXSpringyComponentBehaviorHandler)initWithComponentView:(id)a3 withBehavior:(id)a4
{
  SXSpringyComponentBehaviorHandler *v4;
  SXSpringyComponentBehaviorHandler *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SXSpringyComponentBehaviorHandler;
  v4 = -[SXComponentBehaviorHandler initWithComponentView:withBehavior:](&v13, sel_initWithComponentView_withBehavior_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SXComponentBehaviorHandler behavior](v4, "behavior");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frequency");
    v5->_frequency = v7;

    -[SXComponentBehaviorHandler behavior](v5, "behavior");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "damping");
    v5->_damping = v9;

    -[SXComponentBehaviorHandler behavior](v5, "behavior");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delta");
    v5->_delta = v11;

  }
  return v5;
}

- (void)setupWithBehaviorController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SXSpringyComponentBehaviorHandler;
  v4 = a3;
  -[SXComponentBehaviorHandler setupWithBehaviorController:](&v20, sel_setupWithBehaviorController_, v4);
  -[SXComponentBehaviorHandler behaviorView](self, "behaviorView", v20.receiver, v20.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXSpringyComponentBehaviorHandler setDynamicAnimator:](self, "setDynamicAnimator:", v6);
  objc_msgSend(v5, "center");
  -[SXSpringyComponentBehaviorHandler setOriginalCenter:](self, "setOriginalCenter:");
  objc_msgSend(v5, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "center");
  v9 = v8;
  v11 = v10;
  -[SXSpringyComponentBehaviorHandler dynamicAnimator](self, "dynamicAnimator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "referenceView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:toView:", v13, v9, v11);
  v15 = v14;
  v17 = v16;

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6840]), "initWithItem:attachedToAnchor:", v5, v15, v17);
  objc_msgSend(v18, "setLength:", 0.0);
  -[SXSpringyComponentBehaviorHandler frequency](self, "frequency");
  objc_msgSend(v18, "setFrequency:");
  -[SXSpringyComponentBehaviorHandler damping](self, "damping");
  objc_msgSend(v18, "setDamping:");
  -[SXSpringyComponentBehaviorHandler dynamicAnimator](self, "dynamicAnimator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addBehavior:", v18);

  -[SXSpringyComponentBehaviorHandler setDynamicBehavior:](self, "setDynamicBehavior:", v18);
}

- (void)updateWithBehaviorController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  double v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SXSpringyComponentBehaviorHandler;
  v4 = a3;
  -[SXComponentBehaviorHandler updateWithBehaviorController:](&v19, sel_updateWithBehaviorController_, v4);
  -[SXComponentBehaviorHandler behaviorView](self, "behaviorView", v19.receiver, v19.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dynamicBounds");
  v8 = v7;

  -[SXSpringyComponentBehaviorHandler lastYOffset](self, "lastYOffset");
  v10 = v8 - v9;
  objc_msgSend(v5, "center");
  v12 = v11;
  -[SXSpringyComponentBehaviorHandler originalCenter](self, "originalCenter");
  v14 = v13;
  -[SXSpringyComponentBehaviorHandler delta](self, "delta");
  v16 = v10 * v15;
  if (v10 >= v16)
    v17 = v10;
  else
    v17 = v16;
  if (v10 < v16)
    v16 = v10;
  if (v10 < 0.0)
    v16 = v17;
  objc_msgSend(v5, "setCenter:", v14, v12 + v16);
  -[SXSpringyComponentBehaviorHandler dynamicAnimator](self, "dynamicAnimator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateItemUsingCurrentState:", v5);

  -[SXSpringyComponentBehaviorHandler setLastYOffset:](self, "setLastYOffset:", v8);
}

- (void)destroyWithBehaviorController:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXSpringyComponentBehaviorHandler;
  -[SXComponentBehaviorHandler destroyWithBehaviorController:](&v6, sel_destroyWithBehaviorController_, a3);
  -[SXSpringyComponentBehaviorHandler dynamicAnimator](self, "dynamicAnimator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXSpringyComponentBehaviorHandler dynamicBehavior](self, "dynamicBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeBehavior:", v5);

  -[SXSpringyComponentBehaviorHandler setDynamicBehavior:](self, "setDynamicBehavior:", 0);
  -[SXSpringyComponentBehaviorHandler setDynamicAnimator:](self, "setDynamicAnimator:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[SXSpringyComponentBehaviorHandler destroyWithBehaviorController:](self, "destroyWithBehaviorController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SXSpringyComponentBehaviorHandler;
  -[SXSpringyComponentBehaviorHandler dealloc](&v3, sel_dealloc);
}

- (double)lastYOffset
{
  return self->_lastYOffset;
}

- (void)setLastYOffset:(double)a3
{
  self->_lastYOffset = a3;
}

- (UIAttachmentBehavior)dynamicBehavior
{
  return self->_dynamicBehavior;
}

- (void)setDynamicBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicBehavior, a3);
}

- (UIDynamicAnimator)dynamicAnimator
{
  return self->_dynamicAnimator;
}

- (void)setDynamicAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicAnimator, a3);
}

- (CGPoint)originalCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_originalCenter.x;
  y = self->_originalCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOriginalCenter:(CGPoint)a3
{
  self->_originalCenter = a3;
}

- (double)frequency
{
  return self->_frequency;
}

- (double)damping
{
  return self->_damping;
}

- (double)delta
{
  return self->_delta;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicAnimator, 0);
  objc_storeStrong((id *)&self->_dynamicBehavior, 0);
}

@end

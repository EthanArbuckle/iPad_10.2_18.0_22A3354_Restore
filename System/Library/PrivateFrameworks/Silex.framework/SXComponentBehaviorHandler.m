@implementation SXComponentBehaviorHandler

- (SXComponentBehaviorHandler)initWithComponentView:(id)a3 withBehavior:(id)a4
{
  id v7;
  id v8;
  SXComponentBehaviorHandler *v9;
  SXComponentBehaviorHandler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXComponentBehaviorHandler;
  v9 = -[SXComponentBehaviorHandler init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_componentView, a3);
    objc_storeStrong((id *)&v10->_behavior, a4);
  }

  return v10;
}

- (void)setupWithBehaviorController:(id)a3
{
  SXComponentView *componentView;
  id v4;

  self->_isSetup = 1;
  componentView = self->_componentView;
  -[SXComponentBehaviorHandler behavior](self, "behavior", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SXComponentView didApplyBehavior:](componentView, "didApplyBehavior:", v4);

}

- (void)destroyWithBehaviorController:(id)a3
{
  void *v4;

  -[SXComponentBehaviorHandler componentView](self, "componentView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didApplyBehavior:", 0);

  self->_isSetup = 0;
}

- (UIView)behaviorView
{
  void *v3;
  void *v4;
  void *v5;

  -[SXComponentBehaviorHandler componentView](self, "componentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentBehaviorHandler behavior](self, "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentViewForBehavior:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v5;
}

- (BOOL)requiresContinuousUpdates
{
  return 0;
}

- (SXComponentView)componentView
{
  return self->_componentView;
}

- (SXComponentBehavior)behavior
{
  return self->_behavior;
}

- (BOOL)isSetup
{
  return self->_isSetup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_componentView, 0);
}

@end

@implementation SBSceneLayoutStateProvider

- (SBMainDisplayLayoutState)layoutState
{
  return self->_layoutState;
}

- (void)setPreviousLayoutState:(id)a3
{
  objc_storeStrong((id *)&self->_previousLayoutState, a3);
}

- (void)setLayoutState:(id)a3
{
  objc_storeStrong((id *)&self->_layoutState, a3);
}

- (SBSceneLayoutStateProvider)initWithLayoutState:(id)a3
{
  id v5;
  SBSceneLayoutStateProvider *v6;
  SBSceneLayoutStateProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSceneLayoutStateProvider;
  v6 = -[SBSceneLayoutStateProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_layoutState, a3);

  return v7;
}

- (SBMainDisplayLayoutState)previousLayoutState
{
  return self->_previousLayoutState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousLayoutState, 0);
  objc_storeStrong((id *)&self->_layoutState, 0);
}

@end

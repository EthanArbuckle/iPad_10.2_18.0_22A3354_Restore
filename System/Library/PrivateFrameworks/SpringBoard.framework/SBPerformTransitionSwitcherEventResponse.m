@implementation SBPerformTransitionSwitcherEventResponse

- (int64_t)type
{
  return 1;
}

- (SBPerformTransitionSwitcherEventResponse)initWithTransitionRequest:(id)a3 gestureInitiated:(BOOL)a4
{
  id v7;
  SBPerformTransitionSwitcherEventResponse *v8;
  SBPerformTransitionSwitcherEventResponse *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBPerformTransitionSwitcherEventResponse;
  v8 = -[SBChainableModifierEventResponse init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_transitionRequest, a3);
    v9->_gestureInitiated = a4;
  }

  return v9;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBPerformTransitionSwitcherEventResponse;
  v4 = a3;
  -[SBChainableModifierEventResponse descriptionBuilderWithMultilinePrefix:](&v10, sel_descriptionBuilderWithMultilinePrefix_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendBool:withName:", self->_gestureInitiated, CFSTR("gestureInitiated"), v10.receiver, v10.super_class);
  -[SBSwitcherTransitionRequest descriptionWithMultilinePrefix:](self->_transitionRequest, "descriptionWithMultilinePrefix:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v5, "appendObject:withName:", v7, CFSTR("request"));
  return v5;
}

- (SBSwitcherTransitionRequest)transitionRequest
{
  return self->_transitionRequest;
}

- (BOOL)isGestureInitiated
{
  return self->_gestureInitiated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionRequest, 0);
}

@end

@implementation SBActivateReachabilitySwitcherEventResponse

- (int64_t)type
{
  return 4;
}

- (SBActivateReachabilitySwitcherEventResponse)initWithReachabilityContext:(SBReachabilityActivationContext *)a3
{
  SBActivateReachabilitySwitcherEventResponse *result;
  CGPoint translation;
  CGSize size;
  CGPoint origin;
  CGPoint velocity;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBActivateReachabilitySwitcherEventResponse;
  result = -[SBChainableModifierEventResponse init](&v9, sel_init);
  if (result)
  {
    translation = a3->translation;
    result->_reachabilityActivationContext.location = a3->location;
    result->_reachabilityActivationContext.translation = translation;
    origin = a3->viewBounds.origin;
    size = a3->viewBounds.size;
    velocity = a3->velocity;
    *(_QWORD *)&result->_reachabilityActivationContext.beganInSafeArea = *(_QWORD *)&a3->beganInSafeArea;
    result->_reachabilityActivationContext.viewBounds.origin = origin;
    result->_reachabilityActivationContext.viewBounds.size = size;
    result->_reachabilityActivationContext.velocity = velocity;
  }
  return result;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  CGPoint origin;
  CGPoint translation;
  void *v7;
  _OWORD v9[5];
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBActivateReachabilitySwitcherEventResponse;
  -[SBChainableModifierEventResponse descriptionBuilderWithMultilinePrefix:](&v11, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  origin = self->_reachabilityActivationContext.viewBounds.origin;
  v9[2] = self->_reachabilityActivationContext.velocity;
  v9[3] = origin;
  v9[4] = self->_reachabilityActivationContext.viewBounds.size;
  v10 = *(_QWORD *)&self->_reachabilityActivationContext.beganInSafeArea;
  translation = self->_reachabilityActivationContext.translation;
  v9[0] = self->_reachabilityActivationContext.location;
  v9[1] = translation;
  NSStringFromSBReachabilityActivationContext((uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("context"));

  return v4;
}

- (SBReachabilityActivationContext)reachabilityActivationContext
{
  CGPoint location;
  CGPoint v4;

  location = self[1].location;
  retstr->velocity = *(CGPoint *)&self->viewBounds.size.height;
  retstr->viewBounds.origin = location;
  retstr->viewBounds.size = (CGSize)self[1].translation;
  *(CGFloat *)&retstr->beganInSafeArea = self[1].velocity.x;
  v4 = *(CGPoint *)&self->viewBounds.origin.y;
  retstr->location = *(CGPoint *)&self->velocity.y;
  retstr->translation = v4;
  return self;
}

@end

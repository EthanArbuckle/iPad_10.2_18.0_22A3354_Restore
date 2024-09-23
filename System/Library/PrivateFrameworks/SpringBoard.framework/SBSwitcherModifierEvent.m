@implementation SBSwitcherModifierEvent

- (BOOL)isGestureEvent
{
  return 0;
}

- (BOOL)isTransitionEvent
{
  return 0;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSwitcherModifierEvent;
  -[SBChainableModifierEvent descriptionBuilderWithMultilinePrefix:](&v7, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSBSwitcherModifierEventType(-[SBSwitcherModifierEvent type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("type"));

  return v4;
}

- (BOOL)isWindowDragGestureEvent
{
  return 0;
}

- (BOOL)isIndirectPanGestureEvent
{
  return 0;
}

- (int64_t)type
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end

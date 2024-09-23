@implementation CADisplayLink(RCAdditions)

+ (uint64_t)rc_displayLinkWithWeakTarget:()RCAdditions selector:
{
  return objc_msgSend(a1, "displayLinkWithTarget:selector:", -[RCWeakDisplayLinkTargetProxy initWithTarget:selector:]([RCWeakDisplayLinkTargetProxy alloc], "initWithTarget:selector:", a3, a4), sel_displayLinkFired_);
}

+ (void)rc_displayWithFramesPerSecond:()RCAdditions handlerBlock:
{
  RCDisplayLinkBlockTargetProxy *v5;
  void *v6;

  v5 = -[RCDisplayLinkBlockTargetProxy initWithHandlerBlock:]([RCDisplayLinkBlockTargetProxy alloc], "initWithHandlerBlock:", a4);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", v5, sel_displayLinkFired_);
  objc_msgSend(v6, "setPreferredFramesPerSecond:", a3);
  return v6;
}

@end

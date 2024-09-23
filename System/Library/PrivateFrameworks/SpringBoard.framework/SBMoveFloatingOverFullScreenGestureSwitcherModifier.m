@implementation SBMoveFloatingOverFullScreenGestureSwitcherModifier

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBMoveFloatingOverFullScreenGestureSwitcherModifier;
  v4 = a3;
  -[SBGestureSwitcherModifier handleTransitionEvent:](&v8, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "phase", v8.receiver, v8.super_class);

  if (v6 == 2)
    -[SBChainableModifier setState:](self, "setState:", 1);
  return v5;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4;
  void *v5;
  int v6;
  unsigned __int16 v7;
  SBSwitcherAsyncRenderingAttributes v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sbf_isLowEndForSlideOverMoveGesture");

  if (v6)
  {
    v7 = SBSwitcherAsyncRenderingAttributesMake(1u, 0);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBMoveFloatingOverFullScreenGestureSwitcherModifier;
    v7 = (unsigned __int16)-[SBMoveFloatingOverFullScreenGestureSwitcherModifier asyncRenderingAttributesForAppLayout:](&v10, sel_asyncRenderingAttributesForAppLayout_, v4);
  }
  v8 = (SBSwitcherAsyncRenderingAttributes)v7;

  return v8;
}

@end

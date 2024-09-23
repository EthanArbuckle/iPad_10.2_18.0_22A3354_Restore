@implementation SBMatchMoveToIconViewSwitcherEventResponse

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBMatchMoveToIconViewSwitcherEventResponse;
  -[SBChainableModifierEventResponse descriptionBuilderWithMultilinePrefix:](&v10, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", self->_active, CFSTR("active"));
  -[SBAppLayout succinctDescription](self->_appLayout, "succinctDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("appLayout"));

  if (self->_active)
    v8 = (id)objc_msgSend(v4, "appendRect:withName:", CFSTR("iconFrame"), self->_iconFrame.origin.x, self->_iconFrame.origin.y, self->_iconFrame.size.width, self->_iconFrame.size.height);
  return v4;
}

- (int64_t)type
{
  return 15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
}

- (BOOL)isActive
{
  return self->_active;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (SBMatchMoveToIconViewSwitcherEventResponse)initWithActivatingAppLayout:(id)a3 iconFrame:(CGRect)a4
{
  return (SBMatchMoveToIconViewSwitcherEventResponse *)-[SBMatchMoveToIconViewSwitcherEventResponse _initWithAppLayout:active:iconFrame:](self, "_initWithAppLayout:active:iconFrame:", a3, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (SBMatchMoveToIconViewSwitcherEventResponse)initWithDeactivatingAppLayout:(id)a3
{
  return (SBMatchMoveToIconViewSwitcherEventResponse *)-[SBMatchMoveToIconViewSwitcherEventResponse _initWithAppLayout:active:iconFrame:](self, "_initWithAppLayout:active:iconFrame:", a3, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (id)_initWithAppLayout:(id)a3 active:(BOOL)a4 iconFrame:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  SBMatchMoveToIconViewSwitcherEventResponse *v13;
  SBMatchMoveToIconViewSwitcherEventResponse *v14;
  objc_super v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBMatchMoveToIconViewSwitcherEventResponse;
  v13 = -[SBChainableModifierEventResponse init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_appLayout, a3);
    v14->_active = a4;
    v14->_iconFrame.origin.x = x;
    v14->_iconFrame.origin.y = y;
    v14->_iconFrame.size.width = width;
    v14->_iconFrame.size.height = height;
  }

  return v14;
}

- (CGRect)iconFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_iconFrame.origin.x;
  y = self->_iconFrame.origin.y;
  width = self->_iconFrame.size.width;
  height = self->_iconFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end

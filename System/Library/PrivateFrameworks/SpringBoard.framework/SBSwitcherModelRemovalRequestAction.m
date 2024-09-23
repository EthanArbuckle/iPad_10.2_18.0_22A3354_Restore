@implementation SBSwitcherModelRemovalRequestAction

- (id)_initWithActionType:(int64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSwitcherModelRemovalRequestAction;
  result = -[SBSwitcherModelRemovalRequestAction init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

+ (id)defaultRemovalPolicyAction
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithActionType:", 1);
}

+ (id)replacementActionWithAppLayout:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)a1), "_initWithActionType:", 2);
  v7 = (void *)v6;
  if (v6)
    objc_storeStrong((id *)(v6 + 16), a3);

  return v7;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (SBAppLayout)replacementAppLayout
{
  return self->_replacementAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementAppLayout, 0);
}

@end

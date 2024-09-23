@implementation SMSessionStateTransitionDecision

- (SMSessionStateTransitionDecision)initWithIsAllowed:(BOOL)a3 actionBlock:(id)a4
{
  id v6;
  SMSessionStateTransitionDecision *v7;
  SMSessionStateTransitionDecision *v8;
  uint64_t v9;
  id actionBlock;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SMSessionStateTransitionDecision;
  v7 = -[SMSessionStateTransitionDecision init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_isAllowed = a3;
    v9 = MEMORY[0x1D8232094](v6);
    actionBlock = v8->_actionBlock;
    v8->_actionBlock = (id)v9;

  }
  return v8;
}

- (BOOL)isAllowed
{
  return self->_isAllowed;
}

- (void)setIsAllowed:(BOOL)a3
{
  self->_isAllowed = a3;
}

- (id)actionBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionBlock, 0);
}

@end

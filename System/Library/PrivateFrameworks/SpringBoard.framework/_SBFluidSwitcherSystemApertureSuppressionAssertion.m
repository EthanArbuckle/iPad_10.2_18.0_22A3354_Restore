@implementation _SBFluidSwitcherSystemApertureSuppressionAssertion

- (_SBFluidSwitcherSystemApertureSuppressionAssertion)initWithSceneID:(id)a3 bundleID:(id)a4 invalidationBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  _SBFluidSwitcherSystemApertureSuppressionAssertion *v11;
  _SBFluidSwitcherSystemApertureSuppressionAssertion *v12;
  uint64_t v13;
  NSString *sceneID;
  uint64_t v15;
  NSString *bundleID;
  uint64_t v17;
  id invalidationBlock;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_SBFluidSwitcherSystemApertureSuppressionAssertion;
  v11 = -[_SBFluidSwitcherSystemApertureSuppressionAssertion init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_isValid = 1;
    v13 = objc_msgSend(v8, "copy");
    sceneID = v12->_sceneID;
    v12->_sceneID = (NSString *)v13;

    v15 = objc_msgSend(v9, "copy");
    bundleID = v12->_bundleID;
    v12->_bundleID = (NSString *)v15;

    v17 = objc_msgSend(v10, "copy");
    invalidationBlock = v12->_invalidationBlock;
    v12->_invalidationBlock = (id)v17;

  }
  return v12;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->_isValid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherGestureManager.m"), 4009, CFSTR("Must be invalidated before deallocation"));

  }
  v5.receiver = self;
  v5.super_class = (Class)_SBFluidSwitcherSystemApertureSuppressionAssertion;
  -[_SBFluidSwitcherSystemApertureSuppressionAssertion dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)_SBFluidSwitcherSystemApertureSuppressionAssertion;
  -[_SBFluidSwitcherSystemApertureSuppressionAssertion description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ sceneID: %@ bundleID: %@"), v4, self->_sceneID, self->_bundleID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)invalidate
{
  void (**invalidationBlock)(id, _SBFluidSwitcherSystemApertureSuppressionAssertion *);
  id v4;

  self->_isValid = 0;
  invalidationBlock = (void (**)(id, _SBFluidSwitcherSystemApertureSuppressionAssertion *))self->_invalidationBlock;
  if (invalidationBlock)
  {
    invalidationBlock[2](invalidationBlock, self);
    v4 = self->_invalidationBlock;
    self->_invalidationBlock = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationBlock, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
}

@end

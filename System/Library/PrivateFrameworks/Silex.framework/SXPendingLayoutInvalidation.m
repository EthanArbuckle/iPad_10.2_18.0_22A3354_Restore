@implementation SXPendingLayoutInvalidation

- (SXPendingLayoutInvalidation)initWithComponent:(id)a3 pendingPromise:(id)a4 layoutOptions:(id)a5 invalidation:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SXPendingLayoutInvalidation *v15;
  SXPendingLayoutInvalidation *v16;
  uint64_t v17;
  id invalidation;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SXPendingLayoutInvalidation;
  v15 = -[SXPendingLayoutInvalidation init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_component, a3);
    objc_storeStrong((id *)&v16->_pendingPromise, a4);
    objc_storeStrong((id *)&v16->_layoutOptions, a5);
    v17 = MEMORY[0x219A070A8](v14);
    invalidation = v16->_invalidation;
    v16->_invalidation = (id)v17;

  }
  return v16;
}

- (SXComponent)component
{
  return self->_component;
}

- (NFPendingPromise)pendingPromise
{
  return self->_pendingPromise;
}

- (SXLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (id)invalidation
{
  return self->_invalidation;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidation, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_pendingPromise, 0);
  objc_storeStrong((id *)&self->_component, 0);
}

@end

@implementation SBPhysicalButtonBehaviorRequest

- (FBScene)scene
{
  return (FBScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (SBPhysicalButtonBehaviorRequest)initWithPhysicalButtonConfiguration:(id)a3 generation:(unint64_t)a4 identifier:(unint64_t)a5 scene:(id)a6
{
  id v10;
  id v11;
  SBPhysicalButtonBehaviorRequest *v12;
  SBPhysicalButtonBehaviorRequest *v13;
  uint64_t v14;
  BSAuditToken *requestingProcessAuditToken;
  objc_super v17;

  v10 = a3;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SBPhysicalButtonBehaviorRequest;
  v12 = -[SBPhysicalButtonBehaviorRequest init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_scene, v11);
    v13->_identifier = a5;
    v13->_generation = a4;
    v13->_physicalButtonBehavior = objc_msgSend(v10, "_behavior");
    objc_msgSend(v10, "_auditToken");
    v14 = objc_claimAutoreleasedReturnValue();
    requestingProcessAuditToken = v13->_requestingProcessAuditToken;
    v13->_requestingProcessAuditToken = (BSAuditToken *)v14;

  }
  return v13;
}

- (unint64_t)physicalButtonBehavior
{
  return self->_physicalButtonBehavior;
}

- (BOOL)isEqual:(id)a3
{
  SBPhysicalButtonBehaviorRequest *v4;
  uint64_t v5;
  SBPhysicalButtonBehaviorRequest *v6;
  SBPhysicalButtonBehaviorRequest *v7;
  char v8;
  id *v9;
  id WeakRetained;
  id v11;

  v4 = (SBPhysicalButtonBehaviorRequest *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    if (v9 && (id)self->_physicalButtonBehavior == v9[1] && (id)self->_generation == v9[3])
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
      v11 = objc_loadWeakRetained(v9 + 4);
      if (BSEqualObjects())
        v8 = BSEqualObjects();
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (BSAuditToken)requestingProcessAuditToken
{
  return self->_requestingProcessAuditToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingProcessAuditToken, 0);
  objc_destroyWeak((id *)&self->_scene);
}

@end

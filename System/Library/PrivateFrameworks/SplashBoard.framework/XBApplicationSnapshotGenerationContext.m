@implementation XBApplicationSnapshotGenerationContext

- (XBApplicationSnapshotGenerationContext)initWithApplicationCompatibilityInfo:(id)a3 launchRequest:(id)a4 timeout:(double)a5
{
  id v10;
  id v11;
  XBApplicationSnapshotGenerationContext *v12;
  uint64_t v13;
  XBLaunchStateRequest *launchRequest;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)XBApplicationSnapshotGenerationContext;
  v12 = -[XBApplicationSnapshotGenerationContext init](&v18, sel_init);
  if (v12)
  {
    if (v10)
    {
      if (v11)
      {
LABEL_4:
        objc_storeStrong((id *)&v12->_applicationCompatibilityInfo, a3);
        v13 = objc_msgSend(v11, "copy");
        launchRequest = v12->_launchRequest;
        v12->_launchRequest = (XBLaunchStateRequest *)v13;

        v12->_timeout = a5;
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("XBApplicationSnapshotGenerationContext.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("applicationCompatibilityInfo"));

      if (v11)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("XBApplicationSnapshotGenerationContext.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("launchRequest"));

    goto LABEL_4;
  }
LABEL_5:

  return v12;
}

- (XBLaunchStateRequest)launchRequest
{
  return self->_launchRequest;
}

- (XBApplicationLaunchCompatibilityInfo)applicationCompatibilityInfo
{
  return self->_applicationCompatibilityInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchRequest, 0);
  objc_storeStrong((id *)&self->_applicationCompatibilityInfo, 0);
}

- (NSString)description
{
  return (NSString *)-[XBApplicationSnapshotGenerationContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[XBApplicationSnapshotGenerationContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x24BE38380], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[XBApplicationSnapshotGenerationContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  XBApplicationSnapshotGenerationContext *v11;

  v4 = a3;
  -[XBApplicationSnapshotGenerationContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __80__XBApplicationSnapshotGenerationContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_24D7F45F0;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __80__XBApplicationSnapshotGenerationContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("applicationCompatibilityInfo"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("launchRequest"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("timeout"), *(double *)(*(_QWORD *)(a1 + 40) + 24));
}

- (double)timeout
{
  return self->_timeout;
}

@end

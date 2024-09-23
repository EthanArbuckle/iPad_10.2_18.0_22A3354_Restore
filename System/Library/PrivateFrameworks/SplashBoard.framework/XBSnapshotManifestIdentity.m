@implementation XBSnapshotManifestIdentity

- (XBSnapshotManifestStore)store
{
  return self->_store;
}

- (NSString)defaultGroupIdentifier
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ - {DEFAULT GROUP}"), self->_bundleIdentifier);
}

+ (id)identityWithBundleIdentifier:(id)a3 store:(id)a4
{
  id v5;
  id v6;
  XBSnapshotManifestIdentity *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[XBSnapshotManifestIdentity initWithBundleIdentifier:store:]([XBSnapshotManifestIdentity alloc], "initWithBundleIdentifier:store:", v6, v5);

  return v7;
}

- (XBSnapshotManifestIdentity)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBSnapshotManifestIdentity.m"), 30, CFSTR("init is not allowed"));

  return -[XBSnapshotManifestIdentity initWithBundleIdentifier:store:](self, "initWithBundleIdentifier:store:", 0, 0);
}

- (XBSnapshotManifestIdentity)initWithBundleIdentifier:(id)a3 store:(id)a4
{
  id v7;
  id v8;
  void *v9;
  XBSnapshotManifestIdentity *v10;
  uint64_t v11;
  NSString *bundleIdentifier;
  void *v14;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBSnapshotManifestIdentity.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBSnapshotManifestIdentity.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("store"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)XBSnapshotManifestIdentity;
  v10 = -[XBSnapshotManifestIdentity init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v11;

    objc_storeStrong((id *)&v10->_store, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE38380], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_store, CFSTR("store"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BE38398], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_bundleIdentifier);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_store);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  XBSnapshotManifestIdentity *v4;
  void *v5;
  NSString *bundleIdentifier;
  uint64_t v7;
  XBSnapshotManifestIdentity *v8;
  id v9;
  XBSnapshotManifestStore *store;
  id v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  XBSnapshotManifestIdentity *v18;
  _QWORD v19[4];
  XBSnapshotManifestIdentity *v20;

  v4 = (XBSnapshotManifestIdentity *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE38390], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    bundleIdentifier = self->_bundleIdentifier;
    v7 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __38__XBSnapshotManifestIdentity_isEqual___block_invoke;
    v19[3] = &unk_24D7F44C8;
    v8 = v4;
    v20 = v8;
    v9 = (id)objc_msgSend(v5, "appendString:counterpart:", bundleIdentifier, v19);
    store = self->_store;
    v14 = v7;
    v15 = 3221225472;
    v16 = __38__XBSnapshotManifestIdentity_isEqual___block_invoke_2;
    v17 = &unk_24D7F44F0;
    v18 = v8;
    v11 = (id)objc_msgSend(v5, "appendObject:counterpart:", store, &v14);
    v12 = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  }
  return v12;
}

uint64_t __38__XBSnapshotManifestIdentity_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
}

uint64_t __38__XBSnapshotManifestIdentity_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "store");
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end

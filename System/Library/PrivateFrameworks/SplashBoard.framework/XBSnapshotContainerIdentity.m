@implementation XBSnapshotContainerIdentity

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (XBSnapshotContainerIdentity)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBSnapshotContainerIdentity.m"), 31, CFSTR("this constructor is disallowed"));

  return (XBSnapshotContainerIdentity *)-[XBSnapshotContainerIdentity _initWithBundleIdentifier:bundlePath:dataContainerPath:bundleContainerPath:](self, "_initWithBundleIdentifier:bundlePath:dataContainerPath:bundleContainerPath:", 0, 0, 0, 0);
}

- (id)_initWithBundleIdentifier:(id)a3 bundlePath:(id)a4 dataContainerPath:(id)a5 bundleContainerPath:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  XBSnapshotContainerIdentity *v15;
  uint64_t v16;
  NSString *bundleIdentifier;
  uint64_t v18;
  NSString *bundlePath;
  uint64_t v20;
  NSString *dataContainerPath;
  uint64_t v22;
  NSString *bundleContainerPath;
  void *v24;
  uint64_t v25;
  NSString *snapshotContainerPath;
  void *v28;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBSnapshotContainerIdentity.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  v29.receiver = self;
  v29.super_class = (Class)XBSnapshotContainerIdentity;
  v15 = -[XBSnapshotContainerIdentity init](&v29, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    bundleIdentifier = v15->_bundleIdentifier;
    v15->_bundleIdentifier = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    bundlePath = v15->_bundlePath;
    v15->_bundlePath = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    dataContainerPath = v15->_dataContainerPath;
    v15->_dataContainerPath = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    bundleContainerPath = v15->_bundleContainerPath;
    v15->_bundleContainerPath = (NSString *)v22;

    XBSnapshotPathForBundleIdentifierWithSandboxPath(v15->_bundleIdentifier, v15->_dataContainerPath);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    snapshotContainerPath = v15->_snapshotContainerPath;
    v15->_snapshotContainerPath = (NSString *)v25;

  }
  return v15;
}

+ (id)identityForApplicationRecord:(id)a3
{
  id v5;
  XBSnapshotContainerIdentity *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("XBSnapshotContainerIdentity.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("record"));

  }
  v6 = [XBSnapshotContainerIdentity alloc];
  objc_msgSend(v5, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataContainerURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleContainerURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[XBSnapshotContainerIdentity _initWithBundleIdentifier:bundlePath:dataContainerPath:bundleContainerPath:](v6, "_initWithBundleIdentifier:bundlePath:dataContainerPath:bundleContainerPath:", v7, v9, v11, v13);

  return v14;
}

+ (id)identityForBundleProxy:(id)a3
{
  id v5;
  XBSnapshotContainerIdentity *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("XBSnapshotContainerIdentity.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("proxy"));

  }
  v6 = [XBSnapshotContainerIdentity alloc];
  objc_msgSend(v5, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataContainerURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleContainerURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[XBSnapshotContainerIdentity _initWithBundleIdentifier:bundlePath:dataContainerPath:bundleContainerPath:](v6, "_initWithBundleIdentifier:bundlePath:dataContainerPath:bundleContainerPath:", v7, v9, v11, v13);

  return v14;
}

+ (id)identityForApplicationInfo:(id)a3
{
  id v3;
  XBSnapshotContainerIdentity *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a3)
  {
    v3 = a3;
    v4 = [XBSnapshotContainerIdentity alloc];
    objc_msgSend(v3, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataContainerURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleContainerURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[XBSnapshotContainerIdentity _initWithBundleIdentifier:bundlePath:dataContainerPath:bundleContainerPath:](v4, "_initWithBundleIdentifier:bundlePath:dataContainerPath:bundleContainerPath:", v5, v7, v9, v11);

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

+ (id)identityForCompatibilityInfo:(id)a3
{
  id v3;
  XBSnapshotContainerIdentity *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v3 = a3;
    v4 = [XBSnapshotContainerIdentity alloc];
    objc_msgSend(v3, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundlePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sandboxPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleContainerPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[XBSnapshotContainerIdentity _initWithBundleIdentifier:bundlePath:dataContainerPath:bundleContainerPath:](v4, "_initWithBundleIdentifier:bundlePath:dataContainerPath:bundleContainerPath:", v5, v6, v7, v8);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)snapshotContainerPathForGroupID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[XBSnapshotContainerIdentity snapshotContainerPath](self, "snapshotContainerPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)snapshotContainerPathForSnapshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "groupID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[XBSnapshotContainerIdentity snapshotContainerPathForGroupID:](self, "snapshotContainerPathForGroupID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "variantID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v5, "variantID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingPathComponent:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x24BE38398], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_bundleIdentifier);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_bundlePath);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_dataContainerPath);
  v7 = (id)objc_msgSend(v3, "appendObject:", self->_bundleContainerPath);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  XBSnapshotContainerIdentity *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (XBSnapshotContainerIdentity *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[XBSnapshotContainerIdentity bundleIdentifier](v4, "bundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualStrings())
      {
        -[XBSnapshotContainerIdentity bundlePath](v4, "bundlePath");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualStrings())
        {
          -[XBSnapshotContainerIdentity dataContainerPath](v4, "dataContainerPath");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (BSEqualStrings())
          {
            -[XBSnapshotContainerIdentity bundleContainerPath](v4, "bundleContainerPath");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = BSEqualStrings();

          }
          else
          {
            v9 = 0;
          }

        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  return -[XBSnapshotContainerIdentity descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[XBSnapshotContainerIdentity succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE38380], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_bundleIdentifier, CFSTR("identifier"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_dataContainerPath != 0, CFSTR("sandboxed"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[XBSnapshotContainerIdentity descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  XBSnapshotContainerIdentity *v11;

  v4 = a3;
  -[XBSnapshotContainerIdentity succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__XBSnapshotContainerIdentity_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_24D7F45F0;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __69__XBSnapshotContainerIdentity_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("bundlePath"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("bundleContainerPath"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("dataContainerPath"));
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (NSString)dataContainerPath
{
  return self->_dataContainerPath;
}

- (NSString)bundleContainerPath
{
  return self->_bundleContainerPath;
}

- (NSString)snapshotContainerPath
{
  return self->_snapshotContainerPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotContainerPath, 0);
  objc_storeStrong((id *)&self->_bundleContainerPath, 0);
  objc_storeStrong((id *)&self->_dataContainerPath, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end

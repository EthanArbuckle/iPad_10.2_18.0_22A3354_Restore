@implementation XBApplicationSnapshotGroup

- (NSSet)snapshots
{
  return &self->_snapshots->super;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_snapshots;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v11, "path", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("snapshots"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)removeSnapshot:(id)a3
{
  id v4;
  int v5;
  void *v6;
  NSMutableSet *snapshots;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = -[NSMutableSet containsObject:](self->_snapshots, "containsObject:", v4);
  if (v5)
  {
    -[NSMutableSet removeObject:](self->_snapshots, "removeObject:", v4);
    objc_msgSend(v4, "variantID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      snapshots = self->_snapshots;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __45__XBApplicationSnapshotGroup_removeSnapshot___block_invoke;
      v9[3] = &unk_24D7F5028;
      v10 = v4;
      -[NSMutableSet enumerateObjectsUsingBlock:](snapshots, "enumerateObjectsUsingBlock:", v9);

    }
  }

  return v5;
}

- (void)addSnapshot:(id)a3
{
  if (a3)
    -[NSMutableSet addObject:](self->_snapshots, "addObject:");
}

- (void)_commonInit
{
  NSMutableSet *v3;
  NSMutableSet *snapshots;

  v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  snapshots = self->_snapshots;
  self->_snapshots = v3;

}

- (id)_initWithIdentifier:(id)a3 containerIdentity:(id)a4
{
  id v6;
  id v7;
  XBApplicationSnapshotGroup *v8;
  XBApplicationSnapshotGroup *v9;
  uint64_t v10;
  NSString *identifier;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)XBApplicationSnapshotGroup;
  v8 = -[XBApplicationSnapshotGroup init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[XBApplicationSnapshotGroup _commonInit](v8, "_commonInit");
    v10 = objc_msgSend(v6, "copy");
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    objc_storeStrong((id *)&v9->_containerIdentity, a4);
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)-[XBApplicationSnapshotGroup descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)containerPath
{
  void *v3;
  void *v4;

  -[XBApplicationSnapshotGroup containerIdentity](self, "containerIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshotContainerPathForGroupID:", self->_identifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

uint64_t __45__XBApplicationSnapshotGroup_removeSnapshot___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "willDeleteVariant:", *(_QWORD *)(a1 + 32));
}

- (void)_manifestQueueDecode_setStore:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_snapshots;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_manifestQueueDecode_setStore:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)_validateWithContainerIdentity:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  id v22;
  BOOL v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSString *identifier;
  char v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSString *v42;
  char v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  NSString *v50;
  NSObject *v51;
  void *v53;
  void *v54;
  NSString *v55;
  void *v56;
  BOOL v57;
  id v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  XBApplicationSnapshotGroup *v63;
  void *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  _QWORD v71[4];
  id v72;
  XBApplicationSnapshotGroup *v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t v79[128];
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  NSString *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  id v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotGroup.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containerIdentity"));

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[XBApplicationSnapshotGroup containerIdentity](self, "containerIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();

  if ((v7 & 1) == 0)
    -[XBApplicationSnapshotGroup setContainerIdentity:](self, "setContainerIdentity:", v5);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshotContainerPathForGroupID:", self->_identifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v9;
  v63 = self;
  if (v9)
  {
    v60 = v5;
    objc_msgSend(v64, "enumeratorAtPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v76;
      v14 = *MEMORY[0x24BDD0D40];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v76 != v13)
            objc_enumerationMutation(v10);
          v16 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
          objc_msgSend(v10, "fileAttributes");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "fileType");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v14);

          if (v19)
            objc_msgSend(v8, "addObject:", v16);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
      }
      while (v12);
    }

    v9 = v62;
    self = v63;
    v5 = v60;
  }
  v20 = (void *)-[NSMutableSet copy](self->_snapshots, "copy");
  v71[0] = MEMORY[0x24BDAC760];
  v71[1] = 3221225472;
  v71[2] = __61__XBApplicationSnapshotGroup__validateWithContainerIdentity___block_invoke;
  v71[3] = &unk_24D7F5050;
  v21 = v5;
  v72 = v21;
  v73 = self;
  v22 = v8;
  v74 = v22;
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", v71);

  if (-[NSMutableSet count](self->_snapshots, "count"))
  {
    if (v9)
      v23 = self->_identifier == 0;
    else
      v23 = 1;
    v24 = !v23;
    if (!v9)
      goto LABEL_33;
  }
  else
  {
    v24 = 0;
    if (!v9)
      goto LABEL_33;
  }
  if (!v24)
  {
    XBLogFileManifest();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      -[XBApplicationSnapshotGroup containerIdentity](self, "containerIdentity");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bundleIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      identifier = self->_identifier;
      *(_DWORD *)buf = 138543874;
      v81 = v27;
      v82 = 2114;
      v83 = identifier;
      v84 = 2114;
      v85 = v9;
      _os_log_impl(&dword_217702000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Group %{public}@ deleting container with no valid snapshots: %{public}@", buf, 0x20u);

    }
    v70 = 0;
    v29 = objc_msgSend(v64, "removeItemAtPath:error:", v9, &v70);
    v30 = v70;
    v31 = v30;
    if ((v29 & 1) == 0)
    {
      objc_msgSend(v30, "domain");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x24BDD0B88]))
      {
        v33 = objc_msgSend(v31, "code");

        if (v33 == 4)
          goto LABEL_55;
      }
      else
      {

      }
      XBLogFileManifest();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        -[XBApplicationSnapshotGroup containerIdentity](self, "containerIdentity");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "bundleIdentifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = self->_identifier;
        *(_DWORD *)buf = 138544130;
        v81 = v54;
        v82 = 2114;
        v83 = v55;
        v84 = 2114;
        v85 = v9;
        v86 = 2114;
        v87 = v31;
        _os_log_error_impl(&dword_217702000, v51, OS_LOG_TYPE_ERROR, "[%{public}@] Error with Group %{public}@ deleting container with no valid snapshots at %{public}@: %{public}@", buf, 0x2Au);

      }
    }
    goto LABEL_55;
  }
LABEL_33:
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v31 = v22;
  v34 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
  if (v34)
  {
    v35 = v34;
    v57 = v24;
    v58 = v21;
    v36 = *(_QWORD *)v67;
    v61 = *MEMORY[0x24BDD0B88];
    while (1)
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v67 != v36)
          objc_enumerationMutation(v31);
        objc_msgSend(v9, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        XBLogFileManifest();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          -[XBApplicationSnapshotGroup containerIdentity](v63, "containerIdentity");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "bundleIdentifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v63->_identifier;
          v9 = v62;
          *(_DWORD *)buf = 138543874;
          v81 = v41;
          v82 = 2114;
          v83 = v42;
          v84 = 2114;
          v85 = v38;
          _os_log_impl(&dword_217702000, v39, OS_LOG_TYPE_DEFAULT, "[%{public}@] Group %{public}@ deleting unreferenced file: %{public}@", buf, 0x20u);

        }
        v65 = 0;
        v43 = objc_msgSend(v64, "removeItemAtPath:error:", v38, &v65);
        v44 = v65;
        v45 = v44;
        if ((v43 & 1) == 0)
        {
          objc_msgSend(v44, "domain");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v46, "isEqualToString:", v61))
          {
            v47 = objc_msgSend(v45, "code");

            if (v47 == 4)
              goto LABEL_48;
          }
          else
          {

          }
          XBLogFileManifest();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            -[XBApplicationSnapshotGroup containerIdentity](v63, "containerIdentity");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "bundleIdentifier");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = v63->_identifier;
            v9 = v62;
            *(_DWORD *)buf = 138544130;
            v81 = v49;
            v82 = 2114;
            v83 = v50;
            v84 = 2114;
            v85 = v38;
            v86 = 2114;
            v87 = v45;
            _os_log_error_impl(&dword_217702000, v48, OS_LOG_TYPE_ERROR, "[%{public}@] Error with Group %{public}@ deleting unreferenced file at %{public}@: %{public}@", buf, 0x2Au);

          }
        }
LABEL_48:

      }
      v35 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
      if (!v35)
      {
        v21 = v58;
        LOBYTE(v24) = v57;
        break;
      }
    }
  }
LABEL_55:

  return v24;
}

void __61__XBApplicationSnapshotGroup__validateWithContainerIdentity___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(v3, "_validateWithContainerIdentity:", a1[4]) & 1) != 0)
  {
    v4 = (void *)a1[6];
    objc_msgSend(v3, "filename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v5);

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v3, "variants", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v12 = (void *)a1[6];
          objc_msgSend(v11, "variantID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "filename");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringByAppendingPathComponent:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeObject:", v15);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1[5] + 24), "removeObject:", v3);
  }

}

- (void)_invalidate
{
  NSMutableSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_snapshots;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_invalidate", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (XBApplicationSnapshotGroup)initWithCoder:(id)a3
{
  id v4;
  XBApplicationSnapshotGroup *v5;
  XBApplicationSnapshotGroup *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSMutableSet *snapshots;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)XBApplicationSnapshotGroup;
  v5 = -[XBApplicationSnapshotGroup init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    -[XBApplicationSnapshotGroup _commonInit](v5, "_commonInit");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    v9 = (void *)MEMORY[0x219A10C5C]();
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("snapshots"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      snapshots = v6->_snapshots;
      v6->_snapshots = (NSMutableSet *)v14;

    }
    objc_autoreleasePoolPop(v9);
  }

  return v6;
}

- (id)descriptionForStateCaptureWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[XBApplicationSnapshotGroup succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __76__XBApplicationSnapshotGroup_descriptionForStateCaptureWithMultilinePrefix___block_invoke;
  v9[3] = &unk_24D7F4638;
  v9[4] = self;
  v6 = v5;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);
  if (*((_BYTE *)v13 + 24))
  {
    objc_msgSend(v6, "build");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __76__XBApplicationSnapshotGroup_descriptionForStateCaptureWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "activeMultilinePrefix", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "descriptionForStateCaptureWithMultilinePrefix:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
          v10 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", v9, 0);
        }

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[XBApplicationSnapshotGroup succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE38380], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[XBApplicationSnapshotGroup descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[XBApplicationSnapshotGroup succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet allObjects](self->_snapshots, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v6, 0, v4, 1);

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (XBSnapshotContainerIdentity)containerIdentity
{
  return (XBSnapshotContainerIdentity *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContainerIdentity:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshots, 0);
  objc_storeStrong((id *)&self->_containerIdentity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

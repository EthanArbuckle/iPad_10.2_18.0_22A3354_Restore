@implementation _SBAppSwitcherSnapshotCacheKey

- (unint64_t)hash
{
  return self->_hash;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDisplayItem:inAppLayout:", self->_displayItem, self->_appLayout);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayItem, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

- (_SBAppSwitcherSnapshotCacheKey)initWithDisplayItem:(id)a3 inAppLayout:(id)a4
{
  id v8;
  id v9;
  _SBAppSwitcherSnapshotCacheKey *v10;
  void *v11;
  id v12;
  id v13;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_SBAppSwitcherSnapshotCacheKey;
  v10 = -[_SBAppSwitcherSnapshotCacheKey init](&v17, sel_init);
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
LABEL_4:
        objc_storeStrong((id *)&v10->_displayItem, a3);
        objc_storeStrong((id *)&v10->_appLayout, a4);
        objc_msgSend(MEMORY[0x1E0D01788], "builder");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v11, "appendObject:", v10->_displayItem);
        v13 = (id)objc_msgSend(v11, "appendObject:", v10->_appLayout);
        v10->_hash = objc_msgSend(v11, "hash");

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("SBAppSwitcherSnapshotImageCache.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayItem"));

      if (v9)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("SBAppSwitcherSnapshotImageCache.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout"));

    goto LABEL_4;
  }
LABEL_5:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  v5 = objc_opt_class();
  SBSafeCast(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "displayItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", self->_displayItem))
    {
      objc_msgSend(v6, "appLayout");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", self->_appLayout);

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

  return v9;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (SBDisplayItem)displayItem
{
  return self->_displayItem;
}

@end

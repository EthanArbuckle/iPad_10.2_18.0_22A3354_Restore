@implementation SBAppSwitcherSnapshotCacheEntry

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_appLayout, CFSTR("appLayout"), 0);
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_displayItem, CFSTR("displayItem"), 0);
  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_snapshot, CFSTR("snapshot"), 0);
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_snapshotImage, CFSTR("snapshotImage"), 0);
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", self->_fromFullSizeSnapshotRequest, CFSTR("fromFullSizeSnapshot"));
  v9 = (id)objc_msgSend(v3, "appendBool:withName:", self->_needsUpdate, CFSTR("needsUpdate"));
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)role
{
  void *v3;
  void *v4;
  int64_t v5;

  -[SBAppSwitcherSnapshotCacheEntry appLayout](self, "appLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherSnapshotCacheEntry displayItem](self, "displayItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "layoutRoleForItem:", v4);

  return v5;
}

- (BOOL)_matchesAppLayout:(id)a3 displayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  char v11;

  v6 = a4;
  v7 = a3;
  -[SBAppSwitcherSnapshotCacheEntry appLayout](self, "appLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v7);

  if (v9)
  {
    -[SBAppSwitcherSnapshotCacheEntry displayItem](self, "displayItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v6);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (void)setAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_appLayout, a3);
}

- (SBDisplayItem)displayItem
{
  return self->_displayItem;
}

- (void)setDisplayItem:(id)a3
{
  objc_storeStrong((id *)&self->_displayItem, a3);
}

- (XBApplicationSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
}

- (UIImage)snapshotImage
{
  return self->_snapshotImage;
}

- (void)setSnapshotImage:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotImage, a3);
}

- (BOOL)fromFullSizeSnapshotRequest
{
  return self->_fromFullSizeSnapshotRequest;
}

- (void)setFromFullSizeSnapshotRequest:(BOOL)a3
{
  self->_fromFullSizeSnapshotRequest = a3;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotImage, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_displayItem, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end

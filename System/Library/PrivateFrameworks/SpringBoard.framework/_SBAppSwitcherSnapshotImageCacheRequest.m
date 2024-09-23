@implementation _SBAppSwitcherSnapshotImageCacheRequest

- (_SBAppSwitcherSnapshotImageCacheRequest)initWithSequenceID:(unint64_t)a3
{
  _SBAppSwitcherSnapshotImageCacheRequest *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SBAppSwitcherSnapshotImageCacheRequest;
  result = -[_SBAppSwitcherSnapshotImageCacheRequest init](&v5, sel_init);
  if (result)
    result->_sequenceID = a3;
  return result;
}

- (NSString)description
{
  return (NSString *)-[_SBAppSwitcherSnapshotImageCacheRequest descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_SBAppSwitcherSnapshotImageCacheRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBAppSwitcherSnapshotImageCacheRequest displayItem](self, "displayItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("displayID"));

  -[_SBAppSwitcherSnapshotImageCacheRequest snapshot](self, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("snapshot"));

  v9 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[_SBAppSwitcherSnapshotImageCacheRequest sequenceID](self, "sequenceID"), CFSTR("sequenceID"));
  v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[_SBAppSwitcherSnapshotImageCacheRequest loadFullSizeSnapshot](self, "loadFullSizeSnapshot"), CFSTR("loadFullSizeSnapshot"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_SBAppSwitcherSnapshotImageCacheRequest descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)sequenceID
{
  return self->_sequenceID;
}

- (BOOL)loadFullSizeSnapshot
{
  return self->_loadFullSizeSnapshot;
}

- (void)setLoadFullSizeSnapshot:(BOOL)a3
{
  self->_loadFullSizeSnapshot = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_displayItem, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end

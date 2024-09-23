@implementation SBRequestFolderSnapshotsSwitcherEventResponse

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBRequestFolderSnapshotsSwitcherEventResponse;
  -[SBChainableModifierEventResponse descriptionBuilderWithMultilinePrefix:](&v7, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", self->_snapshotRequested, CFSTR("snapshotRequested"));
  return v4;
}

- (SBRequestFolderSnapshotsSwitcherEventResponse)initWithSnapshotRequest:(BOOL)a3
{
  SBRequestFolderSnapshotsSwitcherEventResponse *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBRequestFolderSnapshotsSwitcherEventResponse;
  result = -[SBChainableModifierEventResponse init](&v5, sel_init);
  if (result)
    result->_snapshotRequested = a3;
  return result;
}

- (int64_t)type
{
  return 26;
}

- (BOOL)isSnapshotRequested
{
  return self->_snapshotRequested;
}

- (void)setSnapshotRequested:(BOOL)a3
{
  self->_snapshotRequested = a3;
}

@end

@implementation SBInvalidateSnapshotCacheSwitcherEventResponse

- (int64_t)type
{
  return 29;
}

- (SBInvalidateSnapshotCacheSwitcherEventResponse)initWithDisplayItems:(id)a3
{
  id v4;
  SBInvalidateSnapshotCacheSwitcherEventResponse *v5;
  uint64_t v6;
  NSArray *displayItems;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBInvalidateSnapshotCacheSwitcherEventResponse;
  v5 = -[SBChainableModifierEventResponse init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    displayItems = v5->_displayItems;
    v5->_displayItems = (NSArray *)v6;

  }
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  NSArray *displayItems;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBInvalidateSnapshotCacheSwitcherEventResponse;
  -[SBChainableModifierEventResponse descriptionBuilderWithMultilinePrefix:](&v8, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  displayItems = self->_displayItems;
  if (displayItems)
    objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", displayItems, CFSTR("displayItems"), 0);
  else
    objc_msgSend(v4, "appendString:withName:", CFSTR("(all)"), CFSTR("displayItems"));
  return v5;
}

- (NSArray)displayItems
{
  return self->_displayItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayItems, 0);
}

@end

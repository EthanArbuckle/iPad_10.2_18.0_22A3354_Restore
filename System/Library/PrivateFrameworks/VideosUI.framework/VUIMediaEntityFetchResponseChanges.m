@implementation VUIMediaEntityFetchResponseChanges

- (VUIMediaEntityFetchResponseChanges)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VUIMediaEntityFetchResponseChanges)initWithMediaEntitiesChangeSet:(id)a3
{
  id v5;
  VUIMediaEntityFetchResponseChanges *v6;
  VUIMediaEntityFetchResponseChanges *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIMediaEntityFetchResponseChanges;
  v6 = -[VUIMediaEntityFetchResponseChanges init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mediaEntitiesChangeSet, a3);

  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15.receiver = self;
  v15.super_class = (Class)VUIMediaEntityFetchResponseChanges;
  -[VUIMediaEntityFetchResponseChanges description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityFetchResponseChanges mediaEntitiesChangeSet](self, "mediaEntitiesChangeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("mediaEntitiesChangeSet"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityFetchResponseChanges groupingChangeSet](self, "groupingChangeSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("groupingChangeSet"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@>"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (VUICollectionChangeSet)mediaEntitiesChangeSet
{
  return self->_mediaEntitiesChangeSet;
}

- (void)setMediaEntitiesChangeSet:(id)a3
{
  objc_storeStrong((id *)&self->_mediaEntitiesChangeSet, a3);
}

- (VUICollectionChangeSet)groupingChangeSet
{
  return self->_groupingChangeSet;
}

- (void)setGroupingChangeSet:(id)a3
{
  objc_storeStrong((id *)&self->_groupingChangeSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingChangeSet, 0);
  objc_storeStrong((id *)&self->_mediaEntitiesChangeSet, 0);
}

@end

@implementation VUIMediaItemEntityTypesFetchResponseChanges

- (VUIMediaItemEntityTypesFetchResponseChanges)init
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

- (VUIMediaItemEntityTypesFetchResponseChanges)initWithMediaItemEntityTypesChangeSet:(id)a3 localMediaItemsAvailableDidChange:(BOOL)a4
{
  id v7;
  VUIMediaItemEntityTypesFetchResponseChanges *v8;
  VUIMediaItemEntityTypesFetchResponseChanges *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUIMediaItemEntityTypesFetchResponseChanges;
  v8 = -[VUIMediaItemEntityTypesFetchResponseChanges init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mediaItemEntityTypesChangeSet, a3);
    v9->_localMediaItemsAvailableDidChange = a4;
  }

  return v9;
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
  v15.super_class = (Class)VUIMediaItemEntityTypesFetchResponseChanges;
  -[VUIMediaItemEntityTypesFetchResponseChanges description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItemEntityTypesFetchResponseChanges mediaItemEntityTypesChangeSet](self, "mediaItemEntityTypesChangeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("mediaItemEntityTypesChangeSet"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItemEntityTypesFetchResponseChanges localMediaItemsAvailableDidChange](self, "localMediaItemsAvailableDidChange");
  VUIBoolLogString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("localMediaItemsAvailableDidChange"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@>"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (VUICollectionChangeSet)mediaItemEntityTypesChangeSet
{
  return self->_mediaItemEntityTypesChangeSet;
}

- (BOOL)localMediaItemsAvailableDidChange
{
  return self->_localMediaItemsAvailableDidChange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItemEntityTypesChangeSet, 0);
}

@end

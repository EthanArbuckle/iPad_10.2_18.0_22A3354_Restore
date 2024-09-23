@implementation VUIMediaItemEntityTypesFetchResponse

- (VUIMediaItemEntityTypesFetchResponse)init
{
  VUIMediaItemEntityTypesFetchResponse *v2;
  uint64_t v3;
  NSOrderedSet *mediaItemEntityTypes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIMediaItemEntityTypesFetchResponse;
  v2 = -[VUIMediaItemEntityTypesFetchResponse init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v3 = objc_claimAutoreleasedReturnValue();
    mediaItemEntityTypes = v2->_mediaItemEntityTypes;
    v2->_mediaItemEntityTypes = (NSOrderedSet *)v3;

  }
  return v2;
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
  v15.super_class = (Class)VUIMediaItemEntityTypesFetchResponse;
  -[VUIMediaItemEntityTypesFetchResponse description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItemEntityTypesFetchResponse mediaItemEntityTypes](self, "mediaItemEntityTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("mediaItemEntityTypes"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItemEntityTypesFetchResponse areLocalMediaItemsAvailable](self, "areLocalMediaItemsAvailable");
  VUIBoolLogString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("areLocalMediaItemsAvailable"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@>"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)_updateWithResponse:(id)a3 changes:(id)a4 replaceContentsOnNilChanges:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[VUIMediaItemEntityTypesFetchResponse mediaItemEntityTypes](self, "mediaItemEntityTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v8, "mediaItemEntityTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "mediaItemEntityTypesChangeSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v12, "vui_applyChangeSetIfAvailable:destinationObjects:replaceContentsOnNilChanges:", v15, v14, v5);

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaItemEntityTypesFetchResponse setMediaItemEntityTypes:](self, "setMediaItemEntityTypes:", v17);

  }
  if (objc_msgSend(v9, "localMediaItemsAvailableDidChange"))
  {
    -[VUIMediaItemEntityTypesFetchResponse setLocalMediaItemsAvailable:](self, "setLocalMediaItemsAvailable:", objc_msgSend(v8, "areLocalMediaItemsAvailable"));
    LOBYTE(v16) = 1;
  }

  return v16;
}

- (NSOrderedSet)mediaItemEntityTypes
{
  return self->_mediaItemEntityTypes;
}

- (void)setMediaItemEntityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)areLocalMediaItemsAvailable
{
  return self->_localMediaItemsAvailable;
}

- (void)setLocalMediaItemsAvailable:(BOOL)a3
{
  self->_localMediaItemsAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItemEntityTypes, 0);
}

@end

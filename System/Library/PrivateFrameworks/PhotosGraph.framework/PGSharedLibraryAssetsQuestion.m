@implementation PGSharedLibraryAssetsQuestion

- (PGSharedLibraryAssetsQuestion)initWithAssetUUID:(id)a3
{
  id v4;
  PGSharedLibraryAssetsQuestion *v5;
  uint64_t v6;
  NSString *entityIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGSharedLibraryAssetsQuestion;
  v5 = -[PGSharedLibraryAssetsQuestion init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    entityIdentifier = v5->_entityIdentifier;
    v5->_entityIdentifier = (NSString *)v6;

    v5->_state = 0;
  }

  return v5;
}

- (unsigned)type
{
  return 20;
}

- (unsigned)displayType
{
  return 0;
}

- (unsigned)entityType
{
  return 0;
}

- (BOOL)isEquivalentToQuestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(v4, "entityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSharedLibraryAssetsQuestion entityIdentifier](self, "entityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6)
    && (v7 = objc_msgSend(v4, "entityType"), v7 == -[PGSharedLibraryAssetsQuestion entityType](self, "entityType")))
  {
    v8 = objc_msgSend(v4, "type");
    v9 = v8 == -[PGSharedLibraryAssetsQuestion type](self, "type");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEquivalentToPersistedQuestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(v4, "entityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSharedLibraryAssetsQuestion entityIdentifier](self, "entityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6)
    && (v7 = objc_msgSend(v4, "entityType"), v7 == -[PGSharedLibraryAssetsQuestion entityType](self, "entityType")))
  {
    v8 = objc_msgSend(v4, "type");
    v9 = v8 == -[PGSharedLibraryAssetsQuestion type](self, "type") || objc_msgSend(v4, "type") == 23;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)entityIdentifier
{
  return self->_entityIdentifier;
}

- (unsigned)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end

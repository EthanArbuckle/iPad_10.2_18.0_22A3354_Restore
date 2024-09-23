@implementation PGSyndicatedAssetsQuestion

- (PGSyndicatedAssetsQuestion)initWithAssetSyndicationIdentifier:(id)a3
{
  id v5;
  PGSyndicatedAssetsQuestion *v6;
  PGSyndicatedAssetsQuestion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGSyndicatedAssetsQuestion;
  v6 = -[PGSyndicatedAssetsQuestion init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_entityIdentifier, a3);
    v7->_state = 0;
  }

  return v7;
}

- (unsigned)type
{
  return 18;
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
  -[PGSyndicatedAssetsQuestion entityIdentifier](self, "entityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6)
    && (v7 = objc_msgSend(v4, "entityType"), v7 == -[PGSyndicatedAssetsQuestion entityType](self, "entityType")))
  {
    v8 = objc_msgSend(v4, "type");
    v9 = v8 == -[PGSyndicatedAssetsQuestion type](self, "type");
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
  -[PGSyndicatedAssetsQuestion entityIdentifier](self, "entityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6)
    && (v7 = objc_msgSend(v4, "entityType"), v7 == -[PGSyndicatedAssetsQuestion entityType](self, "entityType")))
  {
    v8 = objc_msgSend(v4, "type");
    v9 = v8 == -[PGSyndicatedAssetsQuestion type](self, "type");
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

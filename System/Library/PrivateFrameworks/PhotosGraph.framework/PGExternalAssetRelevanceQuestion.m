@implementation PGExternalAssetRelevanceQuestion

- (PGExternalAssetRelevanceQuestion)initWithAssetUUID:(id)a3 momentLocalIdentifiers:(id)a4 assetInferredAsRelevant:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  PGExternalAssetRelevanceQuestion *v11;
  PGExternalAssetRelevanceQuestion *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSDictionary *additionalInfo;
  objc_super v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v5 = a5;
  v22[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PGExternalAssetRelevanceQuestion;
  v11 = -[PGExternalAssetRelevanceQuestion init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entityIdentifier, a3);
    v12->_state = 0;
    v21[0] = *MEMORY[0x1E0D78008];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0CD1D70];
    v22[0] = v13;
    v22[1] = v10;
    v15 = *MEMORY[0x1E0D77FC8];
    v21[1] = v14;
    v21[2] = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *MEMORY[0x1E0D77F38]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v17 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v12->_additionalInfo;
    v12->_additionalInfo = (NSDictionary *)v17;

  }
  return v12;
}

- (unsigned)type
{
  return 29;
}

- (unsigned)displayType
{
  return 1;
}

- (unsigned)entityType
{
  return 0;
}

- (id)entityIdentifier
{
  return self->_entityIdentifier;
}

- (unsigned)state
{
  return self->_state;
}

- (id)additionalInfo
{
  return self->_additionalInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end

@implementation PGFeaturedPhotoQuestion

- (PGFeaturedPhotoQuestion)initWithAssetUUID:(id)a3 suggestionType:(unsigned __int16)a4 suggestionSubtype:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v9;
  PGFeaturedPhotoQuestion *v10;
  PGFeaturedPhotoQuestion *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDictionary *additionalInfo;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v5 = a5;
  v6 = a4;
  v19[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PGFeaturedPhotoQuestion;
  v10 = -[PGFeaturedPhotoQuestion init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_entityIdentifier, a3);
    v11->_state = 0;
    v18[0] = CFSTR("suggestionType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = CFSTR("suggestionSubType");
    v19[0] = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v14 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v11->_additionalInfo;
    v11->_additionalInfo = (NSDictionary *)v14;

  }
  return v11;
}

- (unsigned)type
{
  return 14;
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
  -[PGFeaturedPhotoQuestion entityIdentifier](self, "entityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6)
    && (v7 = objc_msgSend(v4, "entityType"), v7 == -[PGFeaturedPhotoQuestion entityType](self, "entityType")))
  {
    v8 = objc_msgSend(v4, "type");
    v9 = v8 == -[PGFeaturedPhotoQuestion type](self, "type");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)additionalInfo
{
  return self->_additionalInfo;
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
  objc_storeStrong((id *)&self->_additionalInfo, 0);
}

@end

@implementation PLPrefetchResourceIdentifier

- (PLPrefetchResourceIdentifier)initWithAssetUuid:(id)a3 version:(unsigned int)a4 cplType:(unint64_t)a5 recipeID:(unsigned int)a6
{
  id v11;
  PLPrefetchResourceIdentifier *v12;
  PLPrefetchResourceIdentifier *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLPrefetchResourceIdentifier;
  v12 = -[PLPrefetchResourceIdentifier init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetUuid, a3);
    v13->_cplType = a5;
    v13->_version = a4;
    v13->_recipeID = a6;
  }

  return v13;
}

- (unint64_t)hash
{
  return (self->_version | (16 * self->_cplType)) ^ -[NSString hash](self->_assetUuid, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  PLPrefetchResourceIdentifier *v6;
  uint64_t v7;
  BOOL v8;
  PLPrefetchResourceIdentifier *v9;
  void *v10;
  uint64_t v11;
  NSString *assetUuid;
  int v13;
  BOOL v14;
  unsigned int version;
  unint64_t cplType;
  unsigned int recipeID;

  v6 = (PLPrefetchResourceIdentifier *)a3;
  if (self == v6)
  {
    v8 = 1;
    goto LABEL_20;
  }
  v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    v9 = v6;
    -[PLPrefetchResourceIdentifier assetUuid](v9, "assetUuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 || self->_assetUuid)
    {
      -[PLPrefetchResourceIdentifier assetUuid](v9, "assetUuid");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v8 = 0;
        goto LABEL_19;
      }
      v3 = (void *)v11;
      assetUuid = self->_assetUuid;
      -[PLPrefetchResourceIdentifier assetUuid](v9, "assetUuid");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqual:](assetUuid, "isEqual:", v4))
      {
        v14 = 0;
        goto LABEL_18;
      }
      v13 = 1;
    }
    else
    {
      v13 = 0;
    }
    version = self->_version;
    if (version == -[PLPrefetchResourceIdentifier version](v9, "version"))
    {
      cplType = self->_cplType;
      if (cplType == -[PLPrefetchResourceIdentifier cplType](v9, "cplType"))
      {
        recipeID = self->_recipeID;
        v14 = recipeID == -[PLPrefetchResourceIdentifier recipeID](v9, "recipeID");
        v8 = v14;
        if ((v13 & 1) == 0)
          goto LABEL_19;
        goto LABEL_18;
      }
    }
    v14 = 0;
    v8 = 0;
    if (v13)
    {
LABEL_18:

      v8 = v14;
    }
LABEL_19:

    goto LABEL_20;
  }
  v8 = 0;
LABEL_20:

  return v8;
}

- (id)description
{
  return (id)objc_msgSend((id)objc_opt_class(), "resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:", self->_assetUuid, self->_version, self->_cplType, self->_recipeID);
}

- (NSString)assetUuid
{
  return self->_assetUuid;
}

- (unsigned)version
{
  return self->_version;
}

- (unint64_t)cplType
{
  return self->_cplType;
}

- (unsigned)recipeID
{
  return self->_recipeID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUuid, 0);
}

+ (id)resourceDescriptionWithAssetUuid:(id)a3 resourceVersion:(unsigned int)a4 cplType:(unint64_t)a5 recipeID:(unsigned int)a6
{
  uint64_t v6;
  void *v9;
  id v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;

  v6 = *(_QWORD *)&a6;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = a3;
  if (a4 > 2)
    v11 = CFSTR("cur");
  else
    v11 = off_1E3662340[a4];
  v12 = v11;
  objc_msgSend(MEMORY[0x1E0D11440], "shortDescriptionForResourceType:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@-%@-%@(%u)"), v10, v12, v13, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end

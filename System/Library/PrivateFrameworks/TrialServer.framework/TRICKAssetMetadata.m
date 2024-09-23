@implementation TRICKAssetMetadata

- (TRICKAssetMetadata)initWithType:(unsigned __int8)a3 namespaceNameForEncryptionKey:(id)a4 treatmentIndex:(id)a5 downloadSize:(unint64_t)a6 compressionMode:(unint64_t)a7
{
  id v13;
  id v14;
  TRICKAssetMetadata *v15;
  TRICKAssetMetadata *v16;
  objc_super v18;

  v13 = a4;
  v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)TRICKAssetMetadata;
  v15 = -[TRICKAssetMetadata init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_type = a3;
    objc_storeStrong((id *)&v15->_namespaceNameForEncryptionKey, a4);
    objc_storeStrong((id *)&v16->_treatmentIndex, a5);
    v16->_downloadSize = a6;
    v16->_compressionMode = a7;
  }

  return v16;
}

+ (id)metadataWithType:(unsigned __int8)a3 namespaceNameForEncryptionKey:(id)a4 treatmentIndex:(id)a5 downloadSize:(unint64_t)a6 compressionMode:(unint64_t)a7
{
  uint64_t v10;
  id v12;
  id v13;
  void *v14;

  v10 = a3;
  v12 = a5;
  v13 = a4;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:namespaceNameForEncryptionKey:treatmentIndex:downloadSize:compressionMode:", v10, v13, v12, a6, a7);

  return v14;
}

- (id)copyWithReplacementType:(unsigned __int8)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:namespaceNameForEncryptionKey:treatmentIndex:downloadSize:compressionMode:", a3, self->_namespaceNameForEncryptionKey, self->_treatmentIndex, self->_downloadSize, self->_compressionMode);
}

- (id)copyWithReplacementNamespaceNameForEncryptionKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:namespaceNameForEncryptionKey:treatmentIndex:downloadSize:compressionMode:", self->_type, v4, self->_treatmentIndex, self->_downloadSize, self->_compressionMode);

  return v5;
}

- (id)copyWithReplacementTreatmentIndex:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:namespaceNameForEncryptionKey:treatmentIndex:downloadSize:compressionMode:", self->_type, self->_namespaceNameForEncryptionKey, v4, self->_downloadSize, self->_compressionMode);

  return v5;
}

- (id)copyWithReplacementDownloadSize:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:namespaceNameForEncryptionKey:treatmentIndex:downloadSize:compressionMode:", self->_type, self->_namespaceNameForEncryptionKey, self->_treatmentIndex, a3, self->_compressionMode);
}

- (id)copyWithReplacementCompressionMode:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:namespaceNameForEncryptionKey:treatmentIndex:downloadSize:compressionMode:", self->_type, self->_namespaceNameForEncryptionKey, self->_treatmentIndex, self->_downloadSize, a3);
}

- (BOOL)isEqualToMetadata:(id)a3
{
  id v4;
  void *v5;
  int type;
  int v7;
  void *v8;
  int v9;
  NSString *namespaceNameForEncryptionKey;
  void *v11;
  int v12;
  int v13;
  void *v14;
  int v15;
  TRITreatmentQualifiedAssetIndex *treatmentIndex;
  void *v17;
  _BOOL4 v18;
  unint64_t downloadSize;
  unint64_t compressionMode;
  BOOL v21;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_11;
  type = self->_type;
  if (type != objc_msgSend(v4, "type"))
    goto LABEL_11;
  v7 = self->_namespaceNameForEncryptionKey != 0;
  objc_msgSend(v5, "namespaceNameForEncryptionKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (v7 == v9)
    goto LABEL_11;
  namespaceNameForEncryptionKey = self->_namespaceNameForEncryptionKey;
  if (namespaceNameForEncryptionKey)
  {
    objc_msgSend(v5, "namespaceNameForEncryptionKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NSString isEqual:](namespaceNameForEncryptionKey, "isEqual:", v11);

    if (!v12)
      goto LABEL_11;
  }
  v13 = self->_treatmentIndex != 0;
  objc_msgSend(v5, "treatmentIndex");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v13 == v15)
    goto LABEL_11;
  treatmentIndex = self->_treatmentIndex;
  if (treatmentIndex)
  {
    objc_msgSend(v5, "treatmentIndex");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[TRITreatmentQualifiedAssetIndex isEqual:](treatmentIndex, "isEqual:", v17);

    if (!v18)
      goto LABEL_11;
  }
  downloadSize = self->_downloadSize;
  if (downloadSize == objc_msgSend(v5, "downloadSize"))
  {
    compressionMode = self->_compressionMode;
    v21 = compressionMode == objc_msgSend(v5, "compressionMode");
  }
  else
  {
LABEL_11:
    v21 = 0;
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  TRICKAssetMetadata *v4;
  TRICKAssetMetadata *v5;
  BOOL v6;

  v4 = (TRICKAssetMetadata *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRICKAssetMetadata isEqualToMetadata:](self, "isEqualToMetadata:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t type;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;

  type = self->_type;
  v4 = -[NSString hash](self->_namespaceNameForEncryptionKey, "hash") - type + 32 * type;
  v5 = -[TRITreatmentQualifiedAssetIndex hash](self->_treatmentIndex, "hash");
  v6 = self->_downloadSize - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
  return self->_compressionMode - v6 + 32 * v6;
}

- (id)description
{
  id v3;
  void *v4;
  NSString *namespaceNameForEncryptionKey;
  TRITreatmentQualifiedAssetIndex *treatmentIndex;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  namespaceNameForEncryptionKey = self->_namespaceNameForEncryptionKey;
  treatmentIndex = self->_treatmentIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_downloadSize);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_compressionMode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRICKAssetMetadata | type:%@ namespaceNameForEncryptionKey:%@ treatmentIndex:%@ downloadSize:%@ compressionMode:%@>"), v4, namespaceNameForEncryptionKey, treatmentIndex, v7, v8);

  return v9;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)namespaceNameForEncryptionKey
{
  return self->_namespaceNameForEncryptionKey;
}

- (TRITreatmentQualifiedAssetIndex)treatmentIndex
{
  return self->_treatmentIndex;
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (unint64_t)compressionMode
{
  return self->_compressionMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentIndex, 0);
  objc_storeStrong((id *)&self->_namespaceNameForEncryptionKey, 0);
}

@end

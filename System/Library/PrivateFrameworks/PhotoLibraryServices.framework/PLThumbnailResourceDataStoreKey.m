@implementation PLThumbnailResourceDataStoreKey

+ (BOOL)representsSquareResourceForPayloadKeyData:(unint64_t)a3
{
  return (a3 & 0x18) == 0;
}

+ (unsigned)recipeIDForTableType:(unsigned int)a3 inStore:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v4 = *(_QWORD *)&a3;
  objc_msgSend(a4, "thumbnailFormatsByTableType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = (2 * objc_msgSend(v7, "formatID")) | 0x30001;
  else
    v8 = 0;

  return v8;
}

- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGImage *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  if ((*(_DWORD *)&self->_keyStruct & 0x10) != 0)
  {
    +[PLResourceModelValidationError malformedTableThumbnailKeyErrorForKey:assetID:](PLResourceModelValidationError, "malformedTableThumbnailKeyErrorForKey:assetID:", self, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(v6, "libraryID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLDataStoreForClassIDAndLibraryID(1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (CGImage *)objc_msgSend(v11, "newTableThumbImageForKey:", self);
  if (!v12)
  {
    +[PLResourceModelValidationError unreachableTableThumbnailErrorForKey:assetID:](PLResourceModelValidationError, "unreachableTableThumbnailErrorForKey:assetID:", self, v6);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if ((objc_msgSend(v11, "thumbnailForKey:matchesAssetID:", self, v6) & 1) == 0)
  {
    +[PLResourceModelValidationError tableThumbUUIDMistmatchErrorForKey:indexFromKey:assetID:](PLResourceModelValidationError, "tableThumbUUIDMistmatchErrorForKey:indexFromKey:assetID:", self, ((*(_DWORD *)&self->_keyStruct | ((unint64_t)*((unsigned __int8 *)&self->_keyStruct + 4) << 32)) >> 6) & 0x7FFFFFF, v6);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v14 = (void *)v13;
    objc_msgSend(v8, "arrayByAddingObject:", v13);
    v15 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v15;
  }
  CGImageRelease(v12);

  return v8;
}

- (PLThumbnailResourceDataStoreKey)initWithKeyStruct:(const void *)a3
{
  PLThumbnailResourceDataStoreKey *result;
  int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLThumbnailResourceDataStoreKey;
  result = -[PLThumbnailResourceDataStoreKey init](&v6, sel_init);
  if (result)
  {
    v5 = *(_DWORD *)a3;
    *((_BYTE *)&result->_keyStruct + 4) = *((_BYTE *)a3 + 4);
    *(_DWORD *)&result->_keyStruct = v5;
  }
  return result;
}

- (id)keyData
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->_keyStruct, 5);
}

- (id)fileURLForAssetID:(id)a3
{
  return 0;
}

- (id)uniformTypeIdentifier
{
  return (id)objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
}

- (BOOL)representsSquareResource
{
  return (*(_DWORD *)&self->_keyStruct & 0x18) == 0;
}

- (void)tableType:(unsigned int *)a3 index:(int *)a4
{
  if (a3)
    *a3 = (*(_DWORD *)&self->_keyStruct >> 2) & 7;
  if (a4)
    *a4 = ((*(_DWORD *)&self->_keyStruct | ((unint64_t)*((unsigned __int8 *)&self->_keyStruct + 4) << 32)) >> 6) & 0x7FFFFFF;
}

- (unsigned)resourceType
{
  return 0;
}

- (unsigned)resourceVersion
{
  return 3;
}

- (BOOL)isDerivative
{
  return 1;
}

- (int)index
{
  return ((*(_DWORD *)&self->_keyStruct | ((unint64_t)*((unsigned __int8 *)&self->_keyStruct + 4) << 32)) >> 6) & 0x7FFFFFF;
}

- (unsigned)tableType
{
  return (*(_DWORD *)&self->_keyStruct >> 2) & 7;
}

- (BOOL)isEqualToKey:(id)a3
{
  return PLResourceDataStoreKeyIsEqual(self, a3);
}

- (BOOL)isEqual:(id)a3
{
  PLThumbnailResourceDataStoreKey *v4;
  BOOL v5;

  v4 = (PLThumbnailResourceDataStoreKey *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = (((*(_DWORD *)&self->_keyStruct | ((unint64_t)*((unsigned __int8 *)&self->_keyStruct + 4) << 32)) ^ -[PLThumbnailResourceDataStoreKey keyStruct](v4, "keyStruct")) & 0x1FFFFFFDFLL) == 0;
    else
      v5 = (objc_opt_respondsToSelector() & 1) != 0
        && -[PLThumbnailResourceDataStoreKey isEqualToKey:](self, "isEqualToKey:", v4);
  }

  return v5;
}

- (id)descriptionForAssetID:(id)a3
{
  unsigned int v4;
  __CFString *v5;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v4 = (*(_DWORD *)&self->_keyStruct >> 2) & 7;
  if (v4 > 3)
    v5 = 0;
  else
    v5 = off_1E3677DD8[v4];
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("v1");
  if ((*(_DWORD *)&self->_keyStruct & 3) != 0)
    v10 = 0;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@> type: %@, %@, index: %ld"), v8, v5, v10, ((*(_DWORD *)&self->_keyStruct | ((unint64_t)*((unsigned __int8 *)&self->_keyStruct + 4) << 32)) >> 6) & 0x7FFFFFF);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (PLThumbnailDataStoreKeyStruct_V1)keyStruct
{
  return (PLThumbnailDataStoreKeyStruct_V1)(*(_DWORD *)&self->_keyStruct | ((unint64_t)*((unsigned __int8 *)&self->_keyStruct
                                                                                              + 4) << 32));
}

- (void)setKeyStruct:(PLThumbnailDataStoreKeyStruct_V1)a3
{
  *(_DWORD *)&self->_keyStruct = a3;
  *((_BYTE *)&self->_keyStruct + 4) = *((_BYTE *)&a3 + 4);
}

+ (id)fileURLForPayloadKeyData:(unint64_t)a3 assetID:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLThumbnailResourceDataStoreKey.m"), 45, CFSTR("This store does not support returning resource URLs."));

  return 0;
}

@end

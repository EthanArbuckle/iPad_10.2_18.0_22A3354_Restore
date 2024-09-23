@implementation PLTaggedPointerDataStoreKey

- (void)tableType:(unsigned int *)a3 index:(int *)a4
{
  unint64_t v6;

  v6 = -[PLTaggedPointer payload](self, "payload");
  if (a3)
    *a3 = (v6 >> 2) & 7;
  if (a4)
    *a4 = (v6 >> 6) & 0x7FFFFFF;
}

- (BOOL)isDerivative
{
  unint64_t v4;
  _BOOL8 v5;
  void *v6;

  v4 = -[PLTaggedPointer payload](self, "payload") >> 50;
  if ((_DWORD)v4 == 1)
  {
    LOBYTE(v5) = 1;
  }
  else if ((_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLTaggedPointerDataStoreKey.m"), 261, CFSTR("Unsupported store type: %ld"), v4);

    LOBYTE(v5) = 0;
  }
  else
  {
    return (-[PLTaggedPointer payload](self, "payload") >> 36) & 1;
  }
  return v5;
}

- (unsigned)resourceVersion
{
  unint64_t v4;
  void *v6;

  v4 = -[PLTaggedPointer payload](self, "payload") >> 50;
  if ((_DWORD)v4 != 1)
  {
    if (!(_DWORD)v4)
      return (-[PLTaggedPointer payload](self, "payload") >> 10) & 3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLTaggedPointerDataStoreKey.m"), 244, CFSTR("Unsupported store type: %ld"), v4);

  }
  return 3;
}

- (unsigned)resourceType
{
  unint64_t v4;
  unsigned int v5;
  void *v7;

  v4 = -[PLTaggedPointer payload](self, "payload") >> 50;
  v5 = -[PLTaggedPointer payload](self, "payload");
  if ((_DWORD)v4 == 1)
    return 0;
  if (!(_DWORD)v4)
    return (v5 >> 12) & 0x1F;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLTaggedPointerDataStoreKey.m"), 227, CFSTR("Unsupported store type: %ld"), v4);

  return 31;
}

- (unsigned)recipeIDForAssetID:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  int v12;

  v4 = a3;
  v5 = -[PLTaggedPointer payload](self, "payload") >> 50;
  v6 = -[PLTaggedPointer payload](self, "payload");
  v7 = v6;
  if ((_DWORD)v5)
  {
    if ((_DWORD)v5 == 2)
    {
      if (((v6 >> 17) & 0x7F) > 4)
        v11 = 65741;
      else
        v11 = dword_199B9B5C8[BYTE2(v6)];
    }
    else if ((_DWORD)v5 == 1
           && (objc_msgSend(v4, "libraryID"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
    {
      objc_msgSend(v4, "libraryID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PLDataStoreForClassIDAndLibraryID(1, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = +[PLThumbnailResourceDataStoreKey recipeIDForTableType:inStore:](PLThumbnailResourceDataStoreKey, "recipeIDForTableType:inStore:", (v7 >> 2) & 7, v10);
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v12 = v6;
    if ((v6 & 0xF0) != 0)
      v12 = 16;
    if (v12 == 3)
      v11 = (v6 >> 20) & 0xFFFE | ((v6 & 0x1E0000) >> 1) | (v6 >> 36) & 1;
    else
      v11 = 0;
  }

  return v11;
}

+ (id)keyWithKeyStruct:(const void *)a3 keyLength:(unint64_t)a4 forStoreClassID:(unsigned __int16)a5 inLibraryWithID:(id)a6
{
  uint64_t v6;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;

  v6 = a5;
  v11 = a6;
  v12 = v11;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLTaggedPointerDataStoreKey.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyStruct"));

    if (v12)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLTaggedPointerDataStoreKey.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryID"));

    goto LABEL_3;
  }
  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (a4 > 6 || (__memcpy_chk(), (v13 = (void *)objc_msgSend(a1, "newInstanceWithPayload:", v6 << 50)) == 0))
  {
    PLDataStoreForClassIDAndLibraryID(v6, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "keyFromKeyStruct:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (BOOL)representsSquareResource
{
  return +[PLThumbnailResourceDataStoreKey representsSquareResourceForPayloadKeyData:](PLThumbnailResourceDataStoreKey, "representsSquareResourceForPayloadKeyData:", -[PLTaggedPointer payload](self, "payload") & 0x3FFFFFFFFFFFFLL);
}

- (id)fileURLForAssetID:(id)a3
{
  id v4;
  unint64_t v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[PLTaggedPointer payload](self, "payload");
  if (-[PLTaggedPointer payload](self, "payload") >> 50)
  {
    v7 = 0;
  }
  else
  {
    v6 = v5;
    if ((v5 & 0xF0) != 0)
      v6 = 16;
    if (v6 == 3 || v6 == 4 || v6 == 16)
      v8 = (void *)objc_opt_class();
    else
      v8 = 0;
    objc_msgSend(v8, "fileURLForPayloadKeyData:assetID:", v5 & 0x3FFFFFFFFFFFFLL, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_heapAllocatedRepresentationInLibraryWithID:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = -[PLTaggedPointer payload](self, "payload") >> 50;
  -[PLTaggedPointerDataStoreKey keyData](self, "keyData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLDataStoreForClassIDAndLibraryID(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v7, "keyFromKeyStruct:", objc_msgSend(v8, "bytes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "libraryID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLTaggedPointerDataStoreKey _heapAllocatedRepresentationInLibraryWithID:](self, "_heapAllocatedRepresentationInLibraryWithID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "validateForAssetID:resourceIdentity:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (PLTaggedPointerDataStoreKey)initWithKeyStruct:(const void *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLTaggedPointerDataStoreKey.m"), 70, CFSTR("initing a tagged pointer key class directly is not supported."));

  return 0;
}

- (id)keyData
{
  unint64_t v3;
  unsigned __int8 v4;
  void *v5;
  unsigned int v6;
  uint64_t v8;

  v3 = -[PLTaggedPointer payload](self, "payload");
  v4 = v3;
  v8 = v3 & 0x3FFFFFFFFFFFFLL;
  v5 = PLDataStoreClassForID(-[PLTaggedPointer payload](self, "payload") >> 50);
  if (v5)
  {
    v6 = objc_msgSend(v5, "keyLengthWithDataPreview:", v4);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v8, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)uniformTypeIdentifier
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[PLTaggedPointer payload](self, "payload");
  v5 = -[PLTaggedPointer payload](self, "payload") >> 50;
  if ((_DWORD)v5)
  {
    if ((_DWORD)v5 == 1)
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLTaggedPointerDataStoreKey.m"), 122, CFSTR("Unsupported store type: %ld"), v5);

      v6 = 0;
    }
  }
  else
  {
    PLUTTypeFromUniformFileType((v4 >> 39));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)isEqualToKey:(id)a3
{
  return PLResourceDataStoreKeyIsEqual(self, a3);
}

- (BOOL)isEqual:(id)a3
{
  PLTaggedPointerDataStoreKey *v4;
  BOOL v5;

  v4 = (PLTaggedPointerDataStoreKey *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) == 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && -[PLTaggedPointerDataStoreKey isEqualToKey:](self, "isEqualToKey:", v4);
  }

  return v5;
}

- (id)descriptionForAssetID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  objc_msgSend(v4, "libraryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLTaggedPointerDataStoreKey _heapAllocatedRepresentationInLibraryWithID:](self, "_heapAllocatedRepresentationInLibraryWithID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PLTaggedPointer payload](self, "payload") >> 50;
  v8 = -[PLTaggedPointer payload](self, "payload") & 0x3FFFFFFFFFFFFLL;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)PLTaggedPointerDataStoreKey;
  -[PLTaggedPointerDataStoreKey description](&v14, sel_description);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptionForAssetID:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@>, storeID: %d, keyPayload: %llu, interpreted: %@"), v10, v7, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end

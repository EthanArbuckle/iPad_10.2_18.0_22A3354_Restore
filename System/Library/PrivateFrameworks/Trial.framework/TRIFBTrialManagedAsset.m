@implementation TRIFBTrialManagedAsset

- (BOOL)verifyUTF8Fields
{
  int v3;
  void *v4;
  char v5;
  char v6;
  const TrialManagedAsset *ptr;
  uint64_t v8;
  unsigned int v9;
  int valid;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = -[TRIFBTrialManagedAsset cloudKitMetadataType](self, "cloudKitMetadataType");
  if (v3 == 2)
  {
    -[TRIFBTrialManagedAsset cloudKitMetadataAsAsset](self, "cloudKitMetadataAsAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "verifyUTF8Fields");
  }
  else
  {
    if (v3 != 1)
      goto LABEL_6;
    -[TRIFBTrialManagedAsset cloudKitMetadataAsTreatment](self, "cloudKitMetadataAsTreatment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "verifyUTF8Fields");
  }
  v6 = v5;

  if ((v6 & 1) == 0)
  {
    LOBYTE(valid) = 0;
    return valid;
  }
LABEL_6:
  ptr = self->_ptr;
  v8 = *(int *)ptr->var0;
  v9 = *(unsigned __int16 *)ptr[-v8].var0;
  if (v9 < 5)
    goto LABEL_19;
  if (*(_WORD *)ptr[-v8 + 4].var0)
  {
    valid = AFBIsValidUTF8();
    if (!valid)
      return valid;
    ptr = self->_ptr;
    v11 = *(int *)ptr->var0;
    v12 = -v11;
    v9 = *(unsigned __int16 *)ptr[-v11].var0;
  }
  else
  {
    v12 = -v8;
  }
  if (v9 < 9)
    goto LABEL_19;
  if (!*(_WORD *)ptr[v12 + 8].var0)
    goto LABEL_16;
  valid = AFBIsValidUTF8();
  if (valid)
  {
    ptr = self->_ptr;
    v13 = *(int *)ptr->var0;
    v12 = -v13;
    v9 = *(unsigned __int16 *)ptr[-v13].var0;
LABEL_16:
    if (v9 >= 0x13 && *(_WORD *)ptr[v12 + 18].var0)
    {
      LOBYTE(valid) = AFBIsValidUTF8();
      return valid;
    }
LABEL_19:
    LOBYTE(valid) = 1;
  }
  return valid;
}

- (NSString)path
{
  const TrialManagedAsset *ptr;
  const TrialManagedAsset *v3;
  uint64_t v4;
  const TrialManagedAsset *v6;
  NSString *v7;
  void *v8;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
  {
    v6 = &ptr[v4 + *(unsigned int *)ptr[v4].var0];
    NSStringFromSelector(a2);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    makeNSString(v7, self->_br, (const char *)&v6[4]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return (NSString *)v8;
}

- (BOOL)isOnDemand
{
  const TrialManagedAsset *ptr;
  const TrialManagedAsset *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xFu && (v4 = *(unsigned __int16 *)v3[14].var0) != 0 && ptr[v4].var0[0] != 0;
}

- (TRIFBTrialManagedAsset)initWithBufRef:(id)a3 cppPointer:(const TrialManagedAsset *)a4
{
  id v7;
  TRIFBTrialManagedAsset *v8;
  TRIFBTrialManagedAsset *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRIFBTrialManagedAsset;
  v8 = -[TRIFBTrialManagedAsset init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_br, a3);
    v9->_ptr = a4;
  }

  return v9;
}

- (BOOL)hasOnDemandFlag
{
  const TrialManagedAsset *ptr;
  const TrialManagedAsset *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x15u && (v4 = *(unsigned __int16 *)v3[20].var0) != 0 && ptr[v4].var0[0] != 0;
}

- (BOOL)hasDownloadSize
{
  const TrialManagedAsset *v2;

  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0x11u && *(_WORD *)v2[16].var0 != 0;
}

- (unsigned)fileType
{
  const TrialManagedAsset *ptr;
  const TrialManagedAsset *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
    return ptr[v4].var0[0];
  else
    return 0;
}

- (unint64_t)downloadSize
{
  const TrialManagedAsset *ptr;
  const TrialManagedAsset *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x11u && (v4 = *(unsigned __int16 *)v3[16].var0) != 0)
    return *(_QWORD *)ptr[v4].var0;
  else
    return 0;
}

- (unsigned)cloudKitMetadataType
{
  const TrialManagedAsset *ptr;
  const TrialManagedAsset *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0)
    return ptr[v4].var0[0];
  else
    return 0;
}

- (TRIFBCloudKitTreatmentRecordAsset)cloudKitMetadataAsTreatment
{
  const TrialManagedAsset *ptr;
  const TrialManagedAsset *v5;
  unsigned int v6;
  BOOL v7;
  uint64_t v8;
  const TrialManagedAsset *v9;
  void *v10;
  void *v12;

  if (-[TRIFBTrialManagedAsset cloudKitMetadataType](self, "cloudKitMetadataType") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1138, CFSTR("Accessed union field \"TRIFBTrialManagedAsset.cloudKitMetadataAsTreatment\", but the value stored in the union does not match this type."));

  }
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  v6 = *(unsigned __int16 *)v5->var0;
  if (v6 >= 0xB
    && *(_WORD *)v5[10].var0
    && (v6 >= 0xD ? (v7 = ptr[*(unsigned __int16 *)v5[10].var0].var0[0] == 1) : (v7 = 0),
        v7 && (v8 = *(unsigned __int16 *)v5[12].var0) != 0))
  {
    v9 = &ptr[v8 + *(unsigned int *)ptr[v8].var0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nested"));

    v9 = 0;
  }
  return -[TRIFBCloudKitTreatmentRecordAsset initWithBufRef:cppPointer:]([TRIFBCloudKitTreatmentRecordAsset alloc], "initWithBufRef:cppPointer:", self->_br, v9);
}

- (NSString)assetName
{
  const TrialManagedAsset *ptr;
  const TrialManagedAsset *v3;
  uint64_t v4;
  const TrialManagedAsset *v6;
  NSString *v7;
  void *v8;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x13u && (v4 = *(unsigned __int16 *)v3[18].var0) != 0)
  {
    v6 = &ptr[v4 + *(unsigned int *)ptr[v4].var0];
    NSStringFromSelector(a2);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    makeNSString(v7, self->_br, (const char *)&v6[4]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return (NSString *)v8;
}

- (NSString)assetId
{
  const TrialManagedAsset *ptr;
  const TrialManagedAsset *v5;
  uint64_t v6;
  const TrialManagedAsset *v7;
  void *v8;
  NSString *v9;
  void *v10;

  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 9u && (v6 = *(unsigned __int16 *)v5[8].var0) != 0)
  {
    v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

    v7 = 0;
  }
  NSStringFromSelector(a2);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  makeNSString(v9, self->_br, (const char *)&v7[4]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_br, 0);
}

- (const)pathAsCString
{
  const TrialManagedAsset *ptr;
  const TrialManagedAsset *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return (const char *)&ptr[v4 + 4 + *(unsigned int *)ptr[v4].var0];
  else
    return 0;
}

- (NSData)pathAsData
{
  const TrialManagedAsset *ptr;
  const TrialManagedAsset *v3;
  uint64_t v4;
  const TrialManagedAsset *v6;
  uint64_t v7;
  void *v8;
  id v9;
  unsigned int *var0;
  uint64_t v11;
  void *v12;
  void *v13;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
  {
    v6 = &ptr[v4];
    v7 = *(unsigned int *)ptr[v4].var0;
    v8 = (void *)MEMORY[0x1A1AC6B8C]();
    -[AFBBufRef data](self->_br, "data");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    var0 = (unsigned int *)v6[v7].var0;
    v11 = (uint64_t)var0 - objc_msgSend(v9, "bytes") + 4;

    -[AFBBufRef data](self->_br, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "subdataWithRange:", v11, *var0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v13 = 0;
  }
  return (NSData *)v13;
}

- (BOOL)hasFileType
{
  const TrialManagedAsset *v2;

  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 7u && *(_WORD *)v2[6].var0 != 0;
}

- (const)assetIdAsCString
{
  const TrialManagedAsset *ptr;
  const TrialManagedAsset *v5;
  uint64_t v6;
  const TrialManagedAsset *v7;
  void *v8;

  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 9u && (v6 = *(unsigned __int16 *)v5[8].var0) != 0)
  {
    v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

    v7 = 0;
  }
  return (const char *)&v7[4];
}

- (NSData)assetIdAsData
{
  const TrialManagedAsset *ptr;
  const TrialManagedAsset *v5;
  uint64_t v6;
  unsigned int *var0;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;

  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 9u && (v6 = *(unsigned __int16 *)v5[8].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v6 + *(unsigned int *)ptr[v6].var0].var0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

    var0 = 0;
  }
  v9 = (void *)MEMORY[0x1A1AC6B8C]();
  -[AFBBufRef data](self->_br, "data");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (uint64_t)var0 - objc_msgSend(v10, "bytes") + 4;

  -[AFBBufRef data](self->_br, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subdataWithRange:", v11, *var0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  return (NSData *)v13;
}

- (TRIFBCloudKitAssetRecordAsset)cloudKitMetadataAsAsset
{
  const TrialManagedAsset *ptr;
  const TrialManagedAsset *v5;
  unsigned int v6;
  BOOL v7;
  uint64_t v8;
  const TrialManagedAsset *v9;
  void *v10;
  void *v12;

  if (-[TRIFBTrialManagedAsset cloudKitMetadataType](self, "cloudKitMetadataType") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1148, CFSTR("Accessed union field \"TRIFBTrialManagedAsset.cloudKitMetadataAsAsset\", but the value stored in the union does not match this type."));

  }
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  v6 = *(unsigned __int16 *)v5->var0;
  if (v6 >= 0xB
    && *(_WORD *)v5[10].var0
    && (v6 >= 0xD ? (v7 = ptr[*(unsigned __int16 *)v5[10].var0].var0[0] == 2) : (v7 = 0),
        v7 && (v8 = *(unsigned __int16 *)v5[12].var0) != 0))
  {
    v9 = &ptr[v8 + *(unsigned int *)ptr[v8].var0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nested"));

    v9 = 0;
  }
  return -[TRIFBCloudKitAssetRecordAsset initWithBufRef:cppPointer:]([TRIFBCloudKitAssetRecordAsset alloc], "initWithBufRef:cppPointer:", self->_br, v9);
}

- (BOOL)hasIsOnDemand
{
  const TrialManagedAsset *v2;

  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0xFu && *(_WORD *)v2[14].var0 != 0;
}

- (const)assetNameAsCString
{
  const TrialManagedAsset *ptr;
  const TrialManagedAsset *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x13u && (v4 = *(unsigned __int16 *)v3[18].var0) != 0)
    return (const char *)&ptr[v4 + 4 + *(unsigned int *)ptr[v4].var0];
  else
    return 0;
}

- (NSData)assetNameAsData
{
  const TrialManagedAsset *ptr;
  const TrialManagedAsset *v3;
  uint64_t v4;
  const TrialManagedAsset *v6;
  uint64_t v7;
  void *v8;
  id v9;
  unsigned int *var0;
  uint64_t v11;
  void *v12;
  void *v13;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x13u && (v4 = *(unsigned __int16 *)v3[18].var0) != 0)
  {
    v6 = &ptr[v4];
    v7 = *(unsigned int *)ptr[v4].var0;
    v8 = (void *)MEMORY[0x1A1AC6B8C]();
    -[AFBBufRef data](self->_br, "data");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    var0 = (unsigned int *)v6[v7].var0;
    v11 = (uint64_t)var0 - objc_msgSend(v9, "bytes") + 4;

    -[AFBBufRef data](self->_br, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "subdataWithRange:", v11, *var0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v13 = 0;
  }
  return (NSData *)v13;
}

- (BOOL)hasHasOnDemandFlag
{
  const TrialManagedAsset *v2;

  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0x15u && *(_WORD *)v2[20].var0 != 0;
}

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  -[TRIFBTrialManagedAsset deepCopyUsingBufferBuilder:changes:](self, "deepCopyUsingBufferBuilder:changes:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4
{
  id v7;
  _BYTE *v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  id v23;
  _BYTE *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  TRIFBTrialManagedAsset *v34;
  id v35;
  id v36;
  id v37;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bufferBuilder"));

  }
  v9 = (void *)MEMORY[0x1A1AC6B8C]();
  if (!v8)
    goto LABEL_6;
  if (v8[8] == 1)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 3));
    goto LABEL_13;
  }
  if (v8[8])
  {
    v12 = 0;
  }
  else
  {
LABEL_6:
    v10 = (void *)MEMORY[0x1A1AC6B8C]();
    v11 = -[TRIFBTrialManagedAsset pathAsCString](objc_retainAutorelease(self), "pathAsCString");
    if (v11)
    {
      objc_msgSend(v7, "createStringWithCString:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    objc_autoreleasePoolPop(v10);
    if (!v8)
    {
LABEL_15:
      v13 = (void *)MEMORY[0x1A1AC6B8C]();
      v14 = -[TRIFBTrialManagedAsset assetIdAsCString](objc_retainAutorelease(self), "assetIdAsCString");
      if (v14)
      {
        objc_msgSend(v7, "createStringWithCString:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
      objc_autoreleasePoolPop(v13);
      if (!v8)
        goto LABEL_23;
      goto LABEL_21;
    }
  }
LABEL_13:
  if (v8[18] == 1)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 5));
  }
  else
  {
    if (!v8[18])
      goto LABEL_15;
    v15 = 0;
  }
LABEL_21:
  if (v8[25] == 1)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 7));
    goto LABEL_32;
  }
  if (v8[25])
  {
    v19 = 0;
    goto LABEL_32;
  }
LABEL_23:
  v16 = -[TRIFBTrialManagedAsset cloudKitMetadataType](self, "cloudKitMetadataType");
  if (v16 == 1)
  {
    -[TRIFBTrialManagedAsset cloudKitMetadataAsTreatment](self, "cloudKitMetadataAsTreatment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deepCopyUsingBufferBuilder:", v7);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v16 != 2)
    {
      v19 = 0;
      if (!v8)
        goto LABEL_34;
      goto LABEL_32;
    }
    -[TRIFBTrialManagedAsset cloudKitMetadataAsAsset](self, "cloudKitMetadataAsAsset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deepCopyUsingBufferBuilder:", v7);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;

  if (!v8)
    goto LABEL_34;
LABEL_32:
  if (v8[48] == 1)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 13));
    goto LABEL_40;
  }
  if (v8[48])
  {
    v22 = 0;
    goto LABEL_40;
  }
LABEL_34:
  v20 = (void *)MEMORY[0x1A1AC6B8C]();
  v21 = -[TRIFBTrialManagedAsset assetNameAsCString](objc_retainAutorelease(self), "assetNameAsCString");
  if (v21)
  {
    objc_msgSend(v7, "createStringWithCString:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  objc_autoreleasePoolPop(v20);
LABEL_40:
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __61__TRIFBTrialManagedAsset_deepCopyUsingBufferBuilder_changes___block_invoke;
  v31[3] = &unk_1E3BFED08;
  v23 = v12;
  v32 = v23;
  v24 = v8;
  v33 = v24;
  v34 = self;
  v25 = v15;
  v35 = v25;
  v26 = v19;
  v36 = v26;
  v37 = v22;
  v27 = v22;
  objc_msgSend(v7, "trifbCreateTrialManagedAssetUsingBlock:", v31);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  return v28;
}

void __61__TRIFBTrialManagedAsset_deepCopyUsingBufferBuilder_changes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v12, "setPath:");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    if (*(_BYTE *)(v3 + 16) == 1)
    {
      v4 = *(unsigned __int8 *)(v3 + 17);
      goto LABEL_8;
    }
    if (*(_BYTE *)(v3 + 16))
      goto LABEL_9;
  }
  v4 = objc_msgSend(*(id *)(a1 + 48), "fileType");
LABEL_8:
  objc_msgSend(v12, "setFileType:", v4);
LABEL_9:
  if (*(_QWORD *)(a1 + 56))
    objc_msgSend(v12, "setAssetId:");
  if (*(_QWORD *)(a1 + 64))
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5 && *(_BYTE *)(v5 + 25) == 1)
      v6 = *(unsigned __int8 *)(v5 + 24);
    else
      v6 = objc_msgSend(*(id *)(a1 + 48), "cloudKitMetadataType");
    if (v6 == 1)
    {
      objc_msgSend(v12, "setCloudKitMetadataWithTreatment:", *(_QWORD *)(a1 + 64));
    }
    else if (v6 == 2)
    {
      objc_msgSend(v12, "setCloudKitMetadataWithAsset:", *(_QWORD *)(a1 + 64));
    }
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (!v7)
  {
LABEL_23:
    v8 = objc_msgSend(*(id *)(a1 + 48), "isOnDemand");
    goto LABEL_25;
  }
  if (*(_BYTE *)(v7 + 32) != 1)
  {
    if (*(_BYTE *)(v7 + 32))
      goto LABEL_26;
    goto LABEL_23;
  }
  v8 = *(unsigned __int8 *)(v7 + 33) != 0;
LABEL_25:
  objc_msgSend(v12, "setIsOnDemand:", v8);
  v7 = *(_QWORD *)(a1 + 40);
  if (!v7)
  {
LABEL_28:
    if (objc_msgSend(*(id *)(a1 + 48), "hasDownloadSize"))
    {
      v9 = objc_msgSend(*(id *)(a1 + 48), "downloadSize");
LABEL_31:
      objc_msgSend(v12, "setDownloadSize:", v9);
      goto LABEL_32;
    }
    goto LABEL_32;
  }
LABEL_26:
  if (*(_BYTE *)(v7 + 34) == 1)
  {
    v9 = *(_QWORD *)(v7 + 40);
    goto LABEL_31;
  }
  if (!*(_BYTE *)(v7 + 34))
    goto LABEL_28;
LABEL_32:
  if (*(_QWORD *)(a1 + 72))
    objc_msgSend(v12, "setAssetName:");
  v10 = *(_QWORD *)(a1 + 40);
  if (!v10)
    goto LABEL_37;
  if (*(_BYTE *)(v10 + 56) == 1)
  {
    v11 = *(unsigned __int8 *)(v10 + 57) != 0;
    goto LABEL_39;
  }
  if (!*(_BYTE *)(v10 + 56))
  {
LABEL_37:
    v11 = objc_msgSend(*(id *)(a1 + 48), "hasOnDemandFlag");
LABEL_39:
    objc_msgSend(v12, "setHasOnDemandFlag:", v11);
  }

}

- (id)initVerifiedRootObjectFromData:(id)a3
{
  return -[TRIFBTrialManagedAsset initVerifiedRootObjectFromData:requireUTF8:](self, "initVerifiedRootObjectFromData:requireUTF8:", a3, 1);
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return -[TRIFBTrialManagedAsset initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:](self, "initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:", a3, a4, 64, 1000000);
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6
{
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  TrialManagedAsset *v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  void *v20;
  TRIFBTrialManagedAsset *v21;
  TRIFBTrialManagedAsset *v22;
  TrialManagedAsset *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v10 = a3;
  v11 = (void *)MEMORY[0x1A1AC6B8C]();
  v12 = objc_retainAutorelease(v10);
  v13 = objc_msgSend(v12, "bytes");
  if (v13)
    v14 = (TrialManagedAsset *)v13;
  else
    v14 = (TrialManagedAsset *)&emptyCArrayStorage;
  v15 = objc_msgSend(v12, "length");
  v24 = v14;
  v25 = v15;
  LODWORD(v26) = 0;
  HIDWORD(v26) = a5;
  LODWORD(v27) = 0;
  HIDWORD(v27) = a6;
  v28 = 0;
  LOBYTE(v29) = 1;
  if (v15 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  if (v15 >= 5
    && ((v16 = *(unsigned int *)v14->var0, (int)v16 >= 1) ? (v17 = v15 - 1 >= v16) : (v17 = 0),
        v17 && TrialManagedAsset::Verify(&v14[v16], (apple::aiml::flatbuffers2::Verifier *)&v24)))
  {
    v18 = *(unsigned int *)v14->var0;
    v19 = objc_alloc(MEMORY[0x1E0CFCED0]);
    v20 = (void *)objc_msgSend(v19, "initWithData:", v12, v24, v25, v26, v27, v28, v29);
    self = -[TRIFBTrialManagedAsset initWithBufRef:cppPointer:](self, "initWithBufRef:cppPointer:", v20, &v14[v18]);

    v21 = self;
    if (a4)
    {
      if (-[TRIFBTrialManagedAsset verifyUTF8Fields](self, "verifyUTF8Fields"))
        v21 = self;
      else
        v21 = 0;
    }
    v22 = v21;

  }
  else
  {
    v22 = 0;
  }
  objc_autoreleasePoolPop(v11);

  return v22;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  _BOOL4 v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;

  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  -[TRIFBTrialManagedAsset path](self, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  v6 = -[TRIFBTrialManagedAsset fileType](self, "fileType");
  -[TRIFBTrialManagedAsset assetId](self, "assetId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  v9 = -[TRIFBTrialManagedAsset cloudKitMetadataType](self, "cloudKitMetadataType");
  v10 = -[TRIFBTrialManagedAsset isOnDemand](self, "isOnDemand");
  v11 = -[TRIFBTrialManagedAsset downloadSize](self, "downloadSize");
  -[TRIFBTrialManagedAsset assetName](self, "assetName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash") + 37 * (v11 + 37 * (37 * (37 * (v8 + 37 * (37 * v5 + v6)) + v9) + v10));

  v14 = 37 * v13 + -[TRIFBTrialManagedAsset hasOnDemandFlag](self, "hasOnDemandFlag");
  objc_autoreleasePoolPop(v3);
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  _BOOL4 v26;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      LOBYTE(v12) = 0;
LABEL_24:

      goto LABEL_25;
    }
    v7 = (void *)MEMORY[0x1A1AC6B8C]();
    v8 = -[TRIFBTrialManagedAsset cloudKitMetadataType](self, "cloudKitMetadataType");
    if (v8 != objc_msgSend(v6, "cloudKitMetadataType"))
      goto LABEL_22;
    v9 = -[TRIFBTrialManagedAsset cloudKitMetadataType](self, "cloudKitMetadataType");
    if (v9 == 2)
    {
      -[TRIFBTrialManagedAsset cloudKitMetadataAsAsset](self, "cloudKitMetadataAsAsset");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cloudKitMetadataAsAsset");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v10 | v11)
        goto LABEL_11;
    }
    else if (v9 == 1)
    {
      -[TRIFBTrialManagedAsset cloudKitMetadataAsTreatment](self, "cloudKitMetadataAsTreatment");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cloudKitMetadataAsTreatment");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v10 | v11)
      {
LABEL_11:
        v13 = objc_msgSend((id)v10, "isEqual:", v11);

        if ((v13 & 1) == 0)
          goto LABEL_22;
      }
    }
    -[TRIFBTrialManagedAsset path](self, "path");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!(v14 | v15)
      || (v16 = objc_msgSend((id)v14, "isEqual:", v15), (id)v15, (id)v14, v16))
    {
      v17 = -[TRIFBTrialManagedAsset fileType](self, "fileType");
      if (v17 == objc_msgSend(v6, "fileType"))
      {
        -[TRIFBTrialManagedAsset assetId](self, "assetId");
        v18 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "assetId");
        v19 = objc_claimAutoreleasedReturnValue();
        if (!(v18 | v19)
          || (v20 = objc_msgSend((id)v18, "isEqual:", v19), (id)v19, (id)v18, v20))
        {
          v21 = -[TRIFBTrialManagedAsset isOnDemand](self, "isOnDemand");
          if (v21 == objc_msgSend(v6, "isOnDemand"))
          {
            v22 = -[TRIFBTrialManagedAsset downloadSize](self, "downloadSize");
            if (v22 == objc_msgSend(v6, "downloadSize"))
            {
              -[TRIFBTrialManagedAsset assetName](self, "assetName");
              v23 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "assetName");
              v24 = objc_claimAutoreleasedReturnValue();
              if (!(v23 | v24)
                || (v25 = objc_msgSend((id)v23, "isEqual:", v24), (id)v24, (id)v23, v25))
              {
                v26 = -[TRIFBTrialManagedAsset hasOnDemandFlag](self, "hasOnDemandFlag");
                v12 = v26 ^ objc_msgSend(v6, "hasOnDemandFlag") ^ 1;
LABEL_23:
                objc_autoreleasePoolPop(v7);
                goto LABEL_24;
              }
            }
          }
        }
      }
    }
LABEL_22:
    LOBYTE(v12) = 0;
    goto LABEL_23;
  }
  LOBYTE(v12) = 0;
LABEL_25:

  return v12;
}

@end

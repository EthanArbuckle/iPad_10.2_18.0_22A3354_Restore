@implementation TRIFBMobileAssetReference

- (TRIFBMobileAssetReference)initWithBufRef:(id)a3 cppPointer:(const MobileAssetReference *)a4
{
  id v7;
  TRIFBMobileAssetReference *v8;
  TRIFBMobileAssetReference *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRIFBMobileAssetReference;
  v8 = -[TRIFBMobileAssetReference init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_br, a3);
    v9->_ptr = a4;
  }

  return v9;
}

- (NSString)type
{
  const MobileAssetReference *ptr;
  const MobileAssetReference *v5;
  uint64_t v6;
  const MobileAssetReference *v7;
  void *v8;
  NSString *v9;
  void *v10;

  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 5u && (v6 = *(unsigned __int16 *)v5[4].var0) != 0)
  {
    v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1899, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

    v7 = 0;
  }
  NSStringFromSelector(a2);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  makeNSString(v9, self->_br, (const char *)&v7[4]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (const)typeAsCString
{
  const MobileAssetReference *ptr;
  const MobileAssetReference *v5;
  uint64_t v6;
  const MobileAssetReference *v7;
  void *v8;

  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 5u && (v6 = *(unsigned __int16 *)v5[4].var0) != 0)
  {
    v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1905, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

    v7 = 0;
  }
  return (const char *)&v7[4];
}

- (NSData)typeAsData
{
  const MobileAssetReference *ptr;
  const MobileAssetReference *v5;
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
  if (*(unsigned __int16 *)v5->var0 >= 5u && (v6 = *(unsigned __int16 *)v5[4].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v6 + *(unsigned int *)ptr[v6].var0].var0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1911, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

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

- (NSString)specifier
{
  const MobileAssetReference *ptr;
  const MobileAssetReference *v5;
  uint64_t v6;
  const MobileAssetReference *v7;
  void *v8;
  NSString *v9;
  void *v10;

  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 7u && (v6 = *(unsigned __int16 *)v5[6].var0) != 0)
  {
    v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1920, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

    v7 = 0;
  }
  NSStringFromSelector(a2);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  makeNSString(v9, self->_br, (const char *)&v7[4]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (const)specifierAsCString
{
  const MobileAssetReference *ptr;
  const MobileAssetReference *v5;
  uint64_t v6;
  const MobileAssetReference *v7;
  void *v8;

  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 7u && (v6 = *(unsigned __int16 *)v5[6].var0) != 0)
  {
    v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1926, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

    v7 = 0;
  }
  return (const char *)&v7[4];
}

- (NSData)specifierAsData
{
  const MobileAssetReference *ptr;
  const MobileAssetReference *v5;
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
  if (*(unsigned __int16 *)v5->var0 >= 7u && (v6 = *(unsigned __int16 *)v5[6].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v6 + *(unsigned int *)ptr[v6].var0].var0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1932, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

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

- (NSString)version
{
  const MobileAssetReference *ptr;
  const MobileAssetReference *v5;
  uint64_t v6;
  const MobileAssetReference *v7;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1941, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

    v7 = 0;
  }
  NSStringFromSelector(a2);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  makeNSString(v9, self->_br, (const char *)&v7[4]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (const)versionAsCString
{
  const MobileAssetReference *ptr;
  const MobileAssetReference *v5;
  uint64_t v6;
  const MobileAssetReference *v7;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1947, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

    v7 = 0;
  }
  return (const char *)&v7[4];
}

- (NSData)versionAsData
{
  const MobileAssetReference *ptr;
  const MobileAssetReference *v5;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1953, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

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

- (BOOL)hasFileType
{
  const MobileAssetReference *v2;

  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0xBu && *(_WORD *)v2[10].var0 != 0;
}

- (unsigned)fileType
{
  const MobileAssetReference *ptr;
  const MobileAssetReference *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0)
    return ptr[v4].var0[0];
  else
    return 0;
}

- (BOOL)hasIsOnDemand
{
  const MobileAssetReference *v2;

  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0xDu && *(_WORD *)v2[12].var0 != 0;
}

- (BOOL)isOnDemand
{
  const MobileAssetReference *ptr;
  const MobileAssetReference *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xDu && (v4 = *(unsigned __int16 *)v3[12].var0) != 0 && ptr[v4].var0[0] != 0;
}

- (BOOL)hasDownloadSize
{
  const MobileAssetReference *v2;

  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0xFu && *(_WORD *)v2[14].var0 != 0;
}

- (unint64_t)downloadSize
{
  const MobileAssetReference *ptr;
  const MobileAssetReference *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (v4 = *(unsigned __int16 *)v3[14].var0) != 0)
    return *(_QWORD *)ptr[v4].var0;
  else
    return 0;
}

- (NSString)assetName
{
  const MobileAssetReference *ptr;
  const MobileAssetReference *v3;
  uint64_t v4;
  const MobileAssetReference *v6;
  NSString *v7;
  void *v8;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x11u && (v4 = *(unsigned __int16 *)v3[16].var0) != 0)
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

- (const)assetNameAsCString
{
  const MobileAssetReference *ptr;
  const MobileAssetReference *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x11u && (v4 = *(unsigned __int16 *)v3[16].var0) != 0)
    return (const char *)&ptr[v4 + 4 + *(unsigned int *)ptr[v4].var0];
  else
    return 0;
}

- (NSData)assetNameAsData
{
  const MobileAssetReference *ptr;
  const MobileAssetReference *v3;
  uint64_t v4;
  const MobileAssetReference *v6;
  uint64_t v7;
  void *v8;
  id v9;
  unsigned int *var0;
  uint64_t v11;
  void *v12;
  void *v13;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x11u && (v4 = *(unsigned __int16 *)v3[16].var0) != 0)
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

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  -[TRIFBMobileAssetReference deepCopyUsingBufferBuilder:changes:](self, "deepCopyUsingBufferBuilder:changes:", a3, 0);
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
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _BYTE *v25;
  id v26;
  void *v27;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  TRIFBMobileAssetReference *v35;
  id v36;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2017, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bufferBuilder"));

  }
  v9 = (void *)MEMORY[0x1A1AC6B8C]();
  if (!v8)
  {
LABEL_6:
    v10 = (void *)MEMORY[0x1A1AC6B8C]();
    v11 = -[TRIFBMobileAssetReference typeAsCString](objc_retainAutorelease(self), "typeAsCString");
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
      goto LABEL_15;
    goto LABEL_13;
  }
  if (v8[8] == 1)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 3));
  }
  else
  {
    if (!v8[8])
      goto LABEL_6;
    v12 = 0;
  }
LABEL_13:
  if (v8[16] == 1)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 5));
    goto LABEL_21;
  }
  if (v8[16])
  {
    v15 = 0;
    goto LABEL_21;
  }
LABEL_15:
  v13 = (void *)MEMORY[0x1A1AC6B8C]();
  v14 = -[TRIFBMobileAssetReference specifierAsCString](objc_retainAutorelease(self), "specifierAsCString");
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
  {
LABEL_23:
    v16 = (void *)MEMORY[0x1A1AC6B8C]();
    v17 = -[TRIFBMobileAssetReference versionAsCString](objc_retainAutorelease(self), "versionAsCString");
    if (v17)
    {
      objc_msgSend(v7, "createStringWithCString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    objc_autoreleasePoolPop(v16);
    if (!v8)
      goto LABEL_31;
    goto LABEL_29;
  }
LABEL_21:
  if (v8[24] == 1)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 7));
  }
  else
  {
    if (!v8[24])
      goto LABEL_23;
    v18 = 0;
  }
LABEL_29:
  if (v8[48] == 1)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 13));
    goto LABEL_37;
  }
  if (v8[48])
  {
    v21 = 0;
    goto LABEL_37;
  }
LABEL_31:
  v19 = (void *)MEMORY[0x1A1AC6B8C]();
  v20 = -[TRIFBMobileAssetReference assetNameAsCString](objc_retainAutorelease(self), "assetNameAsCString");
  if (v20)
  {
    objc_msgSend(v7, "createStringWithCString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  objc_autoreleasePoolPop(v19);
LABEL_37:
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __64__TRIFBMobileAssetReference_deepCopyUsingBufferBuilder_changes___block_invoke;
  v30[3] = &unk_1E3BFED30;
  v22 = v12;
  v31 = v22;
  v23 = v15;
  v32 = v23;
  v24 = v18;
  v33 = v24;
  v25 = v8;
  v34 = v25;
  v35 = self;
  v36 = v21;
  v26 = v21;
  objc_msgSend(v7, "trifbCreateMobileAssetReferenceUsingBlock:", v30);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  return v27;
}

void __64__TRIFBMobileAssetReference_deepCopyUsingBufferBuilder_changes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v7, "setType:");
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v7, "setSpecifier:");
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v7, "setVersion:");
  v3 = *(_QWORD *)(a1 + 56);
  if (!v3)
  {
LABEL_10:
    v4 = objc_msgSend(*(id *)(a1 + 64), "fileType");
    goto LABEL_12;
  }
  if (*(_BYTE *)(v3 + 32) != 1)
  {
    if (*(_BYTE *)(v3 + 32))
      goto LABEL_13;
    goto LABEL_10;
  }
  v4 = *(unsigned __int8 *)(v3 + 33);
LABEL_12:
  objc_msgSend(v7, "setFileType:", v4);
  v3 = *(_QWORD *)(a1 + 56);
  if (!v3)
    goto LABEL_15;
LABEL_13:
  if (*(_BYTE *)(v3 + 34) == 1)
  {
    v5 = *(unsigned __int8 *)(v3 + 35) != 0;
LABEL_17:
    objc_msgSend(v7, "setIsOnDemand:", v5);
    v3 = *(_QWORD *)(a1 + 56);
    if (!v3)
      goto LABEL_20;
    goto LABEL_18;
  }
  if (!*(_BYTE *)(v3 + 34))
  {
LABEL_15:
    v5 = objc_msgSend(*(id *)(a1 + 64), "isOnDemand");
    goto LABEL_17;
  }
LABEL_18:
  if (*(_BYTE *)(v3 + 36) == 1)
  {
    v6 = *(_QWORD *)(v3 + 40);
    goto LABEL_23;
  }
  if (*(_BYTE *)(v3 + 36))
    goto LABEL_24;
LABEL_20:
  if (!objc_msgSend(*(id *)(a1 + 64), "hasDownloadSize"))
    goto LABEL_24;
  v6 = objc_msgSend(*(id *)(a1 + 64), "downloadSize");
LABEL_23:
  objc_msgSend(v7, "setDownloadSize:", v6);
LABEL_24:
  if (*(_QWORD *)(a1 + 72))
    objc_msgSend(v7, "setAssetName:");

}

- (id)initVerifiedRootObjectFromData:(id)a3
{
  return -[TRIFBMobileAssetReference initVerifiedRootObjectFromData:requireUTF8:](self, "initVerifiedRootObjectFromData:requireUTF8:", a3, 1);
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return -[TRIFBMobileAssetReference initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:](self, "initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:", a3, a4, 64, 1000000);
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6
{
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  MobileAssetReference *v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  void *v20;
  TRIFBMobileAssetReference *v21;
  TRIFBMobileAssetReference *v22;
  MobileAssetReference *v24;
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
    v14 = (MobileAssetReference *)v13;
  else
    v14 = (MobileAssetReference *)&emptyCArrayStorage;
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
        v17 && MobileAssetReference::Verify(&v14[v16], (apple::aiml::flatbuffers2::Verifier *)&v24)))
  {
    v18 = *(unsigned int *)v14->var0;
    v19 = objc_alloc(MEMORY[0x1E0CFCED0]);
    v20 = (void *)objc_msgSend(v19, "initWithData:", v12, v24, v25, v26, v27, v28, v29);
    self = -[TRIFBMobileAssetReference initWithBufRef:cppPointer:](self, "initWithBufRef:cppPointer:", v20, &v14[v18]);

    v21 = self;
    if (a4)
    {
      if (-[TRIFBMobileAssetReference verifyUTF8Fields](self, "verifyUTF8Fields"))
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

- (BOOL)verifyUTF8Fields
{
  const MobileAssetReference *ptr;
  uint64_t v3;
  unsigned int v4;
  int valid;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  ptr = self->_ptr;
  v3 = *(int *)ptr->var0;
  v4 = *(unsigned __int16 *)ptr[-v3].var0;
  if (v4 < 5)
    goto LABEL_17;
  if (*(_WORD *)ptr[-v3 + 4].var0)
  {
    valid = AFBIsValidUTF8();
    if (!valid)
      return valid;
    ptr = self->_ptr;
    v7 = *(int *)ptr->var0;
    v8 = -v7;
    v4 = *(unsigned __int16 *)ptr[-v7].var0;
  }
  else
  {
    v8 = -v3;
  }
  if (v4 < 7)
    goto LABEL_17;
  if (*(_WORD *)ptr[v8 + 6].var0)
  {
    valid = AFBIsValidUTF8();
    if (!valid)
      return valid;
    ptr = self->_ptr;
    v9 = *(int *)ptr->var0;
    v8 = -v9;
    v4 = *(unsigned __int16 *)ptr[-v9].var0;
  }
  if (v4 < 9)
    goto LABEL_17;
  if (!*(_WORD *)ptr[v8 + 8].var0)
    goto LABEL_14;
  valid = AFBIsValidUTF8();
  if (valid)
  {
    ptr = self->_ptr;
    v10 = *(int *)ptr->var0;
    v8 = -v10;
    v4 = *(unsigned __int16 *)ptr[-v10].var0;
LABEL_14:
    if (v4 >= 0x11 && *(_WORD *)ptr[v8 + 16].var0)
    {
      LOBYTE(valid) = AFBIsValidUTF8();
      return valid;
    }
LABEL_17:
    LOBYTE(valid) = 1;
  }
  return valid;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  _BOOL4 v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;

  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  -[TRIFBMobileAssetReference type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[TRIFBMobileAssetReference specifier](self, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  -[TRIFBMobileAssetReference version](self, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");

  v10 = -[TRIFBMobileAssetReference fileType](self, "fileType");
  v11 = -[TRIFBMobileAssetReference isOnDemand](self, "isOnDemand");
  v12 = -[TRIFBMobileAssetReference downloadSize](self, "downloadSize");
  -[TRIFBMobileAssetReference assetName](self, "assetName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash") + 37 * (v12 + 37 * (37 * (37 * (v9 + 37 * (v7 + 37 * v5)) + v10) + v11));

  objc_autoreleasePoolPop(v3);
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x1A1AC6B8C]();
      -[TRIFBMobileAssetReference type](self, "type");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "type");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v8 | v9)
      {
        v10 = objc_msgSend((id)v8, "isEqual:", v9);

        if (!v10)
          goto LABEL_16;
      }
      -[TRIFBMobileAssetReference specifier](self, "specifier");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "specifier");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v11 | v12)
      {
        v13 = objc_msgSend((id)v11, "isEqual:", v12);

        if (!v13)
          goto LABEL_16;
      }
      -[TRIFBMobileAssetReference version](self, "version");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "version");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 | v15)
      {
        v16 = objc_msgSend((id)v14, "isEqual:", v15);

        if (!v16)
          goto LABEL_16;
      }
      v17 = -[TRIFBMobileAssetReference fileType](self, "fileType");
      if (v17 == objc_msgSend(v6, "fileType")
        && (v18 = -[TRIFBMobileAssetReference isOnDemand](self, "isOnDemand"),
            v18 == objc_msgSend(v6, "isOnDemand"))
        && (v19 = -[TRIFBMobileAssetReference downloadSize](self, "downloadSize"),
            v19 == objc_msgSend(v6, "downloadSize")))
      {
        -[TRIFBMobileAssetReference assetName](self, "assetName");
        v20 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "assetName");
        v21 = objc_claimAutoreleasedReturnValue();
        if (v20 | v21)
          v22 = objc_msgSend((id)v20, "isEqual:", v21);
        else
          v22 = 1;

      }
      else
      {
LABEL_16:
        v22 = 0;
      }
      objc_autoreleasePoolPop(v7);
    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_br, 0);
}

@end

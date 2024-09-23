@implementation TRIFBFactorLevel

- (TRIFBFactorLevel)initWithBufRef:(id)a3 cppPointer:(const FactorLevel *)a4
{
  id v7;
  TRIFBFactorLevel *v8;
  TRIFBFactorLevel *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRIFBFactorLevel;
  v8 = -[TRIFBFactorLevel init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_br, a3);
    v9->_ptr = a4;
  }

  return v9;
}

- (BOOL)verifyUTF8Fields
{
  int v3;
  void *v4;
  char v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  const FactorLevel *ptr;
  uint64_t v11;
  unsigned int v12;
  int valid;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v3 = -[TRIFBFactorLevel levelType](self, "levelType");
  if (v3 == 6)
  {
    -[TRIFBFactorLevel levelAsMaRefVal](self, "levelAsMaRefVal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "verifyUTF8Fields");
  }
  else
  {
    if (v3 != 5)
    {
      if (v3 == 2 && FactorLevel::level_as_string_val((FactorLevel *)self->_ptr) && (AFBIsValidUTF8() & 1) == 0)
        goto LABEL_17;
      goto LABEL_10;
    }
    -[TRIFBFactorLevel levelAsTrialAssetVal](self, "levelAsTrialAssetVal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "verifyUTF8Fields");
  }
  v6 = v5;

  if ((v6 & 1) == 0)
  {
LABEL_17:
    LOBYTE(valid) = 0;
    return valid;
  }
LABEL_10:
  -[TRIFBFactorLevel metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 1;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __36__TRIFBFactorLevel_verifyUTF8Fields__block_invoke;
    v19[3] = &unk_1E3BFEE70;
    v19[4] = &v20;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v19);
    v9 = *((unsigned __int8 *)v21 + 24);
    _Block_object_dispose(&v20, 8);
    if (!v9)
    {

      goto LABEL_17;
    }
  }

  ptr = self->_ptr;
  v11 = *(int *)ptr->var0;
  v12 = *(unsigned __int16 *)ptr[-v11].var0;
  if (v12 < 5)
    goto LABEL_30;
  if (!*(_WORD *)ptr[-v11 + 4].var0)
  {
    v15 = -v11;
LABEL_19:
    if (v12 >= 0xF)
    {
      if (*(_WORD *)ptr[v15 + 14].var0)
      {
        valid = AFBIsValidUTF8();
        if (!valid)
          return valid;
        ptr = self->_ptr;
        v16 = *(int *)ptr->var0;
        v15 = -v16;
        v12 = *(unsigned __int16 *)ptr[-v16].var0;
      }
      if (v12 >= 0x11)
      {
        if (*(_WORD *)ptr[v15 + 16].var0)
        {
          valid = AFBIsValidUTF8();
          if (!valid)
            return valid;
          ptr = self->_ptr;
          v17 = *(int *)ptr->var0;
          v15 = -v17;
          v12 = *(unsigned __int16 *)ptr[-v17].var0;
        }
        if (v12 >= 0x13 && *(_WORD *)ptr[v15 + 18].var0)
        {
          LOBYTE(valid) = AFBIsValidUTF8();
          return valid;
        }
      }
    }
LABEL_30:
    LOBYTE(valid) = 1;
    return valid;
  }
  valid = AFBIsValidUTF8();
  if (valid)
  {
    ptr = self->_ptr;
    v14 = *(int *)ptr->var0;
    v15 = -v14;
    v12 = *(unsigned __int16 *)ptr[-v14].var0;
    goto LABEL_19;
  }
  return valid;
}

- (unsigned)namespaceId
{
  const FactorLevel *ptr;
  const FactorLevel *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x15u && (v4 = *(unsigned __int16 *)v3[20].var0) != 0)
    return *(_DWORD *)ptr[v4].var0;
  else
    return 0;
}

- (NSString)name
{
  const FactorLevel *ptr;
  const FactorLevel *v5;
  uint64_t v6;
  const FactorLevel *v7;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3000, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

    v7 = 0;
  }
  NSStringFromSelector(a2);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  makeNSString(v9, self->_br, (const char *)&v7[4]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSArray)metadata
{
  const FactorLevel *ptr;
  const FactorLevel *v5;
  uint64_t v6;
  unsigned int *var0;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];

  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 0xBu && (v6 = *(unsigned __int16 *)v5[10].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v6 + *(unsigned int *)ptr[v6].var0].var0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("vec"));

    var0 = 0;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __28__TRIFBFactorLevel_metadata__block_invoke;
  v12[3] = &unk_1E3BFEDA8;
  v12[4] = self;
  v12[5] = var0;
  v9 = (void *)MEMORY[0x1A1AC6D30](v12);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCEC8]), "initWithBufRef:count:objectAtIndex:", self->_br, *var0, v9);

  return (NSArray *)v10;
}

- (unsigned)levelType
{
  const FactorLevel *ptr;
  const FactorLevel *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
    return ptr[v4].var0[0];
  else
    return 0;
}

- (TRIFBTrialManagedAsset)levelAsTrialAssetVal
{
  const FactorLevel *ptr;
  const FactorLevel *v5;
  unsigned int v6;
  BOOL v7;
  uint64_t v8;
  const FactorLevel *v9;
  void *v10;
  void *v12;

  if (-[TRIFBFactorLevel levelType](self, "levelType") != 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3099, CFSTR("Accessed union field \"TRIFBFactorLevel.levelAsTrialAssetVal\", but the value stored in the union does not match this type."));

  }
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  v6 = *(unsigned __int16 *)v5->var0;
  if (v6 >= 7
    && *(_WORD *)v5[6].var0
    && (v6 >= 9 ? (v7 = ptr[*(unsigned __int16 *)v5[6].var0].var0[0] == 5) : (v7 = 0),
        v7 && (v8 = *(unsigned __int16 *)v5[8].var0) != 0))
  {
    v9 = &ptr[v8 + *(unsigned int *)ptr[v8].var0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nested"));

    v9 = 0;
  }
  return -[TRIFBTrialManagedAsset initWithBufRef:cppPointer:]([TRIFBTrialManagedAsset alloc], "initWithBufRef:cppPointer:", self->_br, v9);
}

- (TRIFBMobileAssetReference)levelAsMaRefVal
{
  const FactorLevel *ptr;
  const FactorLevel *v5;
  unsigned int v6;
  BOOL v7;
  uint64_t v8;
  const FactorLevel *v9;
  void *v10;
  void *v12;

  if (-[TRIFBFactorLevel levelType](self, "levelType") != 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3109, CFSTR("Accessed union field \"TRIFBFactorLevel.levelAsMaRefVal\", but the value stored in the union does not match this type."));

  }
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  v6 = *(unsigned __int16 *)v5->var0;
  if (v6 >= 7
    && *(_WORD *)v5[6].var0
    && (v6 >= 9 ? (v7 = ptr[*(unsigned __int16 *)v5[6].var0].var0[0] == 6) : (v7 = 0),
        v7 && (v8 = *(unsigned __int16 *)v5[8].var0) != 0))
  {
    v9 = &ptr[v8 + *(unsigned int *)ptr[v8].var0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nested"));

    v9 = 0;
  }
  return -[TRIFBMobileAssetReference initWithBufRef:cppPointer:]([TRIFBMobileAssetReference alloc], "initWithBufRef:cppPointer:", self->_br, v9);
}

- (BOOL)hasNamespaceId
{
  const FactorLevel *v2;

  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0x15u && *(_WORD *)v2[20].var0 != 0;
}

- (NSString)factorNamespaceName
{
  const FactorLevel *ptr;
  const FactorLevel *v3;
  uint64_t v4;
  const FactorLevel *v6;
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

- (NSString)factorId
{
  const FactorLevel *ptr;
  const FactorLevel *v3;
  uint64_t v4;
  const FactorLevel *v6;
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

- (NSString)alias
{
  const FactorLevel *ptr;
  const FactorLevel *v3;
  uint64_t v4;
  const FactorLevel *v6;
  NSString *v7;
  void *v8;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (v4 = *(unsigned __int16 *)v3[14].var0) != 0)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_br, 0);
}

- (const)nameAsCString
{
  const FactorLevel *ptr;
  const FactorLevel *v5;
  uint64_t v6;
  const FactorLevel *v7;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3006, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

    v7 = 0;
  }
  return (const char *)&v7[4];
}

- (NSData)nameAsData
{
  const FactorLevel *ptr;
  const FactorLevel *v5;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3012, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

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

- (TRIFBBoxedBool)levelAsBoolVal
{
  const FactorLevel *ptr;
  const FactorLevel *v5;
  unsigned int v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v12;

  if (-[TRIFBFactorLevel levelType](self, "levelType") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3029, CFSTR("Accessed union field \"TRIFBFactorLevel.levelAsBoolVal\", but the value stored in the union does not match this type."));

  }
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  v6 = *(unsigned __int16 *)v5->var0;
  if (v6 >= 7
    && *(_WORD *)v5[6].var0
    && (v6 >= 9 ? (v7 = ptr[*(unsigned __int16 *)v5[6].var0].var0[0] == 1) : (v7 = 0),
        v7 && (v8 = *(unsigned __int16 *)v5[8].var0) != 0))
  {
    v9 = (uint64_t)&ptr[v8 + *(unsigned int *)ptr[v8].var0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3031, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nested"));

    v9 = 0;
  }
  return (TRIFBBoxedBool *)-[TRIFBImmutableBoxedBool initWithBufRef:cppPointer:]([TRIFBImmutableBoxedBool alloc], self->_br, v9);
}

- (NSString)levelAsStringVal
{
  FactorLevel *v4;
  void *v5;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  if (-[TRIFBFactorLevel levelType](self, "levelType") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3039, CFSTR("Accessed union field \"TRIFBFactorLevel.levelAsStringVal\", but the value stored in the union does not match this type."));

  }
  v4 = FactorLevel::level_as_string_val((FactorLevel *)self->_ptr);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3041, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", &v4[4]);
  if (!v5)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@ unable to decode null-terminated string as UTF-8"), v10);

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0CFCEC0], v11, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  return (NSString *)v5;
}

- (const)levelAsStringValCString
{
  FactorLevel *v4;
  void *v6;
  void *v7;

  if (-[TRIFBFactorLevel levelType](self, "levelType") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3057, CFSTR("Accessed union field \"TRIFBFactorLevel.levelAsStringValCString\", but the value stored in the union does not match this type."));

  }
  v4 = FactorLevel::level_as_string_val((FactorLevel *)self->_ptr);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3059, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

  }
  return (const char *)&v4[4];
}

- (NSData)levelAsStringValData
{
  FactorLevel *v4;
  FactorLevel *v5;
  size_t v6;
  void *v7;
  id v8;
  FactorLevel *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  if (-[TRIFBFactorLevel levelType](self, "levelType") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3066, CFSTR("Accessed union field \"TRIFBFactorLevel.levelAsStringValData\", but the value stored in the union does not match this type."));

  }
  v4 = FactorLevel::level_as_string_val((FactorLevel *)self->_ptr);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3068, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

  }
  v5 = v4 + 4;
  v6 = strlen((const char *)&v4[4]);
  v7 = (void *)MEMORY[0x1A1AC6B8C]();
  -[AFBBufRef data](self->_br, "data");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = &v5[-objc_msgSend(v8, "bytes")];

  -[AFBBufRef data](self->_br, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subdataWithRange:", v9, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
  return (NSData *)v11;
}

- (TRIFBBoxedInt64)levelAsInt64Val
{
  const FactorLevel *ptr;
  const FactorLevel *v5;
  unsigned int v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v12;

  if (-[TRIFBFactorLevel levelType](self, "levelType") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3079, CFSTR("Accessed union field \"TRIFBFactorLevel.levelAsInt64Val\", but the value stored in the union does not match this type."));

  }
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  v6 = *(unsigned __int16 *)v5->var0;
  if (v6 >= 7
    && *(_WORD *)v5[6].var0
    && (v6 >= 9 ? (v7 = ptr[*(unsigned __int16 *)v5[6].var0].var0[0] == 3) : (v7 = 0),
        v7 && (v8 = *(unsigned __int16 *)v5[8].var0) != 0))
  {
    v9 = (uint64_t)&ptr[v8 + *(unsigned int *)ptr[v8].var0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3081, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nested"));

    v9 = 0;
  }
  return (TRIFBBoxedInt64 *)-[TRIFBImmutableBoxedInt64 initWithBufRef:cppPointer:]([TRIFBImmutableBoxedInt64 alloc], self->_br, v9);
}

- (TRIFBBoxedDouble)levelAsDoubleVal
{
  const FactorLevel *ptr;
  const FactorLevel *v5;
  unsigned int v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v12;

  if (-[TRIFBFactorLevel levelType](self, "levelType") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3089, CFSTR("Accessed union field \"TRIFBFactorLevel.levelAsDoubleVal\", but the value stored in the union does not match this type."));

  }
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  v6 = *(unsigned __int16 *)v5->var0;
  if (v6 >= 7
    && *(_WORD *)v5[6].var0
    && (v6 >= 9 ? (v7 = ptr[*(unsigned __int16 *)v5[6].var0].var0[0] == 4) : (v7 = 0),
        v7 && (v8 = *(unsigned __int16 *)v5[8].var0) != 0))
  {
    v9 = (uint64_t)&ptr[v8 + *(unsigned int *)ptr[v8].var0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3091, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nested"));

    v9 = 0;
  }
  return (TRIFBBoxedDouble *)-[TRIFBImmutableBoxedDouble initWithBufRef:cppPointer:]([TRIFBImmutableBoxedDouble alloc], self->_br, v9);
}

TRIFBFactorMetadataKeyValue *__28__TRIFBFactorLevel_metadata__block_invoke(uint64_t a1, unsigned int a2)
{
  TRIFBFactorMetadataKeyValue *v4;
  unsigned int *v5;

  v4 = [TRIFBFactorMetadataKeyValue alloc];
  v5 = *(unsigned int **)(a1 + 40);
  if (*v5 <= a2)
    __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
  return -[TRIFBFactorMetadataKeyValue initWithBufRef:cppPointer:](v4, "initWithBufRef:cppPointer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (char *)&v5[a2 + 1] + v5[a2 + 1]);
}

- (NSDictionary)metadataAsDict
{
  const FactorLevel *ptr;
  const FactorLevel *v5;
  uint64_t v6;
  unsigned int *var0;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[6];

  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 0xBu && (v6 = *(unsigned __int16 *)v5[10].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v6 + *(unsigned int *)ptr[v6].var0].var0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("vec"));

    var0 = 0;
  }
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __34__TRIFBFactorLevel_metadataAsDict__block_invoke;
  v17[3] = &unk_1E3BFEDD0;
  v17[4] = self;
  v17[5] = var0;
  v10 = (void *)MEMORY[0x1A1AC6D30](v17);
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __34__TRIFBFactorLevel_metadataAsDict__block_invoke_2;
  v16[3] = &unk_1E3BFEDA8;
  v16[4] = self;
  v16[5] = var0;
  v11 = (void *)MEMORY[0x1A1AC6D30](v16);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __34__TRIFBFactorLevel_metadataAsDict__block_invoke_3;
  v15[3] = &unk_1E3BFEDF8;
  v15[4] = self;
  v15[5] = var0;
  v12 = (void *)MEMORY[0x1A1AC6D30](v15);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCEE0]), "initWithBufRef:count:keyClass:keyAtIndex:tableAtIndex:objectForValidKey:", self->_br, *var0, objc_opt_class(), v10, v11, v12);

  return (NSDictionary *)v13;
}

__CFString *__34__TRIFBFactorLevel_metadataAsDict__block_invoke(uint64_t a1, unsigned int a2)
{
  unsigned int *v2;
  int *v3;
  unsigned __int16 *v4;
  uint64_t v5;
  char *v6;

  v2 = *(unsigned int **)(a1 + 40);
  if (*v2 <= a2)
    __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
  v3 = (int *)((char *)&v2[a2 + 1] + v2[a2 + 1]);
  v4 = (unsigned __int16 *)((char *)v3 - *v3);
  if (*v4 >= 5u && (v5 = v4[2]) != 0)
    v6 = (char *)v3 + v5 + *(unsigned int *)((char *)v3 + v5);
  else
    v6 = 0;
  return makeNSString(CFSTR("enumerateKeysAndObjectsUsingBlock:"), *(AFBBufRef **)(*(_QWORD *)(a1 + 32) + 8), v6 + 4);
}

TRIFBFactorMetadataKeyValue *__34__TRIFBFactorLevel_metadataAsDict__block_invoke_2(uint64_t a1, unsigned int a2)
{
  TRIFBFactorMetadataKeyValue *v4;
  unsigned int *v5;

  v4 = [TRIFBFactorMetadataKeyValue alloc];
  v5 = *(unsigned int **)(a1 + 40);
  if (*v5 <= a2)
    __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
  return -[TRIFBFactorMetadataKeyValue initWithBufRef:cppPointer:](v4, "initWithBufRef:cppPointer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (char *)&v5[a2 + 1] + v5[a2 + 1]);
}

TRIFBFactorMetadataKeyValue *__34__TRIFBFactorLevel_metadataAsDict__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int *v8;
  TRIFBFactorMetadataKeyValue *v9;
  uint64_t __key;

  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC6B8C]();
  v5 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v5, "UTF8String");
  if (v6
    && (v7 = *(unsigned int **)(a1 + 40),
        __key = v6,
        (v8 = (unsigned int *)bsearch(&__key, v7 + 1, *v7, 4uLL, (int (__cdecl *)(const void *, const void *))apple::aiml::flatbuffers2::Vector<apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue>>::KeyCompare<char const*>)) != 0))
  {
    v9 = -[TRIFBFactorMetadataKeyValue initWithBufRef:cppPointer:]([TRIFBFactorMetadataKeyValue alloc], "initWithBufRef:cppPointer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (char *)v8 + *v8);
  }
  else
  {
    v9 = 0;
  }
  objc_autoreleasePoolPop(v4);

  return v9;
}

- (BOOL)hasCacheKey
{
  const FactorLevel *v2;

  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0xDu && *(_WORD *)v2[12].var0 != 0;
}

- (unsigned)cacheKey
{
  const FactorLevel *ptr;
  const FactorLevel *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xDu && (v4 = *(unsigned __int16 *)v3[12].var0) != 0)
    return *(_DWORD *)ptr[v4].var0;
  else
    return 0;
}

- (const)aliasAsCString
{
  const FactorLevel *ptr;
  const FactorLevel *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (v4 = *(unsigned __int16 *)v3[14].var0) != 0)
    return (const char *)&ptr[v4 + 4 + *(unsigned int *)ptr[v4].var0];
  else
    return 0;
}

- (NSData)aliasAsData
{
  const FactorLevel *ptr;
  const FactorLevel *v3;
  uint64_t v4;
  const FactorLevel *v6;
  uint64_t v7;
  void *v8;
  id v9;
  unsigned int *var0;
  uint64_t v11;
  void *v12;
  void *v13;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (v4 = *(unsigned __int16 *)v3[14].var0) != 0)
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

- (const)factorNamespaceNameAsCString
{
  const FactorLevel *ptr;
  const FactorLevel *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x11u && (v4 = *(unsigned __int16 *)v3[16].var0) != 0)
    return (const char *)&ptr[v4 + 4 + *(unsigned int *)ptr[v4].var0];
  else
    return 0;
}

- (NSData)factorNamespaceNameAsData
{
  const FactorLevel *ptr;
  const FactorLevel *v3;
  uint64_t v4;
  const FactorLevel *v6;
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

- (const)factorIdAsCString
{
  const FactorLevel *ptr;
  const FactorLevel *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x13u && (v4 = *(unsigned __int16 *)v3[18].var0) != 0)
    return (const char *)&ptr[v4 + 4 + *(unsigned int *)ptr[v4].var0];
  else
    return 0;
}

- (NSData)factorIdAsData
{
  const FactorLevel *ptr;
  const FactorLevel *v3;
  uint64_t v4;
  const FactorLevel *v6;
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

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  -[TRIFBFactorLevel deepCopyUsingBufferBuilder:changes:](self, "deepCopyUsingBufferBuilder:changes:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4
{
  id v7;
  _BYTE *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  const char *v28;
  void *v29;
  id v30;
  id v31;
  _BYTE *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v39;
  void *context;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  TRIFBFactorLevel *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3247, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bufferBuilder"));

  }
  context = (void *)MEMORY[0x1A1AC6B8C]();
  if (!v8)
    goto LABEL_6;
  if (v8[8] == 1)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 3));
    goto LABEL_13;
  }
  if (v8[8])
  {
    v11 = 0;
  }
  else
  {
LABEL_6:
    v9 = (void *)MEMORY[0x1A1AC6B8C]();
    v10 = -[TRIFBFactorLevel nameAsCString](objc_retainAutorelease(self), "nameAsCString");
    if (v10)
    {
      objc_msgSend(v7, "createStringWithCString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_autoreleasePoolPop(v9);
    if (!v8)
      goto LABEL_15;
  }
LABEL_13:
  if (v8[17] == 1)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 5));
  }
  else
  {
    if (!v8[17])
    {
LABEL_15:
      switch(-[TRIFBFactorLevel levelType](self, "levelType"))
      {
        case 1u:
          -[TRIFBFactorLevel levelAsBoolVal](self, "levelAsBoolVal");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "trifbCreateBoxedBoolFromBoxedBool:", v12);
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        case 2u:
          v15 = (void *)MEMORY[0x1A1AC6B8C]();
          objc_msgSend(v7, "createStringWithCString:", -[TRIFBFactorLevel levelAsStringValCString](objc_retainAutorelease(self), "levelAsStringValCString"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_autoreleasePoolPop(v15);
          goto LABEL_24;
        case 3u:
          -[TRIFBFactorLevel levelAsInt64Val](self, "levelAsInt64Val");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "trifbCreateBoxedInt64FromBoxedInt64:", v12);
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        case 4u:
          -[TRIFBFactorLevel levelAsDoubleVal](self, "levelAsDoubleVal");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "trifbCreateBoxedDoubleFromBoxedDouble:", v12);
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        case 5u:
          -[TRIFBFactorLevel levelAsTrialAssetVal](self, "levelAsTrialAssetVal");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "deepCopyUsingBufferBuilder:", v7);
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        case 6u:
          -[TRIFBFactorLevel levelAsMaRefVal](self, "levelAsMaRefVal");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "deepCopyUsingBufferBuilder:", v7);
          v13 = objc_claimAutoreleasedReturnValue();
LABEL_27:
          v14 = (void *)v13;

          if (v8)
            goto LABEL_28;
          goto LABEL_30;
        default:
          v14 = 0;
LABEL_24:
          if (!v8)
            goto LABEL_30;
          goto LABEL_28;
      }
    }
    v14 = 0;
  }
LABEL_28:
  if (v8[24] == 1)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 7));
  }
  else if (v8[24])
  {
    v20 = 0;
  }
  else
  {
LABEL_30:
    -[TRIFBFactorLevel metadata](self, "metadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v16, "count"));
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __55__TRIFBFactorLevel_deepCopyUsingBufferBuilder_changes___block_invoke;
      v50[3] = &unk_1E3BFEE20;
      v18 = v17;
      v51 = v18;
      v19 = v7;
      v52 = v19;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v50);
      objc_msgSend(v19, "trifbCreateSortedVectorOfFactorMetadataKeyValueWithOffsets:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = 0;
    }

    if (!v8)
      goto LABEL_38;
  }
  if (v8[40] == 1)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 11));
    goto LABEL_44;
  }
  if (v8[40])
  {
    v23 = 0;
    goto LABEL_44;
  }
LABEL_38:
  v21 = (void *)MEMORY[0x1A1AC6B8C]();
  v22 = -[TRIFBFactorLevel aliasAsCString](objc_retainAutorelease(self), "aliasAsCString");
  if (v22)
  {
    objc_msgSend(v7, "createStringWithCString:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  objc_autoreleasePoolPop(v21);
  if (!v8)
  {
LABEL_46:
    v24 = (void *)MEMORY[0x1A1AC6B8C]();
    v25 = -[TRIFBFactorLevel factorNamespaceNameAsCString](objc_retainAutorelease(self), "factorNamespaceNameAsCString");
    if (v25)
    {
      objc_msgSend(v7, "createStringWithCString:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    objc_autoreleasePoolPop(v24);
    if (!v8)
      goto LABEL_54;
    goto LABEL_52;
  }
LABEL_44:
  if (v8[48] == 1)
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 13));
  }
  else
  {
    if (!v8[48])
      goto LABEL_46;
    v26 = 0;
  }
LABEL_52:
  if (v8[56] == 1)
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 15));
    goto LABEL_60;
  }
  if (v8[56])
  {
    v29 = 0;
    goto LABEL_60;
  }
LABEL_54:
  v27 = (void *)MEMORY[0x1A1AC6B8C]();
  v28 = -[TRIFBFactorLevel factorIdAsCString](objc_retainAutorelease(self), "factorIdAsCString");
  if (v28)
  {
    objc_msgSend(v7, "createStringWithCString:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }
  objc_autoreleasePoolPop(v27);
LABEL_60:
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __55__TRIFBFactorLevel_deepCopyUsingBufferBuilder_changes___block_invoke_2;
  v41[3] = &unk_1E3BFEE48;
  v30 = v11;
  v42 = v30;
  v31 = v14;
  v43 = v31;
  v32 = v8;
  v44 = v32;
  v45 = self;
  v33 = v20;
  v46 = v33;
  v34 = v23;
  v47 = v34;
  v35 = v26;
  v48 = v35;
  v49 = v29;
  v36 = v29;
  objc_msgSend(v7, "trifbCreateFactorLevelUsingBlock:", v41);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  return v37;
}

void __55__TRIFBFactorLevel_deepCopyUsingBufferBuilder_changes___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "deepCopyUsingBufferBuilder:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

void __55__TRIFBFactorLevel_deepCopyUsingBufferBuilder_changes___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v9, "setName:");
  if (*(_QWORD *)(a1 + 40))
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3 && *(_BYTE *)(v3 + 17) == 1)
      v4 = *(unsigned __int8 *)(v3 + 16);
    else
      v4 = objc_msgSend(*(id *)(a1 + 56), "levelType");
    switch(v4)
    {
      case 1:
        objc_msgSend(v9, "setLevelWithBoolVal:", *(_QWORD *)(a1 + 40));
        break;
      case 2:
        objc_msgSend(v9, "setLevelWithStringVal:", *(_QWORD *)(a1 + 40));
        break;
      case 3:
        objc_msgSend(v9, "setLevelWithInt64Val:", *(_QWORD *)(a1 + 40));
        break;
      case 4:
        objc_msgSend(v9, "setLevelWithDoubleVal:", *(_QWORD *)(a1 + 40));
        break;
      case 5:
        objc_msgSend(v9, "setLevelWithTrialAssetVal:", *(_QWORD *)(a1 + 40));
        break;
      case 6:
        objc_msgSend(v9, "setLevelWithMaRefVal:", *(_QWORD *)(a1 + 40));
        break;
      default:
        break;
    }
  }
  if (*(_QWORD *)(a1 + 64))
    objc_msgSend(v9, "setMetadata:");
  v5 = *(_QWORD *)(a1 + 48);
  if (!v5)
    goto LABEL_20;
  if (*(_BYTE *)(v5 + 32) == 1)
  {
    v6 = *(unsigned int *)(v5 + 36);
    goto LABEL_22;
  }
  if (!*(_BYTE *)(v5 + 32))
  {
LABEL_20:
    v6 = objc_msgSend(*(id *)(a1 + 56), "cacheKey");
LABEL_22:
    objc_msgSend(v9, "setCacheKey:", v6);
  }
  if (*(_QWORD *)(a1 + 72))
    objc_msgSend(v9, "setAlias:");
  if (*(_QWORD *)(a1 + 80))
    objc_msgSend(v9, "setFactorNamespaceName:");
  if (*(_QWORD *)(a1 + 88))
    objc_msgSend(v9, "setFactorId:");
  v7 = *(_QWORD *)(a1 + 48);
  if (!v7)
    goto LABEL_32;
  if (*(_BYTE *)(v7 + 64) == 1)
  {
    v8 = *(unsigned int *)(v7 + 68);
    goto LABEL_34;
  }
  if (!*(_BYTE *)(v7 + 64))
  {
LABEL_32:
    v8 = objc_msgSend(*(id *)(a1 + 56), "namespaceId");
LABEL_34:
    objc_msgSend(v9, "setNamespaceId:", v8);
  }

}

- (id)initVerifiedRootObjectFromData:(id)a3
{
  return -[TRIFBFactorLevel initVerifiedRootObjectFromData:requireUTF8:](self, "initVerifiedRootObjectFromData:requireUTF8:", a3, 1);
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return -[TRIFBFactorLevel initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:](self, "initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:", a3, a4, 64, 1000000);
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6
{
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  FactorLevel *v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  void *v20;
  TRIFBFactorLevel *v21;
  TRIFBFactorLevel *v22;
  FactorLevel *v24;
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
    v14 = (FactorLevel *)v13;
  else
    v14 = (FactorLevel *)&emptyCArrayStorage;
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
        v17 && FactorLevel::Verify(&v14[v16], (apple::aiml::flatbuffers2::Verifier *)&v24)))
  {
    v18 = *(unsigned int *)v14->var0;
    v19 = objc_alloc(MEMORY[0x1E0CFCED0]);
    v20 = (void *)objc_msgSend(v19, "initWithData:", v12, v24, v25, v26, v27, v28, v29);
    self = -[TRIFBFactorLevel initWithBufRef:cppPointer:](self, "initWithBufRef:cppPointer:", v20, &v14[v18]);

    v21 = self;
    if (a4)
    {
      if (-[TRIFBFactorLevel verifyUTF8Fields](self, "verifyUTF8Fields"))
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

uint64_t __36__TRIFBFactorLevel_verifyUTF8Fields__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "verifyUTF8Fields");
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
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
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;

  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  -[TRIFBFactorLevel name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  v6 = -[TRIFBFactorLevel levelType](self, "levelType");
  -[TRIFBFactorLevel metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  v9 = -[TRIFBFactorLevel cacheKey](self, "cacheKey");
  -[TRIFBFactorLevel alias](self, "alias");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");

  -[TRIFBFactorLevel factorNamespaceName](self, "factorNamespaceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");

  -[TRIFBFactorLevel factorId](self, "factorId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash") + 37 * (v13 + 37 * (v11 + 37 * (37 * (v8 + 37 * (37 * v5 + v6)) + v9)));

  v16 = 37 * v15 + -[TRIFBFactorLevel namespaceId](self, "namespaceId");
  objc_autoreleasePoolPop(v3);
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  unsigned int v29;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x1A1AC6B8C]();
      v8 = -[TRIFBFactorLevel levelType](self, "levelType");
      if (v8 == objc_msgSend(v6, "levelType"))
      {
        switch(-[TRIFBFactorLevel levelType](self, "levelType"))
        {
          case 1u:
            -[TRIFBFactorLevel levelAsBoolVal](self, "levelAsBoolVal");
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "levelAsBoolVal");
            v10 = objc_claimAutoreleasedReturnValue();
            if (!(v9 | v10))
              goto LABEL_19;
            goto LABEL_18;
          case 2u:
            -[TRIFBFactorLevel levelAsStringVal](self, "levelAsStringVal");
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "levelAsStringVal");
            v10 = objc_claimAutoreleasedReturnValue();
            if (v9 | v10)
              goto LABEL_18;
            goto LABEL_19;
          case 3u:
            -[TRIFBFactorLevel levelAsInt64Val](self, "levelAsInt64Val");
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "levelAsInt64Val");
            v10 = objc_claimAutoreleasedReturnValue();
            if (v9 | v10)
              goto LABEL_18;
            goto LABEL_19;
          case 4u:
            -[TRIFBFactorLevel levelAsDoubleVal](self, "levelAsDoubleVal");
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "levelAsDoubleVal");
            v10 = objc_claimAutoreleasedReturnValue();
            if (v9 | v10)
              goto LABEL_18;
            goto LABEL_19;
          case 5u:
            -[TRIFBFactorLevel levelAsTrialAssetVal](self, "levelAsTrialAssetVal");
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "levelAsTrialAssetVal");
            v10 = objc_claimAutoreleasedReturnValue();
            if (v9 | v10)
              goto LABEL_18;
            goto LABEL_19;
          case 6u:
            -[TRIFBFactorLevel levelAsMaRefVal](self, "levelAsMaRefVal");
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "levelAsMaRefVal");
            v10 = objc_claimAutoreleasedReturnValue();
            if (!(v9 | v10))
              goto LABEL_19;
LABEL_18:
            v12 = objc_msgSend((id)v9, "isEqual:", v10);

            if ((v12 & 1) == 0)
              goto LABEL_31;
LABEL_19:
            -[TRIFBFactorLevel name](self, "name");
            v13 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "name");
            v14 = objc_claimAutoreleasedReturnValue();
            if (v13 | v14)
            {
              v15 = objc_msgSend((id)v13, "isEqual:", v14);

              if (!v15)
                goto LABEL_31;
            }
            -[TRIFBFactorLevel metadata](self, "metadata");
            v16 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "metadata");
            v17 = objc_claimAutoreleasedReturnValue();
            if (v16 | v17)
            {
              v18 = objc_msgSend((id)v16, "isEqual:", v17);

              if (!v18)
                goto LABEL_31;
            }
            v19 = -[TRIFBFactorLevel cacheKey](self, "cacheKey");
            if (v19 != objc_msgSend(v6, "cacheKey"))
              goto LABEL_31;
            -[TRIFBFactorLevel alias](self, "alias");
            v20 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "alias");
            v21 = objc_claimAutoreleasedReturnValue();
            if (v20 | v21)
            {
              v22 = objc_msgSend((id)v20, "isEqual:", v21);

              if (!v22)
                goto LABEL_31;
            }
            -[TRIFBFactorLevel factorNamespaceName](self, "factorNamespaceName");
            v23 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "factorNamespaceName");
            v24 = objc_claimAutoreleasedReturnValue();
            if (v23 | v24)
            {
              v25 = objc_msgSend((id)v23, "isEqual:", v24);

              if (!v25)
                goto LABEL_31;
            }
            -[TRIFBFactorLevel factorId](self, "factorId");
            v26 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "factorId");
            v27 = objc_claimAutoreleasedReturnValue();
            if (v26 | v27)
            {
              v28 = objc_msgSend((id)v26, "isEqual:", v27);

              if (!v28)
                goto LABEL_31;
            }
            v29 = -[TRIFBFactorLevel namespaceId](self, "namespaceId");
            v11 = v29 == objc_msgSend(v6, "namespaceId");
            break;
          default:
            goto LABEL_19;
        }
      }
      else
      {
LABEL_31:
        v11 = 0;
      }
      objc_autoreleasePoolPop(v7);
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end

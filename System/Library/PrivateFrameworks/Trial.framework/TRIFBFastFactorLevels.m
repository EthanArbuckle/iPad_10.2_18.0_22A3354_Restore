@implementation TRIFBFastFactorLevels

- (NSString)sourceAsFactorPackId
{
  FactorLevel *v4;
  void *v5;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  if (-[TRIFBFastFactorLevels sourceType](self, "sourceType") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4226, CFSTR("Accessed union field \"TRIFBFastFactorLevels.sourceAsFactorPackId\", but the value stored in the union does not match this type."));

  }
  v4 = FactorLevel::level_as_string_val((FactorLevel *)self->_ptr);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4228, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

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

- (unsigned)sourceType
{
  const FastFactorLevels *ptr;
  const FastFactorLevels *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
    return ptr[v4].var0[0];
  else
    return 0;
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6
{
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  const unsigned __int8 *v14;
  unint64_t v15;
  unint64_t v16;
  apple::aiml::flatbuffers2::Table *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int16 *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned __int16 *v24;
  uint64_t v25;
  FactorLevel *v26;
  unint64_t v27;
  FactorLevel *v28;
  char *v29;
  unsigned int v30;
  TRIFBFastFactorLevels *v31;
  const unsigned __int8 *v32;
  unsigned __int16 *v33;
  uint64_t v34;
  const unsigned __int8 *v35;
  unsigned __int16 *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  TRIFBFastFactorLevels *v40;
  apple::aiml::flatbuffers2::Table *v42;
  unint64_t v43;
  int v44;
  unsigned int v45;
  int v46;
  unsigned int v47;
  uint64_t v48;
  char v49;

  v10 = a3;
  v11 = (void *)MEMORY[0x1A1AC6B8C]();
  v12 = objc_retainAutorelease(v10);
  v13 = objc_msgSend(v12, "bytes");
  if (v13)
    v14 = (const unsigned __int8 *)v13;
  else
    v14 = (const unsigned __int8 *)&emptyCArrayStorage;
  v15 = objc_msgSend(v12, "length");
  v42 = (apple::aiml::flatbuffers2::Table *)v14;
  v43 = v15;
  v44 = 0;
  v45 = a5;
  v46 = 0;
  v47 = a6;
  v48 = 0;
  v49 = 1;
  if (v15 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  if (v15 < 5)
    goto LABEL_51;
  v16 = *(unsigned int *)v14;
  if ((int)v16 < 1 || v15 - 1 < v16)
    goto LABEL_51;
  v18 = (apple::aiml::flatbuffers2::Table *)&v14[v16];
  if (!apple::aiml::flatbuffers2::Verifier::VerifyTableStart((apple::aiml::flatbuffers2::Verifier *)&v42, &v14[v16])
    || !apple::aiml::flatbuffers2::Table::VerifyOffsetRequired(v18, (const apple::aiml::flatbuffers2::Verifier *)&v42, 4u))
  {
    goto LABEL_51;
  }
  v19 = *(int *)v18;
  v20 = -v19;
  v21 = (unsigned __int16 *)((char *)v18 - v19);
  if (*v21 >= 5u)
  {
    v22 = v21[2];
    if (v22)
    {
      if (!apple::aiml::flatbuffers2::Verifier::VerifyVectorOrString((apple::aiml::flatbuffers2::Verifier *)&v42, (const unsigned __int8 *)v18 + v22 + *(unsigned int *)((char *)v18 + v22), 4uLL, 0))goto LABEL_51;
      v23 = *(int *)v18;
      v20 = -v23;
      v24 = (unsigned __int16 *)((char *)v18 - v23);
      if (*v24 >= 5u)
      {
        v25 = v24[2];
        if (v25)
        {
          v26 = (FactorLevel *)v18 + v25 + *(unsigned int *)((char *)v18 + v25);
          if (*(_DWORD *)v26->var0)
          {
            v27 = 0;
            v28 = v26 + 4;
            while (FactorLevel::Verify(&v28[*(unsigned int *)v28->var0], (apple::aiml::flatbuffers2::Verifier *)&v42))
            {
              ++v27;
              v28 += 4;
              if (v27 >= *(unsigned int *)v26->var0)
              {
                v20 = -(uint64_t)*(int *)v18;
                goto LABEL_23;
              }
            }
            goto LABEL_51;
          }
        }
      }
    }
  }
LABEL_23:
  v29 = (char *)v18 + v20;
  v30 = *(unsigned __int16 *)((char *)v18 + v20);
  if (v30 >= 7)
  {
    if (*((_WORD *)v29 + 3))
    {
      v31 = 0;
      if (v43 < 2 || v43 - 1 < (apple::aiml::flatbuffers2::Table *)((char *)v18 + *((unsigned __int16 *)v29 + 3)) - v42)
        goto LABEL_52;
    }
  }
  if (!apple::aiml::flatbuffers2::Table::VerifyOffsetRequired(v18, (const apple::aiml::flatbuffers2::Verifier *)&v42, 8u))
  {
LABEL_51:
    v31 = 0;
    goto LABEL_52;
  }
  if (v30 >= 9)
  {
    if (*((_WORD *)v29 + 4))
    {
      v32 = (const unsigned __int8 *)v18
          + *((unsigned __int16 *)v29 + 4)
          + *(unsigned int *)((char *)v18 + *((unsigned __int16 *)v29 + 4));
LABEL_33:
      if (!*((_WORD *)v29 + 3)
        || *((unsigned __int8 *)v18 + *((unsigned __int16 *)v29 + 3)) - 1 > 1
        || apple::aiml::flatbuffers2::Verifier::VerifyString((apple::aiml::flatbuffers2::Verifier *)&v42, v32))
      {
        goto LABEL_36;
      }
      goto LABEL_51;
    }
LABEL_32:
    v32 = 0;
    goto LABEL_33;
  }
  if (v30 >= 7)
    goto LABEL_32;
LABEL_36:
  if (!apple::aiml::flatbuffers2::Table::VerifyOffsetRequired(v18, (const apple::aiml::flatbuffers2::Verifier *)&v42, 0xAu))goto LABEL_51;
  v33 = (unsigned __int16 *)((char *)v18 - *(int *)v18);
  if (*v33 >= 0xBu && (v34 = v33[5]) != 0)
    v35 = (const unsigned __int8 *)v18 + v34 + *(unsigned int *)((char *)v18 + v34);
  else
    v35 = 0;
  if (!apple::aiml::flatbuffers2::Verifier::VerifyString((apple::aiml::flatbuffers2::Verifier *)&v42, v35))
    goto LABEL_51;
  if (!apple::aiml::flatbuffers2::Table::VerifyOffset(v18, (const apple::aiml::flatbuffers2::Verifier *)&v42, 0xCu))
    goto LABEL_51;
  v36 = (unsigned __int16 *)((char *)v18 - *(int *)v18);
  if (*v36 >= 0xDu)
  {
    v37 = v36[6];
    if (v37)
    {
      if (!apple::aiml::flatbuffers2::Verifier::VerifyVectorOrString((apple::aiml::flatbuffers2::Verifier *)&v42, (const unsigned __int8 *)v18 + v37 + *(unsigned int *)((char *)v18 + v37), 4uLL, 0))goto LABEL_51;
    }
  }
  --v44;
  v38 = *(unsigned int *)v14;
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCED0]), "initWithData:", v12);
  self = -[TRIFBFastFactorLevels initWithBufRef:cppPointer:](self, "initWithBufRef:cppPointer:", v39, &v14[v38]);

  v40 = self;
  if (a4)
  {
    if (-[TRIFBFastFactorLevels verifyUTF8Fields](self, "verifyUTF8Fields"))
      v40 = self;
    else
      v40 = 0;
  }
  v31 = v40;

LABEL_52:
  objc_autoreleasePoolPop(v11);

  return v31;
}

TRIFBFactorLevel *__31__TRIFBFastFactorLevels_levels__block_invoke(uint64_t a1, unsigned int a2)
{
  TRIFBFactorLevel *v4;
  unsigned int *v5;

  v4 = [TRIFBFactorLevel alloc];
  v5 = *(unsigned int **)(a1 + 40);
  if (*v5 <= a2)
    __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
  return -[TRIFBFactorLevel initWithBufRef:cppPointer:](v4, "initWithBufRef:cppPointer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (char *)&v5[a2 + 1] + v5[a2 + 1]);
}

uint64_t __41__TRIFBFastFactorLevels_verifyUTF8Fields__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
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

TRIFBFactorLevel *__37__TRIFBFastFactorLevels_levelsAsDict__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int *v8;
  TRIFBFactorLevel *v9;
  uint64_t __key;

  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC6B8C]();
  v5 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v5, "UTF8String");
  if (v6
    && (v7 = *(unsigned int **)(a1 + 40),
        __key = v6,
        (v8 = (unsigned int *)bsearch(&__key, v7 + 1, *v7, 4uLL, (int (__cdecl *)(const void *, const void *))apple::aiml::flatbuffers2::Vector<apple::aiml::flatbuffers2::Offset<FactorLevel>>::KeyCompare<char const*>)) != 0))
  {
    v9 = -[TRIFBFactorLevel initWithBufRef:cppPointer:]([TRIFBFactorLevel alloc], "initWithBufRef:cppPointer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (char *)v8 + *v8);
  }
  else
  {
    v9 = 0;
  }
  objc_autoreleasePoolPop(v4);

  return v9;
}

id __29__TRIFBFastFactorLevels_ncvs__block_invoke(uint64_t a1, unsigned int a2)
{
  unsigned int *v2;

  v2 = *(unsigned int **)(a1 + 32);
  if (*v2 <= a2)
    __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", v2[a2 + 1]);
}

- (BOOL)verifyUTF8Fields
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  int valid;
  const FastFactorLevels *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  -[TRIFBFastFactorLevels levels](self, "levels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 1;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__TRIFBFastFactorLevels_verifyUTF8Fields__block_invoke;
    v10[3] = &unk_1E3BFEF30;
    v10[4] = &v11;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v10);
    v5 = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);
    if (!v5)
    {

LABEL_15:
      LOBYTE(valid) = 0;
      return valid;
    }
  }

  v6 = -[TRIFBFastFactorLevels sourceType](self, "sourceType");
  if (v6 == 2)
  {
    if (FactorLevel::level_as_string_val((FactorLevel *)self->_ptr))
    {
      valid = AFBIsValidUTF8();
      if (!valid)
        return valid;
    }
  }
  else if (v6 == 1
         && FastFactorLevels::source_as_treatment_id((FastFactorLevels *)self->_ptr)
         && (AFBIsValidUTF8() & 1) == 0)
  {
    goto LABEL_15;
  }
  v8 = &self->_ptr[-*(int *)self->_ptr];
  if (*(unsigned __int16 *)v8->var0 >= 0xBu && *(_WORD *)v8[10].var0)
    LOBYTE(valid) = AFBIsValidUTF8();
  else
    LOBYTE(valid) = 1;
  return valid;
}

- (NSArray)ncvs
{
  const FastFactorLevels *ptr;
  const FastFactorLevels *v3;
  uint64_t v4;
  unsigned int *var0;
  void *v7;
  void *v8;
  _QWORD v10[5];

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 < 0xDu)
    return (NSArray *)0;
  v4 = *(unsigned __int16 *)v3[12].var0;
  if (!v4)
    return (NSArray *)0;
  var0 = (unsigned int *)ptr[v4 + *(unsigned int *)ptr[v4].var0].var0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __29__TRIFBFastFactorLevels_ncvs__block_invoke;
  v10[3] = &__block_descriptor_40_e18___NSNumber_16__0Q8l;
  v10[4] = var0;
  v7 = (void *)MEMORY[0x1A1AC6D30](v10, a2);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCEC8]), "initWithBufRef:count:objectAtIndex:", self->_br, *var0, v7);

  return (NSArray *)v8;
}

- (NSString)namespaceName
{
  const FastFactorLevels *ptr;
  const FastFactorLevels *v5;
  uint64_t v6;
  const FastFactorLevels *v7;
  void *v8;
  NSString *v9;
  void *v10;

  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 0xBu && (v6 = *(unsigned __int16 *)v5[10].var0) != 0)
  {
    v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4265, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

    v7 = 0;
  }
  NSStringFromSelector(a2);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  makeNSString(v9, self->_br, (const char *)&v7[4]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSArray)levels
{
  const FastFactorLevels *ptr;
  const FastFactorLevels *v5;
  uint64_t v6;
  unsigned int *var0;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];

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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("vec"));

    var0 = 0;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __31__TRIFBFastFactorLevels_levels__block_invoke;
  v12[3] = &unk_1E3BFEDA8;
  v12[4] = self;
  v12[5] = var0;
  v9 = (void *)MEMORY[0x1A1AC6D30](v12);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCEC8]), "initWithBufRef:count:objectAtIndex:", self->_br, *var0, v9);

  return (NSArray *)v10;
}

- (NSDictionary)levelsAsDict
{
  const FastFactorLevels *ptr;
  const FastFactorLevels *v5;
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
  if (*(unsigned __int16 *)v5->var0 >= 5u && (v6 = *(unsigned __int16 *)v5[4].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v6 + *(unsigned int *)ptr[v6].var0].var0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("vec"));

    var0 = 0;
  }
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __37__TRIFBFastFactorLevels_levelsAsDict__block_invoke;
  v17[3] = &unk_1E3BFEDD0;
  v17[4] = self;
  v17[5] = var0;
  v10 = (void *)MEMORY[0x1A1AC6D30](v17);
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __37__TRIFBFastFactorLevels_levelsAsDict__block_invoke_2;
  v16[3] = &unk_1E3BFEDA8;
  v16[4] = self;
  v16[5] = var0;
  v11 = (void *)MEMORY[0x1A1AC6D30](v16);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __37__TRIFBFastFactorLevels_levelsAsDict__block_invoke_3;
  v15[3] = &unk_1E3BFEDF8;
  v15[4] = self;
  v15[5] = var0;
  v12 = (void *)MEMORY[0x1A1AC6D30](v15);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCEE0]), "initWithBufRef:count:keyClass:keyAtIndex:tableAtIndex:objectForValidKey:", self->_br, *var0, objc_opt_class(), v10, v11, v12);

  return (NSDictionary *)v13;
}

- (TRIFBFastFactorLevels)initWithBufRef:(id)a3 cppPointer:(const FastFactorLevels *)a4
{
  id v7;
  TRIFBFastFactorLevels *v8;
  TRIFBFastFactorLevels *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRIFBFastFactorLevels;
  v8 = -[TRIFBFastFactorLevels init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_br, a3);
    v9->_ptr = a4;
  }

  return v9;
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return -[TRIFBFastFactorLevels initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:](self, "initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:", a3, a4, 64, 1000000);
}

- (id)initVerifiedRootObjectFromData:(id)a3
{
  return -[TRIFBFastFactorLevels initVerifiedRootObjectFromData:requireUTF8:](self, "initVerifiedRootObjectFromData:requireUTF8:", a3, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_br, 0);
}

__CFString *__37__TRIFBFastFactorLevels_levelsAsDict__block_invoke(uint64_t a1, unsigned int a2)
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

TRIFBFactorLevel *__37__TRIFBFastFactorLevels_levelsAsDict__block_invoke_2(uint64_t a1, unsigned int a2)
{
  TRIFBFactorLevel *v4;
  unsigned int *v5;

  v4 = [TRIFBFactorLevel alloc];
  v5 = *(unsigned int **)(a1 + 40);
  if (*v5 <= a2)
    __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
  return -[TRIFBFactorLevel initWithBufRef:cppPointer:](v4, "initWithBufRef:cppPointer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (char *)&v5[a2 + 1] + v5[a2 + 1]);
}

- (NSString)sourceAsTreatmentId
{
  FastFactorLevels *v4;
  void *v5;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  if (-[TRIFBFastFactorLevels sourceType](self, "sourceType") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4186, CFSTR("Accessed union field \"TRIFBFastFactorLevels.sourceAsTreatmentId\", but the value stored in the union does not match this type."));

  }
  v4 = FastFactorLevels::source_as_treatment_id((FastFactorLevels *)self->_ptr);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

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

- (const)sourceAsTreatmentIdCString
{
  FastFactorLevels *v4;
  void *v6;
  void *v7;

  if (-[TRIFBFastFactorLevels sourceType](self, "sourceType") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4204, CFSTR("Accessed union field \"TRIFBFastFactorLevels.sourceAsTreatmentIdCString\", but the value stored in the union does not match this type."));

  }
  v4 = FastFactorLevels::source_as_treatment_id((FastFactorLevels *)self->_ptr);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

  }
  return (const char *)&v4[4];
}

- (NSData)sourceAsTreatmentIdData
{
  FastFactorLevels *v4;
  FastFactorLevels *v5;
  size_t v6;
  void *v7;
  id v8;
  FastFactorLevels *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  if (-[TRIFBFastFactorLevels sourceType](self, "sourceType") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4213, CFSTR("Accessed union field \"TRIFBFastFactorLevels.sourceAsTreatmentIdData\", but the value stored in the union does not match this type."));

  }
  v4 = FastFactorLevels::source_as_treatment_id((FastFactorLevels *)self->_ptr);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

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

- (const)sourceAsFactorPackIdCString
{
  FactorLevel *v4;
  void *v6;
  void *v7;

  if (-[TRIFBFastFactorLevels sourceType](self, "sourceType") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4244, CFSTR("Accessed union field \"TRIFBFastFactorLevels.sourceAsFactorPackIdCString\", but the value stored in the union does not match this type."));

  }
  v4 = FactorLevel::level_as_string_val((FactorLevel *)self->_ptr);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4246, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

  }
  return (const char *)&v4[4];
}

- (NSData)sourceAsFactorPackIdData
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

  if (-[TRIFBFastFactorLevels sourceType](self, "sourceType") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4253, CFSTR("Accessed union field \"TRIFBFastFactorLevels.sourceAsFactorPackIdData\", but the value stored in the union does not match this type."));

  }
  v4 = FactorLevel::level_as_string_val((FactorLevel *)self->_ptr);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4255, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

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

- (const)namespaceNameAsCString
{
  const FastFactorLevels *ptr;
  const FastFactorLevels *v5;
  uint64_t v6;
  const FastFactorLevels *v7;
  void *v8;

  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 0xBu && (v6 = *(unsigned __int16 *)v5[10].var0) != 0)
  {
    v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4271, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

    v7 = 0;
  }
  return (const char *)&v7[4];
}

- (NSData)namespaceNameAsData
{
  const FastFactorLevels *ptr;
  const FastFactorLevels *v5;
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
  if (*(unsigned __int16 *)v5->var0 >= 0xBu && (v6 = *(unsigned __int16 *)v5[10].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v6 + *(unsigned int *)ptr[v6].var0].var0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

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

- (const)ncvsAsCArrayWithCount:(unint64_t *)a3
{
  const FastFactorLevels *ptr;
  const FastFactorLevels *v4;
  uint64_t v5;
  const FastFactorLevels *v6;
  unint64_t v7;
  const unsigned int *var0;

  if (a3)
    *a3 = 0;
  ptr = self->_ptr;
  v4 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v4->var0 < 0xDu)
    return 0;
  v5 = *(unsigned __int16 *)v4[12].var0;
  if (!v5)
    return 0;
  v6 = &ptr[v5 + *(unsigned int *)ptr[v5].var0];
  v7 = *(unsigned int *)v6->var0;
  if (a3)
    *a3 = v7;
  var0 = (const unsigned int *)v6[4].var0;
  if ((_DWORD)v7)
    return var0;
  else
    return (const unsigned int *)&emptyCArrayStorage;
}

- (BOOL)enumerateNcvsUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, unint64_t, unsigned __int8 *);
  const FastFactorLevels *ptr;
  const FastFactorLevels *v6;
  uint64_t v7;
  const FastFactorLevels *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  BOOL v15;
  unsigned __int8 v17;

  v4 = (void (**)(id, _QWORD, unint64_t, unsigned __int8 *))a3;
  ptr = self->_ptr;
  v6 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v6->var0 >= 0xDu && (v7 = *(unsigned __int16 *)v6[12].var0) != 0)
  {
    v8 = &ptr[v7];
    v9 = *(unsigned int *)ptr[v7].var0;
    if (*(_DWORD *)ptr[v7 + v9].var0)
    {
      v10 = 0;
      v11 = (uint64_t)&ptr[v7 + 4 + v9];
      do
      {
        v12 = MEMORY[0x1A1AC6B8C]();
        v17 = 0;
        if (v10 >= *(unsigned int *)v8[v9].var0)
          __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
        v13 = (void *)v12;
        v4[2](v4, *(unsigned int *)(v11 + 4 * v10), v10, &v17);
        v14 = v17;
        objc_autoreleasePoolPop(v13);
        if (v14)
          break;
        ++v10;
      }
      while (v10 < *(unsigned int *)v8[v9].var0);
    }
    v15 = 1;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  -[TRIFBFastFactorLevels deepCopyUsingBufferBuilder:changes:](self, "deepCopyUsingBufferBuilder:changes:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4
{
  id v7;
  _BYTE *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _BYTE *v26;
  id v27;
  id v28;
  void *v29;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  TRIFBFastFactorLevels *v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4329, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bufferBuilder"));

  }
  v9 = (void *)MEMORY[0x1A1AC6B8C]();
  v10 = MEMORY[0x1E0C809B0];
  if (!v8)
  {
LABEL_6:
    -[TRIFBFastFactorLevels levels](self, "levels");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v39[0] = v10;
      v39[1] = 3221225472;
      v39[2] = __60__TRIFBFastFactorLevels_deepCopyUsingBufferBuilder_changes___block_invoke;
      v39[3] = &unk_1E3BFEEE0;
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
      v40 = v12;
      v13 = v7;
      v41 = v13;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v39);
      objc_msgSend(v13, "trifbCreateSortedVectorOfFactorLevelWithOffsets:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

    if (!v8)
      goto LABEL_15;
    goto LABEL_13;
  }
  if (v8[8] == 1)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 3));
  }
  else
  {
    if (!v8[8])
      goto LABEL_6;
    v14 = 0;
  }
LABEL_13:
  if (v8[17] == 1)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 5));
    goto LABEL_24;
  }
  if (v8[17])
  {
    v17 = 0;
    goto LABEL_24;
  }
LABEL_15:
  v15 = -[TRIFBFastFactorLevels sourceType](self, "sourceType");
  if (v15 == 1)
  {
    v18 = (void *)MEMORY[0x1A1AC6B8C]();
    objc_msgSend(v7, "createStringWithCString:", -[TRIFBFastFactorLevels sourceAsTreatmentIdCString](objc_retainAutorelease(self), "sourceAsTreatmentIdCString"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v18);
  }
  else
  {
    if (v15 != 2)
    {
      v17 = 0;
      if (!v8)
        goto LABEL_26;
      goto LABEL_24;
    }
    v16 = (void *)MEMORY[0x1A1AC6B8C]();
    objc_msgSend(v7, "createStringWithCString:", -[TRIFBFastFactorLevels sourceAsFactorPackIdCString](objc_retainAutorelease(self), "sourceAsFactorPackIdCString"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v16);
  }
  if (!v8)
  {
LABEL_26:
    v19 = (void *)MEMORY[0x1A1AC6B8C]();
    v20 = -[TRIFBFastFactorLevels namespaceNameAsCString](objc_retainAutorelease(self), "namespaceNameAsCString");
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
    if (!v8)
      goto LABEL_34;
    goto LABEL_32;
  }
LABEL_24:
  if (v8[24] == 1)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 7));
  }
  else
  {
    if (!v8[24])
      goto LABEL_26;
    v21 = 0;
  }
LABEL_32:
  if (v8[32] == 1)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 9));
    goto LABEL_40;
  }
  if (v8[32])
  {
    v23 = 0;
    goto LABEL_40;
  }
LABEL_34:
  -[TRIFBFastFactorLevels ncvs](self, "ncvs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v7, "createVectorOfUInt32WithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }

LABEL_40:
  v32[0] = v10;
  v32[1] = 3221225472;
  v32[2] = __60__TRIFBFastFactorLevels_deepCopyUsingBufferBuilder_changes___block_invoke_2;
  v32[3] = &unk_1E3BFEF08;
  v24 = v14;
  v33 = v24;
  v25 = v17;
  v34 = v25;
  v26 = v8;
  v35 = v26;
  v36 = self;
  v27 = v21;
  v37 = v27;
  v38 = v23;
  v28 = v23;
  objc_msgSend(v7, "trifbCreateFastFactorLevelsUsingBlock:", v32);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  return v29;
}

void __60__TRIFBFastFactorLevels_deepCopyUsingBufferBuilder_changes___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "deepCopyUsingBufferBuilder:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

void __60__TRIFBFastFactorLevels_deepCopyUsingBufferBuilder_changes___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  int v4;
  id v5;

  v5 = a2;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v5, "setLevels:");
  if (*(_QWORD *)(a1 + 40))
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3 && *(_BYTE *)(v3 + 17) == 1)
      v4 = *(unsigned __int8 *)(v3 + 16);
    else
      v4 = objc_msgSend(*(id *)(a1 + 56), "sourceType");
    if (v4 == 1)
    {
      objc_msgSend(v5, "setSourceWithTreatmentId:", *(_QWORD *)(a1 + 40));
    }
    else if (v4 == 2)
    {
      objc_msgSend(v5, "setSourceWithFactorPackId:", *(_QWORD *)(a1 + 40));
    }
  }
  if (*(_QWORD *)(a1 + 64))
    objc_msgSend(v5, "setNamespaceName:");
  if (*(_QWORD *)(a1 + 72))
    objc_msgSend(v5, "setNcvs:");

}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  -[TRIFBFastFactorLevels levels](self, "levels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  v6 = -[TRIFBFastFactorLevels sourceType](self, "sourceType");
  -[TRIFBFastFactorLevels namespaceName](self, "namespaceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[TRIFBFastFactorLevels ncvs](self, "ncvs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") + 37 * (v8 + 37 * (37 * v5 + v6));

  objc_autoreleasePoolPop(v3);
  return v10;
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
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = 0;
LABEL_22:

      goto LABEL_23;
    }
    v7 = (void *)MEMORY[0x1A1AC6B8C]();
    v8 = -[TRIFBFastFactorLevels sourceType](self, "sourceType");
    if (v8 != objc_msgSend(v6, "sourceType"))
      goto LABEL_18;
    v9 = -[TRIFBFastFactorLevels sourceType](self, "sourceType");
    if (v9 == 2)
    {
      -[TRIFBFastFactorLevels sourceAsFactorPackId](self, "sourceAsFactorPackId");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sourceAsFactorPackId");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v10 | v11)
        goto LABEL_11;
    }
    else if (v9 == 1)
    {
      -[TRIFBFastFactorLevels sourceAsTreatmentId](self, "sourceAsTreatmentId");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sourceAsTreatmentId");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v10 | v11)
      {
LABEL_11:
        v13 = objc_msgSend((id)v10, "isEqual:", v11);

        if ((v13 & 1) == 0)
          goto LABEL_18;
      }
    }
    -[TRIFBFastFactorLevels levels](self, "levels");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "levels");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!(v14 | v15)
      || (v16 = objc_msgSend((id)v14, "isEqual:", v15), (id)v15, (id)v14, v16))
    {
      -[TRIFBFastFactorLevels namespaceName](self, "namespaceName");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "namespaceName");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!(v17 | v18)
        || (v19 = objc_msgSend((id)v17, "isEqual:", v18), (id)v18, (id)v17, v19))
      {
        -[TRIFBFastFactorLevels ncvs](self, "ncvs");
        v20 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "ncvs");
        v21 = objc_claimAutoreleasedReturnValue();
        if (v20 | v21)
          v12 = objc_msgSend((id)v20, "isEqual:", v21);
        else
          v12 = 1;

        goto LABEL_21;
      }
    }
LABEL_18:
    v12 = 0;
LABEL_21:
    objc_autoreleasePoolPop(v7);
    goto LABEL_22;
  }
  v12 = 0;
LABEL_23:

  return v12;
}

@end

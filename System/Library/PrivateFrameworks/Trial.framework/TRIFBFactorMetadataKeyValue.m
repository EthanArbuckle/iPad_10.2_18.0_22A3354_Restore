@implementation TRIFBFactorMetadataKeyValue

- (NSString)key
{
  const FactorMetadataKeyValue *ptr;
  const FactorMetadataKeyValue *v5;
  uint64_t v6;
  const FactorMetadataKeyValue *v7;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2600, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

    v7 = 0;
  }
  NSStringFromSelector(a2);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  makeNSString(v9, self->_br, (const char *)&v7[4]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (const)keyAsCString
{
  const FactorMetadataKeyValue *ptr;
  const FactorMetadataKeyValue *v5;
  uint64_t v6;
  const FactorMetadataKeyValue *v7;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2606, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

    v7 = 0;
  }
  return (const char *)&v7[4];
}

- (NSData)keyAsData
{
  const FactorMetadataKeyValue *ptr;
  const FactorMetadataKeyValue *v5;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2612, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

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

- (NSString)val
{
  const FactorMetadataKeyValue *ptr;
  const FactorMetadataKeyValue *v5;
  uint64_t v6;
  const FactorMetadataKeyValue *v7;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2621, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

    v7 = 0;
  }
  NSStringFromSelector(a2);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  makeNSString(v9, self->_br, (const char *)&v7[4]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (const)valAsCString
{
  const FactorMetadataKeyValue *ptr;
  const FactorMetadataKeyValue *v5;
  uint64_t v6;
  const FactorMetadataKeyValue *v7;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2627, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

    v7 = 0;
  }
  return (const char *)&v7[4];
}

- (NSData)valAsData
{
  const FactorMetadataKeyValue *ptr;
  const FactorMetadataKeyValue *v5;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2633, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

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

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  -[TRIFBFactorMetadataKeyValue deepCopyUsingBufferBuilder:changes:](self, "deepCopyUsingBufferBuilder:changes:", a3, 0);
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
  id v16;
  id v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2646, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bufferBuilder"));

  }
  v9 = (void *)MEMORY[0x1A1AC6B8C]();
  if (!v8)
  {
LABEL_6:
    v10 = (void *)MEMORY[0x1A1AC6B8C]();
    v11 = -[TRIFBFactorMetadataKeyValue keyAsCString](objc_retainAutorelease(self), "keyAsCString");
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
  v14 = -[TRIFBFactorMetadataKeyValue valAsCString](objc_retainAutorelease(self), "valAsCString");
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
LABEL_21:
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __66__TRIFBFactorMetadataKeyValue_deepCopyUsingBufferBuilder_changes___block_invoke;
  v21[3] = &unk_1E3BFED58;
  v16 = v12;
  v22 = v16;
  v23 = v15;
  v17 = v15;
  objc_msgSend(v7, "trifbCreateFactorMetadataKeyValueUsingBlock:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  return v18;
}

void __66__TRIFBFactorMetadataKeyValue_deepCopyUsingBufferBuilder_changes___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v3, "setKey:");
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v3, "setVal:");

}

- (TRIFBFactorMetadataKeyValue)initWithBufRef:(id)a3 cppPointer:(const FactorMetadataKeyValue *)a4
{
  id v7;
  TRIFBFactorMetadataKeyValue *v8;
  TRIFBFactorMetadataKeyValue *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRIFBFactorMetadataKeyValue;
  v8 = -[TRIFBFactorMetadataKeyValue init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_br, a3);
    v9->_ptr = a4;
  }

  return v9;
}

- (id)initVerifiedRootObjectFromData:(id)a3
{
  return -[TRIFBFactorMetadataKeyValue initVerifiedRootObjectFromData:requireUTF8:](self, "initVerifiedRootObjectFromData:requireUTF8:", a3, 1);
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return -[TRIFBFactorMetadataKeyValue initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:](self, "initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:", a3, a4, 64, 1000000);
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6
{
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  FactorMetadataKeyValue *v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  void *v20;
  TRIFBFactorMetadataKeyValue *v21;
  TRIFBFactorMetadataKeyValue *v22;
  FactorMetadataKeyValue *v24;
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
    v14 = (FactorMetadataKeyValue *)v13;
  else
    v14 = (FactorMetadataKeyValue *)&emptyCArrayStorage;
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
        v17 && FactorMetadataKeyValue::Verify(&v14[v16], (apple::aiml::flatbuffers2::Verifier *)&v24)))
  {
    v18 = *(unsigned int *)v14->var0;
    v19 = objc_alloc(MEMORY[0x1E0CFCED0]);
    v20 = (void *)objc_msgSend(v19, "initWithData:", v12, v24, v25, v26, v27, v28, v29);
    self = -[TRIFBFactorMetadataKeyValue initWithBufRef:cppPointer:](self, "initWithBufRef:cppPointer:", v20, &v14[v18]);

    v21 = self;
    if (a4)
    {
      if (-[TRIFBFactorMetadataKeyValue verifyUTF8Fields](self, "verifyUTF8Fields"))
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
  const FactorMetadataKeyValue *ptr;
  uint64_t v3;
  unsigned int v4;
  int valid;
  uint64_t v7;
  uint64_t v8;

  ptr = self->_ptr;
  v3 = *(int *)ptr->var0;
  v4 = *(unsigned __int16 *)ptr[-v3].var0;
  if (v4 < 5)
    goto LABEL_9;
  if (!*(_WORD *)ptr[-v3 + 4].var0)
  {
    v8 = -v3;
    goto LABEL_6;
  }
  valid = AFBIsValidUTF8();
  if (valid)
  {
    ptr = self->_ptr;
    v7 = *(int *)ptr->var0;
    v8 = -v7;
    v4 = *(unsigned __int16 *)ptr[-v7].var0;
LABEL_6:
    if (v4 >= 7 && *(_WORD *)ptr[v8 + 6].var0)
    {
      LOBYTE(valid) = AFBIsValidUTF8();
      return valid;
    }
LABEL_9:
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
  unint64_t v7;

  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  -[TRIFBFactorMetadataKeyValue key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[TRIFBFactorMetadataKeyValue val](self, "val");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") + 37 * v5;

  objc_autoreleasePoolPop(v3);
  return v7;
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
  char v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x1A1AC6B8C]();
      -[TRIFBFactorMetadataKeyValue key](self, "key");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "key");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v8 | v9 && (v10 = objc_msgSend((id)v8, "isEqual:", v9), (id)v9, (id)v8, !v10))
      {
        v13 = 0;
      }
      else
      {
        -[TRIFBFactorMetadataKeyValue val](self, "val");
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "val");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v11 | v12)
          v13 = objc_msgSend((id)v11, "isEqual:", v12);
        else
          v13 = 1;

      }
      objc_autoreleasePoolPop(v7);
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_br, 0);
}

@end

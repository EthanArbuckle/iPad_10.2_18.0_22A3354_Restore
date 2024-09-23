@implementation TRIFBCloudKitTreatmentRecordAsset

- (BOOL)verifyUTF8Fields
{
  const CloudKitTreatmentRecordAsset *v2;

  v2 = &self->_ptr[-*(int *)self->_ptr];
  if (*(unsigned __int16 *)v2->var0 >= 7u && *(_WORD *)v2[6].var0)
    return AFBIsValidUTF8();
  else
    return 1;
}

- (NSString)treatmentId
{
  const CloudKitTreatmentRecordAsset *ptr;
  const CloudKitTreatmentRecordAsset *v5;
  uint64_t v6;
  const CloudKitTreatmentRecordAsset *v7;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 397, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

    v7 = 0;
  }
  NSStringFromSelector(a2);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  makeNSString(v9, self->_br, (const char *)&v7[4]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (TRIFBCloudKitTreatmentRecordAsset)initWithBufRef:(id)a3 cppPointer:(const CloudKitTreatmentRecordAsset *)a4
{
  id v7;
  TRIFBCloudKitTreatmentRecordAsset *v8;
  TRIFBCloudKitTreatmentRecordAsset *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRIFBCloudKitTreatmentRecordAsset;
  v8 = -[TRIFBCloudKitTreatmentRecordAsset init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_br, a3);
    v9->_ptr = a4;
  }

  return v9;
}

- (BOOL)hasCkIndex
{
  const CloudKitTreatmentRecordAsset *ptr;
  const CloudKitTreatmentRecordAsset *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0 && ptr[v4].var0[0] != 0;
}

- (unsigned)container
{
  const CloudKitTreatmentRecordAsset *ptr;
  const CloudKitTreatmentRecordAsset *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return ptr[v4].var0[0];
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_br, 0);
}

- (BOOL)hasContainer
{
  const CloudKitTreatmentRecordAsset *v2;

  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 5u && *(_WORD *)v2[4].var0 != 0;
}

- (const)treatmentIdAsCString
{
  const CloudKitTreatmentRecordAsset *ptr;
  const CloudKitTreatmentRecordAsset *v5;
  uint64_t v6;
  const CloudKitTreatmentRecordAsset *v7;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 403, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

    v7 = 0;
  }
  return (const char *)&v7[4];
}

- (NSData)treatmentIdAsData
{
  const CloudKitTreatmentRecordAsset *ptr;
  const CloudKitTreatmentRecordAsset *v5;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 409, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbs"));

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

- (BOOL)hasAssetIndex
{
  const CloudKitTreatmentRecordAsset *v2;

  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 9u && *(_WORD *)v2[8].var0 != 0;
}

- (unsigned)assetIndex
{
  const CloudKitTreatmentRecordAsset *ptr;
  const CloudKitTreatmentRecordAsset *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
    return *(_DWORD *)ptr[v4].var0;
  else
    return 0;
}

- (BOOL)hasHasCkIndex
{
  const CloudKitTreatmentRecordAsset *v2;

  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0xBu && *(_WORD *)v2[10].var0 != 0;
}

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  -[TRIFBCloudKitTreatmentRecordAsset deepCopyUsingBufferBuilder:changes:](self, "deepCopyUsingBufferBuilder:changes:", a3, 0);
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
  _BYTE *v13;
  id v14;
  void *v15;
  void *v17;
  _QWORD v18[4];
  id v19;
  TRIFBCloudKitTreatmentRecordAsset *v20;
  id v21;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 440, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bufferBuilder"));

  }
  v9 = (void *)MEMORY[0x1A1AC6B8C]();
  if (v8)
  {
    if (v8[10] == 1)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 3));
      goto LABEL_12;
    }
    if (v8[10])
    {
      v12 = 0;
      goto LABEL_12;
    }
  }
  v10 = (void *)MEMORY[0x1A1AC6B8C]();
  v11 = -[TRIFBCloudKitTreatmentRecordAsset treatmentIdAsCString](objc_retainAutorelease(self), "treatmentIdAsCString");
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
LABEL_12:
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__TRIFBCloudKitTreatmentRecordAsset_deepCopyUsingBufferBuilder_changes___block_invoke;
  v18[3] = &unk_1E3BFECA0;
  v13 = v8;
  v19 = v13;
  v20 = self;
  v21 = v12;
  v14 = v12;
  objc_msgSend(v7, "trifbCreateCloudKitTreatmentRecordAssetUsingBlock:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  return v15;
}

void __72__TRIFBCloudKitTreatmentRecordAsset_deepCopyUsingBufferBuilder_changes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    if (*(_BYTE *)(v3 + 8) == 1)
    {
      v4 = *(unsigned __int8 *)(v3 + 9);
      goto LABEL_6;
    }
    if (*(_BYTE *)(v3 + 8))
      goto LABEL_7;
  }
  v4 = objc_msgSend(*(id *)(a1 + 40), "container");
LABEL_6:
  objc_msgSend(v8, "setContainer:", v4);
LABEL_7:
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v8, "setTreatmentId:");
  v5 = *(_QWORD *)(a1 + 32);
  if (!v5)
  {
LABEL_12:
    v6 = objc_msgSend(*(id *)(a1 + 40), "assetIndex");
    goto LABEL_14;
  }
  if (*(_BYTE *)(v5 + 16) != 1)
  {
    if (*(_BYTE *)(v5 + 16))
      goto LABEL_15;
    goto LABEL_12;
  }
  v6 = *(unsigned int *)(v5 + 20);
LABEL_14:
  objc_msgSend(v8, "setAssetIndex:", v6);
  v5 = *(_QWORD *)(a1 + 32);
  if (!v5)
    goto LABEL_17;
LABEL_15:
  if (*(_BYTE *)(v5 + 24) == 1)
  {
    v7 = *(unsigned __int8 *)(v5 + 25) != 0;
    goto LABEL_19;
  }
  if (!*(_BYTE *)(v5 + 24))
  {
LABEL_17:
    v7 = objc_msgSend(*(id *)(a1 + 40), "hasCkIndex");
LABEL_19:
    objc_msgSend(v8, "setHasCkIndex:", v7);
  }

}

- (id)initVerifiedRootObjectFromData:(id)a3
{
  return -[TRIFBCloudKitTreatmentRecordAsset initVerifiedRootObjectFromData:requireUTF8:](self, "initVerifiedRootObjectFromData:requireUTF8:", a3, 1);
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return -[TRIFBCloudKitTreatmentRecordAsset initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:](self, "initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:", a3, a4, 64, 1000000);
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6
{
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  CloudKitTreatmentRecordAsset *v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  void *v20;
  TRIFBCloudKitTreatmentRecordAsset *v21;
  TRIFBCloudKitTreatmentRecordAsset *v22;
  CloudKitTreatmentRecordAsset *v24;
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
    v14 = (CloudKitTreatmentRecordAsset *)v13;
  else
    v14 = (CloudKitTreatmentRecordAsset *)&emptyCArrayStorage;
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
        v17 && CloudKitTreatmentRecordAsset::Verify(&v14[v16], (apple::aiml::flatbuffers2::Verifier *)&v24)))
  {
    v18 = *(unsigned int *)v14->var0;
    v19 = objc_alloc(MEMORY[0x1E0CFCED0]);
    v20 = (void *)objc_msgSend(v19, "initWithData:", v12, v24, v25, v26, v27, v28, v29);
    self = -[TRIFBCloudKitTreatmentRecordAsset initWithBufRef:cppPointer:](self, "initWithBufRef:cppPointer:", v20, &v14[v18]);

    v21 = self;
    if (a4)
    {
      if (-[TRIFBCloudKitTreatmentRecordAsset verifyUTF8Fields](self, "verifyUTF8Fields"))
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
  unsigned int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  v4 = -[TRIFBCloudKitTreatmentRecordAsset container](self, "container");
  -[TRIFBCloudKitTreatmentRecordAsset treatmentId](self, "treatmentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + 37 * v4;

  v7 = 37 * (37 * v6 + -[TRIFBCloudKitTreatmentRecordAsset assetIndex](self, "assetIndex"));
  v8 = v7 + -[TRIFBCloudKitTreatmentRecordAsset hasCkIndex](self, "hasCkIndex");
  objc_autoreleasePoolPop(v3);
  return v8;
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
  int v11;
  unsigned int v12;
  _BOOL4 v13;
  int v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x1A1AC6B8C]();
      v8 = -[TRIFBCloudKitTreatmentRecordAsset container](self, "container");
      if (v8 != objc_msgSend(v6, "container"))
        goto LABEL_10;
      -[TRIFBCloudKitTreatmentRecordAsset treatmentId](self, "treatmentId");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "treatmentId");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v9 | v10)
      {
        v11 = objc_msgSend((id)v9, "isEqual:", v10);

        if (!v11)
          goto LABEL_10;
      }
      v12 = -[TRIFBCloudKitTreatmentRecordAsset assetIndex](self, "assetIndex");
      if (v12 == objc_msgSend(v6, "assetIndex"))
      {
        v13 = -[TRIFBCloudKitTreatmentRecordAsset hasCkIndex](self, "hasCkIndex");
        v14 = v13 ^ objc_msgSend(v6, "hasCkIndex") ^ 1;
      }
      else
      {
LABEL_10:
        LOBYTE(v14) = 0;
      }
      objc_autoreleasePoolPop(v7);
    }
    else
    {
      LOBYTE(v14) = 0;
    }

  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

@end

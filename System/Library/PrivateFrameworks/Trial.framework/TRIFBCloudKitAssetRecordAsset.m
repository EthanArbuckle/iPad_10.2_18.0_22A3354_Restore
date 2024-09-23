@implementation TRIFBCloudKitAssetRecordAsset

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  -[TRIFBCloudKitAssetRecordAsset deepCopyUsingBufferBuilder:changes:](self, "deepCopyUsingBufferBuilder:changes:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 849, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bufferBuilder"));

  }
  v9 = (void *)MEMORY[0x1A1AC6B8C]();
  objc_msgSend(v7, "trifbCreateCloudKitAssetRecordAssetUsingBlock:", &__block_literal_global_4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v9);

  return v10;
}

- (TRIFBCloudKitAssetRecordAsset)initWithBufRef:(id)a3 cppPointer:(const CloudKitAssetRecordAsset *)a4
{
  id v7;
  TRIFBCloudKitAssetRecordAsset *v8;
  TRIFBCloudKitAssetRecordAsset *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRIFBCloudKitAssetRecordAsset;
  v8 = -[TRIFBCloudKitAssetRecordAsset init](&v11, sel_init);
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
  return -[TRIFBCloudKitAssetRecordAsset initVerifiedRootObjectFromData:requireUTF8:](self, "initVerifiedRootObjectFromData:requireUTF8:", a3, 1);
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return -[TRIFBCloudKitAssetRecordAsset initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:](self, "initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:", a3, a4, 64, 1000000);
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
  BOOL v17;
  uint64_t v18;
  id v19;
  void *v20;
  TRIFBCloudKitAssetRecordAsset *v21;
  TRIFBCloudKitAssetRecordAsset *v22;
  const unsigned __int8 *v24;
  unint64_t v25;
  int v26;
  unsigned int v27;
  int v28;
  unsigned int v29;
  uint64_t v30;
  char v31;

  v10 = a3;
  v11 = (void *)MEMORY[0x1A1AC6B8C]();
  v12 = objc_retainAutorelease(v10);
  v13 = objc_msgSend(v12, "bytes");
  if (v13)
    v14 = (const unsigned __int8 *)v13;
  else
    v14 = (const unsigned __int8 *)&emptyCArrayStorage;
  v15 = objc_msgSend(v12, "length");
  v24 = v14;
  v25 = v15;
  v26 = 0;
  v27 = a5;
  v28 = 0;
  v29 = a6;
  v30 = 0;
  v31 = 1;
  if (v15 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  if (v15 >= 5
    && ((v16 = *(unsigned int *)v14, (int)v16 >= 1) ? (v17 = v15 - 1 >= v16) : (v17 = 0),
        v17
     && apple::aiml::flatbuffers2::Verifier::VerifyTableStart((apple::aiml::flatbuffers2::Verifier *)&v24, &v14[v16])))
  {
    --v26;
    v18 = *(unsigned int *)v14;
    v19 = objc_alloc(MEMORY[0x1E0CFCED0]);
    v20 = (void *)objc_msgSend(v19, "initWithData:", v12, v24, v25);
    self = -[TRIFBCloudKitAssetRecordAsset initWithBufRef:cppPointer:](self, "initWithBufRef:cppPointer:", v20, &v14[v18]);

    v21 = self;
    if (a4)
    {
      if (-[TRIFBCloudKitAssetRecordAsset verifyUTF8Fields](self, "verifyUTF8Fields"))
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
  return 1;
}

- (unint64_t)hash
{
  objc_autoreleasePoolPop((void *)MEMORY[0x1A1AC6B8C](self, a2));
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  void *v4;
  id v5;
  char isKindOfClass;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      objc_autoreleasePoolPop((void *)MEMORY[0x1A1AC6B8C]());

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_br, 0);
}

@end

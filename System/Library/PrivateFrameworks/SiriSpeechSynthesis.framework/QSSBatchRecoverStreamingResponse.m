@implementation QSSBatchRecoverStreamingResponse

- (QSSBatchRecoverStreamingResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSBatchRecoverStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSBatchRecoverStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSBatchRecoverStreamingResponse)initWithFlatbuffData:(id)a3 root:(const BatchRecoverStreamingResponse *)a4
{
  return -[QSSBatchRecoverStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSBatchRecoverStreamingResponse)initWithFlatbuffData:(id)a3 root:(const BatchRecoverStreamingResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSBatchRecoverStreamingResponse *v10;
  QSSBatchRecoverStreamingResponse *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  flatbuffers::Table *root;
  unsigned __int16 *v21;
  unsigned int v22;
  siri::speech::schema_fb::BatchRecoverFinalResponse *v23;
  int v24;
  uint64_t v25;
  NSMutableDictionary *storage;
  QSSBatchRecoverStreamingResponse *v27;
  uint64_t v29;
  unint64_t v30;
  __int128 v31;
  uint64_t v32;
  char v33;
  objc_super v34;

  v5 = a5;
  v9 = a3;
  v34.receiver = self;
  v34.super_class = (Class)QSSBatchRecoverStreamingResponse;
  v10 = -[QSSBatchRecoverStreamingResponse init](&v34, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_34;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_35;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const BatchRecoverStreamingResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (v5)
  {
    v14 = objc_msgSend(*p_data, "bytes");
    v15 = objc_msgSend(*p_data, "length");
    var0 = (unint64_t)v11->_root->var0;
    if (var0 < v14 || var0 > v14 + v15)
      goto LABEL_35;
    v18 = objc_msgSend(*p_data, "bytes");
    v19 = objc_msgSend(*p_data, "length");
    v29 = v18;
    v30 = v19;
    v31 = xmmword_21E34D540;
    v32 = 0;
    v33 = 1;
    if (v19 >= 0x7FFFFFFF)
      __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
    root = (flatbuffers::Table *)v11->_root;
    if (root)
    {
      if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v29, v11->_root->var0))
        goto LABEL_35;
      v21 = (unsigned __int16 *)((char *)root - *(int *)root);
      v22 = *v21;
      if (v22 >= 5 && v21[2] && (v30 < 2 || v30 - 1 < (unint64_t)root + v21[2] - v29))
        goto LABEL_35;
      if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v29, 6u))
        goto LABEL_35;
      if (v22 >= 7)
      {
        if (v21[3])
        {
          v23 = (flatbuffers::Table *)((char *)root + v21[3] + *(unsigned int *)((char *)root + v21[3]));
LABEL_24:
          if (v21[2])
          {
            v24 = *((unsigned __int8 *)root + v21[2]);
            if (*((_BYTE *)root + v21[2]))
            {
              if (v24 == 2)
              {
                if (v23
                  && !siri::speech::schema_fb::BatchRecoverFinalResponse::Verify(v23, (flatbuffers::Verifier *)&v29))
                {
                  goto LABEL_35;
                }
              }
              else if (v24 != 1
                     || v23 && !siri::speech::schema_fb::PronGuessResponse::Verify(v23, (flatbuffers::Verifier *)&v29))
              {
LABEL_35:
                v27 = 0;
                goto LABEL_36;
              }
            }
          }
          goto LABEL_33;
        }
LABEL_23:
        v23 = 0;
        goto LABEL_24;
      }
      if (v22 >= 5)
        goto LABEL_23;
    }
  }
LABEL_33:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v29);
  v25 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v25;

LABEL_34:
  v27 = v11;
LABEL_36:

  return v27;
}

- (int64_t)content_type
{
  const BatchRecoverStreamingResponse *root;
  const BatchRecoverStreamingResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return root[v4].var0[0];
  else
    return 0;
}

- (QSSPronGuessResponse)contentAsQSSPronGuessResponse
{
  QSSPronGuessResponse *v3;
  QSSPronGuessResponse *v4;
  const BatchRecoverStreamingResponse *root;
  const BatchRecoverStreamingResponse *v6;
  uint64_t v7;
  const BatchRecoverStreamingResponse *v8;

  if (-[QSSBatchRecoverStreamingResponse content_type](self, "content_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSPronGuessResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSPronGuessResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSPronGuessResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSBatchRecoverFinalResponse)contentAsQSSBatchRecoverFinalResponse
{
  QSSBatchRecoverFinalResponse *v3;
  QSSBatchRecoverFinalResponse *v4;
  const BatchRecoverStreamingResponse *root;
  const BatchRecoverStreamingResponse *v6;
  uint64_t v7;
  const BatchRecoverStreamingResponse *v8;

  if (-[QSSBatchRecoverStreamingResponse content_type](self, "content_type") == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSBatchRecoverFinalResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSBatchRecoverFinalResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSBatchRecoverFinalResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (Offset<siri::speech::qss_fb::BatchRecoverStreamingResponse>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = -[QSSBatchRecoverStreamingResponse content_type](self, "content_type");
  if (-[QSSBatchRecoverStreamingResponse content_type](self, "content_type") == 1)
  {
    -[QSSBatchRecoverStreamingResponse contentAsQSSPronGuessResponse](self, "contentAsQSSPronGuessResponse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "addObjectToBuffer:", a3);

  }
  else
  {
    v7 = 0;
  }
  if (-[QSSBatchRecoverStreamingResponse content_type](self, "content_type") == 2)
  {
    -[QSSBatchRecoverStreamingResponse contentAsQSSBatchRecoverFinalResponse](self, "contentAsQSSBatchRecoverFinalResponse");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "addObjectToBuffer:", a3);

    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v11 = *((_QWORD *)a3 + 5);
  v12 = *((_QWORD *)a3 + 6);
  v13 = *((_QWORD *)a3 + 4);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 4, v5);
  if (-[QSSBatchRecoverStreamingResponse content_type](self, "content_type") == 1)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v7);
  if (-[QSSBatchRecoverStreamingResponse content_type](self, "content_type") == 2)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v10);
  return (Offset<siri::speech::qss_fb::BatchRecoverStreamingResponse>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v13 - (int)v12 + (int)v11);
}

- (id)flatbuffData
{
  Offset<siri::speech::qss_fb::BatchRecoverStreamingResponse> v2;
  const char *v3;
  flatbuffers::FlatBufferBuilder *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;

  v11 = 0;
  v12 = 0;
  v13 = xmmword_21E34D550;
  v14 = 0u;
  v15 = 0u;
  v16 = 0;
  v17 = 1;
  v18 = 256;
  v19 = 0;
  v2.var0 = -[QSSBatchRecoverStreamingResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__QSSBatchRecoverStreamingResponse_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v4;
  v8 = (void *)objc_msgSend(v5, "initWithBytesNoCopy:length:deallocator:", v6, v7, v10);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)&v11);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

flatbuffers::DetachedBuffer *__48__QSSBatchRecoverStreamingResponse_flatbuffData__block_invoke(uint64_t a1)
{
  flatbuffers::DetachedBuffer *result;

  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x2207ADCC8);
  }
  return result;
}

@end

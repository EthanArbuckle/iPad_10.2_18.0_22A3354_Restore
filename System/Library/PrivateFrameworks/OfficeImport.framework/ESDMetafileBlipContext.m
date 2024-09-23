@implementation ESDMetafileBlipContext

- (ESDMetafileBlipContext)initWithOffset:(unsigned int)a3 byteCount:(unsigned int)a4 uncompressed:(unsigned int)a5 stream:(SsrwOOStream *)a6 streamID:(unsigned int)a7
{
  ESDMetafileBlipContext *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ESDMetafileBlipContext;
  result = -[ESDBlipContext initWithOffset:byteCount:stream:streamID:](&v9, sel_initWithOffset_byteCount_stream_streamID_, *(_QWORD *)&a3, *(_QWORD *)&a4, a6, *(_QWORD *)&a7);
  if (result)
    *(&result->super.mByteCount + 1) = a5;
  return result;
}

- (void)setDefaultHeaderSize:(unsigned int)a3
{
  self->mCb = a3;
}

- (BOOL)loadDelayedNode:(id)a3
{
  id v4;
  unint64_t v5;
  unsigned int *p_mByteCount;
  void *v7;
  SsrwOOStream *mStream;
  id v9;
  uLongf v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t mCb;
  id v15;
  id v16;
  void *v17;
  BOOL v18;
  uLongf destLen;

  v4 = a3;
  v5 = (self->mCb + (unint64_t)*(&self->super.mByteCount + 1)) >> 32;
  if (!v5)
  {
    (*((void (**)(SsrwOOStream *, _QWORD, _QWORD, _QWORD))self->super.mStream->var0 + 3))(self->super.mStream, self->super.mStreamID, self->super.mStartOffset, 0);
    p_mByteCount = &self->super.mByteCount;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", self->super.mByteCount);
    mStream = self->super.mStream;
    v9 = objc_retainAutorelease(v7);
    (*((void (**)(SsrwOOStream *, uint64_t, unsigned int *))mStream->var0 + 7))(mStream, objc_msgSend(v9, "mutableBytes"), &self->super.mByteCount);
    v10 = *(&self->super.mByteCount + 1);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", (self->mCb + v10));
    destLen = v10;
    v12 = objc_retainAutorelease(v11);
    v13 = objc_msgSend(v12, "mutableBytes");
    mCb = self->mCb;
    v15 = objc_retainAutorelease(v9);
    LODWORD(v13) = uncompress((Bytef *)(v13 + mCb), &destLen, (const Bytef *)objc_msgSend(v15, "mutableBytes"), *p_mByteCount);
    v16 = v4;
    v17 = v16;
    if ((_DWORD)v13)
      v18 = 0;
    else
      v18 = destLen == v10;
    if (v18)
      objc_msgSend(v16, "setData:", v12);

  }
  return v5 == 0;
}

- (unsigned)defaultHeaderSize
{
  return self->mCb;
}

@end

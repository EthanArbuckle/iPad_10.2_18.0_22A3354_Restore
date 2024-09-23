@implementation ESDBlipContext

- (ESDBlipContext)initWithOffset:(unsigned int)a3 byteCount:(unsigned int)a4 stream:(SsrwOOStream *)a5 streamID:(unsigned int)a6
{
  ESDBlipContext *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ESDBlipContext;
  result = -[ESDBlipContext init](&v11, sel_init);
  if (result)
  {
    result->mStartOffset = a3;
    result->mByteCount = a4;
    result->mStream = a5;
    result->mStreamID = a6;
  }
  return result;
}

- (BOOL)loadDelayedNode:(id)a3
{
  id v4;
  SsrwOOStream *mStream;
  unsigned int *p_mByteCount;
  void *v7;
  SsrwOOStream *v8;
  id v9;
  char v10;

  v4 = a3;
  mStream = self->mStream;
  if (mStream)
  {
    (*((void (**)(SsrwOOStream *, _QWORD, _QWORD, _QWORD))mStream->var0 + 3))(mStream, self->mStreamID, self->mStartOffset, 0);
    p_mByteCount = &self->mByteCount;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", self->mByteCount);
    objc_msgSend(v7, "setLength:", self->mByteCount);
    v8 = self->mStream;
    v9 = objc_retainAutorelease(v7);
    (*((void (**)(SsrwOOStream *, uint64_t, unsigned int *))v8->var0 + 7))(v8, objc_msgSend(v9, "mutableBytes"), p_mByteCount);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v4, "setData:", v9);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v4, "setSoundData:", v9);
    }

    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10 & 1;
}

- (BOOL)saveDelayedMedia:(id)a3 toFile:(id)a4
{
  return 0;
}

- (SsrwOOStream)stream
{
  return self->mStream;
}

- (id)dataRep
{
  return 0;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ESDBlipContext;
  -[ESDBlipContext description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end

@implementation SFSSTTSEngineCallbackResult

- (SFSSTTSEngineCallbackResult)initWithBeginCallback:(id)a3 chunkCallback:(id)a4 endCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  SFSSTTSEngineCallbackResult *v11;
  uint64_t v12;
  id beginCallback;
  uint64_t v14;
  id chunkCallback;
  uint64_t v16;
  id endCallback;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SFSSTTSEngineCallbackResult;
  v11 = -[SFSSTTSEngineCallbackResult init](&v19, sel_init);
  if (v11)
  {
    v12 = MEMORY[0x2207ADF98](v8);
    beginCallback = v11->_beginCallback;
    v11->_beginCallback = (id)v12;

    v14 = MEMORY[0x2207ADF98](v9);
    chunkCallback = v11->_chunkCallback;
    v11->_chunkCallback = (id)v14;

    v16 = MEMORY[0x2207ADF98](v10);
    endCallback = v11->_endCallback;
    v11->_endCallback = (id)v16;

  }
  return v11;
}

- (int)synthesisCallback:(int)a3
{
  void (**endCallback)(id, SFSSTTSEngineCallbackResult *);
  NSError *v5;
  NSError *error;
  NSError *v7;
  NSError *v8;

  switch(a3)
  {
    case 4:
      (*((void (**)(void))self->_chunkCallback + 2))();
      v5 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v5;

      self->_pcmDataBuffer.__end_ = self->_pcmDataBuffer.__begin_;
      break;
    case 1:
      endCallback = (void (**)(id, SFSSTTSEngineCallbackResult *))self->_endCallback;
      goto LABEL_7;
    case 0:
      endCallback = (void (**)(id, SFSSTTSEngineCallbackResult *))self->_beginCallback;
LABEL_7:
      endCallback[2](endCallback, self);
      v7 = (NSError *)objc_claimAutoreleasedReturnValue();
      v8 = self->_error;
      self->_error = v7;

      break;
  }
  return -[NSError code](self->_error, "code");
}

- (void)pcmDataBuffer
{
  return &self->_pcmDataBuffer;
}

- (void)marker
{
  return &self->_marker;
}

- (id)pcmData
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", self->_pcmDataBuffer.__begin_, self->_pcmDataBuffer.__end_ - self->_pcmDataBuffer.__begin_);
}

- (NSError)error
{
  return self->_error;
}

- (id)beginCallback
{
  return self->_beginCallback;
}

- (void)setBeginCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)chunkCallback
{
  return self->_chunkCallback;
}

- (void)setChunkCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)endCallback
{
  return self->_endCallback;
}

- (void)setEndCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (AudioStreamBasicDescription)asbd
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[2].mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[3].mSampleRate;
  return self;
}

- (void)setAsbd:(AudioStreamBasicDescription *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->mSampleRate;
  v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_QWORD *)&self->_asbd.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_asbd.mBytesPerPacket = v4;
  *(_OWORD *)&self->_asbd.mSampleRate = v3;
}

- (void).cxx_destruct
{
  Marker *begin;
  Marker *end;
  Marker *v5;
  char *v6;

  objc_storeStrong(&self->_endCallback, 0);
  objc_storeStrong(&self->_chunkCallback, 0);
  objc_storeStrong(&self->_beginCallback, 0);
  objc_storeStrong((id *)&self->_error, 0);
  begin = self->_marker.__begin_;
  if (begin)
  {
    end = self->_marker.__end_;
    v5 = self->_marker.__begin_;
    if (end != begin)
    {
      do
      {
        if ((char)end[-1].markerName[255] < 0)
          operator delete(*(void **)&end[-1].markerName[232]);
        end = (Marker *)((char *)end - 56);
      }
      while (end != begin);
      v5 = self->_marker.__begin_;
    }
    self->_marker.__end_ = begin;
    operator delete(v5);
  }
  v6 = self->_pcmDataBuffer.__begin_;
  if (v6)
  {
    self->_pcmDataBuffer.__end_ = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end

@implementation MotionDecoderWrapper

- (id)motionDecoderWrapperLogSharedInstance
{
  if (-[MotionDecoderWrapper motionDecoderWrapperLogSharedInstance]::onceToken != -1)
    dispatch_once(&-[MotionDecoderWrapper motionDecoderWrapperLogSharedInstance]::onceToken, &__block_literal_global_0);
  return (id)-[MotionDecoderWrapper motionDecoderWrapperLogSharedInstance]::sharedInstance;
}

void __61__MotionDecoderWrapper_motionDecoderWrapperLogSharedInstance__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.signalcompression", "motionDecoderWrapper");
  v1 = (void *)-[MotionDecoderWrapper motionDecoderWrapperLogSharedInstance]::sharedInstance;
  -[MotionDecoderWrapper motionDecoderWrapperLogSharedInstance]::sharedInstance = (uint64_t)v0;

}

- (char)getPointerToDataBuffer:(id)a3
{
  return (char *)objc_msgSend(objc_retainAutorelease(a3), "bytes");
}

- (MotionDecoderWrapper)initWithEncoderSeqParams:(id)a3
{
  id v4;
  char *v5;
  gcl::motion::Decoder *v6;
  const void *v7;
  size_t v8;
  uint64_t v9;
  __int128 v10;
  NSObject *v11;
  int v12;
  int v13;
  int v14;
  unint64_t v16;
  void *__p;
  void *v18;
  uint64_t v19;
  objc_super v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MotionDecoderWrapper;
  v5 = -[MotionDecoderWrapper init](&v20, sel_init);
  if (v5)
  {
    v6 = (gcl::motion::Decoder *)operator new(8uLL);
    gcl::motion::Decoder::Decoder(v6);
    *((_QWORD *)v5 + 1) = v6;
    v7 = (const void *)objc_msgSend(v5, "getPointerToDataBuffer:", v4);
    v8 = objc_msgSend(v4, "length");
    __p = 0;
    v18 = 0;
    v19 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v7, (uint64_t)v7 + v8, v8);
    v16 = 0;
    gcl::motion::Decoder::decodeSequenceParameterSet(*((gcl::motion::DecoderImpl ***)v5 + 1), (const unsigned __int8 *)__p, objc_msgSend(v4, "length", 0), &v16, (AttributeInfo *)(v5 + 32));
    v9 = *((_QWORD *)v5 + 5);
    *(_QWORD *)&v10 = (int)v9;
    *((_QWORD *)&v10 + 1) = SHIDWORD(v9);
    *((_OWORD *)v5 + 1) = v10;
    v11 = (id)objc_msgSend(v5, "motionDecoderWrapperLogSharedInstance");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v5[36];
      v13 = v5[37];
      v14 = *((unsigned __int16 *)v5 + 19);
      *(_DWORD *)buf = 67110400;
      v22 = v12;
      v23 = 1024;
      v24 = v13;
      v25 = 1024;
      v26 = v14;
      v27 = 1024;
      v28 = 0;
      v29 = 1024;
      v30 = 3;
      v31 = 1024;
      v32 = 0;
      _os_log_impl(&dword_246093000, v11, OS_LOG_TYPE_DEFAULT, "Remote Encoder version is %d %d %d, Local Encoder version is %d %d %d", buf, 0x26u);
    }

    if (__p)
    {
      v18 = __p;
      operator delete(__p);
    }
  }

  return (MotionDecoderWrapper *)v5;
}

- (void)dealloc
{
  gcl::motion::DecoderImpl **decoder;
  void *v4;
  objc_super v5;

  decoder = (gcl::motion::DecoderImpl **)self->decoder;
  if (decoder)
  {
    gcl::motion::Decoder::~Decoder(decoder);
    operator delete(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)MotionDecoderWrapper;
  -[MotionDecoderWrapper dealloc](&v5, sel_dealloc);
}

- (int)getComponentPerAttributeCount
{
  return self->_componentsPerAttribute;
}

- (int)getAttributeCount
{
  return self->_attributeCount;
}

- (int)decodeFrameInternal:(id)a3 decodedFrame:(int *)a4 decodeError:(unint64_t *)a5
{
  id v8;
  size_t v9;
  char *v10;
  int v11;
  int v12;
  NSObject *v13;
  int v14;
  int *begin;
  int CurrentFrameNumber;
  int v18;
  int CurrentFrameQP;
  int CurrentFramePayloadLength;
  int CurrentFrameFlags;
  NSObject *v22;
  std::vector<int> v23;
  void *__p;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = objc_msgSend(v8, "length");
  v27 = 0;
  if (!v9)
  {
    v14 = 0;
    *a5 = 3;
    goto LABEL_12;
  }
  v10 = -[MotionDecoderWrapper getPointerToDataBuffer:](self, "getPointerToDataBuffer:", v8);
  __p = 0;
  v25 = 0;
  v26 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v10, (uint64_t)&v10[v9], v9);
  std::vector<int>::vector(&v23, self->_componentsPerAttribute * self->_attributeCount);
  v11 = gcl::motion::Decoder::decodeFrame((gcl::motion::DecoderImpl **)self->decoder, (const unsigned __int8 *)__p, v9, &v27, v23.__begin_);
  v12 = v11;
  if (v11)
  {
    *a5 = 4;
    if (v11 == 7)
    {
      *a5 = 5;
    }
    else if (v11 == 11)
    {
      *a5 = 6;
      v22 = -[MotionDecoderWrapper motionDecoderWrapperLogSharedInstance](self, "motionDecoderWrapperLogSharedInstance");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[MotionDecoderWrapper decodeFrameInternal:decodedFrame:decodeError:].cold.1((uint64_t)self, v22);

    }
    v13 = -[MotionDecoderWrapper motionDecoderWrapperLogSharedInstance](self, "motionDecoderWrapperLogSharedInstance");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      CurrentFrameNumber = gcl::motion::Decoder::getCurrentFrameNumber((gcl::motion::Decoder *)self->decoder);
      v18 = gcl::motion::Decoder::getlastDecodedFrameNumber((gcl::motion::Decoder *)self->decoder);
      CurrentFrameQP = gcl::motion::Decoder::getCurrentFrameQP((gcl::motion::Decoder *)self->decoder);
      CurrentFramePayloadLength = gcl::motion::Decoder::getCurrentFramePayloadLength((gcl::motion::Decoder *)self->decoder);
      CurrentFrameFlags = gcl::motion::Decoder::getCurrentFrameFlags((gcl::motion::Decoder *)self->decoder);
      *(_DWORD *)buf = 67110400;
      v29 = v12;
      v30 = 1024;
      v31 = CurrentFrameNumber;
      v32 = 1024;
      v33 = v18;
      v34 = 1024;
      v35 = CurrentFrameQP;
      v36 = 1024;
      v37 = CurrentFramePayloadLength;
      v38 = 1024;
      v39 = CurrentFrameFlags;
      _os_log_error_impl(&dword_246093000, v13, OS_LOG_TYPE_ERROR, "Failed to decode with error %d c:%d p:%d q:%d l:%d f:%d", buf, 0x26u);
    }

    v14 = 0;
    begin = v23.__begin_;
    if (!v23.__begin_)
      goto LABEL_9;
  }
  else
  {
    begin = v23.__begin_;
    if (v23.__end_ != v23.__begin_)
      memmove(a4, v23.__begin_, (char *)v23.__end_ - (char *)v23.__begin_);
    v14 = v27;
    if (!begin)
      goto LABEL_9;
  }
  v23.__end_ = begin;
  operator delete(begin);
LABEL_9:
  if (__p)
  {
    v25 = __p;
    operator delete(__p);
  }
LABEL_12:

  return v14;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_BYTE *)self + 48) = 0;
  return self;
}

- (void)decodeFrameInternal:(uint64_t)a1 decodedFrame:(NSObject *)a2 decodeError:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 36);
  v3 = *(unsigned __int8 *)(a1 + 37);
  v4 = *(unsigned __int16 *)(a1 + 38);
  v5[0] = 67110400;
  v5[1] = v2;
  v6 = 1024;
  v7 = v3;
  v8 = 1024;
  v9 = v4;
  v10 = 1024;
  v11 = 0;
  v12 = 1024;
  v13 = 3;
  v14 = 1024;
  v15 = 0;
  _os_log_error_impl(&dword_246093000, a2, OS_LOG_TYPE_ERROR, "Remote Encoder version is %d %d %d, Local Encoder version is %d %d %d", (uint8_t *)v5, 0x26u);
}

@end

@implementation MotionEncoderWrapper

- (id)motionEncoderWrapperLogSharedInstance
{
  if (-[MotionEncoderWrapper motionEncoderWrapperLogSharedInstance]::onceToken != -1)
    dispatch_once(&-[MotionEncoderWrapper motionEncoderWrapperLogSharedInstance]::onceToken, &__block_literal_global);
  return (id)-[MotionEncoderWrapper motionEncoderWrapperLogSharedInstance]::sharedInstance;
}

void __61__MotionEncoderWrapper_motionEncoderWrapperLogSharedInstance__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.signalcompression", "motionEncoderWrapper");
  v1 = (void *)-[MotionEncoderWrapper motionEncoderWrapperLogSharedInstance]::sharedInstance;
  -[MotionEncoderWrapper motionEncoderWrapperLogSharedInstance]::sharedInstance = (uint64_t)v0;

}

- (MotionEncoderWrapper)initWithAttributeCount:(unsigned int)a3 componentCount:(unsigned int)a4 quantization:(unsigned int)a5
{
  unsigned __int8 v5;
  MotionEncoderWrapper *v8;
  MotionEncoderWrapper *v9;
  gcl::motion::Encoder *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  gcl::motion::EncoderImpl **encoder;
  void *v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  size_t v28;
  void *v29;
  char *v30;
  char *v31;
  char v32;
  NSData *v33;
  NSData *encoderParamsData;
  unint64_t v35;
  char *begin;
  unint64_t v37;
  NSObject *v38;
  MotionEncoderWrapper *v39;
  void *__p;
  char *v42;
  unint64_t v43;
  objc_super v44;
  uint8_t buf[4];
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v5 = a5;
  v51 = *MEMORY[0x24BDAC8D0];
  v44.receiver = self;
  v44.super_class = (Class)MotionEncoderWrapper;
  v8 = -[MotionEncoderWrapper init](&v44, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_36;
  v8->_componentsPerAttribute = a4;
  v8->_attributeCount = a3;
  v8->_quantization = v5;
  v10 = (gcl::motion::Encoder *)operator new(8uLL);
  gcl::motion::Encoder::Encoder(v10);
  v9->encoder = v10;
  *(_QWORD *)&v9->_intraFramePeriod = 2;
  std::vector<unsigned char>::vector(&__p, 8uLL);
  v11 = gcl::motion::Encoder::encodeSequenceParameterSet((gcl::motion::EncoderImpl **)v9->encoder, v9->_attributeCount, v9->_componentsPerAttribute, (unsigned __int8 *)__p, v42 - (_BYTE *)__p, &v9->encParametersLength);
  if (v11)
  {
    v12 = -[MotionEncoderWrapper motionEncoderWrapperLogSharedInstance](v9, "motionEncoderWrapperLogSharedInstance");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MotionEncoderWrapper initWithAttributeCount:componentCount:quantization:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    encoder = (gcl::motion::EncoderImpl **)v9->encoder;
    if (encoder)
    {
      gcl::motion::Encoder::~Encoder(encoder);
      operator delete(v21);
    }
  }
  else
  {
    v22 = v42;
    if ((unint64_t)v42 >= v43)
    {
      v24 = (unint64_t)__p;
      v25 = v42 - (_BYTE *)__p;
      v26 = v42 - (_BYTE *)__p + 1;
      if (v26 < 0)
        std::vector<gcl::ArithmeticContext>::__throw_length_error[abi:ne180100]();
      v27 = v43 - (_QWORD)__p;
      if (2 * (v43 - (unint64_t)__p) > v26)
        v26 = 2 * v27;
      if (v27 >= 0x3FFFFFFFFFFFFFFFLL)
        v28 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v28 = v26;
      if (v28)
        v29 = operator new(v28);
      else
        v29 = 0;
      v30 = (char *)v29 + v28;
      *((_BYTE *)v29 + v25) = v5;
      v23 = (uint64_t)v29 + v25 + 1;
      if (v22 == (char *)v24)
      {
        v29 = (char *)v29 + v25;
      }
      else
      {
        v31 = &v22[~v24];
        do
        {
          v32 = *--v22;
          (v31--)[(_QWORD)v29] = v32;
        }
        while (v22 != (char *)v24);
        v22 = (char *)__p;
      }
      __p = v29;
      v42 = (char *)v23;
      v43 = (unint64_t)v30;
      if (v22)
        operator delete(v22);
    }
    else
    {
      *v42 = v5;
      v23 = (uint64_t)(v22 + 1);
    }
    v42 = (char *)v23;
    ++v9->encParametersLength;
    v33 = (NSData *)(id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", __p);
    encoderParamsData = v9->_encoderParamsData;
    v9->_encoderParamsData = v33;

    v35 = gcl::motion::Encoder::estimateMaxEncodedFrameSize((gcl::motion::Encoder *)v9->_attributeCount, v9->_componentsPerAttribute);
    begin = v9->_bitstream.__begin_;
    v9->estimatedEncodedFrameSizeInBytes = v35;
    v37 = v9->_bitstream.__end_ - begin;
    if (v35 <= v37)
    {
      if (v35 < v37)
        v9->_bitstream.__end_ = &begin[v35];
    }
    else
    {
      std::vector<unsigned char>::__append((unint64_t *)&v9->_bitstream, v35 - v37);
    }
    v38 = -[MotionEncoderWrapper motionEncoderWrapperLogSharedInstance](v9, "motionEncoderWrapperLogSharedInstance");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      v46 = 0;
      v47 = 1024;
      v48 = 3;
      v49 = 1024;
      v50 = 0;
      _os_log_impl(&dword_246093000, v38, OS_LOG_TYPE_DEFAULT, "Local Encoder version is %d %d %d", buf, 0x14u);
    }

  }
  if (__p)
  {
    v42 = (char *)__p;
    operator delete(__p);
  }
  if (v11)
    v39 = 0;
  else
LABEL_36:
    v39 = v9;

  return v39;
}

- (void)dealloc
{
  gcl::motion::EncoderImpl **encoder;
  void *v4;
  objc_super v5;

  encoder = (gcl::motion::EncoderImpl **)self->encoder;
  if (encoder)
  {
    gcl::motion::Encoder::~Encoder(encoder);
    operator delete(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)MotionEncoderWrapper;
  -[MotionEncoderWrapper dealloc](&v5, sel_dealloc);
}

- (id)getEncoderParams
{
  return self->_encoderParamsData;
}

- (id)encodeFrameInternal:(const int *)a3 type:(unint64_t *)a4 encodeError:(unint64_t *)a5
{
  unint64_t v8;
  int frameCount;
  _BOOL8 v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v20;
  NSObject *v21;
  id v22;
  unint64_t v23;
  int v24;
  __int16 v25;
  unsigned __int8 quantization;
  void *__p;
  void *v28;
  uint64_t v29;

  if (a3)
  {
    v8 = self->_componentsPerAttribute * (uint64_t)self->_attributeCount;
    v28 = 0;
    v29 = 0;
    __p = 0;
    std::vector<int>::__init_with_size[abi:ne180100]<int const*,int const*>(&__p, a3, (uint64_t)&a3[v8], v8);
    if (*a4 == 1)
    {
      LODWORD(v10) = 1;
    }
    else if (*a4 == 2)
    {
      frameCount = self->_frameCount;
      v10 = frameCount % self->_intraFramePeriod != 0;
      *a4 = v10;
      self->_frameCount = frameCount + 1;
    }
    else
    {
      LODWORD(v10) = 0;
    }
    v24 = 0;
    v25 = 257;
    quantization = self->_quantization;
    v23 = 0;
    v20 = gcl::motion::Encoder::encodeFrame((uint64_t *)self->encoder, (int *)__p, v10, (unint64_t *)self->_bitstream.__begin_, self->_bitstream.__end_ - self->_bitstream.__begin_, &v23, &v24);
    if (v20)
    {
      *a5 = 2;
      v21 = -[MotionEncoderWrapper motionEncoderWrapperLogSharedInstance](self, "motionEncoderWrapperLogSharedInstance");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[MotionEncoderWrapper encodeFrameInternal:type:encodeError:].cold.2(v20, v21);

      v22 = 0;
    }
    else
    {
      v22 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", self->_bitstream.__begin_, v23);
    }
    if (__p)
    {
      v28 = __p;
      operator delete(__p);
    }
    return v22;
  }
  else
  {
    *a5 = 1;
    v11 = -[MotionEncoderWrapper motionEncoderWrapperLogSharedInstance](self, "motionEncoderWrapperLogSharedInstance", 0, a4);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MotionEncoderWrapper encodeFrameInternal:type:encodeError:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    return 0;
  }
}

- (void).cxx_destruct
{
  char *begin;

  begin = self->_bitstream.__begin_;
  if (begin)
  {
    self->_bitstream.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_encoderParamsData, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  return self;
}

- (void)initWithAttributeCount:(uint64_t)a3 componentCount:(uint64_t)a4 quantization:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_246093000, a1, a3, "Could not serialize encoder params", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)encodeFrameInternal:(uint64_t)a3 type:(uint64_t)a4 encodeError:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_246093000, a1, a3, "Error Input buffer is null", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)encodeFrameInternal:(int)a1 type:(NSObject *)a2 encodeError:.cold.2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_246093000, a2, OS_LOG_TYPE_ERROR, "Error cannot compress inputs %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

@end

@implementation UCAppClipCodeURLDecoder

+ (id)decoderWithVersion:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCodingVersion:", a3);
}

- (UCAppClipCodeURLDecoder)initWithCodingVersion:(int64_t)a3
{
  UCAppClipCodeURLDecoder *v4;
  UCAppClipCodeURLDecoder *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  UCAppClipCodeURLDecoder *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UCAppClipCodeURLDecoder;
  v4 = -[UCAppClipCodeURLDecoder init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_codingVersion = a3;
    v4->_compressionVersion = +[UCAppClipCodeEnDecUtility compressionVersionFromPayloadVersion:](UCAppClipCodeEnDecUtility, "compressionVersionFromPayloadVersion:", a3);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[UCAppClipCodeURLDecoder initWithCodingVersion:].cold.1((uint64_t)&v5->_codingVersion, (uint64_t)&v5->_compressionVersion, v6, v7, v8, v9, v10, v11);
    v12 = v5;
  }

  return v5;
}

- (void)dealloc
{
  unique_ptr<UC::SUE::SegmentedURLDecoderImpl, std::default_delete<UC::SUE::SegmentedURLDecoderImpl>> *p_segmentedDecoder;
  uint64_t v4;
  SegmentedURLDecoderImpl *value;
  objc_super v6;

  value = self->_segmentedDecoder.__ptr_.__value_;
  p_segmentedDecoder = &self->_segmentedDecoder;
  v4 = (uint64_t)value;
  p_segmentedDecoder->__ptr_.__value_ = 0;
  if (value)
    std::default_delete<UC::SUE::SegmentedURLEncoderImpl>::operator()[abi:ne180100]((uint64_t)p_segmentedDecoder, v4);
  std::unique_ptr<UC::SUE::PrefixedURLEncoderImpl>::reset[abi:ne180100]((uint64_t *)&self->_prefixedDecoder, 0);
  v6.receiver = self;
  v6.super_class = (Class)UCAppClipCodeURLDecoder;
  -[UCAppClipCodeURLDecoder dealloc](&v6, sel_dealloc);
}

- (unique_ptr<UC::UCBitVector,)_bitVectorFromData:(id)a3
{
  _QWORD *v3;
  _QWORD *v4;
  id v5;
  const unsigned __int8 *v6;
  id v7;
  unique_ptr<UC::UCBitVector, std::default_delete<UC::UCBitVector>> v8;

  v4 = v3;
  v5 = a3;
  v6 = (const unsigned __int8 *)objc_msgSend(v5, "length");
  v7 = objc_retainAutorelease(v5);
  UC::bitVectorFromAppClipCodeEncodingData((UC *)objc_msgSend(v7, "bytes"), v6, v4);

  return v8;
}

- (id)_errorWithCoderErrorCode:(int64_t)a3 message:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD0FC8]);
  v8 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.URLCompression.URLCoderErrorDomain"), a3, v7);

  return v8;
}

- (id)decodeURLWithData:(id)a3 error:(id *)a4
{
  id v6;
  int64_t compressionVersion;
  id v8;
  void *v9;
  id v10;

  v6 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[UCAppClipCodeURLDecoder decodeURLWithData:error:].cold.1();
  compressionVersion = self->_compressionVersion;
  if (compressionVersion == 1)
  {
    v8 = -[UCAppClipCodeURLDecoder _decodeURLWithDataV1:error:](self, "_decodeURLWithDataV1:error:", v6, a4);
  }
  else
  {
    if (compressionVersion)
    {
      v10 = -[UCAppClipCodeURLDecoder _errorWithCoderErrorCode:message:](self, "_errorWithCoderErrorCode:message:", 1002, CFSTR("Decoding of the data failed. Unsupported code version."));
      v9 = 0;
      *a4 = v10;
      goto LABEL_9;
    }
    v8 = -[UCAppClipCodeURLDecoder _decodeURLWithDataV0:error:](self, "_decodeURLWithDataV0:error:", v6, a4);
  }
  v9 = v8;
LABEL_9:

  return v9;
}

- (id)_decodeURLWithDataV0:(id)a3 error:(id *)a4
{
  id v6;
  UC::SUE::UCSegmentedURLCoderProvider ***p_segmentedDecoder;
  const UC::UCBitVector *v8;
  UC::UCBitStream *v9;
  UC::UCBitStream *v10;
  std::string *p_p;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  UC::SUE::UCSegmentedURLCoderProvider **v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  UC::SUE::UCSegmentedURLCoderProvider **v23;
  UC::SUE::UCSegmentedURLCoderProvider **v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  void **v29;
  void **v30;
  __int128 v32;
  UC::SUE::UCSegmentedURLCoderProvider **v33;
  UC::UCBitStream *v34[2];
  char v35;
  void *v36[2];
  char v37;
  std::string __p;

  v6 = a3;
  p_segmentedDecoder = (UC::SUE::UCSegmentedURLCoderProvider ***)&self->_segmentedDecoder;
  if (!self->_segmentedDecoder.__ptr_.__value_)
  {
    v14 = objc_retainAutorelease(+[UCResourceFilePath combinedPathAndQueryFilePathForSegmentedURLCoderVersion0](UCResourceFilePath, "combinedPathAndQueryFilePathForSegmentedURLCoderVersion0"));
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v14, "UTF8String"));
    v15 = +[UCResourceFilePath segmentedPathAndQueryFilePathForSegmentedURLCoderVersion0](UCResourceFilePath, "segmentedPathAndQueryFilePathForSegmentedURLCoderVersion0");

    v16 = objc_retainAutorelease(v15);
    std::string::basic_string[abi:ne180100]<0>(v36, (char *)objc_msgSend(v16, "UTF8String"));
    v17 = +[UCResourceFilePath hostFilePathForSegmentedURLCoderVersion0](UCResourceFilePath, "hostFilePathForSegmentedURLCoderVersion0");

    v18 = objc_retainAutorelease(v17);
    std::string::basic_string[abi:ne180100]<0>(v34, (char *)objc_msgSend(v18, "UTF8String"));
    std::allocate_shared[abi:ne180100]<UC::SUE::UCSegmentedURLCoderProvider,std::allocator<UC::SUE::UCSegmentedURLCoderProvider>,std::string &,std::string &,std::string &,void>((uint64_t)v34, (uint64_t)&__p, (uint64_t)v36, &v32);
    if (v35 < 0)
      operator delete(v34[0]);
    if (v37 < 0)
      operator delete(v36[0]);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);

    v19 = (UC::SUE::UCSegmentedURLCoderProvider **)operator new(0x18uLL);
    *(_OWORD *)v36 = v32;
    v32 = 0uLL;
    UC::SUE::SegmentedURLDecoderImpl::SegmentedURLDecoderImpl(v19, v36);
    v33 = v19;
    v20 = (std::__shared_weak_count *)v36[1];
    if (v36[1])
    {
      v21 = (unint64_t *)((char *)v36[1] + 8);
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    v23 = v33;
    v33 = 0;
    v24 = *p_segmentedDecoder;
    *p_segmentedDecoder = v23;
    if (v24)
    {
      std::default_delete<UC::SUE::SegmentedURLEncoderImpl>::operator()[abi:ne180100]((uint64_t)&self->_segmentedDecoder, (uint64_t)v24);
      v25 = (uint64_t)v33;
      v33 = 0;
      if (v25)
        std::default_delete<UC::SUE::SegmentedURLEncoderImpl>::operator()[abi:ne180100]((uint64_t)&v33, v25);
    }
    v26 = (std::__shared_weak_count *)*((_QWORD *)&v32 + 1);
    if (*((_QWORD *)&v32 + 1))
    {
      v27 = (unint64_t *)(*((_QWORD *)&v32 + 1) + 8);
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
  }
  -[UCAppClipCodeURLDecoder _bitVectorFromData:](self, "_bitVectorFromData:", v6);
  v8 = (const UC::UCBitVector *)v36[0];
  v9 = (UC::UCBitStream *)operator new(0x30uLL);
  UC::UCBitStream::UCBitStream(v9, v8);
  v34[0] = v9;
  if (UC::readUntilBeginMarkerFound(v9, v10) && UC::UCBitStream::hasMore(v34[0]))
  {
    UC::SUE::SegmentedURLDecoderImpl::decodeURL(*p_segmentedDecoder, v34[0], &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    v12 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", p_p);
    v13 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12);

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v13 = 0;
    if (a4)
      *a4 = -[UCAppClipCodeURLDecoder _errorWithCoderErrorCode:message:](self, "_errorWithCoderErrorCode:message:", 1002, CFSTR("The encoding data is malformed"));
  }
  v29 = (void **)v34[0];
  v34[0] = 0;
  if (v29)
    std::default_delete<UC::UCBitVector>::operator()[abi:ne180100]((int)v34, v29);
  v30 = (void **)v36[0];
  v36[0] = 0;
  if (v30)
    std::default_delete<UC::UCBitVector>::operator()[abi:ne180100]((int)v36, v30);

  return v13;
}

- (id)_decodeURLWithDataV1:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  UC::UCBitStream *v7;
  PrefixedURLDecoderImpl *value;
  UC::SUE::PrefixedURLDecoderImpl *v9;
  void **v10;
  id v11;
  id v12;
  id v13;
  void **v14;
  void **v15;
  void *__p[2];
  char v18;
  void *v19;
  void *v20;

  v5 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[UCAppClipCodeURLDecoder _decodeURLWithDataV1:error:].cold.4();
  v6 = +[UCAppClipCodeEnDecUtility perepareData:withCodingVersion:forCompressionVersion:](UCAppClipCodeEnDecUtility, "perepareData:withCodingVersion:forCompressionVersion:", v5, self->_codingVersion, self->_compressionVersion);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[UCAppClipCodeURLDecoder _decodeURLWithDataV1:error:].cold.3();
  -[UCAppClipCodeURLDecoder _bitVectorFromData:](self, "_bitVectorFromData:", v6);
  v7 = (UC::UCBitStream *)operator new(0x30uLL);
  UC::UCBitStream::UCBitStream(v7, (const UC::UCBitVector *)v20);
  v19 = v7;
  value = self->_prefixedDecoder.__ptr_.__value_;
  if (!value)
  {
    v9 = (UC::SUE::PrefixedURLDecoderImpl *)operator new(0x20uLL);
    UC::SUE::PrefixedURLDecoderImpl::PrefixedURLDecoderImpl(v9, self->_codingVersion);
    __p[0] = 0;
    std::unique_ptr<UC::SUE::PrefixedURLEncoderImpl>::reset[abi:ne180100]((uint64_t *)&self->_prefixedDecoder, (uint64_t)v9);
    std::unique_ptr<UC::SUE::PrefixedURLEncoderImpl>::reset[abi:ne180100]((uint64_t *)__p, 0);
    value = self->_prefixedDecoder.__ptr_.__value_;
    v7 = (UC::UCBitStream *)v19;
  }
  UC::SUE::PrefixedURLDecoderImpl::decodeURL((UC::SUE::PrefixedURLDecoderImpl *)value, v7, (uint64_t)__p);
  if (v18 >= 0)
    v10 = __p;
  else
    v10 = (void **)__p[0];
  v11 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v10);
  v12 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v11);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[UCAppClipCodeURLDecoder _decodeURLWithDataV1:error:].cold.2();
  v13 = +[UCAppClipCodeEnDecUtility prepareURL:withCompressionVersion:forCodingVersion:](UCAppClipCodeEnDecUtility, "prepareURL:withCompressionVersion:forCodingVersion:", v12, self->_compressionVersion, self->_codingVersion);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[UCAppClipCodeURLDecoder _decodeURLWithDataV1:error:].cold.1();

  if (v18 < 0)
    operator delete(__p[0]);
  v14 = (void **)v19;
  v19 = 0;
  if (v14)
    std::default_delete<UC::UCBitVector>::operator()[abi:ne180100]((int)&v19, v14);
  v15 = (void **)v20;
  v20 = 0;
  if (v15)
    std::default_delete<UC::UCBitVector>::operator()[abi:ne180100]((int)&v20, v15);

  return v13;
}

- (int64_t)codingVersion
{
  return self->_codingVersion;
}

- (void)clearCaches
{
  UC::SUE::UCSegmentedURLCoderProvider **value;

  value = (UC::SUE::UCSegmentedURLCoderProvider **)self->_segmentedDecoder.__ptr_.__value_;
  if (value)
    UC::SUE::SegmentedURLEncoderImpl::clearCaches(value);
}

- (void).cxx_destruct
{
  uint64_t v3;
  unique_ptr<UC::SUE::SegmentedURLDecoderImpl, std::default_delete<UC::SUE::SegmentedURLDecoderImpl>> *p_segmentedDecoder;
  SegmentedURLDecoderImpl *value;

  std::unique_ptr<UC::SUE::PrefixedURLEncoderImpl>::reset[abi:ne180100]((uint64_t *)&self->_prefixedDecoder, 0);
  value = self->_segmentedDecoder.__ptr_.__value_;
  p_segmentedDecoder = &self->_segmentedDecoder;
  v3 = (uint64_t)value;
  p_segmentedDecoder->__ptr_.__value_ = 0;
  if (value)
    std::default_delete<UC::SUE::SegmentedURLEncoderImpl>::operator()[abi:ne180100]((uint64_t)p_segmentedDecoder, v3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)initWithCodingVersion:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_220DD4000, MEMORY[0x24BDACB70], a3, "Initializing decoder with codingVersion: %lu compressionVersion: %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)decodeURLWithData:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_220DD4000, MEMORY[0x24BDACB70], v0, "-decodeURLWithData: encodingData: %@ compressionVersion: %lu", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)_decodeURLWithDataV1:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_220DD4000, MEMORY[0x24BDACB70], v0, "-_decodeURLWithDataV1: Returning prepared URL: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)_decodeURLWithDataV1:error:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_220DD4000, MEMORY[0x24BDACB70], v0, "-_decodeURLWithDataV1: Decoded urlString: %@, decodedURL: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)_decodeURLWithDataV1:error:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_220DD4000, MEMORY[0x24BDACB70], v0, "-_decodeURLWithDataV1: finished preparing data. Decoding data: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)_decodeURLWithDataV1:error:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  v3 = 2048;
  v4 = v0;
  v5 = 2048;
  v6 = v1;
  _os_log_debug_impl(&dword_220DD4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "-_decodeURLWithDataV1: preparingData: %@ with codingVersion: %lu compressionVersion: %lu", v2, 0x20u);
}

@end

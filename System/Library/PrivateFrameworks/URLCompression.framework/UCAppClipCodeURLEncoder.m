@implementation UCAppClipCodeURLEncoder

+ (id)encoderWithExtendedInterfaceWithVersion:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCodingVersion:", a3);
}

- (UCAppClipCodeURLEncoder)initWithCodingVersion:(int64_t)a3
{
  UCAppClipCodeURLEncoder *v4;
  UCAppClipCodeURLEncoder *v5;
  UCAppClipCodeURLEncoder *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UCAppClipCodeURLEncoder;
  v4 = -[UCAppClipCodeURLEncoder init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_codingVersion = a3;
    v4->_compressionVersion = +[UCAppClipCodeEnDecUtility compressionVersionFromPayloadVersion:](UCAppClipCodeEnDecUtility, "compressionVersionFromPayloadVersion:", a3);
    v6 = v5;
  }

  return v5;
}

- (void)dealloc
{
  unique_ptr<UC::SUE::SegmentedURLEncoderImpl, std::default_delete<UC::SUE::SegmentedURLEncoderImpl>> *p_segmentedEncoder;
  uint64_t v4;
  SegmentedURLEncoderImpl *value;
  objc_super v6;

  value = self->_segmentedEncoder.__ptr_.__value_;
  p_segmentedEncoder = &self->_segmentedEncoder;
  v4 = (uint64_t)value;
  p_segmentedEncoder->__ptr_.__value_ = 0;
  if (value)
    std::default_delete<UC::SUE::SegmentedURLEncoderImpl>::operator()[abi:ne180100]((uint64_t)p_segmentedEncoder, v4);
  v6.receiver = self;
  v6.super_class = (Class)UCAppClipCodeURLEncoder;
  -[UCAppClipCodeURLEncoder dealloc](&v6, sel_dealloc);
}

- (int64_t)codingVersion
{
  return self->_codingVersion;
}

- (id)_convertRawURLEncodingBitsToAppClipCodeData:(const void *)a3
{
  int v3;
  unsigned __int8 *v4;
  uint64_t v5;
  int v6;
  unsigned __int8 *v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t v12[3];

  if (self->_codingVersion)
  {
    v3 = *((char *)a3 + 23);
    if (v3 >= 0)
      v4 = (unsigned __int8 *)a3;
    else
      v4 = *(unsigned __int8 **)a3;
    if (v3 >= 0)
      v5 = *((unsigned __int8 *)a3 + 23);
    else
      v5 = *((_QWORD *)a3 + 1);
    UC::appClipCodeVersion1Bytes(v4, v5, v12);
  }
  else
  {
    v6 = *((char *)a3 + 23);
    if (v6 >= 0)
      v7 = (unsigned __int8 *)a3;
    else
      v7 = *(unsigned __int8 **)a3;
    if (v6 >= 0)
      v8 = *((unsigned __int8 *)a3 + 23);
    else
      v8 = *((_QWORD *)a3 + 1);
    UC::appClipCodeVersion0Bytes(v7, v8, v12);
  }
  v9 = (void *)v12[0];
  v10 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v12[0], v12[1] - v12[0]);
  if (v9)
    operator delete(v9);
  return v10;
}

- (id)encodeURLV0:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  id v14;
  UC::SUE::UCSegmentedURLEncodingResult::HostResult *v15;
  std::__shared_weak_count *v16;

  v14 = 0;
  -[UCAppClipCodeURLEncoder _encodeURL:error:](self, "_encodeURL:error:", a3, &v14);
  v6 = v14;
  v7 = v6;
  if (a4)
    *a4 = objc_retainAutorelease(v6);
  if (v15)
    v8 = v7 == 0;
  else
    v8 = 0;
  if (v8)
    v9 = -[UCAppClipCodeURLEncoder _convertRawURLEncodingBitsToAppClipCodeData:](self, "_convertRawURLEncodingBitsToAppClipCodeData:", UC::SUE::UCSegmentedURLEncodingResult::HostResult::getEncodingBits(v15));
  else
    v9 = 0;
  v10 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  return v9;
}

- (id)encodeURLV1:(id)a3 error:(id *)a4
{
  id v5;
  UC::SUE::PrefixedURLEncoderImpl *v6;
  NSURL *v7;
  PrefixedURLEncoderImpl *value;
  id v9;
  id v10;
  void **v11;
  std::string v13[8];
  std::string v14;
  void **v15;

  v5 = a3;
  if (!self->_prefixedURLEncoder.__ptr_.__value_)
  {
    v6 = (UC::SUE::PrefixedURLEncoderImpl *)operator new(0x20uLL);
    UC::SUE::PrefixedURLEncoderImpl::PrefixedURLEncoderImpl(v6, self->_codingVersion);
    v13[0].__r_.__value_.__r.__words[0] = 0;
    std::unique_ptr<UC::SUE::PrefixedURLEncoderImpl>::reset[abi:ne180100]((uint64_t *)&self->_prefixedURLEncoder, (uint64_t)v6);
    std::unique_ptr<UC::SUE::PrefixedURLEncoderImpl>::reset[abi:ne180100]((uint64_t *)v13, 0);
  }
  v7 = (NSURL *)+[UCAppClipCodeEnDecUtility prepareURL:withCodingVersion:forCompressionVersion:](UCAppClipCodeEnDecUtility, "prepareURL:withCodingVersion:forCompressionVersion:", v5, self->_codingVersion, self->_compressionVersion, v13[0].__r_.__value_.__r.__words[0]);

  value = self->_prefixedURLEncoder.__ptr_.__value_;
  UCURLComponentsFromNSURL(v7, v13);
  UC::SUE::PrefixedURLEncoderImpl::encodeURL((UC::SUE::PrefixedURLEncoderImpl *)value, (const UC::UCURLComponents *)v13, &v14);
  UC::UCURLComponents::~UCURLComponents((void **)&v13[0].__r_.__value_.__l.__data_);
  v9 = -[UCAppClipCodeURLEncoder _convertRawURLEncodingBitsToAppClipCodeData:](self, "_convertRawURLEncodingBitsToAppClipCodeData:", UC::SUE::UCSegmentedURLEncodingResult::HostResult::getEncodingBits((UC::SUE::UCSegmentedURLEncodingResult::HostResult *)&v14));
  v10 = +[UCAppClipCodeEnDecUtility prepareData:withCompressionVersion:forCodingVersion:](UCAppClipCodeEnDecUtility, "prepareData:withCompressionVersion:forCodingVersion:", v9, self->_compressionVersion, self->_codingVersion);

  v11 = v15;
  v15 = 0;
  if (v11)
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)&v15, v11);
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);

  return v10;
}

- (id)encodeURL:(id)a3 error:(id *)a4
{
  id v6;
  int64_t compressionVersion;
  id v8;
  void *v9;

  v6 = a3;
  compressionVersion = self->_compressionVersion;
  if (compressionVersion == 1)
  {
    v8 = -[UCAppClipCodeURLEncoder encodeURLV1:error:](self, "encodeURLV1:error:", v6, a4);
  }
  else
  {
    if (compressionVersion)
    {
      v9 = 0;
      goto LABEL_7;
    }
    v8 = -[UCAppClipCodeURLEncoder encodeURLV0:error:](self, "encodeURLV0:error:", v6, a4);
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (id)resultForEncodingURL:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  UCAppClipCodeURLEncodingResult *v9;
  id v10;
  void *v11;
  uint64_t EncodingBits;
  uint64_t v13;
  id v14;
  UC::SUE::UCSegmentedURLEncodingResult::HostResult *HostEncodingResult;
  uint64_t v16;
  uint64_t v17;
  UC::SUE::UCSegmentedURLEncodingResult::HostResult *v18;
  int FormatType;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  id v25;
  UC::SUE::UCSegmentedURLEncodingResult::HostResult *v26;
  std::__shared_weak_count *v27;

  v6 = a3;
  v25 = 0;
  -[UCAppClipCodeURLEncoder _encodeURL:error:](self, "_encodeURL:error:", v6, &v25);
  v7 = v25;
  v8 = v7;
  if (a4)
    *a4 = objc_retainAutorelease(v7);
  v9 = 0;
  if (v26 && !v8)
  {
    v10 = -[UCAppClipCodeURLEncoder _convertRawURLEncodingBitsToAppClipCodeData:](self, "_convertRawURLEncodingBitsToAppClipCodeData:", UC::SUE::UCSegmentedURLEncodingResult::HostResult::getEncodingBits(v26));
    v11 = (void *)MEMORY[0x24BDD17C8];
    EncodingBits = UC::SUE::UCSegmentedURLEncodingResult::HostResult::getEncodingBits(v26);
    if (*(char *)(EncodingBits + 23) >= 0)
      v13 = EncodingBits;
    else
      v13 = *(_QWORD *)EncodingBits;
    v14 = (id)objc_msgSend(v11, "stringWithFormat:", CFSTR("1%s"), v13);
    v9 = +[UCAppClipCodeURLEncodingResult resultWithRawEncodedBits:appClipCodeBytes:](UCAppClipCodeURLEncodingResult, "resultWithRawEncodedBits:appClipCodeBytes:", v14, v10);
    -[UCAppClipCodeURLEncodingResult setUrl:](v9, "setUrl:", v6);
    HostEncodingResult = (UC::SUE::UCSegmentedURLEncodingResult::HostResult *)UC::SUE::UCSegmentedURLEncodingResult::getHostEncodingResult(v26);
    v16 = UC::SUE::UCSegmentedURLEncodingResult::HostResult::getEncodingBits(HostEncodingResult);
    if (*(char *)(v16 + 23) >= 0)
      v17 = *(unsigned __int8 *)(v16 + 23);
    else
      v17 = *(_QWORD *)(v16 + 8);
    -[UCAppClipCodeURLEncodingResult setHostEncodedBitCount:](v9, "setHostEncodedBitCount:", v17);
    -[UCAppClipCodeURLEncodingResult setHasPathOrQueryEncoding:](v9, "setHasPathOrQueryEncoding:", UC::SUE::UCSegmentedURLEncodingResult::getHasPathOrQuery(v26));
    v18 = (UC::SUE::UCSegmentedURLEncodingResult::HostResult *)UC::SUE::UCSegmentedURLEncodingResult::getHostEncodingResult(v26);
    FormatType = UC::SUE::UCSegmentedURLEncodingResult::HostResult::getFormatType(v18);
    if (FormatType == 2)
      v20 = 2;
    else
      v20 = FormatType == 1;
    -[UCAppClipCodeURLEncodingResult setHostEncodingFormat:](v9, "setHostEncodingFormat:", v20);
    -[UCAppClipCodeURLEncodingResult setTemplateType:](v9, "setTemplateType:", UC::SUE::UCSegmentedURLEncodingResult::getTemplateType(v26) != 0);
    -[UCAppClipCodeURLEncodingResult setSubdomainType:](v9, "setSubdomainType:", UC::SUE::UCSegmentedURLEncodingResult::HostResult::getFormatType(v26) != 0);
    -[UCAppClipCodeURLEncodingResult setNonTemplatePathAndQueryEncodeType:](v9, "setNonTemplatePathAndQueryEncodeType:", UC::SUE::UCSegmentedURLEncodingResult::getNonTemplatePathAndQueryEncodeType(v26) != 0);

  }
  v21 = v27;
  if (v27)
  {
    p_shared_owners = (unint64_t *)&v27->__shared_owners_;
    do
      v23 = __ldaxr(p_shared_owners);
    while (__stlxr(v23 - 1, p_shared_owners));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

  return v9;
}

- (id)_errorWithUnsupportedURLComponentType:(int64_t)a3
{
  id v3;
  id v4;
  id v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = CFSTR("UCURLCoderUnsupportedURLComponentType");
  v3 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8[0] = v3;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);

  v5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.URLCompression.URLCoderErrorDomain"), 2, v4);
  return v5;
}

- (id)_errorWithCoderErrorCode:(int64_t)a3 codingErrorSymbol:(id)a4 message:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = a4;
  v8 = a5;
  v9 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD0FC8]);
  if (v7)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("UCURLCoderErrorSymbol"));
  v11 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.URLCompression.URLCoderErrorDomain"), a3, v10);

  return v11;
}

- (id)_errorFromCoderError:(const void *)a3
{
  const void **v5;
  int v6;
  size_t v7;
  const void *v8;
  const void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  UCAppClipCodeURLEncoder *v15;
  uint64_t v16;
  int v17;
  char *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  int v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;

  v5 = (const void **)((char *)a3 + 8);
  v6 = *((char *)a3 + 31);
  if (v6 >= 0)
    v7 = *((unsigned __int8 *)a3 + 31);
  else
    v7 = *((_QWORD *)a3 + 2);
  if (v7 == strlen("UCSegmentedURLCoderErrorDomain")
    && (v6 >= 0 ? (v8 = v5) : (v8 = *v5), !memcmp(v8, "UCSegmentedURLCoderErrorDomain", v7))
    || v7 == strlen("UCPrefixedURLCoderErrorDomain")
    && (v6 >= 0 ? (v9 = v5) : (v9 = *v5), !memcmp(v9, "UCPrefixedURLCoderErrorDomain", v7)))
  {
    v13 = 0;
    switch(*((_DWORD *)a3 + 8))
    {
      case 1:
        v10 = (void *)MEMORY[0x24BDD1540];
        v11 = 1;
        goto LABEL_15;
      case 2:
        v15 = self;
        v16 = 0;
        goto LABEL_23;
      case 3:
        v15 = self;
        v16 = 1;
        goto LABEL_23;
      case 4:
        v15 = self;
        v16 = 2;
LABEL_23:
        v12 = -[UCAppClipCodeURLEncoder _errorWithUnsupportedURLComponentType:](v15, "_errorWithUnsupportedURLComponentType:", v16);
        goto LABEL_16;
      case 5:
        v38 = *((char *)a3 + 63);
        if (v38 >= 0)
          v39 = (char *)a3 + 40;
        else
          v39 = (char *)*((_QWORD *)a3 + 5);
        if (v38 >= 0)
          v40 = *((unsigned __int8 *)a3 + 63);
        else
          v40 = *((_QWORD *)a3 + 6);
        v20 = nsStringFromString((uint64_t)v39, v40);
        v43 = *((_QWORD *)a3 + 8);
        v42 = (char *)a3 + 64;
        v41 = v43;
        v44 = v42[23];
        if (v44 >= 0)
          v45 = (uint64_t)v42;
        else
          v45 = v41;
        if (v44 >= 0)
          v46 = v42[23];
        else
          v46 = *((_QWORD *)v42 + 1);
        v27 = nsStringFromString(v45, v46);
        v28 = -[UCAppClipCodeURLEncoder _errorWithCoderErrorCode:codingErrorSymbol:message:](self, "_errorWithCoderErrorCode:codingErrorSymbol:message:", 3, v20, v27);
        goto LABEL_63;
      case 6:
        v17 = *((char *)a3 + 63);
        if (v17 >= 0)
          v18 = (char *)a3 + 40;
        else
          v18 = (char *)*((_QWORD *)a3 + 5);
        if (v17 >= 0)
          v19 = *((unsigned __int8 *)a3 + 63);
        else
          v19 = *((_QWORD *)a3 + 6);
        v20 = nsStringFromString((uint64_t)v18, v19);
        v23 = *((_QWORD *)a3 + 8);
        v22 = (char *)a3 + 64;
        v21 = v23;
        v24 = v22[23];
        if (v24 >= 0)
          v25 = (uint64_t)v22;
        else
          v25 = v21;
        if (v24 >= 0)
          v26 = v22[23];
        else
          v26 = *((_QWORD *)v22 + 1);
        v27 = nsStringFromString(v25, v26);
        v28 = -[UCAppClipCodeURLEncoder _errorWithCoderErrorCode:codingErrorSymbol:message:](self, "_errorWithCoderErrorCode:codingErrorSymbol:message:", 4, v20, v27);
        goto LABEL_63;
      case 8:
        v29 = *((char *)a3 + 63);
        if (v29 >= 0)
          v30 = (char *)a3 + 40;
        else
          v30 = (char *)*((_QWORD *)a3 + 5);
        if (v29 >= 0)
          v31 = *((unsigned __int8 *)a3 + 63);
        else
          v31 = *((_QWORD *)a3 + 6);
        v20 = nsStringFromString((uint64_t)v30, v31);
        v34 = *((_QWORD *)a3 + 8);
        v33 = (char *)a3 + 64;
        v32 = v34;
        v35 = v33[23];
        if (v35 >= 0)
          v36 = (uint64_t)v33;
        else
          v36 = v32;
        if (v35 >= 0)
          v37 = v33[23];
        else
          v37 = *((_QWORD *)v33 + 1);
        v27 = nsStringFromString(v36, v37);
        v28 = -[UCAppClipCodeURLEncoder _errorWithCoderErrorCode:codingErrorSymbol:message:](self, "_errorWithCoderErrorCode:codingErrorSymbol:message:", 1003, v20, v27);
LABEL_63:
        v13 = v28;

        break;
      default:
        return v13;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = -1;
LABEL_15:
    v12 = (id)objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.URLCompression.URLCoderErrorDomain"), v11, 0);
LABEL_16:
    v13 = v12;
  }
  return v13;
}

- (shared_ptr<UC::SUE::UCSegmentedURLEncodingResult>)_encodeURL:(id)a3 error:(id *)a4
{
  _QWORD *v4;
  _QWORD *v7;
  NSURL *v8;
  unique_ptr<UC::SUE::SegmentedURLEncoderImpl, std::default_delete<UC::SUE::SegmentedURLEncoderImpl>> *p_segmentedEncoder;
  UC::SUE::SegmentedURLEncoderImpl *v10;
  char *v11;
  uint64_t v12;
  void **v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  void **v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD *v23;
  std::string::size_type v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *size;
  unint64_t *v28;
  unint64_t v29;
  std::string::size_type v30;
  uint64_t value;
  uint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  UCSegmentedURLEncodingResult *v36;
  __shared_weak_count *v37;
  std::string __p[8];
  std::string v39;
  uint64_t v40;
  int v41;
  void **v42;
  char v43;
  __int128 v44;
  __int128 v45;
  char v46;
  shared_ptr<UC::SUE::UCSegmentedURLEncodingResult> result;

  v7 = v4;
  v8 = (NSURL *)a3;
  p_segmentedEncoder = &self->_segmentedEncoder;
  if (!self->_segmentedEncoder.__ptr_.__value_)
  {
    v18 = objc_retainAutorelease(+[UCResourceFilePath combinedPathAndQueryFilePathForSegmentedURLCoderVersion0](UCResourceFilePath, "combinedPathAndQueryFilePathForSegmentedURLCoderVersion0"));
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v18, "UTF8String"));
    v19 = +[UCResourceFilePath segmentedPathAndQueryFilePathForSegmentedURLCoderVersion0](UCResourceFilePath, "segmentedPathAndQueryFilePathForSegmentedURLCoderVersion0");

    v20 = objc_retainAutorelease(v19);
    std::string::basic_string[abi:ne180100]<0>(&v39, (char *)objc_msgSend(v20, "UTF8String"));
    v21 = +[UCResourceFilePath hostFilePathForSegmentedURLCoderVersion0](UCResourceFilePath, "hostFilePathForSegmentedURLCoderVersion0");

    v22 = objc_retainAutorelease(v21);
    std::string::basic_string[abi:ne180100]<0>(&v45, (char *)objc_msgSend(v22, "UTF8String"));
    std::allocate_shared[abi:ne180100]<UC::SUE::UCSegmentedURLCoderProvider,std::allocator<UC::SUE::UCSegmentedURLCoderProvider>,std::string &,std::string &,std::string &,void>((uint64_t)&v45, (uint64_t)__p, (uint64_t)&v39, &v44);
    if (v46 < 0)
      operator delete((void *)v45);
    if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v39.__r_.__value_.__l.__data_);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p[0].__r_.__value_.__l.__data_);

    v23 = operator new(0x18uLL);
    v24 = (std::string::size_type)v23;
    *(_OWORD *)&v39.__r_.__value_.__l.__data_ = v44;
    if (*((_QWORD *)&v44 + 1))
    {
      v25 = (unint64_t *)(*((_QWORD *)&v44 + 1) + 8);
      do
        v26 = __ldxr(v25);
      while (__stxr(v26 + 1, v25));
    }
    UC::SUE::SegmentedURLEncoderImpl::SegmentedURLEncoderImpl(v23, &v39);
    __p[0].__r_.__value_.__r.__words[0] = v24;
    size = (std::__shared_weak_count *)v39.__r_.__value_.__l.__size_;
    if (v39.__r_.__value_.__l.__size_)
    {
      v28 = (unint64_t *)(v39.__r_.__value_.__l.__size_ + 8);
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
        std::__shared_weak_count::__release_weak(size);
      }
    }
    v30 = __p[0].__r_.__value_.__r.__words[0];
    __p[0].__r_.__value_.__r.__words[0] = 0;
    value = (uint64_t)p_segmentedEncoder->__ptr_.__value_;
    p_segmentedEncoder->__ptr_.__value_ = (SegmentedURLEncoderImpl *)v30;
    if (value)
    {
      std::default_delete<UC::SUE::SegmentedURLEncoderImpl>::operator()[abi:ne180100]((uint64_t)&self->_segmentedEncoder, value);
      v32 = __p[0].__r_.__value_.__r.__words[0];
      __p[0].__r_.__value_.__r.__words[0] = 0;
      if (v32)
        std::default_delete<UC::SUE::SegmentedURLEncoderImpl>::operator()[abi:ne180100]((uint64_t)__p, v32);
    }
    v33 = (std::__shared_weak_count *)*((_QWORD *)&v44 + 1);
    if (*((_QWORD *)&v44 + 1))
    {
      v34 = (unint64_t *)(*((_QWORD *)&v44 + 1) + 8);
      do
        v35 = __ldaxr(v34);
      while (__stlxr(v35 - 1, v34));
      if (!v35)
      {
        ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
        std::__shared_weak_count::__release_weak(v33);
      }
    }
  }
  *v7 = 0;
  v7[1] = 0;
  if (v8)
  {
    v10 = (UC::SUE::SegmentedURLEncoderImpl *)p_segmentedEncoder->__ptr_.__value_;
    UCURLComponentsFromNSURL(v8, __p);
    UC::SUE::SegmentedURLEncoderImpl::encodeURL(v10, (const UC::UCURLComponents *)__p, &v39);
    v11 = (char *)operator new(0x50uLL);
    *((_QWORD *)v11 + 1) = 0;
    *((_QWORD *)v11 + 2) = 0;
    *(_QWORD *)v11 = off_24E6B2918;
    *(_OWORD *)(v11 + 24) = *(_OWORD *)&v39.__r_.__value_.__l.__data_;
    *(_OWORD *)&v39.__r_.__value_.__l.__data_ = 0uLL;
    v12 = v40;
    *((_QWORD *)v11 + 5) = *((_QWORD *)&v39.__r_.__value_.__l + 2);
    *((_QWORD *)v11 + 6) = v12;
    *((_DWORD *)v11 + 14) = v41;
    v13 = v42;
    v39.__r_.__value_.__r.__words[2] = 0;
    v42 = 0;
    *((_QWORD *)v11 + 8) = v13;
    v11[72] = v43;
    *(_QWORD *)&v45 = v11 + 24;
    *((_QWORD *)&v45 + 1) = v11;
    std::shared_ptr<UC::UCHuffmanCoder>::operator=[abi:ne180100]((uint64_t)v7, &v45);
    v14 = (std::__shared_weak_count *)*((_QWORD *)&v45 + 1);
    if (*((_QWORD *)&v45 + 1))
    {
      v15 = (unint64_t *)(*((_QWORD *)&v45 + 1) + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    v17 = v42;
    v42 = 0;
    if (v17)
      std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)&v42, v17);
    if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v39.__r_.__value_.__l.__data_);
    UC::UCURLComponents::~UCURLComponents((void **)&__p[0].__r_.__value_.__l.__data_);
  }
  else if (a4)
  {
    *a4 = -[UCAppClipCodeURLEncoder _errorWithCoderErrorCode:codingErrorSymbol:message:](self, "_errorWithCoderErrorCode:codingErrorSymbol:message:", 1001, 0, CFSTR("Cannot encode a null URL. Make sure a valid URL is provided"));
  }

  result.var1 = v37;
  result.var0 = v36;
  return result;
}

- (void)clearCaches
{
  UC::SUE::UCSegmentedURLCoderProvider **value;

  value = (UC::SUE::UCSegmentedURLCoderProvider **)self->_segmentedEncoder.__ptr_.__value_;
  if (value)
    UC::SUE::SegmentedURLEncoderImpl::clearCaches(value);
}

- (void).cxx_destruct
{
  uint64_t v3;
  unique_ptr<UC::SUE::SegmentedURLEncoderImpl, std::default_delete<UC::SUE::SegmentedURLEncoderImpl>> *p_segmentedEncoder;
  SegmentedURLEncoderImpl *value;

  std::unique_ptr<UC::SUE::PrefixedURLEncoderImpl>::reset[abi:ne180100]((uint64_t *)&self->_prefixedURLEncoder, 0);
  value = self->_segmentedEncoder.__ptr_.__value_;
  p_segmentedEncoder = &self->_segmentedEncoder;
  v3 = (uint64_t)value;
  p_segmentedEncoder->__ptr_.__value_ = 0;
  if (value)
    std::default_delete<UC::SUE::SegmentedURLEncoderImpl>::operator()[abi:ne180100]((uint64_t)p_segmentedEncoder, v3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end

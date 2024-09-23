@implementation REContentRanker

- (REContentRanker)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REContentRanker;
  return -[REContentRanker init](&v3, sel_init);
}

- (BOOL)load:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  REContentFeatureExtractor *p_extractor;
  BOOL v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  std::string __p;

  v6 = a3;
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("PositiveContent.dic"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v7, 4, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_8;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
  p_extractor = &self->_extractor;
  v11 = REContentFeatureExtractor::LoadPositiveModel((uint64_t)&self->_extractor, &__p);
  v12 = v11;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v12)
      goto LABEL_4;
LABEL_8:
    v16 = 0;
    goto LABEL_11;
  }
  if (!v11)
    goto LABEL_8;
LABEL_4:
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("NegativeContent.dic"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v13, 4, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
    v16 = REContentFeatureExtractor::LoadNegativeModel((uint64_t)p_extractor, &__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v16 = 0;
  }

LABEL_11:
  return v16;
}

- (BOOL)save:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  _BOOL8 v8;
  std::ios_base_vtbl *v9;
  void *v10;
  id v11;
  void (__cdecl **v13)(std::ios_base *__hidden);
  std::ios_base v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  std::ios_base v18;
  uint64_t v19;
  int v20;
  _BYTE __sb[120];
  _BOOL8 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PositiveContent.dic"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2199B1CE4](__sb);
  v7 = objc_retainAutorelease(v6);
  objc_msgSend(v7, "UTF8String");
  std::filebuf::open();
  v8 = v22;
  v9 = (std::ios_base_vtbl *)MEMORY[0x24BEDB828];
  if (v22)
  {
    v17 = MEMORY[0x24BEDB828] + 24;
    v18.__vftable = (std::ios_base_vtbl *)(MEMORY[0x24BEDB828] + 64);
    std::ios_base::init(&v18, __sb);
    v19 = 0;
    v20 = -1;
    REContentFeatureExtractor::SavePositiveModel((uint64_t)&self->_extractor, &v17);
    std::ostream::flush();
    std::ostream::~ostream();
  }
  std::filebuf::close();
  if (v8)
  {
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("NegativeContent.dic"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x2199B1CE4](&v17);
    v11 = objc_retainAutorelease(v10);
    objc_msgSend(v11, "UTF8String");
    std::filebuf::open();
    LOBYTE(v8) = v18.__parray_ != 0;
    if (v18.__parray_)
    {
      v13 = &v9[1].~ios_base_0;
      v14.__vftable = v9 + 4;
      std::ios_base::init(&v14, &v17);
      v15 = 0;
      v16 = -1;
      REContentFeatureExtractor::SaveNegativeModel((uint64_t)&self->_extractor, &v13);
      std::ostream::flush();
      std::ostream::~ostream();
    }
    std::filebuf::close();
    MEMORY[0x2199B1CF0](&v17);

  }
  MEMORY[0x2199B1CF0](__sb);

  return v8;
}

- (BOOL)train:(id)a3 isPositive:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  unint64_t i;
  id v9;
  uint64_t v10;
  char v11;
  std::vector<std::string> v13;
  std::vector<std::string> *v14;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    std::vector<std::string>::vector(&v13, objc_msgSend(v6, "count"));
    v7 = 0;
    for (i = 0; i < objc_msgSend(v6, "count"); ++i)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = objc_msgSend(v9, "UTF8String");
      MEMORY[0x2199B1C9C](&v13.__begin_[v7], v10);

      ++v7;
    }
    v11 = REContentFeatureExtractor::train(&self->_extractor.m_rwlock, (__int128 **)&v13, v4);
    v14 = &v13;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)predict:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t i;
  id v8;
  uint64_t v9;
  void **v11[3];
  unsigned int v12;
  double v13;
  double v14;
  std::vector<std::string> v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (objc_msgSend(v4, "count"))
  {
    std::vector<std::string>::vector(&v15, objc_msgSend(v4, "count"));
    v6 = 0;
    for (i = 0; i < objc_msgSend(v4, "count"); ++i)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", i);
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = objc_msgSend(v8, "UTF8String");
      MEMORY[0x2199B1C9C](&v15.__begin_[v6], v9);

      ++v6;
    }
    REContentFeatureExtractor::predict((uint64_t)&self->_extractor, (unsigned __int8 **)&v15, (uint64_t)v11);
    objc_msgSend(v5, "setValid:", LOBYTE(v11[0]));
    objc_msgSend(v5, "setPositivePolarity:", *(double *)&v11[2]);
    objc_msgSend(v5, "setNegativePolarity:", *(double *)&v11[1]);
    objc_msgSend(v5, "setUnknownCount:", v12);
    objc_msgSend(v5, "setUnbiasedPositivePolarity:", v13);
    objc_msgSend(v5, "setUnbiasedNegativePolarity:", v14);
    v11[0] = (void **)&v15;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v11);
  }
  else
  {
    objc_msgSend(v5, "setValid:", 0);
  }

  return v5;
}

- (int64_t)positiveMapSize
{
  return SLODWORD(self->_extractor.m_trueTopTokens.m_mapDocumentFrequency.__table_.__p2_.__value_);
}

- (int64_t)negativeMapSize
{
  return SLODWORD(self->_extractor.m_falseTopTokens.m_mapDocumentFrequency.__table_.__p2_.__value_);
}

- (NSString)positiveContent
{
  uint64_t v3;
  void *v4;
  void *p_p;
  void *v6;
  void *__p;
  char v9;
  uint64_t v10;
  std::ios_base v11;
  uint64_t v12;
  int v13;
  uint64_t __sb[8];
  __int128 v15;
  __int128 v16;
  int v17;

  std::streambuf::basic_streambuf();
  v3 = MEMORY[0x24BEDB848];
  __sb[0] = MEMORY[0x24BEDB848] + 16;
  v15 = 0u;
  v16 = 0u;
  v17 = 24;
  v10 = MEMORY[0x24BEDB828] + 24;
  v11.__vftable = (std::ios_base_vtbl *)(MEMORY[0x24BEDB828] + 64);
  std::ios_base::init(&v11, __sb);
  v12 = 0;
  v13 = -1;
  REContentFeatureExtractor::SavePositiveModel((uint64_t)&self->_extractor, &v10);
  std::ostream::flush();
  v4 = (void *)MEMORY[0x24BDD17C8];
  std::stringbuf::str();
  if (v9 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  objc_msgSend(v4, "stringWithUTF8String:", p_p);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 < 0)
    operator delete(__p);
  std::ostream::~ostream();
  __sb[0] = v3 + 16;
  if (SBYTE7(v16) < 0)
    operator delete((void *)v15);
  std::streambuf::~streambuf();
  return (NSString *)v6;
}

- (NSString)negativeContent
{
  uint64_t v3;
  void *v4;
  void *p_p;
  void *v6;
  void *__p;
  char v9;
  uint64_t v10;
  std::ios_base v11;
  uint64_t v12;
  int v13;
  uint64_t __sb[8];
  __int128 v15;
  __int128 v16;
  int v17;

  std::streambuf::basic_streambuf();
  v3 = MEMORY[0x24BEDB848];
  __sb[0] = MEMORY[0x24BEDB848] + 16;
  v15 = 0u;
  v16 = 0u;
  v17 = 24;
  v10 = MEMORY[0x24BEDB828] + 24;
  v11.__vftable = (std::ios_base_vtbl *)(MEMORY[0x24BEDB828] + 64);
  std::ios_base::init(&v11, __sb);
  v12 = 0;
  v13 = -1;
  REContentFeatureExtractor::SaveNegativeModel((uint64_t)&self->_extractor, &v10);
  std::ostream::flush();
  v4 = (void *)MEMORY[0x24BDD17C8];
  std::stringbuf::str();
  if (v9 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  objc_msgSend(v4, "stringWithUTF8String:", p_p);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 < 0)
    operator delete(__p);
  std::ostream::~ostream();
  __sb[0] = v3 + 16;
  if (SBYTE7(v16) < 0)
    operator delete((void *)v15);
  std::streambuf::~streambuf();
  return (NSString *)v6;
}

- (void).cxx_destruct
{
  REContentFeatureExtractor::~REContentFeatureExtractor(&self->_extractor);
}

- (id).cxx_construct
{
  REContentFeatureExtractor::REContentFeatureExtractor(&self->_extractor);
  return self;
}

@end

@implementation UPDataDetectors

- (id)initLoadFromDataDetectorsDirectoryPath:(id)a3 forLocale:(id)a4
{
  id v6;
  id v7;
  UPDataDetectors *v8;
  id v9;
  std::string *v10;
  __int128 v11;
  std::string *v12;
  std::string::size_type v13;
  char v14;
  id v15;
  std::string *v16;
  __int128 v17;
  std::string *v18;
  std::string::size_type v19;
  char v20;
  uaap::UPDataDetector *v21;
  int64x2_t *v22;
  std::string v24;
  std::string v25;
  void *__p[2];
  void *v27[4];
  void *v28[2];
  void *v29[4];
  __int128 v30;
  _QWORD v31[4];
  std::string v32;
  objc_super v33;
  std::__fs::filesystem::path v34;
  std::__fs::filesystem::path v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)UPDataDetectors;
  v8 = -[UPDataDetectors init](&v33, sel_init);
  if (v8)
  {
    __p[0] = (void *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v32, (char **)__p);
    memset(v31, 0, sizeof(v31));
    v30 = 0u;
    *(_OWORD *)v28 = 0u;
    memset(v29, 0, sizeof(v29));
    memset(v27, 0, sizeof(v27));
    *(_OWORD *)__p = 0u;
    std::__fs::filesystem::path::path[abi:ne180100]<char [16],void>(&v34.__pn_, "addresses.cache");
    std::__fs::filesystem::operator/[abi:ne180100](&v35.__pn_, (uint64_t)&v32, &v34);
    if (SHIBYTE(v27[0]) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = *(_OWORD *)&v35.__pn_.__r_.__value_.__l.__data_;
    v27[0] = (void *)v35.__pn_.__r_.__value_.__r.__words[2];
    *((_BYTE *)&v35.__pn_.__r_.__value_.__s + 23) = 0;
    v35.__pn_.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v34.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v34.__pn_.__r_.__value_.__l.__data_);
    std::__fs::filesystem::path::path[abi:ne180100]<char [16],void>(&v34.__pn_, "date_time.cache");
    std::__fs::filesystem::operator/[abi:ne180100](&v35.__pn_, (uint64_t)&v32, &v34);
    if (SHIBYTE(v27[3]) < 0)
      operator delete(v27[1]);
    *(std::__fs::filesystem::path *)&v27[1] = v35;
    *((_BYTE *)&v35.__pn_.__r_.__value_.__s + 23) = 0;
    v35.__pn_.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v34.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v34.__pn_.__r_.__value_.__l.__data_);
    std::__fs::filesystem::path::path[abi:ne180100]<char [14],void>(&v34.__pn_, "flights.cache");
    std::__fs::filesystem::operator/[abi:ne180100](&v35.__pn_, (uint64_t)&v32, &v34);
    if (SHIBYTE(v29[0]) < 0)
      operator delete(v28[0]);
    *(_OWORD *)v28 = *(_OWORD *)&v35.__pn_.__r_.__value_.__l.__data_;
    v29[0] = (void *)v35.__pn_.__r_.__value_.__r.__words[2];
    *((_BYTE *)&v35.__pn_.__r_.__value_.__s + 23) = 0;
    v35.__pn_.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v34.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v34.__pn_.__r_.__value_.__l.__data_);
    memset(&v34, 0, sizeof(v34));
    std::string::append[abi:ne180100]<char const*,0>(&v34.__pn_, "currencies.cache", ");
    std::__fs::filesystem::operator/[abi:ne180100](&v35.__pn_, (uint64_t)&v32, &v34);
    if (SHIBYTE(v29[3]) < 0)
      operator delete(v29[1]);
    *(std::__fs::filesystem::path *)&v29[1] = v35;
    *((_BYTE *)&v35.__pn_.__r_.__value_.__s + 23) = 0;
    v35.__pn_.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v34.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v34.__pn_.__r_.__value_.__l.__data_);
    std::__fs::filesystem::path::path[abi:ne180100]<char [14],void>(&v34.__pn_, "numbers.cache");
    std::__fs::filesystem::operator/[abi:ne180100](&v35.__pn_, (uint64_t)&v32, &v34);
    if (SHIBYTE(v31[0]) < 0)
      operator delete((void *)v30);
    v30 = *(_OWORD *)&v35.__pn_.__r_.__value_.__l.__data_;
    v31[0] = *((_QWORD *)&v35.__pn_.__r_.__value_.__l + 2);
    *((_BYTE *)&v35.__pn_.__r_.__value_.__s + 23) = 0;
    v35.__pn_.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v34.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v34.__pn_.__r_.__value_.__l.__data_);
    std::__fs::filesystem::path::path[abi:ne180100]<char [19],void>(&v34.__pn_, "phone_mobile.cache");
    std::__fs::filesystem::operator/[abi:ne180100](&v35.__pn_, (uint64_t)&v32, &v34);
    if (SHIBYTE(v31[3]) < 0)
      operator delete((void *)v31[1]);
    *(std::__fs::filesystem::path *)&v31[1] = v35;
    *((_BYTE *)&v35.__pn_.__r_.__value_.__s + 23) = 0;
    v35.__pn_.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v34.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v34.__pn_.__r_.__value_.__l.__data_);
    objc_msgSend(v7, "languageCode");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&v24, (char *)objc_msgSend(v9, "UTF8String"));
    v10 = std::string::insert(&v24, 0, "addresses_");
    v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
    v25.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v11;
    v10->__r_.__value_.__l.__size_ = 0;
    v10->__r_.__value_.__r.__words[2] = 0;
    v10->__r_.__value_.__r.__words[0] = 0;
    v12 = std::string::append(&v25, ".cache");
    v13 = v12->__r_.__value_.__r.__words[0];
    v36[0] = v12->__r_.__value_.__l.__size_;
    *(_QWORD *)((char *)v36 + 7) = *(std::string::size_type *)((char *)&v12->__r_.__value_.__r.__words[1] + 7);
    v14 = HIBYTE(v12->__r_.__value_.__r.__words[2]);
    v12->__r_.__value_.__l.__size_ = 0;
    v12->__r_.__value_.__r.__words[2] = 0;
    v12->__r_.__value_.__r.__words[0] = 0;
    *(std::string::size_type *)((char *)&v34.__pn_.__r_.__value_.__r.__words[1] + 7) = *(_QWORD *)((char *)v36 + 7);
    v34.__pn_.__r_.__value_.__r.__words[0] = v13;
    v34.__pn_.__r_.__value_.__l.__size_ = v36[0];
    *((_BYTE *)&v34.__pn_.__r_.__value_.__s + 23) = v14;
    std::__fs::filesystem::operator/[abi:ne180100](&v35.__pn_, (uint64_t)&v32, &v34);
    if (SHIBYTE(v34.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v34.__pn_.__r_.__value_.__l.__data_);
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v25.__r_.__value_.__l.__data_);
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v24.__r_.__value_.__l.__data_);

    std::__fs::filesystem::__status(&v35, 0);
    if (v34.__pn_.__r_.__value_.__s.__data_[0] && v34.__pn_.__r_.__value_.__s.__data_[0] != 255)
      std::string::operator=((std::string *)__p, &v35.__pn_);
    if (SHIBYTE(v35.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v35.__pn_.__r_.__value_.__l.__data_);
    objc_msgSend(v7, "localeIdentifier");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&v24, (char *)objc_msgSend(v15, "UTF8String"));
    v16 = std::string::insert(&v24, 0, "date_time_");
    v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
    v25.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v17;
    v16->__r_.__value_.__l.__size_ = 0;
    v16->__r_.__value_.__r.__words[2] = 0;
    v16->__r_.__value_.__r.__words[0] = 0;
    v18 = std::string::append(&v25, ".cache");
    v19 = v18->__r_.__value_.__r.__words[0];
    v36[0] = v18->__r_.__value_.__l.__size_;
    *(_QWORD *)((char *)v36 + 7) = *(std::string::size_type *)((char *)&v18->__r_.__value_.__r.__words[1] + 7);
    v20 = HIBYTE(v18->__r_.__value_.__r.__words[2]);
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    *(std::string::size_type *)((char *)&v34.__pn_.__r_.__value_.__r.__words[1] + 7) = *(_QWORD *)((char *)v36 + 7);
    v34.__pn_.__r_.__value_.__r.__words[0] = v19;
    v34.__pn_.__r_.__value_.__l.__size_ = v36[0];
    *((_BYTE *)&v34.__pn_.__r_.__value_.__s + 23) = v20;
    std::__fs::filesystem::operator/[abi:ne180100](&v35.__pn_, (uint64_t)&v32, &v34);
    if (SHIBYTE(v34.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v34.__pn_.__r_.__value_.__l.__data_);
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v25.__r_.__value_.__l.__data_);
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v24.__r_.__value_.__l.__data_);

    std::__fs::filesystem::__status(&v35, 0);
    if (v34.__pn_.__r_.__value_.__s.__data_[0] && v34.__pn_.__r_.__value_.__s.__data_[0] != 255)
      std::string::operator=((std::string *)&v27[1], &v35.__pn_);
    if (SHIBYTE(v35.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v35.__pn_.__r_.__value_.__l.__data_);
    v21 = (uaap::UPDataDetector *)operator new();
    uaap::UPDataDetector::UPDataDetector(v21, (const uaap::UPDataDetectorCacheFiles *)__p, (const __CFLocale *)v7);
    v35.__pn_.__r_.__value_.__r.__words[0] = 0;
    v8->_dataDetector = (UPDataDetector *)v21;
    v22 = (int64x2_t *)operator new();
    uaap::DDUsoMapper::DDUsoMapper(v22);
    v8->_ddUsoMapper = v22;
    if (SHIBYTE(v31[3]) < 0)
      operator delete((void *)v31[1]);
    if (SHIBYTE(v31[0]) < 0)
      operator delete((void *)v30);
    if (SHIBYTE(v29[3]) < 0)
      operator delete(v29[1]);
    if (SHIBYTE(v29[0]) < 0)
      operator delete(v28[0]);
    if (SHIBYTE(v27[3]) < 0)
      operator delete(v27[1]);
    if (SHIBYTE(v27[0]) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v32.__r_.__value_.__l.__data_);
  }

  return v8;
}

- (void)dealloc
{
  UPDataDetector *dataDetector;
  void *ddUsoMapper;
  objc_super v5;
  void **v6;

  dataDetector = self->_dataDetector;
  if (dataDetector)
  {
    uaap::UPDataDetector::~UPDataDetector((uaap::UPDataDetector *)dataDetector);
    MEMORY[0x1C3BB9B44]();
  }
  ddUsoMapper = self->_ddUsoMapper;
  if (ddUsoMapper)
  {
    v6 = (void **)self->_ddUsoMapper;
    std::vector<std::unique_ptr<sirinluexternal::UserDialogAct const>>::__destroy_vector::operator()[abi:ne180100](&v6);
    MEMORY[0x1C3BB9B44](ddUsoMapper, 0x20C40960023A9);
  }
  v5.receiver = self;
  v5.super_class = (Class)UPDataDetectors;
  -[UPDataDetectors dealloc](&v5, sel_dealloc);
}

- (id)matchSpans:(id)a3
{
  id v4;
  UPDataDetectors *v5;
  id v6;
  void *v7;
  uint64_t *v8;
  uint64_t *i;
  uint64_t v10;
  uint64_t *v11;
  void *v12;
  UPDetectedData *v13;
  uint64_t v14;
  UPDetectedData *v15;
  uint64_t *v17;
  uint64_t *v18;
  void *__p[2];
  char v20;
  void **v21;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
  uaap::UPDataDetector::matchSpans((_QWORD *)-[UPDataDetectors dataDetector](v5, "dataDetector"), (const char *)__p, (uint64_t)&v17);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0xCCCCCCCCCCCCCCCDLL * (v18 - v17));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  for (i = v18; v8 != i; v8 += 5)
  {
    if (*((char *)v8 + 23) < 0)
    {
      v11 = (uint64_t *)*v8;
      v10 = v8[1];
    }
    else
    {
      v10 = *((unsigned __int8 *)v8 + 23);
      v11 = v8;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [UPDetectedData alloc];
    v14 = v8[3];
    v8[3] = 0;
    v15 = -[UPDetectedData initWithLabel:dataDetectorResult:](v13, "initWithLabel:dataDetectorResult:", v12, v14);
    objc_msgSend(v7, "addObject:", v15);

  }
  v21 = (void **)&v17;
  std::vector<uaap::UPDataDetectorResult>::__destroy_vector::operator()[abi:ne180100](&v21);
  if (v20 < 0)
    operator delete(__p[0]);
  objc_sync_exit(v5);

  return v7;
}

- (id)matchSpansForUtterance:(id)a3
{
  id v4;
  UPDataDetectors *v5;
  id v6;
  void *v7;
  uint64_t *v8;
  uint64_t *i;
  uint64_t v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  uint64_t *v15;
  uint64_t *v16;
  void *__p[2];
  char v18;
  void **v19;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
  uaap::UPDataDetector::matchSpans((_QWORD *)-[UPDataDetectors dataDetector](v5, "dataDetector"), (const char *)__p, (uint64_t)&v15);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  for (i = v16; v8 != i; v8 += 5)
  {
    if (*((char *)v8 + 23) < 0)
    {
      v11 = (uint64_t *)*v8;
      v10 = v8[1];
    }
    else
    {
      v10 = *((unsigned __int8 *)v8 + 23);
      v11 = v8;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UPDataDetectors _matchSpansForDetectedDataArray:label:](v5, "_matchSpansForDetectedDataArray:label:", v8[3], v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v13);

  }
  v19 = (void **)&v15;
  std::vector<uaap::UPDataDetectorResult>::__destroy_vector::operator()[abi:ne180100](&v19);
  if (v18 < 0)
    operator delete(__p[0]);
  objc_sync_exit(v5);

  return v7;
}

- (id)matchSpansForDetectedData:(id)a3
{
  id v4;
  UPDataDetectors *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = objc_msgSend(v4, "dataDetectorResult");
  objc_msgSend(v4, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UPDataDetectors _matchSpansForDetectedDataArray:label:](v5, "_matchSpansForDetectedDataArray:label:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v8;
}

- (id)_matchSpansForDetectedDataArray:(__CFArray *)a3 label:(id)a4
{
  CFIndex Count;
  CFIndex v6;
  __DDResult *ValueAtIndex;
  uint64_t Range;
  void **v9;
  void **v10;
  uaap::DDUsoMapper **v11;
  uaap::DDUsoMapper **v12;
  UPDataDetectorSpan *v13;
  id v14;
  uaap::DDUsoMapper *v15;
  void *v16;
  id v17;
  UPDataDetectorSpan *v18;
  void **v19;
  void **v20;
  UPDataDetectorSpan *v21;
  CFIndex v23;
  __CFArray *v24;
  id v26;
  id v27;
  void **v28[2];
  char v29;
  id v30;
  uaap::DDUsoMapper **v31;
  uaap::DDUsoMapper **v32;
  uint64_t v33;

  v27 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  Count = CFArrayGetCount(a3);
  if (Count >= 1)
  {
    v6 = 0;
    v23 = Count;
    v24 = a3;
    do
    {
      ValueAtIndex = (__DDResult *)CFArrayGetValueAtIndex(a3, v6);
      Range = DDResultGetRange();
      v10 = v9;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      if (uaap::DDUsoMapper::toItemizedUsos((uint64_t *)self->_ddUsoMapper, ValueAtIndex, &v31))
      {
        v12 = v31;
        v11 = v32;
        if (v31 == v32)
        {
          v21 = 0;
        }
        else
        {
          v13 = 0;
          do
          {
            v14 = objc_alloc(MEMORY[0x1E0DA2DE8]);
            v15 = *v12;
            v30 = 0;
            v16 = (void *)objc_msgSend(v14, "initWithUsoGraph:withError:", v15, &v30);
            v17 = v30;
            if (v16)
            {
              uaap::DDUsoMapper::getSpanRangeFromUtteranceAlignments(*v12, (uint64_t)v28);
              if (v29)
              {
                v18 = [UPDataDetectorSpan alloc];
                v19 = v28[0];
                v20 = v28[1];
              }
              else
              {
                v18 = [UPDataDetectorSpan alloc];
                v19 = (void **)Range;
                v20 = v10;
              }
              v21 = -[UPDataDetectorSpan initWithRange:category:dataDetectorResult:usoGraph:](v18, "initWithRange:category:dataDetectorResult:usoGraph:", v19, v20, v27, ValueAtIndex, v16, v23, v24);

              objc_msgSend(v26, "addObject:", v21);
              v13 = v21;
            }
            else
            {
              v21 = v13;
            }

            ++v12;
          }
          while (v12 != v11);
        }
      }
      else
      {
        v21 = -[UPDataDetectorSpan initWithRange:category:dataDetectorResult:]([UPDataDetectorSpan alloc], "initWithRange:category:dataDetectorResult:", Range, v10, v27, ValueAtIndex);
        objc_msgSend(v26, "addObject:", v21);
      }

      v28[0] = (void **)&v31;
      std::vector<std::unique_ptr<siri::ontology::UsoGraph>>::__destroy_vector::operator()[abi:ne180100](v28);
      ++v6;
      a3 = v24;
    }
    while (v6 != v23);
  }

  return v26;
}

- (UPDataDetector)dataDetector
{
  return self->_dataDetector;
}

- (void)ddUsoMapper
{
  return self->_ddUsoMapper;
}

@end

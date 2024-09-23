@implementation TLTransliterator

- (TLTransliterator)initWithLocale:(id)a3
{
  id v4;
  TLTransliteratorInitParameters *v5;
  TLTransliterator *v6;

  v4 = a3;
  v5 = -[TLTransliteratorInitParameters initWithLocale:]([TLTransliteratorInitParameters alloc], "initWithLocale:", v4);
  v6 = -[TLTransliterator initWithParameters:](self, "initWithParameters:", v5);

  return v6;
}

- (TLTransliterator)initWithParameters:(id)a3
{
  id v4;
  TLTransliterator *v5;
  const __CFLocale *v6;
  const __CFURL *v7;
  char v8;
  char v9;
  TLCompositeTransliterator *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TLTransliterator;
  v5 = -[TLTransliterator init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "locale");
    v6 = (const __CFLocale *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelURL");
    v7 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "useLanguageModel");
    v9 = objc_msgSend(v4, "useSeq2SeqModel");
    v10 = (TLCompositeTransliterator *)operator new();
    TLCompositeTransliterator::TLCompositeTransliterator(v10, v6, v7, v8, v9);
    std::unique_ptr<TLCompositeTransliterator>::reset[abi:ne180100](&v5->_compositeTransliterator.__ptr_.__value_, v10);

  }
  return v5;
}

- (id)generateCandidatesForInputWord:(id)a3 candidateContext:(id)a4 maxCandidatesCount:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v9, "candidates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v9, "candidates", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "transliteratedWord");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  -[TLTransliterator generateCandidatesForInputWord:candidateContextStrings:maxCandidatesCount:](self, "generateCandidatesForInputWord:candidateContextStrings:maxCandidatesCount:", v8, v12, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)generateCandidatesForInputWord:(id)a3 candidateContextStrings:(id)a4 maxCandidatesCount:(int64_t)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  std::vector<std::string>::pointer end;
  __int128 v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  std::string *v15;
  std::string *v16;
  __int128 v17;
  std::string *v18;
  TLCompositeTransliterator *value;
  id v20;
  void *v21;
  std::__split_buffer<std::string>::pointer j;
  std::__split_buffer<std::string>::pointer first;
  void *v24;
  int64_t v26;
  id v28;
  void *__p[2];
  std::string::size_type v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  std::vector<std::string> v35;
  std::__split_buffer<std::string> __v;
  _BYTE v37[128];
  uint64_t v38;

  v26 = a5;
  v38 = *MEMORY[0x24BDAC8D0];
  v28 = a3;
  memset(&v35, 0, sizeof(v35));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v6);
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i)), "UTF8String", v26));
        end = v35.__end_;
        if (v35.__end_ >= v35.__end_cap_.__value_)
        {
          v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)v35.__end_ - (char *)v35.__begin_) >> 3);
          v13 = v12 + 1;
          if (v12 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * (((char *)v35.__end_cap_.__value_ - (char *)v35.__begin_) >> 3) > v13)
            v13 = 0x5555555555555556 * (((char *)v35.__end_cap_.__value_ - (char *)v35.__begin_) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v35.__end_cap_.__value_ - (char *)v35.__begin_) >> 3) >= 0x555555555555555)
            v14 = 0xAAAAAAAAAAAAAAALL;
          else
            v14 = v13;
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v35.__end_cap_;
          if (v14)
            v15 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v35.__end_cap_, v14);
          else
            v15 = 0;
          v16 = v15 + v12;
          __v.__first_ = v15;
          __v.__begin_ = v16;
          __v.__end_cap_.__value_ = &v15[v14];
          v17 = *(_OWORD *)__p;
          v16->__r_.__value_.__r.__words[2] = v30;
          *(_OWORD *)&v16->__r_.__value_.__l.__data_ = v17;
          __p[1] = 0;
          v30 = 0;
          __p[0] = 0;
          __v.__end_ = v16 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v35, &__v);
          v18 = v35.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&__v);
          v35.__end_ = v18;
          if (SHIBYTE(v30) < 0)
            operator delete(__p[0]);
        }
        else
        {
          v11 = *(_OWORD *)__p;
          v35.__end_->__r_.__value_.__r.__words[2] = v30;
          *(_OWORD *)&end->__r_.__value_.__l.__data_ = v11;
          v35.__end_ = end + 1;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v7);
  }

  value = self->_compositeTransliterator.__ptr_.__value_;
  v20 = objc_retainAutorelease(v28);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v20, "UTF8String"));
  TLCompositeTransliterator::getTransliterationCandidates((uint64_t)value, (uint64_t)&v35, (uint64_t)__p, v26, (uint64_t)&__v);
  if (SHIBYTE(v30) < 0)
    operator delete(__p[0]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  first = __v.__first_;
  for (j = __v.__begin_; first != j; first = (std::__split_buffer<std::string>::pointer)((char *)first + 80))
  {
    +[TLTransliteratorCandidate createWithCompositeTransliteratorCandidate:](TLTransliteratorCandidate, "createWithCompositeTransliteratorCandidate:", first);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v24);

  }
  __p[0] = &__v;
  std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v35;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);

  return v21;
}

- (void).cxx_destruct
{
  std::unique_ptr<TLCompositeTransliterator>::reset[abi:ne180100](&self->_compositeTransliterator.__ptr_.__value_, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end

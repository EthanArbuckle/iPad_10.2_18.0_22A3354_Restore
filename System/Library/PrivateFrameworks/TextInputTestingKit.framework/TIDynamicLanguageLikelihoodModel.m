@implementation TIDynamicLanguageLikelihoodModel

- (TIDynamicLanguageLikelihoodModel)init
{
  TIDynamicLanguageLikelihoodModel *v2;
  id v3;
  void *v4;
  uint64_t v5;
  NSLinguisticTagger *linguisticTagger;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)TIDynamicLanguageLikelihoodModel;
  v2 = -[TIDynamicLanguageLikelihoodModel init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDD1638]);
    v9[0] = *MEMORY[0x24BDD0F58];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithTagSchemes:options:", v4, 0);
    linguisticTagger = v2->_linguisticTagger;
    v2->_linguisticTagger = (NSLinguisticTagger *)v5;

  }
  return v2;
}

- (void)addEvidence:(id)a3 timestamp:(double)a4 adaptationType:(int)a5 forRecipient:(id)a6 app:(id)a7 language:(id)a8
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];

  v13 = a3;
  -[TIDynamicLanguageLikelihoodModel linguisticTagger](self, "linguisticTagger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setString:", v13);

  -[TIDynamicLanguageLikelihoodModel linguisticTagger](self, "linguisticTagger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v13, "length");
  v12 = *MEMORY[0x24BDD0F58];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __99__TIDynamicLanguageLikelihoodModel_addEvidence_timestamp_adaptationType_forRecipient_app_language___block_invoke;
  v14[3] = &unk_24FD484F0;
  v14[4] = self;
  objc_msgSend(v10, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v11, v12, 14, v14);

}

- (void)addEvidence:(id)a3 forRecipient:(id)a4 language:(id)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];

  v10 = a3;
  -[TIDynamicLanguageLikelihoodModel linguisticTagger](self, "linguisticTagger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setString:", v10);

  -[TIDynamicLanguageLikelihoodModel linguisticTagger](self, "linguisticTagger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v10, "length");
  v9 = *MEMORY[0x24BDD0F58];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__TIDynamicLanguageLikelihoodModel_addEvidence_forRecipient_language___block_invoke;
  v11[3] = &unk_24FD484F0;
  v11[4] = self;
  objc_msgSend(v7, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v8, v9, 14, v11);

}

- (id)rankedLanguagesForRecipient:(id)a3
{
  id v4;
  void *v5;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> *begin_node;
  uint64_t **p_m_counts_for_language;
  std::string *v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> *v9;
  __int128 v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  std::string *v15;
  std::__split_buffer<std::string>::pointer begin;
  __int128 v17;
  std::__split_buffer<std::string>::pointer end;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  int64x2_t v22;
  std::string *v23;
  TIDynamicLanguageLikelihoodModel *left;
  TIDynamicLanguageLikelihoodModel *v25;
  BOOL v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  _QWORD v35[5];
  __int128 v36;
  std::string *value;
  std::__split_buffer<std::string> v38;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0uLL;
  value = 0;
  p_m_counts_for_language = (uint64_t **)&self->m_counts_for_language;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> *)self->m_counts_for_language.__tree_.__begin_node_;
  if (begin_node == &self->m_counts_for_language.__tree_.__pair1_)
  {
    v8 = 0;
    v27 = 0;
  }
  else
  {
    v8 = 0;
    do
    {
      v9 = begin_node + 4;
      if (v8 >= value)
      {
        v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v8 - v36) >> 3);
        v12 = v11 + 1;
        if (v11 + 1 > 0xAAAAAAAAAAAAAAALL)
          abort();
        if (0x5555555555555556 * ((uint64_t)((uint64_t)value - v36) >> 3) > v12)
          v12 = 0x5555555555555556 * ((uint64_t)((uint64_t)value - v36) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)value - v36) >> 3) >= 0x555555555555555)
          v13 = 0xAAAAAAAAAAAAAAALL;
        else
          v13 = v12;
        v38.__end_cap_.__value_ = (std::allocator<std::string> *)&value;
        if (v13)
        {
          v15 = (std::string *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(v13);
        }
        else
        {
          v15 = 0;
          v14 = 0;
        }
        begin = v15 + v11;
        v38.__first_ = v15;
        v38.__begin_ = begin;
        v38.__end_ = begin;
        v38.__end_cap_.__value_ = &v15[v14];
        if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
        {
          std::string::__init_copy_ctor_external(begin, (const std::string::value_type *)begin_node[4].__value_.__left_, (std::string::size_type)begin_node[5].__value_.__left_);
          begin = v38.__begin_;
          end = v38.__end_;
        }
        else
        {
          v17 = *(_OWORD *)&v9->__value_.__left_;
          begin->__r_.__value_.__r.__words[2] = (std::string::size_type)begin_node[6].__value_.__left_;
          *(_OWORD *)&begin->__r_.__value_.__l.__data_ = v17;
          end = v15 + v11;
        }
        v19 = *((_QWORD *)&v36 + 1);
        v20 = v36;
        if (*((_QWORD *)&v36 + 1) == (_QWORD)v36)
        {
          v22 = vdupq_n_s64(*((unint64_t *)&v36 + 1));
        }
        else
        {
          do
          {
            v21 = *(_OWORD *)(v19 - 24);
            begin[-1].__r_.__value_.__r.__words[2] = *(_QWORD *)(v19 - 8);
            *(_OWORD *)&begin[-1].__r_.__value_.__l.__data_ = v21;
            --begin;
            *(_QWORD *)(v19 - 16) = 0;
            *(_QWORD *)(v19 - 8) = 0;
            *(_QWORD *)(v19 - 24) = 0;
            v19 -= 24;
          }
          while (v19 != v20);
          v22 = (int64x2_t)v36;
        }
        v8 = end + 1;
        *(_QWORD *)&v36 = begin;
        *((_QWORD *)&v36 + 1) = end + 1;
        *(int64x2_t *)&v38.__begin_ = v22;
        v23 = value;
        value = v38.__end_cap_.__value_;
        v38.__end_cap_.__value_ = v23;
        v38.__first_ = (std::__split_buffer<std::string>::pointer)v22.i64[0];
        std::__split_buffer<std::string>::~__split_buffer(&v38);
      }
      else
      {
        if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
        {
          std::string::__init_copy_ctor_external(v8, (const std::string::value_type *)begin_node[4].__value_.__left_, (std::string::size_type)begin_node[5].__value_.__left_);
        }
        else
        {
          v10 = *(_OWORD *)&v9->__value_.__left_;
          v8->__r_.__value_.__r.__words[2] = (std::string::size_type)begin_node[6].__value_.__left_;
          *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v10;
        }
        ++v8;
      }
      *((_QWORD *)&v36 + 1) = v8;
      left = (TIDynamicLanguageLikelihoodModel *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v25 = left;
          left = (TIDynamicLanguageLikelihoodModel *)left->super.isa;
        }
        while (left);
      }
      else
      {
        do
        {
          v25 = (TIDynamicLanguageLikelihoodModel *)begin_node[2].__value_.__left_;
          v26 = v25->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> *)v25;
        }
        while (!v26);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> *)v25;
    }
    while (v25 != (TIDynamicLanguageLikelihoodModel *)&self->m_counts_for_language.__tree_.__pair1_);
    v27 = v36;
  }
  v28 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((uint64_t)v8 - v27) >> 3));
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __64__TIDynamicLanguageLikelihoodModel_rankedLanguagesForRecipient___block_invoke;
  v35[3] = &unk_24FD48200;
  v35[4] = self;
  if (v8 == (std::string *)v27)
    v29 = 0;
  else
    v29 = v28;
  v38.__first_ = (std::__split_buffer<std::string>::pointer)v35;
  std::__introsort<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*,false>(v27, (unint64_t)v8, (uint64_t)&v38, v29, 1);

  v30 = *((_QWORD *)&v36 + 1);
  for (i = v36; i != v30; i += 24)
  {
    if ((uint64_t)std::__tree<std::__value_type<std::string,long>,std::__map_value_compare<std::string,std::__value_type<std::string,long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_m_counts_for_language, (_QWORD *)i, i)[7] >= 5)
    {
      v32 = i;
      if (*(char *)(i + 23) < 0)
        v32 = *(_QWORD *)i;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v33);

    }
  }
  v38.__first_ = (std::__split_buffer<std::string>::pointer)&v36;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v38);

  return v5;
}

- (float)_priorProbabilityForLanguage:(const void *)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> *left;
  float v5;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> *v8;
  char v9;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> **v10;
  int64_t m_total_counts;

  p_pair1 = &self->m_counts_for_language.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> *)self->m_counts_for_language.__tree_.__pair1_.__value_.__left_;
  v5 = 0.0;
  if (left)
  {
    v8 = &self->m_counts_for_language.__tree_.__pair1_;
    do
    {
      v9 = std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(&left[4].__value_.__left_, a3);
      if (v9 >= 0)
        v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> **)left;
      else
        v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> **)&left[1];
      if (v9 >= 0)
        v8 = left;
      left = *v10;
    }
    while (*v10);
    if (v8 != p_pair1
      && (std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(a3, &v8[4].__value_.__left_) & 0x80) == 0)
    {
      m_total_counts = self->m_total_counts;
      if (m_total_counts >= 1)
        return (float)(uint64_t)v8[7].__value_.__left_ / (float)m_total_counts;
    }
  }
  return v5;
}

- (void)priorProbabilityForLanguages:(id)a3 recipient:(id)a4 handler:(id)a5
{
  id v7;
  void (**v8)(id, id, _BYTE *, float);
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  float v14;
  float v15;
  void *__p[2];
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, id, _BYTE *, float))a5;
  v22 = 0;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v11)
        objc_enumerationMutation(v9);
      v13 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12));
      std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v13, "UTF8String"));
      -[TIDynamicLanguageLikelihoodModel _priorProbabilityForLanguage:](self, "_priorProbabilityForLanguage:", __p);
      v15 = v14;
      if (v17 < 0)
        operator delete(__p[0]);
      v8[2](v8, v13, &v22, v15);
      if (v22)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (double)lastOfflineAdaptationTimeForApp:(id)a3
{
  return 0.0;
}

- (unint64_t)emojiUsageCountForApp:(id)a3 lastEmojiCountUpdateTime:(double *)a4
{
  return 0;
}

- (NSLinguisticTagger)linguisticTagger
{
  return self->_linguisticTagger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linguisticTagger, 0);
  std::__tree<std::__value_type<std::string,long>,std::__map_value_compare<std::string,std::__value_type<std::string,long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long>>>::destroy((char *)self->m_counts_for_language.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  return self;
}

BOOL __64__TIDynamicLanguageLikelihoodModel_rankedLanguagesForRecipient___block_invoke(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t *v5;

  v5 = std::__tree<std::__value_type<std::string,long>,std::__map_value_compare<std::string,std::__value_type<std::string,long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)(*(_QWORD *)(a1 + 32) + 8), a2, (uint64_t)a2)[7];
  return (uint64_t)v5 > (uint64_t)std::__tree<std::__value_type<std::string,long>,std::__map_value_compare<std::string,std::__value_type<std::string,long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)(*(_QWORD *)(a1 + 32) + 8), a3, (uint64_t)a3)[7];
}

void __70__TIDynamicLanguageLikelihoodModel_addEvidence_forRecipient_language___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t **v5;
  void *__p[2];
  char v7;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("und")) & 1) == 0)
    {
      std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
      v5 = std::__tree<std::__value_type<std::string,long>,std::__map_value_compare<std::string,std::__value_type<std::string,long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)(*(_QWORD *)(a1 + 32) + 8), __p, (uint64_t)__p);
      v5[7] = (uint64_t *)((char *)v5[7] + 1);
      ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      if (v7 < 0)
        operator delete(__p[0]);
    }
  }

}

void __99__TIDynamicLanguageLikelihoodModel_addEvidence_timestamp_adaptationType_forRecipient_app_language___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t **v5;
  void *__p[2];
  char v7;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("und")) & 1) == 0)
    {
      std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
      v5 = std::__tree<std::__value_type<std::string,long>,std::__map_value_compare<std::string,std::__value_type<std::string,long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)(*(_QWORD *)(a1 + 32) + 8), __p, (uint64_t)__p);
      v5[7] = (uint64_t *)((char *)v5[7] + 1);
      ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      if (v7 < 0)
        operator delete(__p[0]);
    }
  }

}

@end

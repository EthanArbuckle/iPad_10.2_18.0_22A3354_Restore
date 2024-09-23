@implementation CMDPResult

- (CMDPResult)initWithTokenSausage:(__CFArray *)a3 forLocaleIdentifier:(id)a4
{
  id v6;
  CMDPResult *v7;
  CMDPResult *v8;
  _BYTE v10[24];
  objc_super v11;
  void **v12;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CMDPResult;
  v7 = -[CMDPResult init](&v11, sel_init);
  if (v7)
  {
    +[CMDPResult CMDPTokenSausageFromCFTokenSausage:](CMDPResult, "CMDPTokenSausageFromCFTokenSausage:", a3);
    v8 = -[CMDPResult initWithTokenSausageVec:forLocaleIdentifier:](v7, "initWithTokenSausageVec:forLocaleIdentifier:", v10, v6);
    v12 = (void **)v10;
    std::vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>>::__destroy_vector::operator()[abi:ne180100](&v12);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CMDPResult)initWithAFSpeechPhraseArray:(id)a3 forLocaleIdentifier:(id)a4
{
  id v6;
  id v7;
  CMDPResult *v8;
  _BYTE v10[24];
  objc_super v11;
  void **v12;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CMDPResult;
  v8 = -[CMDPResult init](&v11, sel_init);
  if (v8)
  {
    +[CMDPResult CMDPTokenSausageFromAFSpeechPhraseArray:](CMDPResult, "CMDPTokenSausageFromAFSpeechPhraseArray:", v6);
    v8 = -[CMDPResult initWithTokenSausageVec:forLocaleIdentifier:](v8, "initWithTokenSausageVec:forLocaleIdentifier:", v10, v7);
    v12 = (void **)v10;
    std::vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>>::__destroy_vector::operator()[abi:ne180100](&v12);

  }
  return v8;
}

- (CMDPResult)initWithTokenSausageVec:(void *)a3 forLocaleIdentifier:(id)a4
{
  __CFString *v6;
  CMDPResult *v7;
  const __CFAllocator *v8;
  const __CFLocale *v9;
  CMDPNormalizer *v10;
  CFLocaleRef *value;
  CMDPResult *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v19;
  objc_super v20;
  _QWORD v21[3];
  _QWORD *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a4;
  v20.receiver = self;
  v20.super_class = (Class)CMDPResult;
  v7 = -[CMDPResult init](&v20, sel_init);
  if (v7)
  {
    v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (v6)
      v9 = CFLocaleCreate(v8, v6);
    else
      v9 = CFLocaleCreate(v8, CFSTR("en_US"));
    v10 = (CMDPNormalizer *)operator new();
    CMDPNormalizer::CMDPNormalizer(v10, v9);
    std::unique_ptr<CMDPNormalizer>::reset[abi:ne180100](&v7->_normalizer.__ptr_.__value_, v10);
    CFRelease(v9);
    MEMORY[0x22E2FAF74](v9);
    LOBYTE(v10) = RXIsLocaleWithNoSpaceInPostITN();
    value = (CFLocaleRef *)v7->_normalizer.__ptr_.__value_;
    v12 = v7;
    v21[0] = &off_24F652BA0;
    v21[1] = v12;
    v22 = v21;
    cmdp_sausage_util::fstFromSausage((uint64_t *)a3, value, (uint64_t **)&v12->_symbol_set, (uint64_t)v21, (char)v10, &v19);
    v13 = v19;
    v19 = 0;
    v14 = v12->_resultFst.__ptr_.__value_;
    v12->_resultFst.__ptr_.__value_ = v13;
    if (v14)
    {
      (*(void (**)(void *))(*(_QWORD *)v14 + 8))(v14);
      v15 = v19;
      v19 = 0;
      if (v15)
        (*(void (**)(void *))(*(_QWORD *)v15 + 8))(v15);
    }
    v16 = v22;
    if (v22 == v21)
    {
      v17 = 4;
      v16 = v21;
      goto LABEL_12;
    }
    if (v22)
    {
      v17 = 5;
LABEL_12:
      (*(void (**)(void))(*v16 + 8 * v17))();
    }
  }

  return v7;
}

- (id)matchWithGrammars:(id)a3 winningIndex:(int *)a4 winningDistance:(float *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  BOOL isEmpty;
  uint64_t v16;
  float v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23[3];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void **v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  *a4 = -1;
  *a5 = 3.4028e38;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (!v10)
  {

LABEL_21:
    v21 = 0;
    goto LABEL_24;
  }
  v11 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v25;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v25 != v13)
        objc_enumerationMutation(v9);
      cmdp_fst_util::compose((uint64_t)self->_resultFst.__ptr_.__value_, objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "grammarFst"), 1, v23);
      isEmpty = cmdp_fst_util::isEmpty(v23[0]);
      v16 = v23[0];
      if (!isEmpty)
      {
        v17 = cmdp_fst_util::shortestDistance(v23[0]);
        v18 = v23[0];
        if (v17 >= *a5)
        {
          v16 = v23[0];
        }
        else
        {
          *a5 = v17;
          v23[0] = 0;
          if (v11)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
            v16 = v23[0];
          }
          else
          {
            v16 = 0;
          }
          *a4 = v12 + i;
          v11 = v18;
        }
      }
      v23[0] = 0;
      if (v16)
        (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
    }
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    v12 += i;
  }
  while (v10);

  if (!v11)
    goto LABEL_21;
  if (*a4 == -1)
  {
    v21 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndex:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "grammarData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    cmdp_fst_util::shortestPath(v11, 3, v23);
    -[CMDPResult createArrayFromNBestResults:withGrammarData:](self, "createArrayFromNBestResults:withGrammarData:", v23, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void **)v23;
    std::vector<std::vector<std::pair<std::string,std::string>>>::__destroy_vector::operator()[abi:ne180100](&v28);

  }
  (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
LABEL_24:

  return v21;
}

- (id)createArrayFromNBestResults:(const void *)a3 withGrammarData:(id)a4
{
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  _QWORD *v13;
  const void *v14;
  char *v15;
  void *v16;
  BOOL v17;
  void *v18;
  const char *v19;
  size_t v20;
  _QWORD *v21;
  __int128 *v22;
  uint64_t v23;
  size_t v24;
  const char *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  __int128 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  std::string *p_buf;
  __CFString **v38;
  __int128 *v40;
  char v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  char v49;
  _BYTE v50[15];
  std::string buf;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v46 = a4;
  v43 = (id)objc_opt_new();
  v45 = (void *)objc_opt_new();
  v5 = *(uint64_t **)a3;
  if (*((_QWORD *)a3 + 1) == *(_QWORD *)a3)
    std::vector<std::vector<std::pair<std::string,std::string>>>::__throw_out_of_range[abi:ne180100]();
  v44 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v6 = *v5;
  if (v5[1] == *v5)
    goto LABEL_79;
  v7 = 0;
  v8 = 0;
  v42 = 0;
  v9 = MEMORY[0x24BDACB70];
  do
  {
    v10 = 48 * v7 + 95;
    while (1)
    {
      v11 = v6 + v10;
      v12 = strlen("<eps>");
      if (*(char *)(v6 + v10 - 48) < 0)
        break;
      if (v12 != *(unsigned __int8 *)(v6 + v10 - 48))
      {
        v14 = (const void *)(v6 + v10 - 71);
        goto LABEL_20;
      }
      if (v12 == -1)
        goto LABEL_81;
      if (memcmp((const void *)(v6 + v10 - 71), "<eps>", v12))
      {
        v14 = (const void *)(v6 + 48 * v7 + 24);
LABEL_20:
        v15 = (char *)(v6 + v10 - 48);
        goto LABEL_21;
      }
LABEL_13:
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (_QWORD *)(v11 - 95);
        if (*(char *)(v6 + v10 - 72) < 0)
          v13 = (_QWORD *)*v13;
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v13;
        _os_log_impl(&dword_22BD8C000, v9, OS_LOG_TYPE_DEFAULT, "Deleting Added Word %s", (uint8_t *)&buf, 0xCu);
      }
      ++v7;
      v6 = *v5;
      v10 += 48;
      v8 = 1;
      if (0xAAAAAAAAAAAAAAABLL * ((v5[1] - *v5) >> 4) <= v7)
        goto LABEL_78;
    }
    if (v12 == *(_QWORD *)(v11 - 63))
    {
      if (v12 == -1)
LABEL_81:
        std::string::__throw_out_of_range[abi:ne180100]();
      v14 = *(const void **)(v6 + v10 - 71);
      if (memcmp(v14, "<eps>", v12))
        goto LABEL_20;
      goto LABEL_13;
    }
    v15 = (char *)(v6 + v10 - 48);
    v14 = *(const void **)(v6 + v10 - 71);
LABEL_21:
    objc_msgSend(v46, "objectAtIndex:", atoi((const char *)v14));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v42 & 1) != 0)
    {
LABEL_24:
      v42 = 1;
    }
    else
    {
      objc_msgSend(v48, "commandIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16 == 0;

      if (!v17)
      {
        objc_msgSend(v48, "commandIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setObject:forKey:", v18, kCMDPMatchedCommandIdentifier[0]);

        goto LABEL_24;
      }
      v42 = 0;
    }
    v19 = (const char *)(v6 + v10 - 95);
    v20 = strlen("<eps>");
    if ((*(char *)(v6 + v10 - 72) & 0x80000000) == 0)
    {
      if (v20 == *(unsigned __int8 *)(v6 + v10 - 72))
      {
        if (v20 == -1)
LABEL_83:
          std::string::__throw_out_of_range[abi:ne180100]();
        goto LABEL_32;
      }
      goto LABEL_39;
    }
    if (v20 != *(_QWORD *)(v6 + v10 - 87))
    {
      v19 = *(const char **)v19;
      goto LABEL_39;
    }
    if (v20 == -1)
      goto LABEL_83;
    v19 = *(const char **)v19;
LABEL_32:
    if (!memcmp(v19, "<eps>", v20))
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (_QWORD *)(v6 + v10 - 71);
        if (*v15 < 0)
          v21 = (_QWORD *)*v21;
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v21;
        _os_log_impl(&dword_22BD8C000, v9, OS_LOG_TYPE_DEFAULT, "Adding Deleted Word %s", (uint8_t *)&buf, 0xCu);
        v22 = 0;
        v8 = 1;
      }
      else
      {
        v22 = 0;
        v8 = 1;
      }
    }
    else
    {
LABEL_39:
      v22 = (__int128 *)*((_QWORD *)self->_resultNodes.__begin_ + atoi(v19));
    }
    objc_msgSend(v48, "builtInLMIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    ++v7;
    v23 = *v5;
    if (0xAAAAAAAAAAAAAAABLL * ((v5[1] - *v5) >> 4) <= v7)
    {
      v26 = 0;
    }
    else
    {
      v40 = v22;
      v24 = strlen("<eps>");
      v25 = (const char *)(v23 + v10 - 23);
      if ((*(char *)(v23 + v10) & 0x80000000) == 0)
      {
        if (v24 == *(unsigned __int8 *)(v23 + v10))
        {
          if (v24 == -1)
LABEL_84:
            std::string::__throw_out_of_range[abi:ne180100]();
          goto LABEL_50;
        }
        goto LABEL_54;
      }
      if (v24 != *(_QWORD *)(v23 + v10 - 15))
      {
        v25 = *(const char **)v25;
        goto LABEL_54;
      }
      if (v24 == -1)
        goto LABEL_84;
      v25 = *(const char **)v25;
LABEL_50:
      if (!memcmp(v25, "<eps>", v24))
      {
        v26 = 0;
        v22 = v40;
      }
      else
      {
LABEL_54:
        objc_msgSend(v46, "objectAtIndex:", atoi(v25));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "builtInLMIdentifier");
        v22 = v40;
        v26 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(v48, "word");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28 == 0;

    if (!v29)
    {
      objc_msgSend(v48, "word");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    }
    if (v22)
    {
      v31 = (void *)MEMORY[0x24BDD17C8];
      if (*((char *)v22 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&buf, *(const std::string::value_type **)v22, *((_QWORD *)v22 + 1));
      }
      else
      {
        v32 = *v22;
        buf.__r_.__value_.__r.__words[2] = *((_QWORD *)v22 + 2);
        *(_OWORD *)&buf.__r_.__value_.__l.__data_ = v32;
      }
      if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_buf = &buf;
      else
        p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
      objc_msgSend(v31, "stringWithUTF8String:", p_buf);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf.__r_.__value_.__l.__data_);
LABEL_57:
      if (v47)
      {
        objc_msgSend(v44, "appendString:", v30);
        if (v26 && v47 == v26)
        {
          objc_msgSend(v44, "appendString:", CFSTR(" "));
        }
        else
        {
          v34 = (void *)MEMORY[0x24BDBCE70];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v44);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "dictionaryWithObjectsAndKeys:", v35, kCMDPMatchedElementText[0], v47, kCMDPMatchedElementCategoryIdentifier, 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v45, "addObject:", v36);
          objc_msgSend(v44, "setString:", &stru_24F657348);

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v30, kCMDPMatchedElementText[0], 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addObject:", v33);

      }
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CMDPResult createArrayFromNBestResults:withGrammarData:].cold.1(&v49, v50);
      v30 = 0;
    }

    v6 = *v5;
  }
  while (0xAAAAAAAAAAAAAAABLL * ((v5[1] - *v5) >> 4) > v7);
  if ((v8 & 1) == 0)
  {
LABEL_79:
    v38 = kCMDPMatchedElements;
    goto LABEL_80;
  }
LABEL_78:
  v38 = kCMDPClosestMatchedElements;
LABEL_80:
  objc_msgSend(v43, "setObject:forKey:", v45, *v38);

  return v43;
}

+ (vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>,)CMDPTokenSausageFromCFTokenSausage:(id)a2
{
  __CFArray *v4;
  CFIndex v5;
  NSObject *v6;
  vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>, std::allocator<std::vector<std::vector<std::unique_ptr<CMDPToken>>>>> *result;
  const __CFArray *ValueAtIndex;
  CFIndex i;
  const __CFArray *v10;
  CFIndex v11;
  const void *v12;
  const __CFString *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int HasSpaceAfter;
  std::string *v19;
  std::string **v20;
  std::string **v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  std::string **v26;
  uint64_t v27;
  CFIndex v30;
  char v31;
  char v32[15];
  std::string *v33;
  std::string __p;
  uint64_t v35;
  std::string **v36;
  unint64_t v37;
  uint64_t v38[3];
  std::string v39;
  char *v40;
  unint64_t *v41;

  v4 = a4;
  v5 = 0;
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  v6 = MEMORY[0x24BDACB70];
  while (1)
  {
    result = (vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>, std::allocator<std::vector<std::vector<std::unique_ptr<CMDPToken>>>>> *)CFArrayGetCount(v4);
    if ((uint64_t)result <= v5)
      break;
    memset(v38, 0, sizeof(v38));
    v30 = v5;
    ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(v4, v5);
    for (i = 0; i < CFArrayGetCount(ValueAtIndex); ++i)
    {
      v10 = (const __CFArray *)CFArrayGetValueAtIndex(ValueAtIndex, i);
      v11 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      while (v11 < CFArrayGetCount(v10))
      {
        v12 = CFArrayGetValueAtIndex(v10, v11);
        v13 = (const __CFString *)MEMORY[0x22E2FB0AC]();
        cmdp_string::CreateCppStringFromCFString(v13, 0, &__p);
        v14 = MEMORY[0x22E2FB0A0](v12);
        v15 = MEMORY[0x22E2FB088](v12);
        v16 = MEMORY[0x22E2FB094](v12);
        v17 = MEMORY[0x22E2FB07C](v12);
        HasSpaceAfter = EARCSpeechRecognitionTokenHasSpaceAfter();
        v19 = (std::string *)operator new();
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&v39, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        else
          v39 = __p;
        CMDPToken::CMDPToken(v19, (__int128 *)&v39, HasSpaceAfter != 0, 1, v14, v15, v16, v17);
        v33 = v19;
        if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0
          && (operator delete(v39.__r_.__value_.__l.__data_), (v19 = v33) == 0))
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            +[CMDPResult CMDPTokenSausageFromCFTokenSausage:].cold.1(&v31, v32);
        }
        else
        {
          v20 = v36;
          if ((unint64_t)v36 >= v37)
          {
            v22 = ((uint64_t)v36 - v35) >> 3;
            if ((unint64_t)(v22 + 1) >> 61)
              std::vector<std::pair<std::string,std::unique_ptr<fst::VectorFst<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>>>::__throw_length_error[abi:ne180100]();
            v23 = (uint64_t)(v37 - v35) >> 2;
            if (v23 <= v22 + 1)
              v23 = v22 + 1;
            if (v37 - v35 >= 0x7FFFFFFFFFFFFFF8)
              v24 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v24 = v23;
            v41 = &v37;
            if (v24)
            {
              v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<CMDPToken>>>((uint64_t)&v37, v24);
              v19 = v33;
            }
            else
            {
              v25 = 0;
            }
            v26 = (std::string **)&v25[8 * v22];
            v39.__r_.__value_.__r.__words[0] = (std::string::size_type)v25;
            v39.__r_.__value_.__l.__size_ = (std::string::size_type)v26;
            v40 = &v25[8 * v24];
            v33 = 0;
            *v26 = v19;
            v39.__r_.__value_.__r.__words[2] = (std::string::size_type)(v26 + 1);
            std::vector<std::unique_ptr<CMDPToken>>::__swap_out_circular_buffer(&v35, &v39);
            v21 = v36;
            std::__split_buffer<std::unique_ptr<CMDPToken>>::~__split_buffer((uint64_t)&v39);
          }
          else
          {
            v33 = 0;
            *v36 = v19;
            v21 = v20 + 1;
          }
          v36 = v21;
        }
        v27 = (uint64_t)v33;
        v33 = 0;
        if (v27)
          std::default_delete<CMDPToken>::operator()[abi:ne180100]((uint64_t)&v33, v27);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        ++v11;
      }
      std::vector<std::vector<std::unique_ptr<CMDPToken>>>::push_back[abi:ne180100](v38, (uint64_t)&v35);
      v39.__r_.__value_.__r.__words[0] = (std::string::size_type)&v35;
      std::vector<std::unique_ptr<CMDPToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v39);
    }
    std::vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>>::push_back[abi:ne180100]((uint64_t *)retstr, (uint64_t)v38);
    v39.__r_.__value_.__r.__words[0] = (std::string::size_type)v38;
    std::vector<std::vector<std::unique_ptr<CMDPToken>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v39);
    v5 = v30 + 1;
    v4 = a4;
  }
  return result;
}

+ (vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>,)CMDPTokenSausageFromAFSpeechPhraseArray:(id)a2
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  id v14;
  id v15;
  char *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  char v24;
  char v25;
  std::string *v26;
  std::string *v27;
  std::string **v28;
  std::string **v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>, std::allocator<std::vector<std::vector<std::unique_ptr<CMDPToken>>>>> *result;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  id obj;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t i;
  id v47;
  char v48;
  char v49[15];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  std::string **v55;
  unint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61[3];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 __p;
  _QWORD *v67;
  char *v68;
  unint64_t *v69;
  std::string *v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  v38 = (uint64_t *)retstr;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
  if (v6)
  {
    v39 = *(_QWORD *)v63;
    do
    {
      v41 = 0;
      v37 = v6;
      do
      {
        if (*(_QWORD *)v63 != v39)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v41);
        memset(v61, 0, sizeof(v61));
        objc_msgSend(v7, "interpretations");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v42 = v8;
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
        if (v44)
        {
          v43 = *(_QWORD *)v58;
          do
          {
            for (i = 0; i != v44; ++i)
            {
              if (*(_QWORD *)v58 != v43)
                objc_enumerationMutation(v42);
              v9 = *(id *)(*((_QWORD *)&v57 + 1) + 8 * i);
              v54 = 0;
              v55 = 0;
              v56 = 0;
              v45 = v9;
              objc_msgSend(v9, "tokens");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = 0u;
              v53 = 0u;
              v50 = 0u;
              v51 = 0u;
              v47 = v10;
              v11 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v50, v71, 16);
              if (v11)
              {
                v12 = *(_QWORD *)v51;
                do
                {
                  for (j = 0; j != v11; ++j)
                  {
                    if (*(_QWORD *)v51 != v12)
                      objc_enumerationMutation(v47);
                    v14 = *(id *)(*((_QWORD *)&v50 + 1) + 8 * j);
                    objc_msgSend(v14, "text");
                    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                    v16 = (char *)objc_msgSend(v15, "UTF8String");
                    objc_msgSend(v14, "startTime");
                    v18 = v17;
                    objc_msgSend(v14, "endTime");
                    v20 = v19;
                    objc_msgSend(v14, "silenceStartTime");
                    v22 = v21;
                    v23 = objc_msgSend(v14, "confidenceScore");
                    v24 = objc_msgSend(v14, "removeSpaceAfter");
                    v25 = objc_msgSend(v14, "removeSpaceBefore");
                    v26 = (std::string *)operator new();
                    std::string::basic_string[abi:ne180100]<0>(&__p, v16);
                    CMDPToken::CMDPToken(v26, &__p, v24 ^ 1, v25 ^ 1, v18, v20, v22, (double)v23);
                    v70 = v26;
                    if (SHIBYTE(v67) < 0)
                      operator delete((void *)__p);

                    v27 = v70;
                    if (v70)
                    {
                      v28 = v55;
                      if ((unint64_t)v55 >= v56)
                      {
                        v30 = ((uint64_t)v55 - v54) >> 3;
                        if ((unint64_t)(v30 + 1) >> 61)
                          std::vector<std::pair<std::string,std::unique_ptr<fst::VectorFst<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>>>::__throw_length_error[abi:ne180100]();
                        v31 = (uint64_t)(v56 - v54) >> 2;
                        if (v31 <= v30 + 1)
                          v31 = v30 + 1;
                        if (v56 - v54 >= 0x7FFFFFFFFFFFFFF8)
                          v32 = 0x1FFFFFFFFFFFFFFFLL;
                        else
                          v32 = v31;
                        v69 = &v56;
                        if (v32)
                        {
                          v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<CMDPToken>>>((uint64_t)&v56, v32);
                          v27 = v70;
                        }
                        else
                        {
                          v33 = 0;
                        }
                        v34 = &v33[8 * v30];
                        *(_QWORD *)&__p = v33;
                        *((_QWORD *)&__p + 1) = v34;
                        v68 = &v33[8 * v32];
                        v70 = 0;
                        *(_QWORD *)v34 = v27;
                        v67 = v34 + 8;
                        std::vector<std::unique_ptr<CMDPToken>>::__swap_out_circular_buffer(&v54, &__p);
                        v29 = v55;
                        std::__split_buffer<std::unique_ptr<CMDPToken>>::~__split_buffer((uint64_t)&__p);
                      }
                      else
                      {
                        v70 = 0;
                        *v55 = v27;
                        v29 = v28 + 1;
                      }
                      v55 = v29;
                    }
                    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                    {
                      +[CMDPResult CMDPTokenSausageFromCFTokenSausage:].cold.1(&v48, v49);
                    }
                    v35 = (uint64_t)v70;
                    v70 = 0;
                    if (v35)
                      std::default_delete<CMDPToken>::operator()[abi:ne180100]((uint64_t)&v70, v35);

                  }
                  v11 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v50, v71, 16);
                }
                while (v11);
              }

              std::vector<std::vector<std::unique_ptr<CMDPToken>>>::push_back[abi:ne180100](v61, (uint64_t)&v54);
              *(_QWORD *)&__p = &v54;
              std::vector<std::unique_ptr<CMDPToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

            }
            v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
          }
          while (v44);
        }

        std::vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>>::push_back[abi:ne180100](v38, (uint64_t)v61);
        *(_QWORD *)&__p = v61;
        std::vector<std::vector<std::unique_ptr<CMDPToken>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
        ++v41;
      }
      while (v41 != v37);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
    }
    while (v6);
  }

  return result;
}

- (void).cxx_destruct
{
  void *value;
  vector<std::unique_ptr<CMDPToken>, std::allocator<std::unique_ptr<CMDPToken>>> *p_resultNodes;

  std::__tree<std::string>::destroy((uint64_t)&self->_symbol_set, (char *)self->_symbol_set.__tree_.__pair1_.__value_.__left_);
  p_resultNodes = &self->_resultNodes;
  std::vector<std::unique_ptr<CMDPToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_resultNodes);
  std::unique_ptr<CMDPNormalizer>::reset[abi:ne180100](&self->_normalizer.__ptr_.__value_, 0);
  value = self->_resultFst.__ptr_.__value_;
  self->_resultFst.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 7) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = (char *)self + 56;
  return self;
}

- (uint64_t)initWithTokenSausageVec:forLocaleIdentifier:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)initWithTokenSausageVec:forLocaleIdentifier:
{
}

- (_QWORD)initWithTokenSausageVec:forLocaleIdentifier:
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_24F652BA0;
  v2[1] = *(id *)(a1 + 8);
  return v2;
}

- (id)initWithTokenSausageVec:forLocaleIdentifier:
{
  id result;

  *a2 = &off_24F652BA0;
  result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

- (void)createArrayFromNBestResults:(_BYTE *)a1 withGrammarData:(_BYTE *)a2 .cold.1(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_0(&dword_22BD8C000, MEMORY[0x24BDACB70], v2, "Null RESULT received", v3);
}

+ (void)CMDPTokenSausageFromCFTokenSausage:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_0(&dword_22BD8C000, MEMORY[0x24BDACB70], v2, "Null token received", v3);
}

@end

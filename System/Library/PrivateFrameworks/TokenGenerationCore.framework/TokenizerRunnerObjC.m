@implementation TokenizerRunnerObjC

- (TokenizerRunnerObjC)initWithTokenizerPath:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  os_log_t v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  size_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  TokenizerRunnerObjC *v26;
  uint64_t v28;
  objc_super v29;
  uint64_t v30;
  void *v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)TokenizerRunnerObjC;
  v7 = -[TokenizerRunnerObjC init](&v29, sel_init);
  if (!v7)
    goto LABEL_13;
  v8 = os_log_create("com.apple.tokengenerationinference", "E5LanguageModel");
  v9 = (void *)*((_QWORD *)v7 + 16);
  *((_QWORD *)v7 + 16) = v8;

  v10 = *((_QWORD *)v7 + 16);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v33 = v6;
    _os_log_impl(&dword_248BE5000, v10, OS_LOG_TYPE_DEFAULT, "Initializing tokenizer with path: %{public}@", buf, 0xCu);
  }
  v11 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  v12 = strlen(v11);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, const char *, size_t))(*((_QWORD *)v7 + 1) + 16))(&v28, (uint64_t)v7 + 8, v11, v12);
  if (!v28)
  {
    sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v28);
LABEL_13:
    v26 = (TokenizerRunnerObjC *)v7;
    goto LABEL_14;
  }
  v13 = *((id *)v7 + 16);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = sentencepiece::util::Status::error_message((sentencepiece::util::Status *)&v28);
    -[TokenizerRunnerObjC initWithTokenizerPath:error:].cold.2((uint64_t)v14, (uint64_t)buf, v13);
  }

  v15 = *((_QWORD *)v7 + 16);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[TokenizerRunnerObjC initWithTokenizerPath:error:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
  if (a4)
  {
    v23 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to load tokenizer."));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("TokenGeneration"), 2, v25);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v28);
  v26 = 0;
LABEL_14:

  return v26;
}

- (id)vocabulary
{
  void *v3;
  uint64_t v4;
  SentencePieceProcessor *p_processor;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  const void *v10;
  void *v11;
  void **v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  void *v17;
  void *__dst[2];
  int64_t v20;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  p_processor = &self->_processor;
  v6 = 0x24BDD1000uLL;
  while ((int)v4 < (*((int (**)(SentencePieceProcessor *))p_processor->_vptr$SentencePieceProcessor + 62))(p_processor))
  {
    v7 = (*((uint64_t (**)(SentencePieceProcessor *, uint64_t))p_processor->_vptr$SentencePieceProcessor + 64))(p_processor, v4);
    v9 = (void *)v8;
    if (v8 >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v10 = (const void *)v7;
    v11 = *(void **)(v6 + 1992);
    if (v8 >= 0x17)
    {
      v13 = v6;
      v14 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v8 | 7) != 0x17)
        v14 = v8 | 7;
      v15 = v14 + 1;
      v12 = (void **)operator new(v14 + 1);
      __dst[1] = v9;
      v20 = v15 | 0x8000000000000000;
      __dst[0] = v12;
      v6 = v13;
LABEL_10:
      memmove(v12, v10, (size_t)v9);
      goto LABEL_11;
    }
    HIBYTE(v20) = v8;
    v12 = __dst;
    if (v8)
      goto LABEL_10;
LABEL_11:
    *((_BYTE *)v9 + (_QWORD)v12) = 0;
    if (v20 >= 0)
      v16 = __dst;
    else
      v16 = (void **)__dst[0];
    objc_msgSend(v11, "stringWithUTF8String:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(v20) < 0)
      operator delete(__dst[0]);
    objc_msgSend(v3, "addObject:", v17);

    v4 = (v4 + 1);
  }
  return v3;
}

- (int64_t)longestTokenLength
{
  SentencePieceProcessor *p_processor;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  p_processor = &self->_processor;
  if ((*((int (**)(SentencePieceProcessor *, SEL))self->_processor._vptr$SentencePieceProcessor + 62))(&self->_processor, a2) < 1)return 0;
  v3 = 0;
  v4 = 0;
  do
  {
    (*((void (**)(SentencePieceProcessor *, uint64_t))p_processor->_vptr$SentencePieceProcessor + 64))(p_processor, v4);
    if (v3 <= v5)
      v3 = v5;
    v4 = (v4 + 1);
  }
  while ((int)v4 < (*((int (**)(SentencePieceProcessor *))p_processor->_vptr$SentencePieceProcessor + 62))(p_processor));
  return v3;
}

- (int64_t)vocabularyCount
{
  return (*((int (**)(SentencePieceProcessor *, SEL))self->_processor._vptr$SentencePieceProcessor + 62))(&self->_processor, a2);
}

- (id)tokenize:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  size_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  unsigned int *v21;
  unint64_t v22;
  void *v23;
  uint64_t v25;
  void *__p;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  __p = 0;
  v27 = 0;
  v28 = 0;
  v6 = objc_retainAutorelease(a3);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");
  v8 = strlen(v7);
  (*((void (**)(uint64_t *__return_ptr, SentencePieceProcessor *, const char *, size_t, void **))self->_processor._vptr$SentencePieceProcessor
   + 18))(&v25, &self->_processor, v7, v8, &__p);
  if (v25)
  {
    v9 = *(NSObject **)&self->_processor.mmappable_data_.__r_.var0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[TokenizerRunnerObjC tokenize:error:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    if (a4)
    {
      v17 = (void *)MEMORY[0x24BDD1540];
      v29 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to tokenize text."));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("TokenGeneration"), 3, v19);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else
  {
    v20 = objc_alloc(MEMORY[0x24BDBCEB8]);
    a4 = (id *)objc_msgSend(v20, "initWithCapacity:", (v27 - (_BYTE *)__p) >> 2);
    v21 = (unsigned int *)__p;
    if (v27 != __p)
    {
      v22 = 0;
      do
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v21[v22]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a4, "setObject:atIndexedSubscript:", v23, v22);

        ++v22;
        v21 = (unsigned int *)__p;
      }
      while (v22 < (v27 - (_BYTE *)__p) >> 2);
    }
  }
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v25);
  if (__p)
  {
    v27 = __p;
    operator delete(__p);
  }

  return a4;
}

- (id)detokenize:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t v20;
  void *__p[2];
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  std::vector<int> v27;
  uint64_t v28;
  void *v29;
  _BYTE v30[24];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  memset(&v27, 0, sizeof(v27));
  std::vector<int>::resize(&v27, objc_msgSend(v6, "count"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "intValue");
        v27.__begin_[v9++] = v12;
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v8);
  }

  __p[0] = 0;
  __p[1] = 0;
  v22 = 0;
  (*((void (**)(uint64_t *__return_ptr, SentencePieceProcessor *, std::vector<int> *, void **))self->_processor._vptr$SentencePieceProcessor
   + 21))(&v20, &self->_processor, &v27, __p);
  if (v20)
  {
    v13 = *(id *)&self->_processor.mmappable_data_.__r_.var0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = sentencepiece::util::Status::error_message((sentencepiece::util::Status *)&v20);
      -[TokenizerRunnerObjC detokenize:error:].cold.1((uint64_t)v14, (uint64_t)v30, v13);
    }

    if (a4)
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      v28 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to detokenize tokens: %{public}s"), sentencepiece::util::Status::error_message((sentencepiece::util::Status *)&v20));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("TokenGeneration"), 3, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else
  {
    if (v22 >= 0)
      v18 = __p;
    else
      v18 = (void **)__p[0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v18);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v20);
  if (SHIBYTE(v22) < 0)
    operator delete(__p[0]);
  if (v27.__begin_)
  {
    v27.__end_ = v27.__begin_;
    operator delete(v27.__begin_);
  }

  return a4;
}

- (id)textForTokenID:(int64_t)a3
{
  uint64_t v3;
  unint64_t v4;
  const void *v5;
  void *v6;
  void **v7;
  uint64_t v8;
  uint64_t v9;
  void **v10;
  void *v11;
  void *__dst[2];
  int64_t v14;

  v3 = (*((uint64_t (**)(SentencePieceProcessor *, int64_t))self->_processor._vptr$SentencePieceProcessor
        + 64))(&self->_processor, a3);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = (const void *)v3;
  v6 = (void *)v4;
  if (v4 >= 0x17)
  {
    v8 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v8 = v4 | 7;
    v9 = v8 + 1;
    v7 = (void **)operator new(v8 + 1);
    __dst[1] = v6;
    v14 = v9 | 0x8000000000000000;
    __dst[0] = v7;
    goto LABEL_8;
  }
  HIBYTE(v14) = v4;
  v7 = __dst;
  if (v4)
LABEL_8:
    memmove(v7, v5, (size_t)v6);
  *((_BYTE *)v6 + (_QWORD)v7) = 0;
  if (v14 >= 0)
    v10 = __dst;
  else
    v10 = (void **)__dst[0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v14) < 0)
    operator delete(__dst[0]);
  return v11;
}

- (int64_t)tokenIDForText:(id)a3
{
  id v4;
  const char *v5;
  size_t v6;
  int64_t v7;

  v4 = objc_retainAutorelease(a3);
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  v6 = strlen(v5);
  v7 = (*((int (**)(SentencePieceProcessor *, const char *, size_t))self->_processor._vptr$SentencePieceProcessor
        + 63))(&self->_processor, v5, v6);

  return v7;
}

- (BOOL)isByte:(int64_t)a3
{
  return (*((uint64_t (**)(SentencePieceProcessor *, int64_t))self->_processor._vptr$SentencePieceProcessor
          + 69))(&self->_processor, a3);
}

- (void)prefixMatchesForText:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void **);
  id v8;
  SentencePieceProcessor *p_processor;
  void **v10;
  const char *v11;
  size_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  size_t v18;
  char *v20;
  char *v21;
  BOOL v22;
  void *__p[2];
  char v24;
  uint64_t v25;
  void *v26;
  char *v27;
  uint64_t v28;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void **))a4;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v8 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v8, "UTF8String"));
  v10 = self->_processor._vptr$SentencePieceProcessor;
  p_processor = &self->_processor;
  ((void (*)(uint64_t *__return_ptr, SentencePieceProcessor *, void **, uint64_t, void **))v10[75])(&v25, p_processor, __p, 0xFFFFFFFFLL, &v26);
  if (v24 < 0)
    operator delete(__p[0]);
  if (v25)
  {
    v11 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    v12 = strlen(v11);
    v13 = 0;
    LOBYTE(__p[0]) = 0;
    while (v13 < (*((int (**)(SentencePieceProcessor *))p_processor->_vptr$SentencePieceProcessor + 62))(p_processor))
    {
      v14 = (unsigned __int8 *)(*((uint64_t (**)(SentencePieceProcessor *, uint64_t))p_processor->_vptr$SentencePieceProcessor
                                + 64))(p_processor, v13);
      v16 = v11;
      if (v12)
      {
        v16 = v11;
        if (v15)
        {
          v17 = v15 - 1;
          v18 = v12 - 1;
          v16 = v11;
          do
          {
            if (*(unsigned __int8 *)v16 != *v14)
              break;
            ++v16;
            if (!v18)
              break;
            ++v14;
            --v18;
          }
          while (v17--);
        }
      }
      if (&v11[v12] == v16)
      {
        v7[2](v7, v13, __p);
        if (LOBYTE(__p[0]))
          break;
      }
      ++v13;
    }
  }
  else
  {
    LOBYTE(__p[0]) = 0;
    v20 = v27;
    if (v26 != v27)
    {
      v21 = (char *)v26 + 4;
      do
      {
        v7[2](v7, *((int *)v21 - 1), __p);
        if (LOBYTE(__p[0]))
          v22 = 1;
        else
          v22 = v21 == v20;
        v21 += 4;
      }
      while (!v22);
    }
  }
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v25);
  if (v26)
  {
    v27 = (char *)v26;
    operator delete(v26);
  }

}

- (void)enumeratePrefixTokenIDsForPrefix:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, const __CFString *);
  uint64_t v8;
  SentencePieceProcessor *p_processor;
  const __CFString *v10;
  unint64_t v11;
  size_t v12;
  size_t v13;
  size_t v14;
  char *v15;
  void *v16;
  void **v17;
  const __CFString *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void **v22;
  __CFString *v23;
  id v24;
  void (**v25)(id, _QWORD, const __CFString *);
  void *__dst[2];
  int64_t v27;
  void *v28;
  size_t v29;
  char *v30;
  size_t v31;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, const __CFString *))a4;
  v24 = objc_retainAutorelease(v6);
  v30 = (char *)objc_msgSend(v24, "UTF8String");
  v8 = 0;
  v31 = strlen(v30);
  p_processor = &self->_processor;
  v10 = &stru_2519DAFF0;
  v11 = 0x24BDD1000uLL;
  v25 = v7;
  while (v8 < (*((int (**)(SentencePieceProcessor *))p_processor->_vptr$SentencePieceProcessor + 62))(p_processor))
  {
    v28 = (void *)(*((uint64_t (**)(SentencePieceProcessor *, uint64_t))p_processor->_vptr$SentencePieceProcessor
                   + 64))(p_processor, v8);
    v29 = v12;
    if (!v12)
      goto LABEL_24;
    if (!std::string_view::compare[abi:ne180100](&v28, 0, v31, v30, v31))
    {
      v7[2](v7, v8, v10);
      goto LABEL_24;
    }
    if (std::string_view::compare[abi:ne180100](&v30, 0, v29, v28, v29))
      goto LABEL_24;
    v13 = v29;
    if (v31 < v29)
      std::__throw_out_of_range[abi:ne180100]("string_view::substr");
    if (v31 - v29 >= v31)
      v14 = v31;
    else
      v14 = v31 - v29;
    if (v14 >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v15 = v30;
    v16 = *(void **)(v11 + 1992);
    if (v14 >= 0x17)
    {
      v18 = v10;
      v19 = v11;
      v20 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v14 | 7) != 0x17)
        v20 = v14 | 7;
      v21 = v20 + 1;
      v17 = (void **)operator new(v20 + 1);
      __dst[1] = (void *)v14;
      v27 = v21 | 0x8000000000000000;
      __dst[0] = v17;
      v11 = v19;
      v10 = v18;
      v7 = v25;
    }
    else
    {
      HIBYTE(v27) = v14;
      v17 = __dst;
      if (!v14)
        goto LABEL_19;
    }
    memmove(v17, &v15[v13], v14);
LABEL_19:
    *((_BYTE *)v17 + v14) = 0;
    if (v27 >= 0)
      v22 = __dst;
    else
      v22 = (void **)__dst[0];
    objc_msgSend(v16, "stringWithUTF8String:", v22);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8, v23);

    if (SHIBYTE(v27) < 0)
      operator delete(__dst[0]);
LABEL_24:
    ++v8;
  }

}

- (void)enumerateTokenIDsForRawPrefix:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  char *v9;
  size_t v10;
  uint64_t v11;
  SentencePieceProcessor *p_processor;
  uint64_t v13;
  _QWORD v14[2];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = objc_retainAutorelease(v6);
  v9 = (char *)objc_msgSend(v8, "UTF8String");
  v10 = strlen(v9);
  v11 = 0;
  p_processor = &self->_processor;
  while (v11 < (*((int (**)(SentencePieceProcessor *))p_processor->_vptr$SentencePieceProcessor + 62))(p_processor))
  {
    v14[0] = (*((uint64_t (**)(SentencePieceProcessor *, uint64_t))p_processor->_vptr$SentencePieceProcessor
              + 64))(p_processor, v11);
    v14[1] = v13;
    if (v13)
    {
      if (!std::string_view::compare[abi:ne180100](v14, 0, v10, v9, v10))
        v7[2](v7, v11);
    }
    ++v11;
  }

}

- (void)enumerateTokenIDsForDecodedPrefix:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  char *v9;
  size_t v10;
  uint64_t v11;
  SentencePieceProcessor *p_processor;
  _DWORD *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *__p;
  void *v18;
  _DWORD *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = objc_retainAutorelease(v6);
  v9 = (char *)objc_msgSend(v8, "UTF8String");
  v10 = strlen(v9);
  v11 = 0;
  v21 = 0;
  v22 = 0;
  p_processor = &self->_processor;
  v23 = 0;
  while (v11 < (*((int (**)(SentencePieceProcessor *))p_processor->_vptr$SentencePieceProcessor + 62))(p_processor))
  {
    v13 = operator new(4uLL);
    __p = v13;
    *v13 = v11;
    v18 = v13 + 1;
    v19 = v13 + 1;
    (*((void (**)(uint64_t *__return_ptr, SentencePieceProcessor *, void **, void **))p_processor->_vptr$SentencePieceProcessor
     + 21))(&v20, p_processor, &__p, &v21);
    v14 = v20;
    sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v20);
    if (__p)
    {
      v18 = __p;
      operator delete(__p);
    }
    if (!v14)
    {
      if (SHIBYTE(v23) < 0)
      {
        v15 = v22;
        if (!v22)
          goto LABEL_6;
        v16 = v21;
      }
      else
      {
        v15 = (void *)HIBYTE(v23);
        if (!HIBYTE(v23))
          goto LABEL_6;
        v16 = &v21;
      }
      __p = v16;
      v18 = v15;
      if (!std::string_view::compare[abi:ne180100](&__p, 0, v10, v9, v10))
        v7[2](v7, v11);
    }
LABEL_6:
    ++v11;
  }
  if (SHIBYTE(v23) < 0)
    operator delete(v21);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processor.mmappable_data_.__r_.var0, 0);
  sentencepiece::SentencePieceProcessor::~SentencePieceProcessor((sentencepiece::SentencePieceProcessor *)&self->_processor);
}

- (id).cxx_construct
{
  sentencepiece::SentencePieceProcessor::SentencePieceProcessor((sentencepiece::SentencePieceProcessor *)&self->_processor);
  return self;
}

- (void)initWithTokenizerPath:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_248BE5000, a1, a3, "Failed to load tokenizer.", a5, a6, a7, a8, 0);
}

- (void)initWithTokenizerPath:(NSObject *)a3 error:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136446210;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_248BE5000, a2, a3, "Failed to load tokenizer error message: %{public}s", (uint8_t *)a2);
}

- (void)tokenize:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_248BE5000, a1, a3, "Failed to tokenize text.", a5, a6, a7, a8, 0);
}

- (void)detokenize:(NSObject *)a3 error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136446210;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_248BE5000, a2, a3, "Failed to detokenize tokens: %{public}s", (uint8_t *)a2);
}

@end

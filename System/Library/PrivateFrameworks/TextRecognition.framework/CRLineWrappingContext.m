@implementation CRLineWrappingContext

- (CRLineWrappingContext)initWithLocale:(id)a3
{
  id v5;
  CRLineWrappingContext *v6;
  CRLineWrappingContext *v7;
  uint64_t v8;
  CRLanguageResourcesManager *lrManager;
  CRLineWrappingClassifier *v10;
  CRLineWrappingClassifier *classifier;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRLineWrappingContext;
  v6 = -[CRLineWrappingContext init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locale, a3);
    +[CRLanguageResourcesManager lineWrappingManager](CRLanguageResourcesManager, "lineWrappingManager");
    v8 = objc_claimAutoreleasedReturnValue();
    lrManager = v7->_lrManager;
    v7->_lrManager = (CRLanguageResourcesManager *)v8;

    -[CRLanguageResourcesManager addSubscriber:forLocale:](v7->_lrManager, "addSubscriber:forLocale:", v7, v5);
    v7->_active = 0;
    if (+[CRLineWrappingClassifier localeIsSupported:](CRLineWrappingClassifier, "localeIsSupported:", v5))
    {
      v10 = -[CRLineWrappingClassifier initWithLocale:]([CRLineWrappingClassifier alloc], "initWithLocale:", v5);
      classifier = v7->_classifier;
      v7->_classifier = v10;

    }
  }

  return v7;
}

- (NSArray)contextResults
{
  if (self)
    self = (CRLineWrappingContext *)objc_getProperty(self, a2, 64, 1);
  return (NSArray *)(id)-[CRLineWrappingContext copy](self, "copy");
}

- (void)startWithResult:(id)a3 contextSize:(int64_t)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  unsigned int *begin;
  double v15;
  __int128 v16;
  unsigned int *v17;
  uint8_t buf[8];
  void *v19;

  v6 = a3;
  if (-[CRLineWrappingContext active](self, "active"))
  {
    CROSLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4FB8000, v7, OS_LOG_TYPE_FAULT, "Unexpectedly starting an active context", buf, 2u);
    }

  }
  if (self)
    self->_active = 1;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v6, 0);
  if (self)
    objc_setProperty_atomic(self, v8, v9, 64);

  objc_msgSend(v6, "paragraphText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  if (self)
  {
    objc_setProperty_atomic(self, v11, v10, 40);

    self->_contextSize = a4;
  }
  else
  {

  }
  if (+[CRLineWrappingContext _usesWordTokensForLocale:]((uint64_t)CRLineWrappingContext, self->_locale))
  {
    objc_msgSend(v6, "paragraphText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRLineWrappingContext tokenizeStringIntoWords:](self, "tokenizeStringIntoWords:", v13);

    -[CRLineWrappingContext contextByAddingNewTokens:]((uint64_t *)&v16, self, buf);
    begin = self->_contextTokens.__begin_;
    if (begin)
    {
      self->_contextTokens.__end_ = begin;
      operator delete(begin);
      self->_contextTokens.__begin_ = 0;
      self->_contextTokens.__end_ = 0;
      self->_contextTokens.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&self->_contextTokens.__begin_ = v16;
    self->_contextTokens.__end_cap_.__value_ = v17;
    if (*(_QWORD *)buf)
    {
      v19 = *(void **)buf;
      operator delete(*(void **)buf);
    }
  }
  self->_lineCount = 1;
  objc_msgSend(v6, "featureInTestSize");
  self->_lineHeightSum = v15;

}

+ (BOOL)_usesWordTokensForLocale:(uint64_t)a1
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  objc_opt_self();
  v3 = +[CRImageReader languageIsLatin:](CRImageReader, "languageIsLatin:", v2)
    || +[CRImageReader languageIsCyrillic:](CRImageReader, "languageIsCyrillic:", v2);

  return v3;
}

- (void)contextByAddingNewTokens:(_QWORD *)a3
{
  unint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  int64_t v25;
  char *v26;
  char *v27;
  int *v28;
  char *v29;
  int v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  int v35;
  char *v36;
  char *v37;
  int v38;
  char *v39;
  _BYTE *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *__dst;
  uint64_t v45;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    v6 = a2[10];
    v7 = (char *)a3[1];
    v8 = (uint64_t)&v7[-*a3] >> 2;
    if ((uint64_t)(v6 - v8) < 1)
    {
      v13 = 0;
      v15 = 0;
      v10 = 0;
    }
    else
    {
      v9 = a2[2];
      v10 = v9 - a2[1];
      if (v10)
      {
        v11 = v10 >> 2;
        v12 = v11 >= v6 - v8 ? v6 - v8 : v11;
        v13 = 4 * v12;
        v43 = 0;
        __dst = 0;
        v45 = 0;
        if (4 * v12)
        {
          std::vector<unsigned int>::__vallocate[abi:ne180100](&v43, v13 >> 2);
          v14 = __dst;
          if (v12)
            memmove(__dst, (const void *)(v9 - 4 * v12), 4 * v12);
          v13 = (uint64_t)v14 + 4 * (v13 >> 2);
          v6 = a2[10];
          v7 = (char *)a3[1];
          v15 = v45;
          v10 = v43;
          v8 = (uint64_t)&v7[-*a3] >> 2;
        }
        else
        {
          v10 = 0;
          v15 = 0;
        }
        *a1 = v10;
        a1[1] = v13;
        a1[2] = v15;
      }
      else
      {
        v13 = 0;
        v15 = 0;
      }
    }
    if (v8 < v6)
      v6 = v8;
    if ((uint64_t)(4 * v6) >= 1)
    {
      v16 = &v7[-4 * v6];
      v17 = (uint64_t)(4 * v6) >> 2;
      v18 = v13 - v10;
      v19 = (char *)(v10 + ((v13 - v10) & 0xFFFFFFFFFFFFFFFCLL));
      if (v17 > (v15 - v13) >> 2)
      {
        v20 = v17 + ((v13 - v10) >> 2);
        if (v20 >> 62)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        if ((v15 - v10) >> 1 > v20)
          v20 = (v15 - v10) >> 1;
        if ((unint64_t)(v15 - v10) >= 0x7FFFFFFFFFFFFFFCLL)
          v21 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v21 = v20;
        if (v21)
          v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a1 + 2), v21);
        else
          v22 = 0;
        v31 = &v22[4 * (v18 >> 2)];
        v32 = &v31[4 * v17];
        v33 = 4 * v17;
        v34 = v31;
        do
        {
          v35 = *(_DWORD *)v16;
          v16 += 4;
          *(_DWORD *)v34 = v35;
          v34 += 4;
          v33 -= 4;
        }
        while (v33);
        v36 = (char *)*a1;
        if ((char *)*a1 != v19)
        {
          v37 = v19;
          do
          {
            v38 = *((_DWORD *)v37 - 1);
            v37 -= 4;
            *((_DWORD *)v31 - 1) = v38;
            v31 -= 4;
          }
          while (v37 != v36);
        }
        v39 = &v22[4 * v21];
        v40 = (_BYTE *)a1[1];
        v41 = v40 - v19;
        if (v40 != v19)
          memmove(v32, v19, v40 - v19);
        v42 = (void *)*a1;
        *a1 = (uint64_t)v31;
        a1[1] = (uint64_t)&v32[v41];
        a1[2] = (uint64_t)v39;
        if (v42)
          operator delete(v42);
        return;
      }
      v23 = (v13 - (uint64_t)v19) >> 2;
      if (v23 >= v17)
      {
        v24 = &v16[4 * v17];
        v26 = (char *)v13;
      }
      else
      {
        v24 = &v16[4 * v23];
        v25 = v7 - v24;
        if (v7 != v24)
          memmove((void *)v13, &v16[4 * v23], v7 - v24);
        v26 = (char *)(v13 + v25);
        a1[1] = v13 + v25;
        if (v13 - (uint64_t)v19 < 1)
          return;
      }
      v27 = &v19[4 * v17];
      v28 = (int *)&v26[-4 * v17];
      v29 = v26;
      if ((unint64_t)v28 < v13)
      {
        v29 = v26;
        do
        {
          v30 = *v28++;
          *(_DWORD *)v29 = v30;
          v29 += 4;
        }
        while ((unint64_t)v28 < v13);
      }
      a1[1] = (uint64_t)v29;
      if (v26 != v27)
        memmove(&v26[-4 * ((v26 - v27) >> 2)], v19, v26 - v27);
      if (v24 != v16)
        memmove(v19, v16, v24 - v16);
    }
  }
}

- (void)resetContext
{
  SEL v3;

  if (self)
  {
    self->_active = 0;
    objc_setProperty_atomic(self, a2, 0, 64);
    objc_setProperty_atomic(self, v3, 0, 40);
  }
  self->_contextTokens.__end_ = self->_contextTokens.__begin_;
  self->_lineCount = 0;
  self->_verticalSpacingSumCount = 0;
  self->_verticalSpacingSum = 0.0;
  self->_lineHeightSum = 0.0;
}

- (double)averageVerticalSpacing
{
  double result;
  int64_t verticalSpacingSumCount;

  result = 0.0;
  if (self)
  {
    verticalSpacingSumCount = self->_verticalSpacingSumCount;
    if (verticalSpacingSumCount >= 1)
      return self->_verticalSpacingSum / (double)verticalSpacingSumCount;
  }
  return result;
}

- (double)averageLineHeight
{
  double lineHeightSum;

  if (!-[CRLineWrappingContext lineCount](self, "lineCount"))
    return 0.0;
  if (self)
    lineHeightSum = self->_lineHeightSum;
  else
    lineHeightSum = 0.0;
  return lineHeightSum / (double)-[CRLineWrappingContext lineCount](self, "lineCount");
}

- (void)addResult:(id)a3 mergeOversegmentation:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  id v20;
  void *v21;
  void *v22;
  char v23;
  id Property;
  const char *v25;
  void *v26;
  id v27;
  const char *v28;
  void *v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  double v38;
  double v39;
  void *__p;
  void *v41;
  uint64_t v42;
  _BYTE buf[22];
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!-[CRLineWrappingContext active](self, "active"))
  {
    CROSLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4FB8000, v7, OS_LOG_TYPE_FAULT, "Adding result to an inactive context", buf, 2u);
    }

  }
  objc_msgSend(v6, "featureInTest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "languageIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRLineWrappingContext locale](self, "locale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if ((v12 & 1) == 0)
  {
    CROSLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "featureInTest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "locale");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRLineWrappingContext locale](self, "locale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_1D4FB8000, v13, OS_LOG_TYPE_ERROR, "Attempting to add a feature with locale %@ to a context with locale %@", buf, 0x16u);

    }
  }
  if (v6)
  {
    objc_msgSend(v6, "featureTokens");
  }
  else
  {
    __p = 0;
    v41 = 0;
    v42 = 0;
  }
  -[CRLineWrappingContext contextByAddingNewTokens:]((uint64_t *)buf, self, &__p);
  if (__p)
  {
    v41 = __p;
    operator delete(__p);
  }
  if (&self->_contextTokens != (vector<unsigned int, std::allocator<unsigned int>> *)buf)
    std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>((char *)&self->_contextTokens, *(char **)buf, *(uint64_t *)&buf[8], (uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 2);
  objc_msgSend(v6, "paragraphText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    objc_setProperty_atomic(self, v17, v18, 40);

  if ((objc_msgSend(v6, "isOversegmented") & v4) != 1)
    goto LABEL_34;
  v20 = self ? objc_getProperty(self, v19, 64, 1) : 0;
  objc_msgSend(v20, "lastObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "featureInTest");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_respondsToSelector();

  if ((v23 & 1) != 0)
  {
    if (self)
      Property = objc_getProperty(self, v19, 64, 1);
    else
      Property = 0;
    objc_msgSend(Property, "lastObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v27 = objc_getProperty(self, v25, 64, 1);
    else
      v27 = 0;
    objc_msgSend(v27, "removeLastObject");
    objc_msgSend(v26, "resultByMerging:", v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v30 = objc_getProperty(self, v28, 64, 1);
    else
      v30 = 0;
    objc_msgSend(v30, "addObject:", v29);
    objc_msgSend(v29, "featureInTestSize");
    v32 = v31;
    objc_msgSend(v26, "featureInTestSize");
    if (self)
      self->_lineHeightSum = v32 - v33 + self->_lineHeightSum;
    if (objc_msgSend(v26, "contributesToVerticalSpacing"))
    {
      objc_msgSend(v29, "verticalSpacing");
      v35 = v34;
      objc_msgSend(v26, "verticalSpacing");
      if (self)
        self->_verticalSpacingSum = v35 - v36 + self->_verticalSpacingSum;
    }

  }
  else
  {
LABEL_34:
    if (self)
      v37 = objc_getProperty(self, v19, 64, 1);
    else
      v37 = 0;
    objc_msgSend(v37, "addObject:", v6);
    ++self->_lineCount;
    objc_msgSend(v6, "featureInTestSize");
    self->_lineHeightSum = v38 + self->_lineHeightSum;
    if (objc_msgSend(v6, "contributesToVerticalSpacing"))
    {
      objc_msgSend(v6, "verticalSpacing");
      self->_verticalSpacingSum = v39 + self->_verticalSpacingSum;
      ++self->_verticalSpacingSumCount;
    }
  }
  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }

}

- (CRLineWrappable)lastFeature
{
  void *v2;
  void *v3;

  if (self)
    self = (CRLineWrappingContext *)objc_getProperty(self, a2, 64, 1);
  -[CRLineWrappingContext lastObject](self, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureInTest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CRLineWrappable *)v3;
}

- (vector<unsigned)tokenizeStringIntoWords:(CRLineWrappingContext *)self
{
  id v6;
  void *v7;
  size_t v8;
  uint64_t v9;
  char *v10;
  _BYTE *v11;
  uint64_t *v12;
  const char *v13;
  id Property;
  id v15;
  void *v16;
  uint64_t *v17;
  vector<unsigned int, std::allocator<unsigned int>> *result;
  _QWORD v19[5];
  void *__p;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  __n128 (*v31)(__n128 *, __n128 *);
  void (*v32)(uint64_t);
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;

  v6 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x4812000000;
  v31 = __Block_byref_object_copy__88;
  v32 = __Block_byref_object_dispose__89;
  v33 = &unk_1D5168E96;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  if (-[CRLineWrappingContext usesWordTokens](self, "usesWordTokens"))
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(" "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "maximumLengthOfBytesUsingEncoding:", 4);
    v9 = objc_msgSend(v7, "length");
    v25 = 0;
    v26 = 0;
    v27 = 0;
    if (v8)
    {
      std::vector<unsigned char>::__vallocate[abi:ne180100](&v25, v8);
      v10 = (char *)v26 + v8;
      bzero(v26, v8);
      v26 = v10;
      v11 = v25;
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
    v24 = 0;
    objc_msgSend(v7, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v11, v10 - v11, &v24, 4, 0, 0, v9, 0);
    if (self)
      Property = objc_getProperty(self, v13, 72, 1);
    else
      Property = 0;
    v15 = Property;
    -[CRLineWrappingContext locale](self, "locale");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3321888768;
    v19[2] = __49__CRLineWrappingContext_tokenizeStringIntoWords___block_invoke;
    v19[3] = &unk_1E98D9448;
    v21 = 0;
    v22 = 0;
    __p = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v25, (uint64_t)v26, (_BYTE *)v26 - (_BYTE *)v25);
    v23 = v24;
    v19[4] = &v28;
    objc_msgSend(v15, "lockResourcesForLocale:sender:block:", v16, self, v19);

    v17 = v29;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    retstr->__begin_ = 0;
    std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(retstr, (const void *)v17[6], v17[7], (v17[7] - v17[6]) >> 2);
    if (__p)
    {
      v21 = __p;
      operator delete(__p);
    }
    if (v25)
    {
      v26 = v25;
      operator delete(v25);
    }
  }
  else
  {
    v12 = v29;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    retstr->__begin_ = 0;
    std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(retstr, (const void *)v12[6], v12[7], (v12[7] - v12[6]) >> 2);
    v7 = v6;
  }
  _Block_object_dispose(&v28, 8);
  if (v34)
  {
    v35 = v34;
    operator delete(v34);
  }

  return result;
}

void __49__CRLineWrappingContext_tokenizeStringIntoWords___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "wordTokenizer");
  LMStreamTokenizerReset();
  v3 = v2;
  LMStreamTokenizerPushBytes();

}

void __49__CRLineWrappingContext_tokenizeStringIntoWords___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, int TokenIDForString)
{
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  _QWORD *v12;
  char *v13;
  unint64_t v14;
  _DWORD *v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  int v24;
  id v25;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a2, a3, 4);
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v25, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "wordLanguageModel");
    v8 = LMLanguageModelTokenIDisUnknown() ^ 1;
    if (!TokenIDForString)
      LOBYTE(v8) = 0;
    if ((v8 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "wordLanguageModel");
      TokenIDForString = LMLanguageModelGetTokenIDForString();
      objc_msgSend(*(id *)(a1 + 32), "wordLanguageModel");
      v9 = LMLanguageModelTokenIDisUnknown();
      v10 = TokenIDForString ? v9 : 1;
      if (v10 == 1)
      {
        objc_msgSend(v25, "lowercaseString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "wordLanguageModel");
        TokenIDForString = LMLanguageModelGetTokenIDForString();

      }
    }
    v12 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
    v13 = (char *)v12[7];
    v14 = v12[8];
    if ((unint64_t)v13 >= v14)
    {
      v16 = (char *)v12[6];
      v17 = (v13 - v16) >> 2;
      if ((unint64_t)(v17 + 1) >> 62)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v18 = v14 - (_QWORD)v16;
      v19 = (uint64_t)(v14 - (_QWORD)v16) >> 1;
      if (v19 <= v17 + 1)
        v19 = v17 + 1;
      if (v18 >= 0x7FFFFFFFFFFFFFFCLL)
        v20 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v20 = v19;
      if (v20)
      {
        v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(v12 + 8), v20);
        v16 = (char *)v12[6];
        v13 = (char *)v12[7];
      }
      else
      {
        v21 = 0;
      }
      v22 = &v21[4 * v17];
      v23 = &v21[4 * v20];
      *(_DWORD *)v22 = TokenIDForString;
      v15 = v22 + 4;
      while (v13 != v16)
      {
        v24 = *((_DWORD *)v13 - 1);
        v13 -= 4;
        *((_DWORD *)v22 - 1) = v24;
        v22 -= 4;
      }
      v12[6] = v22;
      v12[7] = v15;
      v12[8] = v23;
      if (v16)
        operator delete(v16);
    }
    else
    {
      *(_DWORD *)v13 = TokenIDForString;
      v15 = v13 + 4;
    }
    v12[7] = v15;
  }

}

- (BOOL)isValidWordString:(id)a3
{
  const char *v4;
  id v5;
  id Property;
  id v7;
  void *v8;
  id v9;
  char v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v5 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  if (self)
    Property = objc_getProperty(self, v4, 72, 1);
  else
    Property = 0;
  v7 = Property;
  -[CRLineWrappingContext locale](self, "locale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__CRLineWrappingContext_isValidWordString___block_invoke;
  v12[3] = &unk_1E98DAA08;
  v9 = v5;
  v13 = v9;
  v14 = &v15;
  objc_msgSend(v7, "lockResourcesForLocale:sender:block:", v8, self, v12);

  v10 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __43__CRLineWrappingContext_isValidWordString___block_invoke(uint64_t a1, void *a2)
{
  unsigned int TokenIDForString;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "wordLanguageModel");
  TokenIDForString = LMLanguageModelGetTokenIDForString();
  if (TokenIDForString <= 0x1F3)
  {
    objc_msgSend(*(id *)(a1 + 32), "lowercaseString");
    objc_msgSend(v4, "wordLanguageModel");
    TokenIDForString = LMLanguageModelGetTokenIDForString();
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = TokenIDForString > 0x1F3;

}

- (BOOL)isRTL
{
  void *v2;
  BOOL v3;

  -[CRLineWrappingContext locale](self, "locale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[CRImageReader languageIsArabic:](CRImageReader, "languageIsArabic:", v2);

  return v3;
}

- (double)wordLMScoreByAddingTokens:(const void *)a3
{
  unint64_t v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int *v9;
  int v10;
  char v11;
  unsigned int v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  unsigned int *v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int *begin;
  uint64_t v22;
  unint64_t v23;
  unsigned int v24;
  double v25;
  id v27;
  void *v28;
  long double v29;
  double v30;
  _QWORD v31[6];
  void *__p;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  unsigned int *v40;
  unsigned int *v41;

  if (!-[CRLineWrappingContext usesWordTokens](self, "usesWordTokens"))
    return -1.79769313e308;
  if (self->_contextTokens.__end_ == self->_contextTokens.__begin_)
    return -1.79769313e308;
  v39 = 0;
  v40 = 0;
  v41 = 0;
  v6 = *(unsigned int **)a3;
  v7 = (unsigned int *)*((_QWORD *)a3 + 1);
  if (*(unsigned int **)a3 == v7)
    return -1.79769313e308;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  while (1)
  {
    v12 = *v6;
    if (v9 >= v41)
    {
      v13 = v9 - v8;
      v14 = v13 + 1;
      if ((unint64_t)(v13 + 1) >> 62)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v15 = (char *)v41 - (char *)v8;
      if (((char *)v41 - (char *)v8) >> 1 > v14)
        v14 = v15 >> 1;
      if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL)
        v5 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v5 = v14;
      if (v5)
      {
        v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v41, v5);
        v8 = (unsigned int *)v39;
        v9 = v40;
      }
      else
      {
        v16 = 0;
      }
      v17 = (unsigned int *)&v16[4 * v13];
      *v17 = v12;
      v18 = (uint64_t)(v17 + 1);
      while (v9 != v8)
      {
        v19 = *--v9;
        *--v17 = v19;
      }
      v39 = v17;
      v40 = (unsigned int *)v18;
      v41 = (unsigned int *)&v16[4 * v5];
      if (v8)
        operator delete(v8);
      v9 = (unsigned int *)v18;
    }
    else
    {
      *v9++ = v12;
    }
    v40 = v9;
    v11 |= v12 != 0;
    v10 |= v12 > 0x1F3;
    if ((v10 & 1) != 0 && (v11 & 1) != 0)
      break;
    v8 = (unsigned int *)v39;
    ++v6;
    if ((char *)v9 - (_BYTE *)v39 == 12 || v6 == v7)
    {
      if ((v11 & 1) == 0)
      {
        v25 = -1.79769313e308;
        goto LABEL_45;
      }
      break;
    }
  }
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0x7FEFFFFFFFFFFFFFLL;
  begin = self->_contextTokens.__begin_;
  v22 = (char *)self->_contextTokens.__end_ - (char *)begin;
  if (v22)
  {
    v23 = v22 >> 2;
    if (v23 <= 1)
      v23 = 1;
    while (1)
    {
      v24 = *begin++;
      if (v24 >= 0x1F4)
        break;
      if (!--v23)
        goto LABEL_35;
    }
    v27 = objc_getProperty(self, (SEL)v5, 72, 1);
    -[CRLineWrappingContext locale](self, "locale");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3321888768;
    v31[2] = __51__CRLineWrappingContext_wordLMScoreByAddingTokens___block_invoke;
    v31[3] = &unk_1E98D9480;
    v31[4] = self;
    v31[5] = &v35;
    v33 = 0;
    v34 = 0;
    __p = 0;
    std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&__p, v39, (uint64_t)v40, ((char *)v40 - (_BYTE *)v39) >> 2);
    objc_msgSend(v27, "lockResourcesForLocale:sender:block:", v28, self, v31);

    v29 = *((double *)v36 + 3);
    v30 = exp(v29);
    if (v29 >= 0.0)
      v25 = -1.79769313e308;
    else
      v25 = v30;
    if (__p)
    {
      v33 = __p;
      operator delete(__p);
    }
  }
  else
  {
LABEL_35:
    v25 = -1.79769313e308;
  }
  _Block_object_dispose(&v35, 8);
  v8 = (unsigned int *)v39;
LABEL_45:
  if (v8)
  {
    v40 = v8;
    operator delete(v8);
  }
  return v25;
}

void __51__CRLineWrappingContext_wordLMScoreByAddingTokens___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  int64_t v7;
  char *v8;
  int *v9;
  int *v10;
  int v11;
  double v12;
  char *v13;
  void *v14;
  char *v15;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  int v22;
  uint64_t v23;
  void *__p;
  void *__dst;
  unint64_t v26;

  v3 = a2;
  v4 = a1[4];
  v6 = *(_BYTE **)(v4 + 8);
  v5 = *(_BYTE **)(v4 + 16);
  __p = 0;
  __dst = 0;
  v26 = 0;
  v7 = v5 - v6;
  if (v5 != v6)
  {
    std::vector<unsigned int>::__vallocate[abi:ne180100](&__p, v7 >> 2);
    v8 = (char *)__dst;
    memmove(__dst, v6, v7);
    __dst = &v8[4 * (v7 >> 2)];
  }
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  v9 = (int *)a1[6];
  v10 = (int *)a1[7];
  if (v9 == v10)
  {
    v23 = a1[6];
  }
  else
  {
    do
    {
      v11 = *v9;
      objc_msgSend(v3, "wordLanguageModel");
      LMLanguageModelConditionalProbability();
      *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = v12 + *(double *)(*(_QWORD *)(a1[5] + 8) + 24);
      v13 = (char *)__dst;
      if ((unint64_t)__dst >= v26)
      {
        v15 = (char *)__p;
        v16 = ((_BYTE *)__dst - (_BYTE *)__p) >> 2;
        v17 = v16 + 1;
        if ((unint64_t)(v16 + 1) >> 62)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v18 = v26 - (_QWORD)__p;
        if ((uint64_t)(v26 - (_QWORD)__p) >> 1 > v17)
          v17 = v18 >> 1;
        if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFCLL)
          v19 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v19 = v17;
        if (v19)
        {
          v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v26, v19);
          v15 = (char *)__p;
          v13 = (char *)__dst;
        }
        else
        {
          v20 = 0;
        }
        v21 = &v20[4 * v16];
        *(_DWORD *)v21 = v11;
        v14 = v21 + 4;
        while (v13 != v15)
        {
          v22 = *((_DWORD *)v13 - 1);
          v13 -= 4;
          *((_DWORD *)v21 - 1) = v22;
          v21 -= 4;
        }
        __p = v21;
        __dst = v14;
        v26 = (unint64_t)&v20[4 * v19];
        if (v15)
          operator delete(v15);
      }
      else
      {
        *(_DWORD *)__dst = v11;
        v14 = v13 + 4;
      }
      __dst = v14;
      ++v9;
    }
    while (v9 != v10);
    v9 = (int *)a1[6];
    v23 = a1[7];
  }
  *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = *(double *)(*(_QWORD *)(a1[5] + 8) + 24)
                                               / (double)(unint64_t)((v23 - (uint64_t)v9) >> 2);
  if (__p)
  {
    __dst = __p;
    operator delete(__p);
  }

}

- (double)wordLMScoreByAddingToken:(unsigned int)a3
{
  _DWORD *v5;
  double v6;
  double v7;
  void *__p;
  void *v10;
  _DWORD *v11;

  v5 = operator new(4uLL);
  __p = v5;
  *v5 = a3;
  v10 = v5 + 1;
  v11 = v5 + 1;
  -[CRLineWrappingContext wordLMScoreByAddingTokens:](self, "wordLMScoreByAddingTokens:", &__p);
  v7 = v6;
  if (__p)
  {
    v10 = __p;
    operator delete(__p);
  }
  return v7;
}

- (double)charLMScoreByAddingString:(id)a3 eosScore:(double *)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  id Property;
  id v16;
  void *v17;
  long double v18;
  double v19;
  double v20;
  id v22;
  _QWORD v23[11];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  __n128 (*v32)(__n128 *, __n128 *);
  void (*v33)(uint64_t);
  void *v34;
  void *__p;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[8];
  _QWORD v45[6];
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[5];
  __CFString *v54;

  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__7;
  v53[4] = __Block_byref_object_dispose__7;
  v54 = &stru_1E98DC948;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v22 = a3;
  -[CRLineWrappingContext locale](self, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[CRImageReader languageIsThai:](CRImageReader, "languageIsThai:", v6))
    v7 = 5;
  else
    v7 = 2;

  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x4812000000;
  v45[3] = __Block_byref_object_copy__88;
  v45[4] = __Block_byref_object_dispose__89;
  v45[5] = &unk_1D5168E96;
  v46 = 0;
  v47 = 0;
  v48 = 0;
  -[CRLineWrappingContext text](self, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRLineWrappingContext text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = a4;
  v11 = objc_msgSend(v9, "length");
  v12 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __60__CRLineWrappingContext_charLMScoreByAddingString_eosScore___block_invoke;
  v44[3] = &unk_1E98DAA30;
  v44[6] = v45;
  v44[7] = &v49;
  v44[4] = self;
  v44[5] = v53;
  objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, v7 | 0x100, v44);

  if (v50[3])
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__7;
    v42 = __Block_byref_object_dispose__7;
    v43 = (id)objc_opt_new();
    v29 = 0;
    v30 = &v29;
    v31 = 0x4812000000;
    v32 = __Block_byref_object_copy__88;
    v33 = __Block_byref_object_dispose__89;
    v34 = &unk_1D5168E96;
    __p = 0;
    v36 = 0;
    v37 = 0;
    v13 = v22;
    v28[0] = v12;
    v28[1] = 3221225472;
    v28[2] = __60__CRLineWrappingContext_charLMScoreByAddingString_eosScore___block_invoke_2;
    v28[3] = &unk_1E98DAA58;
    v28[4] = &v38;
    v28[5] = &v29;
    objc_msgSend(v22, "enumerateSubstringsInRange:options:usingBlock:", 0, objc_msgSend(v22, "length"), v7, v28);
    if (!objc_msgSend((id)v39[5], "count") || v30[7] == v30[6])
    {
      v20 = -1.79769313e308;
    }
    else
    {
      v24 = 0;
      v25 = &v24;
      v26 = 0x2020000000;
      v27 = 0;
      if (self)
        Property = objc_getProperty(self, v14, 72, 1);
      else
        Property = 0;
      v16 = Property;
      -[CRLineWrappingContext locale](self, "locale");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v12;
      v23[1] = 3221225472;
      v23[2] = __60__CRLineWrappingContext_charLMScoreByAddingString_eosScore___block_invoke_3;
      v23[3] = &unk_1E98DAA80;
      v23[4] = v45;
      v23[5] = &v29;
      v23[6] = &v24;
      v23[7] = &v49;
      v23[8] = &v38;
      v23[9] = v53;
      v23[10] = v10;
      objc_msgSend(v16, "lockResourcesForLocale:sender:block:", v17, self, v23);

      v18 = *((double *)v25 + 3);
      v19 = exp(v18);
      if (v18 >= 0.0)
        v20 = -1.79769313e308;
      else
        v20 = v19;
      _Block_object_dispose(&v24, 8);
    }
    _Block_object_dispose(&v29, 8);
    if (__p)
    {
      v36 = __p;
      operator delete(__p);
    }
    _Block_object_dispose(&v38, 8);

  }
  else
  {
    v20 = -1.79769313e308;
    v13 = v22;
  }
  _Block_object_dispose(v45, 8);
  if (v46)
  {
    v47 = v46;
    operator delete(v46);
  }
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(v53, 8);

  return v20;
}

void __60__CRLineWrappingContext_charLMScoreByAddingString_eosScore___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  __int16 v9;
  int16x4_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  int v15;
  int v16;
  unint64_t v17;
  char *v18;
  _DWORD *v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  int v28;
  uint64_t v29;
  id v30;

  v30 = a2;
  v9 = objc_msgSend(v30, "characterAtIndex:", 0);
  v10.i16[0] = v9 & 0xFFDF;
  v10.i16[1] = v9;
  if ((vmaxv_u16(vcgt_u16((uint16x4_t)0x158001F0017001ALL, (uint16x4_t)vadd_s16(vzip1_s16(v10, vdup_lane_s16(v10, 1)), (int16x4_t)0xFF08FF28FF40FFBFLL))) & 1) != 0|| (unsigned __int16)(v9 - 880) < 0x1C0u)
  {
    goto LABEL_22;
  }
  objc_msgSend(v30, "stringByAppendingString:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1[5] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = *(_QWORD **)(a1[6] + 8);
  v15 = NSStringToUnicode((NSString *)v30);
  v16 = v15;
  v17 = v14[8];
  v18 = (char *)v14[7];
  if ((unint64_t)v18 >= v17)
  {
    v20 = (char *)v14[6];
    v21 = (v18 - v20) >> 2;
    if ((unint64_t)(v21 + 1) >> 62)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v22 = v17 - (_QWORD)v20;
    v23 = (uint64_t)(v17 - (_QWORD)v20) >> 1;
    if (v23 <= v21 + 1)
      v23 = v21 + 1;
    if (v22 >= 0x7FFFFFFFFFFFFFFCLL)
      v24 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v24 = v23;
    if (v24)
    {
      v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(v14 + 8), v24);
      v20 = (char *)v14[6];
      v18 = (char *)v14[7];
    }
    else
    {
      v25 = 0;
    }
    v26 = &v25[4 * v21];
    v27 = &v25[4 * v24];
    *(_DWORD *)v26 = v16;
    v19 = v26 + 4;
    while (v18 != v20)
    {
      v28 = *((_DWORD *)v18 - 1);
      v18 -= 4;
      *((_DWORD *)v26 - 1) = v28;
      v26 -= 4;
    }
    v14[6] = v26;
    v14[7] = v19;
    v14[8] = v27;
    if (v20)
      operator delete(v20);
  }
  else
  {
    *(_DWORD *)v18 = v15;
    v19 = v18 + 4;
  }
  v14[7] = v19;
  ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  v29 = a1[4];
  if (v29)
    v29 = *(_QWORD *)(v29 + 80);
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) == v29)
LABEL_22:
    *a7 = 1;

}

void __60__CRLineWrappingContext_charLMScoreByAddingString_eosScore___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  __int16 v9;
  int16x4_t v10;
  _QWORD *v11;
  int v12;
  int v13;
  unint64_t v14;
  char *v15;
  _DWORD *v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  int v25;
  void *v26;
  char v27;
  id v28;

  v28 = a2;
  v9 = objc_msgSend(v28, "characterAtIndex:", 0);
  v10.i16[0] = v9 & 0xFFDF;
  v10.i16[1] = v9;
  if ((vmaxv_u16(vcgt_u16((uint16x4_t)0x158001F0017001ALL, (uint16x4_t)vadd_s16(vzip1_s16(v10, vdup_lane_s16(v10, 1)), (int16x4_t)0xFF08FF28FF40FFBFLL))) & 1) != 0|| (unsigned __int16)(v9 - 880) < 0x1C0u)
  {
    goto LABEL_20;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v28);
  v11 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v12 = NSStringToUnicode((NSString *)v28);
  v13 = v12;
  v14 = v11[8];
  v15 = (char *)v11[7];
  if ((unint64_t)v15 >= v14)
  {
    v17 = (char *)v11[6];
    v18 = (v15 - v17) >> 2;
    if ((unint64_t)(v18 + 1) >> 62)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v19 = v14 - (_QWORD)v17;
    v20 = (uint64_t)(v14 - (_QWORD)v17) >> 1;
    if (v20 <= v18 + 1)
      v20 = v18 + 1;
    v21 = v19 >= 0x7FFFFFFFFFFFFFFCLL ? 0x3FFFFFFFFFFFFFFFLL : v20;
    if (v21)
    {
      v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(v11 + 8), v21);
      v17 = (char *)v11[6];
      v15 = (char *)v11[7];
    }
    else
    {
      v22 = 0;
    }
    v23 = &v22[4 * v18];
    v24 = &v22[4 * v21];
    *(_DWORD *)v23 = v13;
    v16 = v23 + 4;
    while (v15 != v17)
    {
      v25 = *((_DWORD *)v15 - 1);
      v15 -= 4;
      *((_DWORD *)v23 - 1) = v25;
      v23 -= 4;
    }
    v11[6] = v23;
    v11[7] = v16;
    v11[8] = v24;
    if (v17)
      operator delete(v17);
  }
  else
  {
    *(_DWORD *)v15 = v12;
    v16 = v15 + 4;
  }
  v11[7] = v16;
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v28, "_crContainsCharactersInSet:", v26);

  if ((v27 & 1) == 0)
LABEL_20:
    *a7 = 1;

}

void __60__CRLineWrappingContext_charLMScoreByAddingString_eosScore___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  unint64_t v9;
  int v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  _QWORD *v23;
  float v24;
  long double v25;
  _QWORD *v26;
  _QWORD *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "lmCharacterLanguageModel") || objc_msgSend(v3, "cvnlpCharacterLanguageModel"))
  {
    if (objc_msgSend(v3, "lmCharacterLanguageModel"))
    {
      v4 = *(_QWORD *)(a1[4] + 8);
      v5 = *(_QWORD *)(v4 + 48);
      v6 = *(_QWORD *)(v4 + 56);
      v7 = (_DWORD *)(v6 - 4);
      if (v5 != v6 && (unint64_t)v7 > v5)
      {
        v9 = v5 + 4;
        do
        {
          v10 = *(_DWORD *)(v9 - 4);
          *(_DWORD *)(v9 - 4) = *v7;
          *v7-- = v10;
          v11 = v9 >= (unint64_t)v7;
          v9 += 4;
        }
        while (!v11);
      }
      v12 = *(_QWORD *)(a1[5] + 8);
      v13 = *(_QWORD *)(v12 + 48);
      v14 = *(_QWORD *)(v12 + 56);
      if (v13 == v14)
      {
        v17 = *(_QWORD *)(v12 + 48);
      }
      else
      {
        do
        {
          objc_msgSend(v3, "lmCharacterLanguageModel");
          LMLanguageModelConditionalProbability();
          *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = v15 + *(double *)(*(_QWORD *)(a1[6] + 8) + 24);
          v13 += 4;
        }
        while (v13 != v14);
        v16 = *(_QWORD *)(a1[5] + 8);
        v13 = *(_QWORD *)(v16 + 48);
        v17 = *(_QWORD *)(v16 + 56);
      }
      *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = *(double *)(*(_QWORD *)(a1[6] + 8) + 24)
                                                   / (double)(unint64_t)((v17 - v13) >> 2);
      v26 = (_QWORD *)a1[10];
      if (v26)
      {
        *v26 = 0xFFEFFFFFFFFFFFFFLL;
        objc_msgSend(v3, "lmCharacterLanguageModel");
        LMLanguageModelConditionalProbability();
        if (v25 < 0.0)
          goto LABEL_28;
      }
    }
    else
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v18 = *(id *)(*(_QWORD *)(a1[8] + 8) + 40);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v29;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v29 != v20)
              objc_enumerationMutation(v18);
            objc_msgSend(v3, "cvnlpCharacterLanguageModel", (_QWORD)v28);
            CVNLPLanguageModelLogConditionalProbabilityForTokenString();
            *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = *(double *)(*(_QWORD *)(a1[6] + 8) + 24)
                                                         + (float)(v22
                                                                 / (float)(unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "count"));
            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v19);
      }

      v23 = (_QWORD *)a1[10];
      if (v23)
      {
        *v23 = 0xFFEFFFFFFFFFFFFFLL;
        objc_msgSend(v3, "cvnlpCharacterLanguageModel");
        CVNLPLanguageModelLogConditionalProbabilityForTokenString();
        if (v24 < 0.0)
        {
          v25 = v24;
LABEL_28:
          *(long double *)a1[10] = exp(v25);
        }
      }
    }
  }
  else
  {
    v27 = (_QWORD *)a1[10];
    if (v27)
      *v27 = 0xFFEFFFFFFFFFFFFFLL;
  }

}

- (BOOL)shouldAllowWhitespaceDelimiterForString:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  BOOL v11;
  double v13;
  double v14;

  v4 = a3;
  -[CRLineWrappingContext locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[CRImageReader languageIsThai:](CRImageReader, "languageIsThai:", v5);

  if (v6)
  {
    v14 = 0.0;
    -[CRLineWrappingContext charLMScoreByAddingString:eosScore:](self, "charLMScoreByAddingString:eosScore:", v4, &v14);
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0.0;
    -[CRLineWrappingContext charLMScoreByAddingString:eosScore:](self, "charLMScoreByAddingString:eosScore:", v9, &v13);
    v11 = v8 <= v10 && v14 <= v13;

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BOOL)isClassifierAvailable
{
  if (self)
    self = (CRLineWrappingContext *)objc_getProperty(self, a2, 112, 1);
  return self != 0;
}

- (BOOL)classifierShouldCorrectOverwrappingWithEvaluation:(int64_t)a3 correctionMode:(int64_t)a4
{
  _BOOL4 v6;
  BOOL v7;
  BOOL v8;

  v6 = -[CRLineWrappingContext isClassifierAvailable](self, "isClassifierAvailable");
  v7 = (unint64_t)a3 < 0xA;
  if (a4 != 1)
    v7 = 0;
  v8 = a4 == 2 || v7;
  if (!v6)
    v8 = 0;
  return a3 >= 2 && v8;
}

- (BOOL)classifierShouldInsertLineBreakForEvaluationResult:(id)a3 threshold:(float)a4
{
  const char *v6;
  id v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  CRLineWrappingClassifierInput *v13;
  SEL v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  double v19;
  BOOL v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (self && objc_getProperty(self, v6, 112, 1))
  {
    objc_msgSend(objc_getProperty(self, v8, 112, 1), "modelLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "featureInTest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRLineWrappingContext lastFeature](self, "lastFeature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageSize");
    +[CRWrappingClassifierFeatureExtractor extractFeatureMultiArrayForLocale:textFeature:lastFeature:evaluation:imageSize:](CRWrappingClassifierFeatureExtractor, "extractFeatureMultiArrayForLocale:textFeature:lastFeature:evaluation:imageSize:", v9, v10, v11, v7);
    v12 = objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = -[CRLineWrappingClassifierInput initWithFeatures:]([CRLineWrappingClassifierInput alloc], "initWithFeatures:", v12);
      v22 = 0;
      objc_msgSend(objc_getProperty(self, v14, 112, 1), "predictionFromFeatures:error:", v13, &v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v22;
      if (v16)
      {
        CROSLogForCategory(4);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          -[NSObject description](v16, "description");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v24 = v18;
          _os_log_impl(&dword_1D4FB8000, v17, OS_LOG_TYPE_ERROR, "Error occured during line wrapping classification: %@", buf, 0xCu);

        }
      }
      if (v15)
      {
        objc_msgSend(v15, "wrappingProbability");
        v20 = v19 <= a4;
      }
      else
      {
        v20 = 1;
      }

    }
    else
    {
      CROSLogForCategory(4);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4FB8000, v16, OS_LOG_TYPE_ERROR, "Could not extract features for classifier", buf, 2u);
      }
      v20 = 1;
    }

  }
  else
  {
    CROSLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4FB8000, v12, OS_LOG_TYPE_FAULT, "Unexpected call when the classifier is unavailable.", buf, 2u);
    }
    v20 = 1;
  }

  return v20;
}

- (void)dealloc
{
  CRLineWrappingContext *v2;
  CRLineWrappingContext *v3;
  void *v4;
  objc_super v5;

  v2 = self;
  if (self)
    self = (CRLineWrappingContext *)objc_getProperty(self, a2, 72, 1);
  v3 = self;
  -[CRLineWrappingContext locale](v2, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRLineWrappingContext removeSubscriber:forLocale:](v3, "removeSubscriber:forLocale:", v2, v4);

  v5.receiver = v2;
  v5.super_class = (Class)CRLineWrappingContext;
  -[CRLineWrappingContext dealloc](&v5, sel_dealloc);
}

- (BOOL)usesWordTokens
{
  void *v2;
  BOOL v3;

  -[CRLineWrappingContext locale](self, "locale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[CRLineWrappingContext _usesWordTokensForLocale:]((uint64_t)CRLineWrappingContext, v2);

  return v3;
}

- (BOOL)shouldConsiderLetterCase
{
  void *v3;
  BOOL v4;
  void *v5;

  -[CRLineWrappingContext locale](self, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[CRImageReader languageIsLatin:](CRImageReader, "languageIsLatin:", v3))
  {
    v4 = 1;
  }
  else
  {
    -[CRLineWrappingContext locale](self, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[CRImageReader languageIsCyrillic:](CRImageReader, "languageIsCyrillic:", v5);

  }
  return v4;
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)locale
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)lineCount
{
  return self->_lineCount;
}

- (BOOL)active
{
  return self->_active;
}

- (void).cxx_destruct
{
  unsigned int *begin;

  objc_storeStrong((id *)&self->_classifier, 0);
  objc_storeStrong((id *)&self->_lrManager, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_text, 0);
  begin = self->_contextTokens.__begin_;
  if (begin)
  {
    self->_contextTokens.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end

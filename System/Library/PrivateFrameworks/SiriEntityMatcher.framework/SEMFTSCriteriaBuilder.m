@implementation SEMFTSCriteriaBuilder

- (SEMFTSCriteriaBuilder)initWithSearchTerms:(id)a3 searchMode:(unsigned __int8)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  SEMFTSCriteriaBuilder *v9;
  uint64_t v10;
  NSArray *searchTerms;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableSet *originAppIdFilters;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableSet *fieldTypeFilters;
  SEMFTSCriteriaBuilder *v20;
  objc_super v22;

  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SEMFTSCriteriaBuilder;
  v9 = -[SEMFTSCriteriaBuilder init](&v22, sel_init);
  if (v9)
  {
    v10 = objc_msgSend_copy(v6, v7, v8);
    searchTerms = v9->_searchTerms;
    v9->_searchTerms = (NSArray *)v10;

    if (!v9->_searchTerms)
    {
      v20 = 0;
      goto LABEL_6;
    }
    v9->_searchMode = a4;
    objc_msgSend_set(MEMORY[0x24BDBCEF0], v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    originAppIdFilters = v9->_originAppIdFilters;
    v9->_originAppIdFilters = (NSMutableSet *)v14;

    objc_msgSend_set(MEMORY[0x24BDBCEF0], v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    fieldTypeFilters = v9->_fieldTypeFilters;
    v9->_fieldTypeFilters = (NSMutableSet *)v18;

  }
  v20 = v9;
LABEL_6:

  return v20;
}

- (id)build
{
  SEMFTSCriteria *v3;
  const char *v4;

  v3 = [SEMFTSCriteria alloc];
  return (id)objc_msgSend_initWithSearchTerms_searchMode_originAppIdFilters_fieldTypeFilters_(v3, v4, (uint64_t)self->_searchTerms, self->_searchMode, self->_originAppIdFilters, self->_fieldTypeFilters);
}

- (BOOL)_setError:(id *)a3 withCode:(int64_t)a4
{
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], a2, (uint64_t)CFSTR("com.apple.siri.vocabulary.search.criteria"), a4, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a3 != 0;
}

- (id)addOriginAppFilterWithAppId:(id)a3 error:(id *)a4
{
  const char *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  SEMFTSCriteriaBuilder *v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend__setError_withCode_(self, v6, (uint64_t)a4, 1);
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend__setError_withCode_(self, v8, (uint64_t)a4, 3);
    goto LABEL_8;
  }
  if (!objc_msgSend_length(v7, v8, v9))
  {
    objc_msgSend__setError_withCode_(self, v10, (uint64_t)a4, 2);
    goto LABEL_8;
  }
  objc_msgSend_convertToUniversalAppId_(SEMAppIdMapper, v10, (uint64_t)v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(self->_originAppIdFilters, v12, (uint64_t)v11);
  v13 = self;

LABEL_9:
  return v13;
}

- (id)addFieldTypeFilterWithNumber:(id)a3 error:(id *)a4
{
  const char *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  SEMFTSCriteriaBuilder *v13;
  NSMutableSet *fieldTypeFilters;
  void *v16;
  const char *v17;

  v7 = a3;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (unsigned __int16)*MEMORY[0x24BE15620];
      if (v10 != objc_msgSend_unsignedShortValue(v7, v8, v9))
      {
        fieldTypeFilters = self->_fieldTypeFilters;
        v16 = (void *)objc_msgSend_copy(v7, v11, v12);
        objc_msgSend_addObject_(fieldTypeFilters, v17, (uint64_t)v16);

        v13 = self;
        goto LABEL_8;
      }
      objc_msgSend__setError_withCode_(self, v11, (uint64_t)a4, 4);
    }
    else
    {
      objc_msgSend__setError_withCode_(self, v8, (uint64_t)a4, 3);
    }
  }
  else
  {
    objc_msgSend__setError_withCode_(self, v6, (uint64_t)a4, 1);
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (id)addFieldTypeFilterWithCustomTypeNumber:(id)a3 error:(id *)a4
{
  const char *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  int v11;
  void *v12;
  void *v14;
  const char *v15;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend__setError_withCode_(self, v6, (uint64_t)a4, 1);
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend__setError_withCode_(self, v8, (uint64_t)a4, 3);
    goto LABEL_12;
  }
  v11 = (unsigned __int16)objc_msgSend_integerValue(v7, v8, v9);
  if ((v11 - 1) >= 2)
    v11 = 0;
  if ((v11 - 1) >= 2)
  {
    objc_msgSend__setError_withCode_(self, v10, (uint64_t)a4, 4);
    goto LABEL_12;
  }
  if (v11 == 1)
  {
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v10, 61355);
  }
  else if (v11 == 2)
  {
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v10, 63372);
  }
  else
  {
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v10, (unsigned __int16)*MEMORY[0x24BE15620]);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addFieldTypeFilterWithNumber_error_(self, v15, (uint64_t)v14, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldTypeFilters, 0);
  objc_storeStrong((id *)&self->_originAppIdFilters, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
}

@end

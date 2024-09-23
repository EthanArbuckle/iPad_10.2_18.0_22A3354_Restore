@implementation SEMFTSCriteria

+ (id)builderWithMatchTerm:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  SEMFTSCriteriaBuilder *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;

  v3 = a3;
  if (objc_msgSend_length(v3, v4, v5))
  {
    v6 = [SEMFTSCriteriaBuilder alloc];
    objc_msgSend_arrayWithObject_(MEMORY[0x24BDBCE30], v7, (uint64_t)v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend_initWithSearchTerms_searchMode_(v6, v9, (uint64_t)v8, 1);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)builderWithLikeTerms:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  SEMFTSCriteriaBuilder *v7;
  const char *v8;
  void *v9;

  v3 = a3;
  v6 = v3;
  if (v3 && objc_msgSend_count(v3, v4, v5))
  {
    v7 = [SEMFTSCriteriaBuilder alloc];
    v9 = (void *)objc_msgSend_initWithSearchTerms_searchMode_(v7, v8, (uint64_t)v6, 2);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (SEMFTSCriteria)initWithSearchTerms:(id)a3 searchMode:(unsigned __int8)a4 originAppIdFilters:(id)a5 fieldTypeFilters:(id)a6
{
  id v11;
  id v12;
  id v13;
  SEMFTSCriteria *v14;
  SEMFTSCriteria *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  objc_super v23;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SEMFTSCriteria;
  v14 = -[SEMFTSCriteria init](&v23, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_searchTerms, a3);
    v15->_searchMode = a4;
    if (objc_msgSend_count(v12, v16, v17))
      v18 = v12;
    else
      v18 = 0;
    objc_storeStrong((id *)&v15->_originAppIdFilters, v18);
    if (objc_msgSend_count(v13, v19, v20))
      v21 = v13;
    else
      v21 = 0;
    objc_storeStrong((id *)&v15->_fieldTypeFilters, v21);
  }

  return v15;
}

- (SEMFTSCriteria)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("You must use +builderWithMatchTerm or +builderWithLikeTerms"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)description
{
  void *v3;
  NSArray *searchTerms;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SEMFTSCriteria;
  -[SEMFTSCriteria description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  searchTerms = self->_searchTerms;
  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v5, self->_searchMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v7, (uint64_t)CFSTR(" searchTerms: %@, searchMode: %@, originAppIdFilters: %@, fieldTypeFilters: %@,"), searchTerms, v6, self->_originAppIdFilters, self->_fieldTypeFilters);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *searchTerms;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  id v9;

  searchTerms = self->_searchTerms;
  v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)searchTerms, CFSTR("t"));
  objc_msgSend_encodeInt_forKey_(v9, v6, self->_searchMode, CFSTR("m"));
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_originAppIdFilters, CFSTR("o"));
  objc_msgSend_encodeObject_forKey_(v9, v8, (uint64_t)self->_fieldTypeFilters, CFSTR("f"));

}

- (SEMFTSCriteria)initWithCoder:(id)a3
{
  id v4;
  SEMFTSCriteria *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSArray *searchTerms;
  const char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  NSSet *originAppIdFilters;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  NSSet *fieldTypeFilters;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SEMFTSCriteria;
  v5 = -[SEMFTSCriteria init](&v28, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v7, v6, CFSTR("t"));
    v8 = objc_claimAutoreleasedReturnValue();
    searchTerms = v5->_searchTerms;
    v5->_searchTerms = (NSArray *)v8;

    v5->_searchMode = objc_msgSend_decodeIntForKey_(v4, v10, (uint64_t)CFSTR("m"));
    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend_setWithObjects_(v11, v14, v12, v13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v16, (uint64_t)v15, CFSTR("o"));
    v17 = objc_claimAutoreleasedReturnValue();
    originAppIdFilters = v5->_originAppIdFilters;
    v5->_originAppIdFilters = (NSSet *)v17;

    v19 = (void *)MEMORY[0x24BDBCF20];
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    objc_msgSend_setWithObjects_(v19, v22, v20, v21, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v23, CFSTR("f"));
    v25 = objc_claimAutoreleasedReturnValue();
    fieldTypeFilters = v5->_fieldTypeFilters;
    v5->_fieldTypeFilters = (NSSet *)v25;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v5 = (void *)objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v9 = objc_msgSend_copyWithZone_(self->_searchTerms, v8, (uint64_t)a3);
  v10 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = v9;

  *(_BYTE *)(v7 + 8) = self->_searchMode;
  v12 = objc_msgSend_copyWithZone_(self->_originAppIdFilters, v11, (uint64_t)a3);
  v13 = *(void **)(v7 + 24);
  *(_QWORD *)(v7 + 24) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_fieldTypeFilters, v14, (uint64_t)a3);
  v16 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = v15;

  return (id)v7;
}

- (BOOL)isEqual:(id)a3
{
  SEMFTSCriteria *v4;
  SEMFTSCriteria *v5;
  const char *v6;
  char isEqualToSearchCriteria;

  v4 = (SEMFTSCriteria *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToSearchCriteria = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToSearchCriteria = objc_msgSend_isEqualToSearchCriteria_(self, v6, (uint64_t)v5);
  }
  else
  {
    isEqualToSearchCriteria = 0;
  }

  return isEqualToSearchCriteria;
}

- (BOOL)isEqualToSearchCriteria:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  NSArray *searchTerms;
  void *v9;
  const char *v10;
  void *v11;
  int isEqualToArray;
  const char *v13;
  uint64_t v14;
  int searchMode;
  const char *v16;
  uint64_t v17;
  NSSet *originAppIdFilters;
  void *v19;
  const char *v20;
  void *v21;
  int isEqualToSet;
  const char *v23;
  uint64_t v24;
  NSSet *fieldTypeFilters;
  void *v26;
  const char *v27;
  void *v28;
  int v29;
  BOOL v30;

  v4 = a3;
  v7 = v4;
  if (!v4)
    goto LABEL_15;
  searchTerms = self->_searchTerms;
  objc_msgSend_searchTerms(v4, v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  if (searchTerms)
  {
    isEqualToArray = objc_msgSend_isEqualToArray_(searchTerms, v10, (uint64_t)v9);

    if (!isEqualToArray)
      goto LABEL_15;
  }
  else
  {

    if (v11)
      goto LABEL_15;
  }
  searchMode = self->_searchMode;
  if (searchMode != objc_msgSend_searchMode(v7, v13, v14))
    goto LABEL_15;
  originAppIdFilters = self->_originAppIdFilters;
  objc_msgSend_originAppIdFilters(v7, v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19;
  if (originAppIdFilters)
  {
    isEqualToSet = objc_msgSend_isEqualToSet_(originAppIdFilters, v20, (uint64_t)v19);

    if (!isEqualToSet)
      goto LABEL_15;
  }
  else
  {

    if (v21)
      goto LABEL_15;
  }
  fieldTypeFilters = self->_fieldTypeFilters;
  objc_msgSend_fieldTypeFilters(v7, v23, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v26;
  if (!fieldTypeFilters)
  {

    if (!v28)
      goto LABEL_13;
LABEL_15:
    v30 = 0;
    goto LABEL_16;
  }
  v29 = objc_msgSend_isEqualToSet_(fieldTypeFilters, v27, (uint64_t)v26);

  if (!v29)
    goto LABEL_15;
LABEL_13:
  v30 = 1;
LABEL_16:

  return v30;
}

- (NSArray)searchTerms
{
  return self->_searchTerms;
}

- (unsigned)searchMode
{
  return self->_searchMode;
}

- (NSSet)originAppIdFilters
{
  return self->_originAppIdFilters;
}

- (NSSet)fieldTypeFilters
{
  return self->_fieldTypeFilters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldTypeFilters, 0);
  objc_storeStrong((id *)&self->_originAppIdFilters, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
}

- (id)commandCriteriaFromFilters
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;

  objc_msgSend__commandCriterionFromOriginAppFilters(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend__commandCriterionFromFieldTypeFilters(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v4 | v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v10 = (void *)objc_msgSend_initWithCapacity_(v8, v9, 2);
    v12 = v10;
    if (v4)
      objc_msgSend_addObject_(v10, v11, v4);
    if (v7)
      objc_msgSend_addObject_(v12, v11, v7);
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v12;
}

- (id)commandCriteriaFromSearchTerms
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  id v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  const char *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend_searchTerms(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v6, v7, v8);
  v11 = (void *)objc_msgSend_initWithCapacity_(v3, v10, v9);

  v14 = objc_msgSend_searchMode(self, v12, v13);
  switch(v14)
  {
    case 2:
      objc_msgSend_searchTerms(self, v15, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend_count(v19, v20, v21);

      if (!v22)
      {
        v17 = qword_25441F970;
        if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v55 = "-[SEMFTSCriteria(Database) commandCriteriaFromSearchTerms]";
          v18 = "%s searchTerms array must NOT be empty for Like operator.";
          goto LABEL_22;
        }
        goto LABEL_23;
      }
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      objc_msgSend_searchTerms(self, v23, v24, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v49, v53, 16);
      if (v27)
      {
        v29 = v27;
        v30 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v50 != v30)
              objc_enumerationMutation(v25);
            objc_msgSend_criterionWithColumnName_LIKEWildcardPattern_(SEMSQLCommandCriterion, v28, 0x2517838D0, *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v11, v33, (uint64_t)v32);

          }
          v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v49, v53, 16);
        }
        while (v29);
      }

      break;
    case 1:
      objc_msgSend_searchTerms(self, v15, v16);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend_count(v34, v35, v36);

      if (v37 != 1)
      {
        v17 = qword_25441F970;
        if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v55 = "-[SEMFTSCriteria(Database) commandCriteriaFromSearchTerms]";
          v18 = "%s searchTerms array must NOT be empty or contain more than one term for Match operator.";
          goto LABEL_22;
        }
LABEL_23:
        v47 = 0;
        goto LABEL_24;
      }
      objc_msgSend_searchTerms(self, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_criterionWithColumnName_MATCHSearchPhrase_(SEMSQLCommandCriterion, v44, 0x2517838D0, v43);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v11, v46, (uint64_t)v45);

      break;
    case 0:
      v17 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v55 = "-[SEMFTSCriteria(Database) commandCriteriaFromSearchTerms]";
        v18 = "%s cannot initialize criteria with undefined search mode.";
LABEL_22:
        _os_log_error_impl(&dword_2462C4000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);
        goto LABEL_23;
      }
      goto LABEL_23;
  }
  v47 = v11;
LABEL_24:

  return v47;
}

- (id)_commandCriterionFromOriginAppFilters
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  const char *v33;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_originAppIdFilters(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    return 0;
  v7 = (void *)v4;
  objc_msgSend_originAppIdFilters(self, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_count(v8, v9, v10);

  if (!v11)
    return 0;
  v14 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend_originAppIdFilters(self, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_count(v15, v16, v17);
  objc_msgSend_arrayWithCapacity_(v14, v19, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend_originAppIdFilters(self, v21, v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v36, v40, 16);
  if (v28)
  {
    v30 = v28;
    v31 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v37 != v31)
          objc_enumerationMutation(v26);
        objc_msgSend_addObject_(v20, v29, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
      }
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v36, v40, 16);
    }
    while (v30);
  }

  objc_msgSend_criterionWithColumnName_INColumnValues_(SEMSQLCommandCriterion, v33, 0x251783870, v20);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (id)_commandCriterionFromFieldTypeFilters
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  const char *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_fieldTypeFilters(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    return 0;
  v7 = (void *)v4;
  objc_msgSend_fieldTypeFilters(self, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_count(v8, v9, v10);

  if (!v11)
    return 0;
  v14 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend_fieldTypeFilters(self, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_count(v15, v16, v17);
  objc_msgSend_arrayWithCapacity_(v14, v19, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend_fieldTypeFilters(self, v21, v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v33, v37, 16);
  if (v25)
  {
    v27 = v25;
    v28 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v34 != v28)
          objc_enumerationMutation(v23);
        objc_msgSend_addObject_(v20, v26, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
      }
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v33, v37, 16);
    }
    while (v27);
  }

  objc_msgSend_criterionWithColumnName_INColumnValues_(SEMSQLCommandCriterion, v30, 0x2517838B0, v20);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

@end

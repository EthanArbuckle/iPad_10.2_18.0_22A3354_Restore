@implementation SEMSpanMatchQuery

- (SEMSpanMatchQuery)initWithQuery:(const void *)a3 locale:(int64_t)a4 originalText:(id)a5 asrHypothesis:(id)a6
{
  id v11;
  id v12;
  SEMSpanMatchQuery *v13;
  SEMSpanMatchQuery *v14;
  uint64_t v15;
  Query *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v21;
  objc_super v23;

  v11 = a5;
  v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SEMSpanMatchQuery;
  v13 = -[SEMSpanMatchQuery init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    v16 = *(Query **)a3;
    v15 = *((_QWORD *)a3 + 1);
    if (v15)
    {
      v17 = (unint64_t *)(v15 + 8);
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    cntrl = (std::__shared_weak_count *)v13->_query.__cntrl_;
    v13->_query.__ptr_ = v16;
    v13->_query.__cntrl_ = (__shared_weak_count *)v15;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v21 = __ldaxr(p_shared_owners);
      while (__stlxr(v21 - 1, p_shared_owners));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    v14->_locale = a4;
    objc_storeStrong((id *)&v14->_originalText, a5);
    objc_storeStrong((id *)&v14->_asrHypothesis, a6);
  }

  return v14;
}

- (SEMSpanMatchQuery)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)locale
{
  return sub_24630E148(self->_locale, a2);
}

- (id)originalText
{
  return self->_originalText;
}

- (unsigned)tokenCount
{
  return -1431655765 * ((*((_QWORD *)self->_query.__ptr_ + 1) - *(_QWORD *)self->_query.__ptr_) >> 4);
}

- (void)query
{
  return &self->_query;
}

- (void)setEntityFilters:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  NSObject *v17;
  SEMSpanMatchQuery *v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2462FD438((_QWORD *)self->_query.__ptr_ + 11);
  sub_2462FD438((_QWORD *)self->_query.__ptr_ + 16);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v4;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v23, v33, 16);
  if (v8)
  {
    v10 = *(_QWORD *)v24;
    *(_QWORD *)&v9 = 136315394;
    v21 = v9;
    v22 = v5;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
        if (objc_msgSend_conformsToProtocol_(v12, v7, (uint64_t)&unk_25756D068, v21)
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          if (objc_msgSend_entityType(v12, v13, v14) == 1)
          {
            objc_msgSend__addCascadeEntityFilter_(self, v15, (uint64_t)v12);
          }
          else
          {
            v17 = qword_25441F970;
            if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v21;
              v28 = "-[SEMSpanMatchQuery setEntityFilters:]";
              v29 = 2112;
              v30 = v12;
              _os_log_error_impl(&dword_2462C4000, v17, OS_LOG_TYPE_ERROR, "%s Ignoring unsupported filter %@", buf, 0x16u);
            }
          }
        }
        else
        {
          v16 = (id)qword_25441F970;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v18 = self;
            NSStringFromProtocol((Protocol *)&unk_25756D068);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v28 = "-[SEMSpanMatchQuery setEntityFilters:]";
            v29 = 2112;
            v30 = v19;
            v31 = 2112;
            v32 = v12;
            _os_log_error_impl(&dword_2462C4000, v16, OS_LOG_TYPE_ERROR, "%s Ignoring filter not conforming to %@: %@", buf, 0x20u);

            self = v18;
            v5 = v22;
          }

        }
        ++v11;
      }
      while (v8 != v11);
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v23, v33, 16);
      v8 = v20;
    }
    while (v20);
  }

}

- (void)_addCascadeEntityFilter:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  Query *ptr;
  const char *v12;
  __int16 v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend_itemType(v4, v5, v6);
    sub_2462FD49C((float *)self->_query.__ptr_ + 22, v7, v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend_fieldType(v4, v8, v9);
      sub_2462FD49C((float *)self->_query.__ptr_ + 32, v10, v10);
      ptr = self->_query.__ptr_;
      v13 = objc_msgSend_itemTypeForFieldType_error_(MEMORY[0x24BE5B238], v12, v10, 0);
      sub_2462FD49C((float *)ptr + 22, v13, v13);
    }
    else
    {
      v14 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v15 = 136315394;
        v16 = "-[SEMSpanMatchQuery _addCascadeEntityFilter:]";
        v17 = 2112;
        v18 = v4;
        _os_log_error_impl(&dword_2462C4000, v14, OS_LOG_TYPE_ERROR, "%s Ignoring unexpected Cascade entity filter: %@", (uint8_t *)&v15, 0x16u);
      }
    }
  }

}

- (void)setIncludedKVItemTypes:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v8 = objc_msgSend_count(v4, v6, v7);
  v10 = (void *)objc_msgSend_initWithCapacity_(v5, v9, v8);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v4;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v20, v24, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v11);
        objc_msgSend_filterFromKVItemTypeNumber_(SEMCascadeItemTypeFilter, v13, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16), (_QWORD)v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend_addObject_(v10, v17, (uint64_t)v18);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v20, v24, 16);
    }
    while (v14);
  }

  objc_msgSend_setEntityFilters_(self, v19, (uint64_t)v10);
}

- (void)setIncludedKVFieldTypes:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v8 = objc_msgSend_count(v4, v6, v7);
  v10 = (void *)objc_msgSend_initWithCapacity_(v5, v9, v8);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v4;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v20, v24, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v11);
        objc_msgSend_filterFromKVFieldTypeNumber_(SEMCascadeFieldTypeFilter, v13, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16), (_QWORD)v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend_addObject_(v10, v17, (uint64_t)v18);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v20, v24, 16);
    }
    while (v14);
  }

  objc_msgSend_setEntityFilters_(self, v19, (uint64_t)v10);
}

- (BOOL)isCascadeItemTypeIncluded:(unsigned __int16)a3
{
  Query *ptr;

  ptr = self->_query.__ptr_;
  return !*((_QWORD *)ptr + 14) || sub_2462FDA2C((_QWORD *)ptr + 11, a3) != 0;
}

- (BOOL)isCascadeFieldTypeIncluded:(unsigned __int16)a3
{
  Query *ptr;

  ptr = self->_query.__ptr_;
  return !*((_QWORD *)ptr + 19) || sub_2462FDA2C((_QWORD *)ptr + 16, a3) != 0;
}

+ (void)initialize
{
  if (qword_25441F968 != -1)
    dispatch_once(&qword_25441F968, &unk_25175EFF8);
}

- (id)description
{
  void *v2;
  NSString *originalText;
  void *v4;
  const char *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  originalText = self->_originalText;
  sub_24630F170(self->_locale, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v2, v5, (uint64_t)CFSTR("\"%@\" locale: %@"), originalText, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asrHypothesis, 0);
  objc_storeStrong((id *)&self->_originalText, 0);
  sub_2462D3524((uint64_t)&self->_query);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end

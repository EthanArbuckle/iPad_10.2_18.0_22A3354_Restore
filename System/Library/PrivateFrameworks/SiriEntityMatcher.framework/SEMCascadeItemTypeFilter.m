@implementation SEMCascadeItemTypeFilter

+ (id)filterFromKVItemTypeNumber:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  KVItemTypeFromNumber();
  v4 = KVItemTypeToCascadeItemType();
  if ((_DWORD)v4 == (unsigned __int16)*MEMORY[0x24BE15620])
  {
    v5 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "+[SEMCascadeItemTypeFilter filterFromKVItemTypeNumber:]";
      v16 = 2112;
      v17 = v3;
      _os_log_error_impl(&dword_2462C4000, v5, OS_LOG_TYPE_ERROR, "%s Ignoring unsupported KVItemType filter: %@", buf, 0x16u);
    }
    v6 = 0;
  }
  else
  {
    v7 = v4;
    v8 = objc_alloc((Class)objc_opt_class());
    v13 = 0;
    v6 = (void *)objc_msgSend_initWithItemType_error_(v8, v9, v7, &v13);
    v10 = v13;
    if (!v6)
    {
      v11 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "+[SEMCascadeItemTypeFilter filterFromKVItemTypeNumber:]";
        v16 = 2112;
        v17 = v10;
        _os_log_error_impl(&dword_2462C4000, v11, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }
    }

  }
  return v6;
}

- (SEMCascadeItemTypeFilter)initWithItemType:(unsigned __int16)a3 error:(id *)a4
{
  uint64_t v5;
  SEMCascadeItemTypeFilter *v6;
  const char *v7;
  SEMCascadeItemTypeFilter *v8;
  const char *v9;
  SEMCascadeItemTypeFilter *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  objc_super v22;
  uint64_t v23;
  _QWORD v24[2];

  v5 = a3;
  v24[1] = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)SEMCascadeItemTypeFilter;
  v6 = -[SEMCascadeItemTypeFilter init](&v22, sel_init);
  v8 = v6;
  if (v6 && (v6->_itemType = v5, (objc_msgSend_isValidItemType_(MEMORY[0x24BE5B238], v7, v5) & 1) == 0))
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v23 = *MEMORY[0x24BDD0BA0];
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x24BE5B238], v9, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v12, v14, (uint64_t)CFSTR("Cannot create filter with invalid itemType: %@"), v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v15;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v16, (uint64_t)v24, &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v11, v18, (uint64_t)CFSTR("com.apple.siri.inference.SEMSpanMatcher"), 8, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a4 && v19)
      *a4 = objc_retainAutorelease(v19);

    v10 = 0;
  }
  else
  {
    v10 = v8;
  }

  return v10;
}

- (unsigned)entityType
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  SEMCascadeItemTypeFilter *v4;
  SEMCascadeItemTypeFilter *v5;
  const char *v6;
  char isEqualToCascadeItemTypeFilter;

  v4 = (SEMCascadeItemTypeFilter *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToCascadeItemTypeFilter = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToCascadeItemTypeFilter = objc_msgSend_isEqualToCascadeItemTypeFilter_(self, v6, (uint64_t)v5);
  }
  else
  {
    isEqualToCascadeItemTypeFilter = 0;
  }

  return isEqualToCascadeItemTypeFilter;
}

- (BOOL)isEqualToCascadeItemTypeFilter:(id)a3
{
  int itemType;

  itemType = self->_itemType;
  return itemType == objc_msgSend_itemType(a3, a2, (uint64_t)a3);
}

- (id)description
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SEMCascadeItemTypeFilter;
  -[SEMCascadeItemTypeFilter description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x24BE5B238], v4, self->_itemType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v6, (uint64_t)CFSTR(" itemType: %@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  const char *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], a2, self->_itemType);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_hash(v2, v3, v4);

  return v5;
}

- (unsigned)itemType
{
  return self->_itemType;
}

@end

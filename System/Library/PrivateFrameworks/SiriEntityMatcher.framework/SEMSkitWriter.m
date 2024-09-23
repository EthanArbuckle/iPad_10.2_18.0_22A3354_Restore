@implementation SEMSkitWriter

+ (void)initialize
{
  sub_2462CE00C();
  if (qword_25441F968 != -1)
    dispatch_once(&qword_25441F968, &unk_25175EFF8);
}

- (SEMSkitWriter)initWithSkitDirectoryURL:(id)a3 dataProtectionClass:(int)a4 flushThreshold:(unint64_t)a5
{
  uint64_t v6;
  id v8;
  const char *v9;
  uint64_t v10;
  SEMSkitWriter *v11;
  uint64_t v12;
  NSURL *directoryURL;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  SEMSkitInfo *info;
  const char *v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t flushThreshold;
  const char *v25;
  const char *v26;
  unint64_t v27;
  const char *v28;
  int v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t value;
  SEMSkitWriter *v34;
  NSObject *v35;
  NSObject *v36;
  std::string v38;
  std::string v39;
  char *v40;
  id v41;
  objc_super v42;
  std::__fs::filesystem::path __p;
  std::__fs::filesystem::path v44;
  std::string buf;
  uint64_t v46;

  v6 = *(_QWORD *)&a4;
  v46 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v42.receiver = self;
  v42.super_class = (Class)SEMSkitWriter;
  v11 = -[SEMSkitWriter init](&v42, sel_init);
  if (v11)
  {
    v12 = objc_msgSend_copy(v8, v9, v10);
    directoryURL = v11->_directoryURL;
    v11->_directoryURL = (NSURL *)v12;

    v15 = (uint64_t)v11->_directoryURL;
    if (v15)
    {
      v41 = 0;
      objc_msgSend_writableSkitInfoAtDirectory_error_(SEMSkitInfo, v14, v15, &v41);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v41;
      info = v11->_info;
      v11->_info = (SEMSkitInfo *)v16;

      if (v11->_info)
      {
        v11->_flushThreshold = a5;
        v11->_inTransaction = 0;
        objc_msgSend_path(v11->_directoryURL, v19, v20);
        v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v40 = (char *)objc_msgSend_UTF8String(v21, v22, v23);
        flushThreshold = v11->_flushThreshold;
        sub_2462EA394(v25, &v39);
        sub_2462EA444(v26, &v38);
        v27 = sub_2462F284C();
        v29 = (int)v28;
        v31 = objc_msgSend_indexFeatures(v11, v28, v30);
        v32 = operator new();
        sub_2462EBB80(&buf, &v40);
        v44.__pn_ = v39;
        __p.__pn_ = v38;
        memset(&v38, 0, sizeof(v38));
        memset(&v39, 0, sizeof(v39));
        sub_2462E435C(v32, (uint64_t)&buf, flushThreshold, v6, &v44, &__p, v27, v29, v31);
        if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__pn_.__r_.__value_.__l.__data_);
        if (SHIBYTE(v44.__pn_.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v44.__pn_.__r_.__value_.__l.__data_);
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
          operator delete(buf.__r_.__value_.__l.__data_);
        value = (uint64_t)v11->_indexer.__ptr_.__value_;
        v11->_indexer.__ptr_.__value_ = (Indexer *)v32;
        if (value)
          sub_24630118C(value);
        if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v38.__r_.__value_.__l.__data_);
        if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v39.__r_.__value_.__l.__data_);

        goto LABEL_17;
      }
      v36 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"-[SEMSkitWriter initWithSkitDirectoryURL:dataProtectionClass:flushThreshold:]";
        WORD2(buf.__r_.__value_.__r.__words[1]) = 2112;
        *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v17;
        _os_log_error_impl(&dword_2462C4000, v36, OS_LOG_TYPE_ERROR, "%s Failed to create a _info under SEMSkitWriter: %@", (uint8_t *)&buf, 0x16u);
      }

    }
    else
    {
      v35 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"-[SEMSkitWriter initWithSkitDirectoryURL:dataProtectionClass:flushThreshold:]";
        _os_log_error_impl(&dword_2462C4000, v35, OS_LOG_TYPE_ERROR, "%s Cannot create SKIT writer with nil directory URL.", (uint8_t *)&buf, 0xCu);
      }
    }
    v34 = 0;
    goto LABEL_24;
  }
LABEL_17:
  v34 = v11;
LABEL_24:

  return v34;
}

- (SEMSkitWriter)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)_beginTransactionWithError:(id *)a3
{
  int v4;
  NSObject *v5;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_2462FFD70;
  v7[3] = &unk_25175F020;
  v7[4] = self;
  v4 = sub_2462DA56C((uint64_t)"-[SEMSkitWriter _beginTransactionWithError:]", a3, v7);
  if (v4)
  {
    self->_inTransaction = 1;
    v5 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[SEMSkitWriter _beginTransactionWithError:]";
      _os_log_debug_impl(&dword_2462C4000, v5, OS_LOG_TYPE_DEBUG, "%s SKIT transaction activated", buf, 0xCu);
    }
  }
  return v4;
}

- (BOOL)commitChanges:(BOOL *)a3 error:(id *)a4
{
  const char *v7;
  NSObject *v8;
  const __CFString *v9;
  BOOL v10;
  NSObject *v11;
  _QWORD v13[6];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!self->_inTransaction)
  {
    v11 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v18) = 136315138;
      *(_QWORD *)((char *)&v18 + 4) = "-[SEMSkitWriter commitChanges:error:]";
      _os_log_debug_impl(&dword_2462C4000, v11, OS_LOG_TYPE_DEBUG, "%s No changes to commit", (uint8_t *)&v18, 0xCu);
      if (!a3)
        return 1;
    }
    else if (!a3)
    {
      return 1;
    }
    *a3 = 0;
    return 1;
  }
  *(_QWORD *)&v18 = 0;
  *((_QWORD *)&v18 + 1) = &v18;
  v19 = 0x2020000000;
  v20 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_2462FFF88;
  v13[3] = &unk_251782DA0;
  v13[4] = self;
  v13[5] = &v18;
  if (sub_2462DA56C((uint64_t)"-[SEMSkitWriter commitChanges:error:]", a4, v13)
    && objc_msgSend_commitUpdates_(self->_info, v7, (uint64_t)a4))
  {
    self->_inTransaction = 0;
    v8 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      if (*(_BYTE *)(*((_QWORD *)&v18 + 1) + 24))
        v9 = CFSTR(" (MERGE REQUIRED)");
      else
        v9 = &stru_251783AF0;
      *(_DWORD *)buf = 136315394;
      v15 = "-[SEMSkitWriter commitChanges:error:]";
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_2462C4000, v8, OS_LOG_TYPE_INFO, "%s SKIT transaction committed%@", buf, 0x16u);
    }
    if (a3)
      *a3 = *(_BYTE *)(*((_QWORD *)&v18 + 1) + 24);
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v18, 8);
  return v10;
}

- (BOOL)rollbackChanges:(id *)a3
{
  const char *v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v10[5];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (self->_inTransaction)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_2463002D0;
    v10[3] = &unk_25175F020;
    v10[4] = self;
    v6 = sub_2462DA56C((uint64_t)"-[SEMSkitWriter rollbackChanges:]", a3, v10);
    if (v6)
    {
      objc_msgSend_rollbackUpdates(self->_info, v4, v5);
      self->_inTransaction = 0;
      v7 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "-[SEMSkitWriter rollbackChanges:]";
        _os_log_impl(&dword_2462C4000, v7, OS_LOG_TYPE_INFO, "%s SKIT transaction aborted", buf, 0xCu);
      }
    }
  }
  else
  {
    v8 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[SEMSkitWriter rollbackChanges:]";
      _os_log_debug_impl(&dword_2462C4000, v8, OS_LOG_TYPE_DEBUG, "%s No changes to rollback", buf, 0xCu);
    }
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (int64_t)indexLocale
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  int64_t v8;

  objc_msgSend_localeType(self->_info, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3)
  {
    v7 = objc_msgSend_unsignedShortValue(v3, v4, v5);
    if ((unint64_t)v7 - 1 >= 0x2C)
      v8 = 0;
    else
      v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unsigned)indexFeatures
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  unsigned __int16 v6;

  objc_msgSend_indexFeatures(self->_info, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_unsignedShortValue(v3, v4, v5);

  return v6;
}

- (BOOL)setTransactionLocale:(int64_t)a3 assetPath:(id)a4 error:(id *)a5
{
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  char v28;
  SEMSkitInfo *info;
  void *v30;
  const char *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  size_t v36;
  _QWORD v38[8];
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  if ((unint64_t)(a3 - 1) >= 0x2C)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v8, 0x251784730, 1, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2462F1D28(a5, v27);

    goto LABEL_6;
  }
  v13 = objc_msgSend_indexLocale(self, v8, v9);
  if (v13 != a3)
  {
    objc_msgSend_localeType(self->_info, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      sub_24630F330(a3, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      sub_24630F330(v13, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v16, v20, (uint64_t)CFSTR("Attempting to set SKIT transaction locale: %@ which is incompatible with the existing index locale: %@. The index must be cleared and rebuilt following a locale change."), v17, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x24BDD1540];
      v39 = *MEMORY[0x24BDD0FC8];
      v40[0] = v21;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v23, (uint64_t)v40, &v39, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v22, v25, 0x251784730, 3, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      sub_2462F1D28(a5, v26);

LABEL_6:
      v28 = 0;
      goto LABEL_12;
    }
    info = self->_info;
    sub_24630F13C(a3, v15);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updateLocaleType_(info, v31, (uint64_t)v30);

  }
  if (v10)
  {
    objc_msgSend_path(v10, v11, v12);
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v35 = (const char *)objc_msgSend_UTF8String(v32, v33, v34);
    v36 = strlen(v35);

  }
  else
  {
    v36 = 0;
    v35 = 0;
  }
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = sub_246300674;
  v38[3] = &unk_251782DC8;
  v38[4] = self;
  v38[5] = a3;
  v38[6] = v35;
  v38[7] = v36;
  v28 = sub_2462DA56C((uint64_t)"-[SEMSkitWriter setTransactionLocale:assetPath:error:]", a5, v38);
LABEL_12:

  return v28;
}

- (BOOL)setTransactionIndexFeatures:(unsigned __int16)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t v10;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  SEMSkitInfo *info;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  if (self->_indexer.__ptr_.__value_->index_locale)
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v29 = *MEMORY[0x24BDD0FC8];
    v30[0] = CFSTR("Transaction locale already set. -setTransactionIndexFeatures: must be called before -setTransactionLocale:.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v30, &v29, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v5, v7, 0x251784730, 8, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2462F1D28(a4, v8);

    return 0;
  }
  v10 = a3;
  v12 = objc_msgSend_indexFeatures(self, a2, a3);
  if ((_DWORD)v12 != (_DWORD)v10)
  {
    v15 = v12;
    objc_msgSend_indexFeatures(self->_info, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v17, (uint64_t)CFSTR("Attempting to set SKIT transaction index features: %u incompatible with the built index features: %u. The index must be cleared and rebuilt following an index features change."), v10, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x24BDD1540];
      v27 = *MEMORY[0x24BDD0FC8];
      v28 = v18;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v20, (uint64_t)&v28, &v27, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v19, v22, 0x251784730, 4, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      sub_2462F1D28(a4, v23);

      return 0;
    }
    info = self->_info;
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v17, v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updateIndexFeatures_(info, v26, (uint64_t)v25);

  }
  return 1;
}

- (BOOL)addCascadeSharedItemContent:(id)a3 allMetaContent:(id)a4 sourceIdentifier:(id)a5 externalId:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  const char *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  size_t v22;
  char v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  _QWORD v35[5];
  id v36;
  id v37;
  _QWORD *v38;
  const char *v39;
  size_t v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  void *v44;
  _QWORD v45[3];

  v45[2] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v45[0] = 0;
  v45[1] = 0;
  objc_msgSend_getUUIDBytes_(v15, v16, (uint64_t)v45);
  if (!v14)
  {
    v22 = 0;
    v21 = 0;
    if (v12)
      goto LABEL_3;
LABEL_8:
    v24 = (void *)MEMORY[0x24BDD1540];
    v43 = *MEMORY[0x24BDD0FC8];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v17, (uint64_t)CFSTR("Cannot add Cascade item with nil sharedItemContent. externalId: %@ sourceIdentifier: %@"), v15, v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v25;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v26, (uint64_t)&v44, &v43, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v24, v28, 0x251784730, 7, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2462F1D28(a7, v29);

LABEL_10:
    v23 = 0;
    goto LABEL_11;
  }
  v18 = objc_retainAutorelease(v14);
  v21 = (const char *)objc_msgSend_UTF8String(v18, v19, v20);
  v22 = strlen(v21);
  if (!v12)
    goto LABEL_8;
LABEL_3:
  if (!self->_inTransaction && !objc_msgSend__beginTransactionWithError_(self, v17, (uint64_t)a7))
    goto LABEL_10;
  if (!self->_indexer.__ptr_.__value_->index_locale)
  {
    v30 = (void *)MEMORY[0x24BDD1540];
    v41 = *MEMORY[0x24BDD0FC8];
    v42 = CFSTR("Transaction locale not set. -setTransactionLocale: must be called successfully before adding items.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v17, (uint64_t)&v42, &v41, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v30, v32, 0x251784730, 2, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2462F1D28(a7, v33);

    goto LABEL_10;
  }
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = sub_246300C68;
  v35[3] = &unk_251782DF0;
  v35[4] = self;
  v38 = v45;
  v36 = v12;
  v37 = v13;
  v39 = v21;
  v40 = v22;
  v23 = sub_2462DA56C((uint64_t)"-[SEMSkitWriter addCascadeSharedItemContent:allMetaContent:sourceIdentifier:externalId:error:]", a7, v35);

LABEL_11:
  return v23;
}

- (BOOL)removeItemWithExternalId:(id)a3 error:(id *)a4
{
  const char *v6;
  int v7;
  _QWORD v9[6];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = 0;
  v10[1] = 0;
  objc_msgSend_getUUIDBytes_(a3, a2, (uint64_t)v10);
  if (self->_inTransaction || (v7 = objc_msgSend__beginTransactionWithError_(self, v6, (uint64_t)a4)) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_246300D50;
    v9[3] = &unk_251782E18;
    v9[4] = self;
    v9[5] = v10;
    LOBYTE(v7) = sub_2462DA56C((uint64_t)"-[SEMSkitWriter removeItemWithExternalId:error:]", a4, v9);
  }
  return v7;
}

- (BOOL)clearWithError:(id *)a3
{
  const char *v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  _QWORD v10[5];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (self->_inTransaction || objc_msgSend__beginTransactionWithError_(self, a2, (uint64_t)a3))
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_246300EE0;
    v10[3] = &unk_25175F020;
    v10[4] = self;
    v7 = sub_2462DA56C((uint64_t)"-[SEMSkitWriter clearWithError:]", a3, v10);
    if (v7)
    {
      objc_msgSend_clear(self->_info, v5, v6);
      v8 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "-[SEMSkitWriter clearWithError:]";
        _os_log_debug_impl(&dword_2462C4000, v8, OS_LOG_TYPE_DEBUG, "%s skit index cleared.", buf, 0xCu);
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)cleanup:(id *)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_246300F50;
  v4[3] = &unk_25175F020;
  v4[4] = self;
  return sub_2462DA56C((uint64_t)"-[SEMSkitWriter cleanup:]", a3, v4);
}

- (BOOL)shouldMerge:(BOOL *)a3 error:(id *)a4
{
  int v7;
  _QWORD v9[6];

  if (self->_inTransaction || (v7 = objc_msgSend__beginTransactionWithError_(self, a2, (uint64_t)a4)) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_246300FF0;
    v9[3] = &unk_251782E18;
    v9[4] = self;
    v9[5] = a3;
    LOBYTE(v7) = sub_2462DA56C((uint64_t)"-[SEMSkitWriter shouldMerge:error:]", a4, v9);
  }
  return v7;
}

- (unint64_t)flushThreshold
{
  return self->_flushThreshold;
}

- (void).cxx_destruct
{
  Indexer *value;

  value = self->_indexer.__ptr_.__value_;
  self->_indexer.__ptr_.__value_ = 0;
  if (value)
    sub_24630118C((uint64_t)value);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end

@implementation SEMDictionaryLog

+ (void)initialize
{
  if (qword_25441F968 != -1)
    dispatch_once(&qword_25441F968, &unk_25175EFF8);
}

- (SEMDictionaryLog)initWithFilename:(id)a3 directory:(id)a4 readOnly:(BOOL)a5 error:(id *)a6
{
  return (SEMDictionaryLog *)objc_msgSend_initWithFilename_protectionClass_directory_readOnly_create_error_(self, a2, (uint64_t)a3, 0xFFFFFFFFLL, a4, a5, 1, a6);
}

- (SEMDictionaryLog)initWithFilename:(id)a3 protectionClass:(int)a4 directory:(id)a5 readOnly:(BOOL)a6 create:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  const char *v16;
  SEMDictionaryLog *v17;
  uint64_t v18;
  NSURL *logFileURL;
  const char *v20;
  SEMDictionaryLog *v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  void *v28;
  objc_super v30;
  uint64_t v31;
  _QWORD v32[2];

  v9 = a7;
  v10 = a6;
  v32[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v30.receiver = self;
  v30.super_class = (Class)SEMDictionaryLog;
  v17 = -[SEMDictionaryLog init](&v30, sel_init);
  if (!v17)
    goto LABEL_5;
  if (!v14 || !v15)
  {
    v22 = (void *)MEMORY[0x24BDD1540];
    v31 = *MEMORY[0x24BDD0FC8];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v16, (uint64_t)CFSTR("Invalid {filename: %@, directory: %@}"), v14, v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v23;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v24, (uint64_t)v32, &v31, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v22, v26, (uint64_t)CFSTR("com.apple.SEMDictionaryLog"), 2, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (a8 && v27)
      *a8 = objc_retainAutorelease(v27);

    goto LABEL_10;
  }
  objc_msgSend_fileURLWithPath_relativeToURL_(MEMORY[0x24BDBCF48], v16, (uint64_t)v14, v15);
  v18 = objc_claimAutoreleasedReturnValue();
  logFileURL = v17->_logFileURL;
  v17->_logFileURL = (NSURL *)v18;

  v17->_protectionClass = a4;
  if (!objc_msgSend__loadLogOrCreate_readOnly_error_(v17, v20, v9, v10, a8))
  {
LABEL_10:
    v21 = 0;
    goto LABEL_11;
  }
LABEL_5:
  v21 = v17;
LABEL_11:

  return v21;
}

- (SEMDictionaryLog)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)_loadLogOrCreate:(BOOL)a3 readOnly:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  void *v9;
  NSURL *logFileURL;
  NSDictionary *v11;
  id v12;
  NSDictionary *log;
  const char *v14;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  NSObject *v39;
  NSDictionary *v40;
  char v41;
  NSObject *v42;
  NSDictionary *v43;
  NSDictionary *v44;
  const char *v45;
  uint64_t v46;
  void *v48;
  id *v49;
  id v50;
  uint64_t v51;
  id v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  id v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  _QWORD v64[3];

  v6 = a4;
  v64[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_path(self->_logFileURL, a2, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  logFileURL = self->_logFileURL;
  v50 = 0;
  sub_2462ED8D0((uint64_t)logFileURL, (const char *)!v6, (uint64_t)&v50);
  v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v12 = v50;
  log = self->_log;
  self->_log = v11;

  if (!self->_log)
  {
    v27 = objc_msgSend_code(v12, v14, v15);
    v28 = qword_25441F970;
    if (v27 == 260)
    {
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v54 = "-[SEMDictionaryLog _loadLogOrCreate:readOnly:error:]";
        v55 = 2112;
        v56 = (uint64_t)v9;
        _os_log_debug_impl(&dword_2462C4000, v28, OS_LOG_TYPE_DEBUG, "%s No prior log found at path: %@", buf, 0x16u);
      }
      v30 = (void *)MEMORY[0x24BDD1540];
      v59 = *MEMORY[0x24BDD1398];
      v60 = v12;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v29, (uint64_t)&v60, &v59, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v30, v32, (uint64_t)CFSTR("com.apple.SEMDictionaryLog"), 6, v31);
LABEL_26:
      v46 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v46;
      if (a3)
        goto LABEL_14;
LABEL_27:
      v41 = 0;
      if (a5 && v12)
      {
        v12 = objc_retainAutorelease(v12);
        v41 = 0;
        *a5 = v12;
      }
      goto LABEL_30;
    }
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v54 = "-[SEMDictionaryLog _loadLogOrCreate:readOnly:error:]";
      v55 = 2112;
      v56 = (uint64_t)v9;
      v57 = 2112;
      v58 = v12;
      _os_log_error_impl(&dword_2462C4000, v28, OS_LOG_TYPE_ERROR, "%s Failed to read prior log file at path: %@ error: %@", buf, 0x20u);
      if (v12)
        goto LABEL_22;
    }
    else if (v12)
    {
LABEL_22:
      v51 = *MEMORY[0x24BDD1398];
      v52 = v12;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v45, (uint64_t)&v52, &v51, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v45, (uint64_t)CFSTR("com.apple.SEMDictionaryLog"), 7, v31);
      goto LABEL_26;
    }
    v31 = 0;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v6)
      goto LABEL_16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_16;
    v49 = a5;
    v48 = (void *)MEMORY[0x24BDD1540];
    v63 = *MEMORY[0x24BDD0FC8];
    v16 = (void *)MEMORY[0x24BDD17C8];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v16, v21, (uint64_t)CFSTR("Expected mutable plist class (%@) but received class (%@) for object: %@ at path: %@"), v18, v20, self->_log, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v22;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v23, (uint64_t)v64, &v63, 1);
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v48, v25, (uint64_t)CFSTR("com.apple.SEMDictionaryLog"), 5, v24);
    v26 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v24;
  }
  else
  {
    v49 = a5;
    v33 = (void *)MEMORY[0x24BDD1540];
    v61 = *MEMORY[0x24BDD0FC8];
    v34 = (void *)MEMORY[0x24BDD17C8];
    v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v34, v36, (uint64_t)CFSTR("Unexpected plist class (%@) of object: %@ at path: %@"), v18, self->_log, v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v20;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v37, (uint64_t)&v62, &v61, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v33, v38, (uint64_t)CFSTR("com.apple.SEMDictionaryLog"), 5, v22);
    v26 = objc_claimAutoreleasedReturnValue();
  }

  v39 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v54 = "-[SEMDictionaryLog _loadLogOrCreate:readOnly:error:]";
    v55 = 2112;
    v56 = v26;
    _os_log_error_impl(&dword_2462C4000, v39, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  v12 = (id)v26;
  a5 = v49;
  if (!a3)
    goto LABEL_27;
LABEL_14:
  if (v6)
  {
    v40 = self->_log;
    self->_log = (NSDictionary *)MEMORY[0x24BDBD1B8];

LABEL_16:
    v41 = 1;
    goto LABEL_30;
  }
  v42 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v54 = "-[SEMDictionaryLog _loadLogOrCreate:readOnly:error:]";
    v55 = 2112;
    v56 = (uint64_t)v9;
    _os_log_impl(&dword_2462C4000, v42, OS_LOG_TYPE_INFO, "%s Initializing empty log file at path: %@", buf, 0x16u);
  }
  v43 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v44 = self->_log;
  self->_log = v43;

  v41 = sub_2462ED6E4((uint64_t)self->_log, self->_logFileURL, self->_protectionClass, (uint64_t)a5);
LABEL_30:

  return v41;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SEMDictionaryLog;
  -[SEMDictionaryLog description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(self->_logFileURL, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v7, (uint64_t)CFSTR(" logFile: %@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isReadOnly
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) == 0;
}

- (unint64_t)count
{
  uint64_t v2;

  return objc_msgSend_count(self->_log, a2, v2);
}

- (id)allKeys
{
  uint64_t v2;

  return (id)objc_msgSend_allKeys(self->_log, a2, v2);
}

- (id)objectForKey:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_objectForKey_(self->_log, a2, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_copy(v3, v4, v5);

  return v6;
}

- (id)mutableDictionaryForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend_objectForKey_(self, v7, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
LABEL_13:
    v23 = v9;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (id)objc_msgSend_mutableCopy(v8, v10, v11);
    goto LABEL_13;
  }
  if (!v8)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    goto LABEL_13;
  }
  v12 = (void *)MEMORY[0x24BDD1540];
  v29 = *MEMORY[0x24BDD0FC8];
  v13 = (void *)MEMORY[0x24BDD17C8];
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v13, v16, (uint64_t)CFSTR("Unexpected object: %@ for key: %@ expected: %@"), v8, v6, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v17;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v18, (uint64_t)v30, &v29, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v12, v20, (uint64_t)CFSTR("com.apple.SEMDictionaryLog"), 4, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && v21)
    *a4 = objc_retainAutorelease(v21);
  v22 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[SEMDictionaryLog mutableDictionaryForKey:error:]";
    v27 = 2112;
    v28 = v21;
    _os_log_error_impl(&dword_2462C4000, v22, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  v23 = 0;
LABEL_14:

  return v23;
}

- (BOOL)writeUpdatedObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  const char *v21;
  const char *v22;
  const char *v23;
  void *v24;
  id v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  if (a3 && a4)
  {
    v27 = a3;
    v8 = (void *)MEMORY[0x24BDBCE30];
    v9 = a4;
    v10 = a3;
    objc_msgSend_arrayWithObjects_count_(v8, v11, (uint64_t)&v27, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v9;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v13, (uint64_t)&v26, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend_writeUpdatedObjects_forKeys_error_(self, v15, (uint64_t)v12, v14, a5);
  }
  else
  {
    v17 = (void *)MEMORY[0x24BDD1540];
    v28 = *MEMORY[0x24BDD0FC8];
    v18 = (void *)MEMORY[0x24BDD17C8];
    v19 = a4;
    v20 = a3;
    objc_msgSend_stringWithFormat_(v18, v21, (uint64_t)CFSTR("Invalid {object: %@ key: %@}"), v20, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v12;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v22, (uint64_t)v29, &v28, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v17, v23, (uint64_t)CFSTR("com.apple.SEMDictionaryLog"), 1, v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5 && v24)
      *a5 = objc_retainAutorelease(v24);

    v16 = 0;
  }

  return v16;
}

- (BOOL)writeUpdatedObjects:(id)a3 forKeys:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  unint64_t i;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  const char *v39;
  void *v40;
  const char *v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  void *v48;
  void *v49;
  BOOL v50;
  NSDictionary *log;
  NSURL *logFileURL;
  int protectionClass;
  char v55;
  id v56;
  id v57;
  NSObject *v58;
  id v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  uint64_t v66;
  const char *v67;
  void *v68;
  NSDictionary *v69;
  id v70;
  const char *v71;
  void *v72;
  const char *v73;
  const char *v74;
  NSObject *v75;
  void *v76;
  id *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  id v82;
  uint8_t buf[4];
  const char *v84;
  __int16 v85;
  id v86;
  __int16 v87;
  id v88;
  __int16 v89;
  void *v90;
  _BYTE v91[128];
  uint64_t v92;
  void *v93;
  uint64_t v94;
  _QWORD v95[3];

  v95[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend_isReadOnly(self, v10, v11))
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v94 = *MEMORY[0x24BDD0FC8];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v12, (uint64_t)CFSTR("instance: %@ is read only."), self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v95[0] = v15;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v16, (uint64_t)v95, &v94, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v14, v18, (uint64_t)CFSTR("com.apple.SEMDictionaryLog"), 3, v17);
    goto LABEL_17;
  }
  v19 = objc_msgSend_count(v8, v12, v13);
  if (v19 != objc_msgSend_count(v9, v20, v21))
  {
    v45 = (void *)MEMORY[0x24BDD1540];
    v92 = *MEMORY[0x24BDD0FC8];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v22, (uint64_t)CFSTR("Unexpected number of objects: %@ for keys: %@"), v8, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v15;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v46, (uint64_t)&v93, &v92, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v45, v47, (uint64_t)CFSTR("com.apple.SEMDictionaryLog"), 1, v17);
LABEL_17:
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (a5 && v48)
      *a5 = objc_retainAutorelease(v48);

    goto LABEL_21;
  }
  v77 = a5;
  v23 = objc_alloc(MEMORY[0x24BDBCED8]);
  v26 = objc_msgSend_count(v9, v24, v25);
  v15 = (void *)objc_msgSend_initWithCapacity_(v23, v27, v26);
  v30 = objc_msgSend_count(v8, v28, v29);
  if (objc_msgSend_count(v8, v31, v32))
  {
    for (i = 0; i < objc_msgSend_count(v8, v43, v44); ++i)
    {
      objc_msgSend_objectAtIndex_(v8, v33, i);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v9, v36, i);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v15, v38, (uint64_t)v37);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40
        || (objc_msgSend_objectForKey_(self->_log, v39, (uint64_t)v37),
            (v40 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        if (objc_msgSend_isEqual_(v40, v39, (uint64_t)v35))
        {
          v42 = qword_25441F970;
          if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v84 = "-[SEMDictionaryLog writeUpdatedObjects:forKeys:error:]";
            v85 = 2112;
            v86 = v35;
            v87 = 2112;
            v88 = v37;
            _os_log_debug_impl(&dword_2462C4000, v42, OS_LOG_TYPE_DEBUG, "%s object: %@ is already recorded for key: %@", buf, 0x20u);
          }
          --v30;
          goto LABEL_14;
        }
        objc_msgSend_setObject_forKey_(v15, v41, (uint64_t)v40, v37);
      }
      objc_msgSend_setObject_forKey_(self->_log, v39, (uint64_t)v35, v37);
LABEL_14:

    }
  }
  if (!v30)
  {
    v50 = 1;
    goto LABEL_23;
  }
  logFileURL = self->_logFileURL;
  log = self->_log;
  protectionClass = self->_protectionClass;
  v82 = 0;
  v55 = sub_2462ED6E4((uint64_t)log, logFileURL, protectionClass, (uint64_t)&v82);
  v56 = v82;
  v57 = v56;
  if ((v55 & 1) != 0)
  {
    v58 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v84 = "-[SEMDictionaryLog writeUpdatedObjects:forKeys:error:]";
      v85 = 2112;
      v86 = v8;
      v87 = 2112;
      v88 = v9;
      v89 = 2112;
      v90 = v15;
      _os_log_debug_impl(&dword_2462C4000, v58, OS_LOG_TYPE_DEBUG, "%s Updated object(s): %@ for key(s): %@ replacing prior object(s): %@", buf, 0x2Au);
    }
    v50 = 1;
    v17 = v57;
    goto LABEL_22;
  }
  v76 = v56;
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v59 = v9;
  v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v78, v91, 16);
  if (v61)
  {
    v63 = v61;
    v64 = *(_QWORD *)v79;
    do
    {
      for (j = 0; j != v63; ++j)
      {
        if (*(_QWORD *)v79 != v64)
          objc_enumerationMutation(v59);
        v66 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j);
        objc_msgSend_objectForKey_(v15, v62, v66);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = self->_log;
        if (v68)
          objc_msgSend_setObject_forKey_(v69, v67, (uint64_t)v68, v66);
        else
          objc_msgSend_removeObjectForKey_(v69, v67, v66);

      }
      v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v62, (uint64_t)&v78, v91, 16);
    }
    while (v63);
  }

  v70 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v71, (uint64_t)CFSTR("Failed to write updated object(s): %@ for key(s): %@ reverting to prior object(s): %@"), v8, v59, v15);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v70, v73, (uint64_t)v72, *MEMORY[0x24BDD0FC8]);

  if (v76)
    objc_msgSend_setObject_forKey_(v70, v74, (uint64_t)v76, *MEMORY[0x24BDD1398]);
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v74, (uint64_t)CFSTR("com.apple.SEMDictionaryLog"), 8, v70);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v77 && v17)
    *v77 = objc_retainAutorelease(v17);
  v75 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v84 = "-[SEMDictionaryLog writeUpdatedObjects:forKeys:error:]";
    v85 = 2112;
    v86 = v17;
    _os_log_error_impl(&dword_2462C4000, v75, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

LABEL_21:
  v50 = 0;
LABEL_22:

LABEL_23:
  return v50;
}

- (BOOL)clearObjectForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  NSDictionary *log;
  NSURL *logFileURL;
  int protectionClass;
  char v20;
  const char *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  const char *v26;
  const char *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  const char *v32;
  void *v33;
  const char *v34;
  const char *v35;
  NSObject *v36;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend_isReadOnly(self, v7, v8))
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v47 = *MEMORY[0x24BDD0FC8];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, (uint64_t)CFSTR("instance: %@ is read only."), self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v11;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v12, (uint64_t)v48, &v47, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v10, v14, (uint64_t)CFSTR("com.apple.SEMDictionaryLog"), 3, v13);
    goto LABEL_10;
  }
  if (!v6)
  {
    v25 = (void *)MEMORY[0x24BDD1540];
    v45 = *MEMORY[0x24BDD0FC8];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, (uint64_t)CFSTR("Invalid key: %@"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v11;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v26, (uint64_t)&v46, &v45, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v25, v27, (uint64_t)CFSTR("com.apple.SEMDictionaryLog"), 1, v13);
LABEL_10:
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a4 && v28)
      *a4 = objc_retainAutorelease(v28);

    v20 = 0;
    goto LABEL_26;
  }
  objc_msgSend_objectForKey_(self->_log, v9, (uint64_t)v6);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v11 = (void *)v15;
    objc_msgSend_removeObjectForKey_(self->_log, v16, (uint64_t)v6);
    logFileURL = self->_logFileURL;
    log = self->_log;
    protectionClass = self->_protectionClass;
    v38 = 0;
    v20 = sub_2462ED6E4((uint64_t)log, logFileURL, protectionClass, (uint64_t)&v38);
    v22 = v38;
    if ((v20 & 1) != 0)
    {
      v23 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v40 = "-[SEMDictionaryLog clearObjectForKey:error:]";
        v41 = 2112;
        v42 = v11;
        v43 = 2112;
        v44 = v6;
        _os_log_debug_impl(&dword_2462C4000, v23, OS_LOG_TYPE_DEBUG, "%s Removed object: %@ for key: %@", buf, 0x20u);
      }
      v24 = v22;
    }
    else
    {
      objc_msgSend_setObject_forKey_(self->_log, v21, (uint64_t)v11, v6);
      v31 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v32, (uint64_t)CFSTR("Failed to write removal for key: %@ reverting to prior object: %@"), v6, v11);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v31, v34, (uint64_t)v33, *MEMORY[0x24BDD0FC8]);

      if (v22)
        objc_msgSend_setObject_forKey_(v31, v35, (uint64_t)v22, *MEMORY[0x24BDD1398]);
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v35, (uint64_t)CFSTR("com.apple.SEMDictionaryLog"), 8, v31);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4 && v24)
        *a4 = objc_retainAutorelease(v24);
      v36 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "-[SEMDictionaryLog clearObjectForKey:error:]";
        v41 = 2112;
        v42 = v24;
        _os_log_error_impl(&dword_2462C4000, v36, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v30 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[SEMDictionaryLog clearObjectForKey:error:]";
      v41 = 2112;
      v42 = v6;
      _os_log_debug_impl(&dword_2462C4000, v30, OS_LOG_TYPE_DEBUG, "%s No object exists for key: %@", buf, 0x16u);
    }
    v11 = 0;
    v20 = 1;
  }
LABEL_26:

  return v20;
}

- (BOOL)clear:(id *)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  BOOL v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  NSURL *logFileURL;
  char v20;
  id v21;
  id v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  NSObject *v27;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend_isReadOnly(self, a2, (uint64_t)a3))
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0FC8];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v5, (uint64_t)CFSTR("instance: %@ is read only."), self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v8;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v9, (uint64_t)v35, &v34, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v7, v11, (uint64_t)CFSTR("com.apple.SEMDictionaryLog"), 3, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 0;
    if (a3 && v12)
    {
      v13 = objc_retainAutorelease(v12);
      v14 = 0;
      *a3 = v13;
    }
    goto LABEL_18;
  }
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v5, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(self->_logFileURL, v15, v16);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13 || !objc_msgSend_fileExistsAtPath_(v10, v17, (uint64_t)v13))
  {
    v21 = 0;
    goto LABEL_17;
  }
  logFileURL = self->_logFileURL;
  v29 = 0;
  v20 = objc_msgSend_removeItemAtURL_error_(v10, v17, (uint64_t)logFileURL, &v29);
  v21 = v29;
  if ((v20 & 1) != 0)
  {
LABEL_17:
    objc_msgSend_removeAllObjects(self->_log, v17, v18);
    v14 = 1;
    v8 = v21;
    goto LABEL_18;
  }
  v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v23, (uint64_t)CFSTR("Failed to remove log file at path: %@"), v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v22, v25, (uint64_t)v24, *MEMORY[0x24BDD0FC8]);

  if (v21)
    objc_msgSend_setObject_forKey_(v22, v26, (uint64_t)v21, *MEMORY[0x24BDD1398]);
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v26, (uint64_t)CFSTR("com.apple.SEMDictionaryLog"), 8, v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v8)
    *a3 = objc_retainAutorelease(v8);
  v27 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[SEMDictionaryLog clear:]";
    v32 = 2112;
    v33 = v8;
    _os_log_error_impl(&dword_2462C4000, v27, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  v14 = 0;
LABEL_18:

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  char isEqualToDictionaryLog;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    isEqualToDictionaryLog = objc_msgSend_isEqualToDictionaryLog_(self, v5, (uint64_t)v4);
  else
    isEqualToDictionaryLog = 0;

  return isEqualToDictionaryLog;
}

- (BOOL)isEqualToDictionaryLog:(id)a3
{
  _QWORD *v4;
  const char *v5;
  const char *v6;
  char isEqual;

  v4 = a3;
  if (objc_msgSend_isEqual_(self->_logFileURL, v5, v4[1])
    && self->_protectionClass == *((_DWORD *)v4 + 6))
  {
    isEqual = objc_msgSend_isEqual_(self->_log, v6, v4[2]);
  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  unint64_t v12;

  v4 = objc_msgSend_hash(self->_logFileURL, a2, v2);
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v5, self->_protectionClass);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v6, v7, v8);
  v12 = v9 ^ v4 ^ objc_msgSend_hash(self->_log, v10, v11);

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_logFileURL, 0);
}

@end

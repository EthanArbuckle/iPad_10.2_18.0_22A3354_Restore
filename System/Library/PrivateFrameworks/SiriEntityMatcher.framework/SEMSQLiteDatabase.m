@implementation SEMSQLiteDatabase

- (SEMSQLiteDatabase)initWithPath:(id)a3 accessPermission:(int64_t)a4 threadingMode:(int64_t)a5 dataProtectionClass:(int)a6 databaseOptions:(int64_t)a7
{
  id v12;
  const char *v13;
  uint64_t v14;
  SEMSQLiteDatabase *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSString *path;
  const char *v21;
  uint64_t v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *cachedSQLiteStatements;
  SEMSQLiteDatabase *v25;
  NSObject *v26;
  objc_super v28;
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SEMSQLiteDatabase;
  v15 = -[SEMSQLiteDatabase init](&v28, sel_init);
  if (!v15)
    goto LABEL_4;
  objc_msgSend_stringByStandardizingPath(v12, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_copy(v16, v17, v18);
  path = v15->_path;
  v15->_path = (NSString *)v19;

  if (objc_msgSend_length(v15->_path, v21, v22))
  {
    v15->_accessPermission = a4;
    v15->_threadingMode = a5;
    v15->_dataProtectionClass = a6;
    v15->_databaseOptions = a7;
    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cachedSQLiteStatements = v15->_cachedSQLiteStatements;
    v15->_cachedSQLiteStatements = v23;

LABEL_4:
    v25 = v15;
    goto LABEL_8;
  }
  v26 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[SEMSQLiteDatabase initWithPath:accessPermission:threadingMode:dataProtectionClass:databaseOptions:]";
    _os_log_error_impl(&dword_2462C4000, v26, OS_LOG_TYPE_ERROR, "%s Cannot create SEMSQLiteDatabase with nil path", buf, 0xCu);
  }
  v25 = 0;
LABEL_8:

  return v25;
}

- (SEMSQLiteDatabase)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("You must use -initWithPath"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)openWithError:(id *)a3
{
  sqlite3 **p_handle;
  NSObject *v4;
  char v5;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  int isDirectory;
  const char *v15;
  uint64_t v16;
  void *v17;
  NSString *path;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  int v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  const char *v37;
  void *v38;
  void *v39;
  const char *v40;
  char v41;
  unint64_t v42;
  int v43;
  int64_t threadingMode;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  const char *v50;
  int v51;
  const char *v52;
  int v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  const char *v68;
  void *v69;
  uint64_t v70;
  const char *v71;
  id v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  void *v79;
  const char *v80;
  void *v81;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  void *v88;
  const char *v89;
  void *v90;
  void *v91;
  NSObject *v92;
  const char *v93;
  void *v94;
  const char *v95;
  void *v96;
  id v97;
  id v98;
  char v99;
  _QWORD v100[3];
  _QWORD v101[3];
  uint8_t buf[4];
  const char *v103;
  __int16 v104;
  void *v105;
  __int16 v106;
  void *v107;
  _QWORD v108[3];
  _QWORD v109[3];
  _QWORD v110[3];
  _QWORD v111[3];
  _QWORD v112[2];
  _QWORD v113[2];
  _QWORD v114[2];
  _QWORD v115[2];
  uint64_t v116;
  _QWORD v117[3];

  v117[1] = *MEMORY[0x24BDAC8D0];
  p_handle = &self->_handle;
  if (!self->_handle)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("Failed to open database at path: %@"), self->_path);
    v8 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v8;
    if (!self->_path)
    {
      v23 = (void *)MEMORY[0x24BDD1540];
      v116 = *MEMORY[0x24BDD0FC8];
      v117[0] = v8;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v9, (uint64_t)v117, &v116, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v23, v25, 0x251785690, 3, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      sub_2462F1D28(a3, v26);

LABEL_34:
      goto LABEL_35;
    }
    v99 = 0;
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v12, v13, (uint64_t)self->_path, &v99);

    if (isDirectory)
    {
      if (v99)
      {
        v17 = (void *)MEMORY[0x24BDD1540];
        path = self->_path;
        v19 = *MEMORY[0x24BDD0FC8];
        v114[0] = *MEMORY[0x24BDD0CB8];
        v114[1] = v19;
        v115[0] = path;
        v115[1] = v11;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v15, (uint64_t)v115, v114, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v17, v21, 0x251785690, 4, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        sub_2462F1D28(a3, v22);

LABEL_35:
        v5 = 0;
LABEL_36:

        return v5;
      }
LABEL_15:
      v42 = self->_accessPermission - 1;
      if (v42 > 2)
        v43 = 0;
      else
        v43 = dword_246318190[v42];
      threadingMode = self->_threadingMode;
      if (threadingMode == 3)
        v45 = 0x10000;
      else
        v45 = (threadingMode == 2) << 15;
      v46 = v45 | v43;
      v47 = self->_dataProtectionClass - 1;
      if (v47 > 5)
        v48 = 0;
      else
        v48 = dword_24631819C[v47];
      v49 = v46 | v48;
      v50 = (const char *)objc_msgSend_fileSystemRepresentation(self->_path, v15, v16);
      v51 = sqlite3_open_v2(v50, p_handle, v49, 0);
      if (v51)
      {
        v53 = v51;
        v54 = sqlite3_extended_errcode(self->_handle);
        v55 = (void *)MEMORY[0x24BDD1540];
        v56 = *MEMORY[0x24BDD0CB8];
        v109[0] = self->_path;
        v57 = *MEMORY[0x24BDD1398];
        v108[0] = v56;
        v108[1] = v57;
        sub_2462E1A34(v53, v54);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v108[2] = *MEMORY[0x24BDD0FC8];
        v109[1] = v58;
        v109[2] = v11;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v59, (uint64_t)v109, v108, 3);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v55, v61, 0x251785690, 2, v60);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        sub_2462F1D28(a3, v62);

        v5 = 0;
        self->_handle = 0;
      }
      else
      {
        if ((self->_databaseOptions & 2) != 0)
        {
          v63 = sqlite3_exec(*p_handle, "PRAGMA journal_mode=WAL", 0, 0, 0);
          if ((_DWORD)v63)
          {
            v64 = v63;
            v65 = sqlite3_extended_errcode(*p_handle);
            v66 = (void *)qword_25441F970;
            if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
            {
              v91 = (void *)MEMORY[0x24BDD16E0];
              v92 = v66;
              objc_msgSend_numberWithInt_(v91, v93, v64);
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v95, v65);
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v103 = "-[SEMSQLiteDatabase openWithError:]";
              v104 = 2112;
              v105 = v94;
              v106 = 2112;
              v107 = v96;
              _os_log_error_impl(&dword_2462C4000, v92, OS_LOG_TYPE_ERROR, "%s Failed to enable WAL journal_mode with errorCode: %@, extendedCode: %@", buf, 0x20u);

            }
          }
        }
        objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v52, (uint64_t)self->_path);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v68, self->_databaseOptions & 1);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = *MEMORY[0x24BDBCC68];
        v97 = 0;
        v5 = objc_msgSend_setResourceValue_forKey_error_(v67, v71, (uint64_t)v69, v70, &v97);
        v72 = v97;

        if ((v5 & 1) != 0)
        {
          objc_msgSend_removeAllObjects(self->_cachedSQLiteStatements, v73, v74);
        }
        else
        {
          v83 = (void *)MEMORY[0x24BDD1540];
          v84 = *MEMORY[0x24BDD0CB8];
          v101[0] = self->_path;
          v85 = *MEMORY[0x24BDD1398];
          v100[0] = v84;
          v100[1] = v85;
          sub_2462E19EC(v72);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v100[2] = *MEMORY[0x24BDD0FC8];
          v101[1] = v86;
          v101[2] = v11;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v87, (uint64_t)v101, v100, 3);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v83, v89, 0x251785690, 1, v88);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          sub_2462F1D28(a3, v90);

          sqlite3_close_v2(self->_handle);
          self->_handle = 0;
        }

      }
      goto LABEL_36;
    }
    objc_msgSend_stringByDeletingLastPathComponent(self->_path, v15, v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_fileExistsAtPath_isDirectory_(v29, v30, (uint64_t)v24, &v99);

    if (v31)
    {
      if (!v99)
      {
        v34 = (void *)MEMORY[0x24BDD1540];
        v35 = *MEMORY[0x24BDD0FC8];
        v112[0] = *MEMORY[0x24BDD0CB8];
        v112[1] = v35;
        v113[0] = v24;
        v113[1] = v11;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v32, (uint64_t)v113, v112, 2);
        v36 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v34, v37, 0x251785690, 5, v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        sub_2462F1D28(a3, v38);
LABEL_33:

        goto LABEL_34;
      }
    }
    else
    {
      objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v32, v33);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = 0;
      v41 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v39, v40, (uint64_t)v24, 1, 0, &v98);
      v36 = v98;

      if ((v41 & 1) == 0)
      {
        v75 = (void *)MEMORY[0x24BDD1540];
        v76 = *MEMORY[0x24BDD0CB8];
        v111[0] = self->_path;
        v77 = *MEMORY[0x24BDD1398];
        v110[0] = v76;
        v110[1] = v77;
        sub_2462E19EC(v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v110[2] = *MEMORY[0x24BDD0FC8];
        v111[1] = v38;
        v111[2] = v11;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v78, (uint64_t)v111, v110, 3);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v75, v80, 0x251785690, 1, v79);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        sub_2462F1D28(a3, v81);

        goto LABEL_33;
      }

    }
    goto LABEL_15;
  }
  v4 = qword_25441F970;
  v5 = 1;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v103 = "-[SEMSQLiteDatabase openWithError:]";
    _os_log_impl(&dword_2462C4000, v4, OS_LOG_TYPE_INFO, "%s Try to open a valid SQLite database handle, skipping open.", buf, 0xCu);
  }
  return v5;
}

- (BOOL)closeWithError:(id *)a3
{
  int v5;
  BOOL v6;
  int v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  if (!self->_handle)
    return 1;
  objc_msgSend_removeAllObjects(self->_cachedSQLiteStatements, a2, (uint64_t)a3);
  v5 = sqlite3_close_v2(self->_handle);
  v6 = v5 == 0;
  if (v5)
  {
    v7 = v5;
    v8 = sqlite3_extended_errcode(self->_handle);
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, (uint64_t)CFSTR("Failed to close database at path: %@"), self->_path);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BDD0CB8];
    v21[0] = self->_path;
    v13 = *MEMORY[0x24BDD1398];
    v20[0] = v12;
    v20[1] = v13;
    sub_2462E1A34(v7, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = *MEMORY[0x24BDD0FC8];
    v21[1] = v14;
    v21[2] = v10;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v15, (uint64_t)v21, v20, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v11, v17, 0x251785690, 2, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2462F1D28(a3, v18);

  }
  self->_handle = 0;
  return v6;
}

- (id)executeCommand:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  NSMutableDictionary *cachedSQLiteStatements;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  sqlite3_stmt *v20;
  sqlite3_stmt *v21;
  int v22;
  void *v23;
  id v24;
  id v25;
  NSString *path;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  id v32;
  NSString *v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  void *v39;
  id v40;
  NSString *v41;
  const char *v42;
  const char *v43;
  void *v44;
  uint64_t v45;
  sqlite3 *handle;
  id v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  int v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  id v55;
  NSString *v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  SEMSQLiteCachedStatement *v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  const char *v68;
  void *v69;
  id v70;
  NSString *v71;
  const char *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  sqlite3_stmt *v77;
  id v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  id v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  int v87;
  void *v88;
  const void *v89;
  int v90;
  double v91;
  sqlite3_int64 v92;
  const char *v93;
  void *v94;
  NSObject *v95;
  const char *v96;
  void *v97;
  const char *v98;
  void *v99;
  uint64_t v100;
  unint64_t v101;
  int v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  id v106;
  const char *v107;
  void *v108;
  uint64_t v109;
  sqlite3_stmt *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  sqlite3_int64 v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  id v119;
  const char *v120;
  void *v121;
  void *v122;
  NSObject *v123;
  const char *v124;
  void *v125;
  const char *v126;
  void *v127;
  double v128;
  const char *v129;
  uint64_t v130;
  const unsigned __int8 *v131;
  uint64_t v132;
  id v133;
  const char *v134;
  const void *v135;
  int v136;
  const char *v137;
  void *v138;
  const char *v139;
  const char *v140;
  int v141;
  NSMutableDictionary *v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  const char *v146;
  void *v147;
  id v148;
  NSString *v149;
  void *v150;
  const char *v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  const char *v155;
  void *v156;
  id v157;
  NSString *v158;
  void *v159;
  const char *v160;
  void *v161;
  const char *v162;
  SEMSQLiteDatabase *v164;
  uint64_t v165;
  id v166;
  char v167;
  uint64_t v168;
  void *v169;
  sqlite3_stmt *ppStmt;
  _QWORD v171[4];
  _QWORD v172[4];
  _QWORD v173[4];
  _QWORD v174[4];
  _QWORD v175[3];
  _QWORD v176[3];
  _QWORD v177[4];
  _QWORD v178[4];
  _QWORD v179[3];
  _QWORD v180[3];
  _QWORD v181[2];
  _QWORD v182[2];
  _QWORD v183[2];
  _QWORD v184[2];
  _BYTE buf[12];
  __int16 v186;
  id v187;
  __int16 v188;
  void *v189;
  __int16 v190;
  void *v191;
  uint64_t v192;

  v4 = a4;
  v192 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = mach_absolute_time();
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  ppStmt = 0;
  if (!self->_handle)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR("Failed to execute command: %@"), v6);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_alloc(MEMORY[0x24BDD1540]);
    path = self->_path;
    v27 = *MEMORY[0x24BDD0FC8];
    v183[0] = *MEMORY[0x24BDD0CB8];
    v183[1] = v27;
    v184[0] = path;
    v184[1] = v24;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v28, (uint64_t)v184, v183, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_initWithDomain_code_userInfo_(v25, v30, 0x251785690, 6, v29);
LABEL_14:
    v38 = (void *)v31;

    v39 = v6;
    goto LABEL_15;
  }
  if (v6)
  {
    objc_msgSend_commandString(v6, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v167 = v4;
      if ((v4 & 2) != 0)
      {
        cachedSQLiteStatements = self->_cachedSQLiteStatements;
        objc_msgSend_commandString(v6, v12, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(cachedSQLiteStatements, v16, (uint64_t)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v20 = (sqlite3_stmt *)objc_msgSend_stmt(v17, v18, v19);
          if (!v20 || (v21 = v20, sqlite3_reset(v20)) || (v22 = sqlite3_clear_bindings(v21), v23 = v17, v22))
          {
            v23 = 0;
            v21 = 0;
          }
          ppStmt = v21;
        }
        else
        {
          v21 = 0;
          v23 = 0;
        }
        v24 = v23;

        if (v21)
        {
          v45 = 0;
          goto LABEL_25;
        }
      }
      else
      {
        v24 = 0;
      }
      handle = self->_handle;
      objc_msgSend_commandString(v6, v12, v13);
      v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v50 = (const char *)objc_msgSend_UTF8String(v47, v48, v49);
      v51 = sqlite3_prepare_v2(handle, v50, 0x80000000, &ppStmt, 0);

      if (v51)
      {
        v53 = sqlite3_extended_errcode(self->_handle);
        if (ppStmt)
        {
          sqlite3_finalize(ppStmt);
          ppStmt = 0;
        }
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v52, (uint64_t)CFSTR("Failed to execute command: %@"), v6);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_alloc(MEMORY[0x24BDD1540]);
        v56 = self->_path;
        v177[0] = *MEMORY[0x24BDD0CB8];
        v177[1] = CFSTR("command");
        v178[0] = v56;
        v178[1] = v6;
        v177[2] = *MEMORY[0x24BDD1398];
        sub_2462E1A34(v51, v53);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v177[3] = *MEMORY[0x24BDD0FC8];
        v178[2] = v57;
        v178[3] = v54;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v58, (uint64_t)v178, v177, 4);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v55, v60, 0x251785690, 2, v59);

        sub_2462E29E4(v6, v7, v10, v38);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_75;
      }
      v61 = [SEMSQLiteCachedStatement alloc];
      v45 = objc_msgSend_initWithStmt_(v61, v62, (uint64_t)ppStmt);
LABEL_25:
      v168 = v45;
      objc_msgSend_parameters(v6, v12, v13);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend_count(v63, v64, v65);
      v67 = sqlite3_bind_parameter_count(ppStmt);
      v169 = v63;
      if (v67 < 0 || v67 == (_DWORD)v66)
      {
        v164 = self;
        v165 = v7;
        v166 = v24;
        if (v66)
        {
          v75 = 0;
          while (2)
          {
            objc_msgSend_objectAtIndex_(v63, v68, v75);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            ++v75;
            v77 = ppStmt;
            v78 = v76;
            switch(objc_msgSend_databaseValue_type(v78, v79, v80))
            {
              case 0:
                objc_msgSend_description(v78, v81, v82);
                v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v86 = (const char *)objc_msgSend_UTF8String(v83, v84, v85);
                v87 = sqlite3_bind_text(v77, v75, v86, -1, 0);

                v88 = (void *)qword_25441F970;
                if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
                {
                  v94 = (void *)MEMORY[0x24BDD16E0];
                  v95 = v88;
                  objc_msgSend_numberWithInt_(v94, v96, v75);
                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v98, 0);
                  v99 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315906;
                  *(_QWORD *)&buf[4] = "SEMSQLiteDatabaseBindParameterToSQLiteStatement";
                  v186 = 2112;
                  v187 = v78;
                  v188 = 2112;
                  v189 = v97;
                  v190 = 2112;
                  v191 = v99;
                  _os_log_error_impl(&dword_2462C4000, v95, OS_LOG_TYPE_ERROR, "%s Bind parameter: %@ with unspecified type (sqlite_parameter_index: %@, valueType: %@)", buf, 0x2Au);

                }
                v63 = v169;
                goto LABEL_41;
              case 1:
                *(_QWORD *)buf = 0;
                v89 = (const void *)objc_msgSend_databaseValue_blobRepresentationWithLength_(v78, v81, (uint64_t)buf);
                v90 = sqlite3_bind_blob64(v77, v75, v89, *(sqlite3_uint64 *)buf, 0);
                goto LABEL_40;
              case 2:
                objc_msgSend_databaseValue_doubleRepresentation(v78, v81, v82);
                v90 = sqlite3_bind_double(v77, v75, v91);
                goto LABEL_40;
              case 3:
                v92 = objc_msgSend_databaseValue_integerRepresentation(v78, v81, v82);
                v90 = sqlite3_bind_int64(v77, v75, v92);
                goto LABEL_40;
              case 4:
                v90 = sqlite3_bind_null(v77, v75);
                goto LABEL_40;
              case 5:
                v93 = (const char *)objc_msgSend_databaseValue_textRepresentation(v78, v81, v82);
                v90 = sqlite3_bind_text(v77, v75, v93, -1, 0);
LABEL_40:
                v87 = v90;
LABEL_41:

                if (!v87)
                  goto LABEL_42;
                v154 = sqlite3_extended_errcode(v164->_handle);
                objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v155, (uint64_t)CFSTR("Failed to execute command: %@"), v6);
                v156 = (void *)objc_claimAutoreleasedReturnValue();
                v157 = objc_alloc(MEMORY[0x24BDD1540]);
                v158 = v164->_path;
                v173[0] = *MEMORY[0x24BDD0CB8];
                v173[1] = CFSTR("command");
                v174[0] = v158;
                v174[1] = v6;
                v173[2] = *MEMORY[0x24BDD1398];
                sub_2462E1A34(v87, v154);
                v159 = (void *)objc_claimAutoreleasedReturnValue();
                v173[3] = *MEMORY[0x24BDD0FC8];
                v174[2] = v159;
                v174[3] = v156;
                objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v160, (uint64_t)v174, v173, 4);
                v161 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v157, v162, 0x251785690, 2, v161);

                sub_2462E29E4(v6, v165, v10, v38);
                v44 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_72;
              default:

LABEL_42:
                if (v66 == v75)
                  break;
                continue;
            }
            break;
          }
        }
        v100 = sqlite3_column_count(ppStmt);
        v101 = 0x24BDBC000uLL;
        while (1)
        {
          v102 = sqlite3_step(ppStmt);
          if (v102 != 100)
            break;
          v105 = *(void **)(v101 + 3768);
          if ((int)v100 < 1)
          {
            objc_msgSend_array(v105, v103, v104);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v106 = objc_alloc((Class)v105);
            v108 = (void *)objc_msgSend_initWithCapacity_(v106, v107, v100);
            v109 = 0;
            while (2)
            {
              v110 = ppStmt;
              v111 = sqlite3_column_type(ppStmt, v109);
              switch((int)v111)
              {
                case 1:
                  v114 = sqlite3_column_int64(v110, v109);
                  objc_msgSend_numberWithLongLong_(MEMORY[0x24BDD16E0], v115, v114);
                  v116 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_59;
                case 2:
                  v128 = sqlite3_column_double(v110, v109);
                  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v129, v130, v128);
                  v116 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_59;
                case 3:
                  v131 = sqlite3_column_text(v110, v109);
                  if (!v131)
                    goto LABEL_62;
                  v132 = (uint64_t)v131;
                  v133 = objc_alloc(MEMORY[0x24BDD17C8]);
                  v116 = objc_msgSend_initWithUTF8String_(v133, v134, v132);
                  goto LABEL_59;
                case 4:
                  v135 = sqlite3_column_blob(v110, v109);
                  v136 = sqlite3_column_bytes(v110, v109);
                  if (v136 < 1)
                  {
LABEL_62:
                    v118 = 0;
                  }
                  else
                  {
                    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v137, (uint64_t)v135, v136);
                    v116 = objc_claimAutoreleasedReturnValue();
LABEL_59:
                    v118 = (void *)v116;
                  }
LABEL_60:
                  sub_2462E19EC(v118);
                  v138 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend_addObject_(v108, v139, (uint64_t)v138);
                  v109 = (v109 + 1);
                  if ((_DWORD)v100 != (_DWORD)v109)
                    continue;
                  v101 = 0x24BDBC000;
                  break;
                case 5:
                  objc_msgSend_null(MEMORY[0x24BDBCEF8], v112, v113);
                  v116 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_59;
                default:
                  v117 = v111;
                  v118 = (void *)sqlite3_column_text(v110, v109);
                  if (v118)
                  {
                    v119 = objc_alloc(MEMORY[0x24BDD17C8]);
                    v118 = (void *)objc_msgSend_initWithUTF8String_(v119, v120, (uint64_t)v118);
                  }
                  v121 = (void *)qword_25441F970;
                  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
                  {
                    v122 = (void *)MEMORY[0x24BDD16E0];
                    v123 = v121;
                    objc_msgSend_numberWithInt_(v122, v124, v109);
                    v125 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v126, v117);
                    v127 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 136315906;
                    *(_QWORD *)&buf[4] = "SEMSQLiteDatabaseGetColumnValueFromSQLiteStatement";
                    v186 = 2112;
                    v187 = v118;
                    v188 = 2112;
                    v189 = v125;
                    v190 = 2112;
                    v191 = v127;
                    _os_log_error_impl(&dword_2462C4000, v123, OS_LOG_TYPE_ERROR, "%s value: %@ with unknown column type (sqlite_column_index: %@, sqlite_column_type: %@)", buf, 0x2Au);

                  }
                  goto LABEL_60;
              }
              break;
            }
          }
          objc_msgSend_addObject_(v10, v140, (uint64_t)v108);

        }
        v141 = v102;
        if (v102 == 101)
        {
          v54 = (void *)v168;
          if ((v167 & 2) != 0 && v168)
          {
            v142 = v164->_cachedSQLiteStatements;
            objc_msgSend_commandString(v6, v103, v104);
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v142, v144, v168, v143);

          }
          sqlite3_reset(ppStmt);
          sqlite3_clear_bindings(ppStmt);
          sub_2462E29E4(v6, v165, v10, 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 0;
          v24 = v166;
          goto LABEL_74;
        }

        v145 = sqlite3_extended_errcode(v164->_handle);
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v146, (uint64_t)CFSTR("Failed to execute command: %@"), v6);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        v148 = objc_alloc(MEMORY[0x24BDD1540]);
        v149 = v164->_path;
        v171[0] = *MEMORY[0x24BDD0CB8];
        v171[1] = CFSTR("command");
        v172[0] = v149;
        v172[1] = v6;
        v171[2] = *MEMORY[0x24BDD1398];
        sub_2462E1A34(v141, v145);
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        v171[3] = *MEMORY[0x24BDD0FC8];
        v172[2] = v150;
        v172[3] = v147;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v151, (uint64_t)v172, v171, 4);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v148, v153, 0x251785690, 2, v152);

        sub_2462E29E4(v6, v165, 0, v38);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = 0;
LABEL_72:
        v24 = v166;
      }
      else
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v68, (uint64_t)CFSTR("Failed to execute command: %@"), v6);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_alloc(MEMORY[0x24BDD1540]);
        v71 = self->_path;
        v175[0] = *MEMORY[0x24BDD0CB8];
        v175[1] = CFSTR("command");
        v176[0] = v71;
        v176[1] = v6;
        v175[2] = *MEMORY[0x24BDD0FC8];
        v176[2] = v69;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v72, (uint64_t)v176, v175, 3);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v70, v74, 0x251785690, 9, v73);

        sub_2462E29E4(v6, v7, v10, v38);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v54 = (void *)v168;
LABEL_74:

LABEL_75:
      goto LABEL_76;
    }
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v12, (uint64_t)CFSTR("Failed to execute command: %@"), v6);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v40 = objc_alloc(MEMORY[0x24BDD1540]);
    v41 = self->_path;
    v179[0] = *MEMORY[0x24BDD0CB8];
    v179[1] = CFSTR("command");
    v180[0] = v41;
    v180[1] = v6;
    v179[2] = *MEMORY[0x24BDD0FC8];
    v180[2] = v24;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v42, (uint64_t)v180, v179, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_initWithDomain_code_userInfo_(v40, v43, 0x251785690, 8, v29);
    goto LABEL_14;
  }
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR("Failed to execute command: %@"), 0);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_alloc(MEMORY[0x24BDD1540]);
  v33 = self->_path;
  v34 = *MEMORY[0x24BDD0FC8];
  v181[0] = *MEMORY[0x24BDD0CB8];
  v181[1] = v34;
  v182[0] = v33;
  v182[1] = v24;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v35, (uint64_t)v182, v181, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v32, v37, 0x251785690, 7, v36);

  v39 = 0;
LABEL_15:
  sub_2462E29E4(v39, v7, v10, v38);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_76:

  return v44;
}

- (BOOL)executeCommand:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_executeCommand_options_(self, a2, (uint64_t)a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    sub_2462F1D28(a5, v9);

  return v9 == 0;
}

- (BOOL)executeCommandString:(id)a3 error:(id *)a4
{
  id v6;
  SEMDatabaseCommand *v7;
  const char *v8;
  void *v9;
  const char *v10;

  v6 = a3;
  v7 = [SEMDatabaseCommand alloc];
  v9 = (void *)objc_msgSend_initWithCommandString_parameters_(v7, v8, (uint64_t)v6, 0);

  LOBYTE(a4) = objc_msgSend_executeCommand_options_error_(self, v10, (uint64_t)v9, 0, a4);
  return (char)a4;
}

- (BOOL)cleanup:(id *)a3
{
  return objc_msgSend_executeCommandString_error_(self, a2, (uint64_t)CFSTR("VACUUM"), a3);
}

- (int)rowsModified:(id *)a3
{
  sqlite3 *handle;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  handle = self->_handle;
  if (handle)
    return sqlite3_changes(handle);
  v6 = objc_alloc(MEMORY[0x24BDD1540]);
  v11 = *MEMORY[0x24BDD0FC8];
  v12[0] = CFSTR("Invalid sqlite handle.");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v7, (uint64_t)v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v6, v9, 0x251785690, 6, v8);

  if (a3)
  {
    if (v10)
      *a3 = objc_retainAutorelease(v10);
  }

  return -1;
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  return objc_msgSend_executeCommandString_error_(self, a2, (uint64_t)CFSTR("BEGIN TRANSACTION"), a3);
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  return objc_msgSend_executeCommandString_error_(self, a2, (uint64_t)CFSTR("COMMIT TRANSACTION"), a3);
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  return objc_msgSend_executeCommandString_error_(self, a2, (uint64_t)CFSTR("ROLLBACK TRANSACTION"), a3);
}

- (NSString)path
{
  return self->_path;
}

- (int64_t)accessPermission
{
  return self->_accessPermission;
}

- (int64_t)threadingMode
{
  return self->_threadingMode;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (int64_t)databaseOptions
{
  return self->_databaseOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_cachedSQLiteStatements, 0);
}

@end

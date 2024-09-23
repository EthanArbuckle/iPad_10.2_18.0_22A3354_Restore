@implementation UserCoreFileHandler

- (UserCoreFileHandler)initWithCoreFilePath:(const char *)a3 :(const char *)a4
{
  NSString *v7;
  NSString *input_corefile_path;
  NSString *v9;
  NSString *input_corefile_name;
  FILE *input_core;
  int v12;
  void *v13;
  _BOOL4 v14;
  NSString *v15;
  NSObject *v16;
  void *v17;
  NSString *v18;
  NSObject *v19;
  NSString *v20;
  NSObject *v21;
  void *v22;
  NSString *v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  UserCoreFileHandler *v27;
  void *v28;
  int *v30;
  char *v31;
  int *v32;
  char *v33;
  int value;
  char v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  const char *v39;

  self->_input_core = 0;
  v35 = 0;
  value = 0;
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a4));
  input_corefile_path = self->_input_corefile_path;
  self->_input_corefile_path = v7;

  v9 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
  input_corefile_name = self->_input_corefile_name;
  self->_input_corefile_name = v9;

  input_core = fopen(a4, "r");
  self->_input_core = input_core;
  if (input_core)
    goto LABEL_2;
  if (*__error() == 2)
  {
    v17 = (void *)qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_17:
      v27 = 0;
      goto LABEL_22;
    }
    v18 = self->_input_corefile_name;
    v19 = v17;
    *(_DWORD *)buf = 136315394;
    v37 = -[NSString UTF8String](v18, "UTF8String");
    v38 = 2080;
    v39 = a4;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No %s core found at %s", buf, 0x16u);
LABEL_8:

    goto LABEL_17;
  }
  input_core = self->_input_core;
  if (!input_core)
  {
    v26 = (void *)qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v19 = v26;
    v30 = __error();
    v31 = strerror(*v30);
    *(_DWORD *)buf = 136315394;
    v37 = a4;
    v38 = 2080;
    v39 = v31;
    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "open %s failed with error: %s", buf, 0x16u);
    goto LABEL_8;
  }
LABEL_2:
  v12 = feof(input_core);
  v13 = (void *)qword_10003A5D8;
  v14 = os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      v15 = self->_input_corefile_name;
      v16 = v13;
      *(_DWORD *)buf = 136315138;
      v37 = -[NSString UTF8String](v15, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s core is empty", buf, 0xCu);

    }
    goto LABEL_21;
  }
  if (v14)
  {
    v20 = self->_input_corefile_name;
    v21 = v13;
    *(_DWORD *)buf = 136315394;
    v37 = -[NSString UTF8String](v20, "UTF8String");
    v38 = 2080;
    v39 = a4;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Found %s core at %s", buf, 0x16u);

  }
  if (getxattr(a4, "UserSpaceCoreCompressed", &value, 5uLL, 0, 0) != -1)
  {
    v22 = (void *)qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_21:
      fclose(self->_input_core);
      v27 = 0;
      self->_input_core = 0;
      goto LABEL_22;
    }
    v23 = self->_input_corefile_name;
    v24 = v22;
    v25 = -[NSString UTF8String](v23, "UTF8String");
    *(_DWORD *)buf = 136315138;
    v37 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s core already compressed, skipping collection", buf, 0xCu);
LABEL_14:

    goto LABEL_21;
  }
  if (*__error() != 93)
  {
    v28 = (void *)qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    v24 = v28;
    v32 = __error();
    v33 = strerror(*v32);
    *(_DWORD *)buf = 136315394;
    v37 = "UserSpaceCoreCompressed";
    v38 = 2080;
    v39 = v33;
    _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "getxattr %s returned error : %s", buf, 0x16u);
    goto LABEL_14;
  }
  v27 = self;
LABEL_22:

  return v27;
}

- (void)dealloc
{
  FILE *input_core;
  objc_super v4;

  input_core = self->_input_core;
  if (input_core)
  {
    fclose(input_core);
    self->_input_core = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UserCoreFileHandler;
  -[UserCoreFileHandler dealloc](&v4, "dealloc");
}

- (id)saveUserSpaceCoreToDisk:(double)a3
{
  id v3;
  UserCoreFileHandler *v4;
  void *v5;
  void *v6;
  void *v7;
  int (__cdecl **v8)(AAByteStream);
  NSString *v10;
  NSString *v11;
  char v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  char *v17;
  NSObject *v18;
  char *v19;
  gzFile v20;
  gzFile_s *v21;
  size_t v22;
  unint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  int v28;
  void *v29;
  std::error_code *v30;
  NSString *v31;
  NSObject *v32;
  const char *v33;
  int *v34;
  char *v35;
  void *v36;
  char *v37;
  char *v38;
  void *v39;
  NSObject *v40;
  const char *v41;
  const char *v42;
  NSString *input_corefile_name;
  NSObject *v44;
  const char *v45;
  void *v46;
  std::error_code *v47;
  void *v48;
  const char *v49;
  NSString *v51;
  NSObject *v52;
  const char *v53;
  const char *v54;
  NSString *v55;
  NSObject *v56;
  const char *v57;
  int *v58;
  char *v59;
  void *v60;
  NSString *v61;
  const char *v62;
  id v63;
  void *v64;
  id v65;
  const std::__fs::filesystem::path *v66;
  std::error_code *v67;
  int v68;
  int v69;
  void *v70;
  std::error_code *v71;
  void *v72;
  int v73;
  int v74;
  NSString *v75;
  NSObject *v76;
  const char *v77;
  void *v78;
  NSObject *v79;
  int *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  NSString *v85;
  NSObject *v86;
  const char *v87;
  const std::__fs::filesystem::path *v88;
  std::error_code *v89;
  id v90;
  void *v91;
  unsigned __int8 v92;
  NSObject *v93;
  NSString *v94;
  NSString *v95;
  NSObject *v96;
  const char *v97;
  NSString *v98;
  NSObject *v99;
  const char *v100;
  id v101;
  id v102;
  id v103;
  uint8_t buf[4];
  const char *v105;
  __int16 v106;
  const char *v107;
  __int16 v108;
  id v109;

  if (!self->_input_core)
  {
    v82 = _os_assert_log(0);
    v10 = (NSString *)_os_crash(v82);
    __break(1u);
    goto LABEL_57;
  }
  v4 = self;
  v10 = self->_input_corefile_name;
  if (!v10)
  {
LABEL_57:
    v83 = _os_assert_log(v10);
    v11 = (NSString *)_os_crash(v83);
    __break(1u);
    goto LABEL_58;
  }

  v11 = v4->_input_corefile_path;
  if (!v11)
  {
LABEL_58:
    v84 = _os_assert_log(v11);
    v74 = _os_crash(v84);
    __break(1u);
    goto LABEL_59;
  }

  v103 = 0;
  v12 = sub_100015A64(CFSTR("/private/var/mobile/Library/Logs/CrashReporter/Panics"), &v103, 493);
  v13 = v103;
  v14 = v13;
  if ((v12 & 1) == 0)
  {
    v36 = (void *)qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      v37 = 0;
      v5 = 0;
      v38 = 0;
      v3 = v14;
      goto LABEL_37;
    }
    v3 = objc_retainAutorelease(v14);
    v40 = v36;
    v49 = (const char *)objc_msgSend(v3, "UTF8String");
    *(_DWORD *)buf = 136315138;
    v105 = v49;
    v42 = "failed to setup corefile output directory with error: %s";
LABEL_34:
    _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, v42, buf, 0xCu);

    goto LABEL_35;
  }
  v102 = v13;
  v15 = sub_100015A64(CFSTR("/private/var/mobile/Library/Logs/CrashReporter/Panics/staged"), &v102, 493);
  v3 = v102;

  if ((v15 & 1) == 0)
  {
    v39 = (void *)qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      goto LABEL_35;
    v3 = objc_retainAutorelease(v3);
    v40 = v39;
    v41 = (const char *)objc_msgSend(v3, "UTF8String");
    *(_DWORD *)buf = 136315138;
    v105 = v41;
    v42 = "failed to setup corefile stage directory with error: %s";
    goto LABEL_34;
  }
  v16 = sub_100017AFC(CFSTR("/private/var/mobile/Library/Logs/CrashReporter/Panics"), v4->_input_corefile_name);
  v17 = (char *)malloc_type_malloc(0x20000uLL, 0xFC1095D3uLL);
  v7 = &unk_10003A000;
  v18 = qword_10003A5D8;
  if (!v17)
  {
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      input_corefile_name = v4->_input_corefile_name;
      v44 = v18;
      v45 = -[NSString UTF8String](input_corefile_name, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v105 = v45;
      _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Failed to allocate compression buffer for %s core", buf, 0xCu);

    }
    goto LABEL_35;
  }
  v19 = v17;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v105 = "/private/var/mobile/Library/Logs/CrashReporter/Panics/staged/tempUserSpaceCore.XXX";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "gzopen %s", buf, 0xCu);
  }
  v20 = gzopen("/private/var/mobile/Library/Logs/CrashReporter/Panics/staged/tempUserSpaceCore.XXX", "w");
  if (!v20)
  {
    v48 = (void *)qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      v55 = v4->_input_corefile_name;
      v56 = v48;
      v57 = -[NSString UTF8String](v55, "UTF8String");
      v58 = __error();
      v59 = strerror(*v58);
      *(_DWORD *)buf = 136315394;
      v105 = v57;
      v106 = 2080;
      v107 = v59;
      _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Failed to open %s core compressed output file with error %s", buf, 0x16u);

    }
    fclose(v4->_input_core);
    v4->_input_core = 0;
    free(v19);
LABEL_35:
    v37 = 0;
    v5 = 0;
    goto LABEL_36;
  }
  v21 = v20;
  do
  {
    v22 = fread(v19, 1uLL, 0x20000uLL, v4->_input_core);
    if (v22)
    {
      v23 = v22;
      v24 = 0;
      v25 = 0;
      while (1)
      {
        v26 = gzwrite(v21, &v19[v24], v23 - v25);
        if (!v26)
          break;
        v25 += v26;
        v24 = v25;
        if (v23 <= v25)
          goto LABEL_17;
      }
      v46 = (void *)qword_10003A5D8;
      if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      v51 = v4->_input_corefile_name;
      v52 = v46;
      v53 = -[NSString UTF8String](v51, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v105 = v53;
      v54 = "gzwrite failed to write %s core";
      goto LABEL_39;
    }
    if (!feof(v4->_input_core))
    {
      v60 = (void *)qword_10003A5D8;
      if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      v61 = v4->_input_corefile_name;
      v52 = v60;
      v62 = -[NSString UTF8String](v61, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v105 = v62;
      v54 = "Failed to read content from %s core";
LABEL_39:
      _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, v54, buf, 0xCu);

LABEL_29:
      fclose(v4->_input_core);
      free(v19);
      gzclose(v21);
      remove((const std::__fs::filesystem::path *)"/private/var/mobile/Library/Logs/CrashReporter/Panics/staged/tempUserSpaceCore.XXX", v47);
      fclose(v4->_input_core);
      goto LABEL_35;
    }
LABEL_17:
    ;
  }
  while (!feof(v4->_input_core));
  free(v19);
  fclose(v4->_input_core);
  v4->_input_core = 0;
  v27 = gzclose(v21);
  if (v27)
  {
    v28 = v27;
    if (v27 == -1)
    {
      v29 = (void *)qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        v31 = v4->_input_corefile_name;
        v32 = v29;
        v33 = -[NSString UTF8String](v31, "UTF8String");
        v34 = __error();
        v35 = strerror(*v34);
        *(_DWORD *)buf = 136315394;
        v105 = v33;
        v106 = 2080;
        v107 = v35;
        _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to close compressed %s core with error : %s", buf, 0x16u);

      }
    }
    else
    {
      v72 = (void *)qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        v95 = v4->_input_corefile_name;
        v96 = v72;
        v97 = -[NSString UTF8String](v95, "UTF8String");
        *(_DWORD *)buf = 136315394;
        v105 = v97;
        v106 = 1024;
        LODWORD(v107) = v28;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to close compressed %s core with error : %d", buf, 0x12u);

      }
    }
    remove((const std::__fs::filesystem::path *)"/private/var/mobile/Library/Logs/CrashReporter/Panics/staged/tempUserSpaceCore.XXX", v30);
    goto LABEL_35;
  }
  v8 = &AAByteStreamClose_ptr;
  v63 = sub_10001D3B0(a3);
  v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%s%@.core.gz"), v64, ", v4->_input_corefile_name));

  v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s/%@"), "/private/var/mobile/Library/Logs/CrashReporter/Panics/staged", v5)));
  v66 = (const std::__fs::filesystem::path *)objc_msgSend(v65, "UTF8String");
  rename((const std::__fs::filesystem::path *)"/private/var/mobile/Library/Logs/CrashReporter/Panics/staged/tempUserSpaceCore.XXX", v66, v67);
  v69 = v68;

  if (v69)
  {
    v70 = (void *)qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      v98 = v4->_input_corefile_name;
      v99 = v70;
      v100 = -[NSString UTF8String](v98, "UTF8String");
      v101 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      *(_DWORD *)buf = 136315650;
      v105 = v100;
      v106 = 2080;
      v107 = "/private/var/mobile/Library/Logs/CrashReporter/Panics/staged/tempUserSpaceCore.XXX";
      v108 = 2080;
      v109 = v101;
      _os_log_error_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "Failed to rename compressed %s from %s to %s", buf, 0x20u);

    }
    remove((const std::__fs::filesystem::path *)"/private/var/mobile/Library/Logs/CrashReporter/Panics/staged/tempUserSpaceCore.XXX", v71);
    goto LABEL_46;
  }
  v73 = sub_100010480();
  v6 = (void *)qword_10003A5D8;
  v74 = os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT);
  if (!v73)
  {
LABEL_59:
    if (v74)
    {
      v85 = v4->_input_corefile_name;
      v86 = v6;
      v87 = -[NSString UTF8String](v85, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v105 = v87;
      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "Removing original %s core", buf, 0xCu);

    }
    v88 = -[NSString UTF8String](v4->_input_corefile_path, "UTF8String");
    remove(v88, v89);
    goto LABEL_62;
  }
  if (v74)
  {
    v75 = v4->_input_corefile_name;
    v76 = v6;
    v77 = -[NSString UTF8String](v75, "UTF8String");
    *(_DWORD *)buf = 136315138;
    v105 = v77;
    _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Detected stress rack device, setting xattr on original %s core", buf, 0xCu);

  }
  if (setxattr(-[NSString UTF8String](v4->_input_corefile_path, "UTF8String"), "UserSpaceCoreCompressed", "YES", 4uLL, 0, 0))
  {
    v78 = (void *)qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      v79 = v78;
      v80 = __error();
      v81 = strerror(*v80);
      *(_DWORD *)buf = 136315394;
      v105 = "UserSpaceCoreCompressed";
      v106 = 2080;
      v107 = v81;
      _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "Failed to set %s xattr returned error : %s", buf, 0x16u);

    }
LABEL_46:
    v37 = 0;
LABEL_36:
    v38 = 0;
    goto LABEL_37;
  }
LABEL_62:
  v90 = sub_100017AFC(CFSTR("/private/var/mobile/Library/Logs/CrashReporter/Panics"), v4->_input_corefile_name);
  v37 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[76], "stringWithFormat:", CFSTR("%s/%@"), "/private/var/mobile/Library/Logs/CrashReporter/Panics", v5));
  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v92 = objc_msgSend(v91, "fileExistsAtPath:", v37);

  v93 = *((_QWORD *)v7 + 187);
  if ((v92 & 1) == 0)
  {
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v105 = v37;
      _os_log_error_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "Cannot find %@", buf, 0xCu);
    }
    goto LABEL_36;
  }
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
  {
    v94 = v4->_input_corefile_name;
    *(_DWORD *)buf = 138412546;
    v105 = (const char *)v94;
    v106 = 2112;
    v107 = v37;
    _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "Finished processing %@ core, available at %@", buf, 0x16u);
  }
  v37 = v37;
  v38 = v37;
LABEL_37:

  return v38;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_input_corefile_name, 0);
  objc_storeStrong((id *)&self->_input_corefile_path, 0);
}

@end

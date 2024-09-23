@implementation UMLibInfoProvider

- (id)passwdForUID:(unsigned int)a3 error:(id *)a4
{
  passwd *v6;
  void *v7;
  int v8;
  NSObject *v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  NSObject *v13;
  unsigned int v14;
  unsigned int v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  if (a4)
    *a4 = 0;
  *__error() = 0;
  v6 = getpwuid(a3);
  if (!v6)
  {
    v8 = *__error();
    if (v8)
    {
      if (qword_1EE184F50 != -1)
        dispatch_once(&qword_1EE184F50, &unk_1E2A4A708);
      v9 = (id)qword_1EE184F80;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v25[0] = 0;
        v10 = sub_18FAED604();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          v11 = v10;
        else
          v11 = v10 & 0xFFFFFFFE;
        if (v11)
        {
          LODWORD(v22) = 67109376;
          HIDWORD(v22) = a3;
          v23 = 1024;
          v24 = v8;
          v21 = 14;
          v20 = &v22;
          v12 = (void *)_os_log_send_and_compose_impl();
          if (v12)
            sub_18FAED60C();
        }
        else
        {
          v12 = 0;
        }
        free(v12);
      }

      if (a4)
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v17, *MEMORY[0x1E0CB2FE0], v8, 0, v20, v21, v22);
LABEL_32:
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        return 0;
      }
    }
    else
    {
      if (qword_1EE184F50 != -1)
        dispatch_once(&qword_1EE184F50, &unk_1E2A4A708);
      v13 = (id)qword_1EE184F80;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v22 = 0;
        v14 = sub_18FAED604();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          v15 = v14;
        else
          v15 = v14 & 0xFFFFFFFE;
        if (v15)
        {
          LODWORD(v25[0]) = 67109120;
          HIDWORD(v25[0]) = a3;
          v21 = 8;
          v20 = v25;
          v16 = (void *)_os_log_send_and_compose_impl();
          if (v16)
            sub_18FAED60C();
        }
        else
        {
          v16 = 0;
        }
        free(v16);
      }

      if (a4)
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v18, *MEMORY[0x1E0CB2FE0], 2, 0, v20, v21, v22);
        goto LABEL_32;
      }
    }
    v7 = 0;
    return v7;
  }
  sub_18FAF95A4((uint64_t)UMPasswd, (uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

@end

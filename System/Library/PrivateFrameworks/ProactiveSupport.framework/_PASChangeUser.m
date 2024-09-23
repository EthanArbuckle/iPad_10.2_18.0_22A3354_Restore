@implementation _PASChangeUser

+ (BOOL)becomeCurrentUser
{
  BOOL v2;
  passwd *v3;
  passwd *v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  char *v9;
  char *v10;
  char *pw_name;
  int *v12;
  char *v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  int *v17;
  char *v18;
  char *v20;
  uid_t pw_uid;
  int v22;
  char *v23;
  __int16 v24;
  char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (getuid())
    return 1;
  *__error() = 0;
  v3 = getpwnam("mobile");
  if (!v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v17 = __error();
      v18 = strerror(*v17);
      v22 = 136315138;
      v23 = v18;
      v14 = MEMORY[0x1E0C81028];
      v15 = "Warning: failed to get pwInfo: %s\n";
      v16 = 12;
      goto LABEL_21;
    }
    return 0;
  }
  v4 = v3;
  if (!v3->pw_uid)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      v14 = MEMORY[0x1E0C81028];
      v15 = "Warning: got pwInfo for uid=0.\n";
      v16 = 2;
      goto LABEL_21;
    }
    return 0;
  }
  v5 = getenv("LLVM_PROFILE_FILE");
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%p"), v8);
    v9 = (char *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v22 = 138412290;
      v23 = v9;
      _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Retaining write permission to proile data file: %@", (uint8_t *)&v22, 0xCu);
    }
    v10 = objc_retainAutorelease(v9);
    chmod((const char *)objc_msgSend(v10, "fileSystemRepresentation"), 0x1B6u);

  }
  *__error() = 0;
  if (setuid(v4->pw_uid) || !getuid())
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      pw_name = v4->pw_name;
      v12 = __error();
      v13 = strerror(*v12);
      v22 = 136315394;
      v23 = pw_name;
      v24 = 2080;
      v25 = v13;
      v14 = MEMORY[0x1E0C81028];
      v15 = "Warning: failed to setuid to account \"%s\": %s\n";
      v16 = 22;
LABEL_21:
      _os_log_error_impl(&dword_1A0957000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v22, v16);
      return 0;
    }
    return 0;
  }
  v2 = 1;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v20 = v4->pw_name;
    pw_uid = v4->pw_uid;
    v22 = 136315394;
    v23 = v20;
    v24 = 1024;
    LODWORD(v25) = pw_uid;
    _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Dropping root privileges to %s (%i)", (uint8_t *)&v22, 0x12u);
  }
  return v2;
}

@end

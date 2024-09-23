@implementation SSFeatureEnablerMigrator

+ (void)migrate
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  int v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  const void *v37;
  void *v38;
  int v39;
  int v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE *v51;
  uint64_t v52;
  _BYTE v53[24];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MGCopyAnswer();
  CFPreferencesAppSynchronize(CFSTR("com.apple.springboard"));
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("SBLastSystemVersion"), CFSTR("com.apple.springboard"));
  if (!v3)
  {
    CFPreferencesAppSynchronize(CFSTR("com.apple.migration"));
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("LastSystemVersion"), CFSTR("com.apple.migration"));
  }
  +[SSLogConfig sharedFeatureEnablerMigrationConfig](SSLogConfig, "sharedFeatureEnablerMigrationConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    v6 &= 2u;
  if (!v6)
    goto LABEL_13;
  *(_DWORD *)v53 = 138543874;
  *(_QWORD *)&v53[4] = objc_opt_class();
  *(_WORD *)&v53[12] = 2114;
  *(_QWORD *)&v53[14] = v3;
  *(_WORD *)&v53[22] = 2114;
  v54 = v2;
  v8 = *(id *)&v53[4];
  LODWORD(v52) = 32;
  v51 = v53;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, v53, v52, *(_OWORD *)v53, *(_QWORD *)&v53[16], v54);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog(v4, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v7);
LABEL_13:

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v16 = objc_msgSend(v3, "integerValue");
    if (v16 != objc_msgSend(v2, "integerValue"))
    {
      CFPreferencesSetAppValue(CFSTR("com.apple.storeservices.itfe"), 0, CFSTR("com.apple.itunesstored"));
      CFPreferencesAppSynchronize(CFSTR("com.apple.storeservices.itfe"));
      +[SSLogConfig sharedFeatureEnablerMigrationConfig](SSLogConfig, "sharedFeatureEnablerMigrationConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v18 = objc_msgSend(v17, "shouldLog", v51);
      if (objc_msgSend(v17, "shouldLogToDisk"))
        v19 = v18 | 2;
      else
        v19 = v18;
      objc_msgSend(v17, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        v19 &= 2u;
      if (v19)
      {
        v21 = (void *)objc_opt_class();
        *(_DWORD *)v53 = 138543362;
        *(_QWORD *)&v53[4] = v21;
        v22 = v21;
        LODWORD(v52) = 12;
        v51 = v53;
        v23 = (void *)_os_log_send_and_compose_impl();

        if (!v23)
        {
LABEL_28:

          objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "removeProfileWithIdentifier:", CFSTR("com.apple.storeservices-itfe"));

          goto LABEL_29;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v23, 4, v53, v52);
        v20 = objc_claimAutoreleasedReturnValue();
        free(v23);
        SSFileLog(v17, CFSTR("%@"), v24, v25, v26, v27, v28, v29, (uint64_t)v20);
      }

      goto LABEL_28;
    }
  }
LABEL_29:
  if (v3)
    CFRelease(v3);
  +[SSDevice currentDevice](SSDevice, "currentDevice", v51);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "productVersion");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)CFPreferencesCopyAppValue(CFSTR("performedMigration11"), CFSTR("com.apple.storeservices.itfe"));
  if (SSIsInternalBuild() && objc_msgSend(v32, "isEqualToString:", CFSTR("11.0")) && !v33)
  {
    v34 = (void *)CFPreferencesCopyAppValue(CFSTR("features"), CFSTR("com.apple.storeservices.itfe"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v35 = (id)objc_msgSend(v34, "mutableCopy");
    else
      v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v36 = v35;
    v37 = (const void *)MEMORY[0x1E0C9AAB0];
    objc_msgSend(v35, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("amf"));
    CFPreferencesSetAppValue(CFSTR("features"), v36, CFSTR("com.apple.storeservices.itfe"));
    CFPreferencesSetAppValue(CFSTR("performedMigration11"), v37, CFSTR("com.apple.storeservices.itfe"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.storeservices.itfe"));
    +[SSLogConfig sharedFeatureEnablerMigrationConfig](SSLogConfig, "sharedFeatureEnablerMigrationConfig");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v38)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v39 = objc_msgSend(v38, "shouldLog");
    if (objc_msgSend(v38, "shouldLogToDisk"))
      v40 = v39 | 2;
    else
      v40 = v39;
    objc_msgSend(v38, "OSLogObject");
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      v40 &= 2u;
    if (v40)
    {
      v42 = (void *)objc_opt_class();
      *(_DWORD *)v53 = 138543362;
      *(_QWORD *)&v53[4] = v42;
      v43 = v42;
      LODWORD(v52) = 12;
      v44 = (void *)_os_log_send_and_compose_impl();

      if (!v44)
      {
LABEL_48:

        goto LABEL_49;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v44, 4, v53, v52);
      v41 = objc_claimAutoreleasedReturnValue();
      free(v44);
      SSFileLog(v38, CFSTR("%@"), v45, v46, v47, v48, v49, v50, (uint64_t)v41);
    }

    goto LABEL_48;
  }
LABEL_49:

}

@end

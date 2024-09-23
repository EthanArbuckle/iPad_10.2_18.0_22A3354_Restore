@implementation VCUserDefaults

+ (id)sharedUserDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__VCUserDefaults_sharedUserDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedUserDefaults_once != -1)
    dispatch_once(&sharedUserDefaults_once, block);
  return (id)sharedUserDefaults_userDefaults;
}

void __36__VCUserDefaults_sharedUserDefaults__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithSuiteName:", CFSTR("com.apple.siri.VoiceShortcuts"));
  v2 = (void *)sharedUserDefaults_userDefaults;
  sharedUserDefaults_userDefaults = v1;

}

- (id)codableObjectOfClass:(Class)a3 forKey:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCUserDefaults.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  -[VCUserDefaults objectForKey:](self, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", a3, v8, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    if (!v9)
    {
      getWFGeneralLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v16 = "-[VCUserDefaults codableObjectOfClass:forKey:]";
        v17 = 2112;
        v18 = v7;
        v19 = 2112;
        v20 = v10;
        _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_ERROR, "%s Failed to unarchive object for key (%@) with Error: %@", buf, 0x20u);
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)setCodableObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;

  v9 = a3;
  v10 = a4;
  if (v10)
  {
    if (v9)
      goto LABEL_3;
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCUserDefaults.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  if (!v9)
    goto LABEL_6;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
LABEL_7:
    -[VCUserDefaults setObject:forKey:](self, "setObject:forKey:", v11, v10);

    v12 = 1;
    goto LABEL_8;
  }
  v12 = 0;
LABEL_8:

  return v12;
}

@end

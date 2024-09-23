@implementation SFCollaborationUserDefaults

+ (id)sharedDefaults
{
  if (sharedDefaults_once != -1)
    dispatch_once(&sharedDefaults_once, &__block_literal_global_12);
  return (id)sharedDefaults_sharedDefaults;
}

void __45__SFCollaborationUserDefaults_sharedDefaults__block_invoke()
{
  SFCollaborationUserDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(SFCollaborationUserDefaults);
  v1 = (void *)sharedDefaults_sharedDefaults;
  sharedDefaults_sharedDefaults = (uint64_t)v0;

}

- (void)setCollaborativeMode:(BOOL)a3 contentIdentifier:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("SFCollaborationUserDefaults"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "no";
    if (v4)
      v8 = "yes";
    *(_DWORD *)buf = 136315394;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1A2830000, v7, OS_LOG_TYPE_DEFAULT, "Saving collaborative mode:%s for contentIdentifier:%@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, v6);

}

- (id)existingCollaborativeModeForContentIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("SFCollaborationUserDefaults"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  share_sheet_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v6, "BOOLValue");
    v9 = "no";
    if (v8)
      v9 = "yes";
    *(_DWORD *)buf = 136315394;
    v12 = v9;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1A2830000, v7, OS_LOG_TYPE_DEFAULT, "Retrieving collaborative mode:%s for contentIdentifier:%@", buf, 0x16u);
  }

  return v6;
}

@end

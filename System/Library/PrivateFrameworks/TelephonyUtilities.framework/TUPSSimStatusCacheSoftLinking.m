@implementation TUPSSimStatusCacheSoftLinking

+ (id)fetchSubscriptionsInUse
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 buf;
  Class (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
    v3 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "%@ fetching current CTXPCServiceSubscriptions in use", (uint8_t *)&buf, 0xCu);

  }
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v4 = (void *)getPSSimStatusCacheClass_softClass;
  v12 = getPSSimStatusCacheClass_softClass;
  if (!getPSSimStatusCacheClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v14 = __getPSSimStatusCacheClass_block_invoke;
    v15 = &unk_1E38A1710;
    v16 = &v9;
    __getPSSimStatusCacheClass_block_invoke((uint64_t)&buf);
    v4 = (void *)v10[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(v5, "sharedInstance", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscriptionsInUse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end

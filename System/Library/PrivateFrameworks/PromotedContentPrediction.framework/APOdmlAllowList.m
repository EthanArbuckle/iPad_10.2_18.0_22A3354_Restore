@implementation APOdmlAllowList

- (void)reinitializeAllowList
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  APOdmlAllowListReader *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  const char *v16;
  id v17;
  const char *v18;
  NSObject *v19;
  id v20;
  const char *v21;
  const char *v22;
  const char *v23;
  void *v24;
  _BYTE v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetManagerForPlacementType_assetManagerType_(v4, v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_pathForFactor_isDirectory_(v6, v7, (uint64_t)CFSTR("AllowList"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc_init(APOdmlAllowListReader);
    objc_msgSend_openForReadingContentsOfURL_(v9, v10, (uint64_t)v8);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      OdmlLogForCategory(7uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v25 = 138412546;
        *(_QWORD *)&v25[4] = objc_opt_class();
        *(_WORD *)&v25[12] = 2112;
        *(_QWORD *)&v25[14] = v13;
        v15 = *(id *)&v25[4];
        _os_log_impl(&dword_1B69D6000, v14, OS_LOG_TYPE_ERROR, "[%@] Error initializing AllowList: %@", v25, 0x16u);

      }
      objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsReranking, v16, (uint64_t)v13, 0);
      v17 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    }
    else
    {
      objc_msgSend_readFile(v9, v11, v12);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = v17;
    objc_msgSend_setAllowList_(self, v18, (uint64_t)v17, *(_OWORD *)v25, *(_QWORD *)&v25[16]);

  }
  else
  {
    OdmlLogForCategory(7uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v25 = 138412290;
      *(_QWORD *)&v25[4] = objc_opt_class();
      v20 = *(id *)&v25[4];
      _os_log_impl(&dword_1B69D6000, v19, OS_LOG_TYPE_ERROR, "[%@] Bad path for AllowList asset.", v25, 0xCu);

    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v21, (uint64_t)CFSTR("APOdmlRerankingErrorDomain"), 3004, 0);
    v9 = (APOdmlAllowListReader *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsReranking, v22, (uint64_t)v9, 0);
    v13 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    objc_msgSend_setAllowList_(self, v23, (uint64_t)v13);
  }

}

- (void)setAllowList:(id)a3
{
  objc_storeStrong((id *)&self->_allowList, a3);
}

- (APOdmlAllowList)init
{
  APOdmlAllowList *v2;
  const char *v3;
  uint64_t v4;
  APOdmlAllowList *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)APOdmlAllowList;
  v2 = -[APOdmlAllowList init](&v7, sel_init);
  v5 = v2;
  if (v2)
    objc_msgSend_reinitializeAllowList(v2, v3, v4);
  return v5;
}

+ (id)sharedInstance
{
  if (qword_1ED532EB0 != -1)
    dispatch_once(&qword_1ED532EB0, &unk_1E6A29780);
  return (id)qword_1ED532F68;
}

- (BOOL)isAllowed:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  char v9;

  v4 = a3;
  objc_msgSend_allowList(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_containsObject_(v7, v8, (uint64_t)v4);

  return v9;
}

- (unint64_t)count
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_allowList(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_count(v3, v4, v5);

  return v6;
}

- (NSSet)allowList
{
  return self->_allowList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowList, 0);
}

@end

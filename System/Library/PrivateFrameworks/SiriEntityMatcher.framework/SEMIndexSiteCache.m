@implementation SEMIndexSiteCache

- (SEMIndexSiteCache)initWithRootDirectoryURL:(id)a3 readOnly:(BOOL)a4
{
  id v7;
  SEMIndexSiteCache *v8;
  SEMIndexSiteCache *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SEMIndexSiteCache;
  v8 = -[SEMIndexSiteCache init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_rootDirectoryURL, a3);
    v9->_readOnly = a4;
  }

  return v9;
}

- (id)indexSiteWithUserId:(id)a3 error:(id *)a4
{
  const char *v6;
  id v7;
  SEMIndexSite *v8;
  const char *v9;
  void *v10;
  const char *v11;

  v7 = a3;
  if (v7)
  {
    objc_msgSend_objectForKey_(self->_userExIndexSites, v6, (uint64_t)v7);
    v8 = (SEMIndexSite *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = self->_defaultIndexSite;
  }
  v10 = v8;
  if (!v8)
  {
    objc_msgSend__indexSiteAtRootDirectoryURL_userId_readOnly_error_(SEMIndexSite, v9, (uint64_t)self->_rootDirectoryURL, v7, self->_readOnly, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__cacheIndexSite_(self, v11, (uint64_t)v10);
  }

  return v10;
}

- (id)indexSiteAtURL:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  SEMIndexSite *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  const char *v19;
  const char *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend_isEquivalentIndexSiteURL_(self->_defaultIndexSite, v7, (uint64_t)v6))
  {
    v10 = self->_defaultIndexSite;
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend_allValues(self->_userExIndexSites, v8, v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v22, v26, 16);
    if (v13)
    {
      v15 = v13;
      v16 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v11);
          v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if ((objc_msgSend_isEquivalentIndexSiteURL_(v18, v14, (uint64_t)v6) & 1) != 0)
          {
            v10 = v18;

            goto LABEL_13;
          }
        }
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v22, v26, 16);
        if (v15)
          continue;
        break;
      }
    }

    objc_msgSend__existingIndexSiteAtURL_readOnly_error_(SEMIndexSite, v19, (uint64_t)v6, self->_readOnly, a4);
    v10 = (SEMIndexSite *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__cacheIndexSite_(self, v20, (uint64_t)v10);
  }
LABEL_13:

  return v10;
}

- (BOOL)removeIndexSite:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  char v13;
  SEMIndexSite *defaultIndexSite;

  v6 = a3;
  v9 = v6;
  if (v6)
  {
    objc_msgSend_userId(v6, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend_removeObjectForKey_(self->_userExIndexSites, v10, (uint64_t)v11);
    }
    else
    {
      defaultIndexSite = self->_defaultIndexSite;
      self->_defaultIndexSite = 0;

    }
    if (self->_readOnly)
      v13 = 1;
    else
      v13 = objc_msgSend_remove_(v9, v12, (uint64_t)a4);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)clear
{
  SEMIndexSite *defaultIndexSite;
  const char *v4;
  uint64_t v5;

  defaultIndexSite = self->_defaultIndexSite;
  self->_defaultIndexSite = 0;

  objc_msgSend_removeAllObjects(self->_userExIndexSites, v4, v5);
}

- (void)_cacheIndexSite:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  NSMutableDictionary *userExIndexSites;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  id v13;

  v5 = a3;
  if (v5)
  {
    v13 = v5;
    objc_msgSend_userId(v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      userExIndexSites = self->_userExIndexSites;
      if (!userExIndexSites)
      {
        v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        v12 = self->_userExIndexSites;
        self->_userExIndexSites = v11;

        userExIndexSites = self->_userExIndexSites;
      }
      objc_msgSend_setObject_forKey_(userExIndexSites, v8, (uint64_t)v13, v9);
    }
    else
    {
      objc_storeStrong((id *)&self->_defaultIndexSite, a3);
    }

    v5 = v13;
  }

}

- (void)enumerateIndexSitesUsingBlock:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  SEMIndexSite *defaultIndexSite;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v6 = (void (**)(_QWORD, _QWORD))v4;
  defaultIndexSite = self->_defaultIndexSite;
  if (defaultIndexSite)
    (*((void (**)(id))v4 + 2))(v4);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend_allValues(self->_userExIndexSites, (const char *)defaultIndexSite, v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x249557014]();
        v6[2](v6, v14);
        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v16, (uint64_t)&v17, v21, 16);
    }
    while (v11);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userExIndexSites, 0);
  objc_storeStrong((id *)&self->_defaultIndexSite, 0);
  objc_storeStrong((id *)&self->_rootDirectoryURL, 0);
}

@end

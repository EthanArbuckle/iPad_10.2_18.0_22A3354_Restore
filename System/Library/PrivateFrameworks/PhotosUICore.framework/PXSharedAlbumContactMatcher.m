@implementation PXSharedAlbumContactMatcher

- (PXSharedAlbumContactMatcher)init
{
  PXSharedAlbumContactMatcher *v2;
  NSCache *v3;
  NSCache *contactIdentifiersBySubscriberIdentifiers;
  NSCache *v5;
  NSCache *contactPhotosCache;
  NSCache *v7;
  NSCache *avatarRendererByContactImageDiameter;
  uint64_t v9;
  CNContactStore *contactStore;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXSharedAlbumContactMatcher;
  v2 = -[PXSharedAlbumContactMatcher init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    contactIdentifiersBySubscriberIdentifiers = v2->_contactIdentifiersBySubscriberIdentifiers;
    v2->_contactIdentifiersBySubscriberIdentifiers = v3;

    v5 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    contactPhotosCache = v2->_contactPhotosCache;
    v2->_contactPhotosCache = v5;

    -[NSCache setTotalCostLimit:](v2->_contactPhotosCache, "setTotalCostLimit:", 0x200000);
    v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    avatarRendererByContactImageDiameter = v2->_avatarRendererByContactImageDiameter;
    v2->_avatarRendererByContactImageDiameter = v7;

    +[PXPeopleUtilities sharedContactStore](PXPeopleUtilities, "sharedContactStore");
    v9 = objc_claimAutoreleasedReturnValue();
    contactStore = v2->_contactStore;
    v2->_contactStore = (CNContactStore *)v9;

    -[PXSharedAlbumContactMatcher _observeContactStoreNotifications](v2, "_observeContactStoreNotifications");
  }
  return v2;
}

- (void)_observeContactStoreNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_contactsDidChange_, *MEMORY[0x1E0C96870], self->_contactStore);

}

- (id)contactsMatchingSubscriberInfos:(id)a3 keysToFetch:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const __CFString *v15;
  __CFString *v16;
  BOOL v17;
  id v18;
  PXSharedAlbumContactMatcher *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  void *v32;
  NSCache *contactIdentifiersBySubscriberIdentifiers;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  NSCache *v38;
  const __CFString *v39;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v47 = a4;
  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v59 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[NSCache objectForKey:](self->_contactIdentifiersBySubscriberIdentifiers, "objectForKey:", v14);
          v15 = (const __CFString *)objc_claimAutoreleasedReturnValue();
          v16 = (__CFString *)v15;
          if (v15)
            v17 = v15 == CFSTR("PXSharedAlbumContactNotFoundIdentifier");
          else
            v17 = 1;
          if (!v17)
          {
            objc_msgSend(v6, "addObject:", v15);
            objc_msgSend(v7, "addObject:", v13);
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    }
    while (v10);
  }

  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = self;
  v43 = v6;
  -[PXSharedAlbumContactMatcher _fetchContactsMatchingIdentifiers:keysToFetch:](self, "_fetchContactsMatchingIdentifiers:keysToFetch:", v6, v47);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v7, "count");
  if (v21 == objc_msgSend(v20, "count"))
  {
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __75__PXSharedAlbumContactMatcher_contactsMatchingSubscriberInfos_keysToFetch___block_invoke;
    v54[3] = &unk_1E511A2A8;
    v55 = v18;
    v56 = v7;
    v57 = v20;
    objc_msgSend(v57, "enumerateObjectsUsingBlock:", v54);

  }
  v41 = v20;
  v42 = v7;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v22 = v8;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  v24 = v46;
  if (v23)
  {
    v25 = v23;
    v49 = *(_QWORD *)v51;
    v44 = v22;
    v45 = v18;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v51 != v49)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        objc_msgSend(v27, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCache objectForKey:](v19->_contactIdentifiersBySubscriberIdentifiers, "objectForKey:", v28);
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v29)
        {
          objc_msgSend(v24, "addObject:", v29);
        }
        else if (v30 != CFSTR("PXSharedAlbumContactNotFoundIdentifier"))
        {
          -[PXSharedAlbumContactMatcher _fetchContactMatchingSubscriberInfo:keysToFetch:](v19, "_fetchContactMatchingSubscriberInfo:keysToFetch:", v27, v47);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
            objc_msgSend(v24, "addObject:", v32);
          contactIdentifiersBySubscriberIdentifiers = v19->_contactIdentifiersBySubscriberIdentifiers;
          objc_msgSend(v32, "identifier");
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = (void *)v34;
          if (v34)
            v36 = (const __CFString *)v34;
          else
            v36 = CFSTR("PXSharedAlbumContactNotFoundIdentifier");
          objc_msgSend(v27, "identifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = contactIdentifiersBySubscriberIdentifiers;
          v24 = v46;
          v39 = v36;
          v19 = self;
          -[NSCache setObject:forKey:](v38, "setObject:forKey:", v39, v37);

          v22 = v44;
          v18 = v45;
        }

      }
      v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    }
    while (v25);
  }

  return v24;
}

- (void)requestContactPhotoForContact:(id)a3 diameter:(double)a4 resultHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  void (**v27)(id, void *);
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("-%d"), (uint64_t)a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSCache objectForKey:](self->_contactPhotosCache, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v9[2](v9, v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache objectForKey:](self->_avatarRendererByContactImageDiameter, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v15 = objc_alloc(MEMORY[0x1E0C97450]);
      objc_msgSend(MEMORY[0x1E0C97458], "defaultSettings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v15, "initWithSettings:", v16);

      -[NSCache setObject:forKey:](self->_avatarRendererByContactImageDiameter, "setObject:forKey:", v14, v13);
    }
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scale");
    v19 = v18;

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "userInterfaceLayoutDirection") == 1;

    objc_msgSend(MEMORY[0x1E0C97460], "scopeWithPointSize:scale:rightToLeft:style:", v21, 0, a4, a4, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __84__PXSharedAlbumContactMatcher_requestContactPhotoForContact_diameter_resultHandler___block_invoke;
    v25[3] = &unk_1E511A2D0;
    v25[4] = self;
    v26 = v11;
    v27 = v9;
    v24 = (id)objc_msgSend(v14, "renderAvatarsForContacts:scope:imageHandler:", v23, v22, v25);

  }
}

- (id)_fetchContactMatchingIdentifier:(id)a3 keysToFetch:(id)a4
{
  CNContactStore *contactStore;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  contactStore = self->_contactStore;
  v9 = 0;
  -[CNContactStore unifiedContactWithIdentifier:keysToFetch:error:](contactStore, "unifiedContactWithIdentifier:keysToFetch:error:", a3, a4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v6)
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[PXSharedAlbumContactMatcher _fetchContactMatchingIdentifier:keysToFetch:]";
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "%s: Error while fetching contact: %@", buf, 0x16u);
    }

  }
  return v5;
}

- (id)_fetchContactsMatchingIdentifiers:(id)a3 keysToFetch:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  CNContactStore *contactStore;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C97200];
  v7 = a4;
  objc_msgSend(v6, "predicateForContactsWithIdentifiers:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  contactStore = self->_contactStore;
  v14 = 0;
  -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](contactStore, "unifiedContactsMatchingPredicate:keysToFetch:error:", v8, v7, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v14;
  if (v11)
  {
    PLUIGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[PXSharedAlbumContactMatcher _fetchContactsMatchingIdentifiers:keysToFetch:]";
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "%s: Error while fetching contacts: %@", buf, 0x16u);
    }

  }
  return v10;
}

- (id)_fetchContactMatchingSubscriberInfo:(id)a3 keysToFetch:(id)a4
{
  return (id)objc_msgSend(a3, "matchingContactWithKeysToFetch:outMatchingKey:outMatchingIdentifier:", a4, 0, 0);
}

- (void)contactsDidChange:(id)a3
{
  -[NSCache removeAllObjects](self->_contactIdentifiersBySubscriberIdentifiers, "removeAllObjects", a3);
  -[NSCache removeAllObjects](self->_contactPhotosCache, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactPhotosCache, 0);
  objc_storeStrong((id *)&self->_contactIdentifiersBySubscriberIdentifiers, 0);
  objc_storeStrong((id *)&self->_avatarRendererByContactImageDiameter, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

void __84__PXSharedAlbumContactMatcher_requestContactPhotoForContact_diameter_resultHandler___block_invoke(_QWORD *a1, id a2)
{
  CGImage *v3;
  size_t Height;
  id v5;

  v5 = objc_retainAutorelease(a2);
  v3 = (CGImage *)objc_msgSend(v5, "CGImage");
  Height = CGImageGetHeight(v3);
  objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKey:cost:", v5, a1[5], CGImageGetBytesPerRow(v3) * Height);
  (*(void (**)(void))(a1[6] + 16))();

}

void __75__PXSharedAlbumContactMatcher_contactsMatchingSubscriberInfos_keysToFetch___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v7);

}

+ (id)sharedMatcher
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PXSharedAlbumContactMatcher_sharedMatcher__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMatcher_onceToken != -1)
    dispatch_once(&sharedMatcher_onceToken, block);
  return (id)sharedMatcher_sharedMatcher;
}

void __44__PXSharedAlbumContactMatcher_sharedMatcher__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedMatcher_sharedMatcher;
  sharedMatcher_sharedMatcher = (uint64_t)v1;

}

@end

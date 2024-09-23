@implementation ICInAppMessageEntry

- (ICInAppMessageEntry)initWithApplicationMessage:(id)a3 bundleIdentifier:(id)a4
{
  id v7;
  id v8;
  ICInAppMessageEntry *v9;
  ICInAppMessageEntry *v10;
  uint64_t v11;
  NSString *bundleIdentifier;
  uint64_t v13;
  NSMutableDictionary *metadata;
  dispatch_queue_t v15;
  OS_dispatch_queue *accessQueue;
  uint64_t v17;
  NSMutableDictionary *resourceCache;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ICInAppMessageEntry;
  v9 = -[ICInAppMessageEntry init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_applicationMessage, a3);
    v11 = objc_msgSend(v8, "copy");
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    metadata = v10->_metadata;
    v10->_metadata = (NSMutableDictionary *)v13;

    v15 = dispatch_queue_create("com.apple.iTunesCloud.ICInAppMessageEntry.accessQueue", 0);
    accessQueue = v10->_accessQueue;
    v10->_accessQueue = (OS_dispatch_queue *)v15;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    resourceCache = v10->_resourceCache;
    v10->_resourceCache = (NSMutableDictionary *)v17;

  }
  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  NSString *bundleIdentifier;
  void *v11;
  void *v12;

  if (-[ICIAMApplicationMessage hasStartDate](self->_applicationMessage, "hasStartDate"))
  {
    v3 = (void *)MEMORY[0x1E0C99D68];
    -[ICIAMApplicationMessage startDate](self->_applicationMessage, "startDate");
    objc_msgSend(v3, "dateWithTimeIntervalSince1970:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[ICIAMApplicationMessage hasEndDate](self->_applicationMessage, "hasEndDate"))
  {
    v5 = (void *)MEMORY[0x1E0C99D68];
    -[ICIAMApplicationMessage endDate](self->_applicationMessage, "endDate");
    objc_msgSend(v5, "dateWithTimeIntervalSince1970:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = -[ICIAMApplicationMessage messageType](self->_applicationMessage, "messageType");
  if (v7 < 5 && ((0x17u >> v7) & 1) != 0)
  {
    v8 = off_1E438B630[v7];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  bundleIdentifier = self->_bundleIdentifier;
  -[ICIAMApplicationMessage identifier](self->_applicationMessage, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("[%@:%@, %@, (valid from %@ - %@), download=%d]"), bundleIdentifier, v11, v8, v4, v6, self->_shouldDownloadResources);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSDictionary)metadata
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9727;
  v10 = __Block_byref_object_dispose__9728;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__ICInAppMessageEntry_metadata__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (void)updateMetadataValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ICInAppMessageEntry_updateMetadataValue_forKey___block_invoke;
  block[3] = &unk_1E4391230;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(accessQueue, block);

}

- (id)cachedLocationForResourceWithIdentifier:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9727;
  v16 = __Block_byref_object_dispose__9728;
  v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__ICInAppMessageEntry_cachedLocationForResourceWithIdentifier___block_invoke;
  block[3] = &unk_1E43907D8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)setCacheLocation:(id)a3 forResourceWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__ICInAppMessageEntry_setCacheLocation_forResourceWithIdentifier___block_invoke;
  block[3] = &unk_1E4391230;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(accessQueue, block);

}

- (void)clearCachedResources
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__ICInAppMessageEntry_clearCachedResources__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (id)allCachedResourceLocations
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9727;
  v10 = __Block_byref_object_dispose__9728;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__ICInAppMessageEntry_allCachedResourceLocations__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (ICInAppMessageEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ICInAppMessageEntry *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *metadata;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSMutableDictionary *resourceCache;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationMessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICInAppMessageEntry initWithApplicationMessage:bundleIdentifier:](self, "initWithApplicationMessage:bundleIdentifier:", v5, v6);
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("metadata"));
    v12 = objc_claimAutoreleasedReturnValue();
    metadata = v7->_metadata;
    v7->_metadata = (NSMutableDictionary *)v12;

    -[ICInAppMessageEntry setShouldDownloadResources:](v7, "setShouldDownloadResources:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldDownloadResources")));
    -[ICInAppMessageEntry setDidCacheRequiredResources:](v7, "setDidCacheRequiredResources:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didCacheRequiredResources")));
    -[ICInAppMessageEntry setIsBadgingApplication:](v7, "setIsBadgingApplication:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBadgingApplication")));
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("resourceCache"));
    v17 = objc_claimAutoreleasedReturnValue();
    resourceCache = v7->_resourceCache;
    v7->_resourceCache = (NSMutableDictionary *)v17;

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  ICIAMApplicationMessage *applicationMessage;
  id v5;

  applicationMessage = self->_applicationMessage;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", applicationMessage, CFSTR("applicationMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));
  objc_msgSend(v5, "encodeBool:forKey:", -[ICInAppMessageEntry shouldDownloadResources](self, "shouldDownloadResources"), CFSTR("shouldDownloadResources"));
  objc_msgSend(v5, "encodeBool:forKey:", -[ICInAppMessageEntry didCacheRequiredResources](self, "didCacheRequiredResources"), CFSTR("didCacheRequiredResources"));
  objc_msgSend(v5, "encodeBool:forKey:", -[ICInAppMessageEntry isBadgingApplication](self, "isBadgingApplication"), CFSTR("isBadgingApplication"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resourceCache, CFSTR("resourceCache"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  ICInAppMessageEntry *v7;
  NSObject *accessQueue;
  _QWORD block[7];

  v5 = -[ICIAMApplicationMessage copyWithZone:](self->_applicationMessage, "copyWithZone:");
  v6 = (void *)-[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  v7 = -[ICInAppMessageEntry initWithApplicationMessage:bundleIdentifier:](+[ICInAppMessageEntry allocWithZone:](ICInAppMessageEntry, "allocWithZone:", a3), "initWithApplicationMessage:bundleIdentifier:", v5, v6);
  if (v7)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__ICInAppMessageEntry_copyWithZone___block_invoke;
    block[3] = &unk_1E438C1C8;
    block[4] = v7;
    block[5] = self;
    block[6] = a3;
    dispatch_sync(accessQueue, block);
  }

  return v7;
}

- (ICIAMApplicationMessage)applicationMessage
{
  return self->_applicationMessage;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)shouldDownloadResources
{
  return self->_shouldDownloadResources;
}

- (void)setShouldDownloadResources:(BOOL)a3
{
  self->_shouldDownloadResources = a3;
}

- (BOOL)didCacheRequiredResources
{
  return self->_didCacheRequiredResources;
}

- (void)setDidCacheRequiredResources:(BOOL)a3
{
  self->_didCacheRequiredResources = a3;
}

- (BOOL)isBadgingApplication
{
  return self->_isBadgingApplication;
}

- (void)setIsBadgingApplication:(BOOL)a3
{
  self->_isBadgingApplication = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationMessage, 0);
  objc_storeStrong((id *)&self->_resourceCache, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

void __36__ICInAppMessageEntry_copyWithZone___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "copyWithZone:", *(_QWORD *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  objc_msgSend(*(id *)(a1 + 32), "setShouldDownloadResources:", objc_msgSend(*(id *)(a1 + 40), "shouldDownloadResources"));
  objc_msgSend(*(id *)(a1 + 32), "setDidCacheRequiredResources:", objc_msgSend(*(id *)(a1 + 40), "didCacheRequiredResources"));
  objc_msgSend(*(id *)(a1 + 32), "setIsBadgingApplication:", objc_msgSend(*(id *)(a1 + 40), "isBadgingApplication"));
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "copyWithZone:", *(_QWORD *)(a1 + 48));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v5;

}

void __49__ICInAppMessageEntry_allCachedResourceLocations__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __43__ICInAppMessageEntry_clearCachedResources__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "removeItemAtPath:error:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
}

uint64_t __66__ICInAppMessageEntry_setCacheLocation_forResourceWithIdentifier___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

void __63__ICInAppMessageEntry_cachedLocationForResourceWithIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __50__ICInAppMessageEntry_updateMetadataValue_forKey___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "setValue:forKey:", a1[5], a1[6]);
}

void __31__ICInAppMessageEntry_metadata__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

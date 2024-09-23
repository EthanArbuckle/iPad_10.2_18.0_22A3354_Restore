@implementation STStatusItemsBundleRecord

+ (id)recordType
{
  return CFSTR("StatusItems");
}

- (STStatusItemsBundleRecord)initWithBundleInfoDictionary:(id)a3 bundleRecordIdentifier:(id)a4 bundleURL:(id)a5
{
  id v8;
  STStatusItemsBundleRecord *v9;
  STStatusItemsBundleRecord *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  uint64_t v23;
  NSDictionary *statusItemsToVisualDescriptors;
  uint64_t v25;
  NSSet *statusItemIdentifiers;
  STStatusItemsBundleRecord *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v35.receiver = self;
  v35.super_class = (Class)STStatusItemsBundleRecord;
  v9 = -[STBundleRecord_Base initWithBundleInfoDictionary:bundleRecordIdentifier:bundleURL:](&v35, sel_initWithBundleInfoDictionary_bundleRecordIdentifier_bundleURL_, v8, a4, a5);
  v10 = v9;
  if (v9)
  {
    v28 = v9;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bs_safeArrayForKey:", CFSTR("STStatusItems"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v32;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v15);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v16, "bs_safeStringForKey:", CFSTR("Identifier"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "bs_safeDictionaryForKey:", CFSTR("VisualDescriptor"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0A38]), "initWithPlistRepresentation:", v18);
            v20 = (void *)v19;
            if (v17)
              v21 = v19 == 0;
            else
              v21 = 1;
            if (v21)
            {
              STSystemStatusLogBundleLoading();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138477827;
                v37 = v17;
                _os_log_error_impl(&dword_1D02C7000, v22, OS_LOG_TYPE_ERROR, "No valid visual descriptor for status item '%{private}@'", buf, 0xCu);
              }

            }
            else
            {
              objc_msgSend(v30, "setObject:forKey:", v19, v17);
              objc_msgSend(v29, "addObject:", v17);
            }

          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      }
      while (v13);
    }
    v23 = objc_msgSend(v30, "copy");
    v10 = v28;
    statusItemsToVisualDescriptors = v28->_statusItemsToVisualDescriptors;
    v28->_statusItemsToVisualDescriptors = (NSDictionary *)v23;

    v25 = objc_msgSend(v29, "copy");
    statusItemIdentifiers = v28->_statusItemIdentifiers;
    v28->_statusItemIdentifiers = (NSSet *)v25;

  }
  return v10;
}

- (id)visualDescriptorForStatusItemWithIdentifier:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_statusItemsToVisualDescriptors, "objectForKeyedSubscript:", a3);
}

- (NSSet)statusItemIdentifiers
{
  return self->_statusItemIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_statusItemsToVisualDescriptors, 0);
}

@end

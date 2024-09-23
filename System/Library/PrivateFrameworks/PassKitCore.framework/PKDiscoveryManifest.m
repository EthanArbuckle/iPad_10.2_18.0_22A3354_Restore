@implementation PKDiscoveryManifest

+ (id)manifestFromURL:(id)a3
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 1, &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  if (v4)
  {
    v5 = v4;
    PKLogFacilityTypeGetObject(0x10uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Failed to read archive data for Discovery Manifest with error: %@", buf, 0xCu);
    }
    v7 = 0;
  }
  else
  {
    v14 = 0;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v14);
    v8 = v14;
    if (v8)
    {
      v5 = v8;
      PKLogFacilityTypeGetObject(0x10uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v5;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to create unarchiver from data for Discovery Manifest with error: %@", buf, 0xCu);
      }
      v7 = 0;
    }
    else
    {
      v11 = objc_opt_class();
      v12 = *MEMORY[0x1E0CB2CD0];
      v13 = 0;
      -[NSObject decodeTopLevelObjectOfClass:forKey:error:](v6, "decodeTopLevelObjectOfClass:forKey:error:", v11, v12, &v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v13;
      if (!v5)
        goto LABEL_10;
      PKLogFacilityTypeGetObject(0x10uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v5;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to decode archived Discovery Manifest with error: %@", buf, 0xCu);
      }
    }

  }
LABEL_10:

  return v7;
}

- (PKDiscoveryManifest)initWithDictionary:(id)a3
{
  id v4;
  PKDiscoveryManifest *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  PKRule *v13;
  uint64_t v14;
  NSArray *rules;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  PKDiscoveryItem *v23;
  NSObject *v24;
  uint64_t v25;
  NSArray *discoveryItems;
  void *v27;
  PKDiscoveryMessagesMetadata *v28;
  int v29;
  NSObject *p_super;
  objc_class *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  NSObject *v35;
  objc_class *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  PKDiscoveryManifest *v40;
  objc_class *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  objc_class *v47;
  void *v48;
  objc_class *v49;
  void *v50;
  objc_class *v51;
  void *v52;
  id obj;
  NSObject *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  _BYTE v65[128];
  uint8_t v66[128];
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)PKDiscoveryManifest;
  v5 = -[PKDiscoveryManifest init](&v64, sel_init);
  if (!v5)
    goto LABEL_46;
  v5->_version = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("version"));
  v5->_miniCardsAllowed = objc_msgSend(v4, "PKBoolForKey:", CFSTR("miniCardsAllowed"));
  objc_msgSend(v4, "objectForKey:", CFSTR("rules"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v68 = v32;
      v69 = 2114;
      v70 = v34;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected array and received %{public}@", buf, 0x16u);

    }
LABEL_32:

    goto LABEL_33;
  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v6 = v6;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v61;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v61 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          PKLogFacilityTypeGetObject(0x10uLL);
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v36 = (objc_class *)objc_opt_class();
            NSStringFromClass(v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = (objc_class *)objc_opt_class();
            NSStringFromClass(v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v68 = v37;
            v69 = 2114;
            v70 = v39;
            _os_log_impl(&dword_18FC92000, v35, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

          }
          goto LABEL_32;
        }
        v13 = -[PKRule initWithDictionary:]([PKRule alloc], "initWithDictionary:", v12);
        if (v13)
          -[NSObject addObject:](v7, "addObject:", v13);

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      if (v9)
        continue;
      break;
    }
  }

  v14 = -[NSObject copy](v7, "copy");
  rules = v5->_rules;
  v5->_rules = (NSArray *)v14;

  objc_msgSend(v4, "objectForKey:", CFSTR("discoveryItems"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v57;
      obj = v17;
      while (2)
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v57 != v20)
            objc_enumerationMutation(obj);
          v22 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            PKLogFacilityTypeGetObject(0x10uLL);
            p_super = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
            {
              v45 = (objc_class *)objc_opt_class();
              NSStringFromClass(v45);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = (objc_class *)objc_opt_class();
              NSStringFromClass(v47);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v68 = v46;
              v69 = 2114;
              v70 = v48;
              _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

            }
            v29 = 1;
            v27 = obj;
            v24 = v55;
            goto LABEL_43;
          }
          v23 = -[PKDiscoveryItem initWithDictionary:]([PKDiscoveryItem alloc], "initWithDictionary:", v22);
          if (v23)
            -[NSObject addObject:](v55, "addObject:", v23);

        }
        v17 = obj;
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
        if (v19)
          continue;
        break;
      }
    }

    v24 = v55;
    v25 = -[NSObject copy](v55, "copy");
    discoveryItems = v5->_discoveryItems;
    v5->_discoveryItems = (NSArray *)v25;

    objc_msgSend(v4, "objectForKey:", CFSTR("engagementMessagesMetadata"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!v27)
      {
        v29 = 0;
        goto LABEL_44;
      }
      v28 = -[PKDiscoveryMessagesMetadata initWithDictionary:]([PKDiscoveryMessagesMetadata alloc], "initWithDictionary:", v27);
      v29 = 0;
      p_super = &v5->_messagesMetadata->super;
      v5->_messagesMetadata = v28;
    }
    else
    {
      PKLogFacilityTypeGetObject(0x10uLL);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (objc_class *)objc_opt_class();
        NSStringFromClass(v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v50;
        v69 = 2114;
        v70 = v52;
        _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

      }
      v29 = 1;
    }
LABEL_43:

LABEL_44:
    goto LABEL_45;
  }
  PKLogFacilityTypeGetObject(0x10uLL);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (objc_class *)objc_opt_class();
    NSStringFromClass(v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v68 = v42;
    v69 = 2114;
    v70 = v44;
    _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected array and received %{public}@", buf, 0x16u);

  }
  v29 = 1;
LABEL_45:

  if (!v29)
  {
LABEL_46:
    v40 = v5;
    goto LABEL_47;
  }
LABEL_33:
  v40 = 0;
LABEL_47:

  return v40;
}

- (PKDiscoveryManifest)initWithVersion:(int64_t)a3 rules:(id)a4 discoveryItems:(id)a5 engagementMessagesMetadata:(id)a6
{
  id v11;
  id v12;
  id v13;
  PKDiscoveryManifest *v14;
  PKDiscoveryManifest *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PKDiscoveryManifest;
  v14 = -[PKDiscoveryManifest init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_version = a3;
    objc_storeStrong((id *)&v14->_rules, a4);
    objc_storeStrong((id *)&v15->_discoveryItems, a5);
    objc_storeStrong((id *)&v15->_messagesMetadata, a6);
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDiscoveryManifest)initWithCoder:(id)a3
{
  id v4;
  PKDiscoveryManifest *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *discoveryItems;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *rules;
  uint64_t v16;
  PKDiscoveryMessagesMetadata *messagesMetadata;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKDiscoveryManifest;
  v5 = -[PKDiscoveryManifest init](&v19, sel_init);
  if (v5)
  {
    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
    v5->_miniCardsAllowed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("miniCardsAllowed"));
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("discoveryItems"));
    v9 = objc_claimAutoreleasedReturnValue();
    discoveryItems = v5->_discoveryItems;
    v5->_discoveryItems = (NSArray *)v9;

    v11 = objc_alloc(MEMORY[0x1E0C99E60]);
    v12 = objc_opt_class();
    v13 = (void *)objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("rules"));
    v14 = objc_claimAutoreleasedReturnValue();
    rules = v5->_rules;
    v5->_rules = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("engagementMessagesMetadata"));
    v16 = objc_claimAutoreleasedReturnValue();
    messagesMetadata = v5->_messagesMetadata;
    v5->_messagesMetadata = (PKDiscoveryMessagesMetadata *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", version, CFSTR("version"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_miniCardsAllowed, CFSTR("miniCardsAllowed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_discoveryItems, CFSTR("discoveryItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rules, CFSTR("rules"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_messagesMetadata, CFSTR("engagementMessagesMetadata"));

}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)isMiniCardsAllowed
{
  return self->_miniCardsAllowed;
}

- (NSArray)rules
{
  return self->_rules;
}

- (NSArray)discoveryItems
{
  return self->_discoveryItems;
}

- (PKDiscoveryMessagesMetadata)messagesMetadata
{
  return self->_messagesMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesMetadata, 0);
  objc_storeStrong((id *)&self->_discoveryItems, 0);
  objc_storeStrong((id *)&self->_rules, 0);
}

@end

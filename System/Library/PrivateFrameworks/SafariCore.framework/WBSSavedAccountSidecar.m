@implementation WBSSavedAccountSidecar

- (WBSSavedAccountSidecar)initWithUser:(id)a3 protectionSpace:(id)a4
{
  return -[WBSSavedAccountSidecar initWithUser:protectionSpace:dictionaryRepresentation:](self, "initWithUser:protectionSpace:dictionaryRepresentation:", a3, a4, MEMORY[0x1E0C9AA70]);
}

- (WBSSavedAccountSidecar)initWithUser:(id)a3 protectionSpace:(id)a4 dictionaryRepresentation:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSSavedAccountSidecar *v11;
  uint64_t v12;
  NSDictionary *originalKeychainDictionary;
  uint64_t v14;
  NSString *user;
  uint64_t v16;
  NSURLProtectionSpace *protectionSpace;
  uint64_t v18;
  WBSTOTPGenerator *v19;
  WBSTOTPGenerator *totpGenerator;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  WBSPasswordWarningHideMarker *v26;
  WBSPasswordWarningHideMarker *hideWarningMarker;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSDate *lastOneTimeShareDateForPasskey;
  id v33;
  void *v34;
  uint64_t v35;
  NSMutableDictionary *contextSpecificData;
  WBSSavedAccountSidecar *v37;
  void *v38;
  WBSFormerlySharedSavedAccountMarker *v39;
  WBSFormerlySharedSavedAccountMarker *formerlySharedSavedAccountMarker;
  void *v41;
  uint64_t v42;
  NSArray *additionalSites;
  WBSSavedAccountSidecar *v44;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[4];
  WBSSavedAccountSidecar *v50;
  objc_super v51;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v51.receiver = self;
  v51.super_class = (Class)WBSSavedAccountSidecar;
  v11 = -[WBSSavedAccountSidecar init](&v51, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    originalKeychainDictionary = v11->_originalKeychainDictionary;
    v11->_originalKeychainDictionary = (NSDictionary *)v12;

    v14 = objc_msgSend(v8, "copy");
    user = v11->_user;
    v11->_user = (NSString *)v14;

    v48 = v9;
    v16 = objc_msgSend(v9, "copy");
    protectionSpace = v11->_protectionSpace;
    v11->_protectionSpace = (NSURLProtectionSpace *)v16;

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("totp"));
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = -[WBSTOTPGenerator initWithDictionaryRepresentation:]([WBSTOTPGenerator alloc], "initWithDictionaryRepresentation:", v18);
      totpGenerator = v11->_totpGenerator;
      v11->_totpGenerator = v19;

    }
    v47 = (void *)v18;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("notes"));
    v21 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v21, 4);
      if (objc_msgSend(v22, "length"))
        objc_storeStrong((id *)&v11->_notesEntry, v22);

    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("title"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v23, 4);
      if (objc_msgSend(v24, "length"))
        objc_storeStrong((id *)&v11->_customTitle, v24);

    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("hwm"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = -[WBSPasswordWarningHideMarker initWithDictionaryRepresentation:]([WBSPasswordWarningHideMarker alloc], "initWithDictionaryRepresentation:", v25);
      hideWarningMarker = v11->_hideWarningMarker;
      v11->_hideWarningMarker = v26;

    }
    objc_msgSend(v10, "safari_numberForKey:", CFSTR("otsd"), v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      v30 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v28, "doubleValue");
      objc_msgSend(v30, "dateWithTimeIntervalSinceReferenceDate:");
      v31 = objc_claimAutoreleasedReturnValue();
      lastOneTimeShareDateForPasskey = v11->_lastOneTimeShareDateForPasskey;
      v11->_lastOneTimeShareDateForPasskey = (NSDate *)v31;

    }
    v33 = v8;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ctxt"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v35 = objc_claimAutoreleasedReturnValue();
    contextSpecificData = v11->_contextSpecificData;
    v11->_contextSpecificData = (NSMutableDictionary *)v35;

    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __80__WBSSavedAccountSidecar_initWithUser_protectionSpace_dictionaryRepresentation___block_invoke;
    v49[3] = &unk_1E649F2C8;
    v37 = v11;
    v50 = v37;
    objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v49);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("fsm"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      v39 = -[WBSFormerlySharedSavedAccountMarker initWithDictionaryRepresentation:]([WBSFormerlySharedSavedAccountMarker alloc], "initWithDictionaryRepresentation:", v38);
      formerlySharedSavedAccountMarker = v37->_formerlySharedSavedAccountMarker;
      v37->_formerlySharedSavedAccountMarker = v39;

    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("s_as"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v41, "safari_mapObjectsUsingBlock:", &__block_literal_global_56);
      v42 = objc_claimAutoreleasedReturnValue();
      additionalSites = v37->_additionalSites;
      v37->_additionalSites = (NSArray *)v42;
    }
    else
    {
      additionalSites = v37->_additionalSites;
      v37->_additionalSites = (NSArray *)MEMORY[0x1E0C9AA60];
    }

    v44 = v37;
    v8 = v33;
    v9 = v48;
  }

  return v11;
}

void __80__WBSSavedAccountSidecar_initWithUser_protectionSpace_dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  WBSSavedAccountSidecarContextSpecificData *v7;
  WBSSavedAccountContext *v8;

  v5 = a3;
  v6 = a2;
  v8 = -[WBSSavedAccountContext initWithName:]([WBSSavedAccountContext alloc], "initWithName:", v6);

  v7 = -[WBSSavedAccountSidecarContextSpecificData initWithDictionaryRepresentation:]([WBSSavedAccountSidecarContextSpecificData alloc], "initWithDictionaryRepresentation:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v7, v8);

}

WBSSavedAccountAdditionalSite *__80__WBSSavedAccountSidecar_initWithUser_protectionSpace_dictionaryRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  WBSSavedAccountAdditionalSite *v3;

  v2 = a2;
  v3 = -[WBSSavedAccountAdditionalSite initWithDictionaryRepresentation:]([WBSSavedAccountAdditionalSite alloc], "initWithDictionaryRepresentation:", v2);

  return v3;
}

- (WBSSavedAccountSidecar)initWithSharedSidecar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WBSSavedAccountSidecar *v7;
  WBSSavedAccountSidecar *v8;

  v4 = a3;
  objc_msgSend(v4, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "protectionSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WBSSavedAccountSidecar initWithUser:protectionSpace:dictionaryRepresentation:](self, "initWithUser:protectionSpace:dictionaryRepresentation:", v5, v6, MEMORY[0x1E0C9AA70]);

  if (v7)
  {
    -[WBSSavedAccountSidecar adoptSharableDataFromSharedSidecar:](v7, "adoptSharableDataFromSharedSidecar:", v4);
    v8 = v7;
  }

  return v7;
}

- (void)adoptSharableDataFromSharedSidecar:(id)a3
{
  id v4;
  WBSTOTPGenerator *v5;
  WBSTOTPGenerator *totpGenerator;
  void *v7;
  NSString *v8;
  NSString *notesEntry;
  void *v10;
  NSString *v11;
  NSString *customTitle;
  NSDictionary *v13;
  NSDictionary *originalKeychainDictionary;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSDictionary *v22;
  NSDictionary *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "totpGenerator");
  v5 = (WBSTOTPGenerator *)objc_claimAutoreleasedReturnValue();
  totpGenerator = self->_totpGenerator;
  self->_totpGenerator = v5;

  objc_msgSend(v4, "notesEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (NSString *)objc_msgSend(v7, "copy");
  notesEntry = self->_notesEntry;
  self->_notesEntry = v8;

  objc_msgSend(v4, "customTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (NSString *)objc_msgSend(v10, "copy");
  customTitle = self->_customTitle;
  self->_customTitle = v11;

  if (!self->_originalKeychainDictionary)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    originalKeychainDictionary = self->_originalKeychainDictionary;
    self->_originalKeychainDictionary = v13;

  }
  objc_msgSend(v4, "prefixedSharableData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  v17 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v16 == 1)
      v18 = "";
    else
      v18 = "s";
    v19 = v17;
    objc_msgSend(v15, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 134218498;
    v25 = v16;
    v26 = 2080;
    v27 = v18;
    v28 = 2112;
    v29 = v21;
    _os_log_impl(&dword_1B2621000, v19, OS_LOG_TYPE_DEFAULT, "Migrating %ld unknown key%s from shared sidecar to personal sidecar: %@", (uint8_t *)&v24, 0x20u);

  }
  -[NSDictionary safari_setValuesFromDictionary:](self->_originalKeychainDictionary, "safari_setValuesFromDictionary:", v15);
  v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v23 = self->_originalKeychainDictionary;
  self->_originalKeychainDictionary = v22;

}

- (void)removeSharableData
{
  WBSTOTPGenerator *totpGenerator;
  NSString *notesEntry;
  NSString *customTitle;
  NSDictionary *v6;
  NSDictionary *originalKeychainDictionary;

  totpGenerator = self->_totpGenerator;
  self->_totpGenerator = 0;

  notesEntry = self->_notesEntry;
  self->_notesEntry = 0;

  customTitle = self->_customTitle;
  self->_customTitle = 0;

  -[NSDictionary safari_mapAndFilterKeysUsingBlock:](self->_originalKeychainDictionary, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_38_0);
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  originalKeychainDictionary = self->_originalKeychainDictionary;
  self->_originalKeychainDictionary = v6;

}

id __44__WBSSavedAccountSidecar_removeSharableData__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "hasPrefix:", CFSTR("s_")))
    v3 = 0;
  else
    v3 = v2;
  v4 = v3;

  return v4;
}

- (NSDictionary)contextSpecificData
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_contextSpecificData, "copy");
}

- (void)setLastUsedDate:(id)a3 forContext:(id)a4
{
  id v6;
  WBSSavedAccountSidecarContextSpecificData *v7;
  WBSSavedAccountSidecarContextSpecificData *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!v6)
  {
    +[WBSSavedAccountContext defaultContext](WBSSavedAccountContext, "defaultContext");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_contextSpecificData, "objectForKeyedSubscript:", v6);
  v7 = (WBSSavedAccountSidecarContextSpecificData *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = [WBSSavedAccountSidecarContextSpecificData alloc];
    v7 = -[WBSSavedAccountSidecarContextSpecificData initWithDictionaryRepresentation:](v8, "initWithDictionaryRepresentation:", MEMORY[0x1E0C9AA70]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_contextSpecificData, "setObject:forKeyedSubscript:", v7, v6);
  }
  -[WBSSavedAccountSidecarContextSpecificData setLastUsedDate:](v7, "setLastUsedDate:", v9);

}

- (id)lastUsedDateForContext:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_contextSpecificData, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastUsedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  WBSSavedAccountSidecar *v4;
  WBSSavedAccountSidecar *v5;
  NSString *user;
  void *v7;
  WBSTOTPGenerator *totpGenerator;
  void *v9;
  NSString *notesEntry;
  void *v11;
  NSString *customTitle;
  void *v13;
  WBSPasswordWarningHideMarker *hideWarningMarker;
  void *v15;
  NSDate *lastOneTimeShareDateForPasskey;
  void *v17;
  NSArray *additionalSites;
  void *v19;
  NSArray *v20;
  void *v21;
  char v22;

  v4 = (WBSSavedAccountSidecar *)a3;
  if (self == v4)
  {
    v22 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      user = self->_user;
      -[WBSSavedAccountSidecar user](v5, "user");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqual:](user, "isEqual:", v7))
      {
        totpGenerator = self->_totpGenerator;
        -[WBSSavedAccountSidecar totpGenerator](v5, "totpGenerator");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (WBSIsEqual(totpGenerator, v9))
        {
          notesEntry = self->_notesEntry;
          -[WBSSavedAccountSidecar notesEntry](v5, "notesEntry");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (WBSIsEqual(notesEntry, v11))
          {
            customTitle = self->_customTitle;
            -[WBSSavedAccountSidecar customTitle](v5, "customTitle");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (WBSIsEqual(customTitle, v13)
              && WBSIsEqual(self->_contextSpecificData, v5->_contextSpecificData))
            {
              hideWarningMarker = self->_hideWarningMarker;
              -[WBSSavedAccountSidecar hideWarningMarker](v5, "hideWarningMarker");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (WBSIsEqual(hideWarningMarker, v15))
              {
                lastOneTimeShareDateForPasskey = self->_lastOneTimeShareDateForPasskey;
                -[WBSSavedAccountSidecar lastOneTimeShareDateForPasskey](v5, "lastOneTimeShareDateForPasskey");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (WBSIsEqual(lastOneTimeShareDateForPasskey, v17))
                {
                  additionalSites = self->_additionalSites;
                  -[WBSSavedAccountSidecar additionalSites](v5, "additionalSites");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = additionalSites;
                  v21 = v19;
                  if (WBSIsEqual(v20, v19))
                    v22 = -[NSURLProtectionSpace isEqual:](self->_protectionSpace, "isEqual:", v5->_protectionSpace);
                  else
                    v22 = 0;

                }
                else
                {
                  v22 = 0;
                }

              }
              else
              {
                v22 = 0;
              }

            }
            else
            {
              v22 = 0;
            }

          }
          else
          {
            v22 = 0;
          }

        }
        else
        {
          v22 = 0;
        }

      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[NSString hash](self->_user, "hash");
  v4 = -[NSURLProtectionSpace hash](self->_protectionSpace, "hash") ^ v3;
  v5 = -[WBSTOTPGenerator hash](self->_totpGenerator, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_notesEntry, "hash");
  v7 = -[NSString hash](self->_customTitle, "hash");
  v8 = v7 ^ -[WBSPasswordWarningHideMarker hash](self->_hideWarningMarker, "hash");
  v9 = v6 ^ v8 ^ -[NSMutableDictionary hash](self->_contextSpecificData, "hash");
  v10 = -[NSDate hash](self->_lastOneTimeShareDateForPasskey, "hash");
  return v9 ^ v10 ^ -[NSArray hash](self->_additionalSites, "hash");
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSDate *lastOneTimeShareDateForPasskey;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *contextSpecificData;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v3 = (void *)-[NSDictionary mutableCopy](self->_originalKeychainDictionary, "mutableCopy");
  -[WBSTOTPGenerator dictionaryRepresentation](self->_totpGenerator, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("totp"));

  -[NSString dataUsingEncoding:](self->_notesEntry, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("notes"));

  -[NSString dataUsingEncoding:](self->_customTitle, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("title"));

  -[WBSPasswordWarningHideMarker dictionaryRepresentation](self->_hideWarningMarker, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("hwm"));

  lastOneTimeShareDateForPasskey = self->_lastOneTimeShareDateForPasskey;
  if (lastOneTimeShareDateForPasskey)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSinceReferenceDate](lastOneTimeShareDateForPasskey, "timeIntervalSinceReferenceDate");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("otsd"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("otsd"));
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  contextSpecificData = self->_contextSpecificData;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __50__WBSSavedAccountSidecar_dictionaryRepresentation__block_invoke;
  v18[3] = &unk_1E649F330;
  v19 = v11;
  v13 = v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](contextSpecificData, "enumerateKeysAndObjectsUsingBlock:", v18);
  if (objc_msgSend(v13, "count"))
    v14 = v13;
  else
    v14 = 0;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("ctxt"));
  -[WBSFormerlySharedSavedAccountMarker dictionaryRepresentation](self->_formerlySharedSavedAccountMarker, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("fsm"));

  -[NSArray safari_mapObjectsUsingBlock:](self->_additionalSites, "safari_mapObjectsUsingBlock:", &__block_literal_global_43);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("s_as"));

  return (NSDictionary *)v3;
}

void __50__WBSSavedAccountSidecar_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_msgSend(a3, "dictionaryRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "nameForPersistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);
}

uint64_t __50__WBSSavedAccountSidecar_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (NSDictionary)prefixedSharableData
{
  return (NSDictionary *)-[NSDictionary safari_mapAndFilterKeysUsingBlock:](self->_originalKeychainDictionary, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_44_0);
}

id __46__WBSSavedAccountSidecar_prefixedSharableData__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "hasPrefix:", CFSTR("s_")))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  NSString *user;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)WBSSavedAccountSidecar;
  -[WBSSavedAccountSidecar description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  user = self->_user;
  -[NSURLProtectionSpace host](self->_protectionSpace, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ user:%@ host:%@>"), v4, user, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WBSSavedAccountSidecar *v4;
  uint64_t v5;
  NSDictionary *originalKeychainDictionary;
  uint64_t v7;
  NSString *notesEntry;
  uint64_t v9;
  NSString *customTitle;
  uint64_t v11;
  NSMutableDictionary *contextSpecificData;
  uint64_t v13;
  NSDate *lastOneTimeShareDateForPasskey;
  uint64_t v15;
  NSArray *additionalSites;

  v4 = -[WBSSavedAccountSidecar initWithUser:protectionSpace:]([WBSSavedAccountSidecar alloc], "initWithUser:protectionSpace:", self->_user, self->_protectionSpace);
  v5 = -[NSDictionary copy](self->_originalKeychainDictionary, "copy");
  originalKeychainDictionary = v4->_originalKeychainDictionary;
  v4->_originalKeychainDictionary = (NSDictionary *)v5;

  objc_storeStrong((id *)&v4->_totpGenerator, self->_totpGenerator);
  v7 = -[NSString copy](self->_notesEntry, "copy");
  notesEntry = v4->_notesEntry;
  v4->_notesEntry = (NSString *)v7;

  v9 = -[NSString copy](self->_customTitle, "copy");
  customTitle = v4->_customTitle;
  v4->_customTitle = (NSString *)v9;

  v11 = -[NSMutableDictionary copy](self->_contextSpecificData, "copy");
  contextSpecificData = v4->_contextSpecificData;
  v4->_contextSpecificData = (NSMutableDictionary *)v11;

  objc_storeStrong((id *)&v4->_hideWarningMarker, self->_hideWarningMarker);
  v13 = -[NSDate copy](self->_lastOneTimeShareDateForPasskey, "copy");
  lastOneTimeShareDateForPasskey = v4->_lastOneTimeShareDateForPasskey;
  v4->_lastOneTimeShareDateForPasskey = (NSDate *)v13;

  v15 = -[NSArray copy](self->_additionalSites, "copy");
  additionalSites = v4->_additionalSites;
  v4->_additionalSites = (NSArray *)v15;

  return v4;
}

- (NSString)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURLProtectionSpace)protectionSpace
{
  return self->_protectionSpace;
}

- (WBSTOTPGenerator)totpGenerator
{
  return self->_totpGenerator;
}

- (void)setTotpGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_totpGenerator, a3);
}

- (NSString)notesEntry
{
  return self->_notesEntry;
}

- (void)setNotesEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (void)setCustomTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)originalContributorParticipantID
{
  return self->_originalContributorParticipantID;
}

- (void)setOriginalContributorParticipantID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)participantIDForUserThatMovedSavedAccountToRecentlyDeleted
{
  return self->_participantIDForUserThatMovedSavedAccountToRecentlyDeleted;
}

- (void)setParticipantIDForUserThatMovedSavedAccountToRecentlyDeleted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)additionalSites
{
  return self->_additionalSites;
}

- (void)setAdditionalSites:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (WBSPasswordWarningHideMarker)hideWarningMarker
{
  return self->_hideWarningMarker;
}

- (void)setHideWarningMarker:(id)a3
{
  objc_storeStrong((id *)&self->_hideWarningMarker, a3);
}

- (NSDate)lastOneTimeShareDateForPasskey
{
  return self->_lastOneTimeShareDateForPasskey;
}

- (void)setLastOneTimeShareDateForPasskey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (WBSFormerlySharedSavedAccountMarker)formerlySharedSavedAccountMarker
{
  return self->_formerlySharedSavedAccountMarker;
}

- (void)setFormerlySharedSavedAccountMarker:(id)a3
{
  objc_storeStrong((id *)&self->_formerlySharedSavedAccountMarker, a3);
}

- (NSDate)lastRecentlyDeletedNotificationDate
{
  return self->_lastRecentlyDeletedNotificationDate;
}

- (void)setLastRecentlyDeletedNotificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastRecentlyDeletedNotificationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRecentlyDeletedNotificationDate, 0);
  objc_storeStrong((id *)&self->_formerlySharedSavedAccountMarker, 0);
  objc_storeStrong((id *)&self->_lastOneTimeShareDateForPasskey, 0);
  objc_storeStrong((id *)&self->_hideWarningMarker, 0);
  objc_storeStrong((id *)&self->_additionalSites, 0);
  objc_storeStrong((id *)&self->_participantIDForUserThatMovedSavedAccountToRecentlyDeleted, 0);
  objc_storeStrong((id *)&self->_originalContributorParticipantID, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_notesEntry, 0);
  objc_storeStrong((id *)&self->_totpGenerator, 0);
  objc_storeStrong((id *)&self->_protectionSpace, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_contextSpecificData, 0);
  objc_storeStrong((id *)&self->_originalKeychainDictionary, 0);
}

@end

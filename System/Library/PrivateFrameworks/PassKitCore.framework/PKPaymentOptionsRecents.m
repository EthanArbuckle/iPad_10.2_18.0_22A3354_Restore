@implementation PKPaymentOptionsRecents

- (CNContact)meCard
{
  CNContact *v3;
  CNContact *v4;
  id v5;
  void *v6;
  CNContact **p_cachedMeContact;
  CNContact *cachedMeContact;

  if (-[PKPaymentOptionsRecents isMeCardCachingEnabled](self, "isMeCardCachingEnabled")
    && (v3 = self->_cachedMeContact) != 0)
  {
    v4 = v3;
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C97298]);
    objc_msgSend(MEMORY[0x1E0C97200], "pkPassbookRequiredKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v6, 0);
    v4 = (CNContact *)objc_claimAutoreleasedReturnValue();

    if (-[PKPaymentOptionsRecents isMeCardCachingEnabled](self, "isMeCardCachingEnabled"))
    {
      cachedMeContact = self->_cachedMeContact;
      p_cachedMeContact = &self->_cachedMeContact;
      if (!cachedMeContact)
      {
        if (v4)
          objc_storeStrong((id *)p_cachedMeContact, v4);
      }
    }

  }
  return v4;
}

+ (PKPaymentOptionsRecents)defaultInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PKPaymentOptionsRecents_defaultInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECF22B28 != -1)
    dispatch_once(&qword_1ECF22B28, block);
  return (PKPaymentOptionsRecents *)(id)_MergedGlobals_278;
}

void __42__PKPaymentOptionsRecents_defaultInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)_MergedGlobals_278;
  _MergedGlobals_278 = (uint64_t)v0;

}

- (PKPaymentOptionsRecents)init
{
  PKPaymentOptionsRecents *v2;
  uint64_t v3;
  CRRecentContactsLibrary *recentContactsLibrary;
  PKPaymentOptionsSynchronization *v5;
  PKPaymentOptionsSynchronization *optionsSynchronization;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentOptionsRecents;
  v2 = -[PKPaymentOptionsRecents init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D18290], "defaultInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    recentContactsLibrary = v2->_recentContactsLibrary;
    v2->_recentContactsLibrary = (CRRecentContactsLibrary *)v3;

    v5 = objc_alloc_init(PKPaymentOptionsSynchronization);
    optionsSynchronization = v2->_optionsSynchronization;
    v2->_optionsSynchronization = v5;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_meContactDidChangeNotificationObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_meContactDidChangeNotificationObserver);

  }
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentOptionsRecents;
  -[PKPaymentOptionsRecents dealloc](&v4, sel_dealloc);
}

- (id)postalAddressMetadataForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postalAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backwardsCompatibleDictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("postalAddress"));
  objc_msgSend(v6, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ISOCountryCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("cn")))
  {

LABEL_5:
    goto LABEL_6;
  }
  v11 = objc_msgSend(v3, "isKeyAvailable:", *MEMORY[0x1E0C967B0]);

  if (v11)
  {
    objc_msgSend(v3, "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("pkdistrict"));
    goto LABEL_5;
  }
LABEL_6:
  v12 = (void *)objc_msgSend(v4, "copy");

  return v12;
}

- (id)contactMetadataForContact:(id)a3 preference:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v5;
  objc_msgSend(v5, "nameComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "givenName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "givenName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("givenName"));

  }
  objc_msgSend(v8, "familyName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "familyName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v12, CFSTR("familyName"));

  }
  objc_msgSend(v8, "phoneticRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "givenName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v13, "givenName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v15, CFSTR("phoneticGivenName"));

  }
  objc_msgSend(v13, "familyName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v13, "familyName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v17, CFSTR("phoneticFamilyName"));

  }
  objc_msgSend(v6, "contactKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0C967F0];
  v20 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0C967F0]);

  if (v20)
  {
    -[PKPaymentOptionsRecents postalAddressMetadataForContact:](self, "postalAddressMetadataForContact:", v47);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEntriesFromDictionary:", v21);

  }
  objc_msgSend(v6, "contactKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23 >= 2)
  {
    v44 = v13;
    v45 = v8;
    v24 = (void *)MEMORY[0x1E0C99E40];
    objc_msgSend(v6, "contactKeys");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v6;
    objc_msgSend(v6, "contactKeys");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "orderedSetWithOrderedSet:range:copyItems:", v25, 1, objc_msgSend(v26, "count") - 1, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v28 = v27;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    v30 = v47;
    if (!v29)
      goto LABEL_30;
    v31 = v29;
    v32 = *(_QWORD *)v52;
    v33 = *MEMORY[0x1E0C966A8];
    v48 = *MEMORY[0x1E0C967C0];
    v49 = v7;
    while (1)
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v52 != v32)
          objc_enumerationMutation(v28);
        v35 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        if (objc_msgSend(v35, "isEqualToString:", v19))
        {
          -[PKPaymentOptionsRecents postalAddressMetadataForContact:](self, "postalAddressMetadataForContact:", v30);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addEntriesFromDictionary:", v36);
        }
        else if (objc_msgSend(v35, "isEqualToString:", v33))
        {
          objc_msgSend(v30, "emailAddresses");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "firstObject");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "value");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v36)
            goto LABEL_26;
          v7 = v49;
          objc_msgSend(v49, "setObject:forKey:", v36, CFSTR("emailAddresses"));
        }
        else
        {
          if (!objc_msgSend(v35, "isEqualToString:", v48))
            continue;
          objc_msgSend(v30, "phoneNumbers");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "firstObject");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "value");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "stringValue");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v36)
          {
            v30 = v47;
LABEL_26:
            v7 = v49;
            goto LABEL_27;
          }
          v7 = v49;
          objc_msgSend(v49, "setObject:forKey:", v36, CFSTR("phoneNumbers"));
          v30 = v47;
        }
LABEL_27:

      }
      v31 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      if (!v31)
      {
LABEL_30:

        v8 = v45;
        v6 = v46;
        v13 = v44;
        break;
      }
    }
  }
  if (objc_msgSend(v47, "recentFromContactInformation"))
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("contactFromContactInformation"));
  v42 = (void *)objc_msgSend(v7, "copy");

  return v42;
}

- (id)saveContactToCoreRecents:(id)a3 preference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PKRecentContact *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CRRecentContactsLibrary *recentContactsLibrary;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  NSObject *v41;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint8_t buf[16];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "contactKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPaymentOptionsSynchronization shouldSyncToCloud](self->_optionsSynchronization, "shouldSyncToCloud"))
  {
    -[PKPaymentOptionsRecents contactMetadataForContact:preference:](self, "contactMetadataForContact:preference:", v6, v7);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C967F0]))
    {
      objc_msgSend(v6, "postalAddresses");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_alloc_init(MEMORY[0x1E0C973B0]);
      v48 = v10;
      objc_msgSend(v10, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringFromPostalAddress:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "pkFullName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByAppendingString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C966A8]))
      {
        objc_msgSend(v6, "emailAddresses");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v48 = v19;
        objc_msgSend(v19, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
LABEL_11:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D18250]);
          v22 = v7;
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x1E0D18290];
          objc_msgSend(v48, "label");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v22;
          +[PKPaymentOptionsRecents _coreRecentsKindForPreference:](PKPaymentOptionsRecents, "_coreRecentsKindForPreference:", v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(v49, "copy");
          v47 = v23;
          objc_msgSend(v24, "recentEventForAddress:displayName:kind:date:weight:metadata:options:", v15, v25, v26, v27, v23, v28, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            v44 = v8;
            v45 = v6;
            recentContactsLibrary = self->_recentContactsLibrary;
            v43 = v29;
            v56[0] = v29;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[CRRecentContactsLibrary recordContactEvents:recentsDomain:sendingAddress:completion:](recentContactsLibrary, "recordContactEvents:recentsDomain:sendingAddress:completion:", v31, *MEMORY[0x1E0D18280], 0, &__block_literal_global_202);

            v53 = 0u;
            v54 = 0u;
            v51 = 0u;
            v52 = 0u;
            v7 = v46;
            -[PKPaymentOptionsRecents recentsForPreference:](self, "recentsForPreference:", v46);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
            if (v33)
            {
              v34 = v33;
              v16 = 0;
              v35 = *(_QWORD *)v52;
              do
              {
                for (i = 0; i != v34; ++i)
                {
                  if (*(_QWORD *)v52 != v35)
                    objc_enumerationMutation(v32);
                  v37 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
                  objc_msgSend(v37, "recentContact");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v39 = objc_msgSend(v38, "hasFullTextMatch:", v15);

                  if (v39)
                  {
                    objc_msgSend(v37, "recentContact");
                    v40 = objc_claimAutoreleasedReturnValue();

                    v16 = (PKRecentContact *)v40;
                  }
                }
                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
              }
              while (v34);
            }
            else
            {
              v16 = 0;
            }

            v8 = v44;
            v6 = v45;
            v29 = v43;
          }
          else
          {
            v16 = 0;
            v7 = v46;
          }

          v41 = v47;
          v17 = v48;
LABEL_30:

          goto LABEL_31;
        }
        goto LABEL_7;
      }
      if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C967C0]))
      {
        v17 = 0;
        goto LABEL_27;
      }
      objc_msgSend(v6, "phoneNumbers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = v21;
      objc_msgSend(v21, "value");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v15)
      goto LABEL_11;
LABEL_7:
    v17 = v48;
LABEL_27:
    PKLogFacilityTypeGetObject(0);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v41, OS_LOG_TYPE_DEFAULT, "Couldn't turn address into a single string for storage", buf, 2u);
    }
    v15 = 0;
    v16 = 0;
    goto LABEL_30;
  }
  v16 = objc_alloc_init(PKRecentContact);
  -[PKRecentContact setContactID:](v16, "setContactID:", objc_msgSend(v6, "hash"));
  -[PKPaymentOptionsRecents _addContactToKeychain:forPreference:](self, "_addContactToKeychain:forPreference:", v6, v7);
  v15 = 0;
  v17 = 0;
LABEL_31:

  return v16;
}

void __63__PKPaymentOptionsRecents_saveContactToCoreRecents_preference___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    PKLogFacilityTypeGetObject(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentOptionsRecents: Failed to save contact to CoreRecents with error: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (id)recentsForPreference:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__77;
  v20 = __Block_byref_object_dispose__77;
  v21 = 0;
  v5 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__PKPaymentOptionsRecents_recentsForPreference___block_invoke;
  v12[3] = &unk_1E2ADA648;
  v6 = v4;
  v13 = v6;
  v15 = &v16;
  v7 = v5;
  v14 = v7;
  -[PKPaymentOptionsRecents recentsForPreference:queue:completion:](self, "recentsForPreference:queue:completion:", v6, 0, v12);
  v8 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    PKLogFacilityTypeGetObject(7uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_error_impl(&dword_18FC92000, v9, OS_LOG_TYPE_ERROR, "Timed out awaiting recents for preference: %@", buf, 0xCu);
    }

  }
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __48__PKPaymentOptionsRecents_recentsForPreference___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject(7uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v11;
      v14 = 2112;
      v15 = v6;
      _os_log_error_impl(&dword_18FC92000, v7, OS_LOG_TYPE_ERROR, "PKPaymentOptionsRecents: Failed to get recents from CoreRecents for preference: %@ with error: %@", (uint8_t *)&v12, 0x16u);
    }

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)recentsForPreference:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[PKPaymentOptionsSynchronization shouldSyncToCloud](self->_optionsSynchronization, "shouldSyncToCloud"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__PKPaymentOptionsRecents_recentsForPreference_queue_completion___block_invoke;
    v12[3] = &unk_1E2AD5A18;
    v12[4] = self;
    v13 = v8;
    v14 = v10;
    -[PKPaymentOptionsRecents _coreRecentsContactsForPreference:queue:completion:](self, "_coreRecentsContactsForPreference:queue:completion:", v13, v9, v12);

  }
  else
  {
    -[PKPaymentOptionsRecents _contactsFromKeychainForPreference:](self, "_contactsFromKeychainForPreference:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v11, 0);

  }
}

void __65__PKPaymentOptionsRecents_recentsForPreference_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  int v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v8 = objc_msgSend(v5, "count");
    if (v8 >= 6)
    {
      objc_msgSend(v5, "subarrayWithRange:", 5, v8 - 5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      v26 = 0;
      objc_msgSend(v10, "removeRecentContacts:error:", v9, &v26);
      v11 = v26;
      objc_msgSend(v5, "subarrayWithRange:", 0, 5);
      v12 = objc_claimAutoreleasedReturnValue();

      PKLogFacilityTypeGetObject(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_msgSend(v9, "count");
        v15 = (void *)objc_opt_class();
        *(_DWORD *)buf = 67109634;
        v29 = v14;
        v30 = 2112;
        v31 = v15;
        v32 = 2112;
        v33 = v11;
        v16 = v15;
        _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Culled %d recents for preference %@ with error: %@", buf, 0x1Cu);

      }
      v5 = (id)v12;
    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = v5;
    v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(a1 + 32), "_contactFromRecent:preference:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v20), *(_QWORD *)(a1 + 40), (_QWORD)v22);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "safelyAddObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v18);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)deleteRecentsForPreference:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  PKPaymentOptionsSynchronization *optionsSynchronization;
  id v11;
  _QWORD v12[5];
  id v13;

  v8 = a4;
  v9 = a5;
  optionsSynchronization = self->_optionsSynchronization;
  v11 = a3;
  if (-[PKPaymentOptionsSynchronization shouldSyncToCloud](optionsSynchronization, "shouldSyncToCloud"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79__PKPaymentOptionsRecents_deleteRecentsForPreference_callbackQueue_completion___block_invoke;
    v12[3] = &unk_1E2ABE710;
    v12[4] = self;
    v13 = v9;
    -[PKPaymentOptionsRecents _coreRecentsContactsForPreference:queue:completion:](self, "_coreRecentsContactsForPreference:queue:completion:", v11, v8, v12);

  }
  else
  {
    -[PKPaymentOptionsRecents _deleteRecentContactsFromKeychainForPreference:](self, "_deleteRecentContactsFromKeychainForPreference:", v11);

    if (v9)
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __79__PKPaymentOptionsRecents_deleteRecentsForPreference_callbackQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if (objc_msgSend(v5, "count"))
    {
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      v10 = 0;
      objc_msgSend(v8, "removeRecentContacts:error:", v5, &v10);
      v7 = v10;
    }
    else
    {
      v7 = 0;
    }
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v7);

}

- (void)deleteRecent:(id)a3
{
  id v4;
  CRRecentContactsLibrary *recentContactsLibrary;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PKPaymentOptionsRecents _deleteRecentContactFromKeychain:forPreference:](self, "_deleteRecentContactFromKeychain:forPreference:", v4, 0);
    }
    else
    {
      recentContactsLibrary = self->_recentContactsLibrary;
      v12[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      -[CRRecentContactsLibrary removeRecentContacts:error:](recentContactsLibrary, "removeRecentContacts:error:", v6, &v9);
      v7 = v9;

      if (v7)
      {
        PKLogFacilityTypeGetObject(0);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v11 = v7;
          _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentOptionsRecents: Failed to remove contact from CoreRecents with error: %@", buf, 0xCu);
        }

      }
    }
  }

}

- (id)_postalAddressLabeledValueFromRecent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("postalAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C973A8], "backwardsCompatiblePostalAddressDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C973A8], "postalAddressWithDictionaryRepresentation:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  PKCorrectCountryCodeIfNecessaryForPostalAddress(v8);
  objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C97338];
  objc_msgSend(v3, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v9, "labeledValueWithLabel:value:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_contactFromRecent:(id)a3 preference:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C967F0];
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C967F0]))
  {
    if (v7)
    {
      -[PKPaymentOptionsRecents _postalAddressLabeledValueFromRecent:](self, "_postalAddressLabeledValueFromRecent:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v9;
      v13 = v11;
      v14 = v10;
LABEL_8:
      objc_msgSend(v12, "setObject:forKey:", v13, v14);
      goto LABEL_9;
    }
  }
  else
  {
    v15 = *MEMORY[0x1E0C967C0];
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C967C0]))
    {
      v16 = (void *)MEMORY[0x1E0C97398];
      objc_msgSend(v5, "address");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "phoneNumberWithStringValue:", v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1E0C97338];
      objc_msgSend(v5, "displayName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "labeledValueWithLabel:value:", v19, v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setObject:forKey:", v20, v15);
LABEL_9:

      goto LABEL_10;
    }
    v21 = *MEMORY[0x1E0C966A8];
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C966A8]))
    {
      v22 = (void *)MEMORY[0x1E0C97338];
      objc_msgSend(v5, "displayName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "address");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "labeledValueWithLabel:value:", v23, v24);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v9;
      v13 = v11;
      v14 = v21;
      goto LABEL_8;
    }
  }
LABEL_10:
  objc_msgSend(v6, "contactKeys");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  v63 = v5;
  if (v26 < 2)
    goto LABEL_29;
  v61 = v8;
  v27 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(v6, "contactKeys");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v6;
  objc_msgSend(v6, "contactKeys");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "orderedSetWithOrderedSet:range:copyItems:", v28, 1, objc_msgSend(v29, "count") - 1, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v31 = v30;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
  if (!v32)
    goto LABEL_28;
  v33 = v32;
  v34 = *(_QWORD *)v69;
  v35 = *MEMORY[0x1E0C966A8];
  v64 = v7;
  v65 = *MEMORY[0x1E0C967C0];
  v66 = v9;
  do
  {
    for (i = 0; i != v33; ++i)
    {
      if (*(_QWORD *)v69 != v34)
        objc_enumerationMutation(v31);
      v37 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
      if (objc_msgSend(v37, "isEqualToString:", v10))
      {
        -[PKPaymentOptionsRecents _postalAddressLabeledValueFromRecent:](self, "_postalAddressLabeledValueFromRecent:", v5);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v38, v10);
      }
      else if (objc_msgSend(v37, "isEqualToString:", v35))
      {
        objc_msgSend(v7, "objectForKey:", CFSTR("emailAddresses"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          v39 = (void *)MEMORY[0x1E0C97338];
          objc_msgSend(v5, "displayName");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "labeledValueWithLabel:value:", v40, v38);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          v7 = v64;
          objc_msgSend(v66, "setObject:forKey:", v41, v35);
LABEL_24:

          v9 = v66;
        }
      }
      else
      {
        if (!objc_msgSend(v37, "isEqualToString:", v65))
          continue;
        objc_msgSend(v7, "objectForKey:", CFSTR("phoneNumbers"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v38);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)MEMORY[0x1E0C97338];
          objc_msgSend(v5, "displayName");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "labeledValueWithLabel:value:", v43, v41);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          v5 = v63;
          objc_msgSend(v66, "setObject:forKey:", v44, v65);

          v7 = v64;
          goto LABEL_24;
        }
      }

    }
    v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
  }
  while (v33);
LABEL_28:

  v8 = v61;
  v6 = v62;
LABEL_29:
  objc_msgSend(v9, "keysOfEntriesPassingTest:", &__block_literal_global_67_0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "allObjects");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectsForKeys:", v46);

  objc_msgSend(v9, "allKeys");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v9;
  v49 = objc_msgSend(v47, "count");

  if (v49)
  {
    v50 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    objc_msgSend(v7, "PKStringForKey:", CFSTR("givenName"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setGivenName:", v51);

    objc_msgSend(v7, "PKStringForKey:", CFSTR("familyName"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setFamilyName:", v52);

    v53 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    objc_msgSend(v7, "PKStringForKey:", CFSTR("phoneticGivenName"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setGivenName:", v54);

    objc_msgSend(v7, "PKStringForKey:", CFSTR("phoneticFamilyName"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setFamilyName:", v55);

    objc_msgSend(v50, "setPhoneticRepresentation:", v53);
    objc_msgSend(MEMORY[0x1E0C97200], "pkContactWithNameComponents:labeledValues:", v50, v48);
    v56 = v7;
    v57 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v56 = v7;
    v57 = 0;
  }
  objc_msgSend(v56, "valueForKey:", CFSTR("contactFromContactInformation"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "BOOLValue");

  objc_msgSend(v57, "setRecentFromContactInformation:", v59);
  objc_msgSend(v57, "setRecentContact:", v63);
  objc_msgSend(v57, "setContactSource:", 3);

  return v57;
}

uint64_t __57__PKPaymentOptionsRecents__contactFromRecent_preference___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)deleteAllRecentsWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CRRecentContactsLibrary *recentContactsLibrary;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  if (-[PKPaymentOptionsSynchronization shouldSyncToCloud](self->_optionsSynchronization, "shouldSyncToCloud"))
  {
    -[PKPaymentOptionsRecents _defaultCRSearchQuery](self, "_defaultCRSearchQuery");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSearchPredicate:", 0);
    recentContactsLibrary = self->_recentContactsLibrary;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__PKPaymentOptionsRecents_deleteAllRecentsWithCallbackQueue_completion___block_invoke;
    v10[3] = &unk_1E2ABE710;
    v10[4] = self;
    v11 = v7;
    -[CRRecentContactsLibrary performRecentsSearch:queue:completion:](recentContactsLibrary, "performRecentsSearch:queue:completion:", v8, v6, v10);

  }
  else
  {
    -[PKPaymentOptionsRecents _deleteRecentContactsFromKeychainForContactKey:](self, "_deleteRecentContactsFromKeychainForContactKey:", *MEMORY[0x1E0C966A8]);
    -[PKPaymentOptionsRecents _deleteRecentContactsFromKeychainForContactKey:](self, "_deleteRecentContactsFromKeychainForContactKey:", *MEMORY[0x1E0C967C0]);
    -[PKPaymentOptionsRecents _deleteRecentContactsFromKeychainForContactKey:](self, "_deleteRecentContactsFromKeychainForContactKey:", *MEMORY[0x1E0C967F0]);
    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __72__PKPaymentOptionsRecents_deleteAllRecentsWithCallbackQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if (objc_msgSend(v5, "count"))
    {
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      v10 = 0;
      objc_msgSend(v8, "removeRecentContacts:error:", v5, &v10);
      v7 = v10;
    }
    else
    {
      v7 = 0;
    }
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v7);

}

- (id)meCardEntriesForPreference:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
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
  v15 = __Block_byref_object_copy__77;
  v16 = __Block_byref_object_dispose__77;
  v17 = 0;
  v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__PKPaymentOptionsRecents_meCardEntriesForPreference___block_invoke;
  v9[3] = &unk_1E2AC35A8;
  v11 = &v12;
  v6 = v5;
  v10 = v6;
  -[PKPaymentOptionsRecents meCardEntriesForPreference:queue:completion:](self, "meCardEntriesForPreference:queue:completion:", v4, 0, v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __54__PKPaymentOptionsRecents_meCardEntriesForPreference___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)meCardEntriesForPreference:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD block[4];
  id v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v12 = v9;
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
  -[PKPaymentOptionsRecents meCard](self, "meCard");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[PKPaymentOptionsRecents _labelsToPropertiesDictionaryForContact:](self, "_labelsToPropertiesDictionaryForContact:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contactKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17 < 2)
    {
      objc_msgSend(v8, "contactKey");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOptionsRecents _meCardEntries:forContactKey:labelsToProperties:](self, "_meCardEntries:forContactKey:labelsToProperties:", v14, v18, v15);
    }
    else
    {
      objc_msgSend(v8, "contactKeys");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOptionsRecents _meCardEntries:forContactKeys:labelsToProperties:](self, "_meCardEntries:forContactKeys:labelsToProperties:", v14, v18, v15);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v19, "count"))
    {
      objc_msgSend(v8, "contactKeys");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "containsObject:", *MEMORY[0x1E0C966C0]);

      if (v21)
      {
        v22 = (void *)MEMORY[0x1E0C97200];
        objc_msgSend(v14, "nameComponents");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "pkContactWithNameComponents:labeledValues:", v23, MEMORY[0x1E0C9AA70]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "setContactSource:", 1);
        v35[0] = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
        v25 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v25;
      }
    }

    v11 = v19;
  }
  v26 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __71__PKPaymentOptionsRecents_meCardEntriesForPreference_queue_completion___block_invoke;
  v30[3] = &unk_1E2ABDA18;
  v31 = v11;
  v32 = v10;
  v27 = v30;
  block[0] = v26;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_19;
  block[3] = &unk_1E2ABD9A0;
  v34 = v27;
  v28 = v11;
  v29 = v10;
  dispatch_async(v13, block);

}

uint64_t __71__PKPaymentOptionsRecents_meCardEntriesForPreference_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_meCardEntries:(id)a3 forContactKeys:(id)a4 labelsToProperties:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v35 = a4;
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v34 = v7;
  objc_msgSend(v7, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v36)
  {
    v33 = *(_QWORD *)v46;
    v8 = *MEMORY[0x1E0C967F0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v46 != v33)
          objc_enumerationMutation(obj);
        v37 = v9;
        objc_msgSend(v34, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v12 = v35;
        v40 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        if (v40)
        {
          v38 = v10;
          v39 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v40; ++i)
            {
              if (*(_QWORD *)v42 != v39)
                objc_enumerationMutation(v12);
              v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
              objc_msgSend(v10, "objectForKeyedSubscript:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v15;
              if (v15)
              {
                objc_msgSend(v15, "firstObject");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "value");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v14, "isEqualToString:", v8)
                  && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v19 = (void *)objc_msgSend(v18, "mutableCopy");
                  PKCorrectCountryCodeIfNecessaryForPostalAddress(v19);
                  objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v17, "labeledValueBySettingValue:", v19);
                  v20 = v8;
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, v14);

                  v8 = v20;
                  v10 = v38;

                }
                else
                {
                  objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v14);
                }

              }
            }
            v40 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          }
          while (v40);
        }

        objc_msgSend(v11, "allKeys");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

        if (v23)
        {
          v24 = (void *)MEMORY[0x1E0C97200];
          objc_msgSend(v32, "nameComponents");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v11, "copy");
          objc_msgSend(v24, "pkContactWithNameComponents:labeledValues:", v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "setContactSource:", 1);
          objc_msgSend(v31, "addObject:", v27);

        }
        v9 = v37 + 1;
      }
      while (v37 + 1 != v36);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v36);
  }

  v28 = (void *)objc_msgSend(v31, "copy");
  return v28;
}

- (id)_meCardEntries:(id)a3 forContactKey:(id)a4 labelsToProperties:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v7 = a4;
  v8 = a5;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v8, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v29)
    {
      v27 = *(_QWORD *)v40;
      v9 = *MEMORY[0x1E0C967F0];
      v28 = v8;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v40 != v27)
            objc_enumerationMutation(obj);
          v31 = v10;
          objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v10));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", v7);
          v32 = (id)objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            v37 = 0u;
            v38 = 0u;
            v35 = 0u;
            v36 = 0u;
            v11 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v36;
              do
              {
                v14 = 0;
                do
                {
                  if (*(_QWORD *)v36 != v13)
                    objc_enumerationMutation(v32);
                  v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v14);
                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "value");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v7, "isEqualToString:", v9)
                    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v18 = (void *)objc_msgSend(v17, "mutableCopy");
                    PKCorrectCountryCodeIfNecessaryForPostalAddress(v18);
                    objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v15, "labeledValueBySettingValue:", v18);
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, v7);

                  }
                  else
                  {
                    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v7);
                  }
                  v20 = (void *)MEMORY[0x1E0C97200];
                  objc_msgSend(v34, "nameComponents");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = (void *)objc_msgSend(v16, "copy");
                  objc_msgSend(v20, "pkContactWithNameComponents:labeledValues:", v21, v22);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v23, "setContactSource:", 1);
                  objc_msgSend(v33, "addObject:", v23);

                  ++v14;
                }
                while (v12 != v14);
                v12 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              }
              while (v12);
            }
          }

          v10 = v31 + 1;
          v8 = v28;
        }
        while (v31 + 1 != v29);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v29);
    }

    v24 = (void *)objc_msgSend(v33, "copy");
  }
  else
  {
    v24 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v24;
}

- (void)setMeCardCachingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void (**v6)(_QWORD);
  void *v7;
  NSObject *meContactDidChangeNotificationObserver;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);
  _QWORD aBlock[4];
  id v16;
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PKPaymentOptionsRecents_setMeCardCachingEnabled___block_invoke;
  aBlock[3] = &unk_1E2AC3648;
  objc_copyWeak(&v16, &location);
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (self->_meCardCachingEnabled != v3)
  {
    if (self->_meCardCachingEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:", self->_meContactDidChangeNotificationObserver);

      meContactDidChangeNotificationObserver = self->_meContactDidChangeNotificationObserver;
      self->_meContactDidChangeNotificationObserver = 0;

    }
    self->_meCardCachingEnabled = v3;
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *MEMORY[0x1E0C96878];
      v13[0] = v5;
      v13[1] = 3221225472;
      v13[2] = __51__PKPaymentOptionsRecents_setMeCardCachingEnabled___block_invoke_2;
      v13[3] = &unk_1E2ADA690;
      v14 = v6;
      objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", v10, 0, 0, v13);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = self->_meContactDidChangeNotificationObserver;
      self->_meContactDidChangeNotificationObserver = v11;

    }
    else
    {
      v6[2](v6);
    }
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __51__PKPaymentOptionsRecents_setMeCardCachingEnabled___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

uint64_t __51__PKPaymentOptionsRecents_setMeCardCachingEnabled___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateRecentsAndKeychainWithContactInformation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  +[PKContactInformation contactInformationFromKeychain](PKContactInformation, "contactInformationFromKeychain");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postalAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postalAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentOptionsRecents _updateRecentsWithContactsFromContactInformation:currentKeychainContacts:forContactKey:](self, "_updateRecentsWithContactsFromContactInformation:currentKeychainContacts:forContactKey:", v5, v6, *MEMORY[0x1E0C967F0]);

  objc_msgSend(v4, "emailAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "emailAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentOptionsRecents _updateRecentsWithContactsFromContactInformation:currentKeychainContacts:forContactKey:](self, "_updateRecentsWithContactsFromContactInformation:currentKeychainContacts:forContactKey:", v7, v8, *MEMORY[0x1E0C966A8]);

  objc_msgSend(v4, "phoneNumbers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "phoneNumbers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentOptionsRecents _updateRecentsWithContactsFromContactInformation:currentKeychainContacts:forContactKey:](self, "_updateRecentsWithContactsFromContactInformation:currentKeychainContacts:forContactKey:", v9, v10, *MEMORY[0x1E0C967C0]);

  +[PKContactInformation saveContactInformationToKeychain:](PKContactInformation, "saveContactInformationToKeychain:", v4);
}

- (void)_updateRecentsWithContactsFromContactInformation:(id)a3 currentKeychainContacts:(id)a4 forContactKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  PKPaymentPreferenceContact *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id obj;
  PKPaymentPreferenceContact *v57;
  void *v58;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[5];
  uint8_t v87[128];
  uint8_t buf[4];
  uint64_t v89;
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v52 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v58 = v8;
  v53 = (id)objc_msgSend(v8, "mutableCopy");
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v81 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i);
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v15 = v58;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v77;
LABEL_8:
          v19 = 0;
          while (1)
          {
            if (*(_QWORD *)v77 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v19);
            if ((objc_msgSend(v20, "isEqualIgnoringIdentifiers:", v14, v52) & 1) != 0)
              break;
            if (v17 == ++v19)
            {
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
              if (v17)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
          v21 = v20;

          if (!v21)
            goto LABEL_19;
          objc_msgSend(v53, "removeObject:", v21);
          PKLogFacilityTypeGetObject(0);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v21, "description");
            v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v24 = objc_msgSend(v23, "UTF8String");
            *(_DWORD *)buf = 136315138;
            v89 = v24;
            _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Not adding contact info to CoreRecents as it exists in KeyChain:\n%s\n", buf, 0xCu);

          }
        }
        else
        {
LABEL_14:

LABEL_19:
          objc_msgSend(v9, "addObject:", v14, v52);
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
    }
    while (v11);
  }

  v25 = objc_alloc_init(PKPaymentPreferenceContact);
  -[PKPaymentPreferenceContact setContactKey:](v25, "setContactKey:", v52);
  v57 = v25;
  -[PKPaymentOptionsRecents recentsForPreference:](self, "recentsForPreference:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v55 = v9;
  v27 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v73;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v73 != v29)
          objc_enumerationMutation(v55);
        v31 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v32 = v26;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v69;
LABEL_29:
          v36 = 0;
          while (1)
          {
            if (*(_QWORD *)v69 != v35)
              objc_enumerationMutation(v32);
            v37 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v36);
            if ((objc_msgSend(v37, "isEqualIgnoringIdentifiers:", v31, v52) & 1) != 0)
              break;
            if (v34 == ++v36)
            {
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
              if (v34)
                goto LABEL_29;
              goto LABEL_35;
            }
          }
          v38 = v37;

          if (v38)
            goto LABEL_38;
        }
        else
        {
LABEL_35:

        }
        objc_msgSend(v31, "setRecentFromContactInformation:", 1, v52);
        v39 = -[PKPaymentOptionsRecents saveContactToCoreRecents:preference:](self, "saveContactToCoreRecents:preference:", v31, v57);
        v38 = 0;
LABEL_38:

      }
      v28 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
    }
    while (v28);
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v54 = v53;
  v40 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v65;
    do
    {
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v65 != v42)
          objc_enumerationMutation(v54);
        v44 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * k);
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v45 = v26;
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v60, v84, 16);
        if (v46)
        {
          v47 = v46;
          v48 = *(_QWORD *)v61;
          while (2)
          {
            for (m = 0; m != v47; ++m)
            {
              if (*(_QWORD *)v61 != v48)
                objc_enumerationMutation(v45);
              v50 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * m);
              if (objc_msgSend(v50, "isEqualIgnoringIdentifiers:", v44, v52))
              {
                objc_msgSend(v50, "recentContact");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                -[PKPaymentOptionsRecents deleteRecent:](self, "deleteRecent:", v51);

                goto LABEL_55;
              }
            }
            v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v60, v84, 16);
            if (v47)
              continue;
            break;
          }
        }
LABEL_55:

      }
      v41 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
    }
    while (v41);
  }

}

- (id)_labelsToPropertiesDictionaryForContact:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _QWORD v34[3];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = *MEMORY[0x1E0C967C0];
  v34[0] = *MEMORY[0x1E0C967F0];
  v34[1] = v4;
  v34[2] = *MEMORY[0x1E0C966A8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v23)
  {
    v21 = *(_QWORD *)v30;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(obj);
        v24 = v5;
        v6 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v5);
        objc_msgSend(v22, "valueForKey:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v26 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
              objc_msgSend(v12, "label");
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (v13)
              {
                objc_msgSend(v12, "label");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "objectForKey:", v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v15)
                {
                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "label");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v3, "setObject:forKey:", v15, v16);

                }
                objc_msgSend(v15, "objectForKeyedSubscript:", v6);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v17)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "setObject:forKey:", v17, v6);
                }
                objc_msgSend(v17, "addObject:", v12);

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v9);
        }

        v5 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v23);
  }

  v18 = (void *)objc_msgSend(v3, "copy");
  return v18;
}

+ (id)_coreRecentsKindForPreference:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  id v11;

  v3 = a3;
  objc_msgSend(v3, "contactKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C967F0]);

  if ((v5 & 1) != 0)
  {
    v6 = (id *)MEMORY[0x1E0D18220];
  }
  else
  {
    objc_msgSend(v3, "contactKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C966A8]);

    if ((v8 & 1) != 0)
    {
      v6 = (id *)MEMORY[0x1E0D18208];
    }
    else
    {
      objc_msgSend(v3, "contactKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C967C0]);

      if (!v10)
      {
        v11 = 0;
        goto LABEL_8;
      }
      v6 = (id *)MEMORY[0x1E0D18228];
    }
  }
  v11 = *v6;
LABEL_8:

  return v11;
}

- (void)_coreRecentsContactsForPreference:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D182A0];
  v11 = a3;
  objc_msgSend(v10, "frecencyComparator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentOptionsRecents _defaultCRSearchQuery](self, "_defaultCRSearchQuery");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentOptionsRecents _coreRecentsKindForPreference:](PKPaymentOptionsRecents, "_coreRecentsKindForPreference:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0D18298];
    v16 = *MEMORY[0x1E0D18248];
    v19[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateForKey:inCollection:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSearchPredicate:", v18);

    objc_msgSend(v13, "setComparator:", v12);
    -[CRRecentContactsLibrary performRecentsSearch:queue:completion:](self->_recentContactsLibrary, "performRecentsSearch:queue:completion:", v13, v8, v9);
  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, MEMORY[0x1E0C9AA60], 0);
  }

}

- (id)_defaultCRSearchQuery
{
  id v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0D182A0]);
  v5[0] = *MEMORY[0x1E0D18280];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDomains:", v3);

  return v2;
}

- (id)_keychainKeyFromContactKey:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C967C0]) & 1) != 0)
  {
    v4 = CFSTR("PKRecentPhonesKeychainKey");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C966A8]) & 1) != 0)
  {
    v4 = CFSTR("PKRecentEmailsKeychainKey");
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C967F0]))
  {
    v4 = CFSTR("PKRecentAddressKeychainKey");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

- (id)_keychainDataForKey:(id)a3
{
  id v3;
  PKKeychainItemWrapper *v4;
  void *v5;

  v3 = a3;
  v4 = -[PKKeychainItemWrapper initWithIdentifier:accessGroup:serviceName:type:invisible:]([PKKeychainItemWrapper alloc], "initWithIdentifier:accessGroup:serviceName:type:invisible:", v3, CFSTR("com.apple.PassbookUIService"), CFSTR("com.apple.passkit"), 0, 0);

  -[PKKeychainItemWrapper objectForKey:](v4, "objectForKey:", *MEMORY[0x1E0CD70D8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setKeychainData:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  PKKeychainItemWrapper *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PKKeychainItemWrapper initWithIdentifier:accessGroup:serviceName:type:invisible:]([PKKeychainItemWrapper alloc], "initWithIdentifier:accessGroup:serviceName:type:invisible:", v5, CFSTR("com.apple.PassbookUIService"), CFSTR("com.apple.passkit"), 0, 0);

  -[PKKeychainItemWrapper setObject:forKey:](v7, "setObject:forKey:", v6, *MEMORY[0x1E0CD70D8]);
}

- (void)_addContactToKeychain:(id)a3 forPreference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[PKPaymentOptionsRecents _contactsFromKeychainForPreference:](self, "_contactsFromKeychainForPreference:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v12, "addObject:", v7);
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentOptionsRecents _keychainKeyFromContactKey:](self, "_keychainKeyFromContactKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentOptionsRecents _setKeychainData:forKey:](self, "_setKeychainData:forKey:", v9, v11);
}

- (void)_deleteRecentContactFromKeychain:(id)a3 forPreference:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  PKPaymentPreferenceContact *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _QWORD v41[3];
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v26 = v6;
  if (v6)
  {
    objc_msgSend(v6, "contactKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = *MEMORY[0x1E0C967C0];
    v41[0] = *MEMORY[0x1E0C966A8];
    v41[1] = v9;
    v41[2] = *MEMORY[0x1E0C967F0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v8;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v36 != v28)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        v12 = objc_alloc_init(PKPaymentPreferenceContact);
        -[PKPaymentPreferenceContact setContactKey:](v12, "setContactKey:", v11);
        -[PKPaymentOptionsRecents _contactsFromKeychainForPreference:](self, "_contactsFromKeychainForPreference:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "mutableCopy");

        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v32;
LABEL_11:
          v19 = 0;
          while (1)
          {
            if (*(_QWORD *)v32 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v19);
            v21 = objc_msgSend(v20, "hash");
            if (v21 == objc_msgSend(v5, "contactID"))
              break;
            if (v17 == ++v19)
            {
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              if (v17)
                goto LABEL_11;
              goto LABEL_17;
            }
          }
          v22 = v20;

          if (!v22)
            goto LABEL_19;
          objc_msgSend(v15, "pk_arrayByRemovingObject:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v23, 1, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            -[PKPaymentOptionsRecents _keychainKeyFromContactKey:](self, "_keychainKeyFromContactKey:", v11);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKPaymentOptionsRecents _setKeychainData:forKey:](self, "_setKeychainData:forKey:", v24, v25);

          }
          goto LABEL_25;
        }
LABEL_17:

LABEL_19:
      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v29)
        continue;
      break;
    }
  }
LABEL_25:

}

- (void)_deleteRecentContactsFromKeychainForPreference:(id)a3
{
  id v4;

  objc_msgSend(a3, "contactKey");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentOptionsRecents _deleteRecentContactsFromKeychainForContactKey:](self, "_deleteRecentContactsFromKeychainForContactKey:", v4);

}

- (void)_deleteRecentContactsFromKeychainForContactKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB36F8];
  v5 = a3;
  objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", MEMORY[0x1E0C9AA60], 1, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentOptionsRecents _keychainKeyFromContactKey:](self, "_keychainKeyFromContactKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentOptionsRecents _setKeychainData:forKey:](self, "_setKeychainData:forKey:", v7, v6);
}

- (id)_contactsFromKeychainForPreference:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  PKRecentContact *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "contactKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentOptionsRecents _keychainKeyFromContactKey:](self, "_keychainKeyFromContactKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentOptionsRecents _keychainDataForKey:](self, "_keychainDataForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_7;
  v7 = (void *)MEMORY[0x1E0CB3710];
  v8 = objc_alloc(MEMORY[0x1E0C99E60]);
  v9 = objc_opt_class();
  v10 = (void *)objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
  v27 = 0;
  objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v10, v6, &v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v27;

  if (v12)
  {
    PKLogFacilityTypeGetObject(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v12;
      _os_log_error_impl(&dword_18FC92000, v13, OS_LOG_TYPE_ERROR, "PKPaymentOptionsRecents: error trying to read contact data from keychain. %{public}@.", buf, 0xCu);
    }

  }
  if (!v11)
  {
LABEL_7:
    v11 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", MEMORY[0x1E0C9AA60], 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentOptionsRecents _setKeychainData:forKey:](self, "_setKeychainData:forKey:", v14, v5);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v19);
        v21 = objc_alloc_init(PKRecentContact);
        -[PKRecentContact setContactID:](v21, "setContactID:", objc_msgSend(v20, "hash"));
        objc_msgSend(v20, "setRecentContact:", v21);
        objc_msgSend(v20, "setContactSource:", 3);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v17);
  }

  return v15;
}

- (BOOL)isMeCardCachingEnabled
{
  return self->_meCardCachingEnabled;
}

- (CRRecentContactsLibrary)recentContactsLibrary
{
  return self->_recentContactsLibrary;
}

- (void)setRecentContactsLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_recentContactsLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentContactsLibrary, 0);
  objc_storeStrong((id *)&self->_optionsSynchronization, 0);
  objc_storeStrong((id *)&self->_meContactDidChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_cachedMeContact, 0);
}

@end

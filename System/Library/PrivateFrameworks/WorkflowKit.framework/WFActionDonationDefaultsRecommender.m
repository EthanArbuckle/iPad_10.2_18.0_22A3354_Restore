@implementation WFActionDonationDefaultsRecommender

+ (id)defaultRecommendations
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  id *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t i;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  objc_class *v60;
  void *v61;
  uint64_t v62;
  uint64_t j;
  void *v64;
  void *v65;
  void *v66;
  __CFString *v67;
  void *v68;
  _QWORD *v69;
  void *v70;
  char v71;
  void *v72;
  uint64_t v73;
  void *v74;
  _QWORD *v75;
  void *v76;
  int v77;
  objc_class *v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  NSObject *v89;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  id v100;
  id v101;
  id v102;
  void *v103;
  id obj;
  id obja;
  NSObject *v106;
  NSObject *v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  id v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const __CFString **v122;
  const __CFString *v123;
  const __CFString **v124;
  uint64_t v125;
  uint64_t v126;
  _BYTE buf[24];
  void *v128;
  __int128 *v129;
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v101 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0DC7ED0];
  v4 = objc_msgSend(v2, "applicationIsInstalled:", *MEMORY[0x1E0DC7ED0]);

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("com.apple.mail.mailbox"));
    objc_msgSend(v5, "setEligibleForSearch:", 1);
    objc_msgSend(v5, "setEligibleForPrediction:", 1);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("mailActivityType"), CFSTR("specialMailboxType"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRequiredUserInfoKeys:", v6);

    objc_msgSend(v5, "setUserInfo:", &unk_1E7B8DEC8);
    WFLocalizedString(CFSTR("Show VIP Mailbox"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v7);

    v8 = objc_alloc(MEMORY[0x1E0DC7948]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithUserActivity:identifier:sourceAppIdentifier:date:", v5, v10, v3, v11);

    objc_msgSend(v101, "addObject:", v12);
  }
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)*MEMORY[0x1E0DC7FC0];
  v15 = objc_msgSend(v13, "applicationIsInstalled:", *MEMORY[0x1E0DC7FC0]);

  if (v15)
  {
    INIntentFromAppBundleIdAndName(v14, CFSTR("RecordVoiceMemoIntent"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v16, 0);
    v18 = objc_alloc(MEMORY[0x1E0DC7938]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v18, "initWithIdentifier:sourceAppIdentifier:interaction:", v20, v14, v17);

    objc_msgSend(v101, "addObject:", v21);
    INIntentFromAppBundleIdAndName(v14, CFSTR("PlaybackVoiceMemoIntent"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v22, 0);
    v24 = objc_alloc(MEMORY[0x1E0DC7938]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v24, "initWithIdentifier:sourceAppIdentifier:interaction:", v26, v14, v23);

    objc_msgSend(v101, "addObject:", v27);
  }
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = *MEMORY[0x1E0DC7ED8];
  v29 = objc_msgSend(v28, "applicationIsInstalled:");

  if (v29)
  {
    if ((WFCNContactIsAuthorizedToAccessContact() & 1) != 0)
    {
      v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v99 = objc_alloc_init((Class)getCNContactStoreClass());
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v31 = (id *)getCNContactPostalAddressesKeySymbolLoc_ptr;
      v128 = (void *)getCNContactPostalAddressesKeySymbolLoc_ptr;
      if (!getCNContactPostalAddressesKeySymbolLoc_ptr)
      {
        v32 = ContactsLibrary_46682();
        v31 = (id *)dlsym(v32, "CNContactPostalAddressesKey");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v31;
        getCNContactPostalAddressesKeySymbolLoc_ptr = (uint64_t)v31;
      }
      _Block_object_dispose(buf, 8);
      if (!v31)
        goto LABEL_65;
      v106 = v30;
      v117 = *v31;
      v33 = (void *)MEMORY[0x1E0C99D20];
      v34 = v117;
      objc_msgSend(v33, "arrayWithObjects:count:", &v117, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = 0;
      objc_msgSend(v99, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v35, &v112);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v112;

      if (v102)
      {
        getWFActionDonationsLogObject();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "GetDirectionsUserActivityDonations";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v102;
          _os_log_impl(&dword_1C15B3000, v36, OS_LOG_TYPE_ERROR, "%s Error getting me contact: %@", buf, 0x16u);
        }

        v37 = MEMORY[0x1E0C9AA60];
      }
      else
      {
        v115 = 0u;
        v116 = 0u;
        v113 = 0u;
        v114 = 0u;
        objc_msgSend(v97, "postalAddresses");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, buf, 16);
        if (v39)
        {
          v110 = *(_QWORD *)v114;
          do
          {
            for (i = 0; i != v39; ++i)
            {
              if (*(_QWORD *)v114 != v110)
                objc_enumerationMutation(obj);
              objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * i), "value");
              v41 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "street");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v42, "length"))
              {
                v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("com.apple.Maps"));
                objc_msgSend(v43, "setEligibleForSearch:", 1);
                objc_msgSend(v43, "setEligibleForPrediction:", 1);
                objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("MapsActionLaunchURLKey"), CFSTR("MapsActionDestinationStringKey"), CFSTR("MapsActionKey"), 0);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "setRequiredUserInfoKeys:", v44);

                v123 = 0;
                v124 = &v123;
                v125 = 0x2050000000;
                v45 = (__CFString *)getGEOMapURLBuilderClass_softClass;
                v126 = getGEOMapURLBuilderClass_softClass;
                if (!getGEOMapURLBuilderClass_softClass)
                {
                  v118 = (void *)MEMORY[0x1E0C809B0];
                  v119 = 3221225472;
                  v120 = (uint64_t)__getGEOMapURLBuilderClass_block_invoke;
                  v121 = &unk_1E7AF9520;
                  v122 = &v123;
                  __getGEOMapURLBuilderClass_block_invoke((uint64_t)&v118);
                  v45 = (__CFString *)v124[3];
                }
                v46 = objc_retainAutorelease(v45);
                _Block_object_dispose(&v123, 8);
                -[__CFString URLForSearch:](v46, "URLForSearch:", v42);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v123 = CFSTR("MapsActionLaunchURLKey");
                v124 = (const __CFString **)CFSTR("MapsActionDestinationStringKey");
                v118 = v47;
                v119 = (uint64_t)v42;
                v125 = (uint64_t)CFSTR("MapsActionKey");
                v120 = (uint64_t)CFSTR("MapsDirectionsActionKey");
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v123, 3);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "setUserInfo:", v48);

                v49 = (void *)MEMORY[0x1E0CB3940];
                WFLocalizedString(CFSTR("Get directions to %@"));
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "localizedStringWithFormat:", v50, v42);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "setTitle:", v51);

                v52 = objc_alloc(MEMORY[0x1E0DC7948]);
                objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "UUIDString");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99D68], "date");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = (void *)objc_msgSend(v52, "initWithUserActivity:identifier:sourceAppIdentifier:date:", v43, v54, v108, v55);

              }
              else
              {
                v56 = 0;
              }

              if (v56)
                -[NSObject addObject:](v106, "addObject:", v56);

            }
            v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, buf, 16);
          }
          while (v39);
        }

        v37 = v106;
      }

      v38 = v106;
    }
    else
    {
      getWFActionDonationsLogObject();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "GetDirectionsUserActivityDonations";
        _os_log_impl(&dword_1C15B3000, v38, OS_LOG_TYPE_DEFAULT, "%s Can’t get me-contact; no access to contacts",
          buf,
          0xCu);
      }
      v37 = MEMORY[0x1E0C9AA60];
    }

    objc_msgSend(v101, "addObjectsFromArray:", v37);
  }
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = (void *)*MEMORY[0x1E0DC7EB8];
  v58 = objc_msgSend(v57, "applicationIsInstalled:");

  if (v58)
  {
    v109 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if ((WFCNContactIsAuthorizedToAccessContact() & 1) != 0)
    {
      v100 = objc_alloc_init((Class)getCNContactStoreClass());
      *(_QWORD *)&v113 = 0;
      *((_QWORD *)&v113 + 1) = &v113;
      *(_QWORD *)&v114 = 0x2050000000;
      v59 = (void *)getCNFavoritesClass_softClass;
      *((_QWORD *)&v114 + 1) = getCNFavoritesClass_softClass;
      if (!getCNFavoritesClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getCNFavoritesClass_block_invoke;
        v128 = &unk_1E7AF9520;
        v129 = &v113;
        __getCNFavoritesClass_block_invoke((uint64_t)buf);
        v59 = *(void **)(*((_QWORD *)&v113 + 1) + 24);
      }
      v60 = objc_retainAutorelease(v59);
      _Block_object_dispose(&v113, 8);
      v98 = (void *)objc_msgSend([v60 alloc], "initWithContactStore:", v100);
      objc_msgSend(v98, "entries");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v107 = v61;
      v62 = -[NSObject countByEnumeratingWithState:objects:count:](v107, "countByEnumeratingWithState:objects:count:", &v113, buf, 16);
      if (v62)
      {
        v111 = *(_QWORD *)v114;
        obja = (id)*MEMORY[0x1E0DC7EF0];
        do
        {
          for (j = 0; j != v62; ++j)
          {
            if (*(_QWORD *)v114 != v111)
              objc_enumerationMutation(v107);
            v64 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * j);
            objc_msgSend(v64, "contactProperty");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "contact");
            v66 = (void *)objc_claimAutoreleasedReturnValue();

            v67 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA58]), "initWithContact:", v66);
            objc_msgSend(v64, "actionType");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v118 = 0;
            v119 = (uint64_t)&v118;
            v120 = 0x2020000000;
            v69 = (_QWORD *)getCNActionTypeAudioCallSymbolLoc_ptr;
            v121 = (void *)getCNActionTypeAudioCallSymbolLoc_ptr;
            if (!getCNActionTypeAudioCallSymbolLoc_ptr)
            {
              v70 = ContactsLibrary_46682();
              v69 = dlsym(v70, "CNActionTypeAudioCall");
              *(_QWORD *)(v119 + 24) = v69;
              getCNActionTypeAudioCallSymbolLoc_ptr = (uint64_t)v69;
            }
            _Block_object_dispose(&v118, 8);
            if (!v69)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getCNActionTypeAudioCall(void)");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "handleFailureInFunction:file:lineNumber:description:", v92, CFSTR("WFActionDonationDefaultsRecommender.m"), 27, CFSTR("%s"), dlerror());

              goto LABEL_64;
            }
            v71 = objc_msgSend(v68, "isEqualToString:", *v69);

            if ((v71 & 1) != 0)
            {
              v72 = obja;
              v73 = 1;
LABEL_53:
              v78 = (objc_class *)MEMORY[0x1E0CBDC10];
              v79 = v72;
              v80 = [v78 alloc];
              v123 = v67;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v123, 1);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              v82 = (void *)objc_msgSend(v80, "initWithAudioRoute:destinationType:contacts:recordTypeForRedialing:callCapability:", 0, 1, v81, 1, v73);

              objc_msgSend(v82, "_setLaunchId:", CFSTR("com.apple.InCallService"));
              objc_msgSend(v82, "_setExtensionBundleId:", CFSTR("com.apple.TelephonyUtilities.PhoneIntentHandler"));
              v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v82, 0);
              v84 = objc_alloc(MEMORY[0x1E0DC7938]);
              objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "UUIDString");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              v87 = (void *)objc_msgSend(v84, "initWithIdentifier:sourceAppIdentifier:interaction:", v86, v79, v83);

              objc_msgSend(v109, "addObject:", v87);
              goto LABEL_54;
            }
            objc_msgSend(v64, "actionType");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v118 = 0;
            v119 = (uint64_t)&v118;
            v120 = 0x2020000000;
            v75 = (_QWORD *)getCNActionTypeVideoCallSymbolLoc_ptr;
            v121 = (void *)getCNActionTypeVideoCallSymbolLoc_ptr;
            if (!getCNActionTypeVideoCallSymbolLoc_ptr)
            {
              v76 = ContactsLibrary_46682();
              v75 = dlsym(v76, "CNActionTypeVideoCall");
              *(_QWORD *)(v119 + 24) = v75;
              getCNActionTypeVideoCallSymbolLoc_ptr = (uint64_t)v75;
            }
            _Block_object_dispose(&v118, 8);
            if (!v75)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getCNActionTypeVideoCall(void)");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "handleFailureInFunction:file:lineNumber:description:", v94, CFSTR("WFActionDonationDefaultsRecommender.m"), 28, CFSTR("%s"), dlerror());

              while (1)
              {
LABEL_64:
                __break(1u);
LABEL_65:
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getCNContactPostalAddressesKey(void)");
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v95, "handleFailureInFunction:file:lineNumber:description:", v96, CFSTR("WFActionDonationDefaultsRecommender.m"), 29, CFSTR("%s"), dlerror());

              }
            }
            v77 = objc_msgSend(v74, "isEqualToString:", *v75);

            if (v77)
            {
              v72 = v103;
              v73 = 2;
              goto LABEL_53;
            }
LABEL_54:

          }
          v62 = -[NSObject countByEnumeratingWithState:objects:count:](v107, "countByEnumeratingWithState:objects:count:", &v113, buf, 16);
        }
        while (v62);
      }

      v88 = v109;
      v89 = v107;
    }
    else
    {
      getWFActionDonationsLogObject();
      v89 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "StartVideoCallOrAudioCallToFavoriteContactsDonations";
        _os_log_impl(&dword_1C15B3000, v89, OS_LOG_TYPE_DEFAULT, "%s Can’t get favorite contacts; no access to contacts",
          buf,
          0xCu);
      }
      v88 = (id)MEMORY[0x1E0C9AA60];
    }

    objc_msgSend(v101, "addObjectsFromArray:", v88);
  }
  return v101;
}

@end

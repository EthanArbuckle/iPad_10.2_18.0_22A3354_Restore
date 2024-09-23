@implementation TransitPayModelDataProvider

- (TransitPayModelDataProvider)initWithTransitPaymentMethods:(id)a3 suggestions:(id)a4 isTourist:(BOOL)a5 defaultPaymentCardsIdentifiers:(id)a6 defaultPaymentCardsExpressStatuses:(id)a7 userClosedLoopIdentifiers:(id)a8 availablePasses:(id)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  TransitPayModelDataProvider *v19;
  TransitPayModelDataProvider *v20;
  NSMutableSet *v21;
  NSMutableSet *routeTNIs;
  NSMutableDictionary *v23;
  NSMutableDictionary *defaultPaymentCardsIdentifiers;
  NSMutableDictionary *v25;
  NSMutableDictionary *userClosedLoopIdentifiers;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *i;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *j;
  uint64_t v41;
  NSArray *paymentMethods;
  id v43;
  id v44;
  NSObject *v45;
  NSMutableDictionary *v46;
  NSMutableDictionary *paymentMethodToSuggestionMapping;
  NSMutableDictionary *v48;
  NSMutableDictionary *identifierToPaymentMethodMapping;
  NSArray *v50;
  TransitPayModelDataProvider *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  void *k;
  void *v58;
  void *v59;
  id v60;
  NSObject *v61;
  TransitPayModelDataProvider *v62;
  void *v63;
  id v64;
  NSObject *v65;
  uint64_t v66;
  id v67;
  NSObject *v68;
  uint64_t Log;
  id v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  TransitPayModelDataProvider *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  objc_super v91;
  _BYTE v92[128];
  _BYTE v93[128];
  uint8_t v94[128];
  uint8_t buf[4];
  const char *v96;
  __int16 v97;
  int v98;
  __int16 v99;
  const char *v100;
  __int16 v101;
  const char *v102;

  v15 = a3;
  v76 = a4;
  v16 = a6;
  v75 = a7;
  v17 = a8;
  v74 = a9;
  v91.receiver = self;
  v91.super_class = (Class)TransitPayModelDataProvider;
  v18 = v17;
  v19 = -[TransitPayModelDataProvider init](&v91, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_suggestions, a4);
    v20->_isTourist = a5;
    v21 = (NSMutableSet *)objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v15, "count"));
    routeTNIs = v20->_routeTNIs;
    v20->_routeTNIs = v21;

    v23 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v16);
    defaultPaymentCardsIdentifiers = v20->_defaultPaymentCardsIdentifiers;
    v20->_defaultPaymentCardsIdentifiers = v23;

    objc_storeStrong((id *)&v20->_defaultPaymentCardsExpressStatuses, a7);
    v25 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v17);
    userClosedLoopIdentifiers = v20->_userClosedLoopIdentifiers;
    v20->_userClosedLoopIdentifiers = v25;

    objc_storeStrong((id *)&v20->_availablePasses, a9);
  }
  v27 = v15;
  if (objc_msgSend(v15, "count"))
  {
    v73 = v16;
    v28 = v76;
    if (objc_msgSend(v76, "count"))
    {
      v71 = v17;
      v72 = v15;
      v29 = objc_alloc_init((Class)NSMutableIndexSet);
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      v30 = v76;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v88;
        do
        {
          for (i = 0; i != v32; i = (char *)i + 1)
          {
            if (*(_QWORD *)v88 != v33)
              objc_enumerationMutation(v30);
            v35 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)i);
            v83 = 0u;
            v84 = 0u;
            v85 = 0u;
            v86 = 0u;
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "paymentMethodIndices", v71));
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
            if (v37)
            {
              v38 = v37;
              v39 = *(_QWORD *)v84;
              do
              {
                for (j = 0; j != v38; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v84 != v39)
                    objc_enumerationMutation(v36);
                  -[NSObject addIndex:](v29, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)j), "unsignedIntegerValue"));
                }
                v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
              }
              while (v38);
            }

          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
        }
        while (v32);
      }

      v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectsAtIndexes:", v29));
      paymentMethods = v20->_paymentMethods;
      v20->_paymentMethods = (NSArray *)v41;

      v43 = objc_msgSend(v72, "count");
      if (v43 != (id)-[NSArray count](v20->_paymentMethods, "count"))
      {
        v44 = sub_10043253C();
        v45 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Trimmed some unused paymentMethods", buf, 2u);
        }

      }
      v46 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSArray count](v20->_paymentMethods, "count"));
      paymentMethodToSuggestionMapping = v20->_paymentMethodToSuggestionMapping;
      v20->_paymentMethodToSuggestionMapping = v46;

      v48 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSArray count](v20->_paymentMethods, "count"));
      identifierToPaymentMethodMapping = v20->_identifierToPaymentMethodMapping;
      v20->_identifierToPaymentMethodMapping = v48;

      v50 = v20->_paymentMethods;
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 3221225472;
      v81[2] = sub_1006EC1C4;
      v81[3] = &unk_1011C0BF0;
      v51 = v20;
      v82 = v51;
      -[NSArray enumerateObjectsUsingBlock:](v50, "enumerateObjectsUsingBlock:", v81);
      v52 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v30, "count"));
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v53 = v30;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
      v27 = v72;
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v78;
        do
        {
          for (k = 0; k != v55; k = (char *)k + 1)
          {
            if (*(_QWORD *)v78 != v56)
              objc_enumerationMutation(v53);
            v58 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)k);
            if (objc_msgSend(v58, "purpose", v71) == 2)
            {
              v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "paymentMethodIndices"));
              objc_msgSend(v52, "addObjectsFromArray:", v59);

            }
          }
          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
        }
        while (v55);
      }

      v51->_numberOfIOMethods = (unint64_t)objc_msgSend(v52, "count");
      v60 = sub_10043253C();
      v61 = objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v96 = (const char *)v51;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "TransitPayModelDataProvider has been setup. State:\n%@", buf, 0xCu);
      }

      v62 = v51;
      v28 = v76;
      v63 = v73;
      v18 = v71;
    }
    else
    {
      v67 = sub_10043253C();
      v68 = objc_claimAutoreleasedReturnValue(v67);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136446978;
        v96 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
        v97 = 1024;
        v98 = 68;
        v99 = 2082;
        v100 = "-[TransitPayModelDataProvider initWithTransitPaymentMethods:suggestions:isTourist:defaultPaymentCardsIden"
               "tifiers:defaultPaymentCardsExpressStatuses:userClosedLoopIdentifiers:availablePasses:]";
        v101 = 2082;
        v102 = "suggestions.count == 0u";
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Payment Method Suggestions cannot be nil", buf, 0x26u);
      }

      Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "TransitPay");
      v29 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136446978;
        v96 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
        v97 = 1024;
        v98 = 68;
        v99 = 2082;
        v100 = "-[TransitPayModelDataProvider initWithTransitPaymentMethods:suggestions:isTourist:defaultPaymentCardsIden"
               "tifiers:defaultPaymentCardsExpressStatuses:userClosedLoopIdentifiers:availablePasses:]";
        v101 = 2082;
        v102 = "suggestions.count == 0u";
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Payment Method Suggestions cannot be nil", buf, 0x26u);
      }
      v62 = 0;
      v63 = v16;
    }
  }
  else
  {
    v63 = v16;
    v64 = sub_10043253C();
    v65 = objc_claimAutoreleasedReturnValue(v64);
    v28 = v76;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v96 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
      v97 = 1024;
      v98 = 67;
      v99 = 2082;
      v100 = "-[TransitPayModelDataProvider initWithTransitPaymentMethods:suggestions:isTourist:defaultPaymentCardsIdenti"
             "fiers:defaultPaymentCardsExpressStatuses:userClosedLoopIdentifiers:availablePasses:]";
      v101 = 2082;
      v102 = "paymentMethods.count == 0u";
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Payment Method cannot be nil", buf, 0x26u);
    }

    v66 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "TransitPay");
    v29 = objc_claimAutoreleasedReturnValue(v66);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v96 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
      v97 = 1024;
      v98 = 67;
      v99 = 2082;
      v100 = "-[TransitPayModelDataProvider initWithTransitPaymentMethods:suggestions:isTourist:defaultPaymentCardsIdenti"
             "fiers:defaultPaymentCardsExpressStatuses:userClosedLoopIdentifiers:availablePasses:]";
      v101 = 2082;
      v102 = "paymentMethods.count == 0u";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Payment Method cannot be nil", buf, 0x26u);
    }
    v62 = 0;
  }

  return v62;
}

- (id)_walletImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "scale");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", CFSTR("com.apple.Passbook"), 2));

  return v3;
}

- (id)_modelDataForPaymentMethodIdentifiers:(id)a3 actionTitle:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  char IsRightToLeft;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  char *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  id v52;
  void *v53;
  int v54;
  uint64_t v55;
  id v56;
  NSObject *v57;
  uint64_t v58;
  NSObject *v59;
  id v60;
  NSObject *v61;
  uint64_t Log;
  id v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  void *v68;
  TransitPayModelData *v69;
  uint64_t v71;
  id v72;
  NSObject *v73;
  int v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  NSObject *v81;
  uint64_t v82;
  unsigned int v83;
  id v84;
  TransitPayModelData *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  uint64_t v90;
  id v91;
  NSObject *v92;
  void *v93;
  void *v94;
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE buf[38];
  __int16 v101;
  void *v102;
  _BYTE v103[128];
  const __CFString *v104;
  void *v105;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v60 = sub_10043253C();
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 180;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "identifiers == nil";
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. identifiers CANNOT be nil", buf, 0x26u);
    }

    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "TransitPay");
    v8 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 180;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "identifiers == nil";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. identifiers CANNOT be nil", buf, 0x26u);
    }
    goto LABEL_39;
  }
  v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v96, v103, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v97;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v97 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_identifierToPaymentMethodMapping, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)i)));
        if (!v14)
        {
          v56 = sub_10043253C();
          v57 = objc_claimAutoreleasedReturnValue(v56);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136446978;
            *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 186;
            *(_WORD *)&buf[18] = 2082;
            *(_QWORD *)&buf[20] = "-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:]";
            *(_WORD *)&buf[28] = 2082;
            *(_QWORD *)&buf[30] = "paymentMethod == nil";
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. paymentMethod SHOULD NOT be nil", buf, 0x26u);
          }

          v58 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "TransitPay");
          v59 = objc_claimAutoreleasedReturnValue(v58);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136446978;
            *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 186;
            *(_WORD *)&buf[18] = 2082;
            *(_QWORD *)&buf[20] = "-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:]";
            *(_WORD *)&buf[28] = 2082;
            *(_QWORD *)&buf[30] = "paymentMethod == nil";
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. paymentMethod SHOULD NOT be nil", buf, 0x26u);
          }

          goto LABEL_39;
        }
        v15 = (void *)v14;
        -[NSObject addObject:](v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v96, v103, 16);
      if (v11)
        continue;
      break;
    }
  }

  if (!-[NSObject count](v8, "count"))
  {
    v63 = sub_10043253C();
    v64 = objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelDataProvider description](self, "description"));
      *(_DWORD *)buf = 136447234;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 190;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "paymentMethods.count == 0u";
      v101 = 2112;
      v102 = v65;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. paymentMethods cannot be nil. %@", buf, 0x30u);

    }
    v66 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "TransitPay");
    v67 = objc_claimAutoreleasedReturnValue(v66);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelDataProvider description](self, "description"));
      *(_DWORD *)buf = 136447234;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 190;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "paymentMethods.count == 0u";
      v101 = 2112;
      v102 = v68;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. paymentMethods cannot be nil. %@", buf, 0x30u);

    }
LABEL_39:
    v69 = 0;
    goto LABEL_40;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", 0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_paymentMethodToSuggestionMapping, "objectForKeyedSubscript:", v16));
  v18 = sub_10043253C();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = v19;
  v94 = v17;
  if (v17)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v17;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Suggesting: %@, %@", buf, 0x16u);
    }

    v21 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", self->_defaultPaymentCardsIdentifiers);
    -[NSObject addEntriesFromDictionary:](v21, "addEntriesFromDictionary:", self->_userClosedLoopIdentifiers);
    -[NSObject addEntriesFromDictionary:](v21, "addEntriesFromDictionary:", self->_availablePasses);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v21, "objectForKey:", v22));

    if (v23)
    {
      v84 = v7;
      v89 = v6;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tipSubtitle"));
      v93 = v16;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
      v92 = v21;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", v25));
      v27 = v24;
      IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft(v27);
      v104 = CFSTR("{CardName}");
      v105 = v26;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1));
      buf[0] = 1;
      memset(&buf[1], 0, 17);
      buf[18] = IsRightToLeft;
      v30 = v17;
      *(_QWORD *)&buf[19] = 0;
      *(_QWORD *)&buf[24] = 0;
      v90 = objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringForServerFormattedString:options:overrideVariables:](NSString, "_navigation_stringForServerFormattedString:options:overrideVariables:", v27, buf, v29));

      v95 = objc_alloc_init((Class)NSMutableString);
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "educationalScreenPaymentBody"));
      v32 = objc_msgSend(v31, "count");

      if (v32)
      {
        v33 = 0;
        do
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "educationalScreenPaymentBody"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectAtIndexedSubscript:", v33));

          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v92, "objectForKeyedSubscript:", v36));
          v38 = v35;
          LOBYTE(v35) = MKApplicationLayoutDirectionIsRightToLeft(v38);
          v104 = CFSTR("{CardName}");
          v105 = v37;
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1));
          buf[0] = 1;
          memset(&buf[1], 0, 17);
          buf[18] = (_BYTE)v35;
          *(_QWORD *)&buf[19] = 0;
          *(_QWORD *)&buf[24] = 0;
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringForServerFormattedString:options:overrideVariables:](NSString, "_navigation_stringForServerFormattedString:options:overrideVariables:", v38, buf, v39));

          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "stringByTrimmingCharactersInSet:", v41));

          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1011EB268));
          v30 = v94;
          objc_msgSend(v95, "appendString:", v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "educationalScreenPaymentBody"));
          v45 = (char *)objc_msgSend(v44, "count") - 1;

          if (v33 < (unint64_t)v45)
            objc_msgSend(v95, "appendString:", CFSTR("\n\n"));

          ++v33;
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "educationalScreenPaymentBody"));
          v47 = objc_msgSend(v46, "count");

        }
        while (v33 < (unint64_t)v47);
      }
      v91 = objc_msgSend(objc_alloc((Class)NSString), "initWithString:", v95);
      v85 = [TransitPayModelData alloc];
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "tipTitle"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "formatStrings"));
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "firstObject"));
      v50 = objc_claimAutoreleasedReturnValue(-[TransitPayModelDataProvider _walletImage](self, "_walletImage"));
      v51 = v16;
      v52 = v30;
      v87 = v49;
      v88 = v48;
      if (objc_msgSend(v51, "paymentMethodType") == 1)
      {
        v53 = (void *)v50;
        if (objc_msgSend(v52, "type") == 1)
          v54 = 1;
        else
          v54 = 2;
        v83 = v54;
        v7 = v84;
        v55 = v90;
      }
      else
      {
        v7 = v84;
        v55 = v90;
        v53 = (void *)v50;
        if (objc_msgSend(v51, "paymentMethodType") == 2)
        {
          if (objc_msgSend(v52, "purpose") == 2)
            v74 = 4;
          else
            v74 = 3;
          v83 = v74;
        }
        else
        {
          v83 = 0;
        }
      }

      v75 = -[NSObject copy](v8, "copy");
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "educationalScreenTitle"));
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "formatStrings"));
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "firstObject"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "educationalScreenAssets"));
      LOBYTE(v82) = 0;
      v69 = -[TransitPayModelData initWithTitle:subtitle:actionTitle:image:suggestionType:paymentMethods:educationScreenTitle:educationScreenAssetURLs:educationScreenText:topUpPassUniqueID:isForRemoteDevice:](v85, "initWithTitle:subtitle:actionTitle:image:suggestionType:paymentMethods:educationScreenTitle:educationScreenAssetURLs:educationScreenText:topUpPassUniqueID:isForRemoteDevice:", v86, v55, v7, v53, v83, v75, v78, v79, v91, 0, v82);

      v80 = sub_10043253C();
      v81 = objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v69;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "Returning Model: %@", buf, 0xCu);
      }

      v6 = v89;
      v73 = v90;
      v21 = v92;
      v16 = v93;
    }
    else
    {
      v72 = sub_10043253C();
      v73 = objc_claimAutoreleasedReturnValue(v72);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "Unable to create a modelData object because combinedPasses[paymentMethod.identifier] is nil", buf, 2u);
      }
      v69 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 198;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "suggestion == nil";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. paymentMethodSuggestion SHOULD NOT be nil", buf, 0x26u);
    }

    v71 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "TransitPay");
    v21 = objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 198;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "suggestion == nil";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. paymentMethodSuggestion SHOULD NOT be nil", buf, 0x26u);
    }
    v69 = 0;
  }

LABEL_40:
  return v69;
}

- (id)_modelDataForOpenLoop
{
  id v3;
  void *v4;
  id v5;
  NSMutableDictionary *identifierToPaymentMethodMapping;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[16];
  _BYTE v35[128];

  v3 = objc_alloc((Class)NSMutableSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_defaultPaymentCardsIdentifiers, "allKeys"));
  v5 = objc_msgSend(v3, "initWithArray:", v4);

  objc_msgSend(v5, "intersectSet:", self->_routeTNIs);
  if (objc_msgSend(v5, "count"))
  {
    identifierToPaymentMethodMapping = self->_identifierToPaymentMethodMapping;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "anyObject"));
    v8 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifierToPaymentMethodMapping, "objectForKeyedSubscript:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_paymentMethodToSuggestionMapping, "objectForKeyedSubscript:", v8));
    if (objc_msgSend(v9, "type") == 1)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v10 = v5;
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v31;
        while (2)
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v31 != v13)
              objc_enumerationMutation(v10);
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_defaultPaymentCardsExpressStatuses, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v14), (_QWORD)v30));
            v16 = objc_msgSend(v15, "BOOLValue");

            if (v16)
            {
              v24 = sub_10043253C();
              v25 = objc_claimAutoreleasedReturnValue(v24);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Showing Open Loop Express Suggestion", buf, 2u);
              }

              v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject allObjects](v10, "allObjects"));
              v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("MAPS_TRANSIT_PAY_ACTION_BUTTON_SEE_HOW_IT_WORKS"), CFSTR("localized string not found"), 0));

              v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:](self, "_modelDataForPaymentMethodIdentifiers:actionTitle:", v26, v28));
              goto LABEL_23;
            }
            v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          if (v12)
            continue;
          break;
        }
      }

      v17 = sub_10043253C();
      v10 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "User had no express-enabled default cards", buf, 2u);
      }
      v18 = 0;
    }
    else
    {
      v20 = sub_10043253C();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Showing Open Loop Non-Express Suggestion", buf, 2u);
      }

      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("MAPS_TRANSIT_PAY_ACTION_BUTTON_SEE_HOW_IT_WORKS"), CFSTR("localized string not found"), 0));

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:](self, "_modelDataForPaymentMethodIdentifiers:actionTitle:", v10, v23));
    }
LABEL_23:

  }
  else
  {
    v19 = sub_10043253C();
    v8 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Market does not support any of the user's default cards", buf, 2u);
    }
    v18 = 0;
  }

  return v18;
}

- (id)_filteredClosedLoopIdentifiers
{
  id v3;
  NSMutableDictionary *paymentMethodToSuggestionMapping;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableDictionary count](self->_paymentMethodToSuggestionMapping, "count"));
  paymentMethodToSuggestionMapping = self->_paymentMethodToSuggestionMapping;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1006ED524;
  v8[3] = &unk_1011C0C18;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](paymentMethodToSuggestionMapping, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = objc_msgSend(v5, "copy");

  return v6;
}

- (BOOL)_userHasNonDCICardInCurrentMarket
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = self->_paymentMethods;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_userClosedLoopIdentifiers, "allKeys", (_QWORD)v19));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
        v11 = objc_msgSend(v9, "containsObject:", v10);

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_paymentMethodToSuggestionMapping, "objectForKeyedSubscript:", v8));
          v13 = objc_msgSend(v12, "type");

          if (v13 == 4)
          {
            v15 = sub_10043253C();
            v16 = objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
              *(_DWORD *)buf = 138412290;
              v24 = v17;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "User owns card %@ which is non-DCI", buf, 0xCu);

            }
            v14 = 1;
            goto LABEL_14;
          }
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v5)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (BOOL)_allIdentifiersAreInteroperable:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  NSMutableDictionary *paymentMethodToSuggestionMapping;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  BOOL v13;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  const __CFString *v25;
  _BYTE v26[128];

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        paymentMethodToSuggestionMapping = self->_paymentMethodToSuggestionMapping;
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1006EDAC8;
        v15[3] = &unk_1011C0C40;
        v15[4] = v8;
        v15[5] = &v20;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](paymentMethodToSuggestionMapping, "enumerateKeysAndObjectsUsingBlock:", v15);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v5);
  }

  v10 = sub_10043253C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    if (*((_BYTE *)v21 + 24))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "areAllInteroperable? %@", buf, 0xCu);
  }

  v13 = *((_BYTE *)v21 + 24) != 0;
  _Block_object_dispose(&v20, 8);

  return v13;
}

- (id)modelData
{
  TransitPayModelDataProvider *v2;
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  id v12;
  NSObject *v13;
  uint64_t Log;
  const char *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  NSObject *v32;
  unint64_t numberOfCLDCIMethods;
  id v34;
  NSObject *v35;
  id v36;
  NSMutableSet *routeTNIs;
  NSObject *v38;
  uint32_t v39;
  id v40;
  NSObject *v41;
  id v42;
  id v43;
  NSObject *v44;
  id v45;
  id v46;
  NSObject *v47;
  _BOOL4 v48;
  NSDictionary *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  id v56;
  NSObject *v57;
  char *v58;
  NSDictionary *v59;
  NSObject *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  NSObject *v66;
  NSDictionary *availablePasses;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v75;
  void *v76;
  void *v77;
  uint8_t buf[4];
  const char *v79;
  __int16 v80;
  _BYTE v81[14];
  __int16 v82;
  const char *v83;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_paymentMethods)
  {
    v12 = sub_10043253C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v79 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
      v80 = 1024;
      *(_DWORD *)v81 = 362;
      *(_WORD *)&v81[4] = 2082;
      *(_QWORD *)&v81[6] = "-[TransitPayModelDataProvider modelData]";
      v82 = 2082;
      v83 = "_paymentMethods == nil";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Payment Method cannot be nil", buf, 0x26u);
    }

    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "TransitPay");
    v5 = objc_claimAutoreleasedReturnValue(Log);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      goto LABEL_22;
    *(_DWORD *)buf = 136446978;
    v79 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
    v80 = 1024;
    *(_DWORD *)v81 = 362;
    *(_WORD *)&v81[4] = 2082;
    *(_QWORD *)&v81[6] = "-[TransitPayModelDataProvider modelData]";
    v82 = 2082;
    v83 = "_paymentMethods == nil";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Payment Method cannot be nil";
    goto LABEL_21;
  }
  if (v2->_suggestions)
  {
    v3 = objc_alloc((Class)NSMutableSet);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v2->_defaultPaymentCardsIdentifiers, "allKeys"));
    v5 = objc_msgSend(v3, "initWithArray:", v4);

    v6 = objc_alloc((Class)NSMutableSet);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v2->_userClosedLoopIdentifiers, "allKeys"));
    v8 = objc_msgSend(v6, "initWithArray:", v7);

    if (!v2->_numberOfCLNonDCIMethods)
      goto LABEL_110;
    if (!v2->_numberOfOLMethods)
    {
      if (-[TransitPayModelDataProvider _userHasNonDCICardInCurrentMarket](v2, "_userHasNonDCICardInCurrentMarket"))
      {
        v27 = sub_10043253C();
        v10 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v11 = "No suggestion for a non-DCI card in a market without OL support";
          goto LABEL_84;
        }
LABEL_86:
        v19 = 0;
        goto LABEL_87;
      }
      if (!v2->_numberOfOLMethods)
        goto LABEL_110;
    }
    if (!-[TransitPayModelDataProvider _userHasNonDCICardInCurrentMarket](v2, "_userHasNonDCICardInCurrentMarket"))
    {
      v28 = sub_10043253C();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Showing an open loop suggestion. The user does NOT have a DCI card in Wallet", buf, 2u);
      }

    }
    else
    {
LABEL_110:
      if (v2->_numberOfCLDCIMethods && v2->_numberOfOLMethods)
      {
        if (!v2->_isTourist)
        {
          if ((-[NSMutableSet intersectsSet:](v2->_routeTNIs, "intersectsSet:", v8) & 1) == 0)
          {
            v10 = objc_claimAutoreleasedReturnValue(-[TransitPayModelDataProvider _filteredClosedLoopIdentifiers](v2, "_filteredClosedLoopIdentifiers"));
            v65 = sub_10043253C();
            v66 = objc_claimAutoreleasedReturnValue(v65);
            if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v79 = (const char *)v10;
              _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "isTourist = NO. Showing Closed Loop Suggestions for: %@", buf, 0xCu);
            }

            if (-[NSObject count](v10, "count") == (id)1)
            {
              availablePasses = v2->_availablePasses;
              v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0));
              v69 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](availablePasses, "objectForKeyedSubscript:", v68));
              if (v69)
              {
                v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "localizedStringForKey:value:table:", CFSTR("MAPS_TRANSIT_PAY_ACTION_BUTTON_SINGLE_CLOSED_LOOP_CARD_WITH_NAME"), CFSTR("localized string not found"), 0));

                v72 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", v71, v69);
              }
              else
              {
                v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                v72 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "localizedStringForKey:value:table:", CFSTR("MAPS_TRANSIT_PAY_ACTION_BUTTON_MULTIPLE_CLOSED_LOOP_CARDS"), CFSTR("localized string not found"), 0));
              }
              v76 = v72;

            }
            else
            {
              v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("MAPS_TRANSIT_PAY_ACTION_BUTTON_MULTIPLE_CLOSED_LOOP_CARDS"), CFSTR("localized string not found"), 0));
            }

            v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:](v2, "_modelDataForPaymentMethodIdentifiers:actionTitle:", v10, v76));
            goto LABEL_87;
          }
          v30 = sub_10043253C();
          v10 = objc_claimAutoreleasedReturnValue(v30);
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            goto LABEL_86;
          *(_WORD *)buf = 0;
          v11 = "No Suggestion. Route has a combination of OL and CL methods and the user is not a Tourist. Looks like th"
                "e user already has a compatible CL card.";
          goto LABEL_84;
        }
        if (!-[NSObject count](v5, "count")
          || (-[NSObject intersectsSet:](v5, "intersectsSet:", v2->_routeTNIs) & 1) == 0)
        {
          v9 = sub_10043253C();
          v10 = objc_claimAutoreleasedReturnValue(v9);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v11 = "Tourist. No Suggestion. No payment card in the wallet has an identifier that the route needs.";
LABEL_84:
            v38 = v10;
            v39 = 2;
LABEL_85:
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, v11, buf, v39);
            goto LABEL_86;
          }
          goto LABEL_86;
        }
      }
      else
      {
        if (v2->_numberOfIOMethods
          && -[NSMutableSet intersectsSet:](v2->_routeTNIs, "intersectsSet:", v8))
        {
          v20 = sub_10043253C();
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Checking _numberOfIOMethods >= 1 && [_routeIdentifiers intersectsSet:userClosedLoopIdentifiers]", buf, 2u);
          }

          v10 = -[NSMutableSet mutableCopy](v2->_routeTNIs, "mutableCopy");
          -[NSObject intersectSet:](v10, "intersectSet:", v8);
          v22 = sub_10043253C();
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v79 = (const char *)v10;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Showing Interoperable Suggestion for: %@", buf, 0xCu);
          }

          if (-[TransitPayModelDataProvider _allIdentifiersAreInteroperable:](v2, "_allIdentifiersAreInteroperable:", v10))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject allObjects](v10, "allObjects"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("MAPS_TRANSIT_PAY_ACTION_BUTTON_SEE_HOW_IT_WORKS"), CFSTR("localized string not found"), 0));

            v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:](v2, "_modelDataForPaymentMethodIdentifiers:actionTitle:", v24, v26));
LABEL_87:

            goto LABEL_88;
          }
          v31 = sub_10043253C();
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Falling through. _allIdentifiersAreInteroperable check didn't pass.", buf, 2u);
          }

        }
        numberOfCLDCIMethods = v2->_numberOfCLDCIMethods;
        if (numberOfCLDCIMethods >= 2)
        {
          if ((-[NSMutableSet intersectsSet:](v2->_routeTNIs, "intersectsSet:", v8) & 1) == 0)
          {
            v43 = sub_10043253C();
            v44 = objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Checking _numberOfCLMethods >= 1 && ![_routeIdentifiers intersectsSet:userClosedLoopIdentifiers]", buf, 2u);
            }

            v10 = objc_claimAutoreleasedReturnValue(-[TransitPayModelDataProvider _filteredClosedLoopIdentifiers](v2, "_filteredClosedLoopIdentifiers"));
            v45 = -[NSObject count](v10, "count");
            v46 = sub_10043253C();
            v47 = objc_claimAutoreleasedReturnValue(v46);
            v48 = os_log_type_enabled(v47, OS_LOG_TYPE_INFO);
            if (v45)
            {
              if (v48)
              {
                *(_DWORD *)buf = 138412290;
                v79 = (const char *)v10;
                _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Showing Closed Loop Suggestions from multiple options for: %@", buf, 0xCu);
              }

              if (-[NSObject count](v10, "count") == (id)1)
              {
                v49 = v2->_availablePasses;
                v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0));
                v51 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v49, "objectForKeyedSubscript:", v50));
                if (v51)
                {
                  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("MAPS_TRANSIT_PAY_ACTION_BUTTON_SINGLE_CLOSED_LOOP_CARD_WITH_NAME"), CFSTR("localized string not found"), 0));

                  v54 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", v53, v51);
                }
                else
                {
                  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                  v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("MAPS_TRANSIT_PAY_ACTION_BUTTON_MULTIPLE_CLOSED_LOOP_CARDS"), CFSTR("localized string not found"), 0));
                }
                v47 = v54;

              }
              else
              {
                v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("MAPS_TRANSIT_PAY_ACTION_BUTTON_MULTIPLE_CLOSED_LOOP_CARDS"), CFSTR("localized string not found"), 0));
              }

              v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:](v2, "_modelDataForPaymentMethodIdentifiers:actionTitle:", v10, v47));
            }
            else
            {
              if (v48)
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "No Suggestion. Could not parse an identifier that has a valid paymentMethodSuggestion.", buf, 2u);
              }
              v19 = 0;
            }

            goto LABEL_87;
          }
          numberOfCLDCIMethods = v2->_numberOfCLDCIMethods;
        }
        if (numberOfCLDCIMethods == 1)
        {
          v34 = sub_10043253C();
          v35 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Checking _numberOfCLMethods == 1", buf, 2u);
          }

          if (!-[NSMutableSet intersectsSet:](v2->_routeTNIs, "intersectsSet:", v8))
          {
            v55 = objc_claimAutoreleasedReturnValue(-[TransitPayModelDataProvider _filteredClosedLoopIdentifiers](v2, "_filteredClosedLoopIdentifiers"));
            v10 = v55;
            if (v55 && -[NSObject count](v55, "count"))
            {
              v56 = sub_10043253C();
              v57 = objc_claimAutoreleasedReturnValue(v56);
              if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
              {
                v58 = (char *)objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0));
                *(_DWORD *)buf = 138412290;
                v79 = v58;
                _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "Showing Closed Loop Suggestion for: %@", buf, 0xCu);

              }
              v59 = v2->_availablePasses;
              v60 = objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0));
              v61 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v59, "objectForKeyedSubscript:", v60));
              if (v61)
              {
                v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("MAPS_TRANSIT_PAY_ACTION_BUTTON_SINGLE_CLOSED_LOOP_CARD_WITH_NAME"), CFSTR("localized string not found"), 0));

                v64 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", v63, v61);
              }
              else
              {
                v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                v64 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("MAPS_TRANSIT_PAY_ACTION_BUTTON_MULTIPLE_CLOSED_LOOP_CARDS"), CFSTR("localized string not found"), 0));
              }
              v77 = v64;

              v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:](v2, "_modelDataForPaymentMethodIdentifiers:actionTitle:", v10, v77));
            }
            else
            {
              v75 = sub_10043253C();
              v60 = objc_claimAutoreleasedReturnValue(v75);
              if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "No Suggestion. Could not parse an identifier that has a valid paymentMethodSuggestion.", buf, 2u);
              }
              v19 = 0;
            }

            goto LABEL_87;
          }
          v36 = sub_10043253C();
          v10 = objc_claimAutoreleasedReturnValue(v36);
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            goto LABEL_86;
          routeTNIs = v2->_routeTNIs;
          *(_DWORD *)buf = 138412546;
          v79 = (const char *)routeTNIs;
          v80 = 2112;
          *(_QWORD *)v81 = v8;
          v11 = "No Suggestion. User already has CL pass in their Wallet: Suggested: \n%@\nExisting passes:\n%@";
          v38 = v10;
          v39 = 22;
          goto LABEL_85;
        }
        if (!v2->_numberOfOLMethods)
        {
          v19 = 0;
          goto LABEL_88;
        }
        v40 = sub_10043253C();
        v41 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Checking _numberOfOLMethods >= 1", buf, 2u);
        }

        if ((-[NSObject intersectsSet:](v5, "intersectsSet:", v2->_routeTNIs) & 1) == 0)
        {
          v73 = sub_10043253C();
          v10 = objc_claimAutoreleasedReturnValue(v73);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v11 = "No Suggestion. The default payment card in Wallet does not has an identifier that the route needs.";
            goto LABEL_84;
          }
          goto LABEL_86;
        }
        if (!-[NSObject count](v5, "count"))
        {
          v42 = sub_10043253C();
          v10 = objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v11 = "User does not have even a single payment card. Not showing any Suggestion";
            goto LABEL_84;
          }
          goto LABEL_86;
        }
      }
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelDataProvider _modelDataForOpenLoop](v2, "_modelDataForOpenLoop"));
LABEL_88:

    goto LABEL_89;
  }
  v16 = sub_10043253C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446978;
    v79 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
    v80 = 1024;
    *(_DWORD *)v81 = 363;
    *(_WORD *)&v81[4] = 2082;
    *(_QWORD *)&v81[6] = "-[TransitPayModelDataProvider modelData]";
    v82 = 2082;
    v83 = "_suggestions == nil";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Payment Method Suggestions cannot be nil", buf, 0x26u);
  }

  v18 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "TransitPay");
  v5 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446978;
    v79 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
    v80 = 1024;
    *(_DWORD *)v81 = 363;
    *(_WORD *)&v81[4] = 2082;
    *(_QWORD *)&v81[6] = "-[TransitPayModelDataProvider modelData]";
    v82 = 2082;
    v83 = "_suggestions == nil";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Payment Method Suggestions cannot be nil";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, v15, buf, 0x26u);
  }
LABEL_22:
  v19 = 0;
LABEL_89:

  objc_sync_exit(v2);
  return v19;
}

- (id)description
{
  id v3;
  const __CFString *v4;
  id v5;

  v3 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v3, "appendFormat:", CFSTR("TransitPayModelDataProvider:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentMethods:                        %@\n"), self->_paymentMethods);
  objc_msgSend(v3, "appendFormat:", CFSTR("suggestions:                           %@\n"), self->_suggestions);
  if (self->_isTourist)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("isTourist:                             %@\n"), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("routeIdentifiers:                      %@\n"), self->_routeTNIs);
  objc_msgSend(v3, "appendFormat:", CFSTR("defaultPaymentCardsIdentifiers:        %@\n"), self->_defaultPaymentCardsIdentifiers);
  objc_msgSend(v3, "appendFormat:", CFSTR("defaultPaymentCardsExpressStatuses:    %@\n"), self->_defaultPaymentCardsExpressStatuses);
  objc_msgSend(v3, "appendFormat:", CFSTR("userClosedLoopIdentifiers:             %@\n"), self->_userClosedLoopIdentifiers);
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentMethod-->suggestion:            %@\n"), self->_paymentMethodToSuggestionMapping);
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier-->paymentMethod:            %@\n"), self->_identifierToPaymentMethodMapping);
  objc_msgSend(v3, "appendFormat:", CFSTR("allAvailablePasses:                    %@\n"), self->_availablePasses);
  objc_msgSend(v3, "appendFormat:", CFSTR("numberOfOLMethods:                     %lu\n"), self->_numberOfOLMethods);
  objc_msgSend(v3, "appendFormat:", CFSTR("numberOfCLDCIMethods:                  %lu\n"), self->_numberOfCLDCIMethods);
  objc_msgSend(v3, "appendFormat:", CFSTR("numberOfCLNonDCIMethods:               %lu\n"), self->_numberOfCLNonDCIMethods);
  objc_msgSend(v3, "appendFormat:", CFSTR("numberOfIOMethods:                     %lu\n"), self->_numberOfIOMethods);
  v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithString:", v3);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierToPaymentMethodMapping, 0);
  objc_storeStrong((id *)&self->_paymentMethodToSuggestionMapping, 0);
  objc_storeStrong((id *)&self->_availablePasses, 0);
  objc_storeStrong((id *)&self->_userClosedLoopIdentifiers, 0);
  objc_storeStrong((id *)&self->_defaultPaymentCardsIdentifiers, 0);
  objc_storeStrong((id *)&self->_defaultPaymentCardsExpressStatuses, 0);
  objc_storeStrong((id *)&self->_routeTNIs, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_paymentMethods, 0);
}

@end

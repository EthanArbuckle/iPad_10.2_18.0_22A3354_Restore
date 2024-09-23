@implementation SHSheetContentDataSourceManager

+ (id)contentCustomViewUniqueIdentifier
{
  if (contentCustomViewUniqueIdentifier_onceToken != -1)
    dispatch_once(&contentCustomViewUniqueIdentifier_onceToken, &__block_literal_global_1);
  return (id)contentCustomViewUniqueIdentifier_contentCustomViewUniqueIdentifier;
}

void __68__SHSheetContentDataSourceManager_contentCustomViewUniqueIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)contentCustomViewUniqueIdentifier_contentCustomViewUniqueIdentifier;
  contentCustomViewUniqueIdentifier_contentCustomViewUniqueIdentifier = v0;

}

- (SHSheetContentDataSourceManager)initWithApplicationActivityTypes:(id)a3 heroActionActivityTypes:(id)a4
{
  id v6;
  id v7;
  SHSheetContentDataSourceManager *v8;
  uint64_t v9;
  NSArray *applicationActivityTypes;
  uint64_t v11;
  NSArray *heroActionActivityTypes;
  uint64_t v13;
  NSMutableSet *suggestLessIdentifiers;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SHSheetContentDataSourceManager;
  v8 = -[SHSheetContentDataSourceManager init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    applicationActivityTypes = v8->_applicationActivityTypes;
    v8->_applicationActivityTypes = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    heroActionActivityTypes = v8->_heroActionActivityTypes;
    v8->_heroActionActivityTypes = (NSArray *)v11;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    suggestLessIdentifiers = v8->_suggestLessIdentifiers;
    v8->_suggestLessIdentifiers = (NSMutableSet *)v13;

  }
  return v8;
}

- (id)_uniqueIdentifierForSectionIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CustomSection%@"), a3);
}

- (id)_updateCurrentStateWithChangeRequest:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  char v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  int v55;
  int v56;
  void *v57;
  void *v58;
  int v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t k;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  SHSheetContentDataSourceState *v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  id obj;
  id obja;
  id objb;
  SHSheetContentDataSourceManager *v95;
  void *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v95 = self;
  -[SHSheetContentDataSourceManager currentState](self, "currentState");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_alloc_init(SHSheetContentDataSourceState);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v87 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "excludeSectionTypes");
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v77 = v4;
  objc_msgSend(v4, "peopleProxies");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v116, 16);
  v88 = v5;
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v110;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v110 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
        if (objc_msgSend(v11, "isMagicHead"))
          -[SHSheetContentDataSourceState setAirDropProxy:](v83, "setAirDropProxy:", v11);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SHSheetContentDataSourceManager suggestLessIdentifiers](v95, "suggestLessIdentifiers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsObject:", v12);

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v96, "peopleProxyByUUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if ((v6 & 2) != 0 || !v16)
            goto LABEL_18;
          v17 = v11;
          v18 = v16;
          if (v17 == v18)
          {

            v5 = v88;
          }
          else
          {
            v19 = v18;
            if (v17)
            {
              v20 = objc_msgSend(v17, "isEqual:", v18);

              v5 = v88;
              if ((v20 & 1) != 0)
                goto LABEL_18;
            }
            else
            {

              v5 = v88;
            }
            objc_msgSend(v87, "addObject:", v12);
          }
LABEL_18:
          objc_msgSend(v85, "setObject:forKeyedSubscript:", v11, v12);
          objc_msgSend(v84, "addObject:", v12);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v116, 16);
    }
    while (v8);
  }

  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  objc_msgSend(v77, "shareProxies");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v105, v115, 16);
  if (!v21)
    goto LABEL_37;
  v22 = v21;
  v23 = *(_QWORD *)v106;
  do
  {
    for (j = 0; j != v22; ++j)
    {
      if (*(_QWORD *)v106 != v23)
        objc_enumerationMutation(obja);
      v25 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * j);
      objc_msgSend(v25, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "shareProxyByUUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v6 & 4) == 0 && v28)
      {
        v29 = v25;
        v30 = v28;
        if (v29 == v30)
        {

          v5 = v88;
          goto LABEL_35;
        }
        v31 = v30;
        if (!v29)
        {

          v5 = v88;
LABEL_34:
          objc_msgSend(v87, "addObject:", v26);
          goto LABEL_35;
        }
        v32 = objc_msgSend(v29, "isEqual:", v30);

        v5 = v88;
        if ((v32 & 1) == 0)
          goto LABEL_34;
      }
LABEL_35:
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, v26);
      objc_msgSend(v90, "addObject:", v26);

    }
    v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v105, v115, 16);
  }
  while (v22);
LABEL_37:

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v33 = v77;
  objc_msgSend(v77, "actionProxies");
  v86 = (id)objc_claimAutoreleasedReturnValue();
  objb = (id)objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v101, v114, 16);
  if (!objb)
    goto LABEL_74;
  v89 = *(_QWORD *)v102;
  while (2)
  {
    v34 = 0;
    while (2)
    {
      if (*(_QWORD *)v102 != v89)
        objc_enumerationMutation(v86);
      v35 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * v34);
      objc_msgSend(v35, "identifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "actionProxyByUUID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v6 & 8) == 0 && v38)
      {
        v39 = v35;
        v40 = v38;
        if (v39 == v40)
        {

        }
        else
        {
          v41 = v40;
          if (v39)
          {
            v42 = objc_msgSend(v39, "isEqual:", v40);

            if ((v42 & 1) != 0)
              goto LABEL_51;
          }
          else
          {

          }
          objc_msgSend(v87, "addObject:", v36);
        }
      }
LABEL_51:
      objc_msgSend(v91, "setObject:forKeyedSubscript:", v35, v36);
      objc_msgSend(v33, "activitiesByUUID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "objectForKeyedSubscript:", v36);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        -[SHSheetContentDataSourceManager heroActionActivityTypes](v95, "heroActionActivityTypes");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "activityType");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v45, "containsObject:", v46);

        if (v47)
        {
          objc_msgSend(v44, "activityType");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "setObject:forKeyedSubscript:", v36, v48);
          goto LABEL_67;
        }
      }
      if (objc_msgSend(v35, "isFavorite"))
      {
        v49 = v82;
        goto LABEL_56;
      }
      objc_msgSend(v44, "activitySectionIdentifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (v50)
      {
        objc_msgSend(v44, "activitySectionIdentifier");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[SHSheetContentDataSourceManager _uniqueIdentifierForSectionIdentifier:](v95, "_uniqueIdentifierForSectionIdentifier:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v80, "objectForKeyedSubscript:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v53)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "setObject:forKeyedSubscript:", v53, v52);
        }
        objc_msgSend(v53, "addObject:", v36);
        objc_msgSend(v79, "addObject:", v52);

      }
      else
      {
        v54 = objc_msgSend(v44, "_isBuiltinDerived");
        v55 = objc_msgSend(v44, "_showsInSystemActionGroup");
        if (v44)
        {
          v56 = v55;
          -[SHSheetContentDataSourceManager applicationActivityTypes](v95, "applicationActivityTypes");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "activityType");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v57, "containsObject:", v58) & (v54 ^ 1) | v56;

          v33 = v77;
        }
        else
        {
          v59 = 0;
        }
        objc_msgSend(v44, "_activityFooterText");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (v48 || (objc_msgSend(v35, "activityFooter"), (v48 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend(v78, "addObject:", v36);
LABEL_67:

        }
        else
        {
          if (v59)
            v49 = v76;
          else
            v49 = v75;
LABEL_56:
          objc_msgSend(v49, "addObject:", v36);
        }
      }

      if (objb != (id)++v34)
        continue;
      break;
    }
    v60 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v101, v114, 16);
    objb = (id)v60;
    if (v60)
      continue;
    break;
  }
LABEL_74:

  v61 = v78;
  if (objc_msgSend(v81, "count"))
  {
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    -[SHSheetContentDataSourceManager heroActionActivityTypes](v95, "heroActionActivityTypes");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v97, v113, 16);
    if (v63)
    {
      v64 = v63;
      v65 = *(_QWORD *)v98;
      do
      {
        for (k = 0; k != v64; ++k)
        {
          if (*(_QWORD *)v98 != v65)
            objc_enumerationMutation(v62);
          objc_msgSend(v81, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * k));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          if (v67)
            objc_msgSend(v74, "addObject:", v67);

        }
        v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v97, v113, 16);
      }
      while (v64);
    }

    v33 = v77;
    v61 = v78;
  }
  objc_msgSend(v33, "peopleProxies");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContentDataSourceState setPeopleProxies:](v83, "setPeopleProxies:", v68);

  objc_msgSend(v33, "shareProxies");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContentDataSourceState setShareProxies:](v83, "setShareProxies:", v69);

  objc_msgSend(v33, "actionProxies");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContentDataSourceState setActionProxies:](v83, "setActionProxies:", v70);

  objc_msgSend(v33, "activitiesByUUID");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContentDataSourceState setActivitiesByUUID:](v83, "setActivitiesByUUID:", v71);

  -[SHSheetContentDataSourceState setNearbyCountSlotID:](v83, "setNearbyCountSlotID:", objc_msgSend(v33, "nearbyCountSlotID"));
  -[SHSheetContentDataSourceState setPeopleProxyByUUID:](v83, "setPeopleProxyByUUID:", v85);
  -[SHSheetContentDataSourceState setShareProxyByUUID:](v83, "setShareProxyByUUID:", v88);
  -[SHSheetContentDataSourceState setActionProxyByUUID:](v83, "setActionProxyByUUID:", v91);
  -[SHSheetContentDataSourceState setPeopleIdentifiers:](v83, "setPeopleIdentifiers:", v84);
  -[SHSheetContentDataSourceState setShareIdentifiers:](v83, "setShareIdentifiers:", v90);
  -[SHSheetContentDataSourceState setHeroActionIdentifiers:](v83, "setHeroActionIdentifiers:", v74);
  -[SHSheetContentDataSourceState setInformationalActionIdentifiers:](v83, "setInformationalActionIdentifiers:", v61);
  -[SHSheetContentDataSourceState setFavoriteActionIdentifiers:](v83, "setFavoriteActionIdentifiers:", v82);
  -[SHSheetContentDataSourceState setCustomActionIdentifiersByCustomSectionIdentifier:](v83, "setCustomActionIdentifiersByCustomSectionIdentifier:", v80);
  -[SHSheetContentDataSourceState setCustomSectionIdentifiers:](v83, "setCustomSectionIdentifiers:", v79);
  -[SHSheetContentDataSourceState setSystemActionIdentifiers:](v83, "setSystemActionIdentifiers:", v76);
  -[SHSheetContentDataSourceState setExtensionActionIdentifiers:](v83, "setExtensionActionIdentifiers:", v75);
  share_sheet_log();
  v72 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    -[SHSheetContentDataSourceManager _updateCurrentStateWithChangeRequest:].cold.1(v95, (uint64_t)v83, v72);

  -[SHSheetContentDataSourceManager setCurrentState:](v95, "setCurrentState:", v83);
  return v87;
}

- (void)updateWithChangeRequest:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SHSheetContentDataSource *v10;
  void *v11;
  SHSheetContentDataSource *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  char v18;
  _BOOL8 v19;
  SHSheetContentDataSourceChangeDetails *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  SHSheetContentDataSource *v33;
  __int16 v34;
  SHSheetContentDataSourceChangeDetails *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SHSheetContentDataSourceManager updateWithChangeRequest:].cold.1();

  objc_msgSend(v4, "state");
  v6 = objc_claimAutoreleasedReturnValue();
  -[SHSheetContentDataSourceManager currentState](self, "currentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContentDataSourceManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v6;
  if (v6 && (void *)v6 == v7)
  {
    v9 = 0;
  }
  else
  {
    -[SHSheetContentDataSourceManager _updateCurrentStateWithChangeRequest:](self, "_updateCurrentStateWithChangeRequest:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = [SHSheetContentDataSource alloc];
  -[SHSheetContentDataSourceManager currentState](self, "currentState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SHSheetContentDataSource initWithState:excludeSectionTypes:](v10, "initWithState:excludeSectionTypes:", v11, objc_msgSend(v4, "excludeSectionTypes"));

  -[SHSheetContentDataSource diffableSnapshot](v12, "diffableSnapshot");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "diffableSnapshot");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v13, "isEqual:", v14) ^ 1;

  -[SHSheetContentDataSourceManager currentState](self, "currentState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "nearbyCountSlotID");
  v17 = objc_msgSend(v7, "nearbyCountSlotID");

  if (-[SHSheetContentDataSource containsSectionForIdentifier:](v12, "containsSectionForIdentifier:", CFSTR("SHSheetContentPeopleSectionIdentifier")))
  {
    v18 = objc_msgSend(v8, "containsSectionForIdentifier:", CFSTR("SHSheetContentPeopleSectionIdentifier"));
  }
  else
  {
    v18 = 0;
  }
  v19 = v16 != v17;
  v20 = objc_alloc_init(SHSheetContentDataSourceChangeDetails);
  v30 = (void *)v9;
  -[SHSheetContentDataSourceChangeDetails setModifiedIdentifiers:](v20, "setModifiedIdentifiers:", v9);
  -[SHSheetContentDataSourceChangeDetails setAirDropBadgeChanged:](v20, "setAirDropBadgeChanged:", v19);
  -[SHSheetContentDataSourceChangeDetails setForceReload:](v20, "setForceReload:", objc_msgSend(v4, "forceReload"));
  -[SHSheetContentDataSourceChangeDetails setAnimateDifferences:](v20, "setAnimateDifferences:", objc_msgSend(v4, "animated"));
  -[SHSheetContentDataSource diffableSnapshot](v12, "diffableSnapshot");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "numberOfSections");
  objc_msgSend(v8, "diffableSnapshot");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContentDataSourceChangeDetails setSectionsChanged:](v20, "setSectionsChanged:", v22 != objc_msgSend(v23, "numberOfSections"));

  if ((v18 & 1) != 0)
  {
    -[SHSheetContentDataSource diffableSnapshot](v12, "diffableSnapshot");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "numberOfItemsInSection:", CFSTR("SHSheetContentPeopleSectionIdentifier"));
    objc_msgSend(v8, "diffableSnapshot");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetContentDataSourceChangeDetails setPeopleCountChanged:](v20, "setPeopleCountChanged:", v25 != objc_msgSend(v26, "numberOfItemsInSection:", CFSTR("SHSheetContentPeopleSectionIdentifier")));

  }
  else
  {
    -[SHSheetContentDataSourceChangeDetails setPeopleCountChanged:](v20, "setPeopleCountChanged:", 0);
  }
  -[SHSheetContentDataSourceChangeDetails setSnapshotChanged:](v20, "setSnapshotChanged:", v29);
  share_sheet_log();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v12;
    v34 = 2112;
    v35 = v20;
    _os_log_impl(&dword_19E419000, v27, OS_LOG_TYPE_DEFAULT, "publishing new dataSource:%@ for changeDetail:%@", buf, 0x16u);
  }

  -[SHSheetContentDataSourceManager setDataSource:](self, "setDataSource:", v12);
  -[SHSheetContentDataSourceManager delegate](self, "delegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dataSourceManager:didPublishDataSourceWithChangeDetails:", self, v20);

}

- (void)suggestLessPeopleProxyForIdentifier:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  -[SHSheetContentDataSourceManager suggestLessIdentifiers](self, "suggestLessIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v24);

  if ((v5 & 1) == 0)
  {
    -[SHSheetContentDataSourceManager suggestLessIdentifiers](self, "suggestLessIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v24);

    -[SHSheetContentDataSourceManager dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "peopleProxyForIdentifier:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[SHSheetContentDataSourceManager dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "peopleProxies");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    v21 = v10;
    objc_msgSend(v10, "removeObject:", v23);
    -[SHSheetContentDataSourceManager dataSource](self, "dataSource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "shareProxies");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetContentDataSourceManager dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "actionProxies");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetContentDataSourceManager dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "nearbyCountSlotID");
    -[SHSheetContentDataSourceManager dataSource](self, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "state");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activitiesByUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHSheetContentDataSourceChangeRequest changeRequestForPeopleProxies:shareProxies:actionProxies:nearbyCountSlotID:activitiesByUUID:](SHSheetContentDataSourceChangeRequest, "changeRequestForPeopleProxies:shareProxies:actionProxies:nearbyCountSlotID:activitiesByUUID:", v10, v11, v13, v15, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[SHSheetContentDataSourceManager dataSource](self, "dataSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setExcludeSectionTypes:", objc_msgSend(v20, "excludeSectionTypes"));

    objc_msgSend(v19, "setAnimated:", 1);
    -[SHSheetContentDataSourceManager updateWithChangeRequest:](self, "updateWithChangeRequest:", v19);

  }
}

- (NSArray)applicationActivityTypes
{
  return self->_applicationActivityTypes;
}

- (void)setApplicationActivityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)heroActionActivityTypes
{
  return self->_heroActionActivityTypes;
}

- (SHSheetContentDataSourceManagerDelegate)delegate
{
  return (SHSheetContentDataSourceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SHSheetContentDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (SHSheetContentDataSourceState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
  objc_storeStrong((id *)&self->_currentState, a3);
}

- (NSMutableSet)suggestLessIdentifiers
{
  return self->_suggestLessIdentifiers;
}

- (void)setSuggestLessIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_suggestLessIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestLessIdentifiers, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_heroActionActivityTypes, 0);
  objc_storeStrong((id *)&self->_applicationActivityTypes, 0);
}

- (void)_updateCurrentStateWithChangeRequest:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_19E419000, a3, OS_LOG_TYPE_DEBUG, "Update existing state:%@ with state:%@", v6, 0x16u);

}

- (void)updateWithChangeRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19E419000, v0, v1, "update with change request:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end

@implementation SHSheetContentDataSource

- (SHSheetContentDataSource)initWithState:(id)a3 excludeSectionTypes:(int64_t)a4
{
  id v7;
  SHSheetContentDataSource *v8;
  NSObject *v9;
  uint64_t v10;
  NSDiffableDataSourceSnapshot *diffableSnapshot;
  uint64_t v12;
  NSArray *peopleProxies;
  uint64_t v14;
  NSArray *shareProxies;
  uint64_t v16;
  NSArray *actionProxies;
  uint64_t v18;
  UIAirDropNode *airDropProxy;
  _UIUserDefaultsActivity *v20;
  _UIUserDefaultsActivity *shareUserDefaultsActivity;
  objc_super v23;

  v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SHSheetContentDataSource;
  v8 = -[SHSheetContentDataSource init](&v23, sel_init);
  if (v8)
  {
    share_sheet_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[SHSheetContentDataSource initWithState:excludeSectionTypes:].cold.1();

    objc_storeStrong((id *)&v8->_state, a3);
    v8->_excludeSectionTypes = a4;
    -[SHSheetContentDataSource _createDiffableSnapshotFromCurrentState](v8, "_createDiffableSnapshotFromCurrentState");
    v10 = objc_claimAutoreleasedReturnValue();
    diffableSnapshot = v8->_diffableSnapshot;
    v8->_diffableSnapshot = (NSDiffableDataSourceSnapshot *)v10;

    objc_msgSend(v7, "peopleProxies");
    v12 = objc_claimAutoreleasedReturnValue();
    peopleProxies = v8->_peopleProxies;
    v8->_peopleProxies = (NSArray *)v12;

    objc_msgSend(v7, "shareProxies");
    v14 = objc_claimAutoreleasedReturnValue();
    shareProxies = v8->_shareProxies;
    v8->_shareProxies = (NSArray *)v14;

    objc_msgSend(v7, "actionProxies");
    v16 = objc_claimAutoreleasedReturnValue();
    actionProxies = v8->_actionProxies;
    v8->_actionProxies = (NSArray *)v16;

    v8->_nearbyCountSlotID = objc_msgSend(v7, "nearbyCountSlotID");
    objc_msgSend(v7, "airDropProxy");
    v18 = objc_claimAutoreleasedReturnValue();
    airDropProxy = v8->_airDropProxy;
    v8->_airDropProxy = (UIAirDropNode *)v18;

    v20 = -[_UIUserDefaultsActivity initWithUserDefaults:activityCategory:]([_UIUserDefaultsActivity alloc], "initWithUserDefaults:activityCategory:", 0, 1);
    shareUserDefaultsActivity = v8->_shareUserDefaultsActivity;
    v8->_shareUserDefaultsActivity = v20;

  }
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SHSheetContentDataSource;
  -[SHSheetContentDataSource description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SHSheetContentSectionTypeDescription(-[SHSheetContentDataSource excludeSectionTypes](self, "excludeSectionTypes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ excludeSectionTypes:%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)containsSectionForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SHSheetContentDataSource diffableSnapshot](self, "diffableSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (id)peopleProxyForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SHSheetContentDataSource state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peopleProxyByUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)shareProxyForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SHSheetContentDataSource state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shareProxyByUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)actionProxyForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SHSheetContentDataSource state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionProxyByUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)activityForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  -[SHSheetContentDataSource state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activitiesByUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[SHSheetContentDataSource shareProxyForIdentifier:](self, "shareProxyForIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isUserDefaultsActivity"))
    {
      -[SHSheetContentDataSource shareUserDefaultsActivity](self, "shareUserDefaultsActivity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    share_sheet_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[SHSheetContentDataSource activityForIdentifier:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (id)identifierForActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[SHSheetContentDataSource state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activitiesByUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__SHSheetContentDataSource_identifierForActivity___block_invoke;
  v10[3] = &unk_1E4001458;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __50__SHSheetContentDataSource_identifierForActivity___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v8 = *(void **)(a1 + 32);
  v9 = a3;
  objc_msgSend(v8, "activityType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activityType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v10, "isEqual:", v11);
  if ((_DWORD)v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)createChangeRequestFromCurrentState
{
  void *v2;
  void *v3;

  -[SHSheetContentDataSource state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SHSheetContentDataSourceChangeRequest changeRequestFromState:](SHSheetContentDataSourceChangeRequest, "changeRequestFromState:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_createDiffableSnapshotFromCurrentState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  char v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
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
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  const __CFString *v71;
  const __CFString *v72;
  _BYTE v73[128];
  const __CFString *v74;
  void *v75;
  void *v76;
  _BYTE v77[128];
  const __CFString *v78;
  const __CFString *v79;
  const __CFString *v80;
  void *v81;
  _QWORD v82[3];

  v82[1] = *MEMORY[0x1E0C80C00];
  -[SHSheetContentDataSource state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "peopleIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSheetContentDataSource state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shareIdentifiers");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSheetContentDataSource state](self, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "heroActionIdentifiers");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSheetContentDataSource state](self, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "informationalActionIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSheetContentDataSource state](self, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "favoriteActionIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSheetContentDataSource state](self, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "systemActionIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSheetContentDataSource state](self, "state");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "extensionActionIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSheetContentDataSource state](self, "state");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "customActionIdentifiersByCustomSectionIdentifier");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSheetContentDataSource state](self, "state");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "customSectionIdentifiers");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSheetContentDataSource state](self, "state");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "actionProxies");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[SHSheetContentDataSource excludeSectionTypes](self, "excludeSectionTypes");
  v19 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  if ((v18 & 1) == 0)
  {
    v82[0] = CFSTR("SHSheetContentCustomViewSectionIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 1);
    v20 = v8;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendSectionsWithIdentifiers:", v21);

    +[SHSheetContentDataSourceManager contentCustomViewUniqueIdentifier](SHSheetContentDataSourceManager, "contentCustomViewUniqueIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v23, CFSTR("SHSheetContentCustomViewSectionIdentifier"));

    v8 = v20;
  }
  if ((v18 & 2) == 0 && objc_msgSend(v4, "count"))
  {
    v80 = CFSTR("SHSheetContentPeopleSectionIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
    v24 = v10;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendSectionsWithIdentifiers:", v25);

    -[SHSheetContentDataSource state](self, "state");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "peopleIdentifiers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v27, CFSTR("SHSheetContentPeopleSectionIdentifier"));

    v10 = v24;
  }
  if ((v18 & 4) == 0 && objc_msgSend(v61, "count"))
  {
    v79 = CFSTR("SHSheetContentAppsSectionIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendSectionsWithIdentifiers:", v28);

    objc_msgSend(v19, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v61, CFSTR("SHSheetContentAppsSectionIdentifier"));
  }
  if ((v18 & 8) == 0 && objc_msgSend(v59, "count"))
  {
    if ((v18 & 0x10) == 0 && objc_msgSend(v58, "count"))
    {
      v78 = CFSTR("SHSheetContentHeroActionsSectionIdentifier");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "appendSectionsWithIdentifiers:", v29);

      objc_msgSend(v19, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v58, CFSTR("SHSheetContentHeroActionsSectionIdentifier"));
    }
    v56 = v8;
    v57 = v4;
    v55 = v10;
    if (objc_msgSend(v8, "count"))
    {
      v53 = v14;
      v54 = v12;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v30 = v8;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v68;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v68 != v33)
              objc_enumerationMutation(v30);
            v35 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
            objc_msgSend(v35, "UUIDString", v53, v54);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(CFSTR("SHSheetContentInformationalActionsSectionIdentifier_"), "stringByAppendingString:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            v76 = v37;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "appendSectionsWithIdentifiers:", v38);

            v75 = v35;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v39, v37);

          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
        }
        while (v32);
      }

      v8 = v56;
      v4 = v57;
      v12 = v54;
      v10 = v55;
      v14 = v53;
    }
    if (objc_msgSend(v10, "count", v53, v54))
    {
      v74 = CFSTR("SHSheetContentFavoriteActionsSectionIdentifier");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "appendSectionsWithIdentifiers:", v40);

      objc_msgSend(v19, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v10, CFSTR("SHSheetContentFavoriteActionsSectionIdentifier"));
    }
    if (objc_msgSend(v60, "count"))
    {
      objc_msgSend(v60, "array");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "appendSectionsWithIdentifiers:", v41);

      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v42 = v60;
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v64;
        do
        {
          for (j = 0; j != v44; ++j)
          {
            if (*(_QWORD *)v64 != v45)
              objc_enumerationMutation(v42);
            v47 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j);
            objc_msgSend(v62, "objectForKeyedSubscript:", v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v48, v47);

          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
        }
        while (v44);
      }

      v10 = v55;
      v8 = v56;
      v4 = v57;
    }
    if (objc_msgSend(v12, "count"))
    {
      v72 = CFSTR("SHSheetContentSystemActionsSectionIdentifier");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "appendSectionsWithIdentifiers:", v49);

      objc_msgSend(v19, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v12, CFSTR("SHSheetContentSystemActionsSectionIdentifier"));
    }
    if (objc_msgSend(v14, "count"))
    {
      v71 = CFSTR("SHSheetContentExtensionActionsSectionIdentifier");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "appendSectionsWithIdentifiers:", v50);

      objc_msgSend(v19, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v14, CFSTR("SHSheetContentExtensionActionsSectionIdentifier"));
    }
  }
  share_sheet_log();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    -[SHSheetContentDataSource _createDiffableSnapshotFromCurrentState].cold.1();

  return v19;
}

- (void)logCurrentState
{
  id v2;

  -[SHSheetContentDataSource state](self, "state");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logDiagnosticProperties");

}

- (NSDiffableDataSourceSnapshot)diffableSnapshot
{
  return self->_diffableSnapshot;
}

- (NSArray)peopleProxies
{
  return self->_peopleProxies;
}

- (NSArray)shareProxies
{
  return self->_shareProxies;
}

- (NSArray)actionProxies
{
  return self->_actionProxies;
}

- (unsigned)nearbyCountSlotID
{
  return self->_nearbyCountSlotID;
}

- (UIAirDropNode)airDropProxy
{
  return self->_airDropProxy;
}

- (SHSheetContentDataSourceState)state
{
  return self->_state;
}

- (int64_t)excludeSectionTypes
{
  return self->_excludeSectionTypes;
}

- (_UIUserDefaultsActivity)shareUserDefaultsActivity
{
  return self->_shareUserDefaultsActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareUserDefaultsActivity, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_airDropProxy, 0);
  objc_storeStrong((id *)&self->_actionProxies, 0);
  objc_storeStrong((id *)&self->_shareProxies, 0);
  objc_storeStrong((id *)&self->_peopleProxies, 0);
  objc_storeStrong((id *)&self->_diffableSnapshot, 0);
}

- (void)initWithState:excludeSectionTypes:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19E419000, v0, v1, "Initializing new data source for state:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)activityForIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19E419000, v0, v1, "skipping activity that is not a real UIActivity object:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_createDiffableSnapshotFromCurrentState
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19E419000, v0, v1, "Create new diffable data source snapshot:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end

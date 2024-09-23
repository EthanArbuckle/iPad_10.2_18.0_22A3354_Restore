@implementation PKGroupsController

- (int64_t)expiredSectionPassesCount
{
  return -[NSArray count](self->_expiredSectionPasses, "count");
}

- (BOOL)shouldSeparatePaymentPasses
{
  return self->_shouldSeparatePaymentPasses;
}

- (unint64_t)indexOfGroup:(id)a3
{
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKGroupsController _indexOfGroupID:]((uint64_t)self, (uint64_t)v4);

  return v5;
}

- (uint64_t)_indexOfGroupID:(uint64_t)a1
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 64), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (unint64_t)indexOfSeparationGroup
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  if (!self->_shouldSeparatePaymentPasses)
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = -[NSMutableArray count](self->_groups, "count");
  if (!v3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v4 = v3;
  v5 = 0;
  while (1)
  {
    -[PKGroupsController groupAtIndex:](self, "groupAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "passAtIndex:", objc_msgSend(v6, "frontmostPassIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "passType");
    v9 = objc_msgSend(v7, "style");

    if (!v7 || v8 != 1 || v9 != 6)
      break;
    if (v4 == ++v5)
    {
      v5 = v4;
      break;
    }
  }
  if (v5)
    return v5 - 1;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)groupAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_groups, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

uint64_t __92__PKGroupsController__displayablePassesDictionaryFromPasses_withCatalog_andPassAnnotations___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_placeGroup:(unint64_t)a3 atIndex:(uint64_t)a4 notify:
{
  uint64_t v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(a1[6], "count") <= a3)
    a3 = objc_msgSend(a1[6], "count");
  v7 = objc_msgSend(a1, "indexOfGroup:", v8);
  if (v7 != a3)
  {
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      -[PKGroupsController _insertGroup:atIndex:notify:]((uint64_t)a1, v8, a3, a4);
    else
      objc_msgSend(a1, "_moveGroup:fromIndex:toIndex:notify:", v8, v7, a3, a4);
  }

}

- (void)_insertGroup:(unint64_t)a3 atIndex:(int)a4 notify:
{
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;

  v10 = a2;
  if (a1)
  {
    v7 = *(void **)(a1 + 56);
    objc_msgSend(v10, "groupID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v10, v8);

    objc_msgSend(*(id *)(a1 + 48), "insertObject:atIndex:", v10, a3);
    -[PKGroupsController _fixIndicesFrom:]((void *)a1, a3);
    if (a4)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 176));
      objc_msgSend(WeakRetained, "groupsController:didInsertGroup:atIndex:", a1, v10, a3);

    }
  }

}

- (unint64_t)_fixIndicesFrom:(void *)a1
{
  unint64_t result;

  for (result = objc_msgSend(a1, "groupCount"); a2 < result; result = objc_msgSend(a1, "groupCount"))
    -[PKGroupsController _fixIndex:]((uint64_t)a1, a2++);
  return result;
}

- (unint64_t)groupCount
{
  return -[NSMutableArray count](self->_groups, "count");
}

- (void)_fixIndex:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "groupID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
}

- (PKGroupsController)init
{
  void *v3;
  PKGroupsController *v4;

  +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKGroupsController initWithPassLibrary:](self, "initWithPassLibrary:", v3);

  return v4;
}

- (PKGroupsController)initWithPassLibrary:(id)a3
{
  id v5;
  PKGroupsController *v6;
  PKGroupsController *v7;
  PKPaymentService *v8;
  PKPaymentService *paymentService;
  NSMutableArray *v10;
  NSMutableArray *groups;
  NSMutableDictionary *v12;
  NSMutableDictionary *groupsByGroupID;
  NSMutableDictionary *v14;
  NSMutableDictionary *indicesByGroupID;
  NSMutableDictionary *v16;
  NSMutableDictionary *groupIDsByPassUniqueID;
  NSMutableDictionary *v18;
  NSMutableDictionary *groupIDsByExpiredPassUniqueID;
  NSMutableArray *v20;
  NSMutableArray *enqueuedUpdates;
  uint64_t v22;
  PKAccountService *accountService;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKGroupsController;
  v6 = -[PKGroupsController init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_passLibrary, a3);
    -[PKPassLibrary addDelegate:](v7->_passLibrary, "addDelegate:", v7);
    v8 = objc_alloc_init(PKPaymentService);
    paymentService = v7->_paymentService;
    v7->_paymentService = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    groups = v7->_groups;
    v7->_groups = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    groupsByGroupID = v7->_groupsByGroupID;
    v7->_groupsByGroupID = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    indicesByGroupID = v7->_indicesByGroupID;
    v7->_indicesByGroupID = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    groupIDsByPassUniqueID = v7->_groupIDsByPassUniqueID;
    v7->_groupIDsByPassUniqueID = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    groupIDsByExpiredPassUniqueID = v7->_groupIDsByExpiredPassUniqueID;
    v7->_groupIDsByExpiredPassUniqueID = v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    enqueuedUpdates = v7->_enqueuedUpdates;
    v7->_enqueuedUpdates = v20;

    v7->_reorderingEnabled = 1;
    v7->_expressPassesInformationToken = -1;
    PKObservePassSettingsChanged(v7, (uint64_t)sel_objectSettingsDidChangeNotification_, 0);
    +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
    v22 = objc_claimAutoreleasedReturnValue();
    accountService = v7->_accountService;
    v7->_accountService = (PKAccountService *)v22;

    -[PKAccountService registerObserver:](v7->_accountService, "registerObserver:", v7);
  }

  return v7;
}

- (void)setShouldSeparatePaymentPasses:(BOOL)a3
{
  self->_shouldSeparatePaymentPasses = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)loadGroupsSynchronously
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  -[PKGroupsController snapshotFetchOptions]((uint64_t)self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__PKGroupsController_loadGroupsSynchronously__block_invoke;
  v6[3] = &unk_1E2ADB440;
  v6[4] = self;
  v4 = v3;
  v7 = v4;
  v5 = v4;
  if (self)
  {
    -[PKPassLibrary getGroupsControllerSnapshotWithOptions:synchronously:handler:](self->_passLibrary, "getGroupsControllerSnapshotWithOptions:synchronously:handler:", v4, 1, v6);
    v5 = v7;
  }

}

- (PKGroupsControllerSnapshotFetchOptions)snapshotFetchOptions
{
  PKGroupsControllerSnapshotFetchOptions *v2;

  if (a1)
  {
    v2 = objc_alloc_init(PKGroupsControllerSnapshotFetchOptions);
    -[PKGroupsControllerSnapshotFetchOptions setLimitResults:](v2, "setLimitResults:", *(unsigned __int8 *)(a1 + 128));
    -[PKGroupsControllerSnapshotFetchOptions setIncludeAnnotations:](v2, "setIncludeAnnotations:", PKExpiredPassesRefreshEnabled());
    -[PKGroupsControllerSnapshotFetchOptions setAllowedPassType:](v2, "setAllowedPassType:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)processFetchedSnapshot:(void *)a3 withOptions:(int)a4 synchronously:(unsigned int)a5 notify:(void *)a6 completion:
{
  id v11;
  id v12;
  void (**v13)(_QWORD);
  _QWORD block[5];
  id v15;
  id v16;
  void (**v17)(_QWORD);
  char v18;

  v11 = a2;
  v12 = a3;
  v13 = a6;
  if (a1)
  {
    if (a4)
    {
      -[PKGroupsController updateStateWithSnapshot:options:notify:](a1, v11, a5);
      if (v13)
        v13[2](v13);
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __89__PKGroupsController_processFetchedSnapshot_withOptions_synchronously_notify_completion___block_invoke;
      block[3] = &unk_1E2ADB490;
      block[4] = a1;
      v15 = v11;
      v16 = v12;
      v18 = a5;
      v17 = v13;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }

}

- (void)updateStateWithSnapshot:(uint64_t)a1 options:(void *)a2 notify:(unsigned int)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a1)
  {
    v5 = a2;
    objc_msgSend(v5, "catalog");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "states");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "annotations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accounts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKGroupsController _updateStateWithCatalog:passes:states:annotations:accounts:notify:](a1, v10, v6, v7, v8, v9, a3);
  }
}

void __45__PKGroupsController_loadGroupsSynchronously__block_invoke(uint64_t a1, void *a2)
{
  -[PKGroupsController processFetchedSnapshot:withOptions:synchronously:notify:completion:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40), 1, 0, 0);
}

- (id)passes
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_groups;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "passes", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (PKGroupsController)initWithPassTypeMask:(unint64_t)a3 passFilters:(unint64_t)a4 allowedPassUniqueIDs:(id)a5
{
  id v9;
  PKGroupsController *v10;
  PKGroupsController *v11;
  unint64_t v12;
  BOOL v13;
  uint64_t v14;
  NSSet *expressPassConfigurations;
  const char *v16;
  NSObject *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id location;

  v9 = a5;
  v10 = -[PKGroupsController init](self, "init");
  v11 = v10;
  if (v10)
  {
    if (a3 == -1)
      v12 = 0;
    else
      v12 = a3;
    v10->_passTypeMask = v12;
    if (v12)
      v13 = 0;
    else
      v13 = v10->_filters == 0;
    v10->_reorderingEnabled = v13;
    v10->_filters = a4;
    objc_storeStrong((id *)&v10->_allowedPassUniqueIDs, a5);
    if ((v11->_filters & 0x10) != 0)
    {
      -[PKPaymentService expressPassConfigurations](v11->_paymentService, "expressPassConfigurations");
      v14 = objc_claimAutoreleasedReturnValue();
      expressPassConfigurations = v11->_expressPassConfigurations;
      v11->_expressPassConfigurations = (NSSet *)v14;

      objc_initWeak(&location, v11);
      v16 = (const char *)objc_msgSend(CFSTR("com.apple.passkit.expresspassesinformation.changed"), "UTF8String");
      v17 = MEMORY[0x1E0C80D38];
      v18 = MEMORY[0x1E0C80D38];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __76__PKGroupsController_initWithPassTypeMask_passFilters_allowedPassUniqueIDs___block_invoke;
      v20[3] = &unk_1E2ACA448;
      objc_copyWeak(&v21, &location);
      notify_register_dispatch(v16, &v11->_expressPassesInformationToken, v17, v20);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }

  return v11;
}

void __76__PKGroupsController_initWithPassTypeMask_passFilters_allowedPassUniqueIDs___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v2;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[2], "expressPassConfigurations");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = v4[15];
    v4[15] = (id)v2;

    objc_msgSend(v4, "reloadGroups");
    WeakRetained = v4;
  }

}

- (id)initLimited
{
  id result;

  result = -[PKGroupsController init](self, "init");
  if (result)
  {
    *((_BYTE *)result + 144) = 0;
    *((_BYTE *)result + 128) = 1;
  }
  return result;
}

- (void)dealloc
{
  int expressPassesInformationToken;
  objc_super v4;

  PKUnregisterPassSettingsChangedObserver(self, 0);
  -[PKPassLibrary removeDelegate:](self->_passLibrary, "removeDelegate:", self);
  -[PKAccountService unregisterObserver:](self->_accountService, "unregisterObserver:", self);
  expressPassesInformationToken = self->_expressPassesInformationToken;
  if (expressPassesInformationToken != -1)
    notify_cancel(expressPassesInformationToken);
  v4.receiver = self;
  v4.super_class = (Class)PKGroupsController;
  -[PKGroupsController dealloc](&v4, sel_dealloc);
}

- (void)loadGroupsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  -[PKGroupsController snapshotFetchOptions]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__PKGroupsController_loadGroupsWithCompletion___block_invoke;
  v9[3] = &unk_1E2ADB418;
  v9[4] = self;
  v6 = v5;
  v10 = v6;
  v7 = v4;
  v11 = v7;
  v8 = v7;
  if (self)
  {
    -[PKPassLibrary getGroupsControllerSnapshotWithOptions:synchronously:handler:](self->_passLibrary, "getGroupsControllerSnapshotWithOptions:synchronously:handler:", v6, 0, v9);
    v8 = v11;
  }

}

void __47__PKGroupsController_loadGroupsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  -[PKGroupsController processFetchedSnapshot:withOptions:synchronously:notify:completion:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40), 0, 0, *(void **)(a1 + 48));
}

- (void)reloadGroups
{
  -[PKGroupsController reloadGroupsWithCompletion:](self, "reloadGroupsWithCompletion:", 0);
}

- (void)reloadGroupsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  PKPassLibrary *passLibrary;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;

  v4 = a3;
  if (self)
  {
    -[PKGroupsController snapshotFetchOptions]((uint64_t)self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__PKGroupsController_reloadGroupsAndNotify_completion___block_invoke;
    v8[3] = &unk_1E2ADB468;
    v8[4] = self;
    v9 = v5;
    v11 = 1;
    v10 = v4;
    passLibrary = self->_passLibrary;
    v7 = v5;
    -[PKPassLibrary getGroupsControllerSnapshotWithOptions:synchronously:handler:](passLibrary, "getGroupsControllerSnapshotWithOptions:synchronously:handler:", v7, 0, v8);

  }
}

void __55__PKGroupsController_reloadGroupsAndNotify_completion___block_invoke(uint64_t a1, void *a2)
{
  -[PKGroupsController processFetchedSnapshot:withOptions:synchronously:notify:completion:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 56), *(void **)(a1 + 48));
}

uint64_t __89__PKGroupsController_processFetchedSnapshot_withOptions_synchronously_notify_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  -[PKGroupsController updateStateWithSnapshot:options:notify:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateStateWithCatalog:(void *)a3 passes:(void *)a4 states:(void *)a5 annotations:(void *)a6 accounts:(unsigned int)a7 notify:
{
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id WeakRetained;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  int refreshed;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  char v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  unint64_t v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  BOOL v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t k;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t m;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t n;
  uint64_t v87;
  void *v88;
  id v89;
  void *v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t ii;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  char v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t kk;
  void *v107;
  uint64_t v108;
  id v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t nn;
  void *v117;
  uint64_t v118;
  void *v119;
  id v120;
  uint64_t v121;
  void *v122;
  char v123;
  void *v124;
  BOOL v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t i2;
  void *v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t mm;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  id v138;
  uint64_t i1;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  uint64_t i3;
  void *v145;
  uint64_t v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t i4;
  void *v151;
  BOOL v152;
  id v153;
  id v154;
  _QWORD *v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t i5;
  uint64_t v160;
  void *v161;
  void *v162;
  id v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t i6;
  id v167;
  void *v168;
  void *v169;
  void *v170;
  id v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t i7;
  void *v175;
  unint64_t v176;
  unint64_t v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  _BOOL4 v182;
  id v183;
  id v184;
  unint64_t v185;
  unint64_t v186;
  unint64_t v187;
  void *v188;
  void *v189;
  void *v190;
  _BOOL4 v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  id v198;
  void *context;
  id v200;
  id v201;
  id v202;
  void *v203;
  id obj;
  id v205;
  uint64_t v206;
  id v207;
  id v208;
  id v209;
  uint64_t v210;
  id v211;
  id v212;
  id v213;
  void *v214;
  uint64_t jj;
  void *v216;
  void *v217;
  id v218;
  id v219;
  id v220;
  id v221;
  void *v222;
  id v223;
  uint64_t v224;
  id v225;
  uint64_t v226;
  uint64_t v227;
  void *v229;
  uint64_t v230;
  void *v231;
  id v232;
  void *v233;
  id v234;
  void *v235;
  id v236;
  id v237;
  void *v238;
  void *v239;
  void *v240;
  id v241;
  uint64_t v242;
  void *v243;
  unint64_t v244;
  void *v245;
  uint64_t v246;
  uint64_t v247;
  unint64_t v248;
  id v249;
  id v250;
  uint64_t v251;
  id v252;
  void *v253;
  void *v254;
  void *v255;
  id v256;
  void **v257;
  void *v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  _QWORD v263[2];
  void (*v264)(uint64_t, void *);
  void *v265;
  id v266;
  uint64_t v267;
  id v268;
  id v269;
  uint64_t *v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  _QWORD v291[4];
  id v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  _BYTE v305[128];
  _BYTE v306[128];
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  void *v326;
  id v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  _BYTE v332[128];
  uint64_t v333;

  v333 = *MEMORY[0x1E0C80C00];
  v205 = a2;
  v202 = a3;
  v200 = a4;
  v12 = a5;
  v201 = a6;
  if (a1)
  {
    v198 = v12;
    context = (void *)MEMORY[0x19400CFE8]();
    v227 = a1;
    if (v12)
    {
      v13 = v202;
      v232 = v205;
      v14 = v12;
      v245 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v13, "count"));
      v249 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v241 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (*(_QWORD *)(a1 + 24)
        && (v15 = objc_loadWeakRetained((id *)(a1 + 176)),
            v16 = objc_opt_respondsToSelector(),
            v15,
            (v16 & 1) != 0))
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 176));
        objc_msgSend(WeakRetained, "groupsControllerShouldExcludePassesWithUniqueIDsFromFiltering:", a1);
        v254 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v254 = 0;
      }
      _FindAllowedPassUniqueIDs(v232, *(void **)(a1 + 40));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v331 = 0u;
      v330 = 0u;
      v329 = 0u;
      v328 = 0u;
      v19 = v13;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v328, v332, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v329;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v329 != v21)
              objc_enumerationMutation(v19);
            v23 = *(void **)(*((_QWORD *)&v328 + 1) + 8 * i);
            objc_msgSend(v23, "uniqueID", v198, context, v200, v201);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = *(_QWORD *)(v227 + 32);
            if (!v26 || ((v26 >> objc_msgSend(v23, "passType")) & 1) != 0)
            {
              if ((!v18 || objc_msgSend(v18, "containsObject:", v24))
                && ((objc_msgSend(v254, "containsObject:", v24) & 1) != 0
                 || _PassMeetsFilterRequirements(v23, *(_QWORD *)(v227 + 24), *(void **)(v227 + 120))))
              {
                if (PKExpiredPassesRefreshEnabled() && v25 && objc_msgSend(v25, "sortingState") == 1)
                {
                  objc_msgSend(*(id *)(v227 + 80), "objectForKey:", v24);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = v27 == 0;

                  if (v28)
                  {
                    objc_msgSend(*(id *)(v227 + 72), "objectForKey:", v24);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v29)
                    {
                      objc_msgSend(*(id *)(v227 + 80), "setObject:forKey:", v29, v24);
                    }
                    else
                    {
                      objc_msgSend(v232, "groups");
                      v238 = (void *)objc_claimAutoreleasedReturnValue();
                      v323 = MEMORY[0x1E0C809B0];
                      v324 = 3221225472;
                      v325 = (uint64_t)__92__PKGroupsController__displayablePassesDictionaryFromPasses_withCatalog_andPassAnnotations___block_invoke;
                      v326 = &unk_1E2ADB508;
                      v234 = v24;
                      v327 = v234;
                      objc_msgSend(v238, "pk_firstObjectPassingTest:", &v323);
                      v236 = (id)objc_claimAutoreleasedReturnValue();

                      v32 = v236;
                      if (v236)
                      {
                        v239 = *(void **)(v227 + 80);
                        objc_msgSend(v236, "groupID");
                        v33 = objc_claimAutoreleasedReturnValue();
                        v34 = v239;
                        v240 = (void *)v33;
                        objc_msgSend(v34, "setObject:forKey:", v33, v234);

                        v32 = v236;
                      }

                    }
                  }
                  objc_msgSend(v249, "addObject:", v24);
                  objc_msgSend(v241, "addObject:", v23);
                }
                else
                {
                  objc_msgSend(v245, "setObject:forKey:", v23, v24);
                }
              }
              else
              {
                objc_msgSend(v249, "addObject:", v24);
                refreshed = PKExpiredPassesRefreshEnabled();
                if (v25)
                  v31 = refreshed;
                else
                  v31 = 0;
                if (v31 == 1 && objc_msgSend(v25, "sortingState") == 1)
                  objc_msgSend(v241, "addObject:", v23);
              }
            }

          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v328, v332, 16);
        }
        while (v20);
      }

      v35 = *(void **)(v227 + 152);
      *(_QWORD *)(v227 + 152) = v249;
      v36 = v249;

      v37 = *(void **)(v227 + 160);
      *(_QWORD *)(v227 + 160) = v241;
      v38 = v241;

      v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v14);
      v40 = *(void **)(v227 + 168);
      *(_QWORD *)(v227 + 168) = v39;

      v41 = *(void **)(v227 + 112);
      *(_QWORD *)&v319 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v319 + 1) = 3221225472;
      *(_QWORD *)&v320 = __92__PKGroupsController__displayablePassesDictionaryFromPasses_withCatalog_andPassAnnotations___block_invoke_2;
      *((_QWORD *)&v320 + 1) = &unk_1E2ADB4E0;
      *(_QWORD *)&v321 = v245;
      v42 = v245;
      objc_msgSend(v41, "enumerateObjectsUsingBlock:", &v319);
      v43 = (void *)objc_msgSend(v42, "copy");

    }
    else
    {
      v44 = v202;
      v250 = v205;
      v255 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v44, "count"));
      v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (*(_QWORD *)(a1 + 24)
        && (v46 = objc_loadWeakRetained((id *)(a1 + 176)),
            v47 = objc_opt_respondsToSelector(),
            v46,
            (v47 & 1) != 0))
      {
        v48 = objc_loadWeakRetained((id *)(a1 + 176));
        objc_msgSend(v48, "groupsControllerShouldExcludePassesWithUniqueIDsFromFiltering:", a1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v49 = 0;
      }
      _FindAllowedPassUniqueIDs(v250, *(void **)(a1 + 40));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v331 = 0u;
      v330 = 0u;
      v329 = 0u;
      v328 = 0u;
      v51 = v44;
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v328, v332, 16);
      if (v52)
      {
        v53 = *(_QWORD *)v329;
        do
        {
          for (j = 0; j != v52; ++j)
          {
            if (*(_QWORD *)v329 != v53)
              objc_enumerationMutation(v51);
            v55 = *(void **)(*((_QWORD *)&v328 + 1) + 8 * j);
            v56 = *(_QWORD *)(v227 + 32);
            if (!v56 || ((v56 >> objc_msgSend(*(id *)(*((_QWORD *)&v328 + 1) + 8 * j), "passType")) & 1) != 0)
            {
              objc_msgSend(v55, "uniqueID");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              if ((!v50 || objc_msgSend(v50, "containsObject:", v57))
                && ((objc_msgSend(v49, "containsObject:", v57, v198, context, v200, v201) & 1) != 0
                 || _PassMeetsFilterRequirements(v55, *(_QWORD *)(v227 + 24), *(void **)(v227 + 120))))
              {
                objc_msgSend(v255, "setObject:forKey:", v55, v57);
              }
              else
              {
                objc_msgSend(v45, "addObject:", v57, v198);
              }

            }
          }
          v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v328, v332, 16);
        }
        while (v52);
      }

      v58 = *(void **)(v227 + 152);
      *(_QWORD *)(v227 + 152) = v45;
      v59 = v45;

      v60 = *(void **)(v227 + 112);
      v323 = MEMORY[0x1E0C809B0];
      v324 = 3221225472;
      v325 = (uint64_t)__70__PKGroupsController__displayablePassesDictionaryFromSet_withCatalog___block_invoke;
      v326 = &unk_1E2ADB4E0;
      v327 = v255;
      v61 = v255;
      objc_msgSend(v60, "enumerateObjectsUsingBlock:", &v323);
      v43 = (void *)objc_msgSend(v61, "copy");

    }
    v256 = v43;
    objc_msgSend(v205, "groups");
    v318 = 0u;
    v317 = 0u;
    v316 = 0u;
    v315 = 0u;
    v62 = (id)objc_claimAutoreleasedReturnValue();
    v246 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v315, &v328, 16);
    if (v246)
    {
      v63 = 0;
      v242 = *(_QWORD *)v316;
      while (2)
      {
        v64 = 0;
        v251 = v63;
        v63 += v246;
        do
        {
          if (*(_QWORD *)v316 != v242)
            objc_enumerationMutation(v62);
          v65 = *(void **)(*((_QWORD *)&v315 + 1) + 8 * v64);
          objc_msgSend(v65, "groupID", v198);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v227 + 56), "objectForKeyedSubscript:", v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v67;
          if (v67)
          {
            if (objc_msgSend(v67, "passCount"))
            {
              objc_msgSend(v68, "passAtIndex:", 0);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = objc_msgSend(v69, "style") == 6;

              if (!v70)
              {
                v197 = v68;
LABEL_84:

                v63 = v251;
                goto LABEL_86;
              }
            }
          }
          else
          {
            v314 = 0u;
            v313 = 0u;
            v312 = 0u;
            v311 = 0u;
            objc_msgSend(v65, "uniqueIDs");
            v197 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v197, "countByEnumeratingWithState:objects:count:", &v311, &v323, 16);
            if (v71)
            {
              v72 = *(_QWORD *)v312;
              while (2)
              {
                for (k = 0; k != v71; ++k)
                {
                  if (*(_QWORD *)v312 != v72)
                    objc_enumerationMutation(v197);
                  objc_msgSend(v256, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v311 + 1) + 8 * k));
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  v75 = v74;
                  if (v74 && objc_msgSend(v74, "style") != 6)
                  {

                    goto LABEL_84;
                  }

                }
                v71 = objc_msgSend(v197, "countByEnumeratingWithState:objects:count:", &v311, &v323, 16);
                if (v71)
                  continue;
                break;
              }
            }

          }
          ++v251;
          ++v64;
        }
        while (v64 != v246);
        v246 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v315, &v328, 16);
        if (v246)
          continue;
        break;
      }
    }
    else
    {
      v63 = 0;
    }
LABEL_86:

    v310 = 0u;
    v309 = 0u;
    v308 = 0u;
    v307 = 0u;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v322 = 0u;
    v321 = 0u;
    v320 = 0u;
    v319 = 0u;
    v77 = *(id *)(v227 + 48);
    v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v319, v332, 16);
    if (v78)
    {
      v79 = *(_QWORD *)v320;
      do
      {
        for (m = 0; m != v78; ++m)
        {
          if (*(_QWORD *)v320 != v79)
            objc_enumerationMutation(v77);
          v81 = *(void **)(*((_QWORD *)&v319 + 1) + 8 * m);
          if (objc_msgSend(v81, "passCount", v198))
          {
            objc_msgSend(v81, "passAtIndex:", 0);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = v82;
            if (v82 && objc_msgSend(v82, "passType") != 1)
              objc_msgSend(v76, "addObject:", v81);
          }
          else
          {
            v83 = 0;
          }

        }
        v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v319, v332, 16);
      }
      while (v78);
    }

    v84 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v307, v332, 16);
    if (v84)
    {
      v85 = *(_QWORD *)v308;
      do
      {
        for (n = 0; n != v84; ++n)
        {
          if (*(_QWORD *)v308 != v85)
            objc_enumerationMutation(v76);
          v87 = *(_QWORD *)(*((_QWORD *)&v307 + 1) + 8 * n);
          if (v87 && *(_BYTE *)(v87 + 56))
          {
            v88 = (void *)objc_msgSend(*(id *)(v87 + 24), "copy");
            if (v63 + n >= (unint64_t)objc_msgSend(v62, "count"))
              objc_msgSend(v62, "addObject:", v88);
            else
              objc_msgSend(v62, "insertObject:atIndex:", v88);

          }
        }
        v84 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v307, v332, 16);
        v63 += n;
      }
      while (v84);
    }

    v207 = v205;
    v211 = v256;
    v208 = v200;
    v209 = v201;
    v212 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v89 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(v227 + 72), "allKeys");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v203 = (void *)objc_msgSend(v89, "initWithArray:", v90);

    v219 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v275 = 0u;
    v276 = 0u;
    v277 = 0u;
    v278 = 0u;
    v91 = *(id *)(v227 + 160);
    v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v275, &v307, 16);
    if (v92)
    {
      v93 = *(_QWORD *)v276;
      do
      {
        for (ii = 0; ii != v92; ++ii)
        {
          if (*(_QWORD *)v276 != v93)
            objc_enumerationMutation(v91);
          objc_msgSend(*(id *)(*((_QWORD *)&v275 + 1) + 8 * ii), "uniqueID", v198);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v219, "addObject:", v95);

        }
        v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v275, &v307, 16);
      }
      while (v92);
    }

    objc_msgSend(v207, "groups");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = (void *)objc_msgSend(v96, "copy");

    v273 = 0u;
    v274 = 0u;
    v271 = 0u;
    v272 = 0u;
    obj = v97;
    v210 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v271, v306, 16);
    if (v210)
    {
      v206 = *(_QWORD *)v272;
      do
      {
        for (jj = 0; jj != v210; ++jj)
        {
          if (*(_QWORD *)v272 != v206)
            objc_enumerationMutation(obj);
          v214 = *(void **)(*((_QWORD *)&v271 + 1) + 8 * jj);
          objc_msgSend(v214, "groupID", v198);
          v216 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v227 + 56), "objectForKey:", v216);
          v257 = (void **)objc_claimAutoreleasedReturnValue();
          if (!v257)
          {
            v257 = -[PKGroup initWithCatalogGroup:passes:states:accounts:]((id *)[PKGroup alloc], v214, v211, v208, v209);
            objc_msgSend(v212, "setObject:forKey:", v257, v216);
            goto LABEL_245;
          }
          v213 = v214;
          v221 = v211;
          v220 = v208;
          v218 = v209;
          v225 = v219;
          v98 = objc_alloc(MEMORY[0x1E0C99E20]);
          objc_msgSend(v257[4], "allKeys");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v222 = (void *)objc_msgSend(v98, "initWithArray:", v99);

          objc_msgSend(v213, "uniqueIDs");
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          v299 = 0u;
          v300 = 0u;
          v297 = 0u;
          v298 = 0u;
          v223 = (id)objc_msgSend(v217, "copy");
          v226 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v297, &v328, 16);
          if (!v226)
            goto LABEL_236;
          v247 = 0;
          v224 = *(_QWORD *)v298;
          do
          {
            v230 = 0;
            do
            {
              if (*(_QWORD *)v298 != v224)
                objc_enumerationMutation(v223);
              v235 = *(void **)(*((_QWORD *)&v297 + 1) + 8 * v230);
              if ((objc_msgSend(v225, "containsObject:") & 1) == 0)
              {
                objc_msgSend(v222, "removeObject:", v235);
                objc_msgSend(v257[4], "objectForKey:", v235);
                v233 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v221, "objectForKey:", v235);
                v229 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v220, "objectForKey:", v235);
                v231 = (void *)objc_claimAutoreleasedReturnValue();
                if (v233)
                {
                  if (v229)
                  {
                    v100 = v229;
                    v252 = v231;
                    v243 = v100;
                    objc_msgSend(v100, "uniqueID");
                    v101 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v257[4], "objectForKey:", v101);
                    v237 = (id)objc_claimAutoreleasedReturnValue();
                    v102 = objc_msgSend(v237, "isEqualToPassIncludingMetadata:", v100);
                    if ((v102 & 1) == 0)
                      objc_msgSend(v257[4], "setObject:forKeyedSubscript:", v100, v101);
                    objc_msgSend(v257[5], "setObject:forKeyedSubscript:", v252, v101);
                    if (a7)
                    {
                      -[PKGroup observers]((uint64_t)v257);
                      v103 = (void *)objc_claimAutoreleasedReturnValue();
                      v303 = 0u;
                      v304 = 0u;
                      v301 = 0u;
                      v302 = 0u;
                      v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v301, v332, 16);
                      if (v104)
                      {
                        v105 = *(_QWORD *)v302;
                        do
                        {
                          for (kk = 0; kk != v104; ++kk)
                          {
                            if (*(_QWORD *)v302 != v105)
                              objc_enumerationMutation(v103);
                            v107 = *(void **)(*((_QWORD *)&v301 + 1) + 8 * kk);
                            v108 = -[PKGroup _indexOfUniqueID:](v257[3], v101);
                            if ((v102 & 1) != 0)
                            {
                              if ((objc_opt_respondsToSelector() & 1) != 0)
                                objc_msgSend(v107, "group:didUpdatePassState:forPass:atIndex:", v257, v252, v237, v108);
                            }
                            else if ((objc_opt_respondsToSelector() & 1) != 0)
                            {
                              objc_msgSend(v107, "group:didUpdatePass:withState:atIndex:", v257, v243, v252, v108);
                            }
                            else if ((objc_opt_respondsToSelector() & 1) != 0)
                            {
                              objc_msgSend(v107, "group:didUpdatePass:atIndex:", v257, v243, v108);
                            }
                          }
                          v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v301, v332, 16);
                        }
                        while (v104);
                      }

                    }
                  }
                  else if (v231)
                  {
                    objc_msgSend(v257[5], "setObject:forKeyedSubscript:", v231, v235);
                    if (a7)
                    {
                      -[PKGroup observers]((uint64_t)v257);
                      v131 = (void *)objc_claimAutoreleasedReturnValue();
                      v295 = 0u;
                      v296 = 0u;
                      v293 = 0u;
                      v294 = 0u;
                      v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v293, &v323, 16);
                      if (v132)
                      {
                        v133 = *(_QWORD *)v294;
                        do
                        {
                          for (mm = 0; mm != v132; ++mm)
                          {
                            if (*(_QWORD *)v294 != v133)
                              objc_enumerationMutation(v131);
                            v135 = *(void **)(*((_QWORD *)&v293 + 1) + 8 * mm);
                            if ((objc_opt_respondsToSelector() & 1) != 0)
                              objc_msgSend(v135, "group:didUpdatePassState:forPass:atIndex:", v257, v231, v233, -[PKGroup _indexOfUniqueID:](v257[3], v235));
                          }
                          v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v293, &v323, 16);
                        }
                        while (v132);
                      }

                    }
                  }
                  -[PKGroup _moveUniqueID:toIndex:notify:]((uint64_t)v257, v235, v247, a7);
                  goto LABEL_167;
                }
                if (v229)
                {
                  v109 = v229;
                  v110 = v231;
                  objc_msgSend(v109, "uniqueID");
                  v111 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v257[3], "uniqueIDs");
                  v112 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v112, "insertObject:atIndex:", v111, v247);

                  objc_msgSend(v257[4], "setObject:forKeyedSubscript:", v109, v111);
                  objc_msgSend(v257[5], "setObject:forKeyedSubscript:", v110, v111);
                  if (a7)
                  {
                    -[PKGroup observers]((uint64_t)v257);
                    v113 = (void *)objc_claimAutoreleasedReturnValue();
                    v303 = 0u;
                    v304 = 0u;
                    v301 = 0u;
                    v302 = 0u;
                    v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v301, v332, 16);
                    if (v114)
                    {
                      v115 = *(_QWORD *)v302;
                      do
                      {
                        for (nn = 0; nn != v114; ++nn)
                        {
                          if (*(_QWORD *)v302 != v115)
                            objc_enumerationMutation(v113);
                          v117 = *(void **)(*((_QWORD *)&v301 + 1) + 8 * nn);
                          if ((objc_opt_respondsToSelector() & 1) != 0)
                          {
                            objc_msgSend(v117, "group:didInsertPass:withState:atIndex:", v257, v109, v110, v247);
                          }
                          else if ((objc_opt_respondsToSelector() & 1) != 0)
                          {
                            objc_msgSend(v117, "group:didInsertPass:atIndex:", v257, v109, v247);
                          }
                        }
                        v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v301, v332, 16);
                      }
                      while (v114);
                    }

                  }
LABEL_167:
                  v118 = 1;
                }
                else
                {
                  objc_msgSend(v217, "removeObject:", v235);
                  v118 = 0;
                }
                if (objc_msgSend(v229, "passType") == 1)
                {
                  objc_msgSend(v257[6], "objectForKey:", v235);
                  v119 = (void *)objc_claimAutoreleasedReturnValue();
                  v291[0] = MEMORY[0x1E0C809B0];
                  v291[1] = 3221225472;
                  v291[2] = __85__PKGroup_updateWithCatalogGroup_passes_states_accounts_expiredSectionPasses_notify___block_invoke;
                  v291[3] = &unk_1E2ADB3F0;
                  v120 = v229;
                  v292 = v120;
                  objc_msgSend(v218, "pk_anyObjectPassingTest:", v291);
                  v121 = objc_claimAutoreleasedReturnValue();
                  v122 = (void *)v121;
                  if (v119 && v121)
                  {
                    v123 = objc_msgSend(v119, "isEqual:", v121);

                    if ((v123 & 1) == 0)
                    {
                      v124 = v257[6];
                      goto LABEL_181;
                    }
LABEL_175:

                    v247 += v118;
                    goto LABEL_176;
                  }
                  v125 = v119 == (void *)v121;

                  if (v125)
                  {
                    v122 = v119;
                    goto LABEL_175;
                  }
                  if (!v119)
                  {
                    if (!v122 || (objc_msgSend(v257[6], "setObject:forKeyedSubscript:", v122, v235), !a7))
                    {
                      v119 = 0;
                      goto LABEL_175;
                    }
                    -[PKGroup observers]((uint64_t)v257);
                    v126 = (void *)objc_claimAutoreleasedReturnValue();
                    v281 = 0u;
                    v282 = 0u;
                    v279 = 0u;
                    v280 = 0u;
                    v136 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v279, &v311, 16);
                    if (v136)
                    {
                      v137 = *(_QWORD *)v280;
                      if (v229)
                        v138 = v120;
                      else
                        v138 = v233;
                      do
                      {
                        for (i1 = 0; i1 != v136; ++i1)
                        {
                          if (*(_QWORD *)v280 != v137)
                            objc_enumerationMutation(v126);
                          v140 = *(void **)(*((_QWORD *)&v279 + 1) + 8 * i1);
                          if ((objc_opt_respondsToSelector() & 1) != 0)
                            objc_msgSend(v140, "group:didInsertAssociatedAccount:forPass:", v257, v122, v138);
                        }
                        v136 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v279, &v311, 16);
                      }
                      while (v136);
                    }
                    v119 = 0;
                    goto LABEL_234;
                  }
                  v124 = v257[6];
                  if (v122)
                  {
LABEL_181:
                    objc_msgSend(v124, "setObject:forKeyedSubscript:", v122, v235);
                    if (!a7)
                      goto LABEL_175;
                    -[PKGroup observers]((uint64_t)v257);
                    v126 = (void *)objc_claimAutoreleasedReturnValue();
                    v289 = 0u;
                    v290 = 0u;
                    v287 = 0u;
                    v288 = 0u;
                    v127 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v287, &v319, 16);
                    if (v127)
                    {
                      v128 = *(_QWORD *)v288;
                      do
                      {
                        for (i2 = 0; i2 != v127; ++i2)
                        {
                          if (*(_QWORD *)v288 != v128)
                            objc_enumerationMutation(v126);
                          v130 = *(void **)(*((_QWORD *)&v287 + 1) + 8 * i2);
                          if ((objc_opt_respondsToSelector() & 1) != 0)
                            objc_msgSend(v130, "group:didUpdateAssociatedAccount:forPass:", v257, v122, v120);
                        }
                        v127 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v287, &v319, 16);
                      }
                      while (v127);
                    }
LABEL_234:

                    goto LABEL_175;
                  }
                  objc_msgSend(v124, "setObject:forKeyedSubscript:", 0, v235);
                  if (a7)
                  {
                    -[PKGroup observers]((uint64_t)v257);
                    v126 = (void *)objc_claimAutoreleasedReturnValue();
                    v285 = 0u;
                    v286 = 0u;
                    v283 = 0u;
                    v284 = 0u;
                    v141 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v283, &v315, 16);
                    if (v141)
                    {
                      v142 = *(_QWORD *)v284;
                      if (v229)
                        v143 = v120;
                      else
                        v143 = v233;
                      do
                      {
                        for (i3 = 0; i3 != v141; ++i3)
                        {
                          if (*(_QWORD *)v284 != v142)
                            objc_enumerationMutation(v126);
                          v145 = *(void **)(*((_QWORD *)&v283 + 1) + 8 * i3);
                          if ((objc_opt_respondsToSelector() & 1) != 0)
                            objc_msgSend(v145, "group:didRemoveAssociatedAccountForPass:", v257, v143);
                        }
                        v141 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v283, &v315, 16);
                      }
                      while (v141);
                    }
                    v122 = 0;
                    goto LABEL_234;
                  }
                }
                else
                {
                  v119 = 0;
                }
                v122 = 0;
                goto LABEL_175;
              }
LABEL_176:
              ++v230;
            }
            while (v230 != v226);
            v146 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v297, &v328, 16);
            v226 = v146;
          }
          while (v146);
LABEL_236:

          v303 = 0u;
          v304 = 0u;
          v301 = 0u;
          v302 = 0u;
          v147 = v222;
          v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v301, v332, 16);
          if (v148)
          {
            v149 = *(_QWORD *)v302;
            do
            {
              for (i4 = 0; i4 != v148; ++i4)
              {
                if (*(_QWORD *)v302 != v149)
                  objc_enumerationMutation(v147);
                -[PKGroup _removeUniqueID:notify:](v257, *(void **)(*((_QWORD *)&v301 + 1) + 8 * i4), a7);
              }
              v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v301, v332, 16);
            }
            while (v148);
          }

LABEL_245:
          if (!v257
            || (objc_msgSend(v257[3], "uniqueIDs"),
                v151 = (void *)objc_claimAutoreleasedReturnValue(),
                v152 = objc_msgSend(v151, "count") == 0,
                v151,
                v152))
          {
            objc_msgSend(v207, "groups");
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v162, "removeObject:", v214);

            objc_msgSend(v212, "removeObjectForKey:", v216);
          }
          else
          {
            v323 = 0;
            v324 = (uint64_t)&v323;
            v325 = 0x2020000000;
            v326 = 0;
            v263[0] = MEMORY[0x1E0C809B0];
            v263[1] = 3221225472;
            v264 = __86__PKGroupsController__updateAndCreateGroupsWithCatalog_passes_states_accounts_notify___block_invoke;
            v265 = &unk_1E2ADB530;
            v153 = v219;
            v270 = &v323;
            v266 = v153;
            v267 = v227;
            v154 = v216;
            v268 = v154;
            v269 = v203;
            v155 = v263;
            v330 = 0u;
            v331 = 0u;
            v329 = 0u;
            v328 = 0u;
            objc_msgSend(v257[3], "uniqueIDs");
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            v157 = objc_msgSend(v156, "countByEnumeratingWithState:objects:count:", &v328, v332, 16);
            if (v157)
            {
              v158 = *(_QWORD *)v329;
              do
              {
                for (i5 = 0; i5 != v157; ++i5)
                {
                  if (*(_QWORD *)v329 != v158)
                    objc_enumerationMutation(v156);
                  v264((uint64_t)v155, *(void **)(*((_QWORD *)&v328 + 1) + 8 * i5));
                }
                v157 = objc_msgSend(v156, "countByEnumeratingWithState:objects:count:", &v328, v332, 16);
              }
              while (v157);
            }

            v160 = *(_QWORD *)(v324 + 24);
            if (v160 == objc_msgSend(v257, "passCount"))
            {
              objc_msgSend(v207, "groups");
              v161 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v161, "removeObject:", v214);

              objc_msgSend(v212, "removeObjectForKey:", v154);
            }

            _Block_object_dispose(&v323, 8);
          }

        }
        v210 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v271, v306, 16);
      }
      while (v210);
    }

    v331 = 0u;
    v330 = 0u;
    v329 = 0u;
    v328 = 0u;
    v163 = v203;
    v164 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v328, v332, 16);
    if (v164)
    {
      v165 = *(_QWORD *)v329;
      do
      {
        for (i6 = 0; i6 != v164; ++i6)
        {
          if (*(_QWORD *)v329 != v165)
            objc_enumerationMutation(v163);
          objc_msgSend(*(id *)(v227 + 72), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v328 + 1) + 8 * i6), v198);
        }
        v164 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v328, v332, 16);
      }
      while (v164);
    }

    v167 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(v227 + 56), "allKeys");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = (void *)objc_msgSend(v167, "initWithArray:", v168);

    objc_msgSend(v207, "allGroupIDs");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "minusSet:", v170);

    v261 = 0u;
    v262 = 0u;
    v259 = 0u;
    v260 = 0u;
    v171 = v169;
    v172 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v259, v305, 16);
    if (v172)
    {
      v173 = *(_QWORD *)v260;
      do
      {
        for (i7 = 0; i7 != v172; ++i7)
        {
          if (*(_QWORD *)v260 != v173)
            objc_enumerationMutation(v171);
          objc_msgSend(*(id *)(v227 + 56), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v259 + 1) + 8 * i7), v198);
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKGroupsController _removeGroup:notify:]((id *)v227, v175, a7);

        }
        v172 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v259, v305, 16);
      }
      while (v172);
    }

    objc_msgSend(v207, "groups");
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    v248 = objc_msgSend(v253, "count");
    if (v248)
    {
      v176 = 0;
      do
      {
        v177 = v176;
        objc_msgSend(v253, "objectAtIndex:", v198);
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v178, "groupID");
        v258 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)v227, "groupAtIndex:", v177);
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v179, "groupID");
        v180 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v180 || !objc_msgSend(v258, "isEqualToNumber:", v180))
        {
          objc_msgSend(*(id *)(v227 + 56), "objectForKey:", v258);
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          v182 = v181 == 0;

          if (v182)
          {
            objc_msgSend(v212, "objectForKey:", v258);
            v192 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKGroupsController _placeGroup:atIndex:notify:]((id *)v227, v192, v177, a7);

          }
          else if (v180)
          {
            v244 = -[PKGroupsController _indexOfGroupID:](v227, (uint64_t)v258);
            v183 = v180;
            v184 = v253;
            v185 = objc_msgSend(v184, "count");
            v186 = v177;
            if (v185 > v177)
            {
              v186 = v177;
              v187 = v177;
              while (1)
              {
                objc_msgSend(v184, "objectAtIndex:", v187);
                v188 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v188, "groupID");
                v189 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v189, "isEqualToNumber:", v183))
                  break;
                objc_msgSend(*(id *)(v227 + 56), "objectForKey:", v189);
                v190 = (void *)objc_claimAutoreleasedReturnValue();
                v191 = v190 != 0;

                v186 += v191;
                if (v185 == ++v187)
                  goto LABEL_288;
              }

            }
LABEL_288:

            v194 = *(void **)(v227 + 56);
            if (v244 <= v186)
            {
              objc_msgSend(v194, "objectForKey:", v183);
              v196 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKGroupsController _placeGroup:atIndex:notify:]((id *)v227, v196, v186, a7);

              goto LABEL_291;
            }
            objc_msgSend(v194, "objectForKey:", v258);
            v195 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKGroupsController _placeGroup:atIndex:notify:]((id *)v227, v195, v177, a7);

          }
          else
          {
            objc_msgSend(*(id *)(v227 + 56), "objectForKey:", v258);
            v193 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKGroupsController _placeGroup:atIndex:notify:]((id *)v227, v193, v177, a7);

          }
        }
        ++v177;
LABEL_291:

        v176 = v177;
      }
      while (v177 < v248);
    }

    objc_autoreleasePoolPop(context);
    v12 = v198;
  }

}

- (id)groups
{
  return (id)-[NSMutableArray copy](self->_groups, "copy");
}

- (unint64_t)groupIndexForPassUniqueID:(id)a3
{
  void *v4;
  unint64_t v5;

  -[NSMutableDictionary objectForKey:](self->_groupIDsByPassUniqueID, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKGroupsController _indexOfGroupID:]((uint64_t)self, (uint64_t)v4);

  return v5;
}

- (BOOL)containsExpiredPassWithUniqueID:(id)a3
{
  id v4;
  NSArray *expiredSectionPasses;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  expiredSectionPasses = self->_expiredSectionPasses;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__PKGroupsController_containsExpiredPassWithUniqueID___block_invoke;
  v8[3] = &unk_1E2AC7390;
  v9 = v4;
  v6 = v4;
  LOBYTE(expiredSectionPasses) = -[NSArray pk_containsObjectPassingTest:](expiredSectionPasses, "pk_containsObjectPassingTest:", v8);

  return (char)expiredSectionPasses;
}

uint64_t __54__PKGroupsController_containsExpiredPassWithUniqueID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (id)passWithUniqueID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = a3;
    -[PKGroupsController groupAtIndex:](self, "groupAtIndex:", -[PKGroupsController groupIndexForPassUniqueID:](self, "groupIndexForPassUniqueID:", v4));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
    {
      objc_msgSend(*(id *)(v5 + 32), "objectForKey:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)handleUserPassesDelete:(id)a3
{
  id v4;
  NSArray *expiredSectionPasses;
  id v6;
  NSArray *v7;
  NSArray *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void **v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    expiredSectionPasses = self->_expiredSectionPasses;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __45__PKGroupsController_handleUserPassesDelete___block_invoke;
    v21[3] = &unk_1E2AC7390;
    v6 = v4;
    v22 = v6;
    v7 = -[NSArray pk_createArrayByRemovingObjectsPassingTest:](expiredSectionPasses, "pk_createArrayByRemovingObjectsPassingTest:", v21);
    v8 = self->_expiredSectionPasses;
    self->_expiredSectionPasses = v7;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[NSMutableDictionary removeObjectForKey:](self->_passAnnotationsByUniqueId, "removeObjectForKey:", v14, (_QWORD)v17);
          -[NSMutableDictionary objectForKey:](self->_groupIDsByPassUniqueID, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            -[NSMutableDictionary removeObjectForKey:](self->_groupIDsByPassUniqueID, "removeObjectForKey:", v14);
            -[NSMutableDictionary objectForKey:](self->_groupsByGroupID, "objectForKey:", v15);
            v16 = (void **)objc_claimAutoreleasedReturnValue();
            if ((-[PKGroup containsPassesInAdditionToUniqueID:]((uint64_t)v16, v14) & 1) != 0)
            {
              if (v16)
                -[PKGroup _removeUniqueID:notify:](v16, v14, 1);
            }
            else
            {
              -[PKGroupsController _removeGroup:notify:]((id *)&self->super.isa, v16, 1);
            }

          }
          else
          {
            -[NSMutableDictionary removeObjectForKey:](self->_groupIDsByExpiredPassUniqueID, "removeObjectForKey:", v14);
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v11);
    }

    -[PKPassLibrary removePassesWithUniqueIDs:diagnosticReason:](self->_passLibrary, "removePassesWithUniqueIDs:diagnosticReason:", v9, CFSTR("User Deleted Passes"));
  }

}

BOOL __45__PKGroupsController_handleUserPassesDelete___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "indexOfObject:", v3) != 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (void)_removeGroup:(int)a3 notify:
{
  id v5;
  unint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;

  v5 = a2;
  if (a1)
  {
    v9 = v5;
    v6 = objc_msgSend(a1, "indexOfGroup:", v5);
    objc_msgSend(a1[6], "removeObjectAtIndex:", v6);
    -[PKGroupsController _fixIndicesFrom:](a1, v6);
    objc_msgSend(v9, "groupID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[8], "removeObjectForKey:", v7);
    objc_msgSend(a1[7], "removeObjectForKey:", v7);
    if (a3)
    {
      WeakRetained = objc_loadWeakRetained(a1 + 22);
      objc_msgSend(WeakRetained, "groupsController:didRemoveGroup:atIndex:", a1, v9, v6);

    }
    v5 = v9;
  }

}

- (void)handleUserPassDelete:(id)a3
{
  id v4;
  void *v5;
  void **v6;
  NSArray *expiredSectionPasses;
  id v8;
  uint64_t v9;
  NSArray *v10;
  NSArray *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  if (v4)
  {
    v12 = v4;
    -[NSMutableDictionary objectForKey:](self->_groupIDsByPassUniqueID, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_groupIDsByPassUniqueID, "removeObjectForKey:", v12);
      -[NSMutableDictionary objectForKey:](self->_groupsByGroupID, "objectForKey:", v5);
      v6 = (void **)objc_claimAutoreleasedReturnValue();
      if ((-[PKGroup containsPassesInAdditionToUniqueID:]((uint64_t)v6, v12) & 1) != 0)
      {
        if (v6)
          -[PKGroup _removeUniqueID:notify:](v6, v12, 1);
      }
      else
      {
        -[PKGroupsController _removeGroup:notify:]((id *)&self->super.isa, v6, 1);
      }

    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](self->_groupIDsByExpiredPassUniqueID, "removeObjectForKey:", v12);
    }
    expiredSectionPasses = self->_expiredSectionPasses;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__PKGroupsController_handleUserPassDelete___block_invoke;
    v13[3] = &unk_1E2ADB4B8;
    v8 = v12;
    v14 = v8;
    v9 = -[NSArray indexOfObjectPassingTest:](expiredSectionPasses, "indexOfObjectPassingTest:", v13);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = -[NSArray pk_createArrayByRemovingObjectAtIndex:](self->_expiredSectionPasses, "pk_createArrayByRemovingObjectAtIndex:", v9);
      v11 = self->_expiredSectionPasses;
      self->_expiredSectionPasses = v10;

      -[NSMutableDictionary removeObjectForKey:](self->_passAnnotationsByUniqueId, "removeObjectForKey:", v8);
    }
    -[PKPassLibrary removePassWithUniqueID:diagnosticReason:](self->_passLibrary, "removePassWithUniqueID:diagnosticReason:", v8, CFSTR("User Deleted Pass"));

    v4 = v12;
  }

}

uint64_t __43__PKGroupsController_handleUserPassDelete___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)handleUserPassRecover:(id)a3
{
  id v4;
  void *v5;
  NSArray *expiredSectionPasses;
  id v7;
  uint64_t v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *filteredPassUniqueIDs;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    expiredSectionPasses = self->_expiredSectionPasses;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __44__PKGroupsController_handleUserPassRecover___block_invoke;
    v14[3] = &unk_1E2ADB4B8;
    v7 = v4;
    v15 = v7;
    v8 = -[NSArray indexOfObjectPassingTest:](expiredSectionPasses, "indexOfObjectPassingTest:", v14);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = -[NSArray pk_createArrayByRemovingObjectAtIndex:](self->_expiredSectionPasses, "pk_createArrayByRemovingObjectAtIndex:", v8);
      v10 = self->_expiredSectionPasses;
      self->_expiredSectionPasses = v9;

      -[NSArray pk_arrayByRemovingObject:](self->_filteredPassUniqueIDs, "pk_arrayByRemovingObject:", v7);
      v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
      filteredPassUniqueIDs = self->_filteredPassUniqueIDs;
      self->_filteredPassUniqueIDs = v11;

      -[NSMutableDictionary removeObjectForKey:](self->_groupIDsByExpiredPassUniqueID, "removeObjectForKey:", v7);
      -[NSMutableDictionary removeObjectForKey:](self->_passAnnotationsByUniqueId, "removeObjectForKey:", v7);
      PKLogFacilityTypeGetObject(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v7;
        _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Attempting pass recovery with unique id:%@", buf, 0xCu);
      }

      -[PKPassLibrary recoverPassWithUniqueID:](self->_passLibrary, "recoverPassWithUniqueID:", v7);
    }

  }
}

uint64_t __44__PKGroupsController_handleUserPassRecover___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)filteringEnabled
{
  int refreshed;

  if (self->_filters)
  {
    LOBYTE(refreshed) = 1;
  }
  else
  {
    refreshed = PKExpiredPassesRefreshEnabled();
    if (refreshed)
      LOBYTE(refreshed) = -[NSArray count](self->_expiredSectionPasses, "count") != 0;
  }
  return refreshed;
}

- (void)suppressRemoteUpdates:(BOOL)a3
{
  PKCatalog *v4;
  PKCatalog *catalogBeforeReordering;

  self->_suppressRemoteUpdates = 1;
  self->_enqueueRemoteUpdates = a3;
  v4 = -[PKGroupsController _copyRemoteCatalog]((uint64_t)self);
  catalogBeforeReordering = self->_catalogBeforeReordering;
  self->_catalogBeforeReordering = v4;

}

- (PKCatalog)_copyRemoteCatalog
{
  PKCatalog *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = objc_alloc_init(PKCatalog);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = *(id *)(a1 + 48);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v4)
    goto LABEL_15;
  v5 = v4;
  v6 = *(_QWORD *)v14;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(v3);
      v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
      if (v8)
      {
        if (*(_BYTE *)(v8 + 56))
          goto LABEL_11;
        v9 = (void *)objc_msgSend(*(id *)(v8 + 24), "copy", (_QWORD)v13);
      }
      else
      {
        v9 = 0;
      }
      -[PKCatalog groups](v2, "groups", (_QWORD)v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v9);

LABEL_11:
      ++v7;
    }
    while (v5 != v7);
    v11 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    v5 = v11;
  }
  while (v11);
LABEL_15:

  return v2;
}

- (void)moveGroupAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  id v7;

  -[PKGroupsController groupAtIndex:](self, "groupAtIndex:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PKGroupsController _moveGroup:fromIndex:toIndex:notify:](self, "_moveGroup:fromIndex:toIndex:notify:", v7, a3, a4, 0);

}

- (void)movePass:(id)a3 inGroup:(id)a4 toIndex:(unint64_t)a5
{
  id v8;
  id v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSMutableArray *v19;
  void *v20;
  unint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_groups;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v21 = a5;
    v13 = *(_QWORD *)v23;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v14);
      objc_msgSend(v15, "groupID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "groupID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToNumber:", v17);

      if ((v18 & 1) != 0)
        break;
      if (v12 == ++v14)
      {
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v19 = v15;

    if (!v19)
      goto LABEL_13;
    objc_msgSend(v8, "uniqueID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKGroup _moveUniqueID:toIndex:notify:]((uint64_t)v19, v20, v21, 0);

    v10 = v19;
  }
LABEL_12:

LABEL_13:
}

- (void)enableRemoteUpdates
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void (**v6)(void);
  PKCatalog *catalogBeforeReordering;
  PKCatalog *v8;

  v8 = -[PKGroupsController _copyRemoteCatalog]((uint64_t)self);
  if (-[PKCatalog isEquivalentToCatalog:](self->_catalogBeforeReordering, "isEquivalentToCatalog:"))
  {
    v3 = -[NSMutableArray count](self->_enqueuedUpdates, "count");
    if (v3)
    {
      v4 = v3;
      for (i = 0; i != v4; ++i)
      {
        -[NSMutableArray objectAtIndex:](self->_enqueuedUpdates, "objectAtIndex:", i);
        v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v6[2]();

      }
    }
  }
  else
  {
    -[PKPassLibrary sendUserEditedCatalog:](self->_passLibrary, "sendUserEditedCatalog:", v8);
  }
  -[NSMutableArray removeAllObjects](self->_enqueuedUpdates, "removeAllObjects");
  catalogBeforeReordering = self->_catalogBeforeReordering;
  self->_catalogBeforeReordering = 0;

  self->_suppressRemoteUpdates = 0;
}

- (void)addLocalPasses:(id)a3
{
  id v5;
  PKGroupsController *v6;
  PKCatalogGroup *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  PKGroup *v18;
  id *v19;
  id *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  NSMutableDictionary *groupIDsByPassUniqueID;
  void *v28;
  void *v29;
  PKCatalogGroup *v30;
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
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self;
  objc_storeStrong((id *)&self->_localPasses, a3);
  v7 = objc_alloc_init(PKCatalogGroup);
  PKUniqueNumber();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCatalogGroup setGroupID:](v7, "setGroupID:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v15, "uniqueID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKCatalogGroup uniqueIDs](v7, "uniqueIDs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v16);

        objc_msgSend(v9, "setObject:forKey:", v15, v16);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v12);
  }

  v18 = [PKGroup alloc];
  v30 = v7;
  v19 = -[PKGroup initWithCatalogGroup:passes:states:accounts:]((id *)&v18->super.isa, v7, v9, MEMORY[0x1E0C9AA70], 0);
  v20 = v19;
  if (v19)
    *((_BYTE *)v19 + 56) = 1;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v9, "allKeys", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
        groupIDsByPassUniqueID = v6->_groupIDsByPassUniqueID;
        objc_msgSend(v20, "groupID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](groupIDsByPassUniqueID, "setObject:forKey:", v28, v26);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v23);
  }

  -[PKGroupsController _insertGroup:atIndex:notify:]((uint64_t)v6, v20, 0, 1);
}

- (void)passLibrary:(id)a3 receivedUpdatedCatalog:(id)a4 passes:(id)a5 states:(id)a6
{
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (!self->_limitedMode)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__PKGroupsController_passLibrary_receivedUpdatedCatalog_passes_states___block_invoke;
    v12[3] = &unk_1E2AC0F90;
    v12[4] = self;
    v13 = v9;
    v14 = v10;
    v15 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], v12);

  }
}

void __71__PKGroupsController_passLibrary_receivedUpdatedCatalog_passes_states___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __71__PKGroupsController_passLibrary_receivedUpdatedCatalog_passes_states___block_invoke_2;
  v12 = &unk_1E2AC0F90;
  v2 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 32);
  v3 = v13;
  v14 = v2;
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v4 = &v9;
  v5 = v4;
  if (v3)
  {
    if (*(_BYTE *)(v3 + 88))
    {
      if (*(_BYTE *)(v3 + 89))
      {
        v6 = *(void **)(v3 + 104);
        v7 = (void *)objc_msgSend(v4, "copy", v9, v10);
        v8 = _Block_copy(v7);
        objc_msgSend(v6, "addObject:", v8);

      }
    }
    else
    {
      v11((uint64_t)v4);
    }
  }

}

void __71__PKGroupsController_passLibrary_receivedUpdatedCatalog_passes_states___block_invoke_2(uint64_t a1)
{
  -[PKGroupsController _updateStateWithCatalog:passes:states:annotations:accounts:notify:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), 0, 0, 1u);
}

- (void)objectSettingsDidChangeNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKGroupsController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__PKGroupsController_objectSettingsDidChangeNotification___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __58__PKGroupsController_objectSettingsDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PKPassLibraryUniqueIDUserInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "passWithUniqueID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PKPassLibrarySettingsUserInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSettingsWithoutUpdatingDataAccessor:", objc_msgSend(v4, "unsignedIntegerValue"));

}

void __70__PKGroupsController__displayablePassesDictionaryFromSet_withCatalog___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

}

void __92__PKGroupsController__displayablePassesDictionaryFromPasses_withCatalog_andPassAnnotations___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

}

void __86__PKGroupsController__updateAndCreateGroupsWithCatalog_passes_states_accounts_notify___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "setObject:forKey:", *(_QWORD *)(a1 + 48), v3);
    objc_msgSend(*(id *)(a1 + 56), "removeObject:", v3);
  }

}

- (void)_moveGroup:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5 notify:(BOOL)a6
{
  _BOOL4 v6;
  unint64_t v10;
  unint64_t v11;
  id WeakRetained;
  id v13;

  v6 = a6;
  v13 = a3;
  -[NSMutableArray removeObjectAtIndex:](self->_groups, "removeObjectAtIndex:", a4);
  -[NSMutableArray insertObject:atIndex:](self->_groups, "insertObject:atIndex:", v13, a5);
  if (a4 >= a5)
    v10 = a5;
  else
    v10 = a4;
  if (a4 <= a5)
    v11 = a5;
  else
    v11 = a4;
  do
    -[PKGroupsController _fixIndex:]((uint64_t)self, v10++);
  while (v10 <= v11);
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "groupsController:didMoveGroup:fromIndex:toIndex:", self, v13, a4, a5);

  }
}

- (void)accountAdded:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__PKGroupsController_accountAdded___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __35__PKGroupsController_accountAdded___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        -[PKGroup updateAssociatedAccount:](*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), *(void **)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)accountChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__PKGroupsController_accountChanged___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __37__PKGroupsController_accountChanged___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        -[PKGroup updateAssociatedAccount:](*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), *(void **)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)accountRemoved:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__PKGroupsController_accountRemoved___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __37__PKGroupsController_accountRemoved___block_invoke(uint64_t a1)
{
  uint64_t i;
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t j;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  id obj;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v28)
  {
    v26 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v31 != v26)
          objc_enumerationMutation(obj);
        v2 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v3 = *(id *)(a1 + 40);
        if (v2)
        {
          v29 = i;
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v4 = *(id *)(v2 + 32);
          v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
          if (v5)
          {
            v6 = v5;
            v7 = *(_QWORD *)v39;
            while (2)
            {
              for (j = 0; j != v6; ++j)
              {
                if (*(_QWORD *)v39 != v7)
                  objc_enumerationMutation(v4);
                objc_msgSend(*(id *)(v2 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
                v9 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v9, "passType") == 1)
                {
                  objc_msgSend(v9, "associatedAccountServiceAccountIdentifier");
                  v10 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v3, "accountIdentifier");
                  v11 = (void *)objc_claimAutoreleasedReturnValue();
                  v12 = v10;
                  v13 = v11;
                  if (v12 == v13)
                  {

LABEL_25:
                    v17 = *(void **)(v2 + 48);
                    objc_msgSend(v9, "uniqueID");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "removeObjectForKey:", v18);

                    -[PKGroup observers](v2);
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = 0u;
                    v35 = 0u;
                    v36 = 0u;
                    v37 = 0u;
                    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
                    if (v20)
                    {
                      v21 = v20;
                      v22 = *(_QWORD *)v35;
                      do
                      {
                        for (k = 0; k != v21; ++k)
                        {
                          if (*(_QWORD *)v35 != v22)
                            objc_enumerationMutation(v19);
                          v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * k);
                          if ((objc_opt_respondsToSelector() & 1) != 0)
                            objc_msgSend(v24, "group:didRemoveAssociatedAccountForPass:", v2, v9);
                        }
                        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
                      }
                      while (v21);
                    }

                    goto LABEL_35;
                  }
                  v14 = v13;
                  if (v12)
                    v15 = v13 == 0;
                  else
                    v15 = 1;
                  if (v15)
                  {

                  }
                  else
                  {
                    v16 = objc_msgSend(v12, "isEqualToString:", v13);

                    if ((v16 & 1) != 0)
                      goto LABEL_25;
                  }
                }

              }
              v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
              if (v6)
                continue;
              break;
            }
          }
LABEL_35:

          i = v29;
        }

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v28);
  }

}

- (BOOL)reorderingEnabled
{
  return self->_reorderingEnabled;
}

- (void)setReorderingEnabled:(BOOL)a3
{
  self->_reorderingEnabled = a3;
}

- (NSArray)filteredPassUniqueIDs
{
  return self->_filteredPassUniqueIDs;
}

- (NSArray)expiredSectionPasses
{
  return self->_expiredSectionPasses;
}

- (NSMutableDictionary)passAnnotationsByUniqueId
{
  return self->_passAnnotationsByUniqueId;
}

- (BOOL)isAuthenticating
{
  return self->_authenticating;
}

- (void)setAuthenticating:(BOOL)a3
{
  self->_authenticating = a3;
}

- (PKGroupsControllerDelegate)delegate
{
  return (PKGroupsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passAnnotationsByUniqueId, 0);
  objc_storeStrong((id *)&self->_expiredSectionPasses, 0);
  objc_storeStrong((id *)&self->_filteredPassUniqueIDs, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_expressPassConfigurations, 0);
  objc_storeStrong((id *)&self->_localPasses, 0);
  objc_storeStrong((id *)&self->_enqueuedUpdates, 0);
  objc_storeStrong((id *)&self->_catalogBeforeReordering, 0);
  objc_storeStrong((id *)&self->_groupIDsByExpiredPassUniqueID, 0);
  objc_storeStrong((id *)&self->_groupIDsByPassUniqueID, 0);
  objc_storeStrong((id *)&self->_indicesByGroupID, 0);
  objc_storeStrong((id *)&self->_groupsByGroupID, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_allowedPassUniqueIDs, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
}

@end

@implementation PUIReportAppListController

+ (BOOL)appSpecifiersWithLimit:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA27E600, *MEMORY[0x1E0DB04C8]);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0DB04A8]);

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__PUIReportAppListController_appSpecifiersWithLimit_completion___block_invoke;
  v12[3] = &unk_1EA26B4D8;
  v13 = v6;
  v14 = a1;
  v9 = v6;
  v10 = +[PUITrackingReportManager queryWithOptions:reply:](PUITrackingReportManager, "queryWithOptions:reply:", v7, v12);

  return v10;
}

void __64__PUIReportAppListController_appSpecifiersWithLimit_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  _BOOL8 v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
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
  v2 = a2;
  v33 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v27 = v2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("result"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v32 = *(_QWORD *)v40;
    v30 = *MEMORY[0x1E0D808D0];
    v31 = *MEMORY[0x1E0D808C0];
    v29 = *MEMORY[0x1E0D80780];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v40 != v32)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bundleName"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("count"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "integerValue");

        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v8, 0, 0);
        objc_msgSend(v11, "localizedName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x1E0D804E8];
        if (objc_msgSend(v12, "length"))
          v14 = v12;
        else
          v14 = v8;
        objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, *(_QWORD *)(a1 + 40), 0, 0, objc_opt_class(), 2, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setIdentifier:", v8);
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, CFSTR("PUIReportAppIDKey"));
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, v31);
        objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v30);
        objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_opt_class(), v29);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("PUITrackerBarValueKey"));

        objc_msgSend(v33, "addObject:", v15);
        if (v10 > v5)
          v5 = v10;

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v17 = v33;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v36 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("PUITrackerBarCapacityKey"));

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v19);
  }

  v24 = objc_msgSend(v17, "count") != 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBool:forKey:", v24, CFSTR("PSUITrackerHasDataKey"));

  v26 = *(_QWORD *)(a1 + 32);
  if (v26)
    (*(void (**)(uint64_t, id))(v26 + 16))(v26, v17);

}

- (PUIReportAppListController)init
{
  PUIReportAppListController *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUIReportAppListController;
  v2 = -[PUIReportAppListController init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_dataDidChange, *MEMORY[0x1E0DC4750], 0);

    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PUIAnalyticsLogView(v5, 0, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PUIReportAppListController;
  -[PUIReportAppListController dealloc](&v4, sel_dealloc);
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[5];

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    PUI_LocalizedStringForAppReport(CFSTR("APP_NETWORK_ACTIVITY"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportAppListController setTitle:](self, "setTitle:", v5);

    v6 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PUI_LocalizedStringForAppReport(CFSTR("SORT_BY"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithTitle:style:target:action:", v7, 0, self, sel_sortByWasTapped);
    -[PUIReportAppListController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItem:", v8);

    -[PUIReportAppListController cachedSpecifiers](self, "cachedSpecifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = (void *)objc_opt_class();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __40__PUIReportAppListController_specifiers__block_invoke;
      v21[3] = &unk_1EA26B500;
      v21[4] = self;
      objc_msgSend(v11, "appSpecifiersWithLimit:completion:", 0, v21);
    }
    v12 = (void *)objc_opt_new();
    if (-[PUIReportAppListController alphabeticalSort](self, "alphabeticalSort"))
    {
      v13 = &stru_1EA26D430;
    }
    else
    {
      PUI_LocalizedStringForAppReport(CFSTR("MOST_ACTIVE_APP"));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:name:", CFSTR("HEADER_GROUP"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v14);
    v15 = -[PUIReportAppListController alphabeticalSort](self, "alphabeticalSort");
    -[PUIReportAppListController cachedSpecifiers](self, "cachedSpecifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      objc_msgSend(v16, "sortedArrayUsingComparator:", &__block_literal_global_0);
      v18 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v18;
    }
    objc_msgSend(v12, "addObjectsFromArray:", v17);
    v19 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v12;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

void __40__PUIReportAppListController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__PUIReportAppListController_specifiers__block_invoke_2;
  v5[3] = &unk_1EA26B438;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __40__PUIReportAppListController_specifiers__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCachedSpecifiers:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

uint64_t __40__PUIReportAppListController_specifiers__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (void)dataDidChange
{
  -[PUIReportAppListController setCachedSpecifiers:](self, "setCachedSpecifiers:", 0);
  -[PUIReportAppListController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)sortByWasTapped
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3448];
  PUI_LocalizedStringForAppReport(CFSTR("MOST_ACTIVE_APP"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__PUIReportAppListController_sortByWasTapped__block_invoke;
  v15[3] = &unk_1EA26B568;
  v15[4] = self;
  objc_msgSend(v4, "actionWithTitle:style:handler:", v5, 0, v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_setChecked:", -[PUIReportAppListController alphabeticalSort](self, "alphabeticalSort") ^ 1);
  objc_msgSend(v3, "addAction:", v7);
  v8 = (void *)MEMORY[0x1E0DC3448];
  PUI_LocalizedStringForAppReport(CFSTR("ALPHABETICAL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __45__PUIReportAppListController_sortByWasTapped__block_invoke_2;
  v14[3] = &unk_1EA26B568;
  v14[4] = self;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_setChecked:", -[PUIReportAppListController alphabeticalSort](self, "alphabeticalSort"));
  objc_msgSend(v3, "addAction:", v10);
  v11 = (void *)MEMORY[0x1E0DC3448];
  PUI_LocalizedStringForAppReport(CFSTR("CANCEL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addAction:", v13);
  -[PUIReportAppListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

uint64_t __45__PUIReportAppListController_sortByWasTapped__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "alphabeticalSort");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAlphabeticalSort:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  }
  return result;
}

uint64_t __45__PUIReportAppListController_sortByWasTapped__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "alphabeticalSort");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAlphabeticalSort:", 1);
    return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  }
  return result;
}

- (NSArray)cachedSpecifiers
{
  return self->_cachedSpecifiers;
}

- (void)setCachedSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSpecifiers, a3);
}

- (UsageFeed)feed
{
  return self->_feed;
}

- (void)setFeed:(id)a3
{
  objc_storeStrong((id *)&self->_feed, a3);
}

- (AnalyticsWorkspace)workspace
{
  return self->_workspace;
}

- (void)setWorkspace:(id)a3
{
  objc_storeStrong((id *)&self->_workspace, a3);
}

- (BOOL)alphabeticalSort
{
  return self->_alphabeticalSort;
}

- (void)setAlphabeticalSort:(BOOL)a3
{
  self->_alphabeticalSort = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_feed, 0);
  objc_storeStrong((id *)&self->_cachedSpecifiers, 0);
}

@end

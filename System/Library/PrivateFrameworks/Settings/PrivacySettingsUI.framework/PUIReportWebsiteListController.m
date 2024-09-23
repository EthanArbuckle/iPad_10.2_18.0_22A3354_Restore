@implementation PUIReportWebsiteListController

+ (id)websiteSpecifiersFromResults:(id)a3 showDetail:(BOOL)a4
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  _BOOL4 v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  NSObject *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v37 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38 = (void *)objc_opt_new();
  v5 = dispatch_group_create();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  v7 = 0x1E0CB3000uLL;
  if (v6)
  {
    v8 = v6;
    v9 = 0;
    v35 = *(_QWORD *)v47;
    v34 = *MEMORY[0x1E0D80780];
    v32 = *MEMORY[0x1E0DB04C8];
    v31 = *MEMORY[0x1E0DB04D0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v47 != v35)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("context"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sumHits"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "integerValue");

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("contextVerificationType"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "integerValue") != 2;

        objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, a1, 0, 0, objc_opt_class(), 2, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setIdentifier:", v12);
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, CFSTR("PUIReportWebsiteKey"));
        objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_opt_class(), v34);
        objc_msgSend(*(id *)(v7 + 2024), "numberWithInteger:", v14);
        v18 = v7;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("PUITrackerBarValueKey"));

        v7 = v18;
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, CFSTR("PUITrackerBarIconLabelKey"));
        objc_msgSend(*(id *)(v18 + 2024), "numberWithInt:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("PUITrackerBarShowAppAttributedBadgeKey"));

        if (v14 > v9)
          v9 = v14;
        if (v37)
        {
          v21 = (void *)objc_opt_new();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1EA27E8D0, v32);
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v12, v31);
          dispatch_group_enter(v5);
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __74__PUIReportWebsiteListController_websiteSpecifiersFromResults_showDetail___block_invoke;
          v43[3] = &unk_1EA26C600;
          v44 = v17;
          v45 = v5;
          +[PUITrackingReportManager queryWithOptions:reply:](PUITrackingReportManager, "queryWithOptions:reply:", v21, v43);

        }
        dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
        objc_msgSend(v38, "addObject:", v17);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v22 = v38;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v40 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        objc_msgSend(*(id *)(v7 + 2024), "numberWithInteger:", v9);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("PUITrackerBarCapacityKey"));

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    }
    while (v24);
  }

  v29 = (void *)objc_msgSend(v22, "copy");
  return v29;
}

void __74__PUIReportWebsiteListController_websiteSpecifiersFromResults_showDetail___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("result_count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("result"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("domain"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, CFSTR("PUITrackerBarTertiaryLabelKey"));
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5 - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringFromNumber:numberStyle:", v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3940];
    PUI_LocalizedStringForTrackers(CFSTR("%@_AND_%@_MORE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v14, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, CFSTR("PUITrackerBarTertiaryLabelKey"));

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

+ (BOOL)websiteSpecifiersWithLimit:(unint64_t)a3 showDetail:(BOOL)a4 completion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  BOOL v15;

  v7 = a5;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1EA27E8E8, *MEMORY[0x1E0DB04C8]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1EA27E900, *MEMORY[0x1E0DB0498]);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0DB04A8]);

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__PUIReportWebsiteListController_websiteSpecifiersWithLimit_showDetail_completion___block_invoke;
  v13[3] = &unk_1EA26CFA0;
  v15 = a4;
  v14 = v7;
  v10 = v7;
  v11 = +[PUITrackingReportManager queryWithOptions:reply:](PUITrackingReportManager, "queryWithOptions:reply:", v8, v13);

  return v11;
}

void __83__PUIReportWebsiteListController_websiteSpecifiersWithLimit_showDetail_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("result"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUIReportWebsiteListController websiteSpecifiersFromResults:showDetail:](PUIReportWebsiteListController, "websiteSpecifiersFromResults:showDetail:", v3, *(unsigned __int8 *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v7, "count") != 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v4, CFSTR("PSUITrackerHasDataKey"));

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

}

- (PUIReportWebsiteListController)init
{
  PUIReportWebsiteListController *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUIReportWebsiteListController;
  v2 = -[PUIReportWebsiteListController init](&v7, sel_init);
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
  v4.super_class = (Class)PUIReportWebsiteListController;
  -[PUIReportWebsiteListController dealloc](&v4, sel_dealloc);
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
  __CFString *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  char v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  __CFString *v50;
  void *v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[5];
  _QWORD v58[5];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    PUI_LocalizedStringForAppReport(CFSTR("WEBSITE_NETWORK_ACTIVITY_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportWebsiteListController setTitle:](self, "setTitle:", v5);

    v6 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PUI_LocalizedStringForAppReport(CFSTR("SORT_BY"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithTitle:style:target:action:", v7, 0, self, sel_sortByWasTapped);
    -[PUIReportWebsiteListController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItem:", v8);

    v10 = (void *)objc_opt_new();
    if (-[PUIReportWebsiteListController alphabeticalSort](self, "alphabeticalSort"))
    {
      v11 = &stru_1EA26D430;
    }
    else
    {
      PUI_LocalizedStringForAppReport(CFSTR("MOST_ACTIVE_SITE"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:name:", CFSTR("HEADER_GROUP"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0D80818];
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D80818]);

    objc_msgSend(v10, "addObject:", v12);
    -[PUIReportWebsiteListController cachedSpecifiers](self, "cachedSpecifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      -[PUIReportWebsiteListController specifier](self, "specifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PUIReportWebsiteListApp"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "length"))
      {
        v19 = (void *)objc_opt_new();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1EA27E918, *MEMORY[0x1E0DB04C8]);
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0DB0490]);
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __44__PUIReportWebsiteListController_specifiers__block_invoke;
        v58[3] = &unk_1EA26CFC8;
        v58[4] = self;
        +[PUITrackingReportManager queryWithOptions:reply:](PUITrackingReportManager, "queryWithOptions:reply:", v19, v58);

      }
      else
      {
        v20 = (void *)objc_opt_class();
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __44__PUIReportWebsiteListController_specifiers__block_invoke_3;
        v57[3] = &unk_1EA26B500;
        v57[4] = self;
        objc_msgSend(v20, "websiteSpecifiersWithLimit:showDetail:completion:", 0, 0, v57);
      }

    }
    v21 = -[PUIReportWebsiteListController alphabeticalSort](self, "alphabeticalSort");
    -[PUIReportWebsiteListController cachedSpecifiers](self, "cachedSpecifiers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21)
    {
      objc_msgSend(v22, "sortedArrayUsingComparator:", &__block_literal_global_22);
      v24 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)v24;
    }
    objc_msgSend(v10, "addObjectsFromArray:", v23);
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v25 = v23;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    v27 = v25;
    if (v26)
    {
      v28 = v26;
      v50 = v11;
      v51 = v10;
      v52 = v3;
      v29 = *(_QWORD *)v54;
      while (2)
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v54 != v29)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("PUITrackerBarShowAppAttributedBadgeKey"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "BOOLValue");

          if ((v32 & 1) != 0)
          {

            v33 = (objc_class *)objc_opt_class();
            NSStringFromClass(v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v34, v15);

            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v35, CFSTR("PUIAttributedStringTextViewDelegateKey"));

            objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("appstore"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "imageWithRenderingMode:", 2);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v37 = (void *)MEMORY[0x1E0CB3940];
            PUI_LocalizedStringForAppReport(CFSTR("WEBSITE_UNVERIFIED_CONTEXT_FOOTER"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "stringWithFormat:", v38, CFSTR("SF_SYMBOL_APPSTORE"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v39);
            v41 = +[PUIAttributedStringFooter string:replacingSubstring:withImage:](PUIAttributedStringFooter, "string:replacingSubstring:withImage:", v40, CFSTR("SF_SYMBOL_APPSTORE"), v27);
            v42 = objc_alloc(MEMORY[0x1E0CB3778]);
            PUI_LocalizedStringForAppReport(CFSTR("WEBSITE_UNVERIFIED_CONTEXT_FOOTER_LINK"));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = (void *)objc_msgSend(v42, "initWithString:", v43);

            v45 = *MEMORY[0x1E0DC1160];
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1EA26D430);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "addAttribute:value:range:", v45, v46, 0, objc_msgSend(v44, "length"));

            v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
            objc_msgSend(v40, "appendAttributedString:", v47);

            objc_msgSend(v40, "appendAttributedString:", v44);
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v40, CFSTR("PUIAttributedStringFooterStringKey"));

            goto LABEL_22;
          }
        }
        v28 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
        if (v28)
          continue;
        break;
      }
      v27 = v25;
LABEL_22:
      v10 = v51;
      v3 = v52;
      v11 = v50;
    }

    v48 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v10;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

void __44__PUIReportWebsiteListController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("result"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "websiteSpecifiersFromResults:showDetail:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__PUIReportWebsiteListController_specifiers__block_invoke_2;
  v8[3] = &unk_1EA26B438;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __44__PUIReportWebsiteListController_specifiers__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCachedSpecifiers:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

void __44__PUIReportWebsiteListController_specifiers__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__PUIReportWebsiteListController_specifiers__block_invoke_4;
  v5[3] = &unk_1EA26B438;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __44__PUIReportWebsiteListController_specifiers__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCachedSpecifiers:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

uint64_t __44__PUIReportWebsiteListController_specifiers__block_invoke_5(uint64_t a1, void *a2, void *a3)
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
  -[PUIReportWebsiteListController setCachedSpecifiers:](self, "setCachedSpecifiers:", 0);
  -[PUIReportWebsiteListController reloadSpecifiers](self, "reloadSpecifiers");
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
  PUI_LocalizedStringForAppReport(CFSTR("MOST_ACTIVE_SITE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__PUIReportWebsiteListController_sortByWasTapped__block_invoke;
  v15[3] = &unk_1EA26B568;
  v15[4] = self;
  objc_msgSend(v4, "actionWithTitle:style:handler:", v5, 0, v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_setChecked:", -[PUIReportWebsiteListController alphabeticalSort](self, "alphabeticalSort") ^ 1);
  objc_msgSend(v3, "addAction:", v7);
  v8 = (void *)MEMORY[0x1E0DC3448];
  PUI_LocalizedStringForAppReport(CFSTR("ALPHABETICAL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __49__PUIReportWebsiteListController_sortByWasTapped__block_invoke_2;
  v14[3] = &unk_1EA26B568;
  v14[4] = self;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_setChecked:", -[PUIReportWebsiteListController alphabeticalSort](self, "alphabeticalSort"));
  objc_msgSend(v3, "addAction:", v10);
  v11 = (void *)MEMORY[0x1E0DC3448];
  PUI_LocalizedStringForAppReport(CFSTR("CANCEL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addAction:", v13);
  -[PUIReportWebsiteListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

uint64_t __49__PUIReportWebsiteListController_sortByWasTapped__block_invoke(uint64_t a1)
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

uint64_t __49__PUIReportWebsiteListController_sortByWasTapped__block_invoke_2(uint64_t a1)
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

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v7 = objc_alloc(MEMORY[0x1E0D651A8]);
  PUI_LocalizedStringForAppReport(CFSTR("LEARN_MORE_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTitle:detailText:symbolName:contentLayout:", v8, 0, 0, 2);

  PUI_LocalizedStringForAppReport(CFSTR("LEARN_MORE_TEXT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSectionWithHeader:content:", 0, v10);

  v11 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v12 = (void *)MEMORY[0x1E0DC3428];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __85__PUIReportWebsiteListController_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
  v19[3] = &unk_1EA26BF60;
  v20 = v9;
  v13 = v9;
  objc_msgSend(v12, "actionWithHandler:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithBarButtonSystemItem:primaryAction:", 0, v14);

  objc_msgSend(v13, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRightBarButtonItem:", v15);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v13);
  -[PUIReportWebsiteListController presentModalViewController:withTransition:](self, "presentModalViewController:withTransition:", v17, 3);

  return 0;
}

void __85__PUIReportWebsiteListController_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (NSArray)cachedSpecifiers
{
  return self->_cachedSpecifiers;
}

- (void)setCachedSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSpecifiers, a3);
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
  objc_storeStrong((id *)&self->_cachedSpecifiers, 0);
}

@end

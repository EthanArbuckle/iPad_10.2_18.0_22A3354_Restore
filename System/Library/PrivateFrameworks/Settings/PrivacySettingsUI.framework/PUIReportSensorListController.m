@implementation PUIReportSensorListController

+ (id)appSpecifiersFromManager:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v37;
  id v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[5];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setUnitsStyle:", 2);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v3, "allEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIDsAndLatestDatesFromEvents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v47 = v7;
  objc_msgSend(v7, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v48)
  {
    v44 = *(_QWORD *)v55;
    v43 = *MEMORY[0x1E0D808C0];
    v42 = *MEMORY[0x1E0D808D0];
    v41 = *MEMORY[0x1E0D80780];
    v40 = *MEMORY[0x1E0D80990];
    v37 = v4;
    v38 = v3;
    v45 = v5;
    do
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v55 != v44)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v9, 0, 0);
        objc_msgSend(v10, "localizedName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)MEMORY[0x1E0D804E8];
        if (objc_msgSend(v11, "length"))
          v13 = v11;
        else
          v13 = v9;
        objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, a1, 0, sel_valueForSpecifier_, objc_opt_class(), 2, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setIdentifier:", v9);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, CFSTR("PUIReportAppIDKey"));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, v43);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v42);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v3, CFSTR("PUIReportSensorManagerKey"));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_opt_class(), v41);
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __58__PUIReportSensorListController_appSpecifiersFromManager___block_invoke;
        v53[3] = &unk_1EA26BDF0;
        v53[4] = v9;
        objc_msgSend(v3, "eventsFiltered:", v53);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "categoriesAndLatestDatesFromEvents:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "allKeys");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v47, "objectForKeyedSubscript:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "localizedStringForDate:relativeToDate:", v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v50 = v11;
        if (objc_msgSend(v16, "count") == 1)
        {
          v20 = (void *)MEMORY[0x1E0CB3940];
          PUI_LocalizedStringForAppReport(CFSTR("TIME_AND_CATEGORY_1"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_opt_class();
          objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "localizedStringForCategory:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", v21, v19, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v26 = objc_msgSend(v16, "count");
          v27 = (void *)MEMORY[0x1E0CB3940];
          if (v26 == 2)
          {
            PUI_LocalizedStringForAppReport(CFSTR("TIME_AND_CATEGORY_2"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)objc_opt_class();
            objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "localizedStringForCategory:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = (void *)objc_opt_class();
            objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "localizedStringForCategory:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringWithFormat:", v21, v19, v24, v31);
          }
          else
          {
            PUI_LocalizedStringForAppReport(CFSTR("TIME_AND_CATEGORY_3"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = (void *)objc_opt_class();
            objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "localizedStringForCategory:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (void *)objc_opt_class();
            objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "localizedStringForCategory:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "localizedStringWithFormat:", v21, v19, v24, v31, objc_msgSend(v16, "count") - 2);
          }
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v4 = v37;
          v3 = v38;
        }

        objc_msgSend(v14, "setObject:forKeyedSubscript:", v25, v40);
        v5 = v45;
        objc_msgSend(v45, "addObject:", v14);

      }
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v48);
  }

  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __58__PUIReportSensorListController_appSpecifiersFromManager___block_invoke_2;
  v51[3] = &unk_1EA26BE18;
  v52 = v47;
  v34 = v4;
  v35 = v47;
  objc_msgSend(v5, "sortUsingComparator:", v51);

  return v5;
}

uint64_t __58__PUIReportSensorListController_appSpecifiersFromManager___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "access");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  return v6;
}

uint64_t __58__PUIReportSensorListController_appSpecifiersFromManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(a3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "compare:", v11);

  return v12;
}

+ (id)valueForSpecifier:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D80990]);
}

- (PUIReportSensorListController)init
{
  PUIReportSensorListController *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUIReportSensorListController;
  v2 = -[PUIReportSensorListController init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_dataDidChange, CFSTR("PUIReportSensorManagerDataHasChangedNotification"), 0);

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
  v4.super_class = (Class)PUIReportSensorListController;
  -[PUIReportSensorListController dealloc](&v4, sel_dealloc);
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
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[PUIReportSensorListController manager](self, "manager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[PUIReportSensorListController specifier](self, "specifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PUIReportSensorManagerKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIReportSensorListController setManager:](self, "setManager:", v7);

    }
    PUI_LocalizedStringForAppReport(CFSTR("DATA_SENSOR_ACCESS_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportSensorListController setTitle:](self, "setTitle:", v8);

    v9 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PUI_LocalizedStringForAppReport(CFSTR("SORT_BY"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithTitle:style:target:action:", v10, 0, self, sel_sortByWasTapped);
    -[PUIReportSensorListController navigationItem](self, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRightBarButtonItem:", v11);

    v13 = (void *)objc_opt_new();
    if (-[PUIReportSensorListController alphabeticalSort](self, "alphabeticalSort"))
    {
      v14 = &stru_1EA26D430;
    }
    else
    {
      PUI_LocalizedStringForAppReport(CFSTR("MOST_RECENT_ACCESS"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:name:", CFSTR("HEADER_GROUP"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v15);
    v16 = (void *)objc_opt_class();
    -[PUIReportSensorListController manager](self, "manager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appSpecifiersFromManager:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");

    if (-[PUIReportSensorListController alphabeticalSort](self, "alphabeticalSort"))
      objc_msgSend(v19, "sortUsingComparator:", &__block_literal_global_17);
    objc_msgSend(v13, "addObjectsFromArray:", v19);
    v20 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v13;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

uint64_t __43__PUIReportSensorListController_specifiers__block_invoke(uint64_t a1, void *a2, void *a3)
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
  PUI_LocalizedStringForAppReport(CFSTR("RECENT_ACCESS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__PUIReportSensorListController_sortByWasTapped__block_invoke;
  v15[3] = &unk_1EA26B568;
  v15[4] = self;
  objc_msgSend(v4, "actionWithTitle:style:handler:", v5, 0, v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_setChecked:", -[PUIReportSensorListController alphabeticalSort](self, "alphabeticalSort") ^ 1);
  objc_msgSend(v3, "addAction:", v7);
  v8 = (void *)MEMORY[0x1E0DC3448];
  PUI_LocalizedStringForAppReport(CFSTR("ALPHABETICAL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __48__PUIReportSensorListController_sortByWasTapped__block_invoke_2;
  v14[3] = &unk_1EA26B568;
  v14[4] = self;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_setChecked:", -[PUIReportSensorListController alphabeticalSort](self, "alphabeticalSort"));
  objc_msgSend(v3, "addAction:", v10);
  v11 = (void *)MEMORY[0x1E0DC3448];
  PUI_LocalizedStringForAppReport(CFSTR("CANCEL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addAction:", v13);
  -[PUIReportSensorListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

uint64_t __48__PUIReportSensorListController_sortByWasTapped__block_invoke(uint64_t a1)
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

uint64_t __48__PUIReportSensorListController_sortByWasTapped__block_invoke_2(uint64_t a1)
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

- (PUIReportSensorManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
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
  objc_storeStrong((id *)&self->_manager, 0);
}

@end

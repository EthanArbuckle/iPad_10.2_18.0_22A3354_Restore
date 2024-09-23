@implementation PUIReportDomainListController

+ (id)domainSpecifiersFromResults:(id)a3 showDates:(BOOL)a4 showAppAndWebsiteCounts:(BOOL)a5 app:(id)a6 appOther:(id)a7 website:(id)a8
{
  _BOOL4 v11;
  id v12;
  void *v13;
  id v14;
  unint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  const __CFString *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  _BOOL4 v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t v70[128];
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  uint64_t v76;

  v11 = a4;
  v76 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v54 = a6;
  v53 = a7;
  v52 = a8;
  v58 = v11;
  if (v11)
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setTimeStyle:", 1);
    v55 = v13;
    objc_msgSend(v13, "setDateStyle:", 1);
  }
  else
  {
    v55 = 0;
  }
  v59 = (void *)objc_opt_new();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v14 = v12;
  v51 = v14;
  v61 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  v15 = 0;
  if (v61)
  {
    v60 = *(_QWORD *)v67;
    v56 = *MEMORY[0x1E0D80780];
    do
    {
      for (i = 0; i != v61; ++i)
      {
        if (*(_QWORD *)v67 != v60)
          objc_enumerationMutation(v14);
        v17 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("domain"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("count"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
          v20 = CFSTR("count");
        else
          v20 = CFSTR("sumHits");
        objc_msgSend(v17, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "integerValue");

        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("domainOwner"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v18, "isEqualToString:", CFSTR("unnamed_domains")))
        {
          v28 = (void *)MEMORY[0x1E0D804E8];
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v18);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "_lp_simplifiedDisplayString");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v30, a1, 0, 0, objc_opt_class(), 2, 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_18;
        }
        _PUILoggingFacility();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v72 = "+[PUIReportDomainListController domainSpecifiersFromResults:showDates:showAppAndWebsiteCounts:app:appOther:website:]";
          v73 = 2112;
          v74 = v17;
          _os_log_impl(&dword_1DB1FB000, v24, OS_LOG_TYPE_DEFAULT, "%s: unnamed domains entry: %@", buf, 0x16u);
        }

        if (v22)
        {
          v25 = (void *)MEMORY[0x1E0D804E8];
          PUI_LocalizedStringForAppReport(CFSTR("UNNAMED_DOMAINS"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v26, a1, 0, 0, objc_opt_class(), 2, 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PUIReportDomainListShowIPAddresses"));
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v54, CFSTR("PUIReportDomainListEntries"));
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v53, CFSTR("PUIReportDomainListAppOther"));
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v52, CFSTR("PUIReportDomainListWebsite"));
LABEL_18:
          objc_msgSend(v27, "setIdentifier:", v18);
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v18, CFSTR("PUIReportDomainKey"));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v31, CFSTR("PUITrackerBarValueKey"));

          objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v32, CFSTR("PUITrackerBarColorKey"));

          objc_msgSend(v27, "setObject:forKeyedSubscript:", objc_opt_class(), v56);
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v23, CFSTR("PUIReportDomainDetailOwnerKey"));
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("domainType"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v33, CFSTR("PUIReportDomainDetailTrackerTypeKey"));

          if (v58)
          {
            v34 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("maxTimeStamp"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v35, "integerValue"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v55, "stringFromDate:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v23, "length"))
            {
              v38 = (void *)MEMORY[0x1E0CB3940];
              PUI_LocalizedStringForAppReport(CFSTR("TIME_AND_OWNER"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "stringWithFormat:", v39, v37, v23);
              v40 = (__CFString *)objc_claimAutoreleasedReturnValue();

              v14 = v51;
            }
            else
            {
              v40 = v37;
            }

          }
          else
          {
            v40 = v23;
          }
          if (-[__CFString length](v40, "length"))
            v41 = v40;
          else
            v41 = &stru_1EA26D430;
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v41, CFSTR("PUITrackerBarDomainOwnerKey"));
          if (v22 > v15)
            v15 = v22;
          objc_msgSend(v59, "addObject:", v27);

        }
      }
      v61 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    }
    while (v61);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v42 = v59;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v63 != v45)
          objc_enumerationMutation(v42);
        v47 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setObject:forKeyedSubscript:", v48, CFSTR("PUITrackerBarCapacityKey"));

      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    }
    while (v44);
  }

  v49 = (void *)objc_msgSend(v42, "copy");
  return v49;
}

+ (BOOL)domainSpecifiersWithLimit:(unint64_t)a3 showDates:(BOOL)a4 showAppAndWebsiteCounts:(BOOL)a5 showIPAddresses:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v7;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  _QWORD v20[4];
  id v21;
  id v22;
  BOOL v23;
  BOOL v24;

  v7 = a6;
  v12 = a7;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1EA27E6F0, *MEMORY[0x1E0DB04C8]);
  if (v7)
    v14 = 3;
  else
    v14 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0DB04C0]);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0DB04A8]);

  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __120__PUIReportDomainListController_domainSpecifiersWithLimit_showDates_showAppAndWebsiteCounts_showIPAddresses_completion___block_invoke;
  v20[3] = &unk_1EA26C388;
  v23 = a4;
  v24 = a5;
  v21 = v12;
  v22 = a1;
  v17 = v12;
  v18 = +[PUITrackingReportManager queryWithOptions:reply:](PUITrackingReportManager, "queryWithOptions:reply:", v13, v20);

  return v18;
}

void __120__PUIReportDomainListController_domainSpecifiersWithLimit_showDates_showAppAndWebsiteCounts_showIPAddresses_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = *(void **)(a1 + 40);
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("result"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domainSpecifiersFromResults:showDates:showAppAndWebsiteCounts:app:appOther:website:", v4, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), 0, 0, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v8, "count") != 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBool:forKey:", v5, CFSTR("PSUITrackerHasDataKey"));

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);

}

- (PUIReportDomainListController)init
{
  PUIReportDomainListController *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUIReportDomainListController;
  v2 = -[PUIReportDomainListController init](&v7, sel_init);
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
  v4.super_class = (Class)PUIReportDomainListController;
  -[PUIReportDomainListController dealloc](&v4, sel_dealloc);
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
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL8 v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v44;
  void *v45;
  void *v46;
  _QWORD v47[5];
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (v4)
    return v4;
  -[PUIReportDomainListController specifier](self, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PUIReportDomainListShowWebsiteAndAppCounts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportDomainListController setShowWebsiteAndAppCounts:](self, "setShowWebsiteAndAppCounts:", objc_msgSend(v6, "BOOLValue"));

  PUI_LocalizedStringForAppReport(CFSTR("MOST_CONTACTED_DOMAINS_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIReportDomainListController setTitle:](self, "setTitle:", v7);

  v8 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PUI_LocalizedStringForAppReport(CFSTR("SORT_BY"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithTitle:style:target:action:", v9, 0, self, sel_sortByWasTapped);
  -[PUIReportDomainListController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRightBarButtonItem:", v10);

  v12 = (void *)objc_opt_new();
  if (-[PUIReportDomainListController alphabeticalSort](self, "alphabeticalSort"))
  {
    v13 = &stru_1EA26D430;
  }
  else
  {
    PUI_LocalizedStringForAppReport(CFSTR("MOST_ACTIVE_DOMAIN"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:name:", CFSTR("HEADER_GROUP"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v14);
  -[PUIReportDomainListController cachedSpecifiers](self, "cachedSpecifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[PUIReportDomainListController specifier](self, "specifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PUIReportDomainListEntries"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUIReportDomainListController specifier](self, "specifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PUIReportDomainListAppOther"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUIReportDomainListController specifier](self, "specifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("PUIReportDomainListWebsite"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = v21;
    if (objc_msgSend(v17, "length"))
    {
      v22 = (void *)objc_opt_new();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", &unk_1EA27E708, *MEMORY[0x1E0DB04C8]);
      v23 = *MEMORY[0x1E0DB0490];
      v24 = v22;
      v25 = v17;
    }
    else if (objc_msgSend(v19, "length"))
    {
      v22 = (void *)objc_opt_new();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", &unk_1EA27E720, *MEMORY[0x1E0DB04C8]);
      v23 = *MEMORY[0x1E0DB0490];
      v24 = v22;
      v25 = v19;
    }
    else
    {
      if (!objc_msgSend(v21, "length"))
        goto LABEL_17;
      v22 = (void *)objc_opt_new();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", &unk_1EA27E738, *MEMORY[0x1E0DB04C8]);
      v23 = *MEMORY[0x1E0DB04D0];
      v24 = v22;
      v25 = v21;
    }
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, v23);
    if (v22)
    {
      -[PUIReportDomainListController specifier](self, "specifier");
      v44 = v3;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("PUIReportDomainListShowIPAddresses"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "BOOLValue");

      if (v28)
        v29 = 3;
      else
        v29 = 1;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0DB04C0]);
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __43__PUIReportDomainListController_specifiers__block_invoke;
      v48[3] = &unk_1EA26C3B0;
      v48[4] = self;
      v49 = v17;
      v50 = v19;
      v31 = v46;
      v51 = v46;
      +[PUITrackingReportManager queryWithOptions:reply:](PUITrackingReportManager, "queryWithOptions:reply:", v22, v48);

      v3 = v44;
      goto LABEL_18;
    }
LABEL_17:
    v32 = (void *)objc_opt_class();
    v33 = -[PUIReportDomainListController showWebsiteAndAppCounts](self, "showWebsiteAndAppCounts");
    -[PUIReportDomainListController specifier](self, "specifier");
    v45 = v19;
    v34 = v3;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("PUIReportDomainListShowIPAddresses"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "BOOLValue");
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __43__PUIReportDomainListController_specifiers__block_invoke_3;
    v47[3] = &unk_1EA26B500;
    v47[4] = self;
    objc_msgSend(v32, "domainSpecifiersWithLimit:showDates:showAppAndWebsiteCounts:showIPAddresses:completion:", 100, 0, v33, v37, v47);

    v3 = v34;
    v19 = v45;
    v31 = v46;
LABEL_18:

  }
  v38 = -[PUIReportDomainListController alphabeticalSort](self, "alphabeticalSort");
  -[PUIReportDomainListController cachedSpecifiers](self, "cachedSpecifiers");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v38)
  {
    objc_msgSend(v39, "sortedArrayUsingComparator:", &__block_literal_global_11);
    v41 = objc_claimAutoreleasedReturnValue();

    v40 = (void *)v41;
  }
  objc_msgSend(v12, "addObjectsFromArray:", v40);
  v42 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v12;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  return v4;
}

void __43__PUIReportDomainListController_specifiers__block_invoke(_QWORD *a1, void *a2)
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

  objc_msgSend(v4, "domainSpecifiersFromResults:showDates:showAppAndWebsiteCounts:app:appOther:website:", v5, 0, 0, a1[5], a1[6], a1[7]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__PUIReportDomainListController_specifiers__block_invoke_2;
  v8[3] = &unk_1EA26B438;
  v8[4] = a1[4];
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __43__PUIReportDomainListController_specifiers__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCachedSpecifiers:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

void __43__PUIReportDomainListController_specifiers__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__PUIReportDomainListController_specifiers__block_invoke_4;
  v5[3] = &unk_1EA26B438;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __43__PUIReportDomainListController_specifiers__block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "setCachedSpecifiers:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  v2 = (void *)objc_opt_class();
  v3 = objc_msgSend(*(id *)(a1 + 32), "showWebsiteAndAppCounts");
  objc_msgSend(*(id *)(a1 + 32), "specifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUIReportDomainListShowIPAddresses"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__PUIReportDomainListController_specifiers__block_invoke_5;
  v7[3] = &unk_1EA26B500;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "domainSpecifiersWithLimit:showDates:showAppAndWebsiteCounts:showIPAddresses:completion:", 0, 0, v3, v6, v7);

}

void __43__PUIReportDomainListController_specifiers__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__PUIReportDomainListController_specifiers__block_invoke_6;
  v5[3] = &unk_1EA26B438;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __43__PUIReportDomainListController_specifiers__block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCachedSpecifiers:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

uint64_t __43__PUIReportDomainListController_specifiers__block_invoke_7(uint64_t a1, void *a2, void *a3)
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
  -[PUIReportDomainListController setCachedSpecifiers:](self, "setCachedSpecifiers:", 0);
  -[PUIReportDomainListController reloadSpecifiers](self, "reloadSpecifiers");
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
  PUI_LocalizedStringForAppReport(CFSTR("MOST_ACTIVE_DOMAIN"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__PUIReportDomainListController_sortByWasTapped__block_invoke;
  v15[3] = &unk_1EA26B568;
  v15[4] = self;
  objc_msgSend(v4, "actionWithTitle:style:handler:", v5, 0, v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_setChecked:", -[PUIReportDomainListController alphabeticalSort](self, "alphabeticalSort") ^ 1);
  objc_msgSend(v3, "addAction:", v7);
  v8 = (void *)MEMORY[0x1E0DC3448];
  PUI_LocalizedStringForAppReport(CFSTR("ALPHABETICAL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __48__PUIReportDomainListController_sortByWasTapped__block_invoke_2;
  v14[3] = &unk_1EA26B568;
  v14[4] = self;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_setChecked:", -[PUIReportDomainListController alphabeticalSort](self, "alphabeticalSort"));
  objc_msgSend(v3, "addAction:", v10);
  v11 = (void *)MEMORY[0x1E0DC3448];
  PUI_LocalizedStringForAppReport(CFSTR("CANCEL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addAction:", v13);
  -[PUIReportDomainListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

uint64_t __48__PUIReportDomainListController_sortByWasTapped__block_invoke(uint64_t a1)
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

uint64_t __48__PUIReportDomainListController_sortByWasTapped__block_invoke_2(uint64_t a1)
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

- (BOOL)alphabeticalSort
{
  return self->_alphabeticalSort;
}

- (void)setAlphabeticalSort:(BOOL)a3
{
  self->_alphabeticalSort = a3;
}

- (BOOL)showWebsiteAndAppCounts
{
  return self->_showWebsiteAndAppCounts;
}

- (void)setShowWebsiteAndAppCounts:(BOOL)a3
{
  self->_showWebsiteAndAppCounts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSpecifiers, 0);
}

@end

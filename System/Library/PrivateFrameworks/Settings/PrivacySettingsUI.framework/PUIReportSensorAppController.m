@implementation PUIReportSensorAppController

- (PUIReportSensorAppController)init
{
  PUIReportSensorAppController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUIReportSensorAppController;
  v2 = -[PUIReportSensorAppController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_dataDidChange, CFSTR("PUIReportSensorManagerDataHasChangedNotification"), 0);

  }
  return v2;
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[5];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  if (!v3)
  {
    v48 = (int)*MEMORY[0x1E0D80590];
    v57 = (void *)objc_opt_new();
    v4 = (void *)objc_opt_new();
    -[PUIReportSensorAppController bundleID](self, "bundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[PUIReportSensorAppController specifier](self, "specifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PUIReportAppIDKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIReportSensorAppController setBundleID:](self, "setBundleID:", v7);

      -[PUIReportSensorAppController specifier](self, "specifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PUIReportSensorManagerKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIReportSensorAppController setManager:](self, "setManager:", v9);

    }
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportSensorAppController bundleID](self, "bundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PUIAnalyticsLogView(v11, v12, 0);

    -[PUIReportSensorAppController manager](self, "manager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __42__PUIReportSensorAppController_specifiers__block_invoke;
    v64[3] = &unk_1EA26BDF0;
    v64[4] = self;
    objc_msgSend(v13, "eventsFiltered:", v64);
    v14 = objc_claimAutoreleasedReturnValue();

    -[PUIReportSensorAppController manager](self, "manager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)v14;
    objc_msgSend(v15, "categoriesAndLatestDatesFromEvents:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForAppReport(CFSTR("PAST_7_DAYS"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "groupSpecifierWithID:name:", CFSTR("CATEGORIES"), v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v47 = v4;
    v45 = (void *)v19;
    objc_msgSend(v4, "addObject:", v19);
    v55 = (void *)objc_opt_new();
    v56 = v16;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    objc_msgSend(v16, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    if (v20)
    {
      v21 = v20;
      v54 = *(_QWORD *)v61;
      v52 = *MEMORY[0x1E0D80880];
      v53 = *MEMORY[0x1E0D808D0];
      v50 = *MEMORY[0x1E0D808C0];
      v49 = *MEMORY[0x1E0D80870];
      v22 = *MEMORY[0x1E0D80990];
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v61 != v54)
            objc_enumerationMutation(obj);
          v24 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v23);
          v25 = (void *)MEMORY[0x1E0D804E8];
          +[PUIReportSensorManager localizedStringForCategory:](PUIReportSensorManager, "localizedStringForCategory:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v26, self, 0, sel_valueForSpecifier_, objc_opt_class(), 2, 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "setIdentifier:", v24);
          -[PUIReportSensorAppController manager](self, "manager");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("PUIReportSensorManagerKey"));

          -[PUIReportSensorAppController bundleID](self, "bundleID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, CFSTR("PUIReportAppIDKey"));

          +[PUIReportSensorManager iconTypeIdentifierForCategory:](PUIReportSensorManager, "iconTypeIdentifierForCategory:", v24);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            +[PUIReportSensorManager iconTypeIdentifierForCategory:](PUIReportSensorManager, "iconTypeIdentifierForCategory:", v24);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v27;
            v33 = v31;
            v34 = v52;
LABEL_13:
            objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, v34);

            objc_msgSend(v27, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v53);
            goto LABEL_14;
          }
          +[PUIReportSensorManager applicationBundleIdentifierForCategory:](PUIReportSensorManager, "applicationBundleIdentifierForCategory:", v24);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            +[PUIReportSensorManager applicationBundleIdentifierForCategory:](PUIReportSensorManager, "applicationBundleIdentifierForCategory:", v24);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v27;
            v33 = v31;
            v34 = v50;
            goto LABEL_13;
          }
          +[PUIReportSensorManager iconForCategory:](PUIReportSensorManager, "iconForCategory:", v24);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v39, v49);

LABEL_14:
          objc_msgSend(v56, "objectForKeyedSubscript:", v24);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "localizedStringForDate:relativeToDate:", v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v38, v22);

          objc_msgSend(v55, "addObject:", v27);
          ++v23;
        }
        while (v21 != v23);
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
        v21 = v40;
      }
      while (v40);
    }

    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __42__PUIReportSensorAppController_specifiers__block_invoke_2;
    v58[3] = &unk_1EA26BE18;
    v59 = v56;
    v41 = v56;
    objc_msgSend(v55, "sortUsingComparator:", v58);
    objc_msgSend(v47, "addObjectsFromArray:", v55);
    v42 = *(Class *)((char *)&self->super.super.super.super.super.isa + v48);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v48) = (Class)v47;
    v43 = v47;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v48);
  }
  return v3;
}

uint64_t __42__PUIReportSensorAppController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "access");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

uint64_t __42__PUIReportSensorAppController_specifiers__block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (id)valueForSpecifier:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D80990]);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (PUIReportSensorManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end

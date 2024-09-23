@implementation PUIReportSensorEventsController

- (PUIReportSensorEventsController)init
{
  PUIReportSensorEventsController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUIReportSensorEventsController;
  v2 = -[PUIReportSensorEventsController init](&v5, sel_init);
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
  PUIReportSensorEventsController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
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
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  PUIReportSensorEventsController *v64;
  void *v65;
  uint64_t v66;
  id obj;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[5];
  uint8_t buf[4];
  const char *v79;
  __int16 v80;
  void *v81;
  _BYTE v82[128];
  uint64_t v83;

  v2 = self;
  v83 = *MEMORY[0x1E0C80C00];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  if (!v3)
  {
    v59 = (int)*MEMORY[0x1E0D80590];
    v4 = (void *)objc_opt_new();
    -[PUIReportSensorEventsController category](v2, "category");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[PUIReportSensorEventsController specifier](v2, "specifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIReportSensorEventsController setCategory:](v2, "setCategory:", v7);

      -[PUIReportSensorEventsController specifier](v2, "specifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PUIReportAppIDKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIReportSensorEventsController setBundleID:](v2, "setBundleID:", v9);

      -[PUIReportSensorEventsController specifier](v2, "specifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PUIReportSensorManagerKey"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIReportSensorEventsController setManager:](v2, "setManager:", v11);

    }
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportSensorEventsController bundleID](v2, "bundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportSensorEventsController category](v2, "category");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PUIAnalyticsLogView(v13, v14, v15);

    -[PUIReportSensorEventsController manager](v2, "manager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __45__PUIReportSensorEventsController_specifiers__block_invoke;
    v77[3] = &unk_1EA26BDF0;
    v77[4] = v2;
    objc_msgSend(v16, "eventsFiltered:", v77);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "sortedArrayUsingComparator:", &__block_literal_global_4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("EVENTS_HEADER_GROUP"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportSensorEventsController category](v2, "category");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIReportSensorEventsController headerForCategory:](v2, "headerForCategory:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D80848]);

    v57 = v19;
    objc_msgSend(v4, "addObject:", v19);
    v22 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForAppReport(CFSTR("PAST_7_DAYS"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "groupSpecifierWithID:name:", CFSTR("EVENTS_GROUP"), v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v58 = v4;
    v56 = (void *)v24;
    objc_msgSend(v4, "addObject:", v24);
    v25 = (void *)objc_opt_new();
    objc_msgSend(v25, "setTimeStyle:", 0);
    objc_msgSend(v25, "setDateStyle:", 2);
    v70 = v25;
    objc_msgSend(v25, "setDoesRelativeDateFormatting:", 1);
    v26 = (void *)objc_opt_new();
    objc_msgSend(v26, "setTimeStyle:", 1);
    v69 = v26;
    objc_msgSend(v26, "setDateStyle:", 0);
    v27 = (void *)objc_opt_new();
    objc_msgSend(v27, "setDateStyle:", 0);
    v65 = v27;
    objc_msgSend(v27, "setTimeStyle:", 1);
    v71 = (void *)objc_opt_new();
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    obj = v18;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    if (v28)
    {
      v29 = v28;
      v72 = *(_QWORD *)v74;
      v68 = *MEMORY[0x1E0D80990];
      v63 = *MEMORY[0x1E0D80C98];
      v61 = *MEMORY[0x1E0D80CA0];
      v62 = *MEMORY[0x1E0D80CB0];
      v64 = v2;
      do
      {
        v30 = 0;
        v66 = v29;
        do
        {
          if (*(_QWORD *)v74 != v72)
            objc_enumerationMutation(obj);
          v31 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v30);
          objc_msgSend(v31, "access");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "identifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "UUIDString");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_1EA26D430, v2, 0, sel_valueForSpecifier_, 0, 4, 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v36 = v31;
            v37 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v36, "startTime");
            objc_msgSend(v37, "dateWithTimeIntervalSinceReferenceDate:");
            v38 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "stringFromDate:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "access");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v40, "accessCount"))
            {
              if (isGreenTeaSKU_once != -1)
                dispatch_once(&isGreenTeaSKU_once, &__block_literal_global_75);
              v41 = isGreenTeaSKU_deviceIsChinaSKU;

              if (v41)
              {
                v42 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v36, "access");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "localizedStringWithFormat:", CFSTR("%@ (%lu)"), v39, objc_msgSend(v43, "accessCount"));
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_30;
              }
            }
            else
            {

            }
            v46 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v36, "endTime");
            objc_msgSend(v46, "dateWithTimeIntervalSinceReferenceDate:");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "stringFromDate:toDate:", v38, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (isGreenTeaSKU_once != -1)
              dispatch_once(&isGreenTeaSKU_once, &__block_literal_global_75);
            if (isGreenTeaSKU_deviceIsChinaSKU && !objc_msgSend(v71, "count"))
            {
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v63, v62, v61, 0);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              -[PUIReportSensorEventsController category](v2, "category");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v47, "containsObject:", v48) & 1) != 0)
              {
                v60 = objc_msgSend(v44, "isEqualToString:", v39);

                if ((v60 & 1) == 0)
                {
                  v49 = (void *)MEMORY[0x1E0D804E8];
                  objc_msgSend(v70, "stringFromDate:", v38);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v50, v64, 0, sel_valueForSpecifier_, 0, 4, 0);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v69, "stringFromDate:", v43);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "setObject:forKeyedSubscript:", v51, v68);

                  objc_msgSend(v71, "addObject:", v47);
                  goto LABEL_28;
                }
              }
              else
              {

LABEL_28:
              }
              v2 = v64;
            }
LABEL_30:
            objc_msgSend(v35, "setObject:forKeyedSubscript:", v44, v68);

            v29 = v66;
LABEL_31:

            objc_msgSend(v35, "setIdentifier:", v34);
            objc_msgSend(v70, "stringFromDate:", v38);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setName:", v52);

            objc_msgSend(v71, "addObject:", v35);
            goto LABEL_32;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v45 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v31, "startTime");
            objc_msgSend(v45, "dateWithTimeIntervalSinceReferenceDate:");
            v38 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "stringFromDate:", v38);
            v36 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setObject:forKeyedSubscript:", v36, v68);
            goto LABEL_31;
          }
          _PUILoggingFacility();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v79 = "-[PUIReportSensorEventsController specifiers]";
            v80 = 2112;
            v81 = v31;
            _os_log_impl(&dword_1DB1FB000, v38, OS_LOG_TYPE_DEFAULT, "%s: Unrecognized record type, %@", buf, 0x16u);
          }
LABEL_32:

          ++v30;
        }
        while (v29 != v30);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
      }
      while (v29);
    }

    objc_msgSend(v58, "addObjectsFromArray:", v71);
    v53 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v59);
    *(Class *)((char *)&v2->super.super.super.super.super.isa + v59) = (Class)v58;
    v54 = v58;

    v3 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v59);
  }
  return v3;
}

uint64_t __45__PUIReportSensorEventsController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(v3, "access");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v7))
  {
    objc_msgSend(v3, "access");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "category");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "category");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

BOOL __45__PUIReportSensorEventsController_specifiers__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  _BOOL8 v9;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "startTime");
    v7 = v6;
  }
  else
  {
    v7 = 1.79769313e308;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    objc_msgSend(v5, "startTime");
  else
    v8 = 1.79769313e308;
  v9 = v7 < v8;

  return v9;
}

- (id)headerForCategory:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  __CFString *v10;
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0D80CB0];
  v12[0] = *MEMORY[0x1E0D80C98];
  v12[1] = v4;
  v13[0] = CFSTR("EVENTS_HEADER_TEXT_LOCATION");
  v13[1] = CFSTR("EVENTS_HEADER_TEXT_PHOTOS");
  v5 = *MEMORY[0x1E0D80CA8];
  v12[2] = *MEMORY[0x1E0D80C88];
  v12[3] = v5;
  v13[2] = CFSTR("EVENTS_HEADER_TEXT_CAMERA");
  v13[3] = CFSTR("EVENTS_HEADER_TEXT_MICROPHONE");
  v6 = *MEMORY[0x1E0D80CA0];
  v12[4] = *MEMORY[0x1E0D80C90];
  v12[5] = v6;
  v13[4] = CFSTR("EVENTS_HEADER_TEXT_CONTACTS");
  v13[5] = CFSTR("EVENTS_HEADER_TEXT_MEDIA_LIBRARY");
  v12[6] = *MEMORY[0x1E0D80CB8];
  v13[6] = CFSTR("EVENTS_HEADER_TEXT_SCREEN_RECORDING");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v3);
    v9 = objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForAppReport(v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _PUILoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PUIReportSensorEventsController headerForCategory:].cold.1((uint64_t)v3, v9);
    v10 = &stru_1EA26D430;
  }

  return v10;
}

- (id)valueForSpecifier:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D80990]);
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
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
  objc_storeStrong((id *)&self->_category, 0);
}

- (void)headerForCategory:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[PUIReportSensorEventsController headerForCategory:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1DB1FB000, a2, OS_LOG_TYPE_ERROR, "%s: no header string for category: %@", (uint8_t *)&v2, 0x16u);
}

@end

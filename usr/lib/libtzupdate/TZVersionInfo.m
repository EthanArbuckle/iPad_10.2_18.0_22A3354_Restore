@implementation TZVersionInfo

+ (id)versionInfoFromContainerDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (!v4 && +[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 0))
    NSLog(CFSTR("%s  Container is null"), "+[TZVersionInfo versionInfoFromContainerDirectory:]");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_16;
  if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
    NSLog(CFSTR("%s  Initializing versionInfo from container directory %@"), "+[TZVersionInfo versionInfoFromContainerDirectory:]", v4);
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("versions.plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if ((v9 & 1) == 0)
  {
    if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 0))
      NSLog(CFSTR("%s  Directory Contents of local URL %@ empty!"), "+[TZVersionInfo versionInfoFromContainerDirectory:]", v4);
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfURL:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v5 = 0;
    if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog(CFSTR("%s  Could not get contents of URL %@"), "+[TZVersionInfo versionInfoFromContainerDirectory:]", v6);
      v5 = 0;
    }
LABEL_15:

LABEL_16:
    v13 = 0;
    goto LABEL_17;
  }

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BundleVersion"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("BundleVersion"));

    objc_msgSend(a1, "versionInfoWithDictionary:isPartial:", v10, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v5 = v10;
LABEL_17:

  return v13;
}

+ (id)versionInfoFromDefaultSystem
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("DataVersion");
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneDataVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("BundleVersion");
  v8[0] = v3;
  v8[1] = CFSTR("1.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "versionInfoWithDictionary:isPartial:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)blankVersionInfo
{
  if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
    NSLog(CFSTR("%s  Initializing blank VersionInfo"), "+[TZVersionInfo blankVersionInfo]");
  return (id)objc_msgSend(a1, "versionInfoWithDictionary:isPartial:", MEMORY[0x1E0C9AA70], 1);
}

+ (TZVersionInfo)versionInfoWithDictionary:(id)a3 isPartial:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
    NSLog(CFSTR("%s  Initializing VersionInfo with dictionary: %@. Partial? %d"), "+[TZVersionInfo versionInfoWithDictionary:isPartial:]", v6, v4);
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithVersionInfoDictionary:isPartial:", v6, v4);

  return (TZVersionInfo *)v7;
}

- (id)_initWithVersionInfoDictionary:(id)a3 isPartial:(BOOL)a4
{
  id v6;
  TZVersionInfo *v7;
  NSArray *changedFiles;
  uint64_t v9;
  NSDictionary *alertZones;
  uint64_t v11;
  NSString *tzDataVersion;
  uint64_t v13;
  NSString *bundleVersion;
  uint64_t v15;
  NSNumber *shouldAlertAll;
  uint64_t v17;
  NSString *icuTZSchemaVersion;
  NSURL *diskLocation;
  TZVersionInfo *v20;
  objc_super v22;

  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TZVersionInfo;
  v7 = -[TZVersionInfo init](&v22, sel_init);
  if (!v7)
    goto LABEL_5;
  if (a4
    || +[TZVersionInfo _verifyVersionInfoDictionary:](TZVersionInfo, "_verifyVersionInfoDictionary:", v6))
  {
    changedFiles = v7->_changedFiles;
    v7->_changedFiles = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AlertZones"));
    v9 = objc_claimAutoreleasedReturnValue();
    alertZones = v7->_alertZones;
    v7->_alertZones = (NSDictionary *)v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DataVersion"));
    v11 = objc_claimAutoreleasedReturnValue();
    tzDataVersion = v7->_tzDataVersion;
    v7->_tzDataVersion = (NSString *)v11;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BundleVersion"));
    v13 = objc_claimAutoreleasedReturnValue();
    bundleVersion = v7->_bundleVersion;
    v7->_bundleVersion = (NSString *)v13;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ShouldAlertAll"));
    v15 = objc_claimAutoreleasedReturnValue();
    shouldAlertAll = v7->_shouldAlertAll;
    v7->_shouldAlertAll = (NSNumber *)v15;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ICUTZSchemaVersion"));
    v17 = objc_claimAutoreleasedReturnValue();
    icuTZSchemaVersion = v7->_icuTZSchemaVersion;
    v7->_icuTZSchemaVersion = (NSString *)v17;

    diskLocation = v7->_diskLocation;
    v7->_diskLocation = 0;

LABEL_5:
    v20 = v7;
    goto LABEL_6;
  }
  v20 = 0;
  if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 0))
  {
    NSLog(CFSTR("%s  VersionInfo Plist is malformed"), "-[TZVersionInfo _initWithVersionInfoDictionary:isPartial:]");
    v20 = 0;
  }
LABEL_6:

  return v20;
}

- (NSString)versionString
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[TZVersionInfo tzDataVersion](self, "tzDataVersion");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[TZVersionInfo bundleVersion](self, "bundleVersion"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[TZVersionInfo tzDataVersion](self, "tzDataVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TZVersionInfo bundleVersion](self, "bundleVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%@"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[TZVersionInfo tzDataVersion](self, "tzDataVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v9 = 0;
      return (NSString *)v9;
    }
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[TZVersionInfo tzDataVersion](self, "tzDataVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v9;
}

+ (BOOL)_verifyVersionInfoDictionary:(id)a3
{
  id v3;
  unint64_t v4;
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
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char isKindOfClass;
  _BOOL4 v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  char v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  uint64_t v52;
  _BOOL4 v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  const __CFString *v76;
  const __CFString *v77;
  _QWORD v78[5];

  v78[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = 0x1EA3F4000uLL;
  if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
    NSLog(CFSTR("%s  Starting versionInfo verification"), "+[TZVersionInfo _verifyVersionInfoDictionary:]");
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v78[0] = CFSTR("DataVersion");
    v78[1] = CFSTR("BundleVersion");
    v78[2] = CFSTR("ICUTZSchemaVersion");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0C99E60];
    v77 = CFSTR("ShouldAlertAll");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0C99E60];
    v76 = CFSTR("AlertZones");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setByAddingObjectsFromSet:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setByAddingObjectsFromSet:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v3, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v18, "isEqualToSet:", v15) & 1) != 0)
    {
      v58 = v18;
      v59 = v10;
      v56 = v15;
      v57 = v7;
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v19 = v7;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
      v60 = v13;
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v70;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v70 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
            objc_msgSend(v3, "objectForKeyedSubscript:", v24);
            v25 = objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v26 = (void *)v25;
              objc_msgSend(v3, "objectForKeyedSubscript:", v24);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0)
                continue;
            }
            v4 = 0x1EA3F4000uLL;
            if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
              NSLog(CFSTR("%s  Key %@ is not a string"), "+[TZVersionInfo _verifyVersionInfoDictionary:]", v24);
            v29 = 0;
            v13 = v60;
            goto LABEL_25;
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
          v29 = 1;
          v4 = 0x1EA3F4000;
          v13 = v60;
          if (v21)
            continue;
          break;
        }
      }
      else
      {
        v29 = 1;
      }
LABEL_25:

      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v30 = v59;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
      if (v31)
      {
        v32 = v31;
        v54 = v29;
        v33 = *(_QWORD *)v66;
        while (2)
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v66 != v33)
              objc_enumerationMutation(v30);
            v35 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j);
            objc_msgSend(v3, "objectForKeyedSubscript:", v35);
            v36 = objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              v37 = (void *)v36;
              objc_msgSend(v3, "objectForKeyedSubscript:", v35);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v39 = objc_opt_isKindOfClass();

              if ((v39 & 1) != 0)
                continue;
            }
            v4 = 0x1EA3F4000uLL;
            if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
              NSLog(CFSTR("%s  Key %@ is not a number"), "+[TZVersionInfo _verifyVersionInfoDictionary:]", v35);
            v29 = 0;
            v13 = v60;
            goto LABEL_38;
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
          if (v32)
            continue;
          break;
        }
        v4 = 0x1EA3F4000;
        v13 = v60;
        v18 = v58;
        v29 = v54;
      }
      else
      {
LABEL_38:
        v18 = v58;
      }

      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v40 = v13;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
      if (v41)
      {
        v42 = v41;
        v55 = v29;
        v43 = *(_QWORD *)v62;
LABEL_41:
        v44 = 0;
        while (1)
        {
          if (*(_QWORD *)v62 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v44);
          objc_msgSend(v3, "objectForKeyedSubscript:", v45);
          v46 = objc_claimAutoreleasedReturnValue();
          if (!v46)
            break;
          v47 = (void *)v46;
          objc_msgSend(v3, "objectForKeyedSubscript:", v45);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v49 = objc_opt_isKindOfClass();

          if ((v49 & 1) == 0)
            break;
          if (objc_msgSend(v45, "isEqualToString:", CFSTR("AlertZones")))
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", v45);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "allValues");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v51, "indexOfObjectPassingTest:", &__block_literal_global_0);

            if (v52 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v4 = 0x1EA3F4000uLL;
              if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
                NSLog(CFSTR("%s  alertZones value is not an array"), "+[TZVersionInfo _verifyVersionInfoDictionary:]");
LABEL_57:
              v13 = v60;
              v15 = v56;
              v18 = v58;
              v29 = v55;
              goto LABEL_58;
            }
          }
          if (v42 == ++v44)
          {
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
            if (v42)
              goto LABEL_41;
            v4 = 0x1EA3F4000;
            goto LABEL_57;
          }
        }
        v4 = 0x1EA3F4000uLL;
        if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
          NSLog(CFSTR("%s  Key %@ is not a dictionary"), "+[TZVersionInfo _verifyVersionInfoDictionary:]", v45);
        v29 = 0;
        v13 = v60;
        v15 = v56;
        v18 = v58;
      }
      else
      {
        v15 = v56;
      }
LABEL_58:

      v7 = v57;
      v10 = v59;
    }
    else
    {
      if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
        NSLog(CFSTR("%s  VersionInfo keys: %@ don't match expected keys: %@"), "+[TZVersionInfo _verifyVersionInfoDictionary:]", v18, v15);
      v29 = 0;
    }

  }
  else
  {
    if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
      NSLog(CFSTR("%s  VersionInfo dictionary is nil"), "+[TZVersionInfo _verifyVersionInfoDictionary:]");
    v29 = 0;
  }
  if (objc_msgSend(*(id *)(v4 + 2432), "canLogMessageAtLevel:", 2))
    NSLog(CFSTR("%s  Plist verification completed. Valid? %d"), "+[TZVersionInfo _verifyVersionInfoDictionary:]", v29);

  return v29;
}

BOOL __46__TZVersionInfo__verifyVersionInfoDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  char isKindOfClass;

  v5 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    *a4 = 1;
  return (isKindOfClass & 1) == 0;
}

+ (id)_tzDataVersionFromZoneinfoDirectory:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  v5 = a3;
  if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
    NSLog(CFSTR("%s  Obtaining version string from zoneinfo directory %@"), "+[TZVersionInfo _tzDataVersionFromZoneinfoDirectory:withError:]", v5);
  if (!v5)
  {
    v10 = 0;
    if (!+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 0))
      goto LABEL_11;
    NSLog(CFSTR("%s  directory is nil"), "+[TZVersionInfo _tzDataVersionFromZoneinfoDirectory:withError:]");
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if (!v8)
    goto LABEL_10;
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("+VERSION"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[TZUtilities stringWithContentsOfFileAtURL:error:](TZUtilities, "stringWithContentsOfFileAtURL:error:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 1))
    NSLog(CFSTR("%s  Version string from directory %@ : %@"), "+[TZVersionInfo _tzDataVersionFromZoneinfoDirectory:withError:]", v5, v10);

LABEL_11:
  return v10;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[TZVersionInfo versionString](self, "versionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "versionString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:options:", v6, 64);
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[TZVersionInfo tzDataVersion](self, "tzDataVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TZVersionInfo bundleVersion](self, "bundleVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TZVersionInfo versionString](self, "versionString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("TZVersionInfo: tzDataVersion=%@, bundleVersion=%@, versionString=%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isBlank
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[TZVersionInfo icuTZSchemaVersion](self, "icuTZSchemaVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[TZVersionInfo tzDataVersion](self, "tzDataVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 0;
    }
    else
    {
      -[TZVersionInfo bundleVersion](self, "bundleVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v4 = 0;
      }
      else
      {
        -[TZVersionInfo changedFiles](self, "changedFiles");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v4 = 0;
        }
        else
        {
          -[TZVersionInfo alertZones](self, "alertZones");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v4 = 0;
          }
          else
          {
            -[TZVersionInfo versionString](self, "versionString");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9)
            {
              v4 = 0;
            }
            else
            {
              -[TZVersionInfo shouldAlertAll](self, "shouldAlertAll");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              if (v10)
              {
                v4 = 0;
              }
              else
              {
                -[TZVersionInfo diskLocation](self, "diskLocation");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                v4 = v11 == 0;

              }
            }

          }
        }

      }
    }

  }
  return v4;
}

- (NSString)tzDataVersion
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTzDataVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)bundleVersion
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)icuTZSchemaVersion
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIcuTZSchemaVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)changedFiles
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setChangedFiles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDictionary)alertZones
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAlertZones:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSNumber)shouldAlertAll
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setShouldAlertAll:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSURL)diskLocation
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDiskLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskLocation, 0);
  objc_storeStrong((id *)&self->_shouldAlertAll, 0);
  objc_storeStrong((id *)&self->_alertZones, 0);
  objc_storeStrong((id *)&self->_changedFiles, 0);
  objc_storeStrong((id *)&self->_icuTZSchemaVersion, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_tzDataVersion, 0);
}

@end

@implementation VTUIStringsHelper

+ (id)sharedStringsHelper
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__VTUIStringsHelper_sharedStringsHelper__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedStringsHelper_onceToken != -1)
    dispatch_once(&sharedStringsHelper_onceToken, block);
  return (id)sharedStringsHelper__sharedInstance;
}

void __40__VTUIStringsHelper_sharedStringsHelper__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedStringsHelper__sharedInstance;
  sharedStringsHelper__sharedInstance = (uint64_t)v1;

}

+ (void)initialize
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___VTUIStringsHelper;
  objc_msgSendSuper2(&v2, sel_initialize);
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_2);
}

void __31__VTUIStringsHelper_initialize__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("%SIRI_LANGUAGE__([^%]+)%"), 0, 0);
  v1 = (void *)__siriLangRegex;
  __siriLangRegex = v0;

}

- (VTUIStringsHelper)init
{
  VTUIStringsHelper *v2;
  VTUIStringsHelper *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VTUIStringsHelper;
  v2 = -[VTUIStringsHelper init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VTUIStringsHelper setupForCurrentLocaleAndSiriLanguage](v2, "setupForCurrentLocaleAndSiriLanguage");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_localeDidChange_, *MEMORY[0x24BDBCA70], 0);

  }
  return v3;
}

- (void)setupForCurrentLocaleAndSiriLanguage
{
  void *v3;
  NSDictionary *v4;
  NSDictionary *localizedStringTable;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
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
  void *v54;
  void *v55;
  NSString *siriLanguageCode;
  void *v57;
  void *v58;
  NSString *v59;
  NSString *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;

  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:](self, "_bundleStringTableForLanguages:inLocalizedStringsFileName:", v3, CFSTR("Localizable"));
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  localizedStringTable = self->_localizedStringTable;
  self->_localizedStringTable = v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_localizedStringTable);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:](self, "_bundleStringTableForLanguages:inLocalizedStringsFileName:", v6, CFSTR("Localizable-b364"));
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v90, "addEntriesFromDictionary:", v7);
    objc_storeStrong((id *)&self->_localizedStringTable, v90);
  }
  v87 = (void *)v7;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_localizedStringTable);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:](self, "_bundleStringTableForLanguages:inLocalizedStringsFileName:", v9, CFSTR("Localizable-b419"));
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "addEntriesFromDictionary:", v10);
    objc_storeStrong((id *)&self->_localizedStringTable, v8);
  }
  v86 = v8;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_localizedStringTable);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:](self, "_bundleStringTableForLanguages:inLocalizedStringsFileName:", v12, CFSTR("Localizable-b298"));
  v13 = objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v11, "addEntriesFromDictionary:", v13);
    objc_storeStrong((id *)&self->_localizedStringTable, v11);
  }
  v84 = v11;
  v83 = (void *)v13;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_localizedStringTable);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:](self, "_bundleStringTableForLanguages:inLocalizedStringsFileName:", v15, CFSTR("Localizable-b515"));
  v16 = objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v14, "addEntriesFromDictionary:", v16);
    objc_storeStrong((id *)&self->_localizedStringTable, v14);
  }
  v82 = (void *)v16;
  v88 = v14;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_localizedStringTable);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:](self, "_bundleStringTableForLanguages:inLocalizedStringsFileName:", v18, CFSTR("Localizable-Themis"));
  v19 = objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v17, "addEntriesFromDictionary:", v19);
    objc_storeStrong((id *)&self->_localizedStringTable, v17);
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_localizedStringTable);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:](self, "_bundleStringTableForLanguages:inLocalizedStringsFileName:", v21, CFSTR("Localizable-HomeAccessory"));
  v22 = objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v20, "addEntriesFromDictionary:", v22);
    objc_storeStrong((id *)&self->_localizedStringTable, v20);
  }
  v80 = (void *)v19;
  v85 = (void *)v10;
  v79 = (void *)v22;
  v89 = v20;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_localizedStringTable);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:](self, "_bundleStringTableForLanguages:inLocalizedStringsFileName:", v24, CFSTR("Localizable-b688"));
  v25 = objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v23, "addEntriesFromDictionary:", v25);
    objc_storeStrong((id *)&self->_localizedStringTable, v23);
  }
  v77 = (void *)v25;
  v78 = v23;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_localizedStringTable);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:](self, "_bundleStringTableForLanguages:inLocalizedStringsFileName:", v27, CFSTR("Localizable-b494"));
  v28 = objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v26, "addEntriesFromDictionary:", v28);
    objc_storeStrong((id *)&self->_localizedStringTable, v26);
  }
  v81 = v17;
  v75 = (void *)v28;
  v76 = v26;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_localizedStringTable);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:](self, "_bundleStringTableForLanguages:inLocalizedStringsFileName:", v30, CFSTR("Localizable-b698"));
  v31 = objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v29, "addEntriesFromDictionary:", v31);
    objc_storeStrong((id *)&self->_localizedStringTable, v29);
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_localizedStringTable);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:](self, "_bundleStringTableForLanguages:inLocalizedStringsFileName:", v33, CFSTR("Localizable-b607"));
  v34 = objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v32, "addEntriesFromDictionary:", v34);
    objc_storeStrong((id *)&self->_localizedStringTable, v32);
  }
  v71 = (void *)v34;
  v72 = v32;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_localizedStringTable);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:](self, "_bundleStringTableForLanguages:inLocalizedStringsFileName:", v36, CFSTR("Localizable-b453"));
  v37 = objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v35, "addEntriesFromDictionary:", v37);
    objc_storeStrong((id *)&self->_localizedStringTable, v35);
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_localizedStringTable);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:](self, "_bundleStringTableForLanguages:inLocalizedStringsFileName:", v39, CFSTR("Localizable-b698c"));
  v40 = objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(v38, "addEntriesFromDictionary:", v40);
    objc_storeStrong((id *)&self->_localizedStringTable, v38);
  }
  v67 = (void *)v40;
  v68 = v38;
  v74 = v29;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_localizedStringTable);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:](self, "_bundleStringTableForLanguages:inLocalizedStringsFileName:", v42, CFSTR("Localizable-b465"));
  v43 = objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_msgSend(v41, "addEntriesFromDictionary:", v43);
    objc_storeStrong((id *)&self->_localizedStringTable, v41);
  }
  v65 = (void *)v43;
  v66 = v41;
  v73 = (void *)v31;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_localizedStringTable);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:](self, "_bundleStringTableForLanguages:inLocalizedStringsFileName:", v45, CFSTR("Localizable-b498"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_msgSend(v44, "addEntriesFromDictionary:", v46);
    objc_storeStrong((id *)&self->_localizedStringTable, v44);
  }
  v70 = v35;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_localizedStringTable, v44);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:](self, "_bundleStringTableForLanguages:inLocalizedStringsFileName:", v48, CFSTR("Localizable-b515c"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend(v47, "addEntriesFromDictionary:", v49);
    objc_storeStrong((id *)&self->_localizedStringTable, v47);
  }
  v69 = (void *)v37;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_localizedStringTable);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:](self, "_bundleStringTableForLanguages:inLocalizedStringsFileName:", v51, CFSTR("Localizable-b768"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    objc_msgSend(v50, "addEntriesFromDictionary:", v52);
    objc_storeStrong((id *)&self->_localizedStringTable, v50);
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_localizedStringTable);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:](self, "_bundleStringTableForLanguages:inLocalizedStringsFileName:", v54, CFSTR("Localizable-GM"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    objc_msgSend(v53, "addEntriesFromDictionary:", v55);
    objc_storeStrong((id *)&self->_localizedStringTable, v53);
  }
  siriLanguageCode = self->_siriLanguageCode;
  v57 = v89;
  if (!siriLanguageCode)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "bestSupportedLanguageCodeForLanguageCode:", 0);
    v59 = (NSString *)objc_claimAutoreleasedReturnValue();
    v60 = self->_siriLanguageCode;
    self->_siriLanguageCode = v59;

    v57 = v89;
    siriLanguageCode = self->_siriLanguageCode;
  }
  -[VTUIStringsHelper setSiriLanguage:](self, "setSiriLanguage:", siriLanguageCode);
  v61 = v88;
  if (!self->_languageLocalizedStringTables)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "localeIdentifier");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStringsHelper setSiriLanguage:](self, "setSiriLanguage:", v63);

    v61 = v88;
    v57 = v89;
  }

}

- (void)setSiriLanguage:(id)a3
{
  NSString *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *languageLocalizedStringTables;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  NSString *heySiriTriggerPhrase;
  NSObject *v23;
  NSString *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  NSString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = (NSString *)a3;
  v6 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "-[VTUIStringsHelper setSiriLanguage:]";
    v33 = 2112;
    v34 = v5;
    _os_log_impl(&dword_229EF7000, v6, OS_LOG_TYPE_DEFAULT, "%s Setting Siri Language to: %@", buf, 0x16u);
  }
  objc_storeStrong((id *)&self->_siriLanguageCode, a3);
  if (v5)
  {
    v29 = 0;
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allSiriLanguageCodesForSystemLanguageCode:isGoodFit:", v5, &v29);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    objc_msgSend(v9, "addObject:", v5);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v9, "addObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v14++), (_QWORD)v25);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v12);
    }

    objc_msgSend(v9, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStringsHelper _bundleStringTableForAllValidLanguages:inLocalizedStringsFileName:](self, "_bundleStringTableForAllValidLanguages:inLocalizedStringsFileName:", v15, CFSTR("Localizable"));
    v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    languageLocalizedStringTables = self->_languageLocalizedStringTables;
    self->_languageLocalizedStringTables = v16;

    objc_msgSend(v9, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStringsHelper _bundleStringTableForAllValidLanguages:inLocalizedStringsFileName:](self, "_bundleStringTableForAllValidLanguages:inLocalizedStringsFileName:", v18, CFSTR("Localizable-b364"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary addEntriesFromDictionary:](self->_languageLocalizedStringTables, "addEntriesFromDictionary:", v19);
    objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedTriggerPhraseForLanguageCode:", v5);
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    heySiriTriggerPhrase = self->_heySiriTriggerPhrase;
    self->_heySiriTriggerPhrase = v21;

    v23 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_heySiriTriggerPhrase;
      *(_DWORD *)buf = 136315394;
      v32 = "-[VTUIStringsHelper setSiriLanguage:]";
      v33 = 2112;
      v34 = v24;
      _os_log_impl(&dword_229EF7000, v23, OS_LOG_TYPE_DEFAULT, "%s _heySiriTriggerPhrase set to %@", buf, 0x16u);
    }

  }
}

- (id)_bundleStringTableForLanguages:(id)a3 inLocalizedStringsFileName:(id)a4
{
  const __CFArray *v5;
  id v6;
  void *v7;
  CFArrayRef v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const __CFArray *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = (const __CFArray *)a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v8 = CFBundleCopyLocalizationsForPreferences((CFArrayRef)objc_msgSend(v7, "localizations"), v5);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __79__VTUIStringsHelper__bundleStringTableForLanguages_inLocalizedStringsFileName___block_invoke;
  v15[3] = &unk_24F33E128;
  v9 = v7;
  v16 = v9;
  v10 = v6;
  v17 = v10;
  v18 = &v19;
  -[__CFArray enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v15);
  v11 = (void *)v20[5];
  if (!v11)
  {
    v12 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:]";
      v27 = 2112;
      v28 = v5;
      _os_log_impl(&dword_229EF7000, v12, OS_LOG_TYPE_DEFAULT, "%s No bundle string table found for %@", buf, 0x16u);
    }
    v11 = (void *)v20[5];
  }
  v13 = v11;

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __79__VTUIStringsHelper__bundleStringTableForLanguages_inLocalizedStringsFileName___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "URLForResource:withExtension:subdirectory:localization:", *(_QWORD *)(a1 + 40), CFSTR("strings"), 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = (void *)VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    objc_msgSend(v7, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315650;
    v15 = "-[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:]_block_invoke";
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_229EF7000, v12, OS_LOG_TYPE_DEFAULT, "%s Loaded stringsTable for %@ : %@", (uint8_t *)&v14, 0x20u);

  }
  *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;

}

- (id)_bundleStringTableForAllValidLanguages:(id)a3 inLocalizedStringsFileName:(id)a4
{
  const __CFArray *v5;
  id v6;
  void *v7;
  CFArrayRef v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = (const __CFArray *)a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8 = CFBundleCopyLocalizationsForPreferences((CFArrayRef)objc_msgSend(v7, "localizations"), v5);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __87__VTUIStringsHelper__bundleStringTableForAllValidLanguages_inLocalizedStringsFileName___block_invoke;
  v13[3] = &unk_24F33E128;
  v9 = v7;
  v14 = v9;
  v10 = v6;
  v15 = v10;
  v16 = &v17;
  -[__CFArray enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __87__VTUIStringsHelper__bundleStringTableForAllValidLanguages_inLocalizedStringsFileName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "URLForResource:withExtension:subdirectory:localization:", *(_QWORD *)(a1 + 40), CFSTR("strings"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  if (v4)
  {
    objc_msgSend(*(id *)(v5 + 40), "setObject:forKey:", v4, v8);
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCE70]);
    objc_msgSend(v6, "setObject:forKey:", v7, v8);

  }
}

- (id)uiLocalizedStringForKey:(id)a3 usesMultipleTriggers:(BOOL)a4 siriVoice:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSString *justSiriTriggerPhrase;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSString *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  id v35;
  _QWORD v36[4];

  v6 = a4;
  v36[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (v6)
  {
    justSiriTriggerPhrase = self->_justSiriTriggerPhrase;
    self->_justSiriTriggerPhrase = (NSString *)CFSTR("Siri");

  }
  objc_msgSend(v9, "languageCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("he-IL")))
  {

    goto LABEL_6;
  }
  objc_msgSend(v9, "languageCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("ar-SA"));

  if (v13)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "gender") == 2)
    {
      v15 = CFSTR("_SIRI_FEMALE");
    }
    else
    {
      if (objc_msgSend(v9, "gender") != 1)
      {
LABEL_11:
        v16 = (void *)MEMORY[0x24BDBCEB8];
        v36[0] = v14;
        v36[1] = v8;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "arrayWithArray:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
      v15 = CFSTR("_SIRI_MALE");
    }
    objc_msgSend(v14, "appendString:", v15);
    goto LABEL_11;
  }
  v19 = (void *)MEMORY[0x24BDBCEB8];
  v35 = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "arrayWithArray:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = v18;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v21)
  {

LABEL_24:
    -[VTUIStringsHelper uiLocalizedStringForKey:](self, "uiLocalizedStringForKey:", v8, (_QWORD)v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  v22 = v21;
  v23 = 0;
  v24 = *(_QWORD *)v31;
LABEL_15:
  v25 = 0;
  v26 = v23;
  while (1)
  {
    if (*(_QWORD *)v31 != v24)
      objc_enumerationMutation(v20);
    v27 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v25);
    -[VTUIStringsHelper uiLocalizedStringForKey:](self, "uiLocalizedStringForKey:", v27, (_QWORD)v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v23, "isEqualToString:", v27))
      break;
    ++v25;
    v26 = v23;
    if (v22 == v25)
    {
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v22)
        goto LABEL_15;
      break;
    }
  }

  if (!v23)
    goto LABEL_24;
LABEL_25:
  v28 = self->_justSiriTriggerPhrase;
  self->_justSiriTriggerPhrase = 0;

  return v23;
}

- (id)uiLocalizedStringForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSString *justSiriTriggerPhrase;
  void *v8;
  void *v9;

  v4 = a3;
  -[NSDictionary objectForKey:](self->_localizedStringTable, "objectForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v5;
  justSiriTriggerPhrase = self->_justSiriTriggerPhrase;
  if (!justSiriTriggerPhrase)
  {
    justSiriTriggerPhrase = self->_heySiriTriggerPhrase;
    if (v5)
      goto LABEL_3;
LABEL_5:
    v6 = v4;
    goto LABEL_3;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%TRIGGER_PHRASE%"), justSiriTriggerPhrase);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[VTUIStringsHelper _siriLanguageSubstitutedString:](self, "_siriLanguageSubstitutedString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)siriLanguageStringForKey:(id)a3
{
  return -[VTUIStringsHelper uiLocalizedStringForKey:languageCode:](self, "uiLocalizedStringForKey:languageCode:", a3, self->_siriLanguageCode);
}

- (id)uiLocalizedStringForKey:(id)a3 languageCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  NSMutableDictionary *languageLocalizedStringTables;
  id v13;
  void *v14;
  id v15;
  NSString *justSiriTriggerPhrase;
  NSString *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[NSMutableDictionary allKeys](self->_languageLocalizedStringTables, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v7);

    if ((v9 & 1) == 0)
    {
      v23[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:](self, "_bundleStringTableForLanguages:inLocalizedStringsFileName:", v10, CFSTR("Localizable"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      languageLocalizedStringTables = self->_languageLocalizedStringTables;
      if (v11)
      {
        -[NSMutableDictionary setObject:forKey:](self->_languageLocalizedStringTables, "setObject:forKey:", v11, v7);
      }
      else
      {
        v13 = objc_alloc_init(MEMORY[0x24BDBCE70]);
        -[NSMutableDictionary setObject:forKey:](languageLocalizedStringTables, "setObject:forKey:", v13, v7);

      }
    }
  }
  -[NSMutableDictionary objectForKey:](self->_languageLocalizedStringTables, "objectForKey:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v6);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (!v15)
    v15 = v6;
  justSiriTriggerPhrase = self->_justSiriTriggerPhrase;
  if (!justSiriTriggerPhrase)
    justSiriTriggerPhrase = self->_heySiriTriggerPhrase;
  v17 = justSiriTriggerPhrase;
  objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%TRIGGER_PHRASE%"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "languageCode");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (v20 != v7)
  {
    -[VTUIStringsHelper _siriLanguageSubstitutedString:](self, "_siriLanguageSubstitutedString:", v18);
    v21 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v21;
  }

  return v18;
}

- (id)_siriLanguageSubstitutedString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend((id)__siriLangRegex, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v7 = (void *)objc_msgSend(v5, "mutableCopy");
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v20 = v6;
      objc_msgSend(v6, "reverseObjectEnumerator");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v23 != v10)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend((id)__siriLangRegex, "replacementStringForResult:inString:offset:template:", v12, v5, 0, CFSTR("$1"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[VTUIStringsHelper siriLanguageStringForKey:](self, "siriLanguageStringForKey:", v13);
            v14 = objc_claimAutoreleasedReturnValue();
            if (!v14)
            {
              -[VTUIStringsHelper uiLocalizedStringForKey:](self, "uiLocalizedStringForKey:", v13);
              v18 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_14;
            }
            v15 = (void *)v14;
            v16 = objc_msgSend(v12, "range");
            objc_msgSend(v7, "replaceCharactersInRange:withString:", v16, v17, v15);

          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v9)
            continue;
          break;
        }
      }

      v18 = v7;
LABEL_14:

      v6 = v20;
    }
    else
    {
      v18 = v5;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (NSString)heySiriTriggerPhrase
{
  return self->_heySiriTriggerPhrase;
}

- (NSString)justSiriTriggerPhrase
{
  return self->_justSiriTriggerPhrase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_justSiriTriggerPhrase, 0);
  objc_storeStrong((id *)&self->_heySiriTriggerPhrase, 0);
  objc_storeStrong((id *)&self->_siriLanguageCode, 0);
  objc_storeStrong((id *)&self->_languageLocalizedStringTables, 0);
  objc_storeStrong((id *)&self->_localizedStringTable, 0);
}

@end

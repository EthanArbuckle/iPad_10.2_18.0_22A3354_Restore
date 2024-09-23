@implementation SRCSCommandStringsTable

+ (NSArray)supportedTargetTypes
{
  if (supportedTargetTypes_onceToken != -1)
    dispatch_once(&supportedTargetTypes_onceToken, &__block_literal_global_1);
  return (NSArray *)(id)sSupportedTargetTypes;
}

void __47__SRCSCommandStringsTable_supportedTargetTypes__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x24BDAC8D0];
  v2[0] = kSRCSCommandTargetTypeNone;
  v2[1] = kSRCSCommandTargetTypeOSX;
  v2[2] = kSRCSCommandTargetTypeiOS;
  v2[3] = kSRCSCommandTargetTypeiPad;
  v2[4] = kSRCSCommandTargetTypeiPhone;
  v2[5] = kSRCSCommandTargetTypeRealityDevice;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sSupportedTargetTypes;
  sSupportedTargetTypes = v0;

}

+ (NSArray)activeTargetTypes
{
  if (activeTargetTypes_onceToken != -1)
    dispatch_once(&activeTargetTypes_onceToken, &__block_literal_global_91);
  return (NSArray *)(id)sActiveTargetTypes;
}

void __44__SRCSCommandStringsTable_activeTargetTypes__block_invoke()
{
  void *v0;
  int v1;
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];
  _QWORD v9[2];
  _QWORD v10[3];
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MGCopyAnswer();
  v1 = objc_msgSend(v0, "intValue");
  if (v0)
    CFRelease(v0);
  switch(v1)
  {
    case 1:
    case 2:
    case 7:
      v10[0] = kSRCSCommandTargetTypeiPhone;
      v10[1] = kSRCSCommandTargetTypeiOS;
      v10[2] = kSRCSCommandTargetTypeNone;
      v2 = (void *)MEMORY[0x24BDBCE30];
      v3 = v10;
      goto LABEL_11;
    case 3:
      v12[0] = kSRCSCommandTargetTypeiPad;
      v12[1] = kSRCSCommandTargetTypeiOS;
      v12[2] = kSRCSCommandTargetTypeNone;
      v2 = (void *)MEMORY[0x24BDBCE30];
      v3 = v12;
      goto LABEL_11;
    case 4:
      v11[0] = kSRCSCommandTargetTypeiPhone;
      v11[1] = kSRCSCommandTargetTypeiOS;
      v11[2] = kSRCSCommandTargetTypeNone;
      v2 = (void *)MEMORY[0x24BDBCE30];
      v3 = v11;
      goto LABEL_11;
    case 6:
      v9[0] = kSRCSCommandTargetTypewatchOS;
      v9[1] = kSRCSCommandTargetTypeNone;
      v2 = (void *)MEMORY[0x24BDBCE30];
      v3 = v9;
      goto LABEL_7;
    case 11:
      v8[0] = kSRCSCommandTargetTypeRealityDevice;
      v8[1] = kSRCSCommandTargetTypeiOS;
      v8[2] = kSRCSCommandTargetTypeNone;
      v2 = (void *)MEMORY[0x24BDBCE30];
      v3 = v8;
LABEL_11:
      v4 = 3;
      break;
    default:
      v7[0] = kSRCSCommandTargetTypeiOS;
      v7[1] = kSRCSCommandTargetTypeNone;
      v2 = (void *)MEMORY[0x24BDBCE30];
      v3 = v7;
LABEL_7:
      v4 = 2;
      break;
  }
  objc_msgSend(v2, "arrayWithObjects:count:", v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)sActiveTargetTypes;
  sActiveTargetTypes = v5;

}

+ (id)componentsFromLocaleIdentifier:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    if (componentsFromLocaleIdentifier__staticLocaleComponentsCacheSetup != -1)
      dispatch_once(&componentsFromLocaleIdentifier__staticLocaleComponentsCacheSetup, &__block_literal_global_94);
    v4 = (id)sLocaleComponentsCache;
    objc_sync_enter(v4);
    objc_msgSend((id)sLocaleComponentsCache, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "componentsFromLocaleIdentifier:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        objc_msgSend((id)sLocaleComponentsCache, "setObject:forKey:", v5, v3);
    }
    objc_sync_exit(v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __58__SRCSCommandStringsTable_componentsFromLocaleIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sLocaleComponentsCache;
  sLocaleComponentsCache = v0;

}

+ (BOOL)isSameLocaleIdentifier:(id)a3 secondLocaleIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a4;
  +[SRCSCommandStringsTable componentsFromLocaleIdentifier:](SRCSCommandStringsTable, "componentsFromLocaleIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SRCSCommandStringsTable componentsFromLocaleIdentifier:](SRCSCommandStringsTable, "componentsFromLocaleIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x24BDBCB20];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_4;
  v10 = (void *)v9;
  objc_msgSend(v7, "objectForKey:", v8);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v16 = 0;
    goto LABEL_17;
  }
  v12 = (void *)v11;
  objc_msgSend(v6, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "caseInsensitiveCompare:", v14);

  if (!v15)
  {
    v17 = *MEMORY[0x24BDBCAE8];
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBCAE8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(v7, "objectForKey:", v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v16 = 1;
LABEL_16:

        goto LABEL_17;
      }
    }
    objc_msgSend(v6, "objectForKey:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      objc_msgSend(v7, "objectForKey:", v17);
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (void *)v20;
        objc_msgSend(v6, "objectForKey:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v22, "caseInsensitiveCompare:", v23) == 0;

        if (!v10)
          goto LABEL_16;
LABEL_17:

        goto LABEL_18;
      }

    }
    v16 = 0;
    if (!v10)
      goto LABEL_16;
    goto LABEL_17;
  }
LABEL_4:
  v16 = 0;
LABEL_18:

  return v16;
}

+ (BOOL)isLocaleIdentifier:(id)a3 containedInLocaleIdentifiers:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if (+[SRCSCommandStringsTable isSameLocaleIdentifier:secondLocaleIdentifier:](SRCSCommandStringsTable, "isSameLocaleIdentifier:secondLocaleIdentifier:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)languageModelDictionaryFromCommandText:(id)a3 parsingErrorString:(id *)a4
{
  __CFString *v5;
  void *v6;
  void *v7;
  id v9;

  v5 = (__CFString *)a3;
  objc_opt_class();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v6);
  if (a4)
    *a4 = 0;
  v9 = 0;
  v7 = (void *)CreateMutableDictionaryFromSpokenCommandString(v5, &v9);
  if (a4 && v9)
    *a4 = v9;
  objc_sync_exit(v6);

  return v7;
}

- (SRCSCommandStringsTable)initWithLocaleIdentifier:(id)a3
{
  id v5;
  SRCSCommandStringsTable *v6;
  SRCSCommandStringsTable *v7;
  const __CFLocale *v8;
  const __CFLocale *v9;
  void *v10;
  objc_super v12;
  CFRange v13;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SRCSCommandStringsTable;
  v6 = -[SRCSCommandStringsTable init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_localeIdentifier, a3);
    v8 = CFLocaleCreate(0, (CFLocaleIdentifier)v7->_localeIdentifier);
    if (v8)
    {
      v9 = v8;
      v13.location = 0;
      v13.length = 0;
      v7->_wordUnitStringTokenizer = CFStringTokenizerCreate(0, &stru_24F657348, v13, 0, v8);
      CFRelease(v9);
    }
    -[SRCSCommandStringsTable _commandStringsTable](v7, "_commandStringsTable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {

      v7 = 0;
    }
  }

  return v7;
}

- (void)dealloc
{
  __CFStringTokenizer *wordUnitStringTokenizer;
  objc_super v4;

  wordUnitStringTokenizer = self->_wordUnitStringTokenizer;
  if (wordUnitStringTokenizer)
    CFRelease(wordUnitStringTokenizer);
  v4.receiver = self;
  v4.super_class = (Class)SRCSCommandStringsTable;
  -[SRCSCommandStringsTable dealloc](&v4, sel_dealloc);
}

- (id)_commandStringsTable
{
  SRCSCommandStringsTable *v2;
  NSDictionary *commandStringsCache;
  uint64_t v4;
  NSDictionary *v5;
  NSDictionary *v6;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  commandStringsCache = v2->_commandStringsCache;
  if (!commandStringsCache)
  {
    -[SRCSCommandStringsTable _commandStringsDictionaryForLocaleIdentifier:](v2, "_commandStringsDictionaryForLocaleIdentifier:", v2->_localeIdentifier);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_commandStringsCache;
    v2->_commandStringsCache = (NSDictionary *)v4;

    commandStringsCache = v2->_commandStringsCache;
  }
  v6 = commandStringsCache;
  objc_sync_exit(v2);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__SRCSCommandStringsTable__commandStringsTable__block_invoke;
  block[3] = &unk_24F652928;
  block[4] = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  return v6;
}

uint64_t __47__SRCSCommandStringsTable__commandStringsTable__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel__flushCommandStringsTable, 0);
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel__flushCommandStringsTable, 0, 20.0);
}

- (void)_flushCommandStringsTable
{
  NSDictionary *commandStringsCache;
  SRCSCommandStringsTable *obj;

  obj = self;
  objc_sync_enter(obj);
  commandStringsCache = obj->_commandStringsCache;
  obj->_commandStringsCache = 0;

  objc_sync_exit(obj);
}

- (id)_commandDescriptionsTable
{
  SRCSCommandStringsTable *v2;
  NSDictionary *commandDescriptionsCache;
  void *v4;
  uint64_t v5;
  NSDictionary *v6;
  NSDictionary *v7;

  v2 = self;
  objc_sync_enter(v2);
  commandDescriptionsCache = v2->_commandDescriptionsCache;
  if (!commandDescriptionsCache)
  {
    +[SRCSSpokenCommandUtilities sharedSpokenCommandUtilities](SRCSSpokenCommandUtilities, "sharedSpokenCommandUtilities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryForLocaleIdentifier:resourceFileName:resourceFileExtension:", v2->_localeIdentifier, CFSTR("CommandDescriptions"), CFSTR("strings"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v2->_commandDescriptionsCache;
    v2->_commandDescriptionsCache = (NSDictionary *)v5;

    commandDescriptionsCache = v2->_commandDescriptionsCache;
  }
  v7 = commandDescriptionsCache;
  objc_sync_exit(v2);

  return v7;
}

- (id)_keyboardKeyNamesTable
{
  SRCSCommandStringsTable *v2;
  NSMutableDictionary *keyboardKeyNamesCache;
  uint64_t v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id *p_isa;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSMutableDictionary *v18;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  keyboardKeyNamesCache = v2->_keyboardKeyNamesCache;
  if (!keyboardKeyNamesCache)
  {
    v4 = objc_opt_new();
    v5 = v2->_keyboardKeyNamesCache;
    v2->_keyboardKeyNamesCache = (NSMutableDictionary *)v4;

    +[SRCSSpokenCommandUtilities sharedSpokenCommandUtilities](SRCSSpokenCommandUtilities, "sharedSpokenCommandUtilities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryForLocaleIdentifier:resourceFileName:resourceFileExtension:", v2->_localeIdentifier, CFSTR("KeyboardKeyNames"), CFSTR("strings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    p_isa = (id *)&v2->super.isa;
    if (v9)
    {
      v11 = *(_QWORD *)v23;
      obj = v8;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKey:", v13, obj);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v21 = 0;
            +[SRCSCommandStringsTable languageModelDictionaryFromCommandText:parsingErrorString:](SRCSCommandStringsTable, "languageModelDictionaryFromCommandText:parsingErrorString:", v14, &v21);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v21;
            if (!objc_msgSend(v16, "length"))
            {
              objc_msgSend(p_isa, "spokenStringPermutationsOfLanguageModelDictionary:stringsTable:", v15, 0);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
                objc_msgSend(p_isa[5], "setObject:forKey:", v17, v13);

            }
          }

        }
        v8 = obj;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    v2 = (SRCSCommandStringsTable *)p_isa;
    keyboardKeyNamesCache = (NSMutableDictionary *)p_isa[5];
  }
  v18 = keyboardKeyNamesCache;
  objc_sync_exit(v2);

  return v18;
}

- (id)_phoneticKeyNamesTable
{
  SRCSCommandStringsTable *v2;
  NSMutableDictionary *phoneticKeyNamesCache;
  uint64_t v4;
  NSMutableDictionary *v5;
  void *v6;
  NSString *localeIdentifier;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id *p_isa;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSMutableDictionary *v21;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  phoneticKeyNamesCache = v2->_phoneticKeyNamesCache;
  if (!phoneticKeyNamesCache)
  {
    v4 = objc_opt_new();
    v5 = v2->_phoneticKeyNamesCache;
    v2->_phoneticKeyNamesCache = (NSMutableDictionary *)v4;

    +[SRCSSpokenCommandUtilities sharedSpokenCommandUtilities](SRCSSpokenCommandUtilities, "sharedSpokenCommandUtilities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    localeIdentifier = v2->_localeIdentifier;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryForLocaleIdentifier:bundle:subDirectory:rootFileName:rootFileExtension:", localeIdentifier, v8, CFSTR("LocalizedPhoneticAlphabet"), CFSTR("PhoneticAlphabet"), CFSTR("plist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("PhoneticPronunciationMapping"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    p_isa = (id *)&v2->super.isa;
    if (v12)
    {
      v14 = *(_QWORD *)v26;
      obj = v11;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKey:", v16, obj);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v24 = 0;
            +[SRCSCommandStringsTable languageModelDictionaryFromCommandText:parsingErrorString:](SRCSCommandStringsTable, "languageModelDictionaryFromCommandText:parsingErrorString:", v17, &v24);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v24;
            if (!objc_msgSend(v19, "length"))
            {
              objc_msgSend(p_isa, "spokenStringPermutationsOfLanguageModelDictionary:stringsTable:", v18, 0);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20)
                objc_msgSend(p_isa[7], "setObject:forKey:", v20, v16);

            }
          }

        }
        v11 = obj;
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v12);
    }

    v2 = (SRCSCommandStringsTable *)p_isa;
    phoneticKeyNamesCache = (NSMutableDictionary *)p_isa[7];
  }
  v21 = phoneticKeyNamesCache;
  objc_sync_exit(v2);

  return v21;
}

- (id)_modifierKeyNamesTable
{
  SRCSCommandStringsTable *v2;
  NSMutableDictionary *modifierKeyNamesCache;
  uint64_t v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id *p_isa;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSMutableDictionary *v18;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  modifierKeyNamesCache = v2->_modifierKeyNamesCache;
  if (!modifierKeyNamesCache)
  {
    v4 = objc_opt_new();
    v5 = v2->_modifierKeyNamesCache;
    v2->_modifierKeyNamesCache = (NSMutableDictionary *)v4;

    +[SRCSSpokenCommandUtilities sharedSpokenCommandUtilities](SRCSSpokenCommandUtilities, "sharedSpokenCommandUtilities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryForLocaleIdentifier:resourceFileName:resourceFileExtension:", v2->_localeIdentifier, CFSTR("ModifierKeyNames"), CFSTR("strings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    p_isa = (id *)&v2->super.isa;
    if (v9)
    {
      v11 = *(_QWORD *)v23;
      obj = v8;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKey:", v13, obj);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v21 = 0;
            +[SRCSCommandStringsTable languageModelDictionaryFromCommandText:parsingErrorString:](SRCSCommandStringsTable, "languageModelDictionaryFromCommandText:parsingErrorString:", v14, &v21);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v21;
            if (!objc_msgSend(v16, "length"))
            {
              objc_msgSend(p_isa, "spokenStringPermutationsOfLanguageModelDictionary:stringsTable:", v15, 0);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
                objc_msgSend(p_isa[6], "setObject:forKey:", v17, v13);

            }
          }

        }
        v8 = obj;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    v2 = (SRCSCommandStringsTable *)p_isa;
    modifierKeyNamesCache = (NSMutableDictionary *)p_isa[6];
  }
  v18 = modifierKeyNamesCache;
  objc_sync_exit(v2);

  return v18;
}

- (id)exampleParameterStringsTable
{
  NSMutableDictionary *parameterIdentifiersToExamplesTable;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id *p_isa;
  NSMutableDictionary *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  uint64_t v41;
  SRCSCommandStringsTable *v43;
  id v44;
  uint64_t v45;
  id v46;
  id v47;
  void *v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  void *v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  parameterIdentifiersToExamplesTable = self->_parameterIdentifiersToExamplesTable;
  if (!parameterIdentifiersToExamplesTable)
  {
    v50 = RXEngineTypeForLocaleIdentifier();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = self;
    -[SRCSCommandStringsTable _commandDescriptionsTable](self, "_commandDescriptionsTable");
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v67 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          if (objc_msgSend(v9, "hasPrefix:", CFSTR("ExampleParameter.")))
          {
            v10 = objc_msgSend(v9, "rangeOfString:options:range:", CFSTR("."), 0, objc_msgSend(CFSTR("ExampleParameter."), "length"), objc_msgSend(v9, "length") - objc_msgSend(CFSTR("ExampleParameter."), "length"));
            if (v10 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v12 = v10;
              v13 = v11;
              objc_msgSend(v9, "substringToIndex:", v10);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "objectForKey:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v15)
              {
                objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "setObject:forKey:", v15, v14);
              }
              if (v50 == 1 || !objc_msgSend(v9, "hasPrefix:", CFSTR("ExampleParameter.IntegerValue")))
              {
                objc_msgSend(obj, "objectForKey:", v9);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "addObject:", v16);
              }
              else
              {
                objc_msgSend(v9, "substringWithRange:", v12 + v13, objc_msgSend(v9, "rangeOfString:options:range:", CFSTR("_"), 0, v13, objc_msgSend(v9, "length") - v13)- (v12+ v13));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v16, "integerValue") <= 9)
                {
                  objc_msgSend(obj, "objectForKey:", v9);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "addObject:", v17);

                }
              }

            }
          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
      }
      while (v6);
    }
    v18 = objc_opt_new();
    p_isa = (id *)&v43->super.isa;
    v20 = v43->_parameterIdentifiersToExamplesTable;
    v43->_parameterIdentifiersToExamplesTable = (NSMutableDictionary *)v18;

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    objc_msgSend((id)AllValidCommandParameterIdentifiers(), "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v63;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v63 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v25);
          if ((objc_msgSend(v26, "isEqualToString:", kSRCSCommandParameterSwitchableApplication[0]) & 1) != 0
            || objc_msgSend(v26, "isEqualToString:", kSRCSCommandParameterRunningApplication[0]))
          {
            v27 = v4;
            v28 = CFSTR("ExampleParameter.AppName");
            goto LABEL_35;
          }
          if ((objc_msgSend(v26, "isEqualToString:", kSRCSCommandParameterTextSegmentCardinalNumber[0]) & 1) != 0
            || (objc_msgSend(v26, "isEqualToString:", kSRCSCommandParameterScreenDistanceCardinalNumber[0]) & 1) != 0
            || (objc_msgSend(v26, "isEqualToString:", kSRCSCommandParameterNumberZeroThroughOneHundred[0]) & 1) != 0
            || (objc_msgSend(v26, "isEqualToString:", kSRCSCommandParameterNumberTwoThroughNinetyNine[0]) & 1) != 0
            || (objc_msgSend(v26, "isEqualToString:", kSRCSCommandParameterNumberTwoThroughNinetyNine2[0]) & 1) != 0
            || (objc_msgSend(v26, "isEqualToString:", kSRCSCommandParameterOverlayLabel[0]) & 1) != 0
            || objc_msgSend(v26, "isEqualToString:", kSRCSCommandParameterOverlayLabel2[0]))
          {
            v27 = v4;
            v28 = CFSTR("ExampleParameter.IntegerValue");
            goto LABEL_35;
          }
          if ((objc_msgSend(v26, "isEqualToString:", kSRCSCommandParameterMenuItem[0]) & 1) != 0
            || (objc_msgSend(v26, "isEqualToString:", kSRCSCommandParameterWindowItem[0]) & 1) != 0
            || objc_msgSend(v26, "isEqualToString:", kSRCSCommandParameterWindowItem2[0]))
          {
            v27 = v4;
            v28 = CFSTR("ExampleParameter.ElementName");
            goto LABEL_35;
          }
          if (objc_msgSend(v26, "isEqualToString:", kSRCSCommandParameterMenuBarItem[0]))
          {
            v27 = v4;
            v28 = CFSTR("ExampleParameter.MenuBarName");
LABEL_35:
            objc_msgSend(v27, "objectForKey:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29)
              objc_msgSend(p_isa[8], "setObject:forKey:", v29, v26);
            goto LABEL_37;
          }
          if ((objc_msgSend(v26, "isEqualToString:", kSRCSCommandParameterDictation[0]) & 1) != 0
            || objc_msgSend(v26, "isEqualToString:", kSRCSCommandParameterDictation2[0]))
          {
            v27 = v4;
            v28 = CFSTR("ExampleParameter.DictatedPhrase");
            goto LABEL_35;
          }
          if (objc_msgSend(v26, "isEqualToString:", kSRCSCommandParameterKeyboardKeyName[0]))
          {
            v29 = (void *)objc_opt_new();
            objc_msgSend(p_isa, "_phoneticKeyNamesTable");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(p_isa, "_keyboardKeyNamesTable");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = 0u;
            v59 = 0u;
            v60 = 0u;
            v61 = 0u;
            v46 = v30;
            objc_msgSend(v30, "allKeys");
            v44 = (id)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
            if (v51)
            {
              v45 = *(_QWORD *)v59;
              do
              {
                for (j = 0; j != v51; ++j)
                {
                  if (*(_QWORD *)v59 != v45)
                    objc_enumerationMutation(v44);
                  v32 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j);
                  objc_msgSend(v46, "objectForKey:", v32);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "addObjectsFromArray:", v33);

                  objc_msgSend(v48, "objectForKey:", v32);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v34)
                    objc_msgSend(v29, "addObjectsFromArray:", v34);

                }
                v51 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
              }
              while (v51);
            }

            p_isa = (id *)&v43->super.isa;
            -[NSMutableDictionary setObject:forKey:](v43->_parameterIdentifiersToExamplesTable, "setObject:forKey:", v29, v26);

            v35 = v48;
            goto LABEL_69;
          }
          if (objc_msgSend(v26, "isEqualToString:", kSRCSCommandParameterModifierKeys[0]))
          {
            v29 = (void *)objc_opt_new();
            objc_msgSend(p_isa, "_modifierKeyNamesTable");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = 0u;
            v55 = 0u;
            v56 = 0u;
            v57 = 0u;
            v52 = v36;
            objc_msgSend(v36, "allKeys");
            v47 = (id)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
            if (v37)
            {
              v38 = v37;
              v49 = *(_QWORD *)v55;
              do
              {
                for (k = 0; k != v38; ++k)
                {
                  if (*(_QWORD *)v55 != v49)
                    objc_enumerationMutation(v47);
                  objc_msgSend(v52, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * k));
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "addObjectsFromArray:", v40);

                }
                v38 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
              }
              while (v38);
            }

            p_isa = (id *)&v43->super.isa;
            -[NSMutableDictionary setObject:forKey:](v43->_parameterIdentifiersToExamplesTable, "setObject:forKey:", v29, v26);
            v35 = v52;
LABEL_69:

LABEL_37:
          }
          ++v25;
        }
        while (v25 != v23);
        v41 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
        v23 = v41;
      }
      while (v41);
    }

    parameterIdentifiersToExamplesTable = (NSMutableDictionary *)p_isa[8];
  }
  return parameterIdentifiersToExamplesTable;
}

- (id)supportedCommandIdentifiersForTargetTypes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "count");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SRCSCommandStringsTable _commandStringsTable](self, "_commandStringsTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        v17 = 0;
        -[SRCSCommandStringsTable _rootCommandIdentifierFrom:foundTargetType:](self, "_rootCommandIdentifierFrom:foundTargetType:", v13, &v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v17;
        if (objc_msgSend(v14, "length")
          && (objc_msgSend(v5, "containsObject:", v14) & 1) == 0
          && (!v6 || objc_msgSend(v4, "containsObject:", v15)))
        {
          if (-[SRCSCommandStringsTable isSupportedCommandIdentifier:forLocaleIdentifier:](self, "isSupportedCommandIdentifier:forLocaleIdentifier:", v14, self->_localeIdentifier))
          {
            objc_msgSend(v5, "addObject:", v14);
          }
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isSupportedCommandIdentifier:(id)a3 forTargetTypes:(id)a4
{
  id v6;
  void *v7;
  id v8;
  char v9;
  id v11;

  v6 = a4;
  v11 = 0;
  -[SRCSCommandStringsTable _rootCommandIdentifierFrom:foundTargetType:](self, "_rootCommandIdentifierFrom:foundTargetType:", a3, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (v7)
    v9 = objc_msgSend(v6, "containsObject:", v8);
  else
    v9 = 0;

  return v9;
}

- (BOOL)isSupportedCommandIdentifier:(id)a3 forLocaleIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;

  v5 = a4;
  v6 = a3;
  +[SRCSSpokenCommandUtilities sharedSpokenCommandUtilities](SRCSSpokenCommandUtilities, "sharedSpokenCommandUtilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commandAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", kSRCSCommandAttributeIncludeOnlyForLocales);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    && !+[SRCSCommandStringsTable isLocaleIdentifier:containedInLocaleIdentifiers:](SRCSCommandStringsTable, "isLocaleIdentifier:containedInLocaleIdentifiers:", v5, v10))
  {
    LOBYTE(v12) = 0;
  }
  else
  {
    objc_msgSend(v9, "objectForKey:", kSRCSCommandAttributeExcludeAlwaysForLocales);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v12 = !+[SRCSCommandStringsTable isLocaleIdentifier:containedInLocaleIdentifiers:](SRCSCommandStringsTable, "isLocaleIdentifier:containedInLocaleIdentifiers:", v5, v11);
    else
      LOBYTE(v12) = 1;

  }
  return v12;
}

- (id)_rootCommandIdentifierFrom:(id)a3 foundTargetType:(id *)a4
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v5 = a3;
  v6 = (id)kSRCSCommandTargetTypeNone;
  v7 = objc_msgSend(v5, "rangeOfString:options:", CFSTR("_"), 4);
  if (v8 == 1 && (v9 = v7, v7 < objc_msgSend(v5, "length") - 1))
  {
    objc_msgSend(v5, "substringFromIndex:", v9 + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(v5, "substringToIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v10;
    }
    else
    {

      v12 = 0;
      v11 = 0;
    }

    v6 = v12;
  }
  else
  {
    v11 = v5;
  }
  v13 = objc_retainAutorelease(v6);
  *a4 = v13;

  return v11;
}

- (unint64_t)countOptionalNodesOfLanguageModelDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", kSRCSCommandParseDictionaryKeyAttributes[0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", kSRCSCommandParseAttributeOptional[0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "objectForKey:", kSRCSCommandParseDictionaryKeyChildren[0], 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v7 += -[SRCSCommandStringsTable countOptionalNodesOfLanguageModelDictionary:](self, "countOptionalNodesOfLanguageModelDictionary:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)spokenStringPermutationOfLanguageModelDictionary:(id)a3 givenPermutation:(unsigned __int16 *)a4 stringsTable:(id)a5
{
  return -[SRCSCommandStringsTable _spokenStringPermutationOfLanguageModelDictionary:givenPermutation:stringsTable:segmentOffsets:](self, "_spokenStringPermutationOfLanguageModelDictionary:givenPermutation:stringsTable:segmentOffsets:", a3, a4, a5, 0);
}

- (id)_spokenStringPermutationOfLanguageModelDictionary:(id)a3 givenPermutation:(unsigned __int16 *)a4 stringsTable:(id)a5 segmentOffsets:(id)a6
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  __CFString *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  SRCSCommandStringsTable *v35;
  __CFStringTokenizer *wordUnitStringTokenizer;
  CFRange CurrentTokenRange;
  void *v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  char v43;
  id v44;
  id obj;
  int v48;
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;
  CFRange v58;

  v57 = *MEMORY[0x24BDAC8D0];
  v44 = a3;
  v49 = a5;
  v50 = a6;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", &stru_24F657348);
  v51 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectForKey:", kSRCSCommandParseDictionaryKeyAttributes[0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", kSRCSCommandParseAttributeOptional[0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v9, "BOOLValue");

  v43 = (char)a5;
  if ((_DWORD)a5)
  {
    v48 = *a4 & 1;
    *a4 >>= 1;
  }
  else
  {
    v48 = 1;
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend(v44, "objectForKey:", kSRCSCommandParseDictionaryKeyChildren[0]);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v53 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
        if (v50)
          v14 = (void *)objc_opt_new();
        else
          v14 = 0;
        -[SRCSCommandStringsTable _spokenStringPermutationOfLanguageModelDictionary:givenPermutation:stringsTable:segmentOffsets:](self, "_spokenStringPermutationOfLanguageModelDictionary:givenPermutation:stringsTable:segmentOffsets:", v13, a4, v49, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v48 && objc_msgSend(v15, "length"))
        {
          if (v50 && objc_msgSend(v14, "count"))
          {
            if (objc_msgSend(v51, "length"))
            {
              v17 = objc_msgSend(v14, "count");
              if (v17 >= 1)
              {
                for (j = 0; j != v17; ++j)
                {
                  objc_msgSend(v14, "objectAtIndex:", j);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = objc_msgSend(v19, "range");
                  v21 = objc_msgSend(v51, "length");
                  objc_msgSend(v19, "range");
                  objc_msgSend(v19, "setRange:", v20 + v21, v22);

                }
              }
            }
            objc_msgSend(v50, "addObjectsFromArray:", v14);
          }
          objc_msgSend(v51, "appendString:", v16);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    }
    while (v10);
  }

  if (v48)
  {
    objc_msgSend(v44, "objectForKey:", kSRCSCommandParseDictionaryKeyIsBuiltInIdentifier[0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");

    if (!v24)
    {
      objc_msgSend(v44, "objectForKey:", kSRCSCommandParseDictionaryKeyText[0]);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (-[__CFString length](v25, "length"))
      {
        if (v50)
        {
          v35 = self;
          objc_sync_enter(v35);
          wordUnitStringTokenizer = v35->_wordUnitStringTokenizer;
          v58.length = -[__CFString length](v25, "length");
          v58.location = 0;
          CFStringTokenizerSetString(wordUnitStringTokenizer, v25, v58);
          if (CFStringTokenizerAdvanceToNextToken(v35->_wordUnitStringTokenizer))
          {
            CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v35->_wordUnitStringTokenizer);
            v38 = v25;
            if ((v43 & 1) == 0)
            {
              -[__CFString substringWithRange:](v25, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
            }
            +[SRCSCommandSegmentInfo segmentInfoWith:text:](SRCSCommandSegmentInfo, "segmentInfoWith:text:", CurrentTokenRange.location, CurrentTokenRange.length, v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "addObject:", v39);

            if ((v43 & 1) == 0)
          }
          objc_sync_exit(v35);

        }
        objc_msgSend(v51, "appendString:", v25);
      }
      goto LABEL_56;
    }
    objc_msgSend(v44, "objectForKeyedSubscript:", kSRCSCommandParseDictionaryKeyIdentifier[0]);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "objectForKey:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;
    v28 = v27;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v26;
    else
      v29 = 0;
    v30 = v29;
    if (objc_msgSend(v28, "length"))
    {
      v31 = -[__CFString isEqualToString:](v25, "isEqualToString:", kSRCSCommandParameterDeviceName[0]);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v31)
        objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("CommandParameter.DeviceNameFormatString"), &stru_24F657348, 0);
      else
        objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("CommandParameter.GenericFormatString"), &stru_24F657348, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "appendFormat:", v34, v28);

    }
    else if (objc_msgSend(v30, "count"))
    {
      if (!objc_msgSend(v30, "count"))
      {
LABEL_55:

LABEL_56:
        goto LABEL_57;
      }
      if ((unint64_t)objc_msgSend(v30, "count") < 2)
      {
        v41 = 0;
      }
      else
      {
        do
        {
          v40 = random();
          v41 = v40 % objc_msgSend(v30, "count");
        }
        while (_spokenStringPermutationOfLanguageModelDictionary_givenPermutation_stringsTable_segmentOffsets__sLastRandomInteger == v41);
      }
      _spokenStringPermutationOfLanguageModelDictionary_givenPermutation_stringsTable_segmentOffsets__sLastRandomInteger = v41;
      objc_msgSend(v30, "objectAtIndex:");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "appendString:", v33);
    }
    else
    {
      objc_msgSend(v44, "objectForKey:", kSRCSCommandParseDictionaryKeyIdentifier[0]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "appendFormat:", CFSTR("{%@}"), v33);
    }

    goto LABEL_55;
  }
LABEL_57:

  return v51;
}

- (id)setOfBuiltInIdentifiersFromLanguageModelDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", kSRCSCommandParseDictionaryKeyChildren[0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v4, "objectForKey:", kSRCSCommandParseDictionaryKeyChildren[0], 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          -[SRCSCommandStringsTable setOfBuiltInIdentifiersFromLanguageModelDictionary:](self, "setOfBuiltInIdentifiersFromLanguageModelDictionary:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "allObjects");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

  }
  else
  {
    objc_msgSend(v4, "objectForKey:", kSRCSCommandParseDictionaryKeyIsBuiltInIdentifier[0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    if (v15)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", kSRCSCommandParseDictionaryKeyIdentifier[0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        objc_msgSend(v5, "addObject:", v16);

    }
  }

  return v5;
}

- (void)_removeDuplicateSpacesFromMutableString:(id)a3
{
  id v3;

  v3 = a3;
  while (objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("  "), CFSTR(" "), 0, 0, objc_msgSend(v3, "length")));

}

- (id)unparsedCommandTextForCommandIdentifier:(id)a3 targetTypes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v24 = v6;
    -[SRCSCommandStringsTable _rootCommandIdentifierFrom:foundTargetType:](self, "_rootCommandIdentifierFrom:foundTargetType:", v6, &v29);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v29;
    -[SRCSCommandStringsTable _commandStringsTable](self, "_commandStringsTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v23 = v8;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (objc_msgSend(v17, "isEqualToString:", kSRCSCommandTargetTypeNone))
          {
            v18 = v10;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v10, v17);
            v18 = (id)objc_claimAutoreleasedReturnValue();
          }
          v19 = v18;
          objc_msgSend(v11, "objectForKeyedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "length"))
          {
            if (-[__CFString length](v9, "length"))
              -[__CFString appendString:](v9, "appendString:", CFSTR("|"));
            -[__CFString appendString:](v9, "appendString:", v20);
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v14);
    }

    v8 = v23;
    v6 = v24;
  }
  else
  {
    NSLog(CFSTR("Error. Don't pass nil parameters."));
    v9 = &stru_24F657348;
  }

  return v9;
}

- (id)languageModelDictionaryForCommandIdentifier:(id)a3 targetType:(id)a4 parsingErrorString:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v14[0] = kSRCSCommandTargetTypeNone;
  v14[1] = a4;
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SRCSCommandStringsTable languageModelDictionaryForCommandIdentifier:targetTypes:parsingErrorString:](self, "languageModelDictionaryForCommandIdentifier:targetTypes:parsingErrorString:", v10, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)languageModelDictionaryForCommandIdentifier:(id)a3 targetTypes:(id)a4 parsingErrorString:(id *)a5
{
  id v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v14;

  v8 = a3;
  v9 = a4;
  -[SRCSCommandStringsTable unparsedCommandTextForCommandIdentifier:targetTypes:](self, "unparsedCommandTextForCommandIdentifier:targetTypes:", v8, v9);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v11);
  if (a5)
    *a5 = 0;
  v14 = 0;
  v12 = (void *)CreateMutableDictionaryFromSpokenCommandString(v10, &v14);
  if (a5 && v14)
    *a5 = v14;
  objc_sync_exit(v11);

  return v12;
}

- (id)spokenStringPermutationsOfLanguageModelDictionary:(id)a3 stringsTable:(id)a4
{
  return -[SRCSCommandStringsTable spokenStringPermutationsOfLanguageModelDictionary:stringsTable:restrictPermutationsToShortestAndLongest:](self, "spokenStringPermutationsOfLanguageModelDictionary:stringsTable:restrictPermutationsToShortestAndLongest:", a3, a4, 0);
}

- (id)spokenStringPermutationsOfLanguageModelDictionary:(id)a3 stringsTable:(id)a4 restrictPermutationsToShortestAndLongest:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t i;
  uint64_t v15;
  unsigned int v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  NSObject *obj;
  uint64_t v29;
  _BOOL4 v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", kSRCSCommandParseDictionaryKeyAttributes[0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", kSRCSCommandParseAttributePath[0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    SRCSLogGeneral();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v8;
      _os_log_impl(&dword_22BD8C000, v13, OS_LOG_TYPE_DEFAULT, "Malformed LM dictionary in spokenStringPermutationsOfLanguageModelDictionary:stringsTable:, should not have a path at the top level: %@.", buf, 0xCu);
    }
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v8, "objectForKey:", kSRCSCommandParseDictionaryKeyChildren[0]);
    v13 = objc_claimAutoreleasedReturnValue();
    v32 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v32)
    {
      v27 = v8;
      obj = v13;
      v29 = *(_QWORD *)v34;
      v30 = v5;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v34 != v29)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          v16 = -[SRCSCommandStringsTable countOptionalNodesOfLanguageModelDictionary:](self, "countOptionalNodesOfLanguageModelDictionary:", v15, v27);
          v17 = (void *)objc_opt_new();
          if (v16 <= 0xF)
          {
            v18 = 0;
            v19 = 1 << v16;
            do
            {
              *(_WORD *)buf = v18;
              -[SRCSCommandStringsTable spokenStringPermutationOfLanguageModelDictionary:givenPermutation:stringsTable:](self, "spokenStringPermutationOfLanguageModelDictionary:givenPermutation:stringsTable:", v15, buf, v9);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[SRCSCommandStringsTable _removeDuplicateSpacesFromMutableString:](self, "_removeDuplicateSpacesFromMutableString:", v20);
              objc_msgSend(v20, "stringByTrimmingCharactersInSet:", v10);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "addObject:", v21);

              ++v18;
            }
            while (v19 != v18);
          }
          v22 = objc_alloc(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v17, "allObjects");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "sortedArrayUsingComparator:", &__block_literal_global_161);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(v22, "initWithArray:", v24);

          if (v30 && (unint64_t)objc_msgSend(v25, "count") >= 3)
            objc_msgSend(v25, "removeObjectsInRange:", 1, objc_msgSend(v25, "count") - 2);
          objc_msgSend(v31, "addObjectsFromArray:", v25);

        }
        v13 = obj;
        v32 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v32);
      v8 = v27;
    }
  }

  return v31;
}

uint64_t __131__SRCSCommandStringsTable_spokenStringPermutationsOfLanguageModelDictionary_stringsTable_restrictPermutationsToShortestAndLongest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "length");
  if (v6 <= objc_msgSend(v5, "length"))
  {
    v8 = objc_msgSend(v4, "length");
    if (v8 >= objc_msgSend(v5, "length"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)_warningsOfIncorrectTokenizationAcrossSegmentBoundariesInLanguageModelDictionary:(id)a3 stringsTable:(id)a4
{
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  int v12;
  void *v13;
  __CFString *v14;
  SRCSCommandStringsTable *v15;
  __CFStringTokenizer *wordUnitStringTokenizer;
  CFIndex location;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  NSObject *obj;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  int v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  id v40;
  _BYTE v41[128];
  uint64_t v42;
  CFRange v43;

  v42 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v32 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKey:", kSRCSCommandParseDictionaryKeyAttributes[0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", kSRCSCommandParseAttributePath[0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    SRCSLogGeneral();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v26;
      _os_log_impl(&dword_22BD8C000, v8, OS_LOG_TYPE_DEFAULT, "Malformed LM dictionary in _warningsOfIncorrectTokenizationAcrossSegmentBoundariesInLanguageModelDictionary:stringsTable:, should not have a path at the top level: %@.", buf, 0xCu);
    }
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v26, "objectForKey:", kSRCSCommandParseDictionaryKeyChildren[0]);
    obj = objc_claimAutoreleasedReturnValue();
    v29 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v29)
    {
      v28 = *(_QWORD *)v36;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v36 != v28)
          {
            v10 = v9;
            objc_enumerationMutation(obj);
            v9 = v10;
          }
          v30 = v9;
          v34 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v9);
          v11 = -[SRCSCommandStringsTable countOptionalNodesOfLanguageModelDictionary:](self, "countOptionalNodesOfLanguageModelDictionary:");
          if (v11 <= 0xF)
          {
            v12 = 0;
            v33 = 1 << v11;
            do
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              *(_WORD *)buf = v12;
              -[SRCSCommandStringsTable _spokenStringPermutationOfLanguageModelDictionary:givenPermutation:stringsTable:segmentOffsets:](self, "_spokenStringPermutationOfLanguageModelDictionary:givenPermutation:stringsTable:segmentOffsets:", v34, buf, v32, v13);
              v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v15 = self;
              objc_sync_enter(v15);
              wordUnitStringTokenizer = self->_wordUnitStringTokenizer;
              v43.length = -[__CFString length](v14, "length");
              v43.location = 0;
              CFStringTokenizerSetString(wordUnitStringTokenizer, v14, v43);
LABEL_12:
              while (CFStringTokenizerAdvanceToNextToken(self->_wordUnitStringTokenizer))
              {
                location = CFStringTokenizerGetCurrentTokenRange(self->_wordUnitStringTokenizer).location;
                v18 = objc_msgSend(v13, "count");
                if (v18 >= 1)
                {
                  v19 = 0;
                  while (1)
                  {
                    objc_msgSend(v13, "objectAtIndex:", v19);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    v21 = objc_msgSend(v20, "range") == location;

                    if (v21)
                      break;
                    if (v18 == ++v19)
                      goto LABEL_12;
                  }
                  objc_msgSend(v13, "removeObjectAtIndex:", v19);
                }
              }
              objc_sync_exit(v15);

              if (objc_msgSend(v13, "count"))
              {
                v22 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "stringWithFormat:", CFSTR("%@ in “%@”"), v23, v14);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "addObject:", v24);

              }
              ++v12;
            }
            while (v12 != v33);
          }
          v9 = v30 + 1;
        }
        while (v30 + 1 != v29);
        v29 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v29);
    }
    v8 = obj;
  }

  return v31;
}

- (id)descriptionStringForCommandIdentifier:(id)a3 descriptionType:(id)a4 targetTypes:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SRCSCommandStringsTable _commandDescriptionsTable](self, "_commandDescriptionsTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v24;
LABEL_3:
    v17 = 0;
    v18 = v15;
    while (1)
    {
      if (*(_QWORD *)v24 != v16)
        objc_enumerationMutation(v12);
      v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v17);
      if (objc_msgSend(v19, "isEqualToString:", CFSTR("None")))
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v8, v9, v22);
      else
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@_%@"), v8, v9, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "length"))
        break;
      ++v17;
      v18 = v15;
      if (v14 == v17)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v14)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)mutableAttributedStringByReplacingPlaceholderAttribute:(id)a3 withAttributeName:(id)a4 inAttributedString:(id)a5 withValueTable:(id)a6
{
  id v9;
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v9 = a4;
  v10 = a6;
  v11 = (objc_class *)MEMORY[0x24BDD1688];
  v12 = a5;
  v13 = a3;
  v14 = (void *)objc_msgSend([v11 alloc], "initWithAttributedString:", v12);
  v15 = objc_msgSend(v12, "length");
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __134__SRCSCommandStringsTable_mutableAttributedStringByReplacingPlaceholderAttribute_withAttributeName_inAttributedString_withValueTable___block_invoke;
  v22[3] = &unk_24F652B28;
  v23 = v10;
  v16 = v14;
  v24 = v16;
  v25 = v9;
  v17 = v9;
  v18 = v10;
  objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, v15, 0, v22);

  objc_msgSend(v16, "removeAttribute:range:", v13, 0, objc_msgSend(v16, "length"));
  v19 = v25;
  v20 = v16;

  return v20;
}

void __134__SRCSCommandStringsTable_mutableAttributedStringByReplacingPlaceholderAttribute_withAttributeName_inAttributedString_withValueTable___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *(_QWORD *)(a1 + 48), v7, a3, a4);
    v7 = v8;
  }

}

- (id)mutableAttributedStringCommandDescriptionForCommandIdentifier:(id)a3 calculateDisplayedAttributedStringWidthBlock:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  unint64_t v22;
  __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  __CFString *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *k;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  __CFString *v65;
  void *v66;
  const __CFString *v67;
  float v68;
  double v69;
  void *v70;
  void *m;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  __CFString *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t n;
  id v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t ii;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  __CFString *v115;
  id v116;
  const __CFString *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t jj;
  id v126;
  void *v127;
  void *v128;
  double v129;
  double v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t kk;
  void *v144;
  void *v145;
  int v146;
  __CFString **v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t mm;
  void *v152;
  id v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t nn;
  void *v158;
  id v159;
  void *v160;
  void *v161;
  float v162;
  double v163;
  void *v164;
  uint64_t v165;
  id v166;
  unint64_t v167;
  __CFString *v168;
  void *v169;
  void *v170;
  uint64_t v171;
  const __CFString *v172;
  void *v173;
  uint64_t v174;
  id v175;
  __CFString *v176;
  void *v177;
  uint64_t v178;
  void *v179;
  uint64_t v180;
  void *v181;
  void *v182;
  void *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t i1;
  void *v188;
  void *v189;
  int v190;
  __CFString **v191;
  uint64_t v192;
  char *v193;
  char v194;
  uint64_t v195;
  unint64_t v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  uint64_t v201;
  id v202;
  const __CFString *v203;
  void *v204;
  uint64_t v205;
  id v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  id v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  id v225;
  void *v226;
  const __CFString *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  uint64_t v232;
  id v233;
  void *v234;
  void *v235;
  const __CFString *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  id v241;
  id v242;
  const __CFString *v243;
  void *v244;
  void *v245;
  void *v246;
  uint64_t v247;
  void *v248;
  uint64_t v249;
  double v250;
  void *v251;
  id v252;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  id v265;
  id obj;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  void *v270;
  uint64_t v271;
  void *v272;
  void *v273;
  id v274;
  void *v275;
  __CFString *v276;
  uint64_t v277;
  uint64_t v278;
  id v279;
  uint64_t v280;
  __CFString *v281;
  void *v282;
  uint64_t v283;
  id v284;
  id v285;
  char *v286;
  _QWORD *v287;
  uint64_t v288;
  void *v289;
  id v290;
  id v291;
  id v292;
  id v293;
  id v294;
  id v295;
  __CFString *v296;
  void (**v297)(void);
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  void *v302;
  uint64_t v303;
  id v304;
  id v305;
  id v306;
  id v307;
  id v308;
  id v309;
  id v310;
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
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  __int128 v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  id v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  _QWORD v372[4];
  _QWORD v373[4];
  _QWORD v374[3];
  _QWORD v375[3];
  _QWORD v376[3];
  _QWORD v377[3];
  _QWORD v378[3];
  _QWORD v379[3];
  _BYTE v380[128];
  _QWORD v381[3];
  _QWORD v382[3];
  _QWORD v383[4];
  _QWORD v384[4];
  _QWORD v385[3];
  _QWORD v386[3];
  _BYTE v387[128];
  _BYTE v388[128];
  _BYTE v389[128];
  _QWORD v390[3];
  _QWORD v391[3];
  _QWORD v392[3];
  _QWORD v393[3];
  _QWORD v394[3];
  _QWORD v395[3];
  _BYTE v396[128];
  _BYTE v397[128];
  _BYTE v398[128];
  _BYTE v399[128];
  _QWORD v400[3];
  _QWORD v401[3];
  _BYTE v402[128];
  _QWORD v403[3];
  _QWORD v404[3];
  _QWORD v405[2];
  _BYTE v406[128];
  _QWORD v407[3];
  _QWORD v408[3];
  _BYTE v409[128];
  _QWORD v410[3];
  _QWORD v411[3];
  _QWORD v412[3];
  _QWORD v413[3];
  uint64_t v414;
  uint64_t v415;
  _QWORD v416[2];
  _QWORD v417[2];
  _QWORD v418[2];
  _QWORD v419[2];
  _BYTE v420[128];
  _QWORD v421[2];
  _QWORD v422[2];
  _QWORD v423[2];
  _QWORD v424[2];
  _BYTE v425[128];
  _QWORD v426[3];
  _QWORD v427[3];
  _QWORD v428[3];
  _QWORD v429[3];
  _QWORD v430[3];
  _QWORD v431[3];
  _BYTE v432[128];
  _QWORD v433[3];
  _QWORD v434[3];
  _BYTE v435[128];
  uint64_t v436;

  v4 = MEMORY[0x24BDAC7A8](self, a2, a3, a4);
  v6 = v5;
  v7 = (_QWORD *)v4;
  v436 = *MEMORY[0x24BDAC8D0];
  v279 = v8;
  v297 = v6;
  v289 = (void *)objc_opt_new();
  +[SRCSSpokenCommandUtilities sharedSpokenCommandUtilities](SRCSSpokenCommandUtilities, "sharedSpokenCommandUtilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commandStringsTableForLocaleIdentifier:", v7[1]);
  v282 = (void *)objc_claimAutoreleasedReturnValue();

  v272 = (void *)objc_opt_new();
  v368 = 0u;
  v369 = 0u;
  v370 = 0u;
  v371 = 0u;
  objc_msgSend((id)AllValidCommandParameterIdentifiers(), "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v368, v435, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v369;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v369 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v368 + 1) + 8 * i);
        +[SRCSCommandStringsTable activeTargetTypes](SRCSCommandStringsTable, "activeTargetTypes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v282, "descriptionStringForCommandIdentifier:descriptionType:targetTypes:", v15, CFSTR("NAME"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v17, "length"))
          objc_msgSend(v272, "setObject:forKey:", v17, v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v368, v435, 16);
    }
    while (v12);
  }
  v287 = v7;

  +[SRCSCommandStringsTable activeTargetTypes](SRCSCommandStringsTable, "activeTargetTypes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v282, "descriptionStringForCommandIdentifier:descriptionType:targetTypes:", CFSTR("Section.Phrases"), CFSTR("TITL"), v18);
  v19 = objc_claimAutoreleasedReturnValue();

  v20 = 0x24BDD1000uLL;
  v21 = objc_alloc(MEMORY[0x24BDD1688]);
  v22 = 0x24BDD1000uLL;
  if (v19)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n"), v19);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = &stru_24F657348;
  }
  v24 = (void *)v19;
  v433[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
  v433[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
  v434[0] = kSRCSCommandDescriptionsSectionTitleValue;
  v434[1] = kSRCSCommandDescriptionsSectionTitleValue;
  v433[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
  v434[2] = kSRCSCommandDescriptionsSectionTitleValue;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v434, v433, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v21, "initWithString:attributes:", v23, v25);

  v27 = v289;
  if (v24)

  v262 = (void *)v26;
  v263 = v24;
  objc_msgSend(v289, "appendAttributedString:", v26);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("CommandDisplay.commandDisplayWithBulletAndNewLineFormatter"), &stru_24F657348, 0);
  v275 = (void *)objc_claimAutoreleasedReturnValue();

  +[SRCSCommandStringsTable activeTargetTypes](SRCSCommandStringsTable, "activeTargetTypes");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v367 = 0;
  objc_msgSend(v287, "languageModelDictionaryForCommandIdentifier:targetTypes:parsingErrorString:", v279, v29, &v367);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v367;

  v260 = v31;
  v32 = 0;
  if (!objc_msgSend(v31, "length"))
  {
    objc_msgSend(v287, "spokenStringPermutationsOfLanguageModelDictionary:stringsTable:restrictPermutationsToShortestAndLongest:", v30, v272, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v261 = (void *)v30;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  v363 = 0u;
  v364 = 0u;
  v365 = 0u;
  v366 = 0u;
  obj = v32;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v363, v432, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v364;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v364 != v35)
          objc_enumerationMutation(obj);
        objc_msgSend(v269, "appendFormat:", v275, *(_QWORD *)(*((_QWORD *)&v363 + 1) + 8 * j));
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v363, v432, 16);
    }
    while (v34);
  }

  v37 = objc_alloc(MEMORY[0x24BDD1688]);
  v430[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
  v430[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
  v431[0] = kSRCSCommandDescriptionsVariantValue;
  v431[1] = kSRCSCommandDescriptionsSectionDescValue;
  v430[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
  v431[2] = kSRCSCommandDescriptionsSectionDescValue;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v431, v430, 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v37, "initWithString:attributes:", v269, v38);

  v259 = (void *)v39;
  objc_msgSend(v289, "appendAttributedString:", v39);
  +[SRCSCommandStringsTable activeTargetTypes](SRCSCommandStringsTable, "activeTargetTypes");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v282, "descriptionStringForCommandIdentifier:descriptionType:targetTypes:", v279, CFSTR("SUMM"), v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v287, "parameterIdentifiersFromCommandIdentifier:", v279);
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  v264 = v41;
  if (objc_msgSend(v41, "length") || objc_msgSend(v270, "count"))
  {
    +[SRCSCommandStringsTable activeTargetTypes](SRCSCommandStringsTable, "activeTargetTypes");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v282, "descriptionStringForCommandIdentifier:descriptionType:targetTypes:", CFSTR("Section.Description"), CFSTR("TITL"), v42);
    v43 = objc_claimAutoreleasedReturnValue();

    v44 = objc_alloc(MEMORY[0x24BDD1688]);
    v45 = &stru_24F657348;
    if (v43)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n"), v43);
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v428[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
    v428[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
    v429[0] = kSRCSCommandDescriptionsSectionTitleValue;
    v429[1] = kSRCSCommandDescriptionsSectionTitleValue;
    v428[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
    v429[2] = kSRCSCommandDescriptionsSectionTitleValue;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v429, v428, 3);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v44, "initWithString:attributes:", v45, v46);

    v290 = (id)v43;
    if (v43)

    v284 = (id)v47;
    objc_msgSend(v289, "appendAttributedString:", v47);
    v48 = v272;
    if (objc_msgSend(v41, "length"))
    {
      v49 = objc_alloc(MEMORY[0x24BDD1688]);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n"), v41);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)objc_msgSend(v49, "initWithString:", v50);

      objc_msgSend(v282, "resolveReferencesInMutableAttributedString:stringsTable:", v51, v272);
      v426[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
      v426[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
      v427[0] = kSRCSCommandDescriptionsSectionDescValue;
      v427[1] = kSRCSCommandDescriptionsSectionDescValue;
      v426[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
      v427[2] = kSRCSCommandDescriptionsSectionDescValue;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v427, v426, 3);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addAttributes:range:", v52, 0, objc_msgSend(v51, "length"));

      objc_msgSend(v289, "appendAttributedString:", v51);
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v308 = (id)objc_claimAutoreleasedReturnValue();
    v359 = 0u;
    v360 = 0u;
    v361 = 0u;
    v362 = 0u;
    v294 = v270;
    v304 = (id)objc_msgSend(v294, "countByEnumeratingWithState:objects:count:", &v359, v425, 16);
    if (v304)
    {
      v298 = *(_QWORD *)v360;
      v53 = 0.0;
      do
      {
        for (k = 0; k != v304; k = (char *)k + 1)
        {
          if (*(_QWORD *)v360 != v298)
            objc_enumerationMutation(v294);
          v55 = *(_QWORD *)(*((_QWORD *)&v359 + 1) + 8 * (_QWORD)k);
          objc_msgSend(v48, "objectForKey:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          +[SRCSCommandStringsTable formattedBuiltInCommandString:](SRCSCommandStringsTable, "formattedBuiltInCommandString:", v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v57, "length"))
          {
            v58 = objc_alloc(MEMORY[0x24BDD1688]);
            v423[0] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
            v423[1] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
            v424[0] = kSRCSCommandDescriptionsSectionDescBoldValue;
            v424[1] = kSRCSCommandDescriptionsSectionDescValue;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v424, v423, 2);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = (void *)objc_msgSend(v58, "initWithString:attributes:", v57, v59);

            objc_msgSend(v287, "_descriptionTypeForParameterIdentifier:commandIdentifier:", v55, v279);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_alloc(MEMORY[0x24BDD1688]);
            +[SRCSCommandStringsTable activeTargetTypes](SRCSCommandStringsTable, "activeTargetTypes");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v282, "descriptionStringForCommandIdentifier:descriptionType:targetTypes:", v55, v61, v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = (__CFString *)objc_msgSend(v62, "initWithString:", v64);

            v48 = v272;
            objc_msgSend(v282, "resolveReferencesInMutableAttributedString:stringsTable:", v65, v272);
            v421[0] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
            v421[1] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
            v422[0] = kSRCSCommandDescriptionsSectionDescValue;
            v422[1] = kSRCSCommandDescriptionsSectionDescValue;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v422, v421, 2);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString addAttributes:range:](v65, "addAttributes:range:", v66, 0, -[__CFString length](v65, "length"));

            if (-[__CFString length](v65, "length"))
              v67 = v65;
            else
              v67 = &stru_24F657348;
            objc_msgSend(v308, "setObject:forKey:", v67, v60);
            if (v297)
              v297[2]();
            else
              v68 = 10.0;
            v69 = v68;
            if (v53 < v69)
              v53 = v69;

          }
        }
        v304 = (id)objc_msgSend(v294, "countByEnumeratingWithState:objects:count:", &v359, v425, 16);
      }
      while (v304);
    }
    else
    {
      v53 = 0.0;
    }

    v70 = (void *)objc_opt_new();
    v355 = 0u;
    v356 = 0u;
    v357 = 0u;
    v358 = 0u;
    objc_msgSend(v308, "allKeys");
    v295 = (id)objc_claimAutoreleasedReturnValue();
    v305 = (id)objc_msgSend(v295, "countByEnumeratingWithState:objects:count:", &v355, v420, 16);
    if (v305)
    {
      v299 = *(_QWORD *)v356;
      do
      {
        for (m = 0; m != v305; m = (char *)m + 1)
        {
          if (*(_QWORD *)v356 != v299)
            objc_enumerationMutation(v295);
          v72 = *(_QWORD *)(*((_QWORD *)&v355 + 1) + 8 * (_QWORD)m);
          objc_msgSend(v70, "appendAttributedString:", v72);
          v73 = objc_alloc(MEMORY[0x24BDD1688]);
          v418[0] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
          v418[1] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
          v419[0] = kSRCSCommandDescriptionsSectionDescValue;
          v419[1] = kSRCSCommandDescriptionsSectionDescValue;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v419, v418, 2);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = (void *)objc_msgSend(v73, "initWithString:attributes:", CFSTR("\t"), v74);
          objc_msgSend(v70, "appendAttributedString:", v75);

          objc_msgSend(v308, "objectForKey:", v72);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "appendAttributedString:", v76);

          v77 = objc_alloc(MEMORY[0x24BDD1688]);
          v416[0] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
          v416[1] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
          v417[0] = kSRCSCommandDescriptionsSectionDescValue;
          v417[1] = kSRCSCommandDescriptionsSectionDescValue;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v417, v416, 2);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = (void *)objc_msgSend(v77, "initWithString:attributes:", CFSTR("\n"), v78);
          objc_msgSend(v70, "appendAttributedString:", v79);

        }
        v305 = (id)objc_msgSend(v295, "countByEnumeratingWithState:objects:count:", &v355, v420, 16);
      }
      while (v305);
    }

    v414 = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
    v415 = kSRCSCommandDescriptionsParameterValue;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v415, &v414, 1);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addAttributes:range:", v80, 0, objc_msgSend(v70, "length"));

    v27 = v289;
    objc_msgSend(v289, "appendAttributedString:", v70);
    +[SRCSCommandStringsTable activeTargetTypes](SRCSCommandStringsTable, "activeTargetTypes");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v282, "descriptionStringForCommandIdentifier:descriptionType:targetTypes:", v279, CFSTR("DESC"), v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0x24BDD1000uLL;
    v22 = 0x24BDD1000uLL;
    if (objc_msgSend(v82, "length"))
    {
      v83 = objc_alloc(MEMORY[0x24BDD1688]);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n"), v82);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = (void *)objc_msgSend(v83, "initWithString:", v84);

      objc_msgSend(v282, "resolveReferencesInMutableAttributedString:stringsTable:", v85, v272);
      v412[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
      v412[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
      v413[0] = kSRCSCommandDescriptionsSectionDescValue;
      v413[1] = kSRCSCommandDescriptionsSectionDescValue;
      v412[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
      v413[2] = kSRCSCommandDescriptionsSectionDescValue;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v413, v412, 3);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "addAttributes:range:", v86, 0, objc_msgSend(v85, "length"));

      objc_msgSend(v289, "appendAttributedString:", v85);
    }

  }
  else
  {
    v53 = 0.0;
  }
  v87 = v282;
  if (objc_msgSend(v270, "count"))
  {
    objc_msgSend(v287, "_exampleStringPermutationsFromCommandIdentifier:", v279);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v88, "count"))
    {
      +[SRCSCommandStringsTable activeTargetTypes](SRCSCommandStringsTable, "activeTargetTypes");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v282, "descriptionStringForCommandIdentifier:descriptionType:targetTypes:", CFSTR("Section.Examples"), CFSTR("TITL"), v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      v91 = objc_alloc(MEMORY[0x24BDD1688]);
      if (v90)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n"), v90);
        v92 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v92 = &stru_24F657348;
      }
      v410[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
      v410[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
      v411[0] = kSRCSCommandDescriptionsSectionTitleValue;
      v411[1] = kSRCSCommandDescriptionsSectionTitleValue;
      v410[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
      v411[2] = kSRCSCommandDescriptionsSectionTitleValue;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v411, v410, 3);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = (void *)objc_msgSend(v91, "initWithString:attributes:", v92, v93);

      if (v90)
      objc_msgSend(v27, "appendAttributedString:", v94);
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v351 = 0u;
      v352 = 0u;
      v353 = 0u;
      v354 = 0u;
      v96 = v88;
      v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v351, v409, 16);
      if (v97)
      {
        v98 = v97;
        v99 = *(_QWORD *)v352;
        do
        {
          for (n = 0; n != v98; ++n)
          {
            if (*(_QWORD *)v352 != v99)
              objc_enumerationMutation(v96);
            objc_msgSend(v95, "appendFormat:", v275, *(_QWORD *)(*((_QWORD *)&v351 + 1) + 8 * n));
          }
          v98 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v351, v409, 16);
        }
        while (v98);
      }

      v101 = objc_alloc(MEMORY[0x24BDD1688]);
      v407[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
      v407[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
      v408[0] = kSRCSCommandDescriptionsVariantValue;
      v408[1] = kSRCSCommandDescriptionsSectionDescValue;
      v407[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
      v408[2] = kSRCSCommandDescriptionsSectionDescValue;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v408, v407, 3);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = (void *)objc_msgSend(v101, "initWithString:attributes:", v95, v102);

      objc_msgSend(v27, "appendAttributedString:", v103);
      v20 = 0x24BDD1000uLL;

      v87 = v282;
    }

  }
  v349 = 0u;
  v350 = 0u;
  v347 = 0u;
  v348 = 0u;
  v405[0] = kSRCSCommandParameterModifierKeys[0];
  v405[1] = kSRCSCommandParameterKeyboardKeyName[0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v405, 2);
  v309 = (id)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v309, "countByEnumeratingWithState:objects:count:", &v347, v406, 16);
  if (v104)
  {
    v105 = v104;
    v106 = *(_QWORD *)v348;
    v300 = *(_QWORD *)v348;
    do
    {
      for (ii = 0; ii != v105; ++ii)
      {
        if (*(_QWORD *)v348 != v106)
          objc_enumerationMutation(v309);
        v108 = *(_QWORD *)(*((_QWORD *)&v347 + 1) + 8 * ii);
        if (objc_msgSend(v270, "containsObject:", v108))
        {
          objc_msgSend(v87, "exampleParameterStringsTable");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "objectForKey:", v108);
          v110 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v110, "count"))
          {
            v111 = *(void **)(v22 + 1992);
            +[SRCSCommandStringsTable activeTargetTypes](SRCSCommandStringsTable, "activeTargetTypes");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "descriptionStringForCommandIdentifier:descriptionType:targetTypes:", v108, CFSTR("TITL"), v112);
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "stringWithFormat:", CFSTR("%@\n"), v113);
            v114 = v27;
            v115 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v116 = objc_alloc(MEMORY[0x24BDD1688]);
            if (v115)
              v117 = v115;
            else
              v117 = &stru_24F657348;
            v403[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
            v403[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
            v404[0] = kSRCSCommandDescriptionsSectionTitleValue;
            v404[1] = kSRCSCommandDescriptionsSectionTitleValue;
            v403[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
            v404[2] = kSRCSCommandDescriptionsSectionTitleValue;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v404, v403, 3);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            v119 = (void *)objc_msgSend(v116, "initWithString:attributes:", v117, v118);

            objc_msgSend(v114, "appendAttributedString:", v119);
            objc_msgSend(MEMORY[0x24BDD16A8], "string");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            v343 = 0u;
            v344 = 0u;
            v345 = 0u;
            v346 = 0u;
            objc_msgSend(v110, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v343, v402, 16);
            if (v122)
            {
              v123 = v122;
              v124 = *(_QWORD *)v344;
              do
              {
                for (jj = 0; jj != v123; ++jj)
                {
                  if (*(_QWORD *)v344 != v124)
                    objc_enumerationMutation(v121);
                  objc_msgSend(v120, "appendFormat:", v275, *(_QWORD *)(*((_QWORD *)&v343 + 1) + 8 * jj));
                }
                v123 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v343, v402, 16);
              }
              while (v123);
            }

            v126 = objc_alloc(MEMORY[0x24BDD1688]);
            v400[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
            v400[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
            v401[0] = kSRCSCommandDescriptionsVariantValue;
            v401[1] = kSRCSCommandDescriptionsSectionDescValue;
            v400[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
            v401[2] = kSRCSCommandDescriptionsSectionDescValue;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v401, v400, 3);
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            v128 = (void *)objc_msgSend(v126, "initWithString:attributes:", v120, v127);

            objc_msgSend(v289, "appendAttributedString:", v128);
            v27 = v289;
            v20 = 0x24BDD1000uLL;
            v87 = v282;
            v22 = 0x24BDD1000;
            v106 = v300;
          }

        }
      }
      v105 = objc_msgSend(v309, "countByEnumeratingWithState:objects:count:", &v347, v406, 16);
    }
    while (v105);
  }

  if ((objc_msgSend(v279, "isEqualToString:", CFSTR("Dictation.Streaming")) & 1) != 0
    || (objc_msgSend(v279, "isEqualToString:", CFSTR("System.StartDictationMode")) & 1) != 0
    || (v130 = 0.0, objc_msgSend(v279, "isEqualToString:", CFSTR("System.StartSpellingMode"))))
  {
    +[SRCSSpokenCommandUtilities sharedSpokenCommandUtilities](SRCSSpokenCommandUtilities, "sharedSpokenCommandUtilities");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = v287[1];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "dictionaryForLocaleIdentifier:bundle:subDirectory:rootFileName:rootFileExtension:", v132, v133, CFSTR("LocalizedCommandDocumentation"), CFSTR("EmbeddedCommands"), CFSTR("plist"));
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    if (v134)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "localizedStringForKey:value:table:", CFSTR("CommandDisplay.commandDisplayQuotedWithBulletFormatter"), &stru_24F657348, 0);
      v310 = (id)objc_claimAutoreleasedReturnValue();

      v341 = 0u;
      v342 = 0u;
      v339 = 0u;
      v340 = 0u;
      v258 = v134;
      objc_msgSend(v134, "objectForKey:", kSRCSEmbeddedCommandsKeySections);
      v285 = (id)objc_claimAutoreleasedReturnValue();
      v296 = (__CFString *)objc_msgSend(v285, "countByEnumeratingWithState:objects:count:", &v339, v399, 16);
      if (v296)
      {
        v291 = *(id *)v340;
        v130 = 0.0;
        do
        {
          v136 = 0;
          do
          {
            if (*(id *)v340 != v291)
              objc_enumerationMutation(v285);
            v301 = v136;
            v137 = *(void **)(*((_QWORD *)&v339 + 1) + 8 * v136);
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            v335 = 0u;
            v336 = 0u;
            v337 = 0u;
            v338 = 0u;
            objc_msgSend(v137, "objectForKey:", kSRCSEmbeddedCommandsKeyItems);
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            v140 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v335, v398, 16);
            if (v140)
            {
              v141 = v140;
              v142 = *(_QWORD *)v336;
              do
              {
                for (kk = 0; kk != v141; ++kk)
                {
                  if (*(_QWORD *)v336 != v142)
                    objc_enumerationMutation(v139);
                  v144 = *(void **)(*((_QWORD *)&v335 + 1) + 8 * kk);
                  objc_msgSend(v144, "objectForKey:", kSRCSEmbeddedCommandsKeyMode);
                  v145 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v145, "isEqualToString:", kSRCSEmbeddedCommandsModeAll) & 1) != 0)
                    goto LABEL_116;
                  v146 = objc_msgSend(v279, "isEqualToString:", CFSTR("System.StartSpellingMode"));
                  v147 = &kSRCSEmbeddedCommandsModeSpellingOnly;
                  if (!v146)
                    v147 = &kSRCSEmbeddedCommandsModeDictationOnly;
                  if (objc_msgSend(v145, "isEqualToString:", *v147))
LABEL_116:
                    objc_msgSend(v138, "addObject:", v144);

                }
                v141 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v335, v398, 16);
              }
              while (v141);
            }

            v333 = 0u;
            v334 = 0u;
            v331 = 0u;
            v332 = 0u;
            v306 = v138;
            v148 = objc_msgSend(v306, "countByEnumeratingWithState:objects:count:", &v331, v397, 16);
            if (v148)
            {
              v149 = v148;
              v150 = *(_QWORD *)v332;
              do
              {
                for (mm = 0; mm != v149; ++mm)
                {
                  if (*(_QWORD *)v332 != v150)
                    objc_enumerationMutation(v306);
                  objc_msgSend(*(id *)(*((_QWORD *)&v331 + 1) + 8 * mm), "objectForKey:", kSRCSEmbeddedCommandsKeyCommandStrings);
                  v152 = (void *)objc_claimAutoreleasedReturnValue();
                  v327 = 0u;
                  v328 = 0u;
                  v329 = 0u;
                  v330 = 0u;
                  v153 = v152;
                  v154 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v327, v396, 16);
                  if (v154)
                  {
                    v155 = v154;
                    v156 = *(_QWORD *)v328;
                    do
                    {
                      for (nn = 0; nn != v155; ++nn)
                      {
                        if (*(_QWORD *)v328 != v156)
                          objc_enumerationMutation(v153);
                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v310, *(_QWORD *)(*((_QWORD *)&v327 + 1) + 8 * nn));
                        v158 = (void *)objc_claimAutoreleasedReturnValue();
                        v159 = objc_alloc(MEMORY[0x24BDD1688]);
                        v394[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
                        v394[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
                        v395[0] = kSRCSCommandDescriptionsPuncCommentValue;
                        v395[1] = kSRCSCommandDescriptionsSectionDescValue;
                        v394[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
                        v395[2] = kSRCSCommandDescriptionsSectionDescValue;
                        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v395, v394, 3);
                        v160 = (void *)objc_claimAutoreleasedReturnValue();
                        v161 = (void *)objc_msgSend(v159, "initWithString:attributes:", v158, v160);

                        if (v297)
                          v297[2]();
                        else
                          v162 = 10.0;
                        v163 = v162;
                        if (v130 < v163)
                          v130 = v163;

                      }
                      v155 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v327, v396, 16);
                    }
                    while (v155);
                  }

                  v20 = 0x24BDD1000;
                }
                v149 = objc_msgSend(v306, "countByEnumeratingWithState:objects:count:", &v331, v397, 16);
              }
              while (v149);
            }

            v136 = v301 + 1;
            v27 = v289;
          }
          while ((__CFString *)(v301 + 1) != v296);
          v296 = (__CFString *)objc_msgSend(v285, "countByEnumeratingWithState:objects:count:", &v339, v399, 16);
        }
        while (v296);
      }
      else
      {
        v130 = 0.0;
      }

      +[SRCSCommandStringsTable activeTargetTypes](SRCSCommandStringsTable, "activeTargetTypes");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = v282;
      objc_msgSend(v282, "descriptionStringForCommandIdentifier:descriptionType:targetTypes:", CFSTR("Section.Punctuation"), CFSTR("TITL"), v164);
      v165 = objc_claimAutoreleasedReturnValue();

      v166 = objc_alloc(*(Class *)(v20 + 1672));
      if (v165)
      {
        v167 = 0x24BDD1000uLL;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n"), v165);
        v168 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v168 = &stru_24F657348;
        v167 = 0x24BDD1000uLL;
      }
      v169 = (void *)v165;
      v392[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
      v392[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
      v393[0] = kSRCSCommandDescriptionsSectionTitleValue;
      v393[1] = kSRCSCommandDescriptionsSectionTitleValue;
      v392[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
      v393[2] = kSRCSCommandDescriptionsSectionTitleValue;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v393, v392, 3);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = objc_msgSend(v166, "initWithString:attributes:", v168, v170);

      v257 = v169;
      if (v169)

      v256 = (void *)v171;
      objc_msgSend(v27, "appendAttributedString:", v171);
      if (objc_msgSend(v279, "isEqualToString:", CFSTR("System.StartSpellingMode")))
        v172 = CFSTR("DSC2");
      else
        v172 = CFSTR("DESC");
      +[SRCSCommandStringsTable activeTargetTypes](SRCSCommandStringsTable, "activeTargetTypes");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v282, "descriptionStringForCommandIdentifier:descriptionType:targetTypes:", CFSTR("Section.Punctuation"), v172, v173);
      v174 = objc_claimAutoreleasedReturnValue();

      v175 = objc_alloc(MEMORY[0x24BDD1688]);
      if (v174)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n"), v174);
        v176 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v176 = &stru_24F657348;
      }
      v390[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
      v390[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
      v391[0] = kSRCSCommandDescriptionsSectionDescValue;
      v391[1] = kSRCSCommandDescriptionsSectionDescValue;
      v390[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
      v391[2] = kSRCSCommandDescriptionsSectionDescValue;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v391, v390, 3);
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      v178 = objc_msgSend(v175, "initWithString:attributes:", v176, v177);

      v255 = (void *)v174;
      if (v174)

      v254 = (void *)v178;
      objc_msgSend(v27, "appendAttributedString:", v178);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "localizedStringForKey:value:table:", CFSTR("CommandDisplay.commandDisplayHortLine"), &stru_24F657348, 0);
      v281 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v325 = 0u;
      v326 = 0u;
      v323 = 0u;
      v324 = 0u;
      objc_msgSend(v258, "objectForKey:", kSRCSEmbeddedCommandsKeySections);
      v265 = (id)objc_claimAutoreleasedReturnValue();
      v268 = objc_msgSend(v265, "countByEnumeratingWithState:objects:count:", &v323, v389, 16);
      if (v268)
      {
        v267 = *(_QWORD *)v324;
        do
        {
          v180 = 0;
          do
          {
            if (*(_QWORD *)v324 != v267)
              objc_enumerationMutation(v265);
            v271 = v180;
            v181 = *(void **)(*((_QWORD *)&v323 + 1) + 8 * v180);
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v182 = (void *)objc_claimAutoreleasedReturnValue();
            v319 = 0u;
            v320 = 0u;
            v321 = 0u;
            v322 = 0u;
            v273 = v181;
            objc_msgSend(v181, "objectForKey:", kSRCSEmbeddedCommandsKeyItems);
            v183 = (void *)objc_claimAutoreleasedReturnValue();
            v184 = objc_msgSend(v183, "countByEnumeratingWithState:objects:count:", &v319, v388, 16);
            if (v184)
            {
              v185 = v184;
              v186 = *(_QWORD *)v320;
              do
              {
                for (i1 = 0; i1 != v185; ++i1)
                {
                  if (*(_QWORD *)v320 != v186)
                    objc_enumerationMutation(v183);
                  v188 = *(void **)(*((_QWORD *)&v319 + 1) + 8 * i1);
                  objc_msgSend(v188, "objectForKey:", kSRCSEmbeddedCommandsKeyMode);
                  v189 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v189, "isEqualToString:", kSRCSEmbeddedCommandsModeAll) & 1) != 0)
                    goto LABEL_170;
                  v190 = objc_msgSend(v279, "isEqualToString:", CFSTR("System.StartSpellingMode"));
                  v191 = &kSRCSEmbeddedCommandsModeSpellingOnly;
                  if (!v190)
                    v191 = &kSRCSEmbeddedCommandsModeDictationOnly;
                  if (objc_msgSend(v189, "isEqualToString:", *v191))
LABEL_170:
                    objc_msgSend(v182, "addObject:", v188);

                }
                v185 = objc_msgSend(v183, "countByEnumeratingWithState:objects:count:", &v319, v388, 16);
              }
              while (v185);
            }

            v192 = objc_msgSend(v182, "count");
            v315 = 0u;
            v316 = 0u;
            v317 = 0u;
            v318 = 0u;
            v274 = v182;
            v280 = objc_msgSend(v274, "countByEnumeratingWithState:objects:count:", &v315, v387, 16);
            if (!v280)
            {
              v87 = v282;
              goto LABEL_208;
            }
            v193 = 0;
            v194 = 0;
            v277 = *(_QWORD *)v316;
            v278 = v192 - 1;
            v87 = v282;
            do
            {
              v195 = 0;
              do
              {
                if (*(_QWORD *)v316 != v277)
                  objc_enumerationMutation(v274);
                v283 = v195;
                v286 = v193;
                v307 = *(id *)(*((_QWORD *)&v315 + 1) + 8 * v195);
                v196 = 0x24BDD1000uLL;
                if ((v194 & 1) == 0)
                {
                  v197 = *(void **)(v167 + 1992);
                  objc_msgSend(v273, "objectForKey:", kSRCSEmbeddedCommandsKeyTitle);
                  v198 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v197, "stringWithFormat:", CFSTR("PunctuationGroup.%@"), v198);
                  v199 = (void *)objc_claimAutoreleasedReturnValue();
                  +[SRCSCommandStringsTable activeTargetTypes](SRCSCommandStringsTable, "activeTargetTypes");
                  v200 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v87, "descriptionStringForCommandIdentifier:descriptionType:targetTypes:", v199, CFSTR("TITL"), v200);
                  v201 = objc_claimAutoreleasedReturnValue();

                  v202 = objc_alloc(MEMORY[0x24BDD1688]);
                  if (v201)
                  {
                    objc_msgSend(*(id *)(v167 + 1992), "stringWithFormat:", CFSTR("%@\n"), v201);
                    v203 = (const __CFString *)objc_claimAutoreleasedReturnValue();
                    v276 = (__CFString *)v203;
                  }
                  else
                  {
                    v203 = &stru_24F657348;
                  }
                  v385[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
                  v385[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
                  v386[0] = kSRCSCommandDescriptionsSectionSubTitleValue;
                  v386[1] = kSRCSCommandDescriptionsSectionSubTitleValue;
                  v385[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
                  v386[2] = kSRCSCommandDescriptionsSectionSubTitleValue;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v386, v385, 3);
                  v204 = (void *)objc_claimAutoreleasedReturnValue();
                  v205 = objc_msgSend(v202, "initWithString:attributes:", v203, v204);

                  v302 = (void *)v201;
                  if (v201)

                  objc_msgSend(v27, "appendAttributedString:", v205);
                  v206 = objc_alloc(MEMORY[0x24BDD1688]);
                  objc_msgSend(*(id *)(v167 + 1992), "stringWithFormat:", CFSTR("%@\n"), v281);
                  v207 = (void *)objc_claimAutoreleasedReturnValue();
                  v383[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
                  v383[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
                  v384[0] = kSRCSCommandDescriptionsPuncDividerValue;
                  v384[1] = kSRCSCommandDescriptionsPuncDividerValue;
                  v383[2] = kSRCSCommandDescriptionsStrikethroughColorPlaceholderAttributeName;
                  v383[3] = kSRCSCommandDescriptionsStrikethroughStylePlaceholderAttributeName;
                  v384[2] = kSRCSCommandDescriptionsSectionDescValue;
                  v384[3] = kSRCSCommandDescriptionsSectionDescValue;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v384, v383, 4);
                  v208 = (void *)objc_claimAutoreleasedReturnValue();
                  v209 = (void *)objc_msgSend(v206, "initWithString:attributes:", v207, v208);

                  objc_msgSend(v27, "appendAttributedString:", v209);
                  v292 = (id)v205;
                  +[SRCSCommandStringsTable activeTargetTypes](SRCSCommandStringsTable, "activeTargetTypes");
                  v210 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v282, "descriptionStringForCommandIdentifier:descriptionType:targetTypes:", CFSTR("PunctuationColumnHeader.Phrase"), CFSTR("TITL"), v210);
                  v211 = (void *)objc_claimAutoreleasedReturnValue();

                  +[SRCSCommandStringsTable activeTargetTypes](SRCSCommandStringsTable, "activeTargetTypes");
                  v212 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v282, "descriptionStringForCommandIdentifier:descriptionType:targetTypes:", CFSTR("PunctuationColumnHeader.Result"), CFSTR("TITL"), v212);
                  v213 = (void *)objc_claimAutoreleasedReturnValue();

                  v214 = objc_alloc(MEMORY[0x24BDD1688]);
                  objc_msgSend(*(id *)(v167 + 1992), "stringWithFormat:", CFSTR("%@\t%@\n"), v211, v213);
                  v215 = (void *)objc_claimAutoreleasedReturnValue();
                  v381[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
                  v381[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
                  v382[0] = kSRCSCommandDescriptionsHeaderValue;
                  v382[1] = kSRCSCommandDescriptionsSectionDescValue;
                  v381[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
                  v382[2] = kSRCSCommandDescriptionsSectionDescValue;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v382, v381, 3);
                  v216 = (void *)objc_claimAutoreleasedReturnValue();
                  v217 = (void *)objc_msgSend(v214, "initWithString:attributes:", v215, v216);

                  v196 = 0x24BDD1000uLL;
                  objc_msgSend(v27, "appendAttributedString:", v217);
                  objc_msgSend(v27, "appendAttributedString:", v209);

                }
                objc_msgSend(v307, "objectForKey:", kSRCSEmbeddedCommandsKeyCommandStrings);
                v218 = (void *)objc_claimAutoreleasedReturnValue();
                v311 = 0u;
                v312 = 0u;
                v313 = 0u;
                v314 = 0u;
                v293 = v218;
                v219 = objc_msgSend(v293, "countByEnumeratingWithState:objects:count:", &v311, v380, 16);
                if (v219)
                {
                  v220 = v219;
                  v221 = 0;
                  v303 = *(_QWORD *)v312;
                  do
                  {
                    v222 = 0;
                    v288 = v221;
                    v223 = -v221;
                    do
                    {
                      if (*(_QWORD *)v312 != v303)
                        objc_enumerationMutation(v293);
                      objc_msgSend(*(id *)(v167 + 1992), "stringWithFormat:", v310, *(_QWORD *)(*((_QWORD *)&v311 + 1) + 8 * v222));
                      v224 = (void *)objc_claimAutoreleasedReturnValue();
                      v225 = objc_alloc(*(Class *)(v196 + 1672));
                      v226 = *(void **)(v167 + 1992);
                      v227 = &stru_24F657348;
                      if (v223 == v222)
                      {
                        objc_msgSend(v307, "objectForKey:", kSRCSEmbeddedCommandsKeyResult);
                        v296 = (__CFString *)objc_claimAutoreleasedReturnValue();
                        v227 = v296;
                      }
                      objc_msgSend(v226, "stringWithFormat:", CFSTR("%@\t%@"), v224, v227);
                      v228 = (void *)objc_claimAutoreleasedReturnValue();
                      v378[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
                      v378[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
                      v379[0] = kSRCSCommandDescriptionsItemValue;
                      v379[1] = kSRCSCommandDescriptionsSectionDescValue;
                      v378[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
                      v379[2] = kSRCSCommandDescriptionsSectionDescValue;
                      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v379, v378, 3);
                      v229 = (void *)objc_claimAutoreleasedReturnValue();
                      v230 = (void *)objc_msgSend(v225, "initWithString:attributes:", v228, v229);

                      if (v223 != v222)
                      {
                        objc_msgSend(v27, "appendAttributedString:", v230);
                        v167 = 0x24BDD1000uLL;
LABEL_199:
                        v241 = objc_alloc(*(Class *)(v196 + 1672));
                        v374[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
                        v374[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
                        v375[0] = kSRCSCommandDescriptionsItemValue;
                        v375[1] = kSRCSCommandDescriptionsSectionDescValue;
                        v374[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
                        v375[2] = kSRCSCommandDescriptionsSectionDescValue;
                        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v375, v374, 3);
                        v235 = (void *)objc_claimAutoreleasedReturnValue();
                        v240 = (void *)objc_msgSend(v241, "initWithString:attributes:", CFSTR("\n"), v235);
                        goto LABEL_200;
                      }

                      objc_msgSend(v27, "appendAttributedString:", v230);
                      objc_msgSend(v307, "objectForKey:", kSRCSEmbeddedCommandsKeyComment);
                      v231 = (void *)objc_claimAutoreleasedReturnValue();
                      v232 = objc_msgSend(v231, "length");

                      v167 = 0x24BDD1000;
                      if (!v232)
                        goto LABEL_199;
                      v233 = objc_alloc(*(Class *)(v196 + 1672));
                      v234 = (void *)MEMORY[0x24BDD17C8];
                      objc_msgSend(v307, "objectForKey:", kSRCSEmbeddedCommandsKeyResult);
                      v235 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v235, "length"))
                        v236 = CFSTR("  ");
                      else
                        v236 = &stru_24F657348;
                      objc_msgSend(v307, "objectForKey:", kSRCSEmbeddedCommandsKeyComment);
                      v237 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v234, "stringWithFormat:", CFSTR("%@%@\n"), v236, v237);
                      v238 = (void *)objc_claimAutoreleasedReturnValue();
                      v376[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
                      v376[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
                      v377[0] = kSRCSCommandDescriptionsItemValue;
                      v377[1] = kSRCSCommandDescriptionsPuncCommentValue;
                      v376[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
                      v377[2] = kSRCSCommandDescriptionsPuncCommentValue;
                      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v377, v376, 3);
                      v239 = (void *)objc_claimAutoreleasedReturnValue();
                      v240 = (void *)objc_msgSend(v233, "initWithString:attributes:", v238, v239);

                      v196 = 0x24BDD1000;
                      v167 = 0x24BDD1000;

                      v27 = v289;
LABEL_200:

                      objc_msgSend(v27, "appendAttributedString:", v240);
                      ++v222;
                    }
                    while (v220 != v222);
                    v221 = v288 + v220;
                    v220 = objc_msgSend(v293, "countByEnumeratingWithState:objects:count:", &v311, v380, 16);
                  }
                  while (v220);
                }

                v242 = objc_alloc(*(Class *)(v196 + 1672));
                v243 = &stru_24F657348;
                if ((uint64_t)v286 < v278)
                  v243 = v281;
                objc_msgSend(*(id *)(v167 + 1992), "stringWithFormat:", CFSTR("%@\n"), v243);
                v244 = (void *)objc_claimAutoreleasedReturnValue();
                v372[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
                v372[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
                v373[0] = kSRCSCommandDescriptionsPuncDividerValue;
                v373[1] = kSRCSCommandDescriptionsPuncDividerValue;
                v372[2] = kSRCSCommandDescriptionsStrikethroughColorPlaceholderAttributeName;
                v372[3] = kSRCSCommandDescriptionsStrikethroughStylePlaceholderAttributeName;
                v373[2] = kSRCSCommandDescriptionsPuncDividerValue;
                v373[3] = kSRCSCommandDescriptionsPuncDividerValue;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v373, v372, 4);
                v245 = (void *)objc_claimAutoreleasedReturnValue();
                v246 = (void *)objc_msgSend(v242, "initWithString:attributes:", v244, v245);

                objc_msgSend(v27, "appendAttributedString:", v246);
                v193 = v286 + 1;

                v87 = v282;
                v195 = v283 + 1;
                v194 = 1;
              }
              while (v283 + 1 != v280);
              v280 = objc_msgSend(v274, "countByEnumeratingWithState:objects:count:", &v315, v387, 16);
            }
            while (v280);
LABEL_208:

            v180 = v271 + 1;
          }
          while (v271 + 1 != v268);
          v268 = objc_msgSend(v265, "countByEnumeratingWithState:objects:count:", &v323, v389, 16);
        }
        while (v268);
      }

      v134 = v258;
    }
    else
    {
      v130 = 0.0;
    }

  }
  v247 = kSRCSCommandDescriptionsMaxParameterLengthPlaceholderAttributeName;
  *(float *)&v129 = v53;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v129);
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addAttribute:value:range:", v247, v248, 0, objc_msgSend(v27, "length"));

  v249 = kSRCSCommandDescriptionsMaxEmbeddedCommandLengthPlaceholderAttributeName;
  *(float *)&v250 = v130;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v250);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addAttribute:value:range:", v249, v251, 0, objc_msgSend(v27, "length"));

  v252 = v27;
  return v252;
}

- (id)_exampleStringPermutationsFromCommandIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v12;

  v4 = a3;
  +[SRCSCommandStringsTable activeTargetTypes](SRCSCommandStringsTable, "activeTargetTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  -[SRCSCommandStringsTable languageModelDictionaryForCommandIdentifier:targetTypes:parsingErrorString:](self, "languageModelDictionaryForCommandIdentifier:targetTypes:parsingErrorString:", v4, v5, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v12;
  v8 = objc_msgSend(v7, "length");

  v9 = 0;
  if (!v8)
  {
    -[SRCSCommandStringsTable exampleParameterStringsTable](self, "exampleParameterStringsTable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRCSCommandStringsTable spokenStringPermutationsOfLanguageModelDictionary:stringsTable:restrictPermutationsToShortestAndLongest:](self, "spokenStringPermutationsOfLanguageModelDictionary:stringsTable:restrictPermutationsToShortestAndLongest:", v6, v10, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_descriptionTypeForParameterIdentifier:(id)a3 commandIdentifier:(id)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  int v10;

  v6 = a3;
  v7 = a4;
  if (_descriptionTypeForParameterIdentifier_commandIdentifier__staticAlternateParameterDescriptionTypeTableSetUp != -1)
    dispatch_once(&_descriptionTypeForParameterIdentifier_commandIdentifier__staticAlternateParameterDescriptionTypeTableSetUp, &__block_literal_global_226);
  if (RXEngineTypeForLocaleIdentifier() != 1
    && ((objc_msgSend(v6, "isEqualToString:", CFSTR("BuiltInLM.TextSegmentCardinalNumber")) & 1) != 0
     || (objc_msgSend(v6, "isEqualToString:", CFSTR("BuiltInLM.ScreenDistanceCardinalNumber")) & 1) != 0)
    || objc_msgSend(v6, "hasPrefix:", CFSTR("BuiltInLM.Dictation"))
    && +[SRCSCommandStringsTable isLocaleIdentifier:containedInLocaleIdentifiers:](SRCSCommandStringsTable, "isLocaleIdentifier:containedInLocaleIdentifiers:", self->_localeIdentifier, RXLocalesSupportingSpellingMode()))
  {
    v8 = CFSTR("DSC2");
  }
  else
  {
    objc_msgSend((id)_descriptionTypeForParameterIdentifier_commandIdentifier__sAlternateParameterDescriptionTypeTable, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v7);

    if (v10)
      v8 = CFSTR("DSC2");
    else
      v8 = CFSTR("DESC");
  }

  return (id)v8;
}

void __84__SRCSCommandStringsTable__descriptionTypeForParameterIdentifier_commandIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = objc_opt_new();
  v1 = (void *)_descriptionTypeForParameterIdentifier_commandIdentifier__sAlternateParameterDescriptionTypeTable;
  _descriptionTypeForParameterIdentifier_commandIdentifier__sAlternateParameterDescriptionTypeTable = v0;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("System.OverlayIncrementLabel"), CFSTR("System.OverlayIncrementLabelUsingCardinalNumber"), CFSTR("System.OverlayDecrementLabel"), CFSTR("System.OverlayDecrementLabelUsingCardinalNumber"), CFSTR("System.OverlaySetValueByPercentAtLabel"), CFSTR("System.OverlayShowActionsForLabel"), CFSTR("System.OverlayShowContextualMenuAtLabel"), 0);
  objc_msgSend((id)_descriptionTypeForParameterIdentifier_commandIdentifier__sAlternateParameterDescriptionTypeTable, "setObject:forKey:", v2, kSRCSCommandParameterOverlayLabel[0]);

}

- (id)parameterIdentifiersFromCommandIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v4 = a3;
  +[SRCSCommandStringsTable activeTargetTypes](SRCSCommandStringsTable, "activeTargetTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  -[SRCSCommandStringsTable languageModelDictionaryForCommandIdentifier:targetTypes:parsingErrorString:](self, "languageModelDictionaryForCommandIdentifier:targetTypes:parsingErrorString:", v4, v5, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SRCSCommandStringsTable setOfBuiltInIdentifiersFromLanguageModelDictionary:](self, "setOfBuiltInIdentifiersFromLanguageModelDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)resolveReferencesInMutableAttributedString:(id)a3 stringsTable:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  SRCSCommandStringsTable *v42;
  id v43;
  id v44;
  const __CFString *v45;
  _QWORD v46[2];

  v42 = self;
  v46[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "rangeOfString:", CFSTR("{"));
  v10 = v9;

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v43 = v6;
    do
    {
      v11 = v8 + v10;
      objc_msgSend(v5, "string", v42);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "rangeOfString:options:range:", CFSTR("}"), 0, v8 + v10, objc_msgSend(v5, "length") - (v8 + v10));
      v15 = v14;

      objc_msgSend(v5, "string");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "substringWithRange:", v11, v13 - v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = 0;
      if (objc_msgSend(v17, "hasPrefix:", CFSTR("BuiltInLM.")))
      {
        objc_msgSend(v6, "objectForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = objc_alloc(MEMORY[0x24BDD1688]);
          objc_msgSend(v6, "objectForKey:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[SRCSCommandStringsTable formattedBuiltInCommandString:](SRCSCommandStringsTable, "formattedBuiltInCommandString:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v19, "initWithString:", v21);

          v6 = v43;
        }
      }
      if (objc_msgSend(v17, "hasPrefix:", CFSTR("CommonSection.")))
      {
        v22 = objc_alloc(MEMORY[0x24BDD1688]);
        +[SRCSCommandStringsTable activeTargetTypes](SRCSCommandStringsTable, "activeTargetTypes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[SRCSCommandStringsTable descriptionStringForCommandIdentifier:descriptionType:targetTypes:](v42, "descriptionStringForCommandIdentifier:descriptionType:targetTypes:", v17, CFSTR("DESC"), v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v22, "initWithString:", v24);

        v6 = v43;
        -[SRCSCommandStringsTable resolveReferencesInMutableAttributedString:stringsTable:](v42, "resolveReferencesInMutableAttributedString:stringsTable:", v25, v43);
        v18 = (void *)v25;
      }
      if (objc_msgSend(v17, "hasPrefix:", CFSTR("RemoteURLRef.")))
      {
        +[SRCSCommandStringsTable activeTargetTypes](SRCSCommandStringsTable, "activeTargetTypes");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[SRCSCommandStringsTable descriptionStringForCommandIdentifier:descriptionType:targetTypes:](v42, "descriptionStringForCommandIdentifier:descriptionType:targetTypes:", v17, CFSTR("URLD"), v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        +[SRCSCommandStringsTable activeTargetTypes](SRCSCommandStringsTable, "activeTargetTypes");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[SRCSCommandStringsTable descriptionStringForCommandIdentifier:descriptionType:targetTypes:](v42, "descriptionStringForCommandIdentifier:descriptionType:targetTypes:", v17, CFSTR("URLS"), v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v27, "length") && objc_msgSend(v29, "length"))
        {
          v30 = objc_alloc(MEMORY[0x24BDD1688]);
          v45 = CFSTR("NSLink");
          v46[0] = v29;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v30, "initWithString:attributes:", v27, v31);

          v18 = (void *)v32;
        }

        v6 = v43;
      }
      if (v18)
        goto LABEL_21;
      +[SRCSCommandStringsTable activeTargetTypes](SRCSCommandStringsTable, "activeTargetTypes");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      -[SRCSCommandStringsTable languageModelDictionaryForCommandIdentifier:targetTypes:parsingErrorString:](v42, "languageModelDictionaryForCommandIdentifier:targetTypes:parsingErrorString:", v17, v33, &v44);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v44;

      v36 = objc_msgSend(v35, "length");
      if (v36)
      {

      }
      else
      {
        -[SRCSCommandStringsTable spokenStringPermutationsOfLanguageModelDictionary:stringsTable:restrictPermutationsToShortestAndLongest:](v42, "spokenStringPermutationsOfLanguageModelDictionary:stringsTable:restrictPermutationsToShortestAndLongest:", v34, v6, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "count"))
        {
          v38 = objc_alloc(MEMORY[0x24BDD1688]);
          objc_msgSend(v37, "firstObject");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v38, "initWithString:", v39);

        }
        else
        {
          v18 = 0;
        }

        v6 = v43;
        if (v18)
          goto LABEL_21;
      }
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", CFSTR("<unknown>"));
LABEL_21:
      objc_msgSend(v5, "replaceCharactersInRange:withAttributedString:", v8, v15 - v8 + v13, v18);

      objc_msgSend(v5, "string");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v40, "rangeOfString:", CFSTR("{"));
      v10 = v41;

    }
    while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  }

}

+ (NSString)deviceName
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  v2 = (__CFString *)MGCopyAnswer();
  v3 = v2;
  if (!v2)
    v2 = &stru_24F657348;
  v4 = v2;

  return v4;
}

- (id)rowDataForTargetTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v43 = v4;
  for (i = 1; i != 3; ++i)
  {
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    -[SRCSCommandStringsTable _commandStringsTable](self, "_commandStringsTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    if (!v9)
      goto LABEL_50;
    v10 = v9;
    v11 = *(_QWORD *)v66;
    v46 = *(_QWORD *)v66;
    v47 = v8;
    do
    {
      v12 = 0;
      v48 = v10;
      do
      {
        if (*(_QWORD *)v66 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v12);
        if (!objc_msgSend(v4, "count"))
        {
          v14 = v13;
LABEL_25:
          v29 = 0;
          goto LABEL_48;
        }
        v64 = 0;
        -[SRCSCommandStringsTable _rootCommandIdentifierFrom:foundTargetType:](self, "_rootCommandIdentifierFrom:foundTargetType:", v13, &v64);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        v15 = v64;
        if (!v15)
          goto LABEL_25;
        v54 = v15;
        if (objc_msgSend(v4, "containsObject:"))
        {
          v51 = v12;
          objc_msgSend(MEMORY[0x24BDD16A8], "string");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCE30], "array");
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = v14;
          v19 = (id)v17;
          v63 = 0;
          v53 = v18;
          -[SRCSCommandStringsTable languageModelDictionaryForCommandIdentifier:targetTypes:parsingErrorString:](self, "languageModelDictionaryForCommandIdentifier:targetTypes:parsingErrorString:");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v63;
          if (objc_msgSend(v20, "length"))
            objc_msgSend(v16, "appendString:", v20);
          v50 = v20;
          if (!objc_msgSend(v16, "length"))
          {
            -[SRCSCommandStringsTable spokenStringPermutationsOfLanguageModelDictionary:stringsTable:](self, "spokenStringPermutationsOfLanguageModelDictionary:stringsTable:", v52, 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (i == 1)
            {
              v61 = 0uLL;
              v62 = 0uLL;
              v59 = 0uLL;
              v60 = 0uLL;
              v22 = v21;
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
              if (v23)
              {
                v24 = v23;
                v44 = v21;
                v25 = *(_QWORD *)v60;
                do
                {
                  for (j = 0; j != v24; ++j)
                  {
                    if (*(_QWORD *)v60 != v25)
                      objc_enumerationMutation(v22);
                    objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * j), "lowercaseString");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v5, "objectForKey:", v27);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v28)
                    {
                      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v5, "setObject:forKey:", v28, v27);
                    }
                    objc_msgSend(v28, "addObject:", v13);

                  }
                  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
                }
                while (v24);
                v4 = v43;
                v11 = v46;
                v8 = v47;
                v10 = v48;
                goto LABEL_41;
              }
              v10 = v48;
LABEL_43:

              v19 = v21;
            }
            else
            {
              v57 = 0uLL;
              v58 = 0uLL;
              v55 = 0uLL;
              v56 = 0uLL;
              v44 = v21;
              v19 = v21;
              v30 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
              if (v30)
              {
                v31 = v30;
                v32 = *(_QWORD *)v56;
                do
                {
                  for (k = 0; k != v31; ++k)
                  {
                    if (*(_QWORD *)v56 != v32)
                      objc_enumerationMutation(v19);
                    -[SRCSCommandStringsTable warningStringForText:identifier:textTable:](self, "warningStringForText:identifier:textTable:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * k), v13, v5);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v34, "length") && (objc_msgSend(v16, "isEqualToString:", v34) & 1) == 0)
                    {
                      if (objc_msgSend(v16, "length"))
                        objc_msgSend(v16, "appendString:", CFSTR("  "));
                      objc_msgSend(v16, "appendString:", v34);
                    }

                  }
                  v31 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
                }
                while (v31);
              }

              v11 = v46;
              v8 = v47;
              v10 = v48;
              if (!objc_msgSend(v16, "length"))
              {
                -[SRCSCommandStringsTable _warningsOfIncorrectTokenizationAcrossSegmentBoundariesInLanguageModelDictionary:stringsTable:](self, "_warningsOfIncorrectTokenizationAcrossSegmentBoundariesInLanguageModelDictionary:stringsTable:", v52, 0);
                v22 = (id)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v22, "count"))
                {
                  v35 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(v22, "componentsJoinedByString:", CFSTR("; "));
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "stringWithFormat:", CFSTR("Optional phrase crosses word boundary, see: %@.  Optional phrases must contain entire words, not just characters to be prepended to the following word or appended to the preceding word. Fix by expanding the optional phrases as additional variants separated by the '|' symbol."), v36);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "appendString:", v37);

                  v11 = v46;
                  v8 = v47;
                }
LABEL_41:
                v21 = v44;
                goto LABEL_43;
              }
            }
          }
          if (i == 2)
          {
            v38 = (void *)MEMORY[0x24BDBCED8];
            -[SRCSCommandStringsTable _commandStringsTable](self, "_commandStringsTable");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectForKey:", v13);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "dictionaryWithObjectsAndKeys:", v53, CFSTR("Identifier"), v40, CFSTR("Text"), v13, CFSTR("DatabaseKey"), v54, CFSTR("TargetType"), v19, CFSTR("Permutations"), v16, CFSTR("Warning"), 0);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "addObject:", v41);

            v11 = v46;
            v10 = v48;

            v8 = v47;
          }

          v12 = v51;
          v14 = v53;
        }
        v29 = v54;
LABEL_48:

        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    }
    while (v10);
LABEL_50:

  }
  return v45;
}

- (id)warningStringForText:(id)a3 identifier:(id)a4 textTable:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14E0]), "initWithArray:", v11);
  else
    v12 = 0;
  if (objc_msgSend(v7, "length") && (unint64_t)objc_msgSend(v11, "count") >= 2)
  {
    v13 = objc_msgSend(v12, "countForObject:", v8);
    v14 = (void *)MEMORY[0x24BDD17C8];
    if (v13 < 2)
    {
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("Redundant permutation (\"%@\") in: %@. Two or more command strings cannot resolve to the identical string. Please change or remove one of the conflicting entries."), v7, v16);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v15)
        goto LABEL_27;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Redundant permutation (\"%@\") in %@. Two or more command strings cannot resolve to the identical string. Please change or remove one of the conflicting entries."), v7, v8);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v15)
        goto LABEL_27;
    }
  }
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Empty permutation found in %@. Check if any optional phrases causes a permutation to be reduced to an empty string."), v8);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v15)
      goto LABEL_27;
  }
  if (!objc_msgSend(v7, "length")
    || objc_msgSend(v7, "rangeOfString:", CFSTR("(")) == 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v7, "rangeOfString:", CFSTR(")")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24F657348);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "rangeOfString:", CFSTR("{BuiltInLM.NumberTwoThroughNinetyNine}{BuiltInLM.NumberTwoThroughNinetyNine.2}")) == 0x7FFFFFFFFFFFFFFFLL&& objc_msgSend(v17, "rangeOfString:", CFSTR("{BuiltInLM.KeyboardKeyName}{BuiltInLM.NumberTwoThroughNinetyNine}")) == 0x7FFFFFFFFFFFFFFFLL&& objc_msgSend(v17, "rangeOfString:", CFSTR("{BuiltInLM.OverlayLabel}{BuiltInLM.NumberTwoThroughNinetyNine}")) == 0x7FFFFFFFFFFFFFFFLL&& objc_msgSend(v17, "rangeOfString:", CFSTR("{BuiltInLM.OverlayLabel}{BuiltInLM.NumberZeroThroughOneHundred}")) == 0x7FFFFFFFFFFFFFFFLL)
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Two numbered parameters appear consecutively without an intervening word or phrase which may cause the following permutation to fail: %@"), v7);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v15)
        goto LABEL_27;
    }
    if (objc_msgSend(v7, "length") && objc_msgSend(v7, "rangeOfString:", CFSTR("’")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Instead of using right single quotation mark (’)(U+2019) in translations e.g. in \"%@\", please use apostrophe(')(U+0027)."), v7);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = CFSTR("Alternative words cannot be indicated using parentheses. Please use two separate command strings, adding another command string entry if necessary.");
  }
LABEL_27:
  if (v15)
    v18 = v15;
  else
    v18 = &stru_24F657348;
  v19 = v18;

  return v19;
}

- (id)_commandStringsDictionaryForLocaleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;

  v3 = a3;
  +[SRCSCommandStringsTable commandStringsLoader](SRCSCommandStringsTable, "commandStringsLoader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[SRCSCommandStringsTable componentsFromLocaleIdentifier:](SRCSCommandStringsTable, "componentsFromLocaleIdentifier:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDBCB20]);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("nb")))
    {

      v6 = CFSTR("no");
    }
    +[SRCSCommandStringsTable commandStringsLoader](SRCSCommandStringsTable, "commandStringsLoader");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, __CFString *))v7)[2](v7, v3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[SRCSSpokenCommandUtilities sharedSpokenCommandUtilities](SRCSSpokenCommandUtilities, "sharedSpokenCommandUtilities");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString dictionaryForLocaleIdentifier:resourceFileName:resourceFileExtension:](v6, "dictionaryForLocaleIdentifier:resourceFileName:resourceFileExtension:", v3, CFSTR("CommandStrings"), CFSTR("strings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)commandStringsLoader
{
  return (id)MEMORY[0x22E2FB604](sCommandStringsLoader, a2);
}

+ (void)setCommandStringsLoader:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = MEMORY[0x22E2FB604](a3, a2);
  v4 = (void *)sCommandStringsLoader;
  sCommandStringsLoader = v3;

}

+ (id)formattedBuiltInCommandString:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    v4 = (void *)MEMORY[0x24BDD1488];
    v5 = a3;
    objc_msgSend(v4, "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CommandParameter.GenericFormatString"), &stru_24F657348, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterIdentifiersToExamplesTable, 0);
  objc_storeStrong((id *)&self->_phoneticKeyNamesCache, 0);
  objc_storeStrong((id *)&self->_modifierKeyNamesCache, 0);
  objc_storeStrong((id *)&self->_keyboardKeyNamesCache, 0);
  objc_storeStrong((id *)&self->_commandDescriptionsCache, 0);
  objc_storeStrong((id *)&self->_commandStringsCache, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end

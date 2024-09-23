@implementation WBUFormDataController

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  self->_cachedAutoFillRestrictionValue = objc_msgSend(v5, "BOOLRestrictionForFeature:", *MEMORY[0x24BE63A90]);

}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  self->_cachedAutoFillRestrictionValue = objc_msgSend(v5, "BOOLRestrictionForFeature:", *MEMORY[0x24BE63A90]);

}

- (WBUFormDataController)initWithAggressiveKeychainCaching:(BOOL)a3
{
  WBUFormDataController *v3;
  void *v4;
  void *v5;
  WBUFormDataController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBUFormDataController;
  v3 = -[WBUFormDataController initWithAggressiveKeychainCaching:](&v8, sel_initWithAggressiveKeychainCaching_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "registerObserver:", v3);
    else
      objc_msgSend(v4, "addObserver:", v3);
    v3->_cachedAutoFillRestrictionValue = objc_msgSend(v4, "BOOLRestrictionForFeature:", *MEMORY[0x24BE63A90]);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel__applicationWillEnterForeground_, *MEMORY[0x24BDF75D0], 0);

    v6 = v3;
  }

  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "unregisterObserver:", self);
  else
    objc_msgSend(v3, "removeObserver:", self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)WBUFormDataController;
  -[WBUFormDataController dealloc](&v5, sel_dealloc);
}

- (id)completionDBPath
{
  if (SafariCompletionsDBPath_onceToken != -1)
    dispatch_once(&SafariCompletionsDBPath_onceToken, &__block_literal_global_483);
  return (id)SafariCompletionsDBPath_path;
}

- (void)saveCompletionDBSoon
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  WBUFormDataController *v11;
  uint64_t *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (!self->_savePending)
  {
    self->_savePending = 1;
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = *MEMORY[0x24BDF7608];
    v3 = MEMORY[0x24BDAC760];
    v4 = (void *)*MEMORY[0x24BDF74F8];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __45__WBUFormDataController_saveCompletionDBSoon__block_invoke;
    v13[3] = &unk_24CB8D600;
    v13[4] = &v14;
    v5 = objc_msgSend(v4, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("AutofillCompletionDBWrite"), v13);
    v15[3] = v5;
    -[WBUFormDataController allFormDataForSaving](self, "allFormDataForSaving");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_savePending = 0;
    dispatch_get_global_queue(-2, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = v3;
    v9[1] = 3221225472;
    v9[2] = __45__WBUFormDataController_saveCompletionDBSoon__block_invoke_2;
    v9[3] = &unk_24CB8D628;
    v10 = v6;
    v11 = self;
    v12 = &v14;
    v8 = v6;
    dispatch_async(v7, v9);

    _Block_object_dispose(&v14, 8);
  }
}

uint64_t __45__WBUFormDataController_saveCompletionDBSoon__block_invoke(uint64_t a1)
{
  NSLog(CFSTR("Background task expired while saving autofill completions DB."));
  return objc_msgSend((id)*MEMORY[0x24BDF74F8], "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

uint64_t __45__WBUFormDataController_saveCompletionDBSoon__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF48];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "completionDBPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "writeToURL:atomically:", v5, 1);

  return objc_msgSend((id)*MEMORY[0x24BDF74F8], "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
}

+ (id)_meCard
{
  void *v2;
  _WBUDynamicMeCard *v3;
  void *v4;

  v2 = (void *)_meCard_me;
  if (!_meCard_me)
  {
    v3 = objc_alloc_init(_WBUDynamicMeCard);
    v4 = (void *)_meCard_me;
    _meCard_me = (uint64_t)v3;

    v2 = (void *)_meCard_me;
  }
  return v2;
}

+ (id)valueStringForMatch:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "dateValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = objc_alloc_init(MEMORY[0x24BDD1500]);
      objc_msgSend(v5, "setLocalizedDateFormatFromTemplate:", CFSTR("dMy"));
      objc_msgSend(v3, "dateValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringFromDate:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v4;
}

- (void)gatherAutoFillDisplayDataWithTextField:(id)a3 displayedInQuickType:(BOOL)a4 prefix:(id)a5 contact:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  WBUFormDataController *v27;
  id v28;
  id v29;
  BOOL v30;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __118__WBUFormDataController_gatherAutoFillDisplayDataWithTextField_displayedInQuickType_prefix_contact_completionHandler___block_invoke;
  v25[3] = &unk_24CB8D6A0;
  v17 = v15;
  v29 = v17;
  v18 = v12;
  v26 = v18;
  v27 = self;
  v19 = v13;
  v28 = v19;
  v30 = a4;
  v20 = MEMORY[0x212BD7EA4](v25);
  v21 = (void *)v20;
  if (v14)
  {
    (*(void (**)(uint64_t, id))(v20 + 16))(v20, v14);
  }
  else if (objc_msgSend(MEMORY[0x24BDBACF8], "authorizationStatusForEntityType:", 0) == 3)
  {
    objc_msgSend((id)objc_opt_class(), "_meCard");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __118__WBUFormDataController_gatherAutoFillDisplayDataWithTextField_displayedInQuickType_prefix_contact_completionHandler___block_invoke_4;
    v23[3] = &unk_24CB8D6C8;
    v23[4] = self;
    v24 = v21;
    objc_msgSend(v22, "performWhenReady:", v23);

  }
  else
  {
    (*((void (**)(id, _QWORD))v17 + 2))(v17, 0);
  }

}

void __118__WBUFormDataController_gatherAutoFillDisplayDataWithTextField_displayedInQuickType_prefix_contact_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  char v19;
  char v20;

  v3 = a2;
  if (*(_QWORD *)(a1 + 56))
  {
    v15 = v3;
    objc_msgSend(off_24CB8CC70, "specifierForControl:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "ancestorFrameURLs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "matchesForControl:atURL:matchingPartialString:autoFillDataType:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", *(_QWORD *)(a1 + 32), v6, *(_QWORD *)(a1 + 48), 0, v15, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(v4, "property");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Address"));

    }
    else
    {
      v10 = 0;
    }
    v11 = *(_QWORD *)(a1 + 56);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __118__WBUFormDataController_gatherAutoFillDisplayDataWithTextField_displayedInQuickType_prefix_contact_completionHandler___block_invoke_2;
    v16[3] = &unk_24CB8D678;
    v19 = v10;
    v16[4] = *(_QWORD *)(a1 + 40);
    v12 = v15;
    v20 = *(_BYTE *)(a1 + 64);
    v17 = v12;
    v18 = v8;
    v13 = v8;
    objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v14);

    v3 = v15;
  }

}

WBUAutoFillDisplayData *__118__WBUFormDataController_gatherAutoFillDisplayDataWithTextField_displayedInQuickType_prefix_contact_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WBUAutoFillDisplayData *v8;
  WBUAutoFillDisplayData *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "cascadingAddressMatchesForMatch:contact:", v3, *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  if (!*(_BYTE *)(a1 + 57))
    goto LABEL_8;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __118__WBUFormDataController_gatherAutoFillDisplayDataWithTextField_displayedInQuickType_prefix_contact_completionHandler___block_invoke_3;
  v12[3] = &unk_24CB8D650;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "safari_mapObjectsUsingBlock:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 48), "containsObject:", v7) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);

LABEL_8:
    v9 = [WBUAutoFillDisplayData alloc];
    objc_msgSend(v4, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WBUAutoFillDisplayData initWithLabel:fillMatches:](v9, "initWithLabel:fillMatches:", v10, v6);

    goto LABEL_9;
  }

  v8 = 0;
LABEL_9:

  return v8;
}

id __118__WBUFormDataController_gatherAutoFillDisplayDataWithTextField_displayedInQuickType_prefix_contact_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "valueStringForMatch:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __118__WBUFormDataController_gatherAutoFillDisplayDataWithTextField_displayedInQuickType_prefix_contact_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "me");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)_addressBookMatchesForFullNameForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7 = (_QWORD *)MEMORY[0x24BE82E10];
  if (v6)
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)off_24CB8CC28), "initWithValue:property:key:identifier:", v5, *MEMORY[0x24BE82E10], 0, 0);
    objc_msgSend(v4, "addObject:", v8);

  }
  objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", v3, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    v10 = (void *)objc_msgSend(objc_alloc((Class)off_24CB8CC28), "initWithValue:property:key:identifier:", v9, *v7, 0, 0);
    objc_msgSend(v4, "addObject:", v10);

  }
  if (objc_msgSend(v4, "count"))
    v11 = v4;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (id)_addressBookMatchesForGivenNameForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "givenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7 = (_QWORD *)MEMORY[0x24BE82DF8];
  if (v6)
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)off_24CB8CC28), "initWithValue:property:key:identifier:", v5, *MEMORY[0x24BE82DF8], 0, 0);
    objc_msgSend(v4, "addObject:", v8);

  }
  objc_msgSend(v3, "phoneticGivenName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    v10 = (void *)objc_msgSend(objc_alloc((Class)off_24CB8CC28), "initWithValue:property:key:identifier:", v9, *v7, 0, 0);
    objc_msgSend(v4, "addObject:", v10);

  }
  if (objc_msgSend(v4, "count"))
    v11 = v4;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (id)_addressBookMatchesForMiddleNameForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "middleName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7 = (_QWORD *)MEMORY[0x24BE82E08];
  if (v6)
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)off_24CB8CC28), "initWithValue:property:key:identifier:", v5, *MEMORY[0x24BE82E08], 0, 0);
    objc_msgSend(v4, "addObject:", v8);

  }
  objc_msgSend(v3, "phoneticMiddleName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    v10 = (void *)objc_msgSend(objc_alloc((Class)off_24CB8CC28), "initWithValue:property:key:identifier:", v9, *v7, 0, 0);
    objc_msgSend(v4, "addObject:", v10);

  }
  if (objc_msgSend(v4, "count"))
    v11 = v4;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (id)_addressBookMatchesForFamilyNameForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "familyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7 = (_QWORD *)MEMORY[0x24BE82E00];
  if (v6)
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)off_24CB8CC28), "initWithValue:property:key:identifier:", v5, *MEMORY[0x24BE82E00], 0, 0);
    objc_msgSend(v4, "addObject:", v8);

  }
  objc_msgSend(v3, "phoneticFamilyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    v10 = (void *)objc_msgSend(objc_alloc((Class)off_24CB8CC28), "initWithValue:property:key:identifier:", v9, *v7, 0, 0);
    objc_msgSend(v4, "addObject:", v10);

  }
  if (objc_msgSend(v4, "count"))
    v11 = v4;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (id)addressBookMatchesForProperty:(id)a3 key:(id)a4 label:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[WBUFormDataController me](self, "me");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBUFormDataController addressBookMatchesForProperty:key:label:contact:](self, "addressBookMatchesForProperty:key:label:contact:", v10, v9, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)addressBookMatchesForProperty:(id)a3 key:(id)a4 label:(id)a5 partialString:(id)a6 contact:(id)a7 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a8
{
  return -[WBUFormDataController addressBookMatchesForProperty:key:label:contact:](self, "addressBookMatchesForProperty:key:label:contact:", a3, a4, a5, a7);
}

- (id)addressBookMatchesForProperty:(id)a3 key:(id)a4 label:(id)a5 contact:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  id v48;
  id v49;
  _BYTE v50[128];
  _QWORD v51[3];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v42 = a5;
  v12 = a6;
  if (!objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE82E10]))
  {
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE82DF8]))
    {
      -[WBUFormDataController _addressBookMatchesForGivenNameForContact:](self, "_addressBookMatchesForGivenNameForContact:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE82E08]))
    {
      -[WBUFormDataController _addressBookMatchesForMiddleNameForContact:](self, "_addressBookMatchesForMiddleNameForContact:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE82E00]))
    {
      -[WBUFormDataController _addressBookMatchesForFamilyNameForContact:](self, "_addressBookMatchesForFamilyNameForContact:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    objc_msgSend((id)objc_opt_class(), "_meCard");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "valueForProperty:contact:", v10, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47[0] = MEMORY[0x24BDAC760];
        v47[1] = 3221225472;
        v47[2] = __73__WBUFormDataController_addressBookMatchesForProperty_key_label_contact___block_invoke;
        v47[3] = &unk_24CB8D6F0;
        v47[4] = self;
        v41 = v10;
        v18 = v10;
        v48 = v18;
        v40 = v11;
        v49 = v11;
        v38 = v17;
        objc_msgSend(v17, "safari_mapObjectsUsingBlock:", v47);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v12;
        -[WBUFormDataController preferredIdentifierForProperty:withContact:](self, "preferredIdentifierForProperty:withContact:", v18, v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v21 = v19;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
        v23 = v42;
        if (!v22)
          goto LABEL_27;
        v24 = v22;
        v25 = *(_QWORD *)v44;
        while (1)
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v44 != v25)
              objc_enumerationMutation(v21);
            v27 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            objc_msgSend(v27, "label");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v23, "isEqualToString:", v28))
            {

LABEL_22:
              objc_msgSend(v14, "insertObject:atIndex:", v27, 0);
              continue;
            }
            if (objc_msgSend(v20, "length"))
            {
              objc_msgSend(v27, "identifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "isEqualToString:", v20);

              v23 = v42;
              if (v30)
                goto LABEL_22;
            }
            else
            {

            }
            objc_msgSend(v14, "addObject:", v27);
          }
          v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
          if (!v24)
          {
LABEL_27:

            v11 = v40;
            v10 = v41;
            v17 = v38;
            v12 = v39;
            goto LABEL_36;
          }
        }
      }
      v31 = v12;
      v32 = objc_alloc(MEMORY[0x24BDBCE48]);
      v33 = (void *)objc_msgSend(v32, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = v11;
        v35 = v17;
        objc_msgSend(v33, "dateFromComponents:", v17);
      }
      else
      {
        v35 = v17;
        v34 = v11;
        +[WBSFormDataController stringWithAddressBookValue:key:](WBUFormDataController, "stringWithAddressBookValue:key:", v17, v11);
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        v37 = (void *)objc_msgSend(objc_alloc((Class)off_24CB8CC28), "initWithValue:property:key:identifier:", v36, v10, v34, &stru_24CB8DE28);
        v51[0] = v37;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = (void *)MEMORY[0x24BDBD1A8];
      }

      v11 = v34;
      v12 = v31;
      v17 = v35;
    }
    else
    {
      v14 = 0;
    }
LABEL_36:

    goto LABEL_10;
  }
  -[WBUFormDataController _addressBookMatchesForFullNameForContact:](self, "_addressBookMatchesForFullNameForContact:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v14 = (void *)v13;
LABEL_10:

  return v14;
}

id __73__WBUFormDataController_addressBookMatchesForProperty_key_label_contact___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "contactKeyForString:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDBA2F8]);

  if (v6)
  {
    v7 = v4;
    objc_msgSend(v7, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("Instant"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 48)))
    {
      objc_msgSend(v7, "username");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    +[_WBUDynamicMeCard _contactObjectComponentForString:](_WBUDynamicMeCard, "_contactObjectComponentForString:", *(_QWORD *)(a1 + 48));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    +[WBUFormDataController _stringForCNContactObject:contactObjectComponent:](WBUFormDataController, "_stringForCNContactObject:contactObjectComponent:", v4, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v10)
  {
    v11 = objc_alloc((Class)off_24CB8CC28);
    v13 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v3, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "label");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v11, "initWithValue:property:key:identifier:label:", v10, v13, v12, v14, v15);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)_stringForCNContactObject:(id)a3 contactObjectComponent:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
LABEL_5:
    v8 = v7;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "stringValue");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "valueForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      v11 = v10;
    else
      v11 = 0;
    v8 = v11;

  }
  else
  {
    v8 = 0;
  }
LABEL_6:

  return v8;
}

- (BOOL)shouldAutoGeneratePasswordsForURL:(id)a3 inWebView:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  if ((!objc_msgSend(MEMORY[0x24BE82CC8], "isPasswordManagerAppEnabledAndInstalled")
     || objc_msgSend(MEMORY[0x24BE82CC8], "isAutomaticStrongPasswordsEnabled"))
    && -[WBUFormDataController _shouldSaveUsernamesAndPasswordsForURL:inWebView:](self, "_shouldSaveUsernamesAndPasswordsForURL:inWebView:", v6, v7))
  {
    v8 = (objc_msgSend(MEMORY[0x24BE82CC8], "isPasswordManagerAppEnabledAndInstalled") & 1) != 0
      || +[WBUFormDataController keychainSyncEnabled](WBUFormDataController, "keychainSyncEnabled");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)keychainSyncEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE82CF0], "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isKeychainSyncEnabled");

  return v3;
}

- (BOOL)whiteListAllowsURL:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[WBUFormAutoFillWhiteList sharedAutoFillWhiteList](WBUFormAutoFillWhiteList, "sharedAutoFillWhiteList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowsURL:", v3);

  return v5;
}

- (BOOL)_shouldSaveUsernamesAndPasswordsForURL:(id)a3 inWebView:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x24BE6FB08], "shouldShowLoginIntroduction") & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (-[WBUFormDataController shouldAllowPasswordAutoFillOnURL:allowExternalCredentials:](self, "shouldAllowPasswordAutoFillOnURL:allowExternalCredentials:", v6, 0))
    {
      v8 = (objc_msgSend(v7, "webui_privateBrowsingEnabled") & 1) == 0
        && -[WBUFormDataController whiteListAllowsURL:](self, "whiteListAllowsURL:", v6);
    }
  }

  return v8;
}

- (BOOL)_shouldSaveCreditCardDataInWebView:(id)a3 frame:(id)a4
{
  id v6;
  int v7;

  v6 = a3;
  if (-[WBUFormDataController shouldAutoFillFromCreditCardDataInFrame:](self, "shouldAutoFillFromCreditCardDataInFrame:", a4))
  {
    v7 = objc_msgSend(v6, "webui_privateBrowsingEnabled") ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)shouldAutoFillFromPreviousData
{
  return 0;
}

- (BOOL)shouldAutoFillPasswords
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE83018], "sharedFeatureManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldAutoFillPasswordsFromKeychain");

  return v3;
}

- (void)setShouldAutoFillPasswords:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE83018], "sharedFeatureManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldAutoFillPasswordsFromKeychain:", v3);

}

- (BOOL)shouldAutoFillFromCreditCardData
{
  void *v3;
  char v4;
  int AppBooleanValue;
  Boolean keyExistsAndHasValidFormat;

  +[WBUFeatureManager webui_sharedFeatureManager](WBUFeatureManager, "webui_sharedFeatureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isAutoFillAvailable")
    && objc_msgSend(v3, "isCreditCardStorageAvailable")
    && self->_cachedAutoFillRestrictionValue != 2)
  {
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("AutoFillCreditCards"), (CFStringRef)objc_msgSend(MEMORY[0x24BE83018], "autoFillPreferencesDomain"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v4 = AppBooleanValue != 0;
    else
      v4 = objc_msgSend(MEMORY[0x24BE83018], "defaultValueForPasswordAndCreditCardAutoFill");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setShouldAutoFillFromCreditCardData:(BOOL)a3
{
  CFPropertyListRef *v3;

  v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("AutoFillCreditCards"), *v3, (CFStringRef)objc_msgSend(MEMORY[0x24BE83018], "autoFillPreferencesDomain"));
  objc_msgSend(MEMORY[0x24BE83018], "autoFillPreferencesDidChange");
}

+ (BOOL)contactStoreHasMeCard:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x24BDBACF8], "authorizationStatusForEntityType:", 0) == 3)
  {
    objc_msgSend(v3, "_ios_meContactWithKeysToFetch:error:", MEMORY[0x24BDBD1A8], 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldAutoFillFromAddressBook
{
  void *v3;
  int v4;
  char v5;
  int AppBooleanValue;
  void *v8;
  Boolean keyExistsAndHasValidFormat;

  +[WBUFeatureManager webui_sharedFeatureManager](WBUFeatureManager, "webui_sharedFeatureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAutoFillAvailable");

  if (!v4 || self->_cachedAutoFillRestrictionValue == 2)
    return 0;
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)*MEMORY[0x24BE830B0], (CFStringRef)objc_msgSend(MEMORY[0x24BE83018], "autoFillPreferencesDomain"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    return AppBooleanValue != 0;
  if (objc_msgSend(MEMORY[0x24BDBACF8], "authorizationStatusForEntityType:", 0) != 3)
    return 1;
  objc_msgSend((id)objc_opt_class(), "_meCard");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "meCardExists");

  return v5;
}

- (void)setShouldAutoFillFromAddressBook:(BOOL)a3
{
  CFPropertyListRef *v3;

  if (a3)
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  else
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue((CFStringRef)*MEMORY[0x24BE830B0], *v3, (CFStringRef)objc_msgSend(MEMORY[0x24BE83018], "autoFillPreferencesDomain"));
  objc_msgSend(MEMORY[0x24BE83018], "autoFillPreferencesDidChange");
}

- (BOOL)shouldAutoFillFromCreditCardDataInFrame:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[WBUFormDataController shouldAutoFillFromCreditCardData](self, "shouldAutoFillFromCreditCardData"))
    v5 = -[WBUFormDataController mayFillCreditCardDataInFrame:](self, "mayFillCreditCardDataInFrame:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)mayFillCreditCardDataInFrame:(id)a3
{
  return frameHasTrustedCertificateChain(a3);
}

- (BOOL)mayPreFillInFrame:(id)a3
{
  return frameHasTrustedCertificateChain(a3);
}

+ (id)localizedLowercaseContactProperty:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE82E10]))
  {
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBACA0];
    +[WBSFormDataController contactKeyForString:](WBUFormDataController, "contactKeyForString:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedLowercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)uniqueIDOfContact:(id)a3
{
  return (id)objc_msgSend(a3, "identifier");
}

+ (BOOL)contactIsMe:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_meCard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "me");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v3);

  return v6;
}

- (CNContact)me
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_meCard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "me");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContact *)v3;
}

- (void)_applicationWillEnterForeground:(id)a3
{
  objc_msgSend(MEMORY[0x24BE83018], "autoFillPreferencesDidChange", a3);
}

- (id)savedAccountFromMatches:(id)a3 completingPartialUserInLoginForm:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "userNameElementUniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v6, "controls");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "uniqueID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v7);

          if (v14)
          {
            objc_msgSend(v12, "value");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
        v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v9 = 0;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    while (2)
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        if (objc_msgSend(v9, "length", (_QWORD)v25))
        {
          objc_msgSend(v20, "user");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "safari_hasCaseInsensitivePrefix:", v9);

          if ((v22 & 1) == 0)
            continue;
        }
        objc_msgSend(v20, "savedAccount");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      v23 = 0;
      if (v17)
        continue;
      break;
    }
  }
  else
  {
    v23 = 0;
  }
LABEL_26:

  return v23;
}

- (BOOL)shouldAllowPasswordAutoFillOnURL:(id)a3 allowExternalCredentials:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BE83018], "sharedFeatureManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "shouldAutoFillPasswords"))
    {
      objc_msgSend(v6, "host");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(off_24CB8CCA0, "mayAutoFillPasswordOnHost:", v8);

    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    if (!-[WBUFormDataController shouldAutoFillPasswords](self, "shouldAutoFillPasswords"))
    {
      v9 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v6, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(off_24CB8CCA0, "mayAutoFillPasswordOnHost:", v7);
  }

LABEL_9:
  return v9;
}

- (void)gatherValuesForForm:(id)a3 focusedTextFieldMetadata:(id)a4 inFrame:(id)a5 multiRoundAutoFillManager:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_msgSend(v12, "type");
  if (v17 <= 5
    && ((1 << v17) & 0x32) != 0
    && -[WBUFormDataController shouldAutoFillFromAddressBook](self, "shouldAutoFillFromAddressBook"))
  {
    v18 = objc_msgSend(MEMORY[0x24BDBACF8], "authorizationStatusForEntityType:", 0);
    if (v18 >= 3)
    {
      if (v18 - 3 < 2)
      {
        objc_msgSend((id)objc_opt_class(), "_meCard");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __122__WBUFormDataController_gatherValuesForForm_focusedTextFieldMetadata_inFrame_multiRoundAutoFillManager_completionHandler___block_invoke;
        v21[3] = &unk_24CB8D718;
        v21[4] = self;
        v22 = v12;
        v23 = v14;
        v24 = v15;
        v25 = v16;
        objc_msgSend(v20, "performWhenReady:", v21);

      }
    }
    else
    {
      objc_msgSend(v13, "addressBookLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, BOOL))v16 + 2))(v16, MEMORY[0x24BDBD1B8], v19 != 0);

    }
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
  }

}

void __122__WBUFormDataController_gatherValuesForForm_focusedTextFieldMetadata_inFrame_multiRoundAutoFillManager_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "webui_URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSFormDataController domainFromURL:](WBUFormDataController, "domainFromURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "me");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valuesForContactFormWithMetadata:inDomain:matches:multiRoundAutoFillManager:contact:", v3, v5, 0, v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "count");
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

- (void)clearAllFormCredentials
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDB7488], "sharedCredentialStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_allSafariCredentials");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "copy");

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__WBUFormDataController_clearAllFormCredentials__block_invoke;
  v6[3] = &unk_24CB8D768;
  v7 = v2;
  v4 = v2;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __48__WBUFormDataController_clearAllFormCredentials__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__WBUFormDataController_clearAllFormCredentials__block_invoke_2;
  v7[3] = &unk_24CB8D740;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __48__WBUFormDataController_clearAllFormCredentials__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = *MEMORY[0x24BDB7420];
  v9[0] = MEMORY[0x24BDBD1C8];
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeCredential:forProtectionSpace:options:", v6, v4, v7);

}

- (void)saveUnsubmittedGeneratedPasswordInFrame:(id)a3 form:(id)a4 context:(id)a5 closingWebView:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  const __CFString *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  __CFString *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  id v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v6 = a6;
  v49 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  v10 = a4;
  v11 = a5;
  v32 = v10;
  if (objc_msgSend(v10, "usesGeneratedPassword") && objc_msgSend(v10, "type") == 5)
  {
    v29 = v11;
    objc_msgSend(v31, "webui_URL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    v46 = 0;
    -[WBUFormDataController willSubmitFormWithCredentials:shouldPreferAnnotatedCredentials:atURL:username:password:inContext:](self, "willSubmitFormWithCredentials:shouldPreferAnnotatedCredentials:atURL:username:password:inContext:", v10, 0, v30, &v47, &v46, v11);
    v34 = (__CFString *)v47;
    v12 = v46;
    if (objc_msgSend(v12, "length"))
    {
      v13 = v34;
      if (!v34)
        v13 = &stru_24CB8DE28;
      v34 = (__CFString *)v13;
      objc_msgSend(MEMORY[0x24BDB7490], "safari_HTMLFormProtectionSpaceForURL:", v30);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE82DD0], "criteriaForExactFQDNPasswordMatchesOfURL:", v30);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setPartialUsername:", v34);
      v40 = 0;
      v41 = &v40;
      v42 = 0x3032000000;
      v43 = __Block_byref_object_copy_;
      v44 = __Block_byref_object_dispose_;
      v45 = 0;
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __93__WBUFormDataController_saveUnsubmittedGeneratedPasswordInFrame_form_context_closingWebView___block_invoke;
      v39[3] = &unk_24CB8D790;
      v39[4] = &v40;
      objc_msgSend(v33, "getSavedAccountsMatchingCriteria:withSynchronousCompletionHandler:", v28, v39);
      objc_msgSend((id)v41[5], "exactMatches");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "count"))
      {
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v14 = v26;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v36 != v16)
                objc_enumerationMutation(v14);
              v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
              objc_msgSend(v18, "password");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "isEqualToString:", v12);

              if ((v20 & 1) != 0)
              {
                v21 = objc_alloc_init(MEMORY[0x24BE82DB8]);
                objc_msgSend(v18, "savedAccount");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setSavedAccount:", v22);

                objc_msgSend(v21, "setUser:", v34);
                objc_msgSend(v21, "setPassword:", v12);
                objc_msgSend(v33, "changeSavedAccountWithRequest:", v21);
                objc_msgSend(MEMORY[0x24BE82C88], "sharedLogger");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "generatedPasswordDidOverwriteExistingPasswordWithTrigger:", v6);

              }
            }
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
          }
          while (v15);
        }
      }
      else
      {
        objc_msgSend(v27, "host");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "safari_highLevelDomainForPasswordManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "saveUser:password:forProtectionSpace:highLevelDomain:groupID:", v34, v12, v27, v25, *MEMORY[0x24BE82E98]);
        v14 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v33, "setSavedAccountAsDefault:forProtectionSpace:context:", v14, v27, v29);
      }

      _Block_object_dispose(&v40, 8);
    }

    v11 = v29;
  }

}

void __93__WBUFormDataController_saveUnsubmittedGeneratedPasswordInFrame_form_context_closingWebView___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)_showCreditCardPromptForWebView:(id)a3 creditCard:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBUFormDataController _detailTextForPromptToSaveCard:](self, "_detailTextForPromptToSaveCard:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v20[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __86__WBUFormDataController__showCreditCardPromptForWebView_creditCard_completionHandler___block_invoke;
  v18[3] = &unk_24CB8D7B8;
  v19 = v8;
  v17 = v8;
  +[WBUFormAutoFillPrompt showAutoFillPromptInWebView:title:message:cancelButtonTitle:otherButtonTitles:makeFirstButtonSuggestedAction:completionHandler:](WBUFormAutoFillPrompt, "showAutoFillPromptInWebView:title:message:cancelButtonTitle:otherButtonTitles:makeFirstButtonSuggestedAction:completionHandler:", v10, v11, v12, v13, v16, 1, v18);

}

uint64_t __86__WBUFormDataController__showCreditCardPromptForWebView_creditCard_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_detailTextForPromptToSaveCard:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  +[WBUFormDataController keychainSyncEnabled](WBUFormDataController, "keychainSyncEnabled");
  objc_msgSend(v3, "cardSecurityCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "length");
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_showPromptToSaveCreditCardSecurityCodeForWebView:(id)a3 cardNumber:(id)a4 securityCode:(id)a5 completionHandler:(id)a6
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v7 = a6;
  v8 = a3;
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBUFormDataController keychainSyncEnabled](WBUFormDataController, "keychainSyncEnabled");
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __117__WBUFormDataController__showPromptToSaveCreditCardSecurityCodeForWebView_cardNumber_securityCode_completionHandler___block_invoke;
  v16[3] = &unk_24CB8D7B8;
  v17 = v7;
  v15 = v7;
  +[WBUFormAutoFillPrompt showAutoFillPromptInWebView:title:message:cancelButtonTitle:otherButtonTitles:makeFirstButtonSuggestedAction:completionHandler:](WBUFormAutoFillPrompt, "showAutoFillPromptInWebView:title:message:cancelButtonTitle:otherButtonTitles:makeFirstButtonSuggestedAction:completionHandler:", v8, v9, v10, v11, v14, 1, v16);

}

uint64_t __117__WBUFormDataController__showPromptToSaveCreditCardSecurityCodeForWebView_cardNumber_securityCode_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_webView:(id)a3 willSubmitFormContainingCreditCardData:(id)a4 fromFrame:(id)a5 submissionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSSet *v16;
  void *v17;
  id v18;
  NSSet *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  BOOL v24;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  WBUFormDataController *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  BOOL v35;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[WBUFormDataController _shouldSaveCreditCardDataInWebView:frame:](self, "_shouldSaveCreditCardDataInWebView:frame:", v10, a5))
  {
    objc_msgSend(v11, "cardNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBUCreditCardDataController sharedCreditCardDataController](WBUCreditCardDataController, "sharedCreditCardDataController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "existingCardWithNumber:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = self->_previouslyFilledVirtualCardNumbers;
    if (v15)
    {
      objc_msgSend(v14, "tellWalletThatExistingCardWasFilledInForm:previouslyFilledVirtualCardNumbers:", v15, v16);
      objc_msgSend(v11, "cardSecurityCode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "length"))
      {
        objc_msgSend(v15, "cardSecurityCode");
        v26 = v14;
        v18 = v12;
        v19 = v16;
        v20 = v13;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "length");

        v13 = v20;
        v16 = v19;
        v12 = v18;
        v14 = v26;

        if (!v22)
          goto LABEL_5;
      }
      else
      {

      }
      v24 = 1;
      objc_msgSend(v15, "creditCardDataByMergingOtherAttributesBesidesCardNumberFromCard:mergeSecurityCode:", v11, 1);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "replaceCreditCardData:withCard:", v15, v23);
      goto LABEL_9;
    }
LABEL_5:
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __101__WBUFormDataController__webView_willSubmitFormContainingCreditCardData_fromFrame_submissionHandler___block_invoke;
    v27[3] = &unk_24CB8D830;
    v28 = v14;
    v23 = v11;
    v29 = v23;
    v30 = self;
    v34 = v12;
    v35 = v15 != 0;
    v31 = v15;
    v32 = v10;
    v33 = v13;
    objc_msgSend(v28, "isVirtualCard:previouslyFilledVirtualCardNumbers:completion:", v23, v16, v27);

    v24 = 0;
LABEL_9:

    v11 = v23;
    goto LABEL_10;
  }
  v24 = 1;
LABEL_10:

  return v24;
}

void __101__WBUFormDataController__webView_willSubmitFormContainingCreditCardData_fromFrame_submissionHandler___block_invoke(uint64_t a1, int a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "sendCardholderNameEnteredInFormToWalletIfNecessary:lastFilledVirtualCardData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 192));
    if (*(_QWORD *)(a1 + 80))
      dispatch_async(MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 80));
  }
  else
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __101__WBUFormDataController__webView_willSubmitFormContainingCreditCardData_fromFrame_submissionHandler___block_invoke_2;
    v5[3] = &unk_24CB8D808;
    v13 = *(_BYTE *)(a1 + 88);
    v6 = *(id *)(a1 + 56);
    v3 = *(id *)(a1 + 80);
    v4 = *(_QWORD *)(a1 + 48);
    v12 = v3;
    v7 = v4;
    v8 = *(id *)(a1 + 64);
    v9 = *(id *)(a1 + 72);
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

  }
}

void __101__WBUFormDataController__webView_willSubmitFormContainingCreditCardData_fromFrame_submissionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  if (!*(_BYTE *)(a1 + 88))
  {
    v7 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __101__WBUFormDataController__webView_willSubmitFormContainingCreditCardData_fromFrame_submissionHandler___block_invoke_4;
    v10[3] = &unk_24CB8D7E0;
    v9 = *(_QWORD *)(a1 + 64);
    v11 = *(id *)(a1 + 72);
    v12 = *(id *)(a1 + 64);
    v13 = *(id *)(a1 + 80);
    objc_msgSend(v7, "_showCreditCardPromptForWebView:creditCard:completionHandler:", v8, v9, v10);

    v6 = v11;
    goto LABEL_5;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "promptToSaveSecurityCode") & 1) != 0)
  {
    v2 = *(void **)(a1 + 40);
    v3 = *(_QWORD *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 64), "cardSecurityCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __101__WBUFormDataController__webView_willSubmitFormContainingCreditCardData_fromFrame_submissionHandler___block_invoke_3;
    v14[3] = &unk_24CB8D7E0;
    v15 = *(id *)(a1 + 72);
    v16 = *(id *)(a1 + 64);
    v17 = *(id *)(a1 + 80);
    objc_msgSend(v2, "_showPromptToSaveCreditCardSecurityCodeForWebView:cardNumber:securityCode:completionHandler:", v3, v4, v5, v14);

    v6 = v15;
LABEL_5:

    return;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
}

void __101__WBUFormDataController__webView_willSubmitFormContainingCreditCardData_fromFrame_submissionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cardNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "existingCardWithNumber:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setPromptToSaveSecurityCode:", a2 != 2);
  v6 = a2 == 0;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v9, "creditCardDataByMergingOtherAttributesBesidesCardNumberFromCard:mergeSecurityCode:", *(_QWORD *)(a1 + 40), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "replaceCreditCardData:withCard:", v9, v8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __101__WBUFormDataController__webView_willSubmitFormContainingCreditCardData_fromFrame_submissionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "neverSaveCreditCardData:", *(_QWORD *)(a1 + 40));
  }
  else if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "saveCreditCardDataIfAllowed:", *(_QWORD *)(a1 + 40));
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)_credentialMatchesEligibleForUpdateForURL:(id)a3 username:(id)a4 oldPassword:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  v21 = v8;
  objc_msgSend(MEMORY[0x24BE82DD0], "criteriaForExactFQDNPasswordMatchesOfURL:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPartialUsername:", v9);
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __88__WBUFormDataController__credentialMatchesEligibleForUpdateForURL_username_oldPassword___block_invoke;
  v28[3] = &unk_24CB8D790;
  v28[4] = &v29;
  -[WBUFormDataController getSavedAccountMatchesWithCriteria:synchronously:completionHandler:](self, "getSavedAccountMatchesWithCriteria:synchronously:completionHandler:", v11, 1, v28);
  v22 = v11;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = (id)v30[5];
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v16, "user");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "isEqualToString:", v9) & 1) != 0)
        {
          objc_msgSend(v16, "password");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v10);

          if (v19)
            objc_msgSend(v23, "addObject:", v16);
        }
        else
        {

        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
    }
    while (v13);
  }

  _Block_object_dispose(&v29, 8);
  return v23;
}

void __88__WBUFormDataController__credentialMatchesEligibleForUpdateForURL_username_oldPassword___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "exactMatches");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "potentialMatches");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (BOOL)_webView:(id)a3 saveUsernameAndPasswordForURL:(id)a4 formType:(unint64_t)a5 inFrame:(id)a6 username:(id)a7 password:(id)a8 isGeneratedPassword:(BOOL)a9 confirmOverwritingCurrentPassword:(BOOL)a10 inContext:(id)a11 submissionHandler:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _BOOL4 v23;
  BOOL v24;
  WBSSavedAccount *accountSavedWithGeneratedPassword;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  NSObject *v30;
  void *v31;
  WBSSavedAccount *v32;
  void *v33;
  WBSSavedAccount *v34;
  uint64_t v35;
  uint64_t v36;
  WBSSavedAccount *v38;
  int v39;
  int v40;
  uint8_t buf[8];
  const __CFString *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a4;
  v19 = a7;
  v20 = a8;
  v21 = a11;
  v22 = a12;
  v23 = -[WBUFormDataController _shouldSaveUsernamesAndPasswordsForURL:inWebView:](self, "_shouldSaveUsernamesAndPasswordsForURL:inWebView:", v18, v17);
  v24 = 1;
  if (a5 && v23)
  {
    if (!objc_msgSend(MEMORY[0x24BE82CC8], "isPasswordManagerAppEnabledAndInstalled"))
      goto LABEL_11;
    accountSavedWithGeneratedPassword = self->_accountSavedWithGeneratedPassword;
    if (!accountSavedWithGeneratedPassword)
      goto LABEL_11;
    -[WBSSavedAccount user](accountSavedWithGeneratedPassword, "user");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v19, "isEqualToString:", v26);

    v38 = self->_accountSavedWithGeneratedPassword;
    objc_msgSend(MEMORY[0x24BDB7490], "safari_HTMLFormProtectionSpaceForURL:", v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[WBSSavedAccount hasProtectionSpace:](v38, "hasProtectionSpace:", v27);

    -[WBSSavedAccount password](self->_accountSavedWithGeneratedPassword, "password");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqualToString:", v20);

    if (!v40)
      goto LABEL_11;
    if (v39 && (v29 & 1) == 0)
    {
      v30 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2112D6000, v30, OS_LOG_TYPE_DEFAULT, "Updating password of account saved after user edited a strong password", buf, 2u);
      }
      -[WBUFormDataController _updatePasswordOfPreviouslySavedAccount:withPasswordEditedByUser:](self, "_updatePasswordOfPreviouslySavedAccount:withPasswordEditedByUser:", self->_accountSavedWithGeneratedPassword, v20);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = self->_accountSavedWithGeneratedPassword;
      v42 = CFSTR("savedAccount");
      v43[0] = v32;
      v24 = 1;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "postNotificationName:object:userInfo:", CFSTR("formDataControllerDidUpdatePasswordForPreviouslySavedAccount"), self, v33);

      v34 = self->_accountSavedWithGeneratedPassword;
      self->_accountSavedWithGeneratedPassword = 0;

    }
    else
    {
LABEL_11:
      v35 = objc_msgSend(v19, "length");
      v36 = 1;
      if (!a10)
        v36 = 2;
      if (!a9)
        v36 = 0;
      if (!v35)
        v36 = 3;
      v24 = -[WBUFormDataController _saveUser:password:isGeneratedPassword:forURL:inContext:formType:promptingPolicy:webView:completionHandler:](self, "_saveUser:password:isGeneratedPassword:forURL:inContext:formType:promptingPolicy:webView:completionHandler:", v19, v20, a9, v18, v21, a5, v36, v17, v22);
    }
  }

  return v24;
}

- (BOOL)_updatePasswordOfPreviouslySavedAccount:(id)a3 withPasswordEditedByUser:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x24BE82DB8];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setSavedAccount:", v7);

  objc_msgSend(v8, "setPassword:", v6);
  objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "changeSavedAccountWithRequest:", v8);

  return 1;
}

- (BOOL)_saveUser:(id)a3 password:(id)a4 isGeneratedPassword:(BOOL)a5 forURL:(id)a6 inContext:(id)a7 formType:(unint64_t)a8 promptingPolicy:(int64_t)a9 webView:(id)a10 completionHandler:(id)a11
{
  _BOOL4 v13;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id *v21;
  id v22;
  id v23;
  void *v24;
  int v25;
  int v26;
  id v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  __CFString *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v55;
  id v56;
  id v57;
  void *v58;
  void *v60;
  WBUFormDataController *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  _QWORD *v79;
  _QWORD v80[4];
  id v81;
  id v82;
  id v83;
  id v84;
  _QWORD *v85;
  _QWORD v86[5];
  id v87;
  _QWORD v88[4];
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  BOOL v98;
  _QWORD v99[4];
  id v100;
  id v101;
  id v102;
  id v103;
  uint64_t *v104;
  _QWORD v105[4];
  id v106;
  id v107;
  __CFString *v108;
  id v109;
  WBUFormDataController *v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  BOOL v116;
  id v117;
  id v118;
  id v119;
  char v120;
  _QWORD v121[5];
  uint64_t v122;
  id *v123;
  uint64_t v124;
  uint64_t (*v125)(uint64_t, uint64_t);
  void (*v126)(uint64_t);
  id v127;

  v13 = a5;
  v72 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v67 = a10;
  v66 = a11;
  objc_msgSend(MEMORY[0x24BDB7490], "safari_HTMLFormProtectionSpaceForURL:", v17);
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = 0;
  v123 = (id *)&v122;
  v124 = 0x3032000000;
  v125 = __Block_byref_object_copy_;
  v126 = __Block_byref_object_dispose_;
  v127 = 0;
  v68 = v17;
  objc_msgSend(MEMORY[0x24BE82DD0], "criteriaForExactFQDNPasswordMatchesOfURL:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setContext:", v18);
  v121[0] = MEMORY[0x24BDAC760];
  v121[1] = 3221225472;
  v121[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke;
  v121[3] = &unk_24CB8D790;
  v121[4] = &v122;
  objc_msgSend(v71, "getSavedAccountsMatchingCriteria:withSynchronousCompletionHandler:", v20, v121);
  objc_msgSend(v123[5], "password");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)v19;
  v70 = v18;
  v120 = 0;
  v21 = v123;
  v22 = v123[5];
  v118 = 0;
  v119 = v22;
  v117 = 0;
  v61 = self;
  -[WBUFormDataController _relatedCredentialMatchesToUpdateForUser:protectionSpace:oldSavedAccount:matchesForCurrentHost:matchesForAssociatedDomains:haveExistingCredentialWithSameUsernameAndDifferentPassword:](self, "_relatedCredentialMatchesToUpdateForUser:protectionSpace:oldSavedAccount:matchesForCurrentHost:matchesForAssociatedDomains:haveExistingCredentialWithSameUsernameAndDifferentPassword:", v72, v19, &v119, &v118, &v117, &v120);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v21 + 5, v119);
  v62 = v118;
  v65 = v117;
  v23 = v123[5];
  objc_msgSend(v23, "password");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToString:", v16);

  if (v23)
    v26 = v25;
  else
    v26 = 0;
  if (v26 == 1 && objc_msgSend(v72, "length"))
  {
    objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setSavedAccountAsDefault:forProtectionSpace:context:", v123[5], v69, v70);
    v28 = 1;
    v29 = v62;
LABEL_30:

    v31 = v69;
    v30 = v70;
    goto LABEL_31;
  }
  if (objc_msgSend(v16, "length") && (objc_msgSend(v16, "safari_looksLikeObscuredPassword") & 1) == 0)
  {
    if (a9 == 3)
    {
      if (v13)
      {
        v32 = (void *)MEMORY[0x24BDD17C8];
        _WBSLocalizedString();
        v29 = v62;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "host");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "safari_highLevelDomainFromHost");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", v33, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = &stru_24CB8DE28;
      }
      else
      {
        titleTextForSavingNewPassword();
        v29 = v62;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        _WBSLocalizedString();
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v105[0] = MEMORY[0x24BDAC760];
      v105[1] = 3221225472;
      v105[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_2;
      v105[3] = &unk_24CB8D8F8;
      v106 = v67;
      v27 = v36;
      v107 = v27;
      v42 = v37;
      v108 = v42;
      v109 = v16;
      v116 = v13;
      v115 = v66;
      v110 = v61;
      v111 = v68;
      v112 = v71;
      v113 = v69;
      v114 = v70;
      -[WBUFormDataController bestUsernameSuggestionForUsernamePromptOnURL:inContext:completionHandler:](v61, "bestUsernameSuggestionForUsernamePromptOnURL:inContext:completionHandler:", v111, v114, v105);

      v28 = 0;
      goto LABEL_30;
    }
    v38 = v123[5];
    v39 = objc_msgSend(v65, "count");
    v99[0] = MEMORY[0x24BDAC760];
    v99[1] = 3221225472;
    v99[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_5;
    v99[3] = &unk_24CB8D920;
    v104 = &v122;
    v40 = v71;
    v100 = v40;
    v56 = v72;
    v101 = v56;
    v41 = v16;
    v102 = v41;
    v57 = v69;
    v103 = v57;
    v58 = (void *)MEMORY[0x212BD7EA4](v99);
    if (!a9)
      goto LABEL_23;
    if (a9 == 2)
    {
      if (v39 || objc_msgSend(v64, "count"))
        goto LABEL_23;
    }
    else if (a9 == 1 && (v38 || v39))
    {
LABEL_23:
      objc_msgSend(v68, "host");
      v29 = v62;
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v120;
      v88[0] = MEMORY[0x24BDAC760];
      v88[1] = 3221225472;
      v88[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_6;
      v88[3] = &unk_24CB8D948;
      v96 = v58;
      v89 = v64;
      v90 = v40;
      v91 = v70;
      v92 = v57;
      v98 = v38 != 0;
      v93 = v41;
      v94 = v65;
      v95 = v67;
      v97 = v66;
      LOBYTE(v55) = v44;
      -[WBUFormDataController _showPasswordPromptForWebView:formType:username:host:hasCredentialForCurrentHost:existingCredentialMatchesForCurrentHost:otherSubdomainCredentialMatches:haveExistingCredentialWithSameUsernameAndDifferentPassword:completionHandler:](v61, "_showPasswordPromptForWebView:formType:username:host:hasCredentialForCurrentHost:existingCredentialMatchesForCurrentHost:otherSubdomainCredentialMatches:haveExistingCredentialWithSameUsernameAndDifferentPassword:completionHandler:", v95, a8, v56, v43, v38 != 0, v62, v89, v55, v88);

      v28 = 0;
LABEL_29:

      v27 = v100;
      goto LABEL_30;
    }
    v86[0] = 0;
    v86[1] = v86;
    v86[2] = 0x3032000000;
    v86[3] = __Block_byref_object_copy_;
    v86[4] = __Block_byref_object_dispose_;
    v87 = 0;
    objc_msgSend(MEMORY[0x24BE82DD0], "criteriaForExactFQDNPasswordMatchesOfURL:", v68);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "dontSaveMarker");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setPartialUsername:", v46);

    objc_msgSend(v45, "setContext:", v70);
    v80[0] = MEMORY[0x24BDAC760];
    v80[1] = 3221225472;
    v80[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_7;
    v80[3] = &unk_24CB8D998;
    v47 = v40;
    v81 = v47;
    v48 = v58;
    v84 = v48;
    v85 = v86;
    v82 = v57;
    v49 = v70;
    v83 = v49;
    objc_msgSend(v47, "savedAccountsMatchingCriteria:withCompletionHandler:", v45, v80);
    v28 = 1;
    if (a8 == 5 && v63 && objc_msgSend(v64, "count"))
    {
      objc_msgSend(v68, "host");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "firstObject");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "protectionSpace");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "host");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "safari_highLevelDomainFromHost");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v73[0] = MEMORY[0x24BDAC760];
      v73[1] = 3221225472;
      v73[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_9;
      v73[3] = &unk_24CB8D9C0;
      v77 = v48;
      v79 = v86;
      v74 = v64;
      v75 = v47;
      v76 = v49;
      v78 = v66;
      -[WBUFormDataController _promptToUpdateRelatedCredentials:urlHost:relatedCredentialsHighLevelDomain:webView:completionHandler:](v61, "_promptToUpdateRelatedCredentials:urlHost:relatedCredentialsHighLevelDomain:webView:completionHandler:", v56, v50, v53, v67, v73);

      v28 = 0;
    }

    _Block_object_dispose(v86, 8);
    v29 = v62;
    goto LABEL_29;
  }
  v28 = 1;
  v31 = v69;
  v30 = v70;
  v29 = v62;
LABEL_31:

  _Block_object_dispose(&v122, 8);
  return v28;
}

void __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "exactMatches");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "savedAccount");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  WBUFormAutoFillPrompt *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;

  v3 = a2;
  v4 = objc_alloc_init(WBUFormAutoFillPrompt);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v9 = *(unsigned __int8 *)(a1 + 112);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_3;
  v13[3] = &unk_24CB8D8D0;
  v10 = *(id *)(a1 + 104);
  v11 = *(_QWORD *)(a1 + 64);
  v12 = *(void **)(a1 + 72);
  v20 = v10;
  v13[4] = v11;
  v14 = v12;
  v15 = *(id *)(a1 + 56);
  v21 = *(_BYTE *)(a1 + 112);
  v16 = *(id *)(a1 + 80);
  v17 = *(id *)(a1 + 88);
  v18 = *(id *)(a1 + 96);
  v19 = *(id *)(a1 + 32);
  -[WBUFormAutoFillPrompt showAutoFillPromptForUsernameInWebView:title:message:suggestedUsername:password:isGeneratedPassword:completionHandler:](v4, "showAutoFillPromptForUsernameInWebView:title:message:suggestedUsername:password:isGeneratedPassword:completionHandler:", v5, v6, v8, v3, v7, v9, v13);

}

void __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  _BYTE *v50;
  uint64_t *v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[6];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _BYTE buf[24];
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!objc_msgSend(v3, "length"))
  {
    v13 = *(_QWORD *)(a1 + 88);
    if (v13)
      (*(void (**)(void))(v13 + 16))();
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208))
    {
      objc_msgSend(MEMORY[0x24BE82CD8], "sharedStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeGeneratedPassword:completionHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208), 0);

    }
    objc_msgSend(MEMORY[0x24BDB7490], "safari_HTMLFormProtectionSpaceForURL:", *(_QWORD *)(a1 + 40));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7480]), "initWithUser:password:persistence:", &stru_24CB8DE28, *(_QWORD *)(a1 + 48), 3);
    objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "savedAccountWithAllMetadataForURLCredential:protectionSpace:", v43, v44);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_BYTE *)(a1 + 96))
    {
      v17 = v16;
      if (!v16 || (objc_msgSend(v16, "hasSidecarData") & 1) != 0)
        goto LABEL_29;
      v18 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2112D6000, v18, OS_LOG_TYPE_INFO, "Deleting a password without a username because the user opted not to save an ASP from the username dialog", buf, 2u);
      }
      objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeCredentialTypes:forSavedAccount:", 1, v16);

    }
    v17 = v16;
    goto LABEL_29;
  }
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v6 = *(void **)(a1 + 64);
  objc_msgSend(v6, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_highLevelDomainForPasswordManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "saveUser:password:forProtectionSpace:highLevelDomain:groupID:", v3, v4, v6, v8, &stru_24CB8DE28);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 96))
  {
    objc_msgSend(MEMORY[0x24BE82C88], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didUseGeneratedPassword");

  }
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7480]), "initWithUser:password:persistence:", &stru_24CB8DE28, *(_QWORD *)(a1 + 48), 3);
  objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "savedAccountWithAllMetadataForURLCredential:protectionSpace:", v43, *(_QWORD *)(a1 + 64));
  v42 = objc_claimAutoreleasedReturnValue();

  v11 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v42)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2112D6000, v11, OS_LOG_TYPE_DEFAULT, "Update existing saved account without a password", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 56), "changeSavedAccount:toUser:password:", v42, v3, *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (v12)
    {
      v20 = v11;
      objc_msgSend(v44, "user");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "host");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138740227;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2117;
      *(_QWORD *)&buf[14] = v22;
      _os_log_impl(&dword_2112D6000, v20, OS_LOG_TYPE_DEFAULT, "Setting saved account for user %{sensitive}@ as default for %{sensitive}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 56), "setSavedAccountAsDefault:forProtectionSpace:context:", v44, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v64 = __Block_byref_object_copy_;
  v65 = __Block_byref_object_dispose_;
  v66 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy_;
  v61 = __Block_byref_object_dispose_;
  v62 = 0;
  objc_msgSend(MEMORY[0x24BE82DD0], "criteriaForExactFQDNPasswordMatchesOfURL:", *(_QWORD *)(a1 + 40));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setOptions:", objc_msgSend(v23, "options") | 3);
  v24 = *(void **)(a1 + 32);
  v25 = MEMORY[0x24BDAC760];
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_163;
  v56[3] = &unk_24CB8D858;
  v56[4] = buf;
  v56[5] = &v57;
  objc_msgSend(v24, "getSavedAccountMatchesWithCriteria:synchronously:completionHandler:", v23, 1, v56);
  v26 = *(void **)(*(_QWORD *)&buf[8] + 40);
  v54[0] = v25;
  v54[1] = 3221225472;
  v54[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_2_164;
  v54[3] = &unk_24CB8D880;
  v27 = v3;
  v55 = v27;
  objc_msgSend(v26, "safari_filterObjectsUsingBlock:", v54);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = *(void **)(*(_QWORD *)&buf[8] + 40);
  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v28;

  v30 = (void *)v58[5];
  v52[0] = v25;
  v52[1] = 3221225472;
  v52[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_3_166;
  v52[3] = &unk_24CB8D880;
  v31 = v27;
  v53 = v31;
  objc_msgSend(v30, "safari_filterObjectsUsingBlock:", v52);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v58[5];
  v58[5] = v32;

  if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count") || objc_msgSend((id)v58[5], "count"))
  {
    v34 = v3;
    if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "firstObject");
    else
      objc_msgSend((id)v58[5], "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "host");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "host");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "safari_highLevelDomainFromHost");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = *(_QWORD *)(a1 + 80);
    v45[0] = v25;
    v45[1] = 3221225472;
    v45[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_4;
    v45[3] = &unk_24CB8D8A8;
    v50 = buf;
    v46 = *(id *)(a1 + 56);
    v47 = v44;
    v48 = *(id *)(a1 + 72);
    v51 = &v57;
    v49 = *(id *)(a1 + 88);
    objc_msgSend(v37, "_promptToUpdateRelatedCredentials:urlHost:relatedCredentialsHighLevelDomain:webView:completionHandler:", v31, v38, v39, v40, v45);

    v3 = v34;
  }
  else
  {
    v41 = *(_QWORD *)(a1 + 88);
    if (v41)
      (*(void (**)(void))(v41 + 16))();
  }

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(buf, 8);

  v17 = (void *)v42;
LABEL_29:

}

void __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_163(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "potentialMatches");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(v3, "associatedDomainMatches");
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

uint64_t __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_2_164(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_3_166(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_4(_QWORD *a1, int a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t result;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v3 = *(id *)(*(_QWORD *)(a1[8] + 8) + 40);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v25;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v25 != v6)
            objc_enumerationMutation(v3);
          v8 = (void *)a1[4];
          v9 = a1[5];
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v7), "protectionSpace");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setSavedAccountAsDefault:forProtectionSpace:context:", v9, v10, a1[6]);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v5);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = *(id *)(*(_QWORD *)(a1[9] + 8) + 40);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)a1[4];
          v17 = a1[5];
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v15), "protectionSpace", (_QWORD)v20);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setSavedAccountAsDefault:forProtectionSpace:context:", v17, v18, a1[6]);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v13);
    }

  }
  result = a1[7];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

BOOL __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_5(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
  if (v3)
  {
    *a2 = objc_retainAutorelease(v3);
  }
  else
  {
    v4 = (void *)a1[4];
    v5 = a1[5];
    v6 = a1[6];
    v7 = (void *)a1[7];
    objc_msgSend(v7, "host");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_highLevelDomainForPasswordManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "saveUser:password:forProtectionSpace:highLevelDomain:groupID:", v5, v6, v7, v9, &stru_24CB8DE28);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v3 == 0;
}

void __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_6(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  char v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (a2 > 1)
  {
    v5 = 0;
    v6 = 0;
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 88);
    v32 = 0;
    v5 = (*(uint64_t (**)(void))(v4 + 16))();
    v6 = 0;
  }
  switch(a2)
  {
    case 0uLL:
      goto LABEL_13;
    case 1uLL:
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v7 = *(id *)(a1 + 32);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v29 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(a1 + 40);
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "protectionSpace");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setSavedAccountAsDefault:forProtectionSpace:context:", v6, v13, *(_QWORD *)(a1 + 48));

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        }
        while (v9);
      }

LABEL_13:
      objc_msgSend(*(id *)(a1 + 40), "setSavedAccountAsDefault:forProtectionSpace:", v6, *(_QWORD *)(a1 + 56));
      if (*(_BYTE *)(a1 + 104))
        v14 = v5;
      else
        v14 = 1;
      if ((v14 & 1) == 0)
      {
        v15 = objc_alloc_init(MEMORY[0x24BE82DB8]);
        objc_msgSend(v15, "setSavedAccount:", v6);
        objc_msgSend(v15, "setPassword:", *(_QWORD *)(a1 + 64));
        objc_msgSend(*(id *)(a1 + 40), "changeSavedAccountWithRequest:", v15);

      }
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v16 = *(id *)(a1 + 72);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v25;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v25 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(a1 + 40);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "protectionSpace", (_QWORD)v24);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setSavedAccountAsDefault:forProtectionSpace:context:", v6, v22, *(_QWORD *)(a1 + 48));

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        }
        while (v18);
      }
      goto LABEL_28;
    case 2uLL:
      objc_msgSend(*(id *)(a1 + 80), "webui_removeFormMetadataForLastPasswordGenerationOrSubmitEventInFrame:", 0);
      break;
    case 3uLL:
      objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setDontSaveMarkerForSavedAccountsWithProtectionSpace:", *(_QWORD *)(a1 + 56));
LABEL_28:

      break;
    default:
      break;
  }
  v23 = *(_QWORD *)(a1 + 96);
  if (v23)
    (*(void (**)(void))(v23 + 16))();

}

void __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_8;
  v7[3] = &unk_24CB8D970;
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v12 = v4;
  v13 = v5;
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "exactMatches");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v6), "savedAccount");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeCredentialTypes:forSavedAccount:", 3, v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  v9 = *(_QWORD *)(a1 + 64);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v10 + 40);
  (*(void (**)(void))(v9 + 16))();
  objc_storeStrong((id *)(v10 + 40), obj);
  return objc_msgSend(*(id *)(a1 + 40), "setSavedAccountAsDefault:forProtectionSpace:context:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_9(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t result;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id obj;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 56);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    obj = *(id *)(v4 + 40);
    (*(void (**)(void))(v3 + 16))();
    objc_storeStrong((id *)(v4 + 40), obj);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = *(id *)(a1 + 32);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(a1 + 40);
          v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "protectionSpace", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setSavedAccountAsDefault:forProtectionSpace:context:", v11, v12, *(_QWORD *)(a1 + 48));

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v7);
    }

  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_promptToUpdateRelatedCredentials:(id)a3 urlHost:(id)a4 relatedCredentialsHighLevelDomain:(id)a5 webView:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a7;
  v14 = a6;
  v15 = a4;
  +[WBUFormDataController keychainSyncEnabled](WBUFormDataController, "keychainSyncEnabled");
  v16 = (void *)MEMORY[0x24BDD17C8];
  _WBSLocalizedString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringWithFormat:", v17, v11, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BDD17C8];
  _WBSLocalizedString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringWithFormat:", v20, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  _WBSLocalizedString();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __127__WBUFormDataController__promptToUpdateRelatedCredentials_urlHost_relatedCredentialsHighLevelDomain_webView_completionHandler___block_invoke;
  v26[3] = &unk_24CB8D7B8;
  v27 = v13;
  v25 = v13;
  +[WBUFormAutoFillPrompt showAutoFillPromptInWebView:title:message:cancelButtonTitle:otherButtonTitles:makeFirstButtonSuggestedAction:completionHandler:](WBUFormAutoFillPrompt, "showAutoFillPromptInWebView:title:message:cancelButtonTitle:otherButtonTitles:makeFirstButtonSuggestedAction:completionHandler:", v14, v18, v21, v22, v24, 1, v26);

}

uint64_t __127__WBUFormDataController__promptToUpdateRelatedCredentials_urlHost_relatedCredentialsHighLevelDomain_webView_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != -1);
}

- (void)saveUser:(id)a3 password:(id)a4 forURL:(id)a5 inContext:(id)a6 andPromptToUpdateRelatedCredentialsWithWebView:(id)a7
{
  -[WBUFormDataController _saveUser:password:isGeneratedPassword:forURL:inContext:formType:promptingPolicy:webView:completionHandler:](self, "_saveUser:password:isGeneratedPassword:forURL:inContext:formType:promptingPolicy:webView:completionHandler:", a3, a4, 0, a5, a6, 5, 2, a7, 0);
}

- (void)didFillFieldWithGeneratedPassword:(id)a3 inFrame:(id)a4 webView:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = (void *)MEMORY[0x24BDB7490];
  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "webui_URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_HTMLFormProtectionSpaceForURL:", v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDB7480], "safari_credentialWithUser:password:persistence:", &stru_24CB8DE28, v9, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB7488], "sharedCredentialStorage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCredential:forProtectionSpace:", v11, v13);

  objc_msgSend(v8, "webui_setLastGeneratedPasswordForCurrentBackForwardItem:", v9);
}

- (BOOL)_webView:(id)a3 saveUsernameAndPasswordFromForm:(id)a4 inFrame:(id)a5 context:(id)a6 confirmOverwritingCurrentPassword:(BOOL)a7 shouldPreferAnnotatedCredentials:(BOOL)a8 submissionHandler:(id)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  __CFString *v21;
  id v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v26;
  BOOL v27;
  id v28;
  id v29;

  v9 = a8;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  objc_msgSend(v17, "webui_URL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WBUFormDataController _shouldSaveUsernamesAndPasswordsForURL:inWebView:](self, "_shouldSaveUsernamesAndPasswordsForURL:inWebView:", v20, v15))
  {
    v27 = a7;
    v28 = 0;
    v29 = 0;
    -[WBUFormDataController willSubmitFormWithCredentials:shouldPreferAnnotatedCredentials:atURL:username:password:inContext:](self, "willSubmitFormWithCredentials:shouldPreferAnnotatedCredentials:atURL:username:password:inContext:", v16, v9, v20, &v29, &v28, v18);
    v21 = (__CFString *)v29;
    v22 = v28;
    if (!v21)
      v21 = &stru_24CB8DE28;
    if (v9)
    {
      v23 = 4;
    }
    else if (v16)
    {
      v23 = objc_msgSend(v16, "type");
    }
    else
    {
      v23 = 0;
    }
    BYTE1(v26) = v27;
    LOBYTE(v26) = objc_msgSend(v16, "usesGeneratedPassword");
    v24 = -[WBUFormDataController _webView:saveUsernameAndPasswordForURL:formType:inFrame:username:password:isGeneratedPassword:confirmOverwritingCurrentPassword:inContext:submissionHandler:](self, "_webView:saveUsernameAndPasswordForURL:formType:inFrame:username:password:isGeneratedPassword:confirmOverwritingCurrentPassword:inContext:submissionHandler:", v15, v20, v23, v17, v21, v22, v26, v18, v19);

  }
  else
  {
    v24 = 1;
  }

  return v24;
}

- (BOOL)_webView:(id)a3 formSubmission:(BOOL)a4 willSubmitNewAccountOrChangePasswordFormWithMetadata:(id)a5 shouldPreferAnnotatedCredentials:(BOOL)a6 fromFrame:(id)a7 inContext:(id)a8 submissionHandler:(id)a9
{
  _BOOL4 v12;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  _BOOL4 v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;
  BOOL v32;

  v24 = a6;
  v12 = a4;
  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  +[WBUCreditCardDataController sharedCreditCardDataController](WBUCreditCardDataController, "sharedCreditCardDataController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "savableCreditCardDataInForm:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    goto LABEL_10;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __173__WBUFormDataController__webView_formSubmission_willSubmitNewAccountOrChangePasswordFormWithMetadata_shouldPreferAnnotatedCredentials_fromFrame_inContext_submissionHandler___block_invoke;
  v25[3] = &unk_24CB8D9E8;
  v25[4] = self;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v29 = v17;
  v31 = v12;
  v32 = v24;
  v30 = v18;
  v21 = -[WBUFormDataController _webView:willSubmitFormContainingCreditCardData:fromFrame:submissionHandler:](self, "_webView:willSubmitFormContainingCreditCardData:fromFrame:submissionHandler:", v26, v20, v28, v25);

  if (v21)
  {
LABEL_10:
    if (objc_msgSend(v15, "usesGeneratedPassword")
      && objc_msgSend(MEMORY[0x24BE82CC8], "isPasswordManagerAppEnabledAndInstalled"))
    {
      objc_msgSend(MEMORY[0x24BE82D68], "sharedNotificationManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "scheduleTakeATourNotificationIfNeededWithCompletionHandler:", &__block_literal_global_3);

    }
    LOBYTE(v21) = -[WBUFormDataController _webView:saveUsernameAndPasswordFromForm:inFrame:context:confirmOverwritingCurrentPassword:shouldPreferAnnotatedCredentials:submissionHandler:](self, "_webView:saveUsernameAndPasswordFromForm:inFrame:context:confirmOverwritingCurrentPassword:shouldPreferAnnotatedCredentials:submissionHandler:", v14, v15, v16, v17, !v12, v24, v18);
  }

  return v21;
}

uint64_t __173__WBUFormDataController__webView_formSubmission_willSubmitNewAccountOrChangePasswordFormWithMetadata_shouldPreferAnnotatedCredentials_fromFrame_inContext_submissionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_webView:saveUsernameAndPasswordFromForm:inFrame:context:confirmOverwritingCurrentPassword:shouldPreferAnnotatedCredentials:submissionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_BYTE *)(a1 + 80) == 0, *(unsigned __int8 *)(a1 + 81), *(_QWORD *)(a1 + 72));
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  return result;
}

- (BOOL)_webView:(id)a3 willSubmitStandardFormWithMetadata:(id)a4 fromFrame:(id)a5 submissionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  BOOL v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend((id)objc_opt_class(), "formContainsCreditCardData:", v11))
  {
    +[WBUCreditCardDataController sharedCreditCardDataController](WBUCreditCardDataController, "sharedCreditCardDataController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "savableCreditCardDataInForm:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      v16 = -[WBUFormDataController _webView:willSubmitFormContainingCreditCardData:fromFrame:submissionHandler:](self, "_webView:willSubmitFormContainingCreditCardData:fromFrame:submissionHandler:", v10, v15, v12, v13);
    else
      v16 = 1;

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (void)_showPasswordPromptForWebView:(id)a3 formType:(unint64_t)a4 username:(id)a5 host:(id)a6 hasCredentialForCurrentHost:(BOOL)a7 existingCredentialMatchesForCurrentHost:(id)a8 otherSubdomainCredentialMatches:(id)a9 haveExistingCredentialWithSameUsernameAndDifferentPassword:(BOOL)a10 completionHandler:(id)a11
{
  _BOOL4 v12;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
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
  id v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  _QWORD v64[3];

  v12 = a7;
  v64[2] = *MEMORY[0x24BDAC8D0];
  v16 = a5;
  v17 = a6;
  v60 = a8;
  v18 = a9;
  v19 = a11;
  v20 = a3;
  objc_msgSend(v17, "safari_highLevelDomainFromHost");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v16;
  v59 = v18;
  if (v12)
  {
    if (a4 == 5)
    {
      v23 = v17;
      v24 = v16;
      +[WBUFormDataController keychainSyncEnabled](WBUFormDataController, "keychainSyncEnabled");
      v25 = (void *)MEMORY[0x24BDD17C8];
      _WBSLocalizedString();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringWithFormat:", v33, v24, v23);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v59, "count"))
      {
        if (a10)
        {
          v35 = (void *)MEMORY[0x24BDD17C8];
          _WBSLocalizedString();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "localizedStringWithFormat:", v36, v21);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v37 = 0;
        }
        _WBSLocalizedString();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v50);

        v42 = &unk_24CB91FA8;
      }
      else
      {
        _WBSLocalizedString();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v46);

        v42 = &unk_24CB91FC0;
        v37 = v34;
        v34 = 0;
      }
    }
    else if (objc_msgSend(v18, "count"))
    {
      objc_msgSend(v18, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "host");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "safari_highLevelDomainFromHost");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = v16;
      v21 = v30;
      +[WBUFormDataController keychainSyncEnabled](WBUFormDataController, "keychainSyncEnabled");
      v32 = (void *)MEMORY[0x24BDD17C8];
      _WBSLocalizedString();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringWithFormat:", v47, v31, v21);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (a10)
      {
        v48 = (void *)MEMORY[0x24BDD17C8];
        _WBSLocalizedString();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "localizedStringWithFormat:", v49, v21);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v37 = 0;
      }
      _WBSLocalizedString();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v51);

      v42 = &unk_24CB91FD8;
    }
    else
    {
      v43 = v17;
      v44 = v16;
      +[WBUFormDataController keychainSyncEnabled](WBUFormDataController, "keychainSyncEnabled");
      v45 = (void *)MEMORY[0x24BDD17C8];
      _WBSLocalizedString();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "localizedStringWithFormat:", v52, v44, v43);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      _WBSLocalizedString();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v53);

      v34 = 0;
      v42 = &unk_24CB91FF0;
    }
  }
  else
  {
    if (objc_msgSend(MEMORY[0x24BE6FB08], "shouldShowLoginIntroduction"))
    {
      v26 = (void *)MEMORY[0x24BDD17C8];
      _WBSLocalizedString();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", v27, v21);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      titleTextForSavingNewPassword();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (!objc_msgSend(MEMORY[0x24BE6FB08], "shouldShowLoginIntroduction"))
      objc_msgSend(MEMORY[0x24BE82CC8], "isPasswordManagerAppEnabledAndInstalled");
    _WBSLocalizedString();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v38);

    v39 = objc_msgSend(v60, "count");
    if ((objc_msgSend(MEMORY[0x24BE6FB08], "shouldShowLoginIntroduction") & 1) == 0 && !v39)
    {
      _WBSLocalizedString();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v40);

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v41;
    v64[1] = &unk_24CB91F70;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v64, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _WBSLocalizedString();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = MEMORY[0x24BDAC760];
  v61[1] = 3221225472;
  v61[2] = __255__WBUFormDataController__showPasswordPromptForWebView_formType_username_host_hasCredentialForCurrentHost_existingCredentialMatchesForCurrentHost_otherSubdomainCredentialMatches_haveExistingCredentialWithSameUsernameAndDifferentPassword_completionHandler___block_invoke;
  v61[3] = &unk_24CB8DA30;
  v62 = v42;
  v63 = v19;
  v55 = v42;
  v56 = v19;
  LOBYTE(v57) = 1;
  +[WBUFormAutoFillPrompt showAutoFillPromptInWebView:title:message:cancelButtonTitle:otherButtonTitles:cancelWhenAppEntersBackground:makeFirstButtonSuggestedAction:headerViewController:completionHandler:](WBUFormAutoFillPrompt, "showAutoFillPromptInWebView:title:message:cancelButtonTitle:otherButtonTitles:cancelWhenAppEntersBackground:makeFirstButtonSuggestedAction:headerViewController:completionHandler:", v20, v34, v37, v54, v22, 0, v57, 0, v61);

}

void __255__WBUFormDataController__showPasswordPromptForWebView_formType_username_host_hasCredentialForCurrentHost_existingCredentialMatchesForCurrentHost_otherSubdomainCredentialMatches_haveExistingCredentialWithSameUsernameAndDifferentPassword_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (a2 == -1)
  {
    if (objc_msgSend(MEMORY[0x24BE6FB08], "shouldShowLoginIntroduction"))
      v4 = 4;
    else
      v4 = 2;
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v4);
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, objc_msgSend(v5, "unsignedIntegerValue"));

  }
}

- (void)_completePasswordsAppIntroduction
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "pm_defaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 1, *MEMORY[0x24BE6FB10]);

}

- (id)_relatedCredentialMatchesToUpdateForUser:(id)a3 protectionSpace:(id)a4 oldSavedAccount:(id *)a5 matchesForCurrentHost:(id *)a6 matchesForAssociatedDomains:(id *)a7
{
  return -[WBUFormDataController _relatedCredentialMatchesToUpdateForUser:protectionSpace:oldSavedAccount:matchesForCurrentHost:matchesForAssociatedDomains:haveExistingCredentialWithSameUsernameAndDifferentPassword:](self, "_relatedCredentialMatchesToUpdateForUser:protectionSpace:oldSavedAccount:matchesForCurrentHost:matchesForAssociatedDomains:haveExistingCredentialWithSameUsernameAndDifferentPassword:", a3, a4, a5, a6, a7, 0);
}

- (id)_relatedCredentialMatchesToUpdateForUser:(id)a3 protectionSpace:(id)a4 oldSavedAccount:(id *)a5 matchesForCurrentHost:(id *)a6 matchesForAssociatedDomains:(id *)a7 haveExistingCredentialWithSameUsernameAndDifferentPassword:(BOOL *)a8
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _QWORD v50[4];
  id v51;
  uint64_t *v52;
  uint64_t *v53;
  _QWORD *v54;
  _QWORD v55[5];
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;

  v11 = a3;
  v12 = a4;
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy_;
  v67 = __Block_byref_object_dispose_;
  v68 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy_;
  v61 = __Block_byref_object_dispose_;
  v62 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy_;
  v55[4] = __Block_byref_object_dispose_;
  v56 = 0;
  v13 = objc_alloc(MEMORY[0x24BE82DD0]);
  objc_msgSend(v12, "safari_URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithURL:options:partialUsername:associatedDomainsManager:webFrameIdentifier:", v14, 19, &stru_24CB8DE28, 0, 0);

  v16 = MEMORY[0x24BDAC760];
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __207__WBUFormDataController__relatedCredentialMatchesToUpdateForUser_protectionSpace_oldSavedAccount_matchesForCurrentHost_matchesForAssociatedDomains_haveExistingCredentialWithSameUsernameAndDifferentPassword___block_invoke;
  v50[3] = &unk_24CB8DA58;
  v52 = &v63;
  v17 = v11;
  v51 = v17;
  v53 = &v57;
  v54 = v55;
  -[WBUFormDataController getSavedAccountMatchesWithCriteria:synchronously:completionHandler:](self, "getSavedAccountMatchesWithCriteria:synchronously:completionHandler:", v15, 1, v50);
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy_;
  v48 = __Block_byref_object_dispose_;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30[0] = v16;
  v30[1] = 3221225472;
  v30[2] = __207__WBUFormDataController__relatedCredentialMatchesToUpdateForUser_protectionSpace_oldSavedAccount_matchesForCurrentHost_matchesForAssociatedDomains_haveExistingCredentialWithSameUsernameAndDifferentPassword___block_invoke_2;
  v30[3] = &unk_24CB8DA80;
  v32 = &v40;
  v18 = v17;
  v31 = v18;
  v33 = v55;
  v34 = &v36;
  v35 = &v44;
  v19 = (void *)MEMORY[0x212BD7EA4](v30);
  objc_msgSend((id)v64[5], "potentialMatches");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "safari_filterObjectsUsingBlock:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (*((_BYTE *)v41 + 24))
  {

    v21 = (void *)MEMORY[0x24BDBD1A8];
  }
  v22 = (void *)MEMORY[0x24BDBD1A8];
  if (a6)
  {
    *((_BYTE *)v41 + 24) = 0;
    objc_msgSend((id)v64[5], "exactMatches");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "safari_filterObjectsUsingBlock:", v19);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    if (*((_BYTE *)v41 + 24))
      *a6 = v22;
  }
  if (a7)
  {
    v24 = (void *)v45[5];
    v45[5] = 0;

    *((_BYTE *)v41 + 24) = 0;
    objc_msgSend((id)v64[5], "associatedDomainMatches");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "safari_filterObjectsUsingBlock:", v19);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    if (*((_BYTE *)v41 + 24))
      *a7 = v22;
  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v58[5]);
  if (a8)
    *a8 = *((_BYTE *)v37 + 24);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
  return v21;
}

void __207__WBUFormDataController__relatedCredentialMatchesToUpdateForUser_protectionSpace_oldSavedAccount_matchesForCurrentHost_matchesForAssociatedDomains_haveExistingCredentialWithSameUsernameAndDifferentPassword___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v4, "exactMatches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v10, "user");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", a1[4]);

        if (v12)
        {
          objc_msgSend(v10, "savedAccount");
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = *(_QWORD *)(a1[6] + 8);
          v15 = *(void **)(v14 + 40);
          *(_QWORD *)(v14 + 40) = v13;

          objc_msgSend(v10, "password");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = *(_QWORD *)(a1[7] + 8);
          v18 = *(void **)(v17 + 40);
          *(_QWORD *)(v17 + 40) = v16;

          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v4, "potentialMatches", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v31;
      while (2)
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v31 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          objc_msgSend(v24, "user");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqualToString:", a1[4]);

          if (v26)
          {
            objc_msgSend(v24, "password");
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = *(_QWORD *)(a1[7] + 8);
            v29 = *(void **)(v28 + 40);
            *(_QWORD *)(v28 + 40) = v27;

            goto LABEL_22;
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v21)
          continue;
        break;
      }
    }
LABEL_22:

  }
}

uint64_t __207__WBUFormDataController__relatedCredentialMatchesToUpdateForUser_protectionSpace_oldSavedAccount_matchesForCurrentHost_matchesForAssociatedDomains_haveExistingCredentialWithSameUsernameAndDifferentPassword___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    objc_msgSend(v3, "user");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", a1[4]);

    if (!(_DWORD)v5)
      goto LABEL_13;
    objc_msgSend(v4, "password");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    {
      v5 = 1;
      if ((objc_msgSend(v7, "isEqualToString:") & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
        v5 = 0;
      }
      goto LABEL_12;
    }
    v9 = *(_QWORD *)(a1[8] + 8);
    if (*(_QWORD *)(v9 + 40))
    {
      if (!objc_msgSend(v7, "isEqualToString:"))
      {
        v5 = 0;
        *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
        goto LABEL_12;
      }
      v9 = *(_QWORD *)(a1[8] + 8);
    }
    objc_storeStrong((id *)(v9 + 40), v8);
    v5 = 1;
LABEL_12:

    goto LABEL_13;
  }
  v5 = 0;
LABEL_13:

  return v5;
}

- (BOOL)_webView:(id)a3 saveCredentialsForURL:(id)a4 formSubmission:(BOOL)a5 formWithMetadata:(id)a6 fromFrame:(id)a7 username:(id)a8 password:(id)a9 inContext:(id)a10 submissionHandler:(id)a11
{
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __int16 *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  BOOL v39;
  void *v40;
  char v41;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  WBUFormDataController *v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  WBUFormDataController *v71;
  id v72;
  id v73;
  BOOL v74;
  __int16 v75;
  _QWORD block[4];
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  char v86;
  _QWORD v87[5];
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  char v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v56 = a6;
  v54 = a7;
  v59 = a8;
  v18 = a9;
  v58 = a10;
  v55 = a11;
  v53 = self;
  v57 = v16;
  v60 = v18;
  if (-[WBUFormDataController _shouldSaveUsernamesAndPasswordsForURL:inWebView:](self, "_shouldSaveUsernamesAndPasswordsForURL:inWebView:", v17, v16)&& (objc_msgSend(v18, "safari_looksLikeObscuredPassword") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDB7490], "safari_HTMLFormProtectionSpaceForURL:", v17);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = 0;
    v89 = &v88;
    v90 = 0x2020000000;
    v91 = 0;
    objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE82DD0], "criteriaForExactFQDNPasswordMatchesOfURL:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setOptions:", objc_msgSend(v19, "options") | 4);
    v20 = MEMORY[0x24BDAC760];
    v87[0] = MEMORY[0x24BDAC760];
    v87[1] = 3221225472;
    v87[2] = __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke;
    v87[3] = &unk_24CB8D790;
    v87[4] = &v88;
    objc_msgSend(v52, "getSavedAccountsMatchingCriteria:withSynchronousCompletionHandler:", v19, v87);
    v50 = v19;
    if (*((_BYTE *)v89 + 24))
    {
      a5 = 1;
LABEL_38:

      _Block_object_dispose(&v88, 8);
      goto LABEL_39;
    }
    v86 = 0;
    v84 = 0;
    v85 = 0;
    v83 = 0;
    -[WBUFormDataController _relatedCredentialMatchesToUpdateForUser:protectionSpace:oldSavedAccount:matchesForCurrentHost:matchesForAssociatedDomains:haveExistingCredentialWithSameUsernameAndDifferentPassword:](self, "_relatedCredentialMatchesToUpdateForUser:protectionSpace:oldSavedAccount:matchesForCurrentHost:matchesForAssociatedDomains:haveExistingCredentialWithSameUsernameAndDifferentPassword:", v59, v51, &v85, &v84, &v83, &v86);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v85;
    v45 = v84;
    v44 = v83;
    v49 = v21;
    objc_msgSend(v21, "password");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v46, "count")
      && !objc_msgSend(v44, "count")
      && objc_msgSend(off_24CB8CC70, "password:shouldBeConsideredEqualToExistingPassword:", v60, v47))
    {
      dispatch_get_global_queue(21, 0);
      v22 = objc_claimAutoreleasedReturnValue();
      block[0] = v20;
      block[1] = 3221225472;
      block[2] = __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke_2;
      block[3] = &unk_24CB8DAA8;
      v23 = v21;
      v77 = v23;
      v24 = v51;
      v78 = v24;
      v79 = v52;
      v80 = v58;
      v81 = v59;
      v82 = v60;
      dispatch_async(v22, block);

      -[WBUFormDataController _warnAboutWeakPasswordIfNecessaryWithWebView:savedAccount:protectionSpace:](self, "_warnAboutWeakPasswordIfNecessaryWithWebView:savedAccount:protectionSpace:", v16, v23, v24);
      a5 = 1;
LABEL_37:

      goto LABEL_38;
    }
    v75 = 0;
    v48 = v56;
    objc_msgSend(v48, "userNameElementUniqueID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "passwordElementUniqueID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v25, "length") && !objc_msgSend(v26, "length"))
    {
LABEL_25:

      if (objc_msgSend(v47, "isEqualToString:", v60))
      {
        objc_msgSend(v51, "host");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "safari_highLevelDomainForPasswordManager");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "sharedGroupID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "saveUser:password:forProtectionSpace:highLevelDomain:groupID:", v59, v60, v51, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v52, "setSavedAccountAsDefault:forProtectionSpace:context:", v37, v51, v58);
        -[WBUFormDataController _warnAboutWeakPasswordIfNecessaryWithWebView:savedAccount:protectionSpace:](v53, "_warnAboutWeakPasswordIfNecessaryWithWebView:savedAccount:protectionSpace:", v57, v49, v51);
        a5 = 1;
      }
      else
      {
        if (v49)
        {
          v38 = 1;
        }
        else
        {
          if (HIBYTE(v75))
            v39 = v75 == 0;
          else
            v39 = 0;
          v38 = v39;
        }
        objc_msgSend(v17, "host");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v86;
        v62[0] = MEMORY[0x24BDAC760];
        v62[1] = 3221225472;
        v62[2] = __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke_3;
        v62[3] = &unk_24CB8DB68;
        v63 = v59;
        v64 = v60;
        v65 = v51;
        v66 = v49;
        v67 = v58;
        v68 = v46;
        v69 = v17;
        v70 = v47;
        v71 = v53;
        v72 = v57;
        v74 = a5;
        v73 = v55;
        LOBYTE(v43) = v41;
        -[WBUFormDataController _showPasswordPromptForWebView:formType:username:host:hasCredentialForCurrentHost:existingCredentialMatchesForCurrentHost:otherSubdomainCredentialMatches:haveExistingCredentialWithSameUsernameAndDifferentPassword:completionHandler:](v53, "_showPasswordPromptForWebView:formType:username:host:hasCredentialForCurrentHost:existingCredentialMatchesForCurrentHost:otherSubdomainCredentialMatches:haveExistingCredentialWithSameUsernameAndDifferentPassword:completionHandler:", v72, 3, v63, v40, v38, v45, v68, v43, v62);

        v37 = v63;
      }

      goto LABEL_37;
    }
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    objc_msgSend(v48, "controls");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v92, v96, 16);
    if (!v28)
      goto LABEL_24;
    v29 = *(_QWORD *)v93;
LABEL_14:
    v30 = 0;
    while (1)
    {
      if (*(_QWORD *)v93 != v29)
        objc_enumerationMutation(v27);
      v31 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v30);
      objc_msgSend(v31, "uniqueID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v32, "isEqualToString:", v25) & 1) != 0)
        break;
      if (objc_msgSend(v32, "isEqualToString:", v26))
      {
        v33 = &v75;
        goto LABEL_21;
      }
LABEL_22:

      if (v28 == ++v30)
      {
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v92, v96, 16);
        if (!v28)
        {
LABEL_24:

          goto LABEL_25;
        }
        goto LABEL_14;
      }
    }
    v33 = (__int16 *)((char *)&v75 + 1);
LABEL_21:
    *(_BYTE *)v33 = objc_msgSend(v31, "isAutoFilledTextField");
    goto LABEL_22;
  }
  a5 = 1;
LABEL_39:

  return a5;
}

void __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a2, "exactMatches", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "savedAccount");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "user");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[WBSFormDataController dontSaveMarker](WBUFormDataController, "dontSaveMarker");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

        if (v11)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

void __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "protectionSpaces");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "protectionSpacesForAdditionalSites");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v13, "containsObject:", *(_QWORD *)(a1 + 40));
  v5 = *(void **)(a1 + 48);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "setSavedAccountAsDefault:forProtectionSpace:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 72);
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v8, "host");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_highLevelDomainForPasswordManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sharedGroupID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v5, "saveUser:password:forProtectionSpace:highLevelDomain:groupID:", v6, v7, v8, v10, v11);

  }
}

void __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;

  switch(a2)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDB7490], "safari_HTMLFormProtectionSpaceForURL:", *(_QWORD *)(a1 + 80));
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "protectionSpaces");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsObject:", v5);

      if (v8)
      {
        if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *(_QWORD *)(a1 + 88)) & 1) == 0)
        {
          v9 = objc_alloc_init(MEMORY[0x24BE82DB8]);
          objc_msgSend(v9, "setSavedAccount:", *(_QWORD *)(a1 + 56));
          objc_msgSend(v9, "setPassword:", *(_QWORD *)(a1 + 40));
          objc_msgSend(v6, "changeSavedAccountWithRequest:", v9);

        }
        objc_msgSend(v6, "setSavedAccountAsDefault:forProtectionSpace:context:", *(_QWORD *)(a1 + 56), v5, *(_QWORD *)(a1 + 64));
      }
      else
      {
        v19 = *(_QWORD *)(a1 + 32);
        v20 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v5, "host");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "safari_highLevelDomainForPasswordManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "sharedGroupID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "saveUser:password:forProtectionSpace:highLevelDomain:groupID:", v19, v20, v5, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "setSavedAccountAsDefault:forProtectionSpace:context:", v24, v5, *(_QWORD *)(a1 + 64));
        if (objc_msgSend(MEMORY[0x24BE82CC8], "isPasswordManagerAppEnabledAndInstalled"))
        {
          objc_msgSend(MEMORY[0x24BE82D68], "sharedNotificationManager");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v29[0] = MEMORY[0x24BDAC760];
          v29[1] = 3221225472;
          v29[2] = __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke_5;
          v29[3] = &unk_24CB8DB40;
          v26 = v24;
          v27 = *(_QWORD *)(a1 + 96);
          v28 = *(void **)(a1 + 104);
          v30 = v26;
          v31 = v27;
          v32 = v28;
          objc_msgSend(v25, "requestStatusWithCompletionHandler:", v29);

        }
      }
      goto LABEL_12;
    case 1:
      objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(void **)(a1 + 48);
      objc_msgSend(v13, "host");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "safari_highLevelDomainForPasswordManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "sharedGroupID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "saveUser:password:forProtectionSpace:highLevelDomain:groupID:", v11, v12, v13, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      dispatch_get_global_queue(21, 0);
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke_4;
      block[3] = &unk_24CB8DAD0;
      v34 = v10;
      v35 = v17;
      v36 = *(id *)(a1 + 48);
      v37 = *(id *)(a1 + 64);
      v38 = *(id *)(a1 + 72);
      v6 = v17;
      v5 = v10;
      dispatch_async(v18, block);

LABEL_12:
      goto LABEL_13;
    case 3:
      objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDontSaveMarkerForSavedAccountsWithProtectionSpace:", *(_QWORD *)(a1 + 48));
LABEL_13:

      break;
    case 4:
      objc_msgSend(*(id *)(a1 + 96), "_completePasswordsAppIntroduction");
      break;
    default:
      break;
  }
  if (!*(_BYTE *)(a1 + 120))
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 112) + 16))(*(_QWORD *)(a1 + 112), a2, a3, a4);
}

void __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setSavedAccountAsDefault:forProtectionSpace:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 64);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 32);
        v8 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "protectionSpace", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setSavedAccountAsDefault:forProtectionSpace:context:", v8, v9, *(_QWORD *)(a1 + 56));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v3;
  _QWORD v4[5];

  if (a2 == 2)
  {
    objc_msgSend(MEMORY[0x24BE82D68], "sharedNotificationManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "schedulePasswordSavedNotificationForSavedAccount:completionHandler:", *(_QWORD *)(a1 + 32), &__block_literal_global_205);

  }
  else if (objc_msgSend(MEMORY[0x24BE6FB08], "shouldShowLoginIntroduction"))
  {
    objc_msgSend(*(id *)(a1 + 40), "showPasswordSavedPromptForSavedAccount:webView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke_7;
    v4[3] = &unk_24CB8DB18;
    v4[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDB7168], "requestToTurnOnCredentialProviderExtensionWithCompletionHandler:", v4);
  }
}

uint64_t __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completePasswordsAppIntroduction");
}

- (void)showPasswordSavedPromptForSavedAccount:(id)a3 webView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD17C8];
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "highLevelDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__WBUFormDataController_showPasswordSavedPromptForSavedAccount_webView___block_invoke;
  block[3] = &unk_24CB8DAD0;
  v19 = v6;
  v20 = v10;
  v21 = v12;
  v22 = v11;
  v23 = v5;
  v13 = v5;
  v14 = v11;
  v15 = v12;
  v16 = v10;
  v17 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __72__WBUFormDataController_showPasswordSavedPromptForSavedAccount_webView___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v9[0] = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__WBUFormDataController_showPasswordSavedPromptForSavedAccount_webView___block_invoke_2;
  v7[3] = &unk_24CB8DB90;
  v8 = *(id *)(a1 + 64);
  LOBYTE(v6) = 1;
  +[WBUFormAutoFillPrompt showAutoFillPromptInWebView:title:message:cancelButtonTitle:otherButtonTitles:cancelWhenAppEntersBackground:makeFirstButtonSuggestedAction:headerViewController:completionHandler:](WBUFormAutoFillPrompt, "showAutoFillPromptInWebView:title:message:cancelButtonTitle:otherButtonTitles:cancelWhenAppEntersBackground:makeFirstButtonSuggestedAction:headerViewController:completionHandler:", v2, v3, 0, v4, v5, 0, v6, 0, v7);

}

void __72__WBUFormDataController_showPasswordSavedPromptForSavedAccount_webView___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (a2 != -1)
  {
    v3 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(*(id *)(a1 + 32), "stableID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithData:encoding:", v4, 4);

    v6 = (void *)*MEMORY[0x24BDF74F8];
    v7 = (void *)MEMORY[0x24BE82D28];
    v10 = *MEMORY[0x24BE82F48];
    v11[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "passwordManagerURLWithDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "openURL:options:completionHandler:", v9, MEMORY[0x24BDBD1B8], 0);

  }
}

- (void)_warnAboutWeakPasswordIfNecessaryWithWebView:(id)a3 savedAccount:(id)a4 protectionSpace:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend(v8, "webui_canPromptForAccountSecurityRecommendation"))
  {
    objc_initWeak(&location, v8);
    objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke;
    v20[3] = &unk_24CB8DC30;
    v20[4] = self;
    v21 = v11;
    v13 = v11;
    objc_copyWeak(&v23, &location);
    v22 = v10;
    v14 = (void *)MEMORY[0x212BD7EA4](v20);
    dispatch_get_global_queue(17, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_2_232;
    block[3] = &unk_24CB8D6C8;
    v19 = v14;
    v18 = v9;
    v16 = v14;
    dispatch_async(v15, block);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

}

void __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "persistentIdentifiersForWarningManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(a1[4], "autoFillQuirksManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE82D60], "sharedStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_219;
      v12[3] = &unk_24CB8DC08;
      v13 = a1[5];
      v9 = v7;
      v14 = v9;
      v15 = v4;
      objc_copyWeak(&v19, a1 + 7);
      v16 = a1[4];
      v17 = a1[6];
      v18 = v6;
      objc_msgSend(v8, "getContainsPersistentIdentifier:completionHandler:", v18, v12);

      objc_destroyWeak(&v19);
    }
    else
    {
      v11 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_cold_2();
    }

  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_cold_1();
  }

}

void __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_219(uint64_t a1, char a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  int8x16_t v10;
  _QWORD v11[4];
  int8x16_t v12;
  id v13;
  id v14;
  id v15;

  if ((a2 & 1) == 0)
  {
    v3 = objc_alloc(MEMORY[0x24BE82D58]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    +[WBSHistory existingSharedHistory](WBUHistory, "existingSharedHistory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v3, "initWithSavedAccountStore:autoFillQuirksManager:userDefaults:highLevelDomainsProvider:", v4, v5, 0, v6);

    v8 = *(_QWORD *)(a1 + 48);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_2;
    v11[3] = &unk_24CB8DBE0;
    objc_copyWeak(&v15, (id *)(a1 + 80));
    v10 = *(int8x16_t *)(a1 + 48);
    v9 = (id)v10.i64[0];
    v12 = vextq_s8(v10, v10, 8uLL);
    v13 = *(id *)(a1 + 64);
    v14 = *(id *)(a1 + 72);
    objc_msgSend(v7, "getWarningForSavedAccount:completionHandler:", v8, v11);

    objc_destroyWeak(&v15);
  }
}

void __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  if (objc_msgSend(v3, "shouldShowWarningsWhenLoggingIn"))
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_3;
    v4[3] = &unk_24CB8DBB8;
    objc_copyWeak(&v9, (id *)(a1 + 64));
    v4[4] = *(_QWORD *)(a1 + 32);
    v5 = v3;
    v6 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 48);
    v8 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x24BDAC9B8], v4);

    objc_destroyWeak(&v9);
  }

}

void __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_3(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint8_t buf[16];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 9);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "_titleTextForWarning:", a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "localizedInformationTextForWarningWhenLoggingIn");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_228;
    v10[3] = &unk_24CB8DB40;
    v11 = a1[6];
    v12 = a1[7];
    v13 = a1[8];
    LOBYTE(v9) = 1;
    +[WBUFormAutoFillPrompt showAutoFillPromptInWebView:title:message:cancelButtonTitle:otherButtonTitles:cancelWhenAppEntersBackground:makeFirstButtonSuggestedAction:headerViewController:completionHandler:](WBUFormAutoFillPrompt, "showAutoFillPromptInWebView:title:message:cancelButtonTitle:otherButtonTitles:cancelWhenAppEntersBackground:makeFirstButtonSuggestedAction:headerViewController:completionHandler:", WeakRetained, v3, v4, v5, v7, 1, v9, 0, v10);

  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2112D6000, v8, OS_LOG_TYPE_INFO, "WebView disappeared before presenting weak password warning.", buf, 2u);
    }
  }

}

void __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_228(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BE82C88], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reportWeakPasswordWarningEvent:", 2);
  }
  else
  {
    v4 = (void *)MEMORY[0x24BE82D28];
    v11[0] = *MEMORY[0x24BE82F18];
    objc_msgSend(*(id *)(a1 + 32), "user");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    v11[1] = *MEMORY[0x24BE82F10];
    objc_msgSend(*(id *)(a1 + 40), "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "passwordManagerURLWithDictionary:", v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "openSensitiveURL:withOptions:", v3, 0);

    objc_msgSend(MEMORY[0x24BE82C88], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reportWeakPasswordWarningEvent:", 3);

  }
  objc_msgSend(MEMORY[0x24BE82D60], "sharedStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addPersistentIdentifier:", *(_QWORD *)(a1 + 48));

}

uint64_t __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_2_232(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_titleTextForWarning:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "localizedLongDescriptionForClient:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR(" %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_webView:(id)a3 willSubmitLoginFormWithMetadata:(id)a4 formSubmission:(BOOL)a5 fromFrame:(id)a6 inContext:(id)a7 submissionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id *v19;
  id *v20;
  id v21;
  id v22;
  void *v23;
  BOOL v24;
  uint64_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v27 = a5;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  objc_msgSend(v15, "webui_URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE6FB08], "shouldShowLoginIntroduction"))
  {
    v30 = 0;
    v31 = 0;
    LOBYTE(v26) = 1;
    v19 = (id *)&v31;
    v20 = (id *)&v30;
    -[WBUFormDataController willSubmitFormWithCredentials:shouldPreferAnnotatedCredentials:atURL:username:password:inContext:shouldShowPasswordsAppOnboarding:](self, "willSubmitFormWithCredentials:shouldPreferAnnotatedCredentials:atURL:username:password:inContext:shouldShowPasswordsAppOnboarding:", v14, 0, v18, &v31, &v30, v16, v26);
  }
  else
  {
    v28 = 0;
    v29 = 0;
    v19 = (id *)&v29;
    v20 = (id *)&v28;
    -[WBUFormDataController willSubmitFormWithCredentials:shouldPreferAnnotatedCredentials:atURL:username:password:inContext:](self, "willSubmitFormWithCredentials:shouldPreferAnnotatedCredentials:atURL:username:password:inContext:", v14, 0, v18, &v29, &v28, v16);
  }
  v21 = *v19;
  v22 = *v20;
  if (objc_msgSend(v14, "usesGeneratedPassword")
    && objc_msgSend(MEMORY[0x24BE82CC8], "isPasswordManagerAppEnabledAndInstalled"))
  {
    objc_msgSend(MEMORY[0x24BE82D68], "sharedNotificationManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "scheduleTakeATourNotificationIfNeededWithCompletionHandler:", &__block_literal_global_237);

  }
  v24 = !v21
     || !objc_msgSend(v22, "length")
     || -[WBUFormDataController _webView:saveCredentialsForURL:formSubmission:formWithMetadata:fromFrame:username:password:inContext:submissionHandler:](self, "_webView:saveCredentialsForURL:formSubmission:formWithMetadata:fromFrame:username:password:inContext:submissionHandler:", v13, v18, v27, v14, v15, v21, v22, v16, v17);

  return v24;
}

- (BOOL)webView:(id)a3 frame:(id)a4 willNavigateFromForm:(id)a5 inContext:(id)a6 bySubmitting:(BOOL)a7 processMetadataCorrections:(BOOL)a8 uniqueIDsOfControlsThatWereAutoFilled:(id)a9 submissionHandler:(id)a10
{
  _BOOL4 v10;
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  unsigned int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v40;

  v10 = a8;
  v11 = a7;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a9;
  v21 = a10;
  v22 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[WBUFormDataController webView:frame:willNavigateFromForm:inContext:bySubmitting:processMetadataCorrections:uniqueIDsOfControlsThatWereAutoFilled:submissionHandler:].cold.3();
  v23 = v10 & ~objc_msgSend(v16, "webui_privateBrowsingEnabled");
  if ((v23 & 1) == 0
    && (v24 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill(), os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)))
  {
    -[WBUFormDataController webView:frame:willNavigateFromForm:inContext:bySubmitting:processMetadataCorrections:uniqueIDsOfControlsThatWereAutoFilled:submissionHandler:].cold.2();
    if (v18)
    {
LABEL_6:
      switch(objc_msgSend(v18, "type"))
      {
        case 1:
          if (v23)
          {
            objc_msgSend(v17, "webui_URL");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "host");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBUFormDataController _processCorrectionsForFormWithDomain:formMetadata:uniqueIDsOfControlsThatWereAutoFilled:](self, "_processCorrectionsForFormWithDomain:formMetadata:uniqueIDsOfControlsThatWereAutoFilled:", v29, v18, v20);

          }
          objc_msgSend(v18, "annotations");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "safari_stringForKey:", *(_QWORD *)off_24CB8CDD8);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v31, "length"))
            v32 = -[WBUFormDataController _webView:formSubmission:willSubmitNewAccountOrChangePasswordFormWithMetadata:shouldPreferAnnotatedCredentials:fromFrame:inContext:submissionHandler:](self, "_webView:formSubmission:willSubmitNewAccountOrChangePasswordFormWithMetadata:shouldPreferAnnotatedCredentials:fromFrame:inContext:submissionHandler:", v16, v11, v18, 1, v17, v19, v21);
          else
            v32 = -[WBUFormDataController _webView:willSubmitStandardFormWithMetadata:fromFrame:submissionHandler:](self, "_webView:willSubmitStandardFormWithMetadata:fromFrame:submissionHandler:", v16, v18, v17, v21);
          goto LABEL_23;
        case 2:
          objc_msgSend(v16, "webui_formMetadataForLastPasswordGenerationOrSubmitEventInFrame:", v17);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[WBUFormDataController _shouldTryToSaveCredentialsFromLastForm:currentFormMetadata:frame:](self, "_shouldTryToSaveCredentialsFromLastForm:currentFormMetadata:frame:", v31, v18, v17))
          {
            v32 = -[WBUFormDataController _webView:formSubmission:willSubmitNewAccountOrChangePasswordFormWithMetadata:shouldPreferAnnotatedCredentials:fromFrame:inContext:submissionHandler:](self, "_webView:formSubmission:willSubmitNewAccountOrChangePasswordFormWithMetadata:shouldPreferAnnotatedCredentials:fromFrame:inContext:submissionHandler:", v16, v11, v31, 0, v17, v19, v21);
LABEL_23:
            v35 = v32;

            goto LABEL_28;
          }
          v40 = v31;
          objc_msgSend(v18, "annotations");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "safari_stringForKey:", *(_QWORD *)off_24CB8CDD8);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v37, "length"))
          {
            v35 = -[WBUFormDataController _webView:formSubmission:willSubmitNewAccountOrChangePasswordFormWithMetadata:shouldPreferAnnotatedCredentials:fromFrame:inContext:submissionHandler:](self, "_webView:formSubmission:willSubmitNewAccountOrChangePasswordFormWithMetadata:shouldPreferAnnotatedCredentials:fromFrame:inContext:submissionHandler:", v16, v11, v18, 1, v17, v19, v21);

            goto LABEL_28;
          }

          break;
        case 3:
          if (v23)
          {
            objc_msgSend(v17, "webui_URL");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "host");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBUFormDataController _processCorrectionsForFormWithDomain:formMetadata:uniqueIDsOfControlsThatWereAutoFilled:](self, "_processCorrectionsForFormWithDomain:formMetadata:uniqueIDsOfControlsThatWereAutoFilled:", v34, v18, v20);

          }
          v27 = -[WBUFormDataController _webView:willSubmitLoginFormWithMetadata:formSubmission:fromFrame:inContext:submissionHandler:](self, "_webView:willSubmitLoginFormWithMetadata:formSubmission:fromFrame:inContext:submissionHandler:", v16, v18, v11, v17, v19, v21);
          goto LABEL_19;
        case 4:
        case 5:
          if (v23)
          {
            objc_msgSend(v17, "webui_URL");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "host");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBUFormDataController _processCorrectionsForFormWithDomain:formMetadata:uniqueIDsOfControlsThatWereAutoFilled:](self, "_processCorrectionsForFormWithDomain:formMetadata:uniqueIDsOfControlsThatWereAutoFilled:", v26, v18, v20);

          }
          v27 = -[WBUFormDataController _webView:formSubmission:willSubmitNewAccountOrChangePasswordFormWithMetadata:shouldPreferAnnotatedCredentials:fromFrame:inContext:submissionHandler:](self, "_webView:formSubmission:willSubmitNewAccountOrChangePasswordFormWithMetadata:shouldPreferAnnotatedCredentials:fromFrame:inContext:submissionHandler:", v16, v11, v18, 0, v17, v19, v21);
LABEL_19:
          v35 = v27;
          goto LABEL_28;
        default:
          goto LABEL_27;
      }
      goto LABEL_27;
    }
  }
  else if (v18)
  {
    goto LABEL_6;
  }
  v38 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    -[WBUFormDataController webView:frame:willNavigateFromForm:inContext:bySubmitting:processMetadataCorrections:uniqueIDsOfControlsThatWereAutoFilled:submissionHandler:].cold.1();
LABEL_27:
  v35 = 1;
LABEL_28:

  return v35;
}

- (BOOL)_shouldTryToSaveCredentialsFromLastForm:(id)a3 currentFormMetadata:(id)a4 frame:(id)a5
{
  id v7;
  id v8;
  int v9;
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

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(a4, "containsAtLeastOneSecureTextField")
    && (unint64_t)(objc_msgSend(v7, "type") - 6) >= 0xFFFFFFFFFFFFFFFELL)
  {
    objc_msgSend(v7, "passwordElementUniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(v7, "confirmPasswordElementUniqueID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "length"))
      {
        objc_msgSend(v7, "oldPasswordElementUniqueID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "length"))
        {
          LOBYTE(v9) = 0;
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "valueOfControlWithUniqueID:inForm:", v10, v7);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "length"))
          {
            v14 = (void *)MEMORY[0x24BDB7490];
            objc_msgSend(v8, "webui_URL");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "safari_HTMLFormProtectionSpaceForURL:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDB7488], "sharedCredentialStorage");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "defaultCredentialForProtectionSpace:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v18, "hasPassword"))
            {
              objc_msgSend(v18, "password");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = objc_msgSend(v19, "isEqualToString:", v13) ^ 1;

            }
            else
            {
              LOBYTE(v9) = 0;
            }

          }
          else
          {
            LOBYTE(v9) = 0;
          }

        }
      }
      else
      {
        LOBYTE(v9) = 0;
      }

    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)_updateCredentialsWithGeneratedPasswordForForm:(id)a3 inWebView:(id)a4 frame:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  id *v16;
  id *v17;
  id *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void (**v27)(_QWORD, _QWORD);
  void *v28;
  void *v29;
  void *v30;
  char v31;
  int v32;
  int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void (*v37)(_QWORD, BOOL);
  void *v38;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56;
  WBUFormDataController *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;

  v9 = a3;
  v51 = a4;
  v10 = a5;
  v11 = a6;
  v12 = objc_msgSend(v9, "type");
  objc_msgSend(v10, "webui_URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy_;
  v67 = __Block_byref_object_dispose_;
  v68 = 0;
  v50 = v9;
  if (objc_msgSend(v9, "usesGeneratedPassword"))
  {
    v14 = objc_msgSend(MEMORY[0x24BE6FB08], "shouldShowLoginIntroduction");
    v16 = (id *)(v64 + 5);
    v15 = v64[5];
    if (v14)
    {
      v61 = 0;
      v62 = v15;
      v17 = (id *)&v61;
      v18 = (id *)&v62;
      LOBYTE(v40) = 1;
      -[WBUFormDataController willSubmitFormWithCredentials:shouldPreferAnnotatedCredentials:atURL:username:password:inContext:shouldShowPasswordsAppOnboarding:](self, "willSubmitFormWithCredentials:shouldPreferAnnotatedCredentials:atURL:username:password:inContext:shouldShowPasswordsAppOnboarding:", v50, 0, v13, &v62, &v61, v11, v40);
    }
    else
    {
      v59 = 0;
      v60 = v15;
      v17 = (id *)&v59;
      v18 = (id *)&v60;
      -[WBUFormDataController willSubmitFormWithCredentials:shouldPreferAnnotatedCredentials:atURL:username:password:inContext:](self, "willSubmitFormWithCredentials:shouldPreferAnnotatedCredentials:atURL:username:password:inContext:", v50, 0, v13, &v60, &v59, v11);
    }
    objc_storeStrong(v16, *v18);
    v19 = *v17;
  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(MEMORY[0x24BDB7490], "safari_HTMLFormProtectionSpaceForURL:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB7488], "sharedCredentialStorage");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "webui_formMetadataForLastPasswordGenerationOrSubmitEventInFrame:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v10;
  v46 = v11;
  v44 = v12;
  if (objc_msgSend(v21, "usesGeneratedPassword"))
  {
    objc_msgSend(v21, "passwordElementUniqueID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "length"))
    {
      objc_msgSend((id)objc_opt_class(), "valueOfControlWithUniqueID:inForm:", v22, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __96__WBUFormDataController__updateCredentialsWithGeneratedPasswordForForm_inWebView_frame_context___block_invoke;
  v52[3] = &unk_24CB8DCA0;
  v58 = &v63;
  v24 = v19;
  v53 = v24;
  v45 = v23;
  v54 = v45;
  v25 = v13;
  v55 = v25;
  v26 = v20;
  v56 = v26;
  v57 = self;
  v27 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BD7EA4](v52);
  if (objc_msgSend(v24, "length"))
  {
    objc_msgSend(v51, "webui_setFormMetadata:forLastPasswordGenerationOrSubmitEventInFrame:", v50, v48);
    if (!v64[5])
    {
      v64[5] = (uint64_t)&stru_24CB8DE28;

    }
    objc_msgSend(v47, "credentialsForProtectionSpace:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKey:", v64[5]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29 && objc_msgSend(v29, "hasPassword"))
    {
      v27[2](v27, 0);
      objc_msgSend(v29, "password");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEqualToString:", v24);
LABEL_31:

      goto LABEL_32;
    }
    objc_msgSend(v25, "host");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v21, "usesGeneratedPassword");
    if (v30)
      v33 = v32;
    else
      v33 = 1;
    if (v33 == 1)
    {
      v31 = 1;
      v27[2](v27, 1);
      goto LABEL_31;
    }
    -[WBUFormDataController autoFillQuirksManager](self, "autoFillQuirksManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "associatedDomainsManager");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "domainsToConsiderIdenticalToDomain:", v30);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");

    v31 = v36 == 0;
    if (v36)
    {
      v37 = (void (*)(_QWORD, BOOL))v27[2];
    }
    else
    {
      objc_msgSend(v30, "safari_stringByRemovingWwwDotPrefix");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "domainsWithAssociatedCredentialsForDomain:", v42);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v38, "count");

      v37 = (void (*)(_QWORD, BOOL))v27[2];
      if (v41)
      {
        v37(v27, 0);
        -[WBUFormDataController _saveUser:password:isGeneratedPassword:forURL:inContext:formType:promptingPolicy:webView:completionHandler:](self, "_saveUser:password:isGeneratedPassword:forURL:inContext:formType:promptingPolicy:webView:completionHandler:", v64[5], v24, objc_msgSend(v50, "usesGeneratedPassword"), v25, v46, v44, 2, v51, 0);
        goto LABEL_30;
      }
    }
    v37(v27, v36 == 0);
LABEL_30:

    goto LABEL_31;
  }
  v27[2](v27, 0);
  objc_msgSend(v51, "webui_removeFormMetadataForLastPasswordGenerationOrSubmitEventInFrame:", v48);
  v31 = 0;
LABEL_32:

  _Block_object_dispose(&v63, 8);
  return v31;
}

void __96__WBUFormDataController__updateCredentialsWithGeneratedPasswordForForm_inWebView_frame_context___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];

  +[WBUGeneratedPasswordCredentialUpdater sharedUpdater](WBUGeneratedPasswordCredentialUpdater, "sharedUpdater");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[8];
  v6 = *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40);
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v11[1] = 3221225472;
  v11[2] = __96__WBUFormDataController__updateCredentialsWithGeneratedPasswordForForm_inWebView_frame_context___block_invoke_2;
  v11[3] = &unk_24CB8DC78;
  v11[4] = v5;
  v11[0] = MEMORY[0x24BDAC760];
  objc_msgSend(v4, "updateCredentialWithNewUsername:newGeneratedPassword:lastGeneratedPassword:credentialURL:protectionSpace:shouldSaveNewCredential:completionHandler:", v6, v7, v8, v9, v10, a2, v11);

}

void __96__WBUFormDataController__updateCredentialsWithGeneratedPasswordForForm_inWebView_frame_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (objc_msgSend(MEMORY[0x24BE82CC8], "isPasswordManagerAppEnabledAndInstalled"))
  {
    if (v4)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 184), a2);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v8 = CFSTR("savedAccount");
      v9[0] = v4;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("formDataControllerDidSaveAccountWithGeneratedPassword"), v6, v7);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("formDataControllerDidSaveAccountWithGeneratedPassword"), *(_QWORD *)(a1 + 32), 0);
    }

  }
}

- (void)textDidChangeInForm:(id)a3 inWebView:(id)a4 frame:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "webui_formMetadataForLastPasswordGenerationOrSubmitEventInFrame:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "usesGeneratedPassword"))
    -[WBUFormDataController _updateCredentialsWithGeneratedPasswordForForm:inWebView:frame:context:](self, "_updateCredentialsWithGeneratedPasswordForForm:inWebView:frame:context:", v14, v10, v11, v12);

}

- (void)performWhenReady:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BDBACF8], "authorizationStatusForEntityType:", 0) == 3)
  {
    objc_msgSend((id)objc_opt_class(), "_meCard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performWhenReady:", v4);

  }
}

- (void)_processCorrectionsForFormWithDomain:(id)a3 formMetadata:(id)a4 uniqueIDsOfControlsThatWereAutoFilled:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  WBUFormDataController *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "controls");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v9, "annotations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)off_24CB8CDD0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15
      && (-[WBUFormDataController me](self, "me"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v16, "identifier"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v15, "isEqualToString:", v17),
          v17,
          v16,
          (v18 & 1) == 0))
    {
      v33 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        -[WBUFormDataController _processCorrectionsForFormWithDomain:formMetadata:uniqueIDsOfControlsThatWereAutoFilled:].cold.3();
    }
    else
    {
      v34 = v15;
      v35 = self;
      v36 = v8;
      v19 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[WBUFormDataController _processCorrectionsForFormWithDomain:formMetadata:uniqueIDsOfControlsThatWereAutoFilled:].cold.2(v13, v19);
      v20 = (void *)objc_opt_new();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v21 = v11;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v38 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            objc_msgSend(v26, "fieldName", v34);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v27, "length"))
            {
              objc_msgSend(v26, "value");
              v28 = objc_claimAutoreleasedReturnValue();
              v29 = (void *)v28;
              if (v28)
                v30 = (const __CFString *)v28;
              else
                v30 = &stru_24CB8DE28;
              objc_msgSend(v20, "setObject:forKeyedSubscript:", v30, v27);

            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v23);
      }

      v8 = v36;
      v31 = (void *)objc_msgSend(objc_alloc((Class)off_24CB8CC78), "initWithDomain:formMetadata:formValues:uniqueIDsOfControlsThatWereAutoFilled:", v36, v9, v20, v10);
      objc_msgSend(v31, "setDelegate:", v35);
      objc_msgSend(v31, "processCorrections");

      v15 = v34;
    }

  }
  else
  {
    v32 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      -[WBUFormDataController _processCorrectionsForFormWithDomain:formMetadata:uniqueIDsOfControlsThatWereAutoFilled:].cold.1();
  }

}

- (id)_autoFillCorrectionManager
{
  WBSFormAutoFillCorrectionManager *autoFillCorrectionManager;
  id v4;
  void *v5;
  WBSFormAutoFillCorrectionManager *v6;
  WBSFormAutoFillCorrectionManager *v7;

  autoFillCorrectionManager = self->_autoFillCorrectionManager;
  if (!autoFillCorrectionManager)
  {
    v4 = objc_alloc((Class)off_24CB8CC50);
    objc_msgSend(off_24CB8CC58, "standardStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (WBSFormAutoFillCorrectionManager *)objc_msgSend(v4, "initWithCorrectionsStore:", v5);
    v7 = self->_autoFillCorrectionManager;
    self->_autoFillCorrectionManager = v6;

    -[WBSFormAutoFillCorrectionManager setDelegate:](self->_autoFillCorrectionManager, "setDelegate:", self);
    autoFillCorrectionManager = self->_autoFillCorrectionManager;
  }
  return autoFillCorrectionManager;
}

- (id)formFieldClassificationCorrector:(id)a3 bestAddressBookLabelForControlValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "formMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBUFormDataController bestAddressBookLabelForFormMetadata:formControlValue:](self, "bestAddressBookLabelForFormMetadata:formControlValue:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)formFieldClassificationCorrector:(id)a3 hasAddressBookDataForAddressBookLabel:(id)a4
{
  return -[WBUFormDataController addressBookHasDataForLabel:](self, "addressBookHasDataForLabel:", a4);
}

- (id)feedbackProcessorForAutoFillCorrectionManager:(id)a3
{
  WBSFormAutoFillParsecFeedbackProcessor *autoFillFeedbackProcessor;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  WBSFormAutoFillParsecFeedbackProcessor *v10;
  WBSFormAutoFillParsecFeedbackProcessor *v11;

  autoFillFeedbackProcessor = self->_autoFillFeedbackProcessor;
  if (!autoFillFeedbackProcessor)
  {
    v5 = objc_alloc((Class)off_24CB8CC68);
    WBSSharedParsecGlobalFeedbackDispatcher();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc((Class)off_24CB8CC60);
    objc_msgSend(off_24CB8CC58, "standardStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithFeedbackAllowList:", v8);
    v10 = (WBSFormAutoFillParsecFeedbackProcessor *)objc_msgSend(v5, "initWithGlobalFeedbackDispatcher:domainPolicyProvider:autoFillVersion:", v6, v9, 2);
    v11 = self->_autoFillFeedbackProcessor;
    self->_autoFillFeedbackProcessor = v10;

    autoFillFeedbackProcessor = self->_autoFillFeedbackProcessor;
  }
  return autoFillFeedbackProcessor;
}

- (WBSCreditCardData)lastFilledCreditCardData
{
  return self->_lastFilledCreditCardData;
}

- (void)setLastFilledCreditCardData:(id)a3
{
  objc_storeStrong((id *)&self->_lastFilledCreditCardData, a3);
}

- (NSSet)previouslyFilledVirtualCardNumbers
{
  return self->_previouslyFilledVirtualCardNumbers;
}

- (void)setPreviouslyFilledVirtualCardNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_previouslyFilledVirtualCardNumbers, a3);
}

- (WBSGeneratedPassword)generatedPassword
{
  return self->_generatedPassword;
}

- (void)setGeneratedPassword:(id)a3
{
  objc_storeStrong((id *)&self->_generatedPassword, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedPassword, 0);
  objc_storeStrong((id *)&self->_previouslyFilledVirtualCardNumbers, 0);
  objc_storeStrong((id *)&self->_lastFilledCreditCardData, 0);
  objc_storeStrong((id *)&self->_accountSavedWithGeneratedPassword, 0);
  objc_storeStrong((id *)&self->_autoFillFeedbackProcessor, 0);
  objc_storeStrong((id *)&self->_autoFillCorrectionManager, 0);
}

void __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2112D6000, v0, v1, "Failed to find saved password. Skipping weak password warning.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2112D6000, v0, v1, "Failed to find persistent identifier for credential. Skipping weak password warning.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)webView:frame:willNavigateFromForm:inContext:bySubmitting:processMetadataCorrections:uniqueIDsOfControlsThatWereAutoFilled:submissionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2112D6000, v0, v1, "Not requesting AutoFill correction processing due to absence of form metadata", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)webView:frame:willNavigateFromForm:inContext:bySubmitting:processMetadataCorrections:uniqueIDsOfControlsThatWereAutoFilled:submissionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2112D6000, v0, v1, "Will not process AutoFill corrections since correction processing was not requested", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)webView:frame:willNavigateFromForm:inContext:bySubmitting:processMetadataCorrections:uniqueIDsOfControlsThatWereAutoFilled:submissionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2112D6000, v0, v1, "Form was submitted; will consider whether to process AutoFill corrections",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

- (void)_processCorrectionsForFormWithDomain:formMetadata:uniqueIDsOfControlsThatWereAutoFilled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2112D6000, v0, v1, "Not processing AutoFill corrections since no form controls were supplied", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_processCorrectionsForFormWithDomain:(uint64_t)a1 formMetadata:(NSObject *)a2 uniqueIDsOfControlsThatWereAutoFilled:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_2112D6000, a2, OS_LOG_TYPE_DEBUG, "Processing AutoFill corrections for %lu controls", (uint8_t *)&v2, 0xCu);
}

- (void)_processCorrectionsForFormWithDomain:formMetadata:uniqueIDsOfControlsThatWereAutoFilled:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2112D6000, v0, v1, "Not processing AutoFill corrections since a contact card other than the Me card was used for AutoFill", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end

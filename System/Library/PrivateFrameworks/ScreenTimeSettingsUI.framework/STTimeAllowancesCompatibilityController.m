@implementation STTimeAllowancesCompatibilityController

+ (void)showOnDemandDowntimeCompatibilityAlertIfNeededForUser:(id)a3 alertPresenter:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  void (**v31)(_QWORD);
  uint64_t *v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__5;
  v49 = __Block_byref_object_dispose__5;
  v50 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__5;
  v43 = __Block_byref_object_dispose__5;
  v44 = 0;
  objc_msgSend(v7, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __130__STTimeAllowancesCompatibilityController_showOnDemandDowntimeCompatibilityAlertIfNeededForUser_alertPresenter_completionHandler___block_invoke;
  v33[3] = &unk_24DB87DA0;
  v35 = &v55;
  v12 = v7;
  v34 = v12;
  v36 = &v51;
  v37 = &v45;
  v38 = &v39;
  objc_msgSend(v10, "performBlockAndWait:", v33);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.preferences.screentime"));
  objc_msgSend(v13, "dictionaryForKey:", CFSTR("HasShownOnDemandDowntimeCompatibilityAlertByDSID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v46[5]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if (*((_BYTE *)v52 + 24))
    v17 = v16;
  else
    v17 = 1;
  if ((v17 & 1) == 0)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (*((_BYTE *)v56 + 24))
    {
      if (v40[5])
      {
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("UpdateChildDevicesAlertTitleFormat"), &stru_24DB8A1D0, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_alloc(MEMORY[0x24BDD17C8]);
        v22 = (void *)objc_msgSend(v21, "initWithFormat:locale:", v27, v20, v40[5]);
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("OnDemandDowntimeChildCompatibilityAlertMessageFormat"), &stru_24DB8A1D0, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_alloc(MEMORY[0x24BDD17C8]);
        v25 = (void *)objc_msgSend(v24, "initWithFormat:locale:", v23, v20, v40[5]);

        v11 = MEMORY[0x24BDAC760];
LABEL_12:
        v28[0] = v11;
        v28[1] = 3221225472;
        v28[2] = __130__STTimeAllowancesCompatibilityController_showOnDemandDowntimeCompatibilityAlertIfNeededForUser_alertPresenter_completionHandler___block_invoke_2;
        v28[3] = &unk_24DB87DC8;
        v29 = v14;
        v32 = &v45;
        v30 = v13;
        v31 = v9;
        objc_msgSend(v8, "showAlertWithTitle:message:completion:", v22, v25, v28);

        goto LABEL_13;
      }
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("UpdateChildDevicesAlertTitle"), &stru_24DB8A1D0, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("OnDemandDowntimeChildCompatibilityAlertMessage"), &stru_24DB8A1D0, 0);
      v26 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("UpdateOtherDevicesAlertTitle"), &stru_24DB8A1D0, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("OnDemandDowntimeCompatibilityAlertMessage"), &stru_24DB8A1D0, 0);
      v26 = objc_claimAutoreleasedReturnValue();
    }
    v25 = (void *)v26;
    goto LABEL_12;
  }
  v9[2](v9);
LABEL_13:

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

}

void __130__STTimeAllowancesCompatibilityController_showOnDemandDowntimeCompatibilityAlertIfNeededForUser_alertPresenter_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  BOOL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "localUserDeviceState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 == 0;

  v3 = (objc_msgSend(*(id *)(a1 + 32), "syncingEnabled") & 1) != 0
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  objc_msgSend(*(id *)(a1 + 32), "dsid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "givenName");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __130__STTimeAllowancesCompatibilityController_showOnDemandDowntimeCompatibilityAlertIfNeededForUser_alertPresenter_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = (void *)objc_msgSend(v2, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v4, CFSTR("HasShownOnDemandDowntimeCompatibilityAlertByDSID"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end

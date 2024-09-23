@implementation UIAlertController(TelephonyUI)

+ (uint64_t)enableWiFiCallingAlertController
{
  return objc_msgSend(a1, "enableWiFiCallingAlertControllerWithPreferredStyle:", 1);
}

+ (id)enableWiFiCallingAlertControllerWithPreferredStyle:()TelephonyUI
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;

  if (objc_msgSend(MEMORY[0x1E0DBD1B8], "supportsWiFiCalling"))
  {
    TelephonyUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    TUStringKeyForNetwork();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_1E75FDD38, CFSTR("General"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    TelephonyUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    TUStringKeyForNetwork();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_1E75FDD38, CFSTR("General"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D20C10], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "wiFiActiveAndReachable");

    v12 = 0;
    if ((objc_msgSend(MEMORY[0x1E0DBD1B8], "isWiFiCallingEnabled") & 1) == 0 && v11)
    {
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v6, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[TPAlertAction actionWithType:](TPAlertAction, "actionWithType:", 5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAction:", v13);

      +[TPAlertAction actionWithType:](TPAlertAction, "actionWithType:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAction:", v14);

    }
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

+ (id)networkUnavailableAlertControllerWithCallProvider:()TelephonyUI dialType:senderIdentityUUID:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  int v41;
  id v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;

  v7 = a3;
  v8 = a5;
  TelephonyUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ALERT_TITLE_NETWORK_UNAVAILABLE"), &stru_1E75FDD38, CFSTR("General"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isTelephonyProvider"))
  {
    TelephonyUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ALERT_MESSAGE_TELEPHONY_NO_LOCAL_CELLULAR"), &stru_1E75FDD38, CFSTR("General"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0DBD1B8], "senderIdentityCapabilitiesWithUUID:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (a4 == 1)
        v15 = objc_msgSend(v13, "canAttemptEmergencyCallsWithoutCellularConnection");
      else
        v15 = objc_msgSend(v13, "canAttemptTelephonyCallsWithoutCellularConnection");
      v28 = v15;

      if ((v28 & 1) != 0)
        goto LABEL_12;
      goto LABEL_17;
    }
    if (a4 == 1)
    {
      if ((objc_msgSend(MEMORY[0x1E0DBD1B8], "canAttemptEmergencyCallsWithoutCellularConnection") & 1) == 0)
      {
LABEL_17:
        if (objc_msgSend(MEMORY[0x1E0DBD1B8], "supportsWiFiCalling"))
        {
          TelephonyUIBundle();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          TUStringKeyForNetwork();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "localizedStringForKey:value:table:", v38, &stru_1E75FDD38, CFSTR("General"));
          v39 = objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(MEMORY[0x1E0DBD1B8], "isWiFiCallingEnabled"))
          {
            objc_msgSend(MEMORY[0x1E0D20C10], "sharedInstance");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "networkReachable");

            if (v41)
              v32 = 0;
            else
              v32 = 8;
          }
          else
          {
            v32 = 16;
          }
          v12 = (void *)v39;
        }
        else
        {
          v32 = 0;
        }
        goto LABEL_25;
      }
    }
    else if (!objc_msgSend(MEMORY[0x1E0DBD1B8], "canAttemptTelephonyCallsWithoutCellularConnection"))
    {
      goto LABEL_17;
    }
LABEL_12:
    TelephonyUIBundle();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    TUStringKeyForNetwork();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", v30, &stru_1E75FDD38, CFSTR("General"));
    v31 = objc_claimAutoreleasedReturnValue();

    v32 = 8;
    v12 = (void *)v31;
    goto LABEL_25;
  }
  v54 = v8;
  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayAppBundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "wifiAllowedForBundleId:", v17);

  v19 = (void *)MEMORY[0x1E0CB3940];
  TelephonyUIBundle();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  TUStringKeyForNetwork();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", v21, &stru_1E75FDD38, CFSTR("General"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", v22, v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayAppBundleIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = objc_msgSend(v24, "nonWifiAvailableForBundleId:", v25);

  if ((_DWORD)v22)
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    TelephonyUIBundle();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    TUStringKeyForNetwork();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", v33, &stru_1E75FDD38, CFSTR("General"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v36;
  }
  v8 = v54;
  if (v18)
    v32 = 8;
  else
    v32 = 32;
LABEL_25:
  v42 = objc_alloc_init(MEMORY[0x1E0CFA9B8]);
  if (objc_msgSend(v42, "airplaneMode"))
  {
    LOBYTE(v32) = v32 | 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayAppBundleIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "nonWifiAvailableForBundleId:", v44);

    if ((v45 & 1) != 0)
    {
      LOBYTE(v32) = v32 | 4;
    }
    else if (!v32)
    {
      v46 = 0;
      goto LABEL_37;
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v10, v12, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v32 & 8) != 0)
  {
    +[TPAlertAction actionWithType:](TPAlertAction, "actionWithType:", 4);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addAction:", v50);

    if ((v32 & 0x10) == 0)
    {
LABEL_32:
      if ((v32 & 2) == 0)
        goto LABEL_33;
      goto LABEL_40;
    }
  }
  else if ((v32 & 0x10) == 0)
  {
    goto LABEL_32;
  }
  +[TPAlertAction actionWithType:](TPAlertAction, "actionWithType:", 5);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addAction:", v51);

  if ((v32 & 2) == 0)
  {
LABEL_33:
    if ((v32 & 4) == 0)
      goto LABEL_34;
LABEL_41:
    +[TPAlertAction actionWithType:](TPAlertAction, "actionWithType:", 3);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addAction:", v53);

    if ((v32 & 0x20) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_40:
  +[TPAlertAction actionWithType:](TPAlertAction, "actionWithType:", 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addAction:", v52);

  if ((v32 & 4) != 0)
    goto LABEL_41;
LABEL_34:
  if ((v32 & 0x20) != 0)
  {
LABEL_35:
    +[TPAlertAction actionWithType:](TPAlertAction, "actionWithType:", 6);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addAction:", v47);

  }
LABEL_36:
  +[TPAlertAction actionWithType:](TPAlertAction, "actionWithType:", 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addAction:", v48);

LABEL_37:
  return v46;
}

+ (id)telephonyAccountUnavailableAlertControllerWithSenderIdentities:()TelephonyUI preferredStyle:completion:
{
  id v7;
  void *v8;
  void *v9;
  char *__ptr32 *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
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
  id v39;
  void *v40;
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v42 = a5;
  TelephonyUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("TELEPHONY_ACCOUNT_UNAVAILABLE_ALERT_TITLE"), &stru_1E75FDD38, CFSTR("General"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = &off_1BCFE6000;
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    if (objc_msgSend(v7, "count") != 1)
    {
      v14 = 0;
      goto LABEL_14;
    }
    v27 = (void *)MEMORY[0x1E0DC3450];
    TelephonyUIBundle();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("TELEPHONY_ACCOUNT_UNAVAILABLE_ALERT_MESSAGE_SINGLE"), &stru_1E75FDD38, CFSTR("General"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "alertControllerWithTitle:message:preferredStyle:", v9, v29, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x1E0DC3448];
    TelephonyUIBundle();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("TELEPHONY_ACCOUNT_UNAVAILABLE_ALERT_ACTION_TITLE_CALL"), &stru_1E75FDD38, CFSTR("General"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __123__UIAlertController_TelephonyUI__telephonyAccountUnavailableAlertControllerWithSenderIdentities_preferredStyle_completion___block_invoke_2;
    v45[3] = &unk_1E75FD138;
    v47 = v42;
    v46 = v7;
    objc_msgSend(v30, "actionWithTitle:style:handler:", v32, 0, v45);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "addAction:", v33);
    objc_msgSend(v14, "actions");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPreferredAction:", v35);

    v25 = v47;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0DC3450];
    TelephonyUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("TELEPHONY_ACCOUNT_UNAVAILABLE_ALERT_MESSAGE"), &stru_1E75FDD38, CFSTR("General"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v9, v13, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v15 = v7;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v51 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          v21 = (void *)MEMORY[0x1E0DC3448];
          objc_msgSend(v20, "localizedName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __123__UIAlertController_TelephonyUI__telephonyAccountUnavailableAlertControllerWithSenderIdentities_preferredStyle_completion___block_invoke;
          v48[3] = &unk_1E75FD138;
          v23 = v42;
          v48[4] = v20;
          v49 = v23;
          objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 0, v48);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "addAction:", v24);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      }
      while (v17);
    }

    objc_msgSend(v14, "actions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPreferredAction:", v26);

    v10 = &off_1BCFE6000;
  }

LABEL_14:
  v36 = (void *)MEMORY[0x1E0DC3448];
  TelephonyUIBundle();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("TELEPHONY_ACCOUNT_UNAVAILABLE_ALERT_ACTION_TITLE_CANCEL"), &stru_1E75FDD38, CFSTR("General"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = *((_QWORD *)v10 + 441);
  v43[2] = __123__UIAlertController_TelephonyUI__telephonyAccountUnavailableAlertControllerWithSenderIdentities_preferredStyle_completion___block_invoke_3;
  v43[3] = &unk_1E75FD160;
  v44 = v42;
  v39 = v42;
  objc_msgSend(v36, "actionWithTitle:style:handler:", v38, 1, v43);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addAction:", v40);
  return v14;
}

+ (id)callEndStewieControllerWithDialRequest:()TelephonyUI dialAction:title:buttonTitle:
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v8 = a4;
  v9 = (void *)MEMORY[0x1E0DC3450];
  v10 = a6;
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", a5, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3448];
  TelephonyUIBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E75FDD38, CFSTR("General"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 1, &__block_literal_global_0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v15);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __102__UIAlertController_TelephonyUI__callEndStewieControllerWithDialRequest_dialAction_title_buttonTitle___block_invoke_2;
  v19[3] = &unk_1E75FD160;
  v20 = v8;
  v16 = v8;
  +[TPAlertAction actionWithTitle:style:handler:](TPAlertAction, "actionWithTitle:style:handler:", v10, 0, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v17);
  return v11;
}

@end

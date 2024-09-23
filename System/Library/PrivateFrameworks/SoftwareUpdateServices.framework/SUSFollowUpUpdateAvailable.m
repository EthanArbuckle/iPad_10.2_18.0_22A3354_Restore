@implementation SUSFollowUpUpdateAvailable

+ (id)identifier
{
  return (id)SUSFollowUpUniqueIdentifierUpdateAvailable;
}

+ (id)titleWithDescriptor:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  const __CFString *v18;

  v3 = a3;
  if (objc_msgSend(v3, "upgradeType") == 2)
  {
    objc_msgSend(v3, "humanReadableUpdateName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("AUTO_SU_FOLLOW_UP_TEXT_SU_AVAILABLE_MAJOR"), &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v14, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      SULogError(CFSTR("[SUSFollowUpUpdateAvailable] Anomaly, updateName = %@, update = %@"), v4, v5, v6, v7, v8, v9, v10, 0);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("AUTO_SU_FOLLOW_UP_TEXT_SU_AVAILABLE_MINOR"), &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v16 = objc_msgSend(v3, "isSplatOnly");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v17;
    if ((v16 & 1) != 0)
      v18 = CFSTR("AUTO_SU_FOLLOW_UP_TEXT_RSR_AVAILABLE_MINOR");
    else
      v18 = CFSTR("AUTO_SU_FOLLOW_UP_TEXT_SU_AVAILABLE_MINOR");
    objc_msgSend(v17, "localizedStringForKey:value:table:", v18, &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

+ (id)informativeTextWithDescriptor:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  char v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;

  v3 = a3;
  objc_msgSend(v3, "humanReadableUpdateName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    v13 = objc_msgSend(v3, "isSplatOnly");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((v13 & 1) != 0)
      v16 = CFSTR("AUTO_SU_FOLLOW_UP_TEXT_RSR_AVAILABLE_BODY");
    else
      v16 = CFSTR("AUTO_SU_FOLLOW_UP_TEXT_SU_AVAILABLE_BODY");
    objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v20, v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    SULogError(CFSTR("[SUSFollowUpUpdateAvailable] Anomaly, updateName = %@, update = %@"), v4, v5, v6, v7, v8, v9, v10, 0);
    v17 = objc_msgSend(v3, "isSplatOnly");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18;
    if ((v17 & 1) != 0)
      v19 = CFSTR("AUTO_SU_FOLLOW_UP_TEXT_RSR_AVAILABLE_BODY_FALLBCAK");
    else
      v19 = CFSTR("AUTO_SU_FOLLOW_UP_TEXT_SU_AVAILABLE_BODY_FALLBACK");
    objc_msgSend(v18, "localizedStringForKey:value:table:", v19, &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

+ (unint64_t)displayStyle
{
  return 2;
}

+ (id)actions
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BE1B3A0]);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=General&path=SOFTWARE_UPDATE_LINK"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setUrl:", v3);

    objc_msgSend(v2, "setIdentifier:", CFSTR("com.followup.go_to_update_pane"));
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DETAILS"), &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setLabel:", v7);

    v10[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)notificationWithDescriptor:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE1B3B8]);
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "notificationTitleWithDescriptor:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v5);

    objc_msgSend((id)objc_opt_class(), "notificationInformativeTextWithDescriptor:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInformativeText:", v6);

    objc_msgSend((id)objc_opt_class(), "notificationDetails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActivateAction:", v7);

    objc_msgSend((id)objc_opt_class(), "notificationClear");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClearAction:", v8);

    objc_msgSend((id)objc_opt_class(), "notificationFrequency");
    objc_msgSend(v4, "setFrequency:");
    objc_msgSend((id)objc_opt_class(), "notificationOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOptions:", v9);

  }
  return v4;
}

+ (id)notificationDetails
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x24BE1B3A0]);
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "setIdentifier:", CFSTR("com.followup.go_to_update_pane"));
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DETAILS"), &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLabel:", v7);

  }
  return v3;
}

+ (id)notificationClear
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x24BE1B3A0]);
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "setIdentifier:", CFSTR("com.followup.go_to_update_pane"));
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DISMISS"), &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLabel:", v7);

  }
  return v3;
}

+ (double)notificationFrequency
{
  return 0.0;
}

+ (id)notificationOptions
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1B3B8], "defaultOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BE1B328];
  v7[0] = *MEMORY[0x24BE1B320];
  v7[1] = v3;
  v7[2] = *MEMORY[0x24BE1B340];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end

@implementation SUSFollowUpInsufficientDiskSpace

+ (id)identifier
{
  return (id)SUSFollowUpUniqueIdentifierInsufficientDiskSpace;
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
      SULogError(CFSTR("[SUSFollowUpInsufficientDiskSpace] Anomaly, updateName = %@, update = %@"), v4, v5, v6, v7, v8, v9, v10, 0);
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
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = objc_msgSend(a3, "isSplatOnly");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("AUTO_SU_FOLLOW_UP_INSUFFICIENT_DISK_SPACE_CELL_RSR_BODY");
  else
    v6 = CFSTR("AUTO_SU_FOLLOW_UP_INSUFFICIENT_DISK_SPACE_CELL_UPDATE_BODY");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (unint64_t)displayStyle
{
  return 2;
}

+ (id)_goToSUPaneAction
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x24BE1B3A0]);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=General&path=SOFTWARE_UPDATE_LINK"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUrl:", v3);

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DETAILS"), &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLabel:", v7);

  return v2;
}

+ (id)actions
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_goToSUPaneAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)notificationWithDescriptor:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

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

    objc_msgSend((id)objc_opt_class(), "_goToSUPaneAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActivateAction:", v7);

    objc_msgSend((id)objc_opt_class(), "notificationFrequency");
    objc_msgSend(v4, "setFrequency:");
    objc_msgSend((id)objc_opt_class(), "notificationOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOptions:", v8);

  }
  return v4;
}

+ (id)notificationTitleWithDescriptor:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_msgSend(a3, "isSplatOnly");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("AUTO_SU_FOLLOW_UP_INSUFFICIENT_DISK_SPACE_RSR_TITLE");
  else
    v7 = CFSTR("AUTO_SU_FOLLOW_UP_INSUFFICIENT_DISK_SPACE_UPDATE_TITLE");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)notificationInformativeTextWithDescriptor:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_msgSend(a3, "isSplatOnly");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("AUTO_SU_FOLLOW_UP_INSUFFICIENT_DISK_SPACE_RSR_BODY");
  else
    v7 = CFSTR("AUTO_SU_FOLLOW_UP_INSUFFICIENT_DISK_SPACE_UPDATE_BODY");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (double)notificationFrequency
{
  return 0.0;
}

+ (id)notificationOptions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1B3B8], "defaultOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BE1B340];
  v8[0] = *MEMORY[0x24BE1B348];
  v8[1] = v3;
  v4 = *MEMORY[0x24BE1B320];
  v8[2] = *MEMORY[0x24BE1B350];
  v8[3] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end

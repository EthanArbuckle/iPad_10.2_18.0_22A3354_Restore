@implementation SUSettingsStatefulUIAdditions

+ (id)currentOSVersion
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;
  id v22;
  id v23;
  id v24;
  id v25[3];

  v25[2] = a1;
  v25[1] = (id)a2;
  v25[0] = 0;
  v24 = 0;
  v20 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v21 = objc_msgSend(v20, "sf_isiPad");

  if ((v21 & 1) != 0)
  {
    v19 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v2 = (id)objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("iPadOS_VERSION"), &stru_24E0011F0, CFSTR("Software Update"));
    v3 = v24;
    v24 = v2;

  }
  else
  {
    v18 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("iOS_VERSION"), &stru_24E0011F0, CFSTR("Software Update"));
    v5 = v24;
    v24 = v4;

  }
  v23 = +[SUSettingsStatefulUIAdditions productVersionWithExtra](SUSettingsStatefulUIAdditions, "productVersionWithExtra");
  if (!v23)
  {
    v17 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v23 = (id)objc_msgSend(v17, "systemVersion");

  }
  v6 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v24, CFSTR("%@"), 0, v23);
  v7 = v25[0];
  v25[0] = v6;

  v15 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v16 = objc_msgSend(v15, "sf_isInternalInstall");

  if ((v16 & 1) != 0)
  {
    v22 = +[SUSettingsStatefulUIAdditions buildVersionIncludingRSR](SUSettingsStatefulUIAdditions, "buildVersionIncludingRSR");
    v12 = (void *)MEMORY[0x24BDD17C8];
    v14 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (id)objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("%@ (%@)"), &stru_24E0011F0, CFSTR("Software Update"));
    v8 = (id)objc_msgSend(v12, "stringWithFormat:", v25[0], v22);
    v9 = v25[0];
    v25[0] = v8;

    objc_storeStrong(&v22, 0);
  }
  v11 = v25[0];
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(v25, 0);
  return v11;
}

+ (double)estimatedTimeRemainingForProgress:(id)a3 valid:(BOOL *)a4
{
  double v4;
  double v7;
  id location[3];
  double v9;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = -1.0;
  if (a4)
    *a4 = 0;
  if (!location[0])
    goto LABEL_13;
  objc_msgSend(location[0], "timeRemaining");
  v7 = v4;
  if (v4 < 0.0)
    goto LABEL_13;
  if (v4 > 0.0 && v4 < 1.0)
    v7 = 1.0;
  if (v7 < (double)0x93A80uLL && v7 > 0.0)
  {
    if (a4)
      *a4 = 1;
    v9 = v7;
  }
  else
  {
LABEL_13:
    v9 = v7;
  }
  objc_storeStrong(location, 0);
  return v9;
}

+ (id)stringWithTimeRemainingForDownload:(id)a3
{
  float v3;
  id v4;
  id v5;
  double v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;
  id v13;
  BOOL v14;
  id v15;
  double v16;
  char v17;
  char v18;
  id v19;
  char v20;
  id v21;
  char v22;
  id v23;
  char v24;
  id v25;
  id v26;
  int v27;
  char v28;
  id v29;
  char v30;
  id v31;
  char v32;
  id v33;
  char v34;
  id v35;
  char v36;
  id v37;
  id v38;
  id location[3];
  id v40;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v38 = (id)objc_msgSend(location[0], "progress");
  v36 = 0;
  v14 = 0;
  if (v38)
  {
    v37 = (id)objc_msgSend(v38, "phase");
    v36 = 1;
    v14 = 0;
    if ((objc_msgSend(v37, "isEqualToString:", *MEMORY[0x24BEAEE98]) & 1) != 0)
    {
      objc_msgSend(v38, "percentComplete");
      v14 = v3 >= 1.0;
    }
  }
  if ((v36 & 1) != 0)

  if (v14)
  {
    v13 = (id)objc_msgSend(location[0], "descriptor");
    v34 = 0;
    v32 = 0;
    v30 = 0;
    v28 = 0;
    if ((objc_msgSend(v13, "isSplatOnly") & 1) != 0)
    {
      v35 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v34 = 1;
      v33 = (id)objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("PREPARING_RSR"), &stru_24E0011F0, CFSTR("Software Update"));
      v32 = 1;
      v4 = v33;
    }
    else
    {
      v31 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v30 = 1;
      v29 = (id)objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("PREPARING_UPDATE"), &stru_24E0011F0, CFSTR("Software Update"));
      v28 = 1;
      v4 = v29;
    }
    v40 = v4;
    if ((v28 & 1) != 0)

    if ((v30 & 1) != 0)
    if ((v32 & 1) != 0)

    if ((v34 & 1) != 0)
    v27 = 1;
  }
  else
  {
    v12 = (id)objc_msgSend(location[0], "descriptor");
    v24 = 0;
    v22 = 0;
    v20 = 0;
    v18 = 0;
    if ((objc_msgSend(v12, "isSplatOnly") & 1) != 0)
    {
      v25 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v24 = 1;
      v23 = (id)objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("RSR_REQUESTED"), &stru_24E0011F0, CFSTR("Software Update"));
      v22 = 1;
      v5 = v23;
    }
    else
    {
      v21 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v20 = 1;
      v19 = (id)objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("UPDATE_REQUESTED"), &stru_24E0011F0, CFSTR("Software Update"));
      v18 = 1;
      v5 = v19;
    }
    v26 = v5;
    if ((v18 & 1) != 0)

    if ((v20 & 1) != 0)
    if ((v22 & 1) != 0)

    if ((v24 & 1) != 0)
    v17 = 0;
    +[SUSettingsStatefulUIAdditions estimatedTimeRemainingForProgress:valid:](SUSettingsStatefulUIAdditions, "estimatedTimeRemainingForProgress:valid:", v38, &v17);
    v16 = v6;
    if ((v17 & 1) != 0)
    {
      v15 = 0;
      v7 = objc_alloc_init(MEMORY[0x24BDD14F8]);
      v8 = v15;
      v15 = v7;

      objc_msgSend(v15, "setUnitsStyle:", 3);
      objc_msgSend(v15, "setAllowedUnits:", 240);
      objc_msgSend(v15, "setMaximumUnitCount:", 1);
      objc_msgSend(v15, "setIncludesApproximationPhrase:", 1);
      objc_msgSend(v15, "setIncludesTimeRemainingPhrase:", 1);
      objc_msgSend(v15, "setFormattingContext:", 2);
      v9 = (id)objc_msgSend(v15, "stringFromTimeInterval:", v16);
      v10 = v26;
      v26 = v9;

      objc_storeStrong(&v15, 0);
    }
    v40 = v26;
    v27 = 1;
    objc_storeStrong(&v26, 0);
  }
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
  return v40;
}

+ (id)productVersionWithExtra
{
  id v2;
  id v3;
  id v5;
  id location;
  id v7[3];

  v7[2] = a1;
  v7[1] = (id)a2;
  v7[0] = 0;
  location = (id)_CFCopySupplementalVersionDictionary();
  if (location)
  {
    v2 = (id)objc_msgSend(location, "objectForKeyedSubscript:", *MEMORY[0x24BDBD208]);
    v3 = v7[0];
    v7[0] = v2;

  }
  v5 = v7[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v7, 0);
  return v5;
}

+ (id)buildVersionIncludingRSR
{
  id v2;
  id v3;
  id v5;
  id location;
  id v7[3];

  v7[2] = a1;
  v7[1] = (id)a2;
  v7[0] = 0;
  location = (id)_CFCopySupplementalVersionDictionary();
  if (location)
  {
    v2 = (id)objc_msgSend(location, "objectForKeyedSubscript:", *MEMORY[0x24BDBD1F0]);
    v3 = v7[0];
    v7[0] = v2;

  }
  v5 = v7[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v7, 0);
  return v5;
}

@end

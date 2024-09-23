@implementation ACAccount

- (id)fmipAccountInfoWithTokens:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  id v38;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = off_1003052F0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount username](self, "username"));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v6, v7);

  v8 = off_1003052F8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount aa_personID](self, "aa_personID"));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v8, v9);

  v10 = off_100305300;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount aa_altDSID](self, "aa_altDSID"));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v10, v11);

  if (v3)
  {
    v12 = off_100305308;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount aa_fmipToken](self, "aa_fmipToken"));
    objc_msgSend(v5, "fm_safelyMapKey:toObject:", v12, v13);

    v14 = off_100305310;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount aa_authToken](self, "aa_authToken"));
    objc_msgSend(v5, "fm_safelyMapKey:toObject:", v14, v15);

  }
  v16 = off_100305318;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount identifier](self, "identifier"));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v16, v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount dataclassProperties](self, "dataclassProperties"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("com.apple.Dataclass.DeviceLocator")));

  v20 = off_100305320;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("hostname")));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v20, v21);

  objc_msgSend(v5, "fm_safelyMapKey:toObject:", off_100305328, CFSTR("https"));
  v22 = off_100305330;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("apsEnv")));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v22, v23);

  v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", CFSTR("configURL"), kFMDNotBackedUpPrefDomain));
  if (v24)
  {
    v25 = off_100305338;
    v26 = v5;
    v27 = v24;
LABEL_5:
    objc_msgSend(v26, "fm_safelyMapKey:toObject:", v25, v27);
    goto LABEL_8;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("configURL")));

  v29 = off_100305338;
  if (!v28)
  {
    v27 = CFSTR("https://gateway.icloud.com/fmadminws/findkit");
    v26 = v5;
    v25 = off_100305338;
    goto LABEL_5;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("configURL")));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v29, v30);

LABEL_8:
  v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", CFSTR("pairingURL"), kFMDNotBackedUpPrefDomain));
  if (v31)
  {
    v32 = off_100305340;
    v33 = v5;
    v34 = v31;
  }
  else
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("pairingURL")));

    v36 = off_100305340;
    if (v35)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("pairingURL")));
      objc_msgSend(v5, "fm_safelyMapKey:toObject:", v36, v37);

      goto LABEL_13;
    }
    v34 = CFSTR("https://gateway.icloud.com/fmadminws");
    v33 = v5;
    v32 = off_100305340;
  }
  objc_msgSend(v33, "fm_safelyMapKey:toObject:", v32, v34);
LABEL_13:
  v38 = objc_msgSend(v5, "copy");

  return v38;
}

- (id)fmipAccountInfoForProactiveChanges
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount fmipAccountInfoWithTokens:](self, "fmipAccountInfoWithTokens:", 0));
  v3 = objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeObjectForKey:", off_100305318);
  v4 = objc_msgSend(v3, "copy");

  return v4;
}

- (id)fmwAccountInfoWithTokens:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  id v20;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = off_1003052F0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount username](self, "username"));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v6, v7);

  v8 = off_1003052F8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount aa_personID](self, "aa_personID"));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v8, v9);

  v10 = off_100305300;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount aa_altDSID](self, "aa_altDSID"));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v10, v11);

  if (v3)
  {
    v12 = off_100305308;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount aa_fmipToken](self, "aa_fmipToken"));
    objc_msgSend(v5, "fm_safelyMapKey:toObject:", v12, v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount dataclassProperties](self, "dataclassProperties"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("com.apple.Dataclass.DeviceLocator")));

  v16 = off_100305320;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("hostname")));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v16, v17);

  objc_msgSend(v5, "fm_safelyMapKey:toObject:", off_100305328, CFSTR("https"));
  v18 = off_100305330;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("apsEnv")));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v18, v19);

  v20 = objc_msgSend(v5, "copy");
  return v20;
}

- (id)fmwAccountInfoForProactiveChanges
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount fmipAccountInfoWithTokens:](self, "fmipAccountInfoWithTokens:", 0));
  v3 = objc_msgSend(v2, "mutableCopy");

  v4 = objc_msgSend(v3, "copy");
  return v4;
}

@end

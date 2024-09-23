@implementation ACAccount

- (id)fmfAccountInfoWithTokens:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v22;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount username](self, "username"));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("username"), v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount aa_personID](self, "aa_personID"));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("dsid"), v7);

  if (v3)
  {
    v8 = objc_alloc_init((Class)ACAccountStore);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount aa_fmfAccount](self, "aa_fmfAccount"));
    v22 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "credentialForAccount:error:", v9, &v22));
    v11 = v22;

    if (!v10)
    {
      v12 = sub_10001C4E8();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_100035704((uint64_t)v11, v13);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "credentialItemForKey:", ACFindMyFriendsAppTokenKey));
    objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("appToken"), v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "credentialItemForKey:", ACFindMyFriendsTokenKey));
    objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("internalToken"), v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount propertiesForDataclass:](self, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.ShareLocation")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("appHostname")));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("appHostname"), v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("hostname")));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("hostname"), v18);

  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("scheme"), CFSTR("https"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("apsEnv")));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("apsEnv"), v19);

  v20 = objc_msgSend(v5, "copy");
  return v20;
}

- (id)fmfAccountInfoForProactiveChanges
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount fmfAccountInfoWithTokens:](self, "fmfAccountInfoWithTokens:", 0));
  v3 = objc_msgSend(v2, "mutableCopy");

  v4 = objc_msgSend(v3, "copy");
  return v4;
}

@end

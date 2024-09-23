@implementation SDAirDropHandlerCredentialLinks

- (BOOL)canHandleTransfer
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (!-[SDAirDropHandler isJustLinks](self, "isJustLinks"))
    return 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "completedURLs"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), 0));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scheme"));
        v11 = objc_msgSend(v10, "isEqual:", CFSTR("EncryptedCredential"));

        if (!v11)
        {
          v12 = 0;
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_13:

  return v12;
}

- (void)handleAction
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  SFSharablePassword *credential;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint8_t v13[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerCredentialLinks credential](self, "credential"));
  v4 = v3;
  if (!v3)
  {
    v10 = airdrop_log(0);
    v5 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100105274();
    goto LABEL_11;
  }
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "passwordManagerURL"));
  v6 = airdrop_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1001052A0();

LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Opening password manager url", v13, 2u);
  }

  -[objc_class openPasswordManagerURL:](off_1007B1F78(), "openPasswordManagerURL:", v5);
  v9 = 1;
LABEL_12:

  credential = self->_credential;
  self->_credential = 0;

  v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SDAirDropHandler completionHandler](self, "completionHandler"));
  v12[2](v12, v9, 0, 1);

}

+ (void)openPasswordManagerURL:(id)a3
{
  Class (__cdecl *v3)();
  id v4;

  v3 = off_1007B1F78;
  v4 = a3;
  -[objc_class openPasswordManagerURL:](v3(), "openPasswordManagerURL:", v4);

}

- (id)suitableContentsDescription
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerCredentialLinks credential](self, "credential"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
  if ((objc_opt_respondsToSelector(v5, "passkeyCredential") & 1) == 0)
  {
    if (v6 && v4 == 1)
      goto LABEL_8;
    goto LABEL_12;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "passkeyCredential"));

  if (!v6 || v4 != 1)
  {
    if (v7)
    {
      v30 = CFSTR("PASSKEY");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
      v31 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
      v32 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", v17));

      v18 = SFLocalizedStringForKeyInStringsFileNamed(v8, CFSTR("Localizable-AirDropPasskeys"));
      v19 = objc_claimAutoreleasedReturnValue(v18);
LABEL_13:
      v25 = (void *)v19;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, v3, v4));

      goto LABEL_14;
    }
LABEL_12:
    v27 = CFSTR("CREDENTIAL");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
    v28 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    v29 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", v22));

    v24 = SFLocalizedStringForKey(v8, v23);
    v19 = objc_claimAutoreleasedReturnValue(v24);
    goto LABEL_13;
  }
  if (!v7)
  {
LABEL_8:
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", &off_10074FBE0));
    v12 = SFLocalizedStringForKey(v8, v11);
    v10 = objc_claimAutoreleasedReturnValue(v12);
    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", &off_10074FBC8));
  v9 = SFLocalizedStringForKeyInStringsFileNamed(v8, CFSTR("Localizable-AirDropPasskeys"));
  v10 = objc_claimAutoreleasedReturnValue(v9);
LABEL_9:
  v13 = (void *)v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v3, v6));

LABEL_14:
  return v14;
}

- (int64_t)transferTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerCredentialLinks;
  return (unint64_t)-[SDAirDropHandler transferTypes](&v3, "transferTypes") | 0x40000;
}

- (void)updatePossibleActions
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;
  objc_super v21;
  id v22;

  v21.receiver = self;
  v21.super_class = (Class)SDAirDropHandlerCredentialLinks;
  -[SDAirDropHandler updatePossibleActions](&v21, "updatePossibleActions");
  v3 = objc_alloc((Class)SFAirDropAction);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v7 = (objc_class *)objc_opt_class(self, v6);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
  v12 = objc_msgSend(v3, "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:", v5, v9, v10, v11, 1);

  location = 0;
  objc_initWeak(&location, self);
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_100104FBC;
  v18 = &unk_100714348;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v12, "setActionHandler:", &v15);
  v22 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1, v15, v16, v17, v18));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  objc_msgSend(v14, "setPossibleActions:", v13);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (id)credential
{
  SFSharablePassword **p_credential;
  SFSharablePassword *credential;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  SFSharablePassword *v24;
  uint8_t v25[16];

  p_credential = &self->_credential;
  credential = self->_credential;
  if (credential)
    return credential;
  v6 = airdrop_log(self);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Grabbing credential from AirDrop handler...", v25, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](SDAppleIDAgent, "sharedAgent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "myAccount"));

  if (!v9)
  {
    v11 = airdrop_log(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100105324();

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identity"));
  if (!v13)
  {
    v14 = airdrop_log(0);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1001052F8();

  }
  v16 = objc_msgSend(v13, "copyPrivateKey");
  if (!v16)
  {
    v17 = airdrop_log(0);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1001052CC();

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "completedURLs"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));
  v22 = SFSharablePasswordForEncryptedAirDropURL(v21, v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  if (v16)
    CFRelease(v16);
  if (v23)
    objc_storeStrong((id *)p_credential, v23);
  v24 = *p_credential;

  return v24;
}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
}

@end

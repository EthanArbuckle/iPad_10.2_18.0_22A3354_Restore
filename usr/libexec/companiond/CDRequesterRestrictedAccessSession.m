@implementation CDRequesterRestrictedAccessSession

- (void)_configureRapportClient:(id)a3
{
  id v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000035F8;
  v6[3] = &unk_100030778;
  v6[4] = self;
  objc_msgSend(v4, "cad_registerRequestID:options:requireOwnerDevice:handler:", CFSTR("com.apple.CompanionAuthentication.GetAuthInfo"), 0, -[CDRequesterRestrictedAccessSession _requireOwnerDevice](self, "_requireOwnerDevice"), v6);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000038F4;
  v5[3] = &unk_100030778;
  v5[4] = self;
  objc_msgSend(v4, "cad_registerRequestID:options:requireOwnerDevice:handler:", CFSTR("com.apple.CompanionAuthentication.DidFinishAuth"), 0, -[CDRequesterRestrictedAccessSession _requireOwnerDevice](self, "_requireOwnerDevice"), v5);

}

- (void)_notifyDeviceAcceptedNotification:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDRequesterRestrictedAccessSession;
  -[CDRequesterSession _notifyDeviceAcceptedNotification:](&v3, "_notifyDeviceAcceptedNotification:", a3);
}

- (void)_notifyDeviceStartedAuthentication:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDRequesterRestrictedAccessSession;
  -[CDRequesterSession _notifyDeviceStartedAuthentication:](&v3, "_notifyDeviceStartedAuthentication:", a3);
}

- (void)_invalidated
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CDRequesterRestrictedAccessSession;
  -[CDRequesterSession _invalidated](&v2, "_invalidated");
}

- (BOOL)_requireOwnerDevice
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "approversAppleAccountAltDSIDs"));
  v4 = v3 == 0;

  return v4;
}

- (id)_idsMessageRecipientUsernames
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "approversAppleAccountAltDSIDs"));

  if (v4)
  {
    v5 = objc_alloc_init((Class)NSMutableArray);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "approversAppleAccountAltDSIDs"));

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "aa_appleAccountWithAltDSID:", v12));

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "username"));
          if (v15)
            objc_msgSend(v5, "addObject:", v15);

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end

@implementation CDRequesterSystemAuthenticationSession

- (void)_prepareForActivationWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)_configureRapportClient:(id)a3
{
  id v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000123DC;
  v6[3] = &unk_100030778;
  v6[4] = self;
  objc_msgSend(v4, "cad_registerRequestID:options:requireOwnerDevice:handler:", CFSTR("com.apple.CompanionAuthentication.GetAuthInfo"), 0, -[CDRequesterSystemAuthenticationSession _requireOwnerDevice](self, "_requireOwnerDevice"), v6);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000126AC;
  v5[3] = &unk_100030778;
  v5[4] = self;
  objc_msgSend(v4, "cad_registerRequestID:options:requireOwnerDevice:handler:", CFSTR("com.apple.CompanionAuthentication.DidFinishAuth"), 0, -[CDRequesterSystemAuthenticationSession _requireOwnerDevice](self, "_requireOwnerDevice"), v5);

}

- (void)_notifyDeviceAcceptedNotification:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDRequesterSystemAuthenticationSession;
  -[CDRequesterSession _notifyDeviceAcceptedNotification:](&v3, "_notifyDeviceAcceptedNotification:", a3);
}

- (void)_notifyDeviceStartedAuthentication:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDRequesterSystemAuthenticationSession;
  -[CDRequesterSession _notifyDeviceStartedAuthentication:](&v3, "_notifyDeviceStartedAuthentication:", a3);
}

- (void)_invalidated
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CDRequesterSystemAuthenticationSession;
  -[CDRequesterSession _invalidated](&v2, "_invalidated");
}

- (BOOL)_requireOwnerDevice
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appleAccountAltDSID"));
  v4 = v3 == 0;

  return v4;
}

- (id)_idsMessageRecipientUsernames
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appleAccountAltDSID"));

  if (v3)
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_appleAccountWithAltDSID:", v4));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "username"));
    v10 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)_authFlags
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v3 = objc_msgSend(v2, "options");

  return (unint64_t)v3;
}

@end

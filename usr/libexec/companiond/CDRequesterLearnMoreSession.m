@implementation CDRequesterLearnMoreSession

- (void)_prepareForActivationWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));

  if (v5)
  {
    v8[2](v8, 0);
  }
  else
  {
    v6 = CPSErrorMake(205, CFSTR("Missing URL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    ((void (**)(id, void *))v8)[2](v8, v7);

  }
}

- (void)_configureRapportClient:(id)a3
{
  id v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100003030;
  v6[3] = &unk_100030778;
  v6[4] = self;
  v4 = a3;
  objc_msgSend(v4, "registerRequestID:options:handler:", CFSTR("com.apple.CompanionAuthentication.GetAuthInfo"), 0, v6);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000325C;
  v5[3] = &unk_100030778;
  v5[4] = self;
  objc_msgSend(v4, "cad_registerRequestID:options:requireOwnerDevice:handler:", CFSTR("com.apple.CompanionAuthentication.DidFinishAuth"), 0, -[CDRequesterLearnMoreSession _requireOwnerDevice](self, "_requireOwnerDevice"), v5);

}

- (BOOL)_requireOwnerDevice
{
  return 0;
}

- (void)_notifyDeviceAcceptedNotification:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDRequesterLearnMoreSession;
  -[CDRequesterSession _notifyDeviceAcceptedNotification:](&v3, "_notifyDeviceAcceptedNotification:", a3);
}

- (void)_notifyDeviceStartedAuthentication:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDRequesterLearnMoreSession;
  -[CDRequesterSession _notifyDeviceStartedAuthentication:](&v3, "_notifyDeviceStartedAuthentication:", a3);
}

- (void)_invalidated
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CDRequesterLearnMoreSession;
  -[CDRequesterSession _invalidated](&v2, "_invalidated");
}

- (id)_idsMessageRecipientUsernames
{
  return 0;
}

@end

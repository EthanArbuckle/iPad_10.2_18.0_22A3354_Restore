@implementation CDRequesterSharingSession

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
  v6[2] = sub_100004130;
  v6[3] = &unk_100030778;
  v6[4] = self;
  objc_msgSend(v4, "cad_registerRequestID:options:requireOwnerDevice:handler:", CFSTR("com.apple.CompanionAuthentication.GetAuthInfo"), 0, -[CDRequesterSharingSession _requireOwnerDevice](self, "_requireOwnerDevice"), v6);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000435C;
  v5[3] = &unk_100030778;
  v5[4] = self;
  objc_msgSend(v4, "cad_registerRequestID:options:requireOwnerDevice:handler:", CFSTR("com.apple.CompanionAuthentication.DidFinishAuth"), 0, -[CDRequesterSharingSession _requireOwnerDevice](self, "_requireOwnerDevice"), v5);

}

- (void)_notifyDeviceAcceptedNotification:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDRequesterSharingSession;
  -[CDRequesterSession _notifyDeviceAcceptedNotification:](&v3, "_notifyDeviceAcceptedNotification:", a3);
}

- (void)_notifyDeviceStartedAuthentication:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDRequesterSharingSession;
  -[CDRequesterSession _notifyDeviceStartedAuthentication:](&v3, "_notifyDeviceStartedAuthentication:", a3);
}

- (void)_invalidated
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CDRequesterSharingSession;
  -[CDRequesterSession _invalidated](&v2, "_invalidated");
}

- (BOOL)_requireOwnerDevice
{
  return 1;
}

@end

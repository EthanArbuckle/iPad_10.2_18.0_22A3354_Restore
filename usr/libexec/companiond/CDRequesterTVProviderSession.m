@implementation CDRequesterTVProviderSession

- (void)_prepareForActivationWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void (**v14)(id, void *);

  v14 = (void (**)(id, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "providerURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absoluteString"));
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    v11 = CFSTR("Missing provider URL");
LABEL_6:
    v12 = CPSErrorMake(205, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14[2](v14, v13);

    goto LABEL_7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "providerName"));
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    v11 = CFSTR("Missing provider name");
    goto LABEL_6;
  }
  v14[2](v14, 0);
LABEL_7:

}

- (void)_configureRapportClient:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100013350;
  v3[3] = &unk_100030778;
  v3[4] = self;
  objc_msgSend(a3, "registerRequestID:options:handler:", CFSTR("com.apple.CompanionAuthentication.GetAuthInfo"), 0, v3);
}

- (BOOL)_requireOwnerDevice
{
  return 1;
}

- (id)_idsMessageRecipientUsernames
{
  return 0;
}

- (void)_handleGetAuthInfoRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  CDGetInfoRequest *v12;
  uint64_t v13;
  NSObject *v14;
  CDTVProviderGetAuthInfoResponse *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  os_activity_scope_state_s v23;
  uint8_t buf[4];
  CDGetInfoRequest *v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create((void *)&_mh_execute_header, "tv provider session/handle get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v23.opaque[0] = 0;
  v23.opaque[1] = 0;
  os_activity_scope_enter(v11, &v23);
  v12 = -[CDGetInfoRequest initWithRapportDictionary:]([CDGetInfoRequest alloc], "initWithRapportDictionary:", v8);
  v13 = cps_session_log(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received get auth info request: %@", buf, 0xCu);
  }

  v15 = objc_alloc_init(CDTVProviderGetAuthInfoResponse);
  v16 = (void *)GestaltCopyAnswer(CFSTR("DeviceName"), 0, 0);
  -[CDTVProviderGetAuthInfoResponse setDeviceClass:](v15, "setDeviceClass:", v16);

  v17 = (void *)GestaltCopyAnswer(CFSTR("UserAssignedDeviceName"), 0, 0);
  -[CDTVProviderGetAuthInfoResponse setDeviceName:](v15, "setDeviceName:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "providerURL"));
  -[CDTVProviderGetAuthInfoResponse setProviderURL:](v15, "setProviderURL:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "providerName"));
  -[CDTVProviderGetAuthInfoResponse setProviderName:](v15, "setProviderName:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CDTVProviderGetAuthInfoResponse makeRapportDictionary](v15, "makeRapportDictionary"));
  (*((void (**)(id, void *, _QWORD, _QWORD))v10 + 2))(v10, v22, 0, 0);

  os_activity_scope_leave(&v23);
}

@end

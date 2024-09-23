@implementation CDRequesterStoreAuthenticationSession

- (void)_prepareForActivationWithCompletionHandler:(id)a3
{
  void *v4;
  AMSDelegateAuthenticateRequest *v5;
  AMSDelegateAuthenticateRequest *authenticationRequest;
  void *v7;
  ACAccount *v8;
  ACAccount *storeAccount;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void (**v14)(id, void *);

  v14 = (void (**)(id, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v5 = (AMSDelegateAuthenticateRequest *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "authenticationRequest"));
  authenticationRequest = self->_authenticationRequest;
  self->_authenticationRequest = v5;

  if (!self->_authenticationRequest)
  {
    v10 = CFSTR("Missing delegate authentication request");
    v11 = 201;
LABEL_6:
    v12 = CPSErrorMake(v11, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14[2](v14, v13);

    goto LABEL_7;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v8 = (ACAccount *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "account"));
  storeAccount = self->_storeAccount;
  self->_storeAccount = v8;

  if (!self->_storeAccount)
  {
    v10 = CFSTR("Missing store account");
    v11 = 200;
    goto LABEL_6;
  }
  v14[2](v14, 0);
LABEL_7:

}

- (void)_configureRapportClient:(id)a3
{
  id v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000DFB4;
  v6[3] = &unk_100030778;
  v6[4] = self;
  v4 = a3;
  objc_msgSend(v4, "registerRequestID:options:handler:", CFSTR("com.apple.CompanionAuthentication.GetAuthInfo"), 0, v6);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000E2C4;
  v5[3] = &unk_100030778;
  v5[4] = self;
  objc_msgSend(v4, "registerRequestID:options:handler:", CFSTR("com.apple.CompanionAuthentication.DidFinishAuth"), 0, v5);

}

- (id)_responseForGetNotifInfoRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CDGetNotifInfoResponse *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storeAccountToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nonce"));

  LOBYTE(self) = sub_10000E680(self, v5, v6);
  if ((self & 1) != 0)
  {
    v8 = objc_alloc_init(CDGetNotifInfoResponse);
  }
  else
  {
    v9 = cps_session_log(v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10001E878(v10, v11, v12, v13, v14, v15, v16, v17);

    v8 = 0;
  }
  return v8;
}

- (id)_idsMessageRecipientUsernames
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount ams_altDSID](self->_storeAccount, "ams_altDSID"));
  if (!v2)
  {
    v3 = cps_session_log(0);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10001E8A8(v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAccount, 0);
  objc_storeStrong((id *)&self->_authenticationRequest, 0);
}

@end

@implementation APMescalSigningLegacyInterface

+ (void)requestMescalSetupForData:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  APMescalSignSetupRequester *v9;
  void *v10;
  APMescalSignSetupRequester *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v9 = [APMescalSignSetupRequester alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
  v11 = -[APServerRequester initWithBundleID:requestIdentifier:contextIdentifier:contentIdentifier:idAccount:](v9, "initWithBundleID:requestIdentifier:contextIdentifier:contentIdentifier:idAccount:", CFSTR("com.apple.news"), v7, 0, 0, v10);

  -[APMescalSignSetupRequester setData:](v11, "setData:", v6);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000E3DF0;
  v14[3] = &unk_100214BD0;
  v15 = v8;
  v16 = v5;
  v12 = v5;
  v13 = v8;
  -[APServerRequester makeRequest:](v11, "makeRequest:", v14);

}

+ (void)requestCertificateWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  APMescalSignSetupCertificateRequester *v6;
  void *v7;
  APMescalSignSetupCertificateRequester *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = [APMescalSignSetupCertificateRequester alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
  v8 = -[APServerRequester initWithBundleID:requestIdentifier:contextIdentifier:contentIdentifier:idAccount:](v6, "initWithBundleID:requestIdentifier:contextIdentifier:contentIdentifier:idAccount:", CFSTR("com.apple.news"), v4, 0, 0, v7);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000E3FB0;
  v11[3] = &unk_100214BD0;
  v12 = v5;
  v13 = v3;
  v9 = v3;
  v10 = v5;
  -[APServerRequester makeRequest:](v8, "makeRequest:", v11);

}

@end

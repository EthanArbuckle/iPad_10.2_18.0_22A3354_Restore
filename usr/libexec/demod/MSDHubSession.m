@implementation MSDHubSession

- (void)authenticate:(id)a3 forTask:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  unsigned int v12;
  __objc2_class **v13;
  id v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "info"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endpoint"));

  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("/Register"));
  v13 = off_10013C7D8;
  if (!v12)
    v13 = off_10013C7E0;
  v14 = objc_alloc_init(*v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "protectionSpace"));
  v16 = objc_msgSend(v14, "trustServer:isRedirect:", objc_msgSend(v15, "serverTrust"), objc_msgSend(v8, "redirected"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "protectionSpace"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", objc_msgSend(v17, "serverTrust")));

    v9[2](v9, 0, v18);
  }
  else
  {
    v19 = sub_1000604F0();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1000BAF24(v8, v20);

    v9[2](v9, 2, 0);
  }

}

@end

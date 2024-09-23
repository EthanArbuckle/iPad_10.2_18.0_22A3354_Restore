@implementation MSDFMHSession

- (void)authenticate:(id)a3 forTask:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD, void *);
  MSDSessionFMHTrustEvaluate *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v10 = (MSDSessionFMHTrustEvaluate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "info"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionFMHTrustEvaluate fmhURLOverride](v10, "fmhURLOverride"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "protectionSpace"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "host"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionFMHTrustEvaluate fmhURLOverride](v10, "fmhURLOverride"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "host"));
      v16 = objc_msgSend(v13, "isEqualToString:", v15);

      if (v16)
        goto LABEL_6;
    }

  }
  v10 = objc_alloc_init(MSDSessionFMHTrustEvaluate);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "protectionSpace"));
  v18 = -[MSDSessionFMHTrustEvaluate trustServer:isRedirect:](v10, "trustServer:isRedirect:", objc_msgSend(v17, "serverTrust"), objc_msgSend(v8, "redirected"));

  if (v18)
  {
LABEL_6:
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "protectionSpace"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", objc_msgSend(v19, "serverTrust")));

    v9[2](v9, 0, v20);
    goto LABEL_10;
  }
  v21 = sub_1000604F0();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    sub_1000BAF24(v8, v22);

  v9[2](v9, 2, 0);
LABEL_10:

}

@end

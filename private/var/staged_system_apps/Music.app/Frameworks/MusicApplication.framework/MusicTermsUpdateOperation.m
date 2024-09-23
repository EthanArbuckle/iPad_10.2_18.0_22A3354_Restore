@implementation MusicTermsUpdateOperation

- (MusicTermsUpdateOperation)initWithAcceptedStoreTermsVersion:(unint64_t)a3 termsContext:(id)a4
{
  id v6;
  MusicTermsUpdateOperation *v7;
  MusicTermsUpdateOperation *v8;
  NSString *v9;
  NSString *termsContext;

  v6 = a4;
  v7 = -[MusicTermsUpdateOperation init](self, "init");
  v8 = v7;
  if (v7)
  {
    v7->_acceptedStoreTermsVersion = a3;
    v9 = (NSString *)objc_msgSend(v6, "copy");
    termsContext = v8->_termsContext;
    v8->_termsContext = v9;

  }
  return v8;
}

- (void)main
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;
  char v18;
  id v19;
  id v20;
  uint64_t v21;
  char v22;

  v22 = 0;
  v21 = 0;
  if (!-[MusicTermsUpdateOperation isCancelled](self, "isCancelled"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MusicTermsUpdateOperation URLBagDictionary](self, "URLBagDictionary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("sub-terms-check")));
    if ((((uint64_t (*)(void))_NSIsNSString)() & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("terms-check")));

      if ((_NSIsNSString(v8) & 1) == 0)
      {

        v7 = 0;
        goto LABEL_10;
      }
      v7 = v8;
    }
    if (v7)
    {
      v9 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));
      if (v9)
      {
        v10 = (void *)v9;
        v20 = 0;
        v19 = 0;
        -[MusicTermsUpdateOperation _runRequestWithTermsCheckURL:allowingAuthentication:returningError:termsContentText:hasAcceptedLatestTerms:latestStoreTermsVersion:](self, "_runRequestWithTermsCheckURL:allowingAuthentication:returningError:termsContentText:hasAcceptedLatestTerms:latestStoreTermsVersion:", v9, 1, &v20, &v19, &v22, &v21);
        v4 = v20;
        v5 = v19;

LABEL_11:
        goto LABEL_12;
      }
    }
LABEL_10:
    v11 = SSError(SSErrorDomain, 124, 0, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue(v11);
    v5 = 0;
    goto LABEL_11;
  }
  v3 = SSError(SSErrorDomain, 140, 0, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  v5 = 0;
LABEL_12:
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __33__MusicTermsUpdateOperation_main__block_invoke;
  v14[3] = &unk_1339D40;
  v14[4] = self;
  v15 = v4;
  v18 = v22;
  v16 = v5;
  v17 = v21;
  v12 = v5;
  v13 = v4;
  -[MusicTermsUpdateOperation dispatchAsync:](self, "dispatchAsync:", v14);

}

void __33__MusicTermsUpdateOperation_main__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = *(_BYTE *)(a1 + 64);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(a1 + 56);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 48));
}

- (id)error
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __34__MusicTermsUpdateOperation_error__block_invoke;
  v4[3] = &unk_1339AD8;
  v4[4] = self;
  v4[5] = &v5;
  -[MusicTermsUpdateOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __34__MusicTermsUpdateOperation_error__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (BOOL)hasAcceptedLatestTerms
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __51__MusicTermsUpdateOperation_hasAcceptedLatestTerms__block_invoke;
  v4[3] = &unk_1339AD8;
  v4[4] = self;
  v4[5] = &v5;
  -[MusicTermsUpdateOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __51__MusicTermsUpdateOperation_hasAcceptedLatestTerms__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (NSString)termsContentText
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __45__MusicTermsUpdateOperation_termsContentText__block_invoke;
  v4[3] = &unk_1339AD8;
  v4[4] = self;
  v4[5] = &v5;
  -[MusicTermsUpdateOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __45__MusicTermsUpdateOperation_termsContentText__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (BOOL)_authenticateReturningError:(id *)a3
{
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  id v8;
  id v9;
  dispatch_semaphore_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  _QWORD v21[4];
  NSObject *v22;
  uint64_t *v23;
  id obj;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore"));
  v6 = (id *)(v26 + 5);
  obj = (id)v26[5];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "DSIDForUserIdentity:outError:", v4, &obj));
  objc_storeStrong(v6, obj);

  if (v7)
  {
    v8 = objc_alloc_init((Class)AMSAuthenticateOptions);
    objc_msgSend(v8, "setAuthenticationType:", 0);
    v9 = objc_msgSend(objc_alloc((Class)AMSAuthenticateRequest), "initWithDSID:altDSID:username:options:", v7, 0, 0, v8);
    v10 = dispatch_semaphore_create(0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "keyWindow"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rootViewController"));

    v14 = objc_msgSend(objc_alloc((Class)AMSUIAuthenticateTask), "initWithRequest:presentingViewController:", v9, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "performAuthentication"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __57__MusicTermsUpdateOperation__authenticateReturningError___block_invoke;
    v21[3] = &unk_1339D68;
    v23 = &v25;
    v16 = v10;
    v22 = v16;
    objc_msgSend(v15, "addFinishBlock:", v21);

    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    v17 = SSError(SSErrorDomain, 114, 0, 0);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v8 = (id)v26[5];
    v26[5] = v18;
  }

  if (a3)
    *a3 = objc_retainAutorelease((id)v26[5]);
  v19 = v26[5] == 0;

  _Block_object_dispose(&v25, 8);
  return v19;
}

void __57__MusicTermsUpdateOperation__authenticateReturningError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (v5)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)_runRequestWithTermsCheckURL:(id)a3 allowingAuthentication:(BOOL)a4 returningError:(id *)a5 termsContentText:(id *)a6 hasAcceptedLatestTerms:(BOOL *)a7 latestStoreTermsVersion:(unint64_t *)a8
{
  id v13;
  id v14;
  void *v15;
  NSString *termsContext;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  unint64_t *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  unsigned int v26;
  id v27;
  void *v28;
  unsigned int v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  char *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  id v43;
  void *v44;
  unsigned int v45;
  uint64_t v46;
  _QWORD *v47;
  id *v48;
  BOOL *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[7];
  id v58;
  id location;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  id v76;
  _BYTE v77[9];

  v77[0] = 0;
  v76 = 0;
  v50 = a3;
  v13 = objc_msgSend(objc_alloc((Class)NSMutableURLRequest), "initWithURL:", v50);
  objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
  v14 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 2);
  v15 = v14;
  termsContext = self->_termsContext;
  if (termsContext)
    objc_msgSend(v14, "setObject:forKey:", termsContext, CFSTR("context"));
  if (self->_acceptedStoreTermsVersion)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
    objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("accepted"));

  }
  v48 = a6;
  v49 = a7;
  if (objc_msgSend(v15, "count"))
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v15, 0, 0));
  else
    v18 = 0;
  objc_msgSend(v13, "setHTTPBody:", v18, a5);
  v19 = -[MusicTermsUpdateOperation newLoadURLOperationWithRequest:](self, "newLoadURLOperationWithRequest:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSVURLProtocolConsumer consumer](SSVURLProtocolConsumer, "consumer"));
  objc_msgSend(v19, "setDataConsumer:", v20);

  v70 = 0;
  v71 = &v70;
  v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__2;
  v74 = __Block_byref_object_dispose__2;
  v75 = 0;
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__2;
  v68 = __Block_byref_object_dispose__2;
  v69 = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  objc_initWeak(&location, v19);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = __160__MusicTermsUpdateOperation__runRequestWithTermsCheckURL_allowingAuthentication_returningError_termsContentText_hasAcceptedLatestTerms_latestStoreTermsVersion___block_invoke;
  v57[3] = &unk_1339D90;
  v57[4] = &v70;
  v57[5] = &v64;
  objc_copyWeak(&v58, &location);
  v57[6] = &v60;
  objc_msgSend(v19, "setOutputBlock:", v57);
  -[MusicTermsUpdateOperation runChildOperation:](self, "runChildOperation:", v19);
  v21 = a8;
  v22 = v61[3];
  if (!v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "userInfo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", SSErrorHTTPStatusCodeKey));
    v25 = objc_msgSend(v24, "integerValue");
    v61[3] = (uint64_t)v25;

    v22 = v61[3];
  }
  if (v22 != 401)
  {
    v32 = (void *)v65[5];
    if (v32)
    {
      v33 = v32;
LABEL_30:
      v30 = v33;
      v31 = 0;
      goto LABEL_31;
    }
    if (!_NSIsNSDictionary(v71[5]))
    {
      v38 = SSError(SSErrorDomain, 111, 0, 0);
      v33 = (id)objc_claimAutoreleasedReturnValue(v38);
      goto LABEL_30;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v71[5], "objectForKey:", CFSTR("status")));
    if ((objc_opt_respondsToSelector(v34, "integerValue") & 1) != 0)
    {
      v35 = (char *)objc_msgSend(v34, "integerValue");
      if (v35 == "pleMediaServices" || v35 == "ateFrameworks/InAppMessages.framework/InAppMessages")
      {
        v53 = 0;
        v42 = -[MusicTermsUpdateOperation _authenticateReturningError:](self, "_authenticateReturningError:", &v53);
        v43 = v53;
        v44 = v43;
        if (v43)
          v45 = 0;
        else
          v45 = v42;
        if (v45 == 1)
        {
          v51 = 0;
          v52 = 0;
          -[MusicTermsUpdateOperation _runRequestWithTermsCheckURL:allowingAuthentication:returningError:termsContentText:hasAcceptedLatestTerms:latestStoreTermsVersion:](self, "_runRequestWithTermsCheckURL:allowingAuthentication:returningError:termsContentText:hasAcceptedLatestTerms:latestStoreTermsVersion:", v50, 0, &v52, &v51, v77, &v76);
          v30 = v52;
          v31 = v51;
        }
        else
        {
          v30 = v43;
          v31 = 0;
        }
LABEL_52:

        goto LABEL_53;
      }
      if (!v35)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v71[5], "objectForKey:", CFSTR("isCurrent")));
        if ((objc_opt_respondsToSelector(v36, "BOOLValue") & 1) != 0)
          v77[0] = objc_msgSend(v36, "BOOLValue");
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v71[5], "objectForKey:", CFSTR("termsContentText")));

        if (_NSIsNSString(v37))
          v31 = v37;
        else
          v31 = 0;
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v71[5], "objectForKey:", CFSTR("latestTermsVersionId")));

        v30 = 0;
        if ((objc_opt_respondsToSelector(v44, "longLongValue") & 1) != 0)
          v76 = objc_msgSend(v44, "longLongValue");
        goto LABEL_52;
      }
      v46 = SSError(SSServerErrorDomain, v35, 0, 0);
      v41 = objc_claimAutoreleasedReturnValue(v46);
    }
    else
    {
      v40 = SSError(SSErrorDomain, 111, 0, 0);
      v41 = objc_claimAutoreleasedReturnValue(v40);
    }
    v30 = (id)v41;
    v31 = 0;
LABEL_53:

    goto LABEL_31;
  }
  v56 = 0;
  v26 = -[MusicTermsUpdateOperation _authenticateReturningError:](self, "_authenticateReturningError:", &v56);
  v27 = v56;
  v28 = v27;
  if (v27)
    v29 = 0;
  else
    v29 = v26;
  if (v29 == 1)
  {
    v54 = 0;
    v55 = 0;
    -[MusicTermsUpdateOperation _runRequestWithTermsCheckURL:allowingAuthentication:returningError:termsContentText:hasAcceptedLatestTerms:latestStoreTermsVersion:](self, "_runRequestWithTermsCheckURL:allowingAuthentication:returningError:termsContentText:hasAcceptedLatestTerms:latestStoreTermsVersion:", v50, 0, &v55, &v54, v77, &v76);
    v30 = v55;
    v31 = v54;
  }
  else
  {
    v30 = v27;
    v31 = 0;
  }

LABEL_31:
  if (v47)
    *v47 = objc_retainAutorelease(v30);
  if (v48)
    *v48 = objc_retainAutorelease(v31);
  if (v49)
    *v49 = v77[0];
  if (v21)
    *v21 = (unint64_t)v76;
  objc_destroyWeak(&v58);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);

  _Block_object_dispose(&v70, 8);
  return v30 == 0;
}

void __160__MusicTermsUpdateOperation__runRequestWithTermsCheckURL_allowingAuthentication_returningError_termsContentText_hasAcceptedLatestTerms_latestStoreTermsVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id WeakRetained;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;
  v12 = v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "URLResponse"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v13, "statusCode");

}

- (unint64_t)acceptedStoreTermsVersion
{
  return self->_acceptedStoreTermsVersion;
}

- (NSString)termsContext
{
  return self->_termsContext;
}

- (unint64_t)latestStoreTermsVersion
{
  return self->_latestStoreTermsVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsContext, 0);
  objc_storeStrong((id *)&self->_termsContentText, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end

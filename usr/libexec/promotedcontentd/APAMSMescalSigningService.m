@implementation APAMSMescalSigningService

- (id)rawSignatureForData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  id v15;
  BOOL v16;
  uint64_t v17;
  NSObject *v18;
  char v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];

  v6 = a3;
  if (a4)
    *a4 = 0;
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
  {
    v7 = objc_alloc((Class)NSUserDefaults);
    v8 = objc_msgSend(v7, "initWithSuiteName:", APDefaultsBundleID);
    if ((objc_msgSend(v8, "BOOLForKey:", CFSTR("ForceAMSMescalError")) & 1) != 0)
    {
      v9 = AMSErrorDomain;
      v25[0] = NSLocalizedDescriptionKey;
      v25[1] = NSLocalizedFailureReasonErrorKey;
      v26[0] = CFSTR("Bag Value Missing");
      v26[1] = CFSTR("The bag does not contain sign-sap-setup-cert nor did anyone register a default value.");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 2));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v9, 204, v10));

      if (v11)
      {
        v12 = 0;
        v13 = 1;
        goto LABEL_13;
      }
    }
    else
    {

    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[APAMSBagManager adprivacydBag](APAMSBagManager, "adprivacydBag"));
  v22 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSMescal signatureFromData:type:bag:error:](AMSMescal, "signatureFromData:type:bag:error:", v6, 1, v14, &v22));
  v15 = v22;

  v13 = v15 != 0;
  if (v12)
    v16 = v15 == 0;
  else
    v16 = 0;
  if (v16)
  {
    v11 = 0;
    goto LABEL_20;
  }
  v11 = v15;
LABEL_13:
  v17 = APLogForCategory(28);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "rawSignatureForData failed with error %{public}@", buf, 0xCu);
  }

  -[APAMSMescalSigningService setState:](self, "setState:", 3);
  v19 = !v13;
  if (!a4)
    v19 = 1;
  if ((v19 & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v20, objc_msgSend(v11, "code"), 0));

  }
LABEL_20:

  return v12;
}

- (void)setState:(int64_t)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APAMSMescalSigningService delegate](self, "delegate"));

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[APAMSMescalSigningService delegate](self, "delegate"));
    objc_msgSend(v6, "mescalStateChanged:", a3);

  }
}

- (void)setup
{
  -[APAMSMescalSigningService setState:](self, "setState:", 2);
}

- (void)retrySetup
{
  void *v3;
  void *v4;
  BOOL v5;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("APMescalSigningService AMS provider status check."), "dataUsingEncoding:", 4));
  v6 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APAMSMescalSigningService rawSignatureForData:error:](self, "rawSignatureForData:error:", v3, &v6));
  if (v4)
    v5 = v6 == 0;
  else
    v5 = 0;
  if (v5)
    -[APAMSMescalSigningService setState:](self, "setState:", 2);

}

- (BOOL)signatureIsValid:(id)a3 data:(id)a4 error:(id *)a5
{
  return 0;
}

- (APMescalSigningStateChangedDelegate)delegate
{
  return (APMescalSigningStateChangedDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
}

@end

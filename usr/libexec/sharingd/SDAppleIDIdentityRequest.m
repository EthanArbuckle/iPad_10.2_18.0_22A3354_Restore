@implementation SDAppleIDIdentityRequest

- (void)_activate
{
  const char *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_activated)
  {
    if (dword_1007B2148 > 60 || dword_1007B2148 == -1 && !_LogCategory_Initialize(&dword_1007B2148, 60))
      return;
    v3 = "### Already activated\n";
LABEL_23:
    LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _activate]", 60, v3);
    return;
  }
  if (self->_invalidated)
  {
    if (dword_1007B2148 > 60 || dword_1007B2148 == -1 && !_LogCategory_Initialize(&dword_1007B2148, 60))
      return;
    v3 = "### Object invalidated\n";
    goto LABEL_23;
  }
  if (dword_1007B2148 <= 30 && (dword_1007B2148 != -1 || _LogCategory_Initialize(&dword_1007B2148, 30)))
    LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _activate]", 30, "Activate\n");
  if (self->_certificateToken && self->_privateKeyPersistentReference)
  {
    if (dword_1007B2148 <= 30
      && (dword_1007B2148 != -1 || _LogCategory_Initialize(&dword_1007B2148, 30)))
    {
      LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _activate]", 30, "Certificate token and private key reference are available, skip create request\n");
    }
    -[SDAppleIDIdentityRequest _sendFetchCertificateRequest](self, "_sendFetchCertificateRequest");
  }
  else
  {
    -[SDAppleIDIdentityRequest _sendCreateCertificateRequest](self, "_sendCreateCertificateRequest");
  }
  self->_activated = 1;
}

- (void)_invalidate
{
  OS_dispatch_source *createDelayTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  SDAppleIDServerTask *certificateCreateTask;
  OS_dispatch_source *fetchDelayTimer;
  NSObject *v8;
  OS_dispatch_source *v9;
  SDAppleIDServerTask *certificateFetchTask;
  NSString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  NSErrorUserInfoKey v17;
  const __CFString *v18;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidated)
  {
    if (dword_1007B2148 <= 60
      && (dword_1007B2148 != -1 || _LogCategory_Initialize(&dword_1007B2148, 60)))
    {
      LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _invalidate]", 60, "### Object invalidated\n");
    }
  }
  else
  {
    if (dword_1007B2148 <= 30
      && (dword_1007B2148 != -1 || _LogCategory_Initialize(&dword_1007B2148, 30)))
    {
      LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _invalidate]", 30, "Invalidate\n");
    }
    createDelayTimer = self->_createDelayTimer;
    if (createDelayTimer)
    {
      v4 = createDelayTimer;
      dispatch_source_cancel(v4);
      v5 = self->_createDelayTimer;
      self->_createDelayTimer = 0;

    }
    -[SDAppleIDServerTask setResponseHandler:](self->_certificateCreateTask, "setResponseHandler:", 0);
    -[SDAppleIDServerTask invalidate](self->_certificateCreateTask, "invalidate");
    certificateCreateTask = self->_certificateCreateTask;
    self->_certificateCreateTask = 0;

    fetchDelayTimer = self->_fetchDelayTimer;
    if (fetchDelayTimer)
    {
      v8 = fetchDelayTimer;
      dispatch_source_cancel(v8);
      v9 = self->_fetchDelayTimer;
      self->_fetchDelayTimer = 0;

    }
    -[SDAppleIDServerTask setResponseHandler:](self->_certificateFetchTask, "setResponseHandler:", 0);
    -[SDAppleIDServerTask invalidate](self->_certificateFetchTask, "invalidate");
    certificateFetchTask = self->_certificateFetchTask;
    self->_certificateFetchTask = 0;

    if (self->_activated)
    {
      v17 = NSLocalizedDescriptionKey;
      v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960573, 0, 0));
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)v12;
      v14 = CFSTR("?");
      if (v12)
        v14 = (const __CFString *)v12;
      v18 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6723, v15));
      -[SDAppleIDIdentityRequest _responseHandlerWithIdentity:error:](self, "_responseHandlerWithIdentity:error:", 0, v16);

    }
    self->_invalidated = 1;
  }
}

- (void)dealloc
{
  __SecKey *privateKey;
  __SecKey *publicKey;
  objc_super v5;

  privateKey = self->_privateKey;
  if (privateKey)
    CFRelease(privateKey);
  publicKey = self->_publicKey;
  if (publicKey)
    CFRelease(publicKey);
  v5.receiver = self;
  v5.super_class = (Class)SDAppleIDIdentityRequest;
  -[SDAppleIDIdentityRequest dealloc](&v5, "dealloc");
}

- (void)_handleCertificateCreateResponseError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B2148 <= 90 && (dword_1007B2148 != -1 || _LogCategory_Initialize(&dword_1007B2148, 90)))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedDescription"));
    LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _handleCertificateCreateResponseError:]", 90, "### Create Certificate request failed with error %@\n", v4);

  }
  -[SDAppleIDIdentityRequest _responseHandlerWithIdentity:error:](self, "_responseHandlerWithIdentity:error:", 0, v5);

}

- (void)_handleCertificateCreateResponseWithInfo:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  SDAppleIDServerTask *certificateCreateTask;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v11;
  CFTypeID v12;
  uint64_t v13;
  void *v14;
  id v15;
  unsigned int Int64Ranged;
  uint64_t v17;
  void (**certificateTokenHandler)(id, NSString *);
  uint64_t v19;
  int v20;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[SDAppleIDServerTask invalidate](self->_certificateCreateTask, "invalidate");
  certificateCreateTask = self->_certificateCreateTask;
  self->_certificateCreateTask = 0;

  if (v7)
  {
    v15 = v7;
    v11 = 0;
    goto LABEL_20;
  }
  if (!v6)
  {
    v11 = 0;
    v19 = -6705;
LABEL_19:
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v19, 0));
    if (!v15)
      goto LABEL_15;
LABEL_20:
    -[SDAppleIDIdentityRequest _handleCertificateCreateResponseError:](self, "_handleCertificateCreateResponseError:", v15);

    v15 = 0;
    goto LABEL_15;
  }
  if (dword_1007B2148 <= 30 && (dword_1007B2148 != -1 || _LogCategory_Initialize(&dword_1007B2148, 30)))
    LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _handleCertificateCreateResponseWithInfo:error:]", 30, "Certificate Create Response: %@\n", v6);
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v6, CFSTR("AltDSID"), TypeID, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (!v11
    || (objc_storeStrong((id *)&self->_altDSID, v11),
        v12 = CFStringGetTypeID(),
        v13 = CFDictionaryGetTypedValue(v6, CFSTR("CertificateToken"), v12, 0),
        (v14 = (void *)objc_claimAutoreleasedReturnValue(v13)) == 0))
  {
    v19 = -6712;
    goto LABEL_19;
  }
  v15 = v14;
  objc_storeStrong((id *)&self->_certificateToken, v14);
  Int64Ranged = CFDictionaryGetInt64Ranged(v6, CFSTR("Delay"), 0, 0xFFFFFFFFLL, &v20);
  if (Int64Ranged)
    v17 = Int64Ranged;
  else
    v17 = 60;
  -[SDAppleIDIdentityRequest _scheduleFetchCertificateTaskWithDelay:](self, "_scheduleFetchCertificateTaskWithDelay:", v17);
  certificateTokenHandler = (void (**)(id, NSString *))self->_certificateTokenHandler;
  if (certificateTokenHandler && self->_privateKeyPersistentReference)
    certificateTokenHandler[2](certificateTokenHandler, self->_certificateToken);
LABEL_15:

}

- (void)_handleCertificateFetchResponseError:(id)a3
{
  void *v4;
  unint64_t Int64;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B2148 <= 90 && (dword_1007B2148 != -1 || _LogCategory_Initialize(&dword_1007B2148, 90)))
    LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _handleCertificateFetchResponseError:]", 90, "### Fetch Certificate request failed with error %{error}\n", v8);
  if (NSErrorToOSStatus(v8) == -6712 && self->_fetchRetryCount <= 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
    Int64 = CFDictionaryGetInt64(v4, SFAppleIDErrorUserInfoRetryDelaySecondsKey, 0);

    v6 = 7200;
    if (Int64 < 0x1C20)
      v6 = Int64;
    if (Int64)
      v7 = v6;
    else
      v7 = 60;
    -[SDAppleIDIdentityRequest _scheduleFetchRetryWithDelay:](self, "_scheduleFetchRetryWithDelay:", v7);
  }
  else
  {
    -[SDAppleIDIdentityRequest _responseHandlerWithIdentity:error:](self, "_responseHandlerWithIdentity:error:", 0, v8);
  }

}

- (void)_handleCertificateFetchResponseWithInfo:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  SDAppleIDServerTask *certificateFetchTask;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v11;
  void *v12;
  NSString *altDSID;
  CFTypeID v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int Int64Ranged;
  unint64_t certificateStatus;
  const __CFString *v20;
  const __CFString *v21;
  CFTypeID v22;
  uint64_t v23;
  NSDate *v24;
  NSDate *certificateExpirationDate;
  CFTypeID v26;
  uint64_t v27;
  NSString *v28;
  NSString *certificatePEM;
  CFTypeID v30;
  uint64_t v31;
  NSString *v32;
  NSString *certificateSerialNumber;
  CFTypeID v34;
  uint64_t v35;
  NSString *v36;
  NSString *intermediateCertificatePEM;
  const __CFString *v38;
  unint64_t v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  NSString *v44;
  uint64_t v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  NSErrorDomain v49;
  uint64_t v50;
  NSString *v51;
  uint64_t v52;
  const __CFString *v53;
  NSErrorDomain v54;
  NSString *v55;
  uint64_t v56;
  void *v57;
  const __CFString *v58;
  const __CFString **v59;
  NSErrorUserInfoKey *v60;
  NSString *v61;
  uint64_t v62;
  const __CFString *v63;
  void *v64;
  NSErrorDomain v65;
  NSString *v66;
  uint64_t v67;
  void *v68;
  const __CFString *v69;
  const __CFString **v70;
  NSErrorUserInfoKey *v71;
  void *v72;
  NSString *v73;
  uint64_t v74;
  const __CFString *v75;
  NSString *v76;
  uint64_t v77;
  const __CFString *v78;
  NSString *v79;
  uint64_t v80;
  const __CFString *v81;
  NSString *v82;
  uint64_t v83;
  const __CFString *v84;
  NSErrorUserInfoKey v85;
  const __CFString *v86;
  NSErrorUserInfoKey v87;
  const __CFString *v88;
  NSErrorUserInfoKey v89;
  const __CFString *v90;
  NSErrorUserInfoKey v91;
  const __CFString *v92;
  NSErrorUserInfoKey v93;
  const __CFString *v94;
  NSErrorUserInfoKey v95;
  const __CFString *v96;
  NSErrorUserInfoKey v97;
  const __CFString *v98;
  NSErrorUserInfoKey v99;
  const __CFString *v100;
  NSErrorUserInfoKey v101;
  const __CFString *v102;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[SDAppleIDServerTask invalidate](self->_certificateFetchTask, "invalidate");
  certificateFetchTask = self->_certificateFetchTask;
  self->_certificateFetchTask = 0;

  if (v7)
  {
    v43 = v7;
    v17 = 0;
    v12 = 0;
    goto LABEL_68;
  }
  if (!v6)
  {
    v101 = NSLocalizedDescriptionKey;
    v44 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960591, 0, 0));
    v45 = objc_claimAutoreleasedReturnValue(v44);
    v46 = (void *)v45;
    v47 = CFSTR("?");
    if (v45)
      v47 = (const __CFString *)v45;
    v102 = v47;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1));
    v49 = NSOSStatusErrorDomain;
    v50 = -6705;
    goto LABEL_53;
  }
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v6, CFSTR("AltDSID"), TypeID, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (!v11)
  {
    v99 = NSLocalizedDescriptionKey;
    v51 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960584, 0, 0));
    v52 = objc_claimAutoreleasedReturnValue(v51);
    v46 = (void *)v52;
    v53 = CFSTR("?");
    if (v52)
      v53 = (const __CFString *)v52;
    v100 = v53;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1));
    v49 = NSOSStatusErrorDomain;
    v50 = -6712;
LABEL_53:
    v43 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v49, v50, v48));

    v12 = 0;
LABEL_61:
    v17 = 0;
    goto LABEL_67;
  }
  v12 = v11;
  altDSID = self->_altDSID;
  if (!altDSID)
  {
    objc_storeStrong((id *)&self->_altDSID, v11);
    altDSID = self->_altDSID;
  }
  if ((objc_msgSend(v12, "isEqualToString:", altDSID) & 1) == 0)
  {
    v54 = NSOSStatusErrorDomain;
    v97 = NSLocalizedDescriptionKey;
    v55 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960584, 0, 0));
    v56 = objc_claimAutoreleasedReturnValue(v55);
    v57 = (void *)v56;
    v58 = CFSTR("?");
    if (v56)
      v58 = (const __CFString *)v56;
    v98 = v58;
    v59 = &v98;
    v60 = &v97;
    goto LABEL_60;
  }
  v14 = CFStringGetTypeID();
  v15 = CFDictionaryGetTypedValue(v6, CFSTR("CertificateToken"), v14, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if (!v16)
  {
    v54 = NSOSStatusErrorDomain;
    v95 = NSLocalizedDescriptionKey;
    v61 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960584, 0, 0));
    v62 = objc_claimAutoreleasedReturnValue(v61);
    v57 = (void *)v62;
    v63 = CFSTR("?");
    if (v62)
      v63 = (const __CFString *)v62;
    v96 = v63;
    v59 = &v96;
    v60 = &v95;
LABEL_60:
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v60, 1));
    v43 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v54, -6712, v64));

    goto LABEL_61;
  }
  v17 = v16;
  if ((objc_msgSend(v16, "isEqualToString:", self->_certificateToken) & 1) == 0)
  {
    v65 = NSOSStatusErrorDomain;
    v93 = NSLocalizedDescriptionKey;
    v66 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960584, 0, 0));
    v67 = objc_claimAutoreleasedReturnValue(v66);
    v68 = (void *)v67;
    v69 = CFSTR("?");
    if (v67)
      v69 = (const __CFString *)v67;
    v94 = v69;
    v70 = &v94;
    v71 = &v93;
LABEL_65:
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v70, v71, 1));
    v43 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v65, -6712, v72));

LABEL_67:
    if (!v43)
      goto LABEL_33;
LABEL_68:
    -[SDAppleIDIdentityRequest _handleCertificateFetchResponseError:](self, "_handleCertificateFetchResponseError:", v43);

    goto LABEL_33;
  }
  Int64Ranged = CFDictionaryGetInt64Ranged(v6, CFSTR("CertificateStatus"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  certificateStatus = Int64Ranged;
  self->_certificateStatus = Int64Ranged;
  switch(Int64Ranged)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      if (dword_1007B2148 > 60)
        goto LABEL_31;
      if (dword_1007B2148 != -1)
        goto LABEL_12;
      if (_LogCategory_Initialize(&dword_1007B2148, 60))
      {
        certificateStatus = self->_certificateStatus;
LABEL_12:
        if (certificateStatus > 5)
          v20 = CFSTR("?");
        else
          v20 = *(&off_100718148 + certificateStatus);
        LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _handleCertificateFetchResponseWithInfo:error:]", 60, "### Certificate status %d/%@\n", certificateStatus, v20);
      }
LABEL_31:
      if (self->_createRetryCount >= 3)
        goto LABEL_66;
      -[SDAppleIDIdentityRequest _scheduleCreateRetryWithDelay:](self, "_scheduleCreateRetryWithDelay:", 5);
      goto LABEL_33;
    case 1:
      v22 = CFDateGetTypeID();
      v23 = CFDictionaryGetTypedValue(v6, CFSTR("CertificateExpirationDate"), v22, 0);
      v24 = (NSDate *)objc_claimAutoreleasedReturnValue(v23);
      certificateExpirationDate = self->_certificateExpirationDate;
      self->_certificateExpirationDate = v24;

      if (!self->_certificateExpirationDate)
      {
        v65 = NSOSStatusErrorDomain;
        v91 = NSLocalizedDescriptionKey;
        v73 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960584, 0, 0));
        v74 = objc_claimAutoreleasedReturnValue(v73);
        v68 = (void *)v74;
        v75 = CFSTR("?");
        if (v74)
          v75 = (const __CFString *)v74;
        v92 = v75;
        v70 = &v92;
        v71 = &v91;
        goto LABEL_65;
      }
      v26 = CFStringGetTypeID();
      v27 = CFDictionaryGetTypedValue(v6, CFSTR("CertificatePEM"), v26, 0);
      v28 = (NSString *)objc_claimAutoreleasedReturnValue(v27);
      certificatePEM = self->_certificatePEM;
      self->_certificatePEM = v28;

      if (!self->_certificatePEM)
      {
        v65 = NSOSStatusErrorDomain;
        v89 = NSLocalizedDescriptionKey;
        v76 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960584, 0, 0));
        v77 = objc_claimAutoreleasedReturnValue(v76);
        v68 = (void *)v77;
        v78 = CFSTR("?");
        if (v77)
          v78 = (const __CFString *)v77;
        v90 = v78;
        v70 = &v90;
        v71 = &v89;
        goto LABEL_65;
      }
      v30 = CFStringGetTypeID();
      v31 = CFDictionaryGetTypedValue(v6, CFSTR("CertificateSerialNumber"), v30, 0);
      v32 = (NSString *)objc_claimAutoreleasedReturnValue(v31);
      certificateSerialNumber = self->_certificateSerialNumber;
      self->_certificateSerialNumber = v32;

      if (!self->_certificateSerialNumber)
      {
        v65 = NSOSStatusErrorDomain;
        v87 = NSLocalizedDescriptionKey;
        v79 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960584, 0, 0));
        v80 = objc_claimAutoreleasedReturnValue(v79);
        v68 = (void *)v80;
        v81 = CFSTR("?");
        if (v80)
          v81 = (const __CFString *)v80;
        v88 = v81;
        v70 = &v88;
        v71 = &v87;
        goto LABEL_65;
      }
      v34 = CFStringGetTypeID();
      v35 = CFDictionaryGetTypedValue(v6, CFSTR("IntermediateCertificate"), v34, 0);
      v36 = (NSString *)objc_claimAutoreleasedReturnValue(v35);
      intermediateCertificatePEM = self->_intermediateCertificatePEM;
      self->_intermediateCertificatePEM = v36;

      if (!self->_intermediateCertificatePEM)
      {
        v65 = NSOSStatusErrorDomain;
        v85 = NSLocalizedDescriptionKey;
        v82 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960584, 0, 0));
        v83 = objc_claimAutoreleasedReturnValue(v82);
        v68 = (void *)v83;
        v84 = CFSTR("?");
        if (v83)
          v84 = (const __CFString *)v83;
        v86 = v84;
        v70 = &v86;
        v71 = &v85;
        goto LABEL_65;
      }
      -[SDAppleIDIdentityRequest _handleReceivedCertificate](self, "_handleReceivedCertificate");
      goto LABEL_33;
    case 2:
      if (dword_1007B2148 > 60)
        goto LABEL_37;
      if (dword_1007B2148 != -1)
      {
        v38 = CFSTR("Pending");
        v39 = 2;
LABEL_26:
        LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _handleCertificateFetchResponseWithInfo:error:]", 60, "### Certificate status %d/%@\n", v39, v38);
        goto LABEL_37;
      }
      if (_LogCategory_Initialize(&dword_1007B2148, 60))
      {
        v39 = self->_certificateStatus;
        if (v39 > 5)
          v38 = CFSTR("?");
        else
          v38 = *(&off_100718148 + v39);
        goto LABEL_26;
      }
LABEL_37:
      v40 = CFDictionaryGetInt64Ranged(v6, CFSTR("Delay"), 0, 0xFFFFFFFFLL, 0);
      if (self->_fetchRetryCount >= 3)
      {
LABEL_66:
        v43 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SFAppleIDErrorDomain, 201227, 0));
        goto LABEL_67;
      }
      v41 = v40;
      if (v40 >= 0x1C20uLL)
        v41 = 7200;
      if (v40)
        v42 = v41;
      else
        v42 = 60;
      -[SDAppleIDIdentityRequest _scheduleFetchRetryWithDelay:](self, "_scheduleFetchRetryWithDelay:", v42);
LABEL_33:

      return;
    default:
      if (dword_1007B2148 <= 60)
      {
        if (dword_1007B2148 == -1)
        {
          if (!_LogCategory_Initialize(&dword_1007B2148, 60))
            goto LABEL_33;
          certificateStatus = self->_certificateStatus;
        }
        if (certificateStatus > 5)
          v21 = CFSTR("?");
        else
          v21 = *(&off_100718148 + certificateStatus);
        LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _handleCertificateFetchResponseWithInfo:error:]", 60, "### Certificate status %d/%@ isn't handled yet\n", certificateStatus, v21);
      }
      goto LABEL_33;
  }
}

- (void)_handleCertificate:(__SecCertificate *)a3 intermediateCertificate:(__SecCertificate *)a4 withTrustResult:(BOOL)a5 error:(int)a6
{
  uint64_t v6;
  _BOOL4 v7;
  _UNKNOWN **v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  int v16;
  id v17;
  double v18;
  int v19;
  id v20;
  double v21;
  double v22;
  uint64_t v23;
  id v24;
  void *v25;
  NSString *appleID;
  void *v27;
  NSString *v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  NSErrorUserInfoKey v46;
  const __CFString *v47;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v11 = NSLocale_ptr;
  if ((_DWORD)v6)
  {
    v12 = 0;
    v39 = 0;
    v40 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_47;
  }
  v6 = 201209;
  if (!v7)
  {
    v12 = 0;
    v39 = 0;
    v40 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v6 = 201219;
    goto LABEL_47;
  }
  if (dword_1007B2148 <= 50 && (dword_1007B2148 != -1 || _LogCategory_Initialize(&dword_1007B2148, 50)))
    LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _handleCertificate:intermediateCertificate:withTrustResult:error:]", 50, "Received certificates are trusted.\n");
  if (!self->_altDSID || !self->_appleID || !self->_privateKeyPersistentReference)
  {
    v12 = 0;
    v39 = 0;
    v40 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v6 = 4294960587;
    goto LABEL_47;
  }
  v45 = 0;
  v16 = SFAppleIDExpirationDateForCertificate(a3, &v45);
  v17 = v45;
  if (v16
    && dword_1007B2148 <= 60
    && (dword_1007B2148 != -1 || _LogCategory_Initialize(&dword_1007B2148, 60)))
  {
    LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _handleCertificate:intermediateCertificate:withTrustResult:error:]", 60, "### Failed to get expiration date from certificate\n");
  }
  -[NSDate timeIntervalSinceDate:](self->_certificateExpirationDate, "timeIntervalSinceDate:", v17);
  if (v17)
  {
    if (v18 < 0.0)
      v18 = -v18;
    if (v18 > 2592000.0
      && dword_1007B2148 <= 60
      && (dword_1007B2148 != -1 || _LogCategory_Initialize(&dword_1007B2148, 60)))
    {
      LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _handleCertificate:intermediateCertificate:withTrustResult:error:]", 60, "### Large certificate expiration date discrepancy. Certificate=%@; Response=%@\n",
        v17,
        self->_certificateExpirationDate);
    }
  }
  v44 = 0;
  v19 = SFAppleIDExpirationDateForCertificate(a4, &v44);
  v20 = v44;
  v11 = NSLocale_ptr;
  if (v19
    && dword_1007B2148 <= 60
    && (dword_1007B2148 != -1 || _LogCategory_Initialize(&dword_1007B2148, 60)))
  {
    LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _handleCertificate:intermediateCertificate:withTrustResult:error:]", 60, "### Failed to get expiration date from intermediate certificate\n");
  }
  objc_msgSend(v20, "timeIntervalSinceNow");
  v22 = v21;
  if (v21 < 7776000.0
    && dword_1007B2148 <= 60
    && (dword_1007B2148 != -1 || _LogCategory_Initialize(&dword_1007B2148, 60)))
  {
    LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _handleCertificate:intermediateCertificate:withTrustResult:error:]", 60, "### Intermediate certificate expiration date warning: expiration date: %@, time interval since now: %lf", v20, *(_QWORD *)&v22);
  }
  v40 = v20;
  v43 = 0;
  v23 = SFAppleIDCommonNameForCertificate(a3, &v43);
  v24 = v43;
  v39 = v24;
  if ((_DWORD)v23)
  {
    v15 = v17;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v6 = v23;
    goto LABEL_47;
  }
  v25 = v24;
  if ((objc_msgSend(v24, "hasPrefix:", CFSTR("com.apple.idms.appleid.")) & 1) == 0)
  {
    v15 = v17;
    if (dword_1007B2148 <= 90
      && (dword_1007B2148 != -1 || _LogCategory_Initialize(&dword_1007B2148, 90)))
    {
      LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _handleCertificate:intermediateCertificate:withTrustResult:error:]", 90, "### Common name %@ has unexpected prefix\n", v39);
    }
    v12 = 0;
    v13 = 0;
    v14 = 0;
    goto LABEL_47;
  }
  appleID = self->_appleID;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Apple ID authorization certificate for %@"), appleID));
  v42 = 0;
  v6 = SFAppleIDAddCertificateToKeychain(appleID, a3, v27, &v42);
  v14 = v42;

  if ((_DWORD)v6)
  {
    v15 = v17;
    v12 = 0;
LABEL_46:
    v13 = 0;
    goto LABEL_47;
  }
  if (!objc_msgSend(v14, "length"))
  {
    v15 = v17;
    v12 = 0;
LABEL_67:
    v13 = 0;
    v6 = 4294960534;
    goto LABEL_47;
  }
  if (dword_1007B2148 <= 50 && (dword_1007B2148 != -1 || _LogCategory_Initialize(&dword_1007B2148, 50)))
    LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _handleCertificate:intermediateCertificate:withTrustResult:error:]", 50, "Added certificate for %@ to keychain\n", self->_appleID);
  v28 = self->_appleID;
  v41 = 0;
  v6 = SFAppleIDAddCertificateToKeychain(v28, a4, CFSTR("Apple ID authorization intermediate certificate"), &v41);
  v29 = v41;
  v12 = v29;
  if ((_DWORD)v6)
  {
    v15 = v17;
    goto LABEL_46;
  }
  if (!objc_msgSend(v29, "length"))
  {
    v15 = v17;
    goto LABEL_67;
  }
  v37 = v40;
  if (dword_1007B2148 <= 50 && (dword_1007B2148 != -1 || _LogCategory_Initialize(&dword_1007B2148, 50)))
    LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _handleCertificate:intermediateCertificate:withTrustResult:error:]", 50, "Added intermediate certificate for %@ to keychain\n", self->_appleID);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v38 = objc_msgSend(objc_alloc((Class)SFAppleIDIdentity), "initWithAppleID:altDSID:", self->_appleID, self->_altDSID);
  if (v38)
  {
    v33 = v38;
    objc_msgSend(v38, "setAccountIdentifier:", v25);
    objc_msgSend(v33, "setCertificateExpirationDate:", self->_certificateExpirationDate);
    objc_msgSend(v33, "setCertificatePersistentReference:", v14);
    objc_msgSend(v33, "setIntermediateCertificateExpirationDate:", v40);
    objc_msgSend(v33, "setIntermediateCertificatePersistentReference:", v12);
    objc_msgSend(v33, "setLastValidationAttemptDate:", v13);
    objc_msgSend(v33, "setLastValidationDate:", v13);
    objc_msgSend(v33, "setModificationDate:", v13);
    objc_msgSend(v33, "setPrivateKeyPersistentReference:", self->_privateKeyPersistentReference);
    objc_msgSend(v33, "setSerialNumber:", self->_certificateSerialNumber);
    -[SDAppleIDIdentityRequest _responseHandlerWithIdentity:error:](self, "_responseHandlerWithIdentity:error:", v33, 0);
    goto LABEL_50;
  }
  v15 = v17;
  v6 = 4294960568;
LABEL_47:
  v30 = (int)v6;
  v46 = NSLocalizedDescriptionKey;
  v31 = objc_msgSend(v11[26], "stringWithUTF8String:", DebugGetErrorString(v6, 0, 0));
  v32 = objc_claimAutoreleasedReturnValue(v31);
  v33 = (void *)v32;
  v34 = CFSTR("?");
  if (v32)
    v34 = (const __CFString *)v32;
  v47 = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v30, v35));
  -[SDAppleIDIdentityRequest _responseHandlerWithIdentity:error:](self, "_responseHandlerWithIdentity:error:", 0, v36);

  v17 = v15;
  v25 = v39;
  v37 = v40;
LABEL_50:

}

- (void)_handleCreateTimerFired
{
  OS_dispatch_source *createDelayTimer;
  NSObject *v4;
  OS_dispatch_source *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B2148 <= 20 && (dword_1007B2148 != -1 || _LogCategory_Initialize(&dword_1007B2148, 20)))
    LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _handleCreateTimerFired]", 20, "Create timer fired\n");
  createDelayTimer = self->_createDelayTimer;
  if (createDelayTimer)
  {
    v4 = createDelayTimer;
    dispatch_source_cancel(v4);
    v5 = self->_createDelayTimer;
    self->_createDelayTimer = 0;

  }
  -[SDAppleIDIdentityRequest _sendCreateCertificateRequest](self, "_sendCreateCertificateRequest");
}

- (void)_handleFetchTimerFired
{
  OS_dispatch_source *fetchDelayTimer;
  NSObject *v4;
  OS_dispatch_source *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B2148 <= 20 && (dword_1007B2148 != -1 || _LogCategory_Initialize(&dword_1007B2148, 20)))
    LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _handleFetchTimerFired]", 20, "Fetch timer fired\n");
  fetchDelayTimer = self->_fetchDelayTimer;
  if (fetchDelayTimer)
  {
    v4 = fetchDelayTimer;
    dispatch_source_cancel(v4);
    v5 = self->_fetchDelayTimer;
    self->_fetchDelayTimer = 0;

  }
  -[SDAppleIDIdentityRequest _sendFetchCertificateRequest](self, "_sendFetchCertificateRequest");
}

- (void)_handleReceivedCertificate
{
  uint64_t v3;
  uint64_t v4;
  NSString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  CFTypeRef v11;
  OS_dispatch_queue *dispatchQueue;
  _QWORD v13[7];
  CFTypeRef v14;
  CFTypeRef cf;
  NSErrorUserInfoKey v16;
  const __CFString *v17;
  _QWORD v18[2];

  v14 = 0;
  cf = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_appleID)
  {
    v3 = 4294960587;
    goto LABEL_5;
  }
  v3 = SFAppleIDCreateCertificateWithPEMString(self->_certificatePEM, &cf);
  if ((_DWORD)v3)
  {
LABEL_5:
    v4 = (int)v3;
    v16 = NSLocalizedDescriptionKey;
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v3, 0, 0));
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)v6;
    v8 = CFSTR("?");
    if (v6)
      v8 = (const __CFString *)v6;
    v17 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v4, v9));
    -[SDAppleIDIdentityRequest _responseHandlerWithIdentity:error:](self, "_responseHandlerWithIdentity:error:", 0, v10);

    goto LABEL_8;
  }
  if (!cf)
    goto LABEL_21;
  v3 = SFAppleIDCreateCertificateWithPEMString(self->_intermediateCertificatePEM, &v14);
  if ((_DWORD)v3)
    goto LABEL_5;
  if (!v14)
  {
LABEL_21:
    v3 = 4294960534;
    goto LABEL_5;
  }
  v18[0] = cf;
  v18[1] = v14;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
  if (cf)
    CFRetain(cf);
  if (v14)
  {
    CFRetain(v14);
    v11 = v14;
  }
  else
  {
    v11 = 0;
  }
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001266F4;
  v13[3] = &unk_1007180B0;
  v13[4] = self;
  v13[5] = cf;
  v13[6] = v11;
  SFAppleIDVerifyCertificateChain(v7, dispatchQueue, v13);
LABEL_8:

  if (cf)
    CFRelease(cf);
  if (v14)
    CFRelease(v14);
}

- (void)_handleKeyPairAvailable
{
  NSString *csrPEM;
  NSString **p_csrPEM;
  void *v5;
  void *v6;
  SDAppleIDServerTask *v7;
  SDAppleIDServerTask *certificateCreateTask;
  int v9;
  id v10;
  _QWORD v11[6];
  const __CFString *v12;
  NSString *v13;

  if (!self->_appleID)
  {
    v5 = 0;
    v9 = -6705;
    goto LABEL_9;
  }
  if (!self->_privateKey || !self->_publicKey || self->_certificateCreateTask)
  {
    v5 = 0;
    goto LABEL_14;
  }
  p_csrPEM = &self->_csrPEM;
  csrPEM = self->_csrPEM;
  if (!csrPEM)
  {
    v11[5] = 0;
    v9 = SFAppleIDCreateCertificateRequestPEMStringForKeyPair();
    v10 = 0;
    v5 = v10;
    if (v9)
    {
LABEL_9:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v9, 0));
      -[SDAppleIDIdentityRequest _responseHandlerWithIdentity:error:](self, "_responseHandlerWithIdentity:error:", 0, v6);
      goto LABEL_10;
    }
    if (v10)
    {
      objc_storeStrong((id *)&self->_csrPEM, 0);
      csrPEM = *p_csrPEM;
      goto LABEL_7;
    }
LABEL_14:
    v9 = -6762;
    goto LABEL_9;
  }
  v5 = 0;
LABEL_7:
  v12 = CFSTR("csr");
  v13 = csrPEM;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  v7 = -[SDAppleIDServerTask initWithType:appleID:info:]([SDAppleIDServerTask alloc], "initWithType:appleID:info:", 0, self->_appleID, v6);
  certificateCreateTask = self->_certificateCreateTask;
  self->_certificateCreateTask = v7;

  -[SDAppleIDServerTask setDispatchQueue:](self->_certificateCreateTask, "setDispatchQueue:", self->_dispatchQueue);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10012690C;
  v11[3] = &unk_1007180D8;
  v11[4] = self;
  -[SDAppleIDServerTask setResponseHandler:](self->_certificateCreateTask, "setResponseHandler:", v11);
  -[SDAppleIDServerTask activate](self->_certificateCreateTask, "activate");
LABEL_10:

}

- (void)_responseHandlerWithIdentity:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDIdentityRequest responseHandler](self, "responseHandler"));

  if (v7)
  {
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SDAppleIDIdentityRequest responseHandler](self, "responseHandler"));
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

    -[SDAppleIDIdentityRequest setResponseHandler:](self, "setResponseHandler:", 0);
  }

}

- (void)_scheduleCreateCertificateTaskWithDelay:(unint64_t)a3
{
  OS_dispatch_source *v5;
  OS_dispatch_source *createDelayTimer;
  NSObject *v7;
  _QWORD handler[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_createDelayTimer)
  {
    if (dword_1007B2148 <= 60
      && (dword_1007B2148 != -1 || _LogCategory_Initialize(&dword_1007B2148, 60)))
    {
      LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _scheduleCreateCertificateTaskWithDelay:]", 60, "### Create certificate task already scheduled\n");
    }
  }
  else
  {
    if (dword_1007B2148 <= 30
      && (dword_1007B2148 != -1 || _LogCategory_Initialize(&dword_1007B2148, 30)))
    {
      LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _scheduleCreateCertificateTaskWithDelay:]", 30, "Start create certificate delay timer for %ld seconds\n", a3);
    }
    v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    createDelayTimer = self->_createDelayTimer;
    self->_createDelayTimer = v5;

    v7 = self->_createDelayTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100126B10;
    handler[3] = &unk_1007146D8;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    SFDispatchTimerSet(self->_createDelayTimer, (double)a3, -1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_createDelayTimer);
  }
}

- (void)_scheduleFetchCertificateTaskWithDelay:(unint64_t)a3
{
  OS_dispatch_source *v5;
  OS_dispatch_source *fetchDelayTimer;
  NSObject *v7;
  _QWORD handler[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_fetchDelayTimer)
  {
    if (dword_1007B2148 <= 60
      && (dword_1007B2148 != -1 || _LogCategory_Initialize(&dword_1007B2148, 60)))
    {
      LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _scheduleFetchCertificateTaskWithDelay:]", 60, "### Fetch certificate task already scheduled\n");
    }
  }
  else
  {
    if (dword_1007B2148 <= 30
      && (dword_1007B2148 != -1 || _LogCategory_Initialize(&dword_1007B2148, 30)))
    {
      LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _scheduleFetchCertificateTaskWithDelay:]", 30, "Start fetch certificate delay timer for %ld seconds\n", a3);
    }
    v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    fetchDelayTimer = self->_fetchDelayTimer;
    self->_fetchDelayTimer = v5;

    v7 = self->_fetchDelayTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100126C74;
    handler[3] = &unk_1007146D8;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    SFDispatchTimerSet(self->_fetchDelayTimer, (double)a3, -1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_fetchDelayTimer);
  }
}

- (void)_scheduleCreateRetryWithDelay:(unint64_t)a3
{
  unint64_t createRetryCount;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  createRetryCount = self->_createRetryCount + 1;
  self->_createRetryCount = createRetryCount;
  if (dword_1007B2148 <= 50)
  {
    if (dword_1007B2148 == -1)
    {
      if (!_LogCategory_Initialize(&dword_1007B2148, 50))
        goto LABEL_5;
      createRetryCount = self->_createRetryCount;
    }
    LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _scheduleCreateRetryWithDelay:]", 50, "Scheduling create retry %d with delay %u seconds.\n", createRetryCount, a3);
  }
LABEL_5:
  -[SDAppleIDIdentityRequest _scheduleCreateCertificateTaskWithDelay:](self, "_scheduleCreateCertificateTaskWithDelay:", a3);
}

- (void)_scheduleFetchRetryWithDelay:(unint64_t)a3
{
  unint64_t fetchRetryCount;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  fetchRetryCount = self->_fetchRetryCount + 1;
  self->_fetchRetryCount = fetchRetryCount;
  if (dword_1007B2148 <= 50)
  {
    if (dword_1007B2148 == -1)
    {
      if (!_LogCategory_Initialize(&dword_1007B2148, 50))
        goto LABEL_5;
      fetchRetryCount = self->_fetchRetryCount;
    }
    LogPrintF(&dword_1007B2148, "-[SDAppleIDIdentityRequest _scheduleFetchRetryWithDelay:]", 50, "Scheduling fetch retry %d with delay %u seconds.\n", fetchRetryCount, a3);
  }
LABEL_5:
  -[SDAppleIDIdentityRequest _scheduleFetchCertificateTaskWithDelay:](self, "_scheduleFetchCertificateTaskWithDelay:", a3);
}

- (void)_sendCreateCertificateRequest
{
  void *v3;
  unsigned int v4;
  NSString *appleID;
  dispatch_queue_global_t global_queue;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_appleID)
  {
    if (self->_certificateCreateTask)
    {
      v8 = -6762;
    }
    else
    {
      if (self->_privateKey && self->_publicKey)
      {
        -[SDAppleIDIdentityRequest _handleKeyPairAvailable](self, "_handleKeyPairAvailable");
        return;
      }
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
      v4 = objc_msgSend(v3, "deviceWasUnlockedOnce");

      if (v4)
      {
        appleID = self->_appleID;
        global_queue = dispatch_get_global_queue(0, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100126F0C;
        v10[3] = &unk_100718128;
        v10[4] = self;
        SFAppleIDCreateKeyPair(appleID, v7, v10);

        return;
      }
      v8 = 201226;
    }
  }
  else
  {
    v8 = -6705;
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v8, 0));
  -[SDAppleIDIdentityRequest _responseHandlerWithIdentity:error:](self, "_responseHandlerWithIdentity:error:", 0, v9);

}

- (void)_sendFetchCertificateRequest
{
  NSString *certificateToken;
  void *v4;
  SDAppleIDServerTask *v5;
  SDAppleIDServerTask *certificateFetchTask;
  SDAppleIDServerTask *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  const __CFString *v11;
  NSString *v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_appleID)
  {
    v4 = 0;
    v8 = -6705;
    goto LABEL_10;
  }
  certificateToken = self->_certificateToken;
  if (!certificateToken || self->_certificateFetchTask)
  {
    v4 = 0;
    goto LABEL_8;
  }
  v11 = CFSTR("certificateToken");
  v12 = certificateToken;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v5 = -[SDAppleIDServerTask initWithType:appleID:info:]([SDAppleIDServerTask alloc], "initWithType:appleID:info:", 1, self->_appleID, v4);
  certificateFetchTask = self->_certificateFetchTask;
  self->_certificateFetchTask = v5;

  v7 = self->_certificateFetchTask;
  if (!v7)
  {
LABEL_8:
    v8 = -6762;
LABEL_10:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v8, 0));
    -[SDAppleIDIdentityRequest _responseHandlerWithIdentity:error:](self, "_responseHandlerWithIdentity:error:", 0, v9);

    goto LABEL_6;
  }
  -[SDAppleIDServerTask setDispatchQueue:](v7, "setDispatchQueue:", self->_dispatchQueue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100127290;
  v10[3] = &unk_1007180D8;
  v10[4] = self;
  -[SDAppleIDServerTask setResponseHandler:](self->_certificateFetchTask, "setResponseHandler:", v10);
  -[SDAppleIDServerTask activate](self->_certificateFetchTask, "activate");
LABEL_6:

}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001272F8;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (SDAppleIDIdentityRequest)initWithAppleID:(id)a3
{
  id v5;
  SDAppleIDIdentityRequest *v6;
  SDAppleIDIdentityRequest *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  OS_dispatch_queue *dispatchQueue;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SDAppleIDIdentityRequest;
  v6 = -[SDAppleIDIdentityRequest init](&v14, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_appleID, a3);
    v10 = SFMainQueue(v8, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = (OS_dispatch_queue *)v11;

  }
  return v7;
}

- (SDAppleIDIdentityRequest)initWithAppleID:(id)a3 certificateToken:(id)a4 privateKeyPersistentReference:(id)a5
{
  id v9;
  id v10;
  id v11;
  SDAppleIDIdentityRequest *v12;
  SDAppleIDIdentityRequest *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  OS_dispatch_queue *dispatchQueue;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SDAppleIDIdentityRequest;
  v12 = -[SDAppleIDIdentityRequest init](&v20, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_appleID, a3);
    objc_storeStrong((id *)&v13->_certificateToken, a4);
    objc_storeStrong((id *)&v13->_privateKeyPersistentReference, a5);
    v16 = SFMainQueue(v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    dispatchQueue = v13->_dispatchQueue;
    v13->_dispatchQueue = (OS_dispatch_queue *)v17;

  }
  return v13;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001274A8;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (NSString)appleID
{
  return self->_appleID;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (id)certificateTokenHandler
{
  return self->_certificateTokenHandler;
}

- (void)setCertificateTokenHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_certificateTokenHandler, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_privateKeyPersistentReference, 0);
  objc_storeStrong((id *)&self->_intermediateCertificatePEM, 0);
  objc_storeStrong((id *)&self->_fetchDelayTimer, 0);
  objc_storeStrong((id *)&self->_csrPEM, 0);
  objc_storeStrong((id *)&self->_createDelayTimer, 0);
  objc_storeStrong((id *)&self->_certificateToken, 0);
  objc_storeStrong((id *)&self->_certificateSerialNumber, 0);
  objc_storeStrong((id *)&self->_certificatePEM, 0);
  objc_storeStrong((id *)&self->_certificateFetchTask, 0);
  objc_storeStrong((id *)&self->_certificateExpirationDate, 0);
  objc_storeStrong((id *)&self->_certificateCreateTask, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end

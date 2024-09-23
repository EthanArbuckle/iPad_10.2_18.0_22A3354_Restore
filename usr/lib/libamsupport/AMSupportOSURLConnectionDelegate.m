@implementation AMSupportOSURLConnectionDelegate

- (AMSupportOSURLConnectionDelegate)init
{
  return -[AMSupportOSURLConnectionDelegate initWithData:Options:](self, "initWithData:Options:", objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", 0), 0);
}

- (AMSupportOSURLConnectionDelegate)initWithData:(id)a3 Options:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  AMSupportOSURLConnectionDelegate *v19;
  AMSupportOSURLConnectionDelegate *v20;
  NSMutableData *v21;
  FILE *v23;
  char *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  objc_super v32;
  char v33[16];
  char v34[32];
  char __symbol[32];
  char __path[56];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate initWithData:Options:]", (uint64_t)"init-ing delegate with data=%@ options=%@", (uint64_t)a4, v4, v5, v6, v7, (char)a3);
  if (!libSecurity)
  {
    strcpy(__path, "Security.framework/Versions/Current/Security");
    strcpy(__symbol, "kSecImportExportPassphrase");
    strcpy(v34, "kSecImportItemIdentity");
    strcpy(v33, "SecPKCS12Import");
    v11 = dlopen(__path, 261);
    v12 = v11;
    if (v11)
    {
      dlhandle_kSecImportExportPassphrase = (uint64_t)dlsym(v11, __symbol);
      dlhandle_kSecImportItemIdentity = (uint64_t)dlsym(v12, v34);
      v13 = dlsym(v12, v33);
      dlhandle_SecPKCS12Import = v13;
      if (dlhandle_kSecImportExportPassphrase && dlhandle_kSecImportItemIdentity && v13)
      {
LABEL_6:
        libSecurity = (uint64_t)v12;
        goto LABEL_7;
      }
      AMSupportLogInternal(3, (uint64_t)"libAMSupportLoadLibrary", (uint64_t)"Missing symbols.", v14, v15, v16, v17, v18, v31);
    }
    else
    {
      v23 = (FILE *)*MEMORY[0x24BDAC8D8];
      v24 = dlerror();
      fprintf(v23, "failed to load %s: %s\n", __path, v24);
    }
    v25 = dlerror();
    AMSupportLogInternal(3, (uint64_t)"libAMSupportLoadLibrary", (uint64_t)"Security Framework does not have expected symbols, aborting. %s", v26, v27, v28, v29, v30, v25);
    if (v12)
    {
      dlclose(v12);
      v12 = 0;
    }
    goto LABEL_6;
  }
LABEL_7:
  v32.receiver = self;
  v32.super_class = (Class)AMSupportOSURLConnectionDelegate;
  v19 = -[AMSupportOSURLConnectionDelegate init](&v32, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->requestComplete = 0;
    v19->options = (NSDictionary *)a4;
    v20->response = 0;
    v21 = (NSMutableData *)a3;
    v20->_data = v21;
    -[NSMutableData setLength:](v21, "setLength:", 0);
  }
  return v20;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate dealloc]", (uint64_t)"dealloc-ing delegate", v2, v3, v4, v5, v6, v8);
  if (libSecurity)
  {
    dlclose((void *)libSecurity);
    libSecurity = 0;
  }

  self->response = 0;
  self->_data = 0;

  self->_error = 0;
  v9.receiver = self;
  v9.super_class = (Class)AMSupportOSURLConnectionDelegate;
  -[AMSupportOSURLConnectionDelegate dealloc](&v9, sel_dealloc);
}

- (id)waitForResponseOrError:(id *)a3
{
  uint64_t v5;
  void *v6;
  NSError *error;
  NSError *v8;
  id result;

  v5 = *MEMORY[0x24BDBCA90];
  do
  {
    if (self->requestComplete)
      break;
    v6 = (void *)objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  }
  while ((objc_msgSend(v6, "runMode:beforeDate:", v5, objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture")) & 1) != 0);
  error = self->_error;
  if (!error)
    return self->response;
  if (!a3)
    return 0;
  v8 = error;
  result = 0;
  *a3 = v8;
  return result;
}

- (void)connection:(id)a3 willSendRequestForAuthenticationChallenge:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFData *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  CFDictionaryRef v31;
  char Length;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  char isKindOfClass;
  id v54;
  const __CFDictionary *ValueAtIndex;
  __SecIdentity *Value;
  CFArrayRef v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const __CFAllocator *v68;
  uint64_t i;
  const __CFData *v70;
  SecCertificateRef v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  SecCertificateRef v77;
  __SecTrust *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  char v96;
  char v97;
  char v98;
  char v99;
  char v100;
  id v101;
  SecCertificateRef certificateRef;
  CFArrayRef theArray;
  _BYTE v104[128];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  void *v109;
  void *values;
  void *keys[3];
  char v112;

  keys[1] = *(void **)MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend((id)objc_msgSend(a4, "protectionSpace", a3), "authenticationMethod");
  AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"Authentication challenge received.  Method: %@", v7, v8, v9, v10, v11, (char)v6);
  if (objc_msgSend(a4, "previousFailureCount") >= 1)
  {
    objc_msgSend((id)objc_msgSend(a4, "sender"), "cancelAuthenticationChallenge:", a4);
    AMSupportLogInternal(3, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"Multiple challenge failures.  Aborting.", v12, v13, v14, v15, v16, v112);
    return;
  }
  if (objc_msgSend(v6, "isEqual:", *MEMORY[0x24BDB73D8])
    && -[NSDictionary objectForKey:](self->options, "objectForKey:", CFSTR("ClientIdentity")))
  {
    AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"Received client certificate challenge.", v17, v18, v19, v20, v21, v96);
    if (!libSecurity)
    {
      AMSupportLogInternal(3, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"Security framework (10.6?) unsupported in libamsupport.", v22, v23, v24, v25, v26, v97);
      objc_msgSend((id)objc_msgSend(a4, "sender"), "cancelAuthenticationChallenge:", a4);
      return;
    }
    v27 = -[NSDictionary objectForKey:](self->options, "objectForKey:", CFSTR("ClientIdentity"));
    theArray = 0;
    v28 = -[NSDictionary objectForKey:](self->options, "objectForKey:", CFSTR("ClientIdentityPassphrase"));
    v29 = &stru_24C381C40;
    v30 = *(void **)dlhandle_kSecImportExportPassphrase;
    if (v28)
      v29 = v28;
    values = v29;
    keys[0] = v30;
    v31 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, 0, 0);
    Length = CFDataGetLength(v27);
    AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"P12 Identity data length=%d", v33, v34, v35, v36, v37, Length);
    v38 = dlhandle_SecPKCS12Import(v27, v31, &theArray);
    CFRelease(v31);
    if (!v38)
    {
      AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"Successfully imported PKCS12 identity", v39, v40, v41, v42, v43, v98);
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, 0);
      Value = (__SecIdentity *)CFDictionaryGetValue(ValueAtIndex, *(const void **)dlhandle_kSecImportItemIdentity);
      certificateRef = 0;
      SecIdentityCopyCertificate(Value, &certificateRef);
      v109 = certificateRef;
      v57 = CFArrayCreate(0, (const void **)&v109, 1, 0);
      CFRelease(certificateRef);
      v58 = objc_msgSend(MEMORY[0x24BDB7480], "credentialWithIdentity:certificates:persistence:", Value, v57, 2);
      CFRelease(v57);
      objc_msgSend((id)objc_msgSend(a4, "sender"), "useCredential:forAuthenticationChallenge:", v58, a4);
      AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"Returned credentials for challenge.", v59, v60, v61, v62, v63, v99);
      return;
    }
    AMSupportLogInternal(3, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"Unable to import client identity, aborting challenge.", v39, v40, v41, v42, v43, v98);
    v44 = (void *)objc_msgSend(a4, "sender");
    v45 = a4;
    goto LABEL_36;
  }
  if ((objc_msgSend(v6, "isEqual:", *MEMORY[0x24BDB7410]) & 1) == 0)
    goto LABEL_18;
  v46 = -[NSDictionary objectForKey:](self->options, "objectForKey:", CFSTR("DisableSSLValidation"));
  if (objc_msgSend(v46, "isEqual:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1)))
  {
    AMSupportLogInternal(6, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"SSL validation disabled.  Attempting to continue without authentication.", v47, v48, v49, v50, v51, v96);
    v52 = (void *)objc_msgSend(a4, "sender");
    objc_msgSend(v52, "useCredential:forAuthenticationChallenge:", objc_msgSend(MEMORY[0x24BDB7480], "credentialForTrust:", objc_msgSend((id)objc_msgSend(a4, "protectionSpace"), "serverTrust")), a4);
    return;
  }
  -[NSDictionary objectForKey:](self->options, "objectForKey:", CFSTR("TrustedServerCAs"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[NSDictionary objectForKey:](self->options, "objectForKey:", CFSTR("TrustedServerCAs"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_18:
      objc_msgSend((id)objc_msgSend(a4, "sender"), "performDefaultHandlingForAuthenticationChallenge:", a4);
      return;
    }
  }
  -[NSDictionary objectForKey:](self->options, "objectForKey:", CFSTR("TrustedServerCAs"));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v54 = -[NSDictionary objectForKey:](self->options, "objectForKey:", CFSTR("TrustedServerCAs"));
  v101 = a4;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v54 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", -[NSDictionary objectForKey:](self->options, "objectForKey:", CFSTR("TrustedServerCAs")));
    else
      v54 = 0;
  }
  v64 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v54, "count"));
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v65 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v105, v104, 16);
  if (v65)
  {
    v66 = v65;
    v67 = *(_QWORD *)v106;
    v68 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    do
    {
      for (i = 0; i != v66; ++i)
      {
        if (*(_QWORD *)v106 != v67)
          objc_enumerationMutation(v54);
        v70 = *(const __CFData **)(*((_QWORD *)&v105 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v71 = SecCertificateCreateWithData(v68, v70);
          if (v71)
          {
            v77 = v71;
            objc_msgSend(v64, "addObject:", v71);
            CFRelease(v77);
          }
          else
          {
            AMSupportLogInternal(4, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"trusted certificate could not be loaded %@", v72, v73, v74, v75, v76, (char)v70);
          }
        }
      }
      v66 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v105, v104, 16);
    }
    while (v66);
  }
  v78 = (__SecTrust *)objc_msgSend((id)objc_msgSend(v101, "protectionSpace"), "serverTrust");
  LODWORD(theArray) = 0;
  AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"Attempting trust evaluate", v79, v80, v81, v82, v83, v96);
  v89 = AMSupportX509ChainEvaluateTrust(v78, (CFArrayRef)v64, &theArray, v84, v85, v86, v87, v88);
  if (v89)
  {
    AMSupportLogInternal(3, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"trust evaluation failed (OSStatus=%d)", v90, v91, v92, v93, v94, v89);
LABEL_35:
    v44 = (void *)objc_msgSend(v101, "sender");
    v45 = v101;
LABEL_36:
    objc_msgSend(v44, "cancelAuthenticationChallenge:", v45);
    return;
  }
  if ((_DWORD)theArray != 4 && (_DWORD)theArray != 1)
  {
    AMSupportLogInternal(4, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"trust evaluation did not result in okay to proceed (result=%d)", v90, v91, v92, v93, v94, (char)theArray);
    goto LABEL_35;
  }
  AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"Trust evaluation succeeded, proceeding..", v90, v91, v92, v93, v94, v100);
  v95 = (void *)objc_msgSend(v101, "sender");
  objc_msgSend(v95, "useCredential:forAuthenticationChallenge:", objc_msgSend(MEMORY[0x24BDB7480], "credentialForTrust:", v78), v101);
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  NSURLResponse *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = (NSURLResponse *)a4;
  self->response = v5;
  AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:didReceiveResponse:]", (uint64_t)"Received response from URL: %@", v6, v7, v8, v9, v10, (char)v5);
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = objc_msgSend(a4, "length", a3);
  AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:didReceiveData:]", (uint64_t)"Receiving %d bytes of data from URL", v7, v8, v9, v10, v11, v6);
  -[NSMutableData appendData:](self->_data, "appendData:", a4);
}

- (void)connectionDidFinishLoading:(id)a3
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = -[NSMutableData length](self->_data, "length", a3);
  AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate connectionDidFinishLoading:]", (uint64_t)"Finished loading URL.  Total bytes: %d", v5, v6, v7, v8, v9, v4);
  self->requestComplete = 1;
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  char v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = (char)a4;
  self->_error = (NSError *)a4;
  AMSupportLogInternal(3, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:didFailWithError:]", (uint64_t)"Connection error %@ for URL", v6, v7, v8, v9, v10, v4);
  self->requestComplete = 1;
}

- (NSData)data
{
  return &self->_data->super;
}

- (NSError)error
{
  return self->_error;
}

@end

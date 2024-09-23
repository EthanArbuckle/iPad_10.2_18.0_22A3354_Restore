@implementation APProxyURLUtilities

+ (BOOL)shouldProxyRequestToHost:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char shouldProxyRequestToHost;

  v4 = a3;
  if (!objc_msgSend_isAppleInternalInstall(MEMORY[0x24BDFD4B8], v5, v6, v7, v8))
    goto LABEL_6;
  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v13, v14, (uint64_t)CFSTR("APProxyURLMockSettings.proxyDisabled"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17 || (objc_msgSend_BOOLValue(v17, v18, v19, v20, v21) & 1) == 0)
  {

LABEL_6:
    shouldProxyRequestToHost = objc_msgSend__shouldProxyRequestToHost_(a1, v9, (uint64_t)v4, v11, v12);
    goto LABEL_7;
  }

  shouldProxyRequestToHost = 0;
LABEL_7:

  return shouldProxyRequestToHost;
}

+ (BOOL)_shouldProxyRequestToHost:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;

  v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6, v7))
  {
    objc_msgSend_lowercaseString(v3, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v12, v13, (uint64_t)CFSTR("localhost"), v14, v15) & 1) != 0
      || (objc_msgSend_isEqualToString_(v12, v16, (uint64_t)CFSTR("apple.com"), v17, v18) & 1) != 0
      || (objc_msgSend_hasSuffix_(v12, v19, (uint64_t)CFSTR(".apple.com"), v20, v21) & 1) != 0
      || (objc_msgSend_isEqualToString_(v12, v22, (uint64_t)CFSTR("qwapi.com"), v23, v24) & 1) != 0
      || (objc_msgSend_hasSuffix_(v12, v25, (uint64_t)CFSTR(".qwapi.com"), v26, v27) & 1) != 0
      || (objc_msgSend_isEqualToString_(v12, v28, (uint64_t)CFSTR("mzstatic.com"), v29, v30) & 1) != 0)
    {
      LOBYTE(v34) = 0;
    }
    else
    {
      v34 = objc_msgSend_hasSuffix_(v12, v31, (uint64_t)CFSTR(".mzstatic.com"), v32, v33) ^ 1;
    }

  }
  else
  {
    LOBYTE(v34) = 0;
  }

  return v34;
}

+ (id)composeUserAgentString:(id)a3 adIdentifier:(id)a4 maxRequestCount:(int64_t)a5
{
  __CFString *v7;
  __CFString *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v7 = (__CFString *)a3;
  if (v7)
    v8 = v7;
  else
    v8 = &stru_24F4E1D48;
  v9 = a4;
  objc_msgSend_componentsSeparatedByString_(v8, v10, (uint64_t)CFSTR("##"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByAppendingFormat_(v18, v19, (uint64_t)CFSTR("##%@##%@##%@##%ld"), v20, v21, CFSTR("ad-x-identifier"), v9, CFSTR("max-request-count"), a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (void)changeSchemeTo:(int64_t)a3 forUrlRequest:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v5 = a4;
  objc_msgSend_URL(v5, v6, v7, v8, v9);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_changeSchemeTo_(v17, v10, a3, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setURL_(v5, v14, (uint64_t)v13, v15, v16);

}

+ (id)proxyURLForVideoURL:(id)a3 adIdentifier:(id)a4 changeScheme:(BOOL)a5
{
  return (id)MEMORY[0x24BEDD108](a1, sel__proxyURLForVideoURL_adIdentifier_changeScheme_, a3, a4, a5);
}

+ (id)_proxyURLForVideoURL:(id)a3 adIdentifier:(id)a4 changeScheme:(BOOL)a5
{
  _BOOL4 v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a5;
  objc_msgSend_setQueryItem_forKey_(a3, a2, (uint64_t)a4, (uint64_t)CFSTR("videoAdvertisingIdentifier"), a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  if (v5)
  {
    if (objc_msgSend_isHTTP(v6, v7, v8, v9, v10))
      objc_msgSend_changeSchemeTo_(v11, v12, 1, v13, v14);
    else
      objc_msgSend_changeSchemeTo_(v11, v12, 2, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v15;
  }
  return v11;
}

@end

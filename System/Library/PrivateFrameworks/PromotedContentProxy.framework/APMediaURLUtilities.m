@implementation APMediaURLUtilities

+ (id)proxyURLForURL:(id)a3 adIdentifier:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int shouldProxyRequestToHost;
  const char *v16;
  id v17;
  void *v18;

  v5 = a3;
  v10 = a4;
  if (v5)
  {
    objc_msgSend_host(v5, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    shouldProxyRequestToHost = objc_msgSend_shouldProxyRequestToHost_(APProxyURLUtilities, v12, (uint64_t)v11, v13, v14);

    if (shouldProxyRequestToHost)
    {
      objc_msgSend_proxyURLForVideoURL_adIdentifier_changeScheme_(APProxyURLUtilities, v16, (uint64_t)v5, (uint64_t)v10, 1);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = v5;
    }
    v18 = v17;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end

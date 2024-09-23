@implementation NSMutableURLRequest

+ (id)_gkHTTPRequestWithURL:(id)a3 postData:(id)a4 protocolVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "_gkIsValidServerURL"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
    objc_msgSend(v11, "operationTimeout");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "requestWithURL:cachePolicy:timeoutInterval:", v8, 1));

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v12, "setLocale:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  objc_msgSend(v12, "setInternal:", objc_msgSend(v13, "useInternalHeader"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKDevice currentDevice](GKDevice, "currentDevice"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userAgentWithProcessName:protocolVersion:", CFSTR("gamed"), v10));

  objc_msgSend(v12, "setHTTPUserAgent:", v15);
  objc_msgSend(v12, "setHTTPShouldHandleCookies:", 0);
  if (v9)
  {
    objc_msgSend(v12, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("content-type"));
    objc_msgSend(v12, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v12, "setHTTPBody:", v9);
  }
  else
  {
    objc_msgSend(v12, "setHTTPMethod:", CFSTR("GET"));
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
  objc_msgSend(v12, "setValue:forHTTPHeaderField:", v17, CFSTR("X-Apple-Request-UUID"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "testRunID"));

  if (v19)
    objc_msgSend(v12, "setValue:forHTTPHeaderField:", v19, CFSTR("x-gk-test-run-id"));

  return v12;
}

@end

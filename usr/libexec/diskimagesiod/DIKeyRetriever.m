@implementation DIKeyRetriever

+ (id)newACEndpointWithEnvironment:(id)a3 error:(id *)a4
{
  id v5;
  const __CFString *v6;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", CFSTR("uat")) & 1) != 0)
  {
    v6 = CFSTR("saks-ac-uat.g.apple.com");
  }
  else if ((objc_msgSend(v5, "isEqual:", CFSTR("prod")) & 1) != 0)
  {
    v6 = CFSTR("saks-ac-prod.g.apple.com");
  }
  else if ((objc_msgSend(v5, "isEqual:", CFSTR("dev")) & 1) != 0)
  {
    v6 = CFSTR("saks-ac-dev.g.apple.com");
  }
  else
  {
    v6 = (const __CFString *)objc_claimAutoreleasedReturnValue(+[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Not valid SAKS environment"), a4));
  }

  return (id)v6;
}

+ (id)newDawTokenWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPipe pipe](NSPipe, "pipe"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileHandleForReading"));
  v6 = objc_alloc_init((Class)NSTask);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/usr/local/bin/appleconnect")));
  objc_msgSend(v6, "setExecutableURL:", v7);

  objc_msgSend(v6, "setArguments:", &off_100196A20);
  objc_msgSend(v6, "setStandardOutput:", v4);
  if ((objc_msgSend(v6, "launchAndReturnError:", a3) & 1) != 0)
  {
    objc_msgSend(v6, "waitUntilExit");
    if (objc_msgSend(v6, "terminationStatus"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Could not generate daw token - AppleConnect Failure"), a3));
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "readDataToEndOfFileAndReturnError:", a3));
      if (v9)
      {
        v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v9, 4);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11));

      }
      else
      {
        v8 = 0;
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)newSessionWithError:(id *)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  void *v10;

  v3 = objc_msgSend(a1, "newDawTokenWithError:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Bearer %@"), v3, CFSTR("Authorization")));
    v10 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    objc_msgSend(v4, "setHTTPAdditionalHeaders:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](NSURLSession, "sessionWithConfiguration:", v4));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)hintFormat:(id)a3
{
  if (objc_msgSend(a3, "hasPrefix:", CFSTR("<")))
    return CFSTR("plist");
  else
    return CFSTR("json");
}

+ (id)requestSynchronousDataWithRequest:(id)a3 session:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t, void *);
  void *v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100083C88;
  v21 = sub_100083C98;
  v22 = 0;
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_100083CA0;
  v14 = &unk_10017EAE0;
  v16 = &v17;
  v7 = dispatch_semaphore_create(0);
  v15 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataTaskWithRequest:completionHandler:", v5, &v11));
  objc_msgSend(v8, "resume", v11, v12, v13, v14);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v9 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v9;
}

+ (id)jsonResponseWithRequest:(id)a3 session:(id)a4 error:(id *)a5
{
  void *v6;
  uint64_t v7;
  void *v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "requestSynchronousDataWithRequest:session:", a3, a4));
  if (v6)
    v7 = objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 0, a5));
  else
    v7 = objc_claimAutoreleasedReturnValue(+[DIError nilWithEnumValue:verboseInfo:error:](DIError, "nilWithEnumValue:verboseInfo:error:", 150, CFSTR("AEA key retrieval failed"), a5));
  v8 = (void *)v7;

  return v8;
}

+ (id)postRequestWithURL:(id)a3 session:(id)a4 data:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", a3));
  objc_msgSend(v12, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v12, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  if (v11)
    objc_msgSend(v12, "setHTTPBody:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "jsonResponseWithRequest:session:error:", v12, v10, a6));

  return v13;
}

+ (id)getRequestWithURL:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", a3));
  objc_msgSend(v6, "setValue:forHTTPHeaderField:", CFSTR("application/octet-stream"), CFSTR("Content-Type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](NSURLSession, "sharedSession"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "requestSynchronousDataWithRequest:session:", v6, v7));

  if (!v8)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[DIError nilWithEnumValue:verboseInfo:error:](DIError, "nilWithEnumValue:verboseInfo:error:", 150, CFSTR("AEA key retrieval failed"), a4));

  return v8;
}

+ (id)newEnvWithDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Not valid SAKS metadata (json format expected)"), a4));
    goto LABEL_5;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("metadata")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("environment")));

  if (!v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Not valid SAKS metadata (no environment field)"), a4));
LABEL_5:
    v8 = (void *)v9;
  }

  return v8;
}

+ (id)newUrl:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("https://%@/v1/ac/decrypt"), a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));

  return v4;
}

+ (BOOL)writeHexKeyToBuffer:(char *)a3 hexKey:(id)a4 error:(id *)a5
{
  id v7;
  const char *v8;
  size_t v9;
  uint64_t v10;
  const char *v11;
  char v12;
  BOOL v13;
  void *v14;
  _QWORD *exception;
  const std::error_category *v17;
  char __str[2];
  char v19;

  v7 = objc_retainAutorelease(a4);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");
  v9 = strnlen(v8, 0x41uLL);
  if (v9 == 64)
  {
    if (strlen(v8) != 64)
    {
      v11 = "Key is not 32 bytes size.";
LABEL_11:
      exception = __cxa_allocate_exception(0x40uLL);
      *exception = &off_1001924F8;
      v17 = std::generic_category();
      exception[1] = 22;
      exception[2] = v17;
      *((_BYTE *)exception + 24) = 0;
      *((_BYTE *)exception + 48) = 0;
      exception[7] = v11;
    }
    v10 = 0;
    v19 = 0;
    v11 = "Key is not hexadecimal number.";
    do
    {
      *(_WORD *)__str = *(_WORD *)&v8[2 * v10];
      v12 = strtol(__str, 0, 16);
      a3[v10] = v12;
      if (!v12 && *(unsigned __int16 *)__str != 12336)
        goto LABEL_11;
      ++v10;
    }
    while (v10 != 32);
    v13 = 1;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid size hex key %lu"), v9));
    v13 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, v14, a5);

  }
  return v13;
}

+ (BOOL)KKMSKeyWithURL:(id)a3 destKey:(char *)a4 destKeySize:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  BOOL v18;

  v9 = a3;
  v10 = +[DIKeyRetriever newSessionWithError:](DIKeyRetriever, "newSessionWithError:", a6);
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("decryption-components")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[DIKeyRetriever postRequestWithURL:session:data:error:](DIKeyRetriever, "postRequestWithURL:session:data:error:", v11, v10, 0, a6));
    v13 = v12;
    if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("encryption")));
      v15 = v14;
      if (v14)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("key")));
        if (v16)
          v17 = objc_msgSend(a1, "writeHexKeyToBuffer:hexKey:error:", a4, v16, a6);
        else
          v17 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Missing key in KKMS response"), a6);
        v18 = v17;

      }
      else
      {
        v18 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Missing key in KKMS response"), a6);
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)WKMSKeyWithURL:(id)a3 authData:(const AuthData *)a4 destKey:(char *)a5 destKeySize:(unint64_t)a6 error:(id *)a7
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _OWORD *v17;
  __int128 v18;
  BOOL v19;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[DIKeyRetriever getRequestWithURL:error:](DIKeyRetriever, "getRequestWithURL:error:", a3, a7, a5, a6));
  if (v10)
  {
    v11 = frk_metadata_from_aea_auth_data(a4->var0, a7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if (v12)
    {
      v14 = frk_unwrapped_symmetric_key_with_shipping_private_key(v12, v10, a7);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = v15;
      if (v15)
      {
        if (objc_msgSend(v15, "length") == (id)32)
        {
          v17 = objc_msgSend(objc_retainAutorelease(v16), "bytes");
          v18 = v17[1];
          *(_OWORD *)a5 = *v17;
          *((_OWORD *)a5 + 1) = v18;
          v19 = 1;
        }
        else
        {
          v19 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Invalid key size"), a7);
        }
      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (BOOL)decryptKeyWithData:(id)a3 destKey:(char *)a4 destKeySize:(unint64_t)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  BOOL v17;
  __CFString *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  const char *v26;
  size_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  void *v34;
  id v35;
  char *v36;
  id v37;
  id v38;

  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "hintFormat:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataUsingEncoding:", 4));
  v12 = v9;
  if (objc_msgSend(v10, "isEqual:", CFSTR("plist")))
  {
    v13 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v11, 0, 0, a6));
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v13, 1, a6)));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", objc_msgSend(v14, "bytes")));

    v16 = (void *)v13;
    if (!v13)
    {
LABEL_3:
      v17 = 0;
      v18 = CFSTR("dev");
      goto LABEL_25;
    }
  }
  else
  {
    v15 = v12;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v11, 0, a6));
    if (!v16)
      goto LABEL_3;
  }
  v18 = +[DIKeyRetriever newEnvWithDictionary:error:](DIKeyRetriever, "newEnvWithDictionary:error:", v16, a6);
  if (v18)
  {
    v36 = a4;
    v19 = +[DIKeyRetriever newACEndpointWithEnvironment:error:](DIKeyRetriever, "newACEndpointWithEnvironment:error:", v18, a6);
    if (v19)
    {
      v20 = +[DIKeyRetriever newSessionWithError:](DIKeyRetriever, "newSessionWithError:", a6);
      if (v20)
      {
        v38 = v20;
        v35 = v19;
        v37 = +[DIKeyRetriever newUrl:](DIKeyRetriever, "newUrl:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dataUsingEncoding:", 4));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[DIKeyRetriever postRequestWithURL:session:data:error:](DIKeyRetriever, "postRequestWithURL:session:data:error:", v37, v38, v21, a6));

        if (v22)
        {
          v34 = v22;
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("key")));
          if (v23)
          {
            v24 = v23;
            v25 = (const char *)objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
            v26 = v25;
            if (v25)
            {
              v27 = strnlen(v25, 0x59uLL);
              if (v27 == 88)
              {
                v28 = *((_OWORD *)v26 + 1);
                *(_OWORD *)v36 = *(_OWORD *)v26;
                *((_OWORD *)v36 + 1) = v28;
                v29 = *((_OWORD *)v26 + 2);
                v30 = *((_OWORD *)v26 + 3);
                v31 = *((_OWORD *)v26 + 4);
                *((_QWORD *)v36 + 10) = *((_QWORD *)v26 + 10);
                *((_OWORD *)v36 + 3) = v30;
                *((_OWORD *)v36 + 4) = v31;
                *((_OWORD *)v36 + 2) = v29;
                v17 = 1;
              }
              else
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid size of saks response %lu"), v27));
                v17 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, v32, a6);

              }
            }
            else
            {
              v17 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Missing key in SAKS response"), a6);
            }
            v19 = v35;
          }
          else
          {
            v24 = 0;
            v19 = v35;
            v17 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Bad or missing key in SAKS response."), a6);
          }

          v22 = v34;
        }
        else
        {
          v17 = 0;
          v19 = v35;
        }

        v20 = v38;
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }
LABEL_25:

  return v17;
}

@end

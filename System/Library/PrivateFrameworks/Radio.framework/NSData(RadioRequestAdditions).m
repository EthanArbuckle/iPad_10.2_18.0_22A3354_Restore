@implementation NSData(RadioRequestAdditions)

+ (id)dataForRadioRequestParameters:()RadioRequestAdditions protocolVersion:isAsynchronousBackgroundRequest:error:
{
  objc_class *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v9 = (objc_class *)MEMORY[0x24BDBCED8];
  v10 = a3;
  v11 = [v9 alloc];
  if (a5)
    v12 = 3;
  else
    v12 = 2;
  v13 = (void *)objc_msgSend(v11, "initWithCapacity:", v12);
  v14 = v13;
  if (v10)
    v15 = v10;
  else
    v15 = (id)MEMORY[0x24BDBD1B8];
  objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("content"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("version"));

  if (a5)
    objc_msgSend(v14, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("is-async"));
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v14, 200, 0, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (uint64_t)dataForRadioRequestParameters:()RadioRequestAdditions isAsynchronousBackgroundRequest:error:
{
  return objc_msgSend(a1, "dataForRadioRequestParameters:protocolVersion:isAsynchronousBackgroundRequest:error:", a3, 3, a4, a5);
}

- (uint64_t)propertyListForRadioResponseReturningError:()RadioRequestAdditions
{
  return objc_msgSend(a1, "propertyListForRadioResponseReturningError:unparsedResponseDictionary:", a3, 0);
}

- (id)propertyListForRadioResponseReturningError:()RadioRequestAdditions unparsedResponseDictionary:
{
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a1, 0, 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v6);
    objc_msgSend(v6, "objectForKey:", CFSTR("version"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && (int)objc_msgSend(v8, "intValue") >= 1)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("content"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v12 = 138412546;
        v13 = v8;
        v14 = 2112;
        v15 = (id)objc_opt_class();
        v10 = v15;
        _os_log_impl(&dword_2105F8000, v9, OS_LOG_TYPE_ERROR, "Error: Unsupported response protocol version: %@ (%@)", (uint8_t *)&v12, 0x16u);

      }
      if (a3)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("RadioErrorDomain"), -100, 0);
        v7 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
    }

  }
  return v7;
}

@end

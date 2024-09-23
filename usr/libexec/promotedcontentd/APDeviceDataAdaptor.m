@implementation APDeviceDataAdaptor

+ (id)identifier
{
  return CFSTR("com.apple.ap.device");
}

+ (id)validClassInputs
{
  if (qword_1002687D8 != -1)
    dispatch_once(&qword_1002687D8, &stru_1002131E8);
  return (id)qword_1002687D0;
}

- (void)_run:(id)a3
{
  void (**v4)(id, void *, _QWORD, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSErrorUserInfoKey v14;
  const __CFString *v15;

  v4 = (void (**)(id, void *, _QWORD, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("class")));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("class")));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APDeviceDataAdaptor deviceClass](self, "deviceClass"));
    if (v9)
    {
      v10 = (uint64_t)objc_msgSend(v8, "containsObject:", v9);
      v11 = 0;
    }
    else
    {
      v14 = NSLocalizedDescriptionKey;
      v15 = CFSTR("Unable to determine device class");
      v10 = 1;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.dataadaptors"), 5207, v12));

    }
  }
  else
  {
    v11 = 0;
    v10 = 1;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10));
  v4[2](v4, v13, 0, v11);

}

- (BOOL)_validateParameters:(id *)a3
{
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)APDeviceDataAdaptor;
  if (!-[APDataAdaptor _validateParameters:](&v14, "_validateParameters:"))
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("class")));
  v7 = -[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v6, CFSTR("class"), objc_opt_class(NSArray), a3);

  if (!v7)
    return 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("class")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceDataAdaptor validClassInputs](APDeviceDataAdaptor, "validClassInputs"));
  v12 = objc_msgSend(v10, "isSubsetOfSet:", v11);

  return v12;
}

- (id)deviceClass
{
  void *v2;
  void *v3;
  const __CFString *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfo current](APDeviceInfo, "current"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "deviceModel"));

  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPhone")) & 1) != 0)
  {
    v4 = CFSTR("IPHONE");
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPad")) & 1) != 0)
  {
    v4 = CFSTR("IPAD");
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("Mac")) & 1) != 0
         || (objc_msgSend(v3, "hasPrefix:", CFSTR("iMac")) & 1) != 0)
  {
    v4 = CFSTR("MAC");
  }
  else if (objc_msgSend(v3, "hasPrefix:", CFSTR("iPod")))
  {
    v4 = CFSTR("IPOD");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

@end

@implementation SBKPullValueRequest

+ (id)propertyListBodyWithTransaction:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "clientItemVersionAnchor");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("0");
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  v12[0] = CFSTR("domain");
  objc_msgSend(v3, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = v7;
  v12[1] = CFSTR("since-version");
  v12[2] = CFSTR("key");
  objc_msgSend(v3, "requestedKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)requestForTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "requestURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "requestWithRequestURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setMethod:", 1);
  objc_msgSend(a1, "propertyListBodyWithTransaction:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBodyDataWithPropertyList:", v7);

  objc_msgSend(v6, "setTransaction:", v4);
  objc_msgSend(v6, "setIncludeDeviceGUID:", 1);
  return v6;
}

- (id)canonicalResponseForResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBKRequest transaction](self, "transaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKPullValueResponse responseWithResponse:transaction:](SBKPullValueResponse, "responseWithResponse:transaction:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end

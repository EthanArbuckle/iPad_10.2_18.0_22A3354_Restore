@implementation SBKPushValueRequest

+ (id)propertyListBodyWithTransaction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v14[0] = CFSTR("domain");
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v14[1] = CFSTR("key");
  objc_msgSend(v3, "requestItemPayloadPair");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "kvsKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  v14[2] = CFSTR("value");
  objc_msgSend(v3, "requestItemPayloadPair");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "kvsPayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v3, "requestItemVersionAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "requestItemVersionAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("base-version"));

  }
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
  +[SBKPushValueResponse responseWithResponse:transaction:](SBKPushValueResponse, "responseWithResponse:transaction:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end

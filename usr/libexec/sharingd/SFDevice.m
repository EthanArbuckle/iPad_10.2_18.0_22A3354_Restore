@implementation SFDevice

- (NSUUID)deviceIdentifier
{
  void *v3;
  void *v4;
  int Int64Ranged;
  id v6;
  id v7;
  id v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  char *v13;
  const __CFString *v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice bleDevice](self, "bleDevice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "advertisementFields"));

  Int64Ranged = CFDictionaryGetInt64Ranged(v4, CFSTR("hsStatus"), 0, 0xFFFFFFFFLL, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SFDevice model](self, "model"));
  if ((objc_msgSend(v6, "isEqual:", CFSTR("AirPods1,1")) & 1) != 0
    || (objc_msgSend(v6, "isEqual:", CFSTR("AirPods1,3")) & 1) != 0
    || objc_msgSend(v6, "isEqual:", CFSTR("AirPodsPro1,1")))
  {

LABEL_5:
    v7 = (id)objc_claimAutoreleasedReturnValue(-[SFDevice identifier](self, "identifier"));
    goto LABEL_6;
  }
  v9 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithBluetoothModel:", v6);
  v10 = objc_msgSend(v9, "isAirPods");

  if ((v10 & 1) != 0 || !Int64Ranged)
    goto LABEL_5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice identifier](self, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));

  v13 = (char *)objc_msgSend(v12, "length") - 4;
  if ((Int64Ranged & 0x80) != 0)
    v14 = CFSTR("1EF7");
  else
    v14 = CFSTR("0010");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", v13, 4, v14));
  v7 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v15);

LABEL_6:
  return (NSUUID *)v7;
}

- (int)rssi
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice bleDevice](self, "bleDevice"));
  v3 = objc_msgSend(v2, "rssi");

  return v3;
}

- (char)channel
{
  void *v2;
  void *v3;
  char Int64Ranged;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice bleDevice](self, "bleDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "advertisementFields"));
  Int64Ranged = CFDictionaryGetInt64Ranged(v3, CFSTR("ch"), 0, 255, 0);

  return Int64Ranged;
}

@end

@implementation RPCompanionLinkDevice(TVRemoteCore)

- (uint64_t)isEqualToRPDevice:()TVRemoteCore
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(a1, "idsDeviceIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v4, "idsDeviceIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    objc_msgSend(a1, "idsDeviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "idsDeviceIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  v11 = v8;
  v12 = v10;
  v13 = v12;
  if (v11 == v12)
  {
    v14 = 1;
  }
  else if ((v11 == 0) == (v12 != 0))
  {
    v14 = 0;
  }
  else
  {
    v14 = objc_msgSend(v11, "isEqual:", v12);
  }

  return v14;
}

@end

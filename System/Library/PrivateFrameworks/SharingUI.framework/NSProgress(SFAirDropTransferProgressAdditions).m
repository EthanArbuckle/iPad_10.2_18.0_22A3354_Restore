@implementation NSProgress(SFAirDropTransferProgressAdditions)

+ (uint64_t)sf_publishingKeyForApp:()SFAirDropTransferProgressAdditions sessionID:
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), a3, a4);
}

- (id)sf_initWithAppBundle:()SFAirDropTransferProgressAdditions sessionID:andPersonRealName:
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x24BDAC8D0];
  v17[0] = *MEMORY[0x24BDD1178];
  v8 = (void *)MEMORY[0x24BDD1768];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "sf_publishingKeyForApp:sessionID:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v17[1] = CFSTR("sendState");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v13;
  v18[2] = v11;
  v17[2] = CFSTR("bundleID");
  v17[3] = CFSTR("sessionID");
  v17[4] = CFSTR("personRealName");
  v18[3] = v10;
  v18[4] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = a1;
  objc_msgSend(v15, "setCompletedUnitCount:", -1);
  objc_msgSend(v15, "setTotalUnitCount:", 0);
  objc_msgSend(v15, "setCancellable:", 1);
  objc_msgSend(v15, "setPausable:", 0);
  objc_msgSend(v15, "setSf_transferState:", 0);

  return v15;
}

- (id)sf_publishingKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1768];
  objc_msgSend(a1, "sf_bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sf_sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sf_publishingKeyForApp:sessionID:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sf_bundleID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)sf_sessionID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("sessionID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)sf_personRealName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("personRealName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)sf_initWithFileURL:()SFAirDropTransferProgressAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("sendState");
  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = *MEMORY[0x24BDD11A8];
  v11[0] = v6;
  v11[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = a1;
  objc_msgSend(v8, "setCompletedUnitCount:", -1);
  objc_msgSend(v8, "setTotalUnitCount:", 0);
  objc_msgSend(v8, "setCancellable:", 1);
  objc_msgSend(v8, "setPausable:", 0);
  objc_msgSend(v8, "setSf_transferState:", 0);

  return v8;
}

+ (const)sf_transferStateAsString:()SFAirDropTransferProgressAdditions
{
  if ((unint64_t)(a3 - 1) > 5)
    return CFSTR("Initialized");
  else
    return off_24CE0FDD0[a3 - 1];
}

- (void)setSf_initiator:()SFAirDropTransferProgressAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "SFAirDropTransferProgressInitiator", v2, (void *)0x301);

}

- (uint64_t)sf_initiator
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, "SFAirDropTransferProgressInitiator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (void)setSf_transferState:()SFAirDropTransferProgressAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setUserInfoObject:forKey:", v2, CFSTR("sendState"));

}

- (uint64_t)sf_transferState
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("sendState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "integerValue");
  return v3;
}

- (uint64_t)sf_failedWithError:()SFAirDropTransferProgressAdditions
{
  objc_msgSend(a1, "setUserInfoObject:forKey:", a3, CFSTR("error"));
  return objc_msgSend(a1, "setSf_transferState:", 5);
}

- (id)sf_error
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("error"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end

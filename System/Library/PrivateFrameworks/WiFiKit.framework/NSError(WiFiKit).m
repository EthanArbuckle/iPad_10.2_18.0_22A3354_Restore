@implementation NSError(WiFiKit)

+ (id)associationErrorWithReason:()WiFiKit
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1540];
  v9 = *MEMORY[0x24BDD0BA0];
  WFAssociationErrorCodeToString(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "associationErrorWithReason:userInfo:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)associationErrorWithReason:()WiFiKit userInfo:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifikit.error"), a3, a4);
}

+ (uint64_t)associationErrorWithCode:()WiFiKit isPrivateMACFailureThresholdMet:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithCode:requiresPassword:signalStrength:isPrivateMACFailureThresholdMet:", a3, 0, 0, a4);
}

+ (uint64_t)associationErrorWithCode:()WiFiKit requiresPassword:signalStrength:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithCode:requiresPassword:signalStrength:userInfo:", a3, a4, a5, 0);
}

+ (id)associationErrorWithCode:()WiFiKit requiresPassword:signalStrength:isPrivateMACFailureThresholdMet:
{
  id v10;
  void *v11;
  void *v12;

  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("kWFAssociationPrivateMacFailureThresholdMetKey"));

  objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithCode:requiresPassword:signalStrength:userInfo:", a3, a4, a5, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)associationErrorWithCode:()WiFiKit requiresPassword:signalStrength:userInfo:
{
  id v8;
  unint64_t v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v8 = a6;
  v9 = 1;
  if (a3 <= -3914)
  {
    if ((a3 + 3925) >= 2)
    {
      if (a3 == -3947)
      {
        v9 = 11;
      }
      else if (a3 != -3941)
      {
LABEL_10:
        v9 = 12;
      }
    }
  }
  else
  {
    switch(a3)
    {
      case -3913:
      case -3909:
        v9 = 20;
        break;
      case -3912:
        break;
      case -3911:
      case -3910:
      case -3908:
      case -3907:
        goto LABEL_10;
      case -3906:
        v10 = a5 < -74;
        v11 = 12;
        goto LABEL_13;
      case -3905:
        v10 = a5 < -74;
        v11 = 3;
LABEL_13:
        if (v10)
          v9 = 21;
        else
          v9 = v11;
        break;
      default:
        if (a3 != -100)
          goto LABEL_10;
        v9 = 0;
        break;
    }
  }
  v12 = (void *)MEMORY[0x24BDBCED8];
  v18 = *MEMORY[0x24BDD0BA0];
  WFAssociationErrorCodeToString(v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithDictionary:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v15, "addEntriesFromDictionary:", v8);
  objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithReason:userInfo:", v9, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)scanErrorWithCode:()WiFiKit
{
  uint64_t v3;
  uint64_t v4;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 82)
    v3 = 0;
  if (a3 == 37)
    v3 = 37;
  if (a3 == 16)
    v4 = 16;
  else
    v4 = v3;
  objc_msgSend(MEMORY[0x24BDD1540], "scanErrorWithReason:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)scanErrorWithReason:()WiFiKit
{
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (a3 <= 3)
  {
    if (!a3)
    {
      v4 = CFSTR("Cannot scan while power is off");
      goto LABEL_13;
    }
    if (a3 == 1)
    {
      v4 = CFSTR("Scan cancelled");
      goto LABEL_13;
    }
LABEL_12:
    v4 = CFSTR("Unknown scan error");
    goto LABEL_13;
  }
  if (a3 == 4)
  {
    v4 = CFSTR("Device scan channels are empty");
    goto LABEL_13;
  }
  if (a3 == 16)
  {
    v4 = CFSTR("Unable to queue scan, device is busy.");
    goto LABEL_13;
  }
  if (a3 != 37)
    goto LABEL_12;
  v4 = CFSTR("Existing scan in progress");
LABEL_13:
  v5 = (void *)MEMORY[0x24BDD1540];
  v9 = *MEMORY[0x24BDD0FC8];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifikit.error"), a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end

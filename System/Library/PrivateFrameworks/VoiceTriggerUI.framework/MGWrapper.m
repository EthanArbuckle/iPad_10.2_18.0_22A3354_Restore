@implementation MGWrapper

+ (id)sharedMGWrapper
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__MGWrapper_sharedMGWrapper__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMGWrapper_onceToken != -1)
    dispatch_once(&sharedMGWrapper_onceToken, block);
  return (id)sharedMGWrapper_sharedMGWrapper;
}

void __28__MGWrapper_sharedMGWrapper__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedMGWrapper_sharedMGWrapper;
  sharedMGWrapper_sharedMGWrapper = (uint64_t)v1;

}

- (BOOL)isRunningOnSimulator
{
  return 0;
}

- (BOOL)isPlusIPhone
{
  return -[MGWrapper MGIsDeviceOneOfType:](self, "MGIsDeviceOneOfType:", 4)
      || -[MGWrapper MGIsDeviceOneOfType:](self, "MGIsDeviceOneOfType:", 7)
      || -[MGWrapper MGIsDeviceOneOfType:](self, "MGIsDeviceOneOfType:", 9);
}

- (BOOL)isSmallIPhone
{
  return -[MGWrapper MGIsDeviceOneOfType:](self, "MGIsDeviceOneOfType:", 2)
      || -[MGWrapper MGIsDeviceOneOfType:](self, "MGIsDeviceOneOfType:", 6)
      || -[MGWrapper MGIsDeviceOneOfType:](self, "MGIsDeviceOneOfType:", 8);
}

- (BOOL)isSmallestIPhone
{
  return -[MGWrapper MGIsDeviceOneOfType:](self, "MGIsDeviceOneOfType:", 1)
      || -[MGWrapper MGIsDeviceOneOfType:](self, "MGIsDeviceOneOfType:", 10);
}

- (BOOL)supportsSideButtonActivation
{
  if (-[MGWrapper isRunningOnSimulator](self, "isRunningOnSimulator"))
    return -[MGWrapper MGIsDeviceOneOfTypes:](self, "MGIsDeviceOneOfTypes:", &unk_24F34DD18);
  else
    return MGGetSInt32Answer() == 2;
}

- (int64_t)getSimulatorDevice
{
  void *v2;
  void *v3;
  int64_t v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", getenv("SIMULATOR_DEVICE_NAME"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_24F34DE40, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (BOOL)isHeySiriAlwaysOn
{
  int64_t v3;
  void *v4;
  char v5;

  if (!-[MGWrapper isRunningOnSimulator](self, "isRunningOnSimulator"))
    return MGGetBoolAnswer();
  v3 = -[MGWrapper getSimulatorDevice](self, "getSimulatorDevice");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(&unk_24F34DD30, "containsObject:", v4);

  return v5;
}

- (id)deviceClass
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  if (-[MGWrapper isRunningOnSimulator](self, "isRunningOnSimulator"))
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "model");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MGWrapper deviceClassiPad](self, "deviceClassiPad");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsString:", v5);

    if (v6)
      -[MGWrapper deviceClassiPad](self, "deviceClassiPad");
    else
      -[MGWrapper deviceClassiPhone](self, "deviceClassiPhone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MGCopyAnswer();
  }
  return v7;
}

- (BOOL)isDeviceIPad
{
  void *v2;
  char v3;

  -[MGWrapper deviceClass](self, "deviceClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPad"));

  return v3;
}

- (BOOL)isDeviceIPhone
{
  void *v2;
  char v3;

  -[MGWrapper deviceClass](self, "deviceClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPhone"));

  return v3;
}

- (BOOL)isDeviceIPod
{
  void *v2;
  char v3;

  -[MGWrapper deviceClass](self, "deviceClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPod"));

  return v3;
}

- (BOOL)isDeviceVision
{
  void *v2;
  char v3;

  -[MGWrapper deviceClass](self, "deviceClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("RealityDevice"));

  return v3;
}

- (BOOL)MGIsDeviceOneOfTypes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[MGWrapper MGIsDeviceOneOfType:](self, "MGIsDeviceOneOfType:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "integerValue", (_QWORD)v11)))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)MGIsDeviceOneOfType:(int64_t)a3
{
  int v5;

  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 15:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 28:
    case 29:
    case 30:
      LOBYTE(v5) = MGIsDeviceOneOfType();
      break;
    default:
      v5 = -[MGWrapper isRunningOnSimulator](self, "isRunningOnSimulator");
      if (v5)
        LOBYTE(v5) = -[MGWrapper getSimulatorDevice](self, "getSimulatorDevice") == a3;
      break;
  }
  return v5;
}

- (id)deviceClassiPad
{
  return CFSTR("iPad");
}

- (id)deviceClassiPhone
{
  return CFSTR("iPhone");
}

@end

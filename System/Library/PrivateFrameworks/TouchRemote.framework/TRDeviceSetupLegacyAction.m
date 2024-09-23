@implementation TRDeviceSetupLegacyAction

- (id)propertyListRepresentation
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[TRDeviceSetupAction actionType](self, "actionType");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_24C2E6A98;
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("a"));

  -[TRDeviceSetupAction parameters](self, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TRDeviceSetupAction parameters](self, "parameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("p"));

  }
  v10 = (void *)objc_msgSend(v7, "copy");

  return v10;
}

@end

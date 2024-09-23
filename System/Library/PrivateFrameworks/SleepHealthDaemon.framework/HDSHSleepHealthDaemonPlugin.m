@implementation HDSHSleepHealthDaemonPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)(id)*MEMORY[0x24BEA99B8];
}

+ (BOOL)shouldLoadPluginForDaemon:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRealityDevice");

  return v4 ^ 1;
}

- (id)extensionForProfile:(id)a3
{
  id v3;
  HDSHProfileExtension *v4;

  v3 = a3;
  if (objc_msgSend(v3, "profileType") == 1)
    v4 = -[HDSHProfileExtension initWithProfile:]([HDSHProfileExtension alloc], "initWithProfile:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

- (id)taskServerClasses
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

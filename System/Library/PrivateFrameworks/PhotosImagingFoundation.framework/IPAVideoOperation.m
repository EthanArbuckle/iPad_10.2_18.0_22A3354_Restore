@implementation IPAVideoOperation

+ (id)presetifyAdjustment:(id)a3
{
  return a3;
}

- (id)archivalRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[IPAEditOperation settingsDictionary](self, "settingsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[IPAEditOperation identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setIdentifier:", v4);
    objc_msgSend(v5, "setSettings:", v3);
    IPAAdjustmentCurrentVersionForIdentifier(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVersion:", v6);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end

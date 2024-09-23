@implementation TRDeviceSetupGeneralSetupAction

- (TRDeviceSetupGeneralSetupAction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRDeviceSetupGeneralSetupAction;
  return (TRDeviceSetupGeneralSetupAction *)-[TRDeviceSetupAction _initWithActionType:parameters:](&v3, sel__initWithActionType_parameters_, CFSTR("setup"), 0);
}

- (TRDeviceSetupGeneralSetupAction)initWithCountryCode:(id)a3 language:(id)a4 homeSharingID:(id)a5 homeSharingGroupID:(id)a6 isDiagnosticsEnabled:(BOOL)a7 rememberPassword:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  TRDeviceSetupGeneralSetupAction *v22;
  objc_super v24;

  v8 = a8;
  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v14)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, CFSTR("c"));
  if (v15)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, CFSTR("l"));
  if (v16)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, CFSTR("ha"));
  if (v17)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, CFSTR("hg"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("di"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("rp"));

  v24.receiver = self;
  v24.super_class = (Class)TRDeviceSetupGeneralSetupAction;
  v22 = -[TRDeviceSetupAction _initWithActionType:parameters:](&v24, sel__initWithActionType_parameters_, CFSTR("setup"), v19);

  return v22;
}

- (NSString)countryCode
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("c"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (NSString *)v5;
}

- (NSString)language
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("l"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (NSString *)v5;
}

- (NSString)homeSharingID
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ha"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (NSString *)v5;
}

- (NSString)homeSharingGroupID
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("hg"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (NSString *)v5;
}

- (BOOL)isDiagnosticsEnabled
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("a"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (BOOL)rememberPassword
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("a"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

@end

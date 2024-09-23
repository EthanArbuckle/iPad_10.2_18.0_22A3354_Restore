@implementation TRDeviceSetupLegacySetupAction

- (TRDeviceSetupLegacySetupAction)initWithAuthInfo:(id)a3 networkSSID:(id)a4 networkPassword:(id)a5 diagnosticsEnabled:(BOOL)a6 language:(id)a7 countryCode:(id)a8 homeSharingAppleID:(id)a9 homeSharingGroupID:(id)a10 rememberPassword:(BOOL)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  TRDeviceSetupLegacySetupAction *v32;
  _BOOL4 v34;
  objc_super v36;

  v34 = a6;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "headers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v15, "headers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, CFSTR("h"));

    }
    objc_msgSend(v15, "body");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v15, "body");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v27, CFSTR("b"));

    }
    v28 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, CFSTR("au"));

  }
  if (v16)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v16, CFSTR("ns"));
  if (v17)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v17, CFSTR("np"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v34);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v29, CFSTR("di"));

  if (v18)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, CFSTR("l"));
  if (v19)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v19, CFSTR("c"));
  if (v20)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, CFSTR("ha"));
  if (v21)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("hg"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a11);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v30, CFSTR("rp"));

  v31 = (void *)objc_msgSend(v22, "copy");
  v36.receiver = self;
  v36.super_class = (Class)TRDeviceSetupLegacySetupAction;
  v32 = -[TRDeviceSetupAction _initWithActionType:parameters:](&v36, sel__initWithActionType_parameters_, CFSTR("setup"), v31);

  return v32;
}

- (TRDeviceSetupLegacySetupActionAuthInfo)authInfo
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  TRDeviceSetupLegacySetupActionAuthInfo *v6;
  void *v7;
  void *v8;
  TRDeviceSetupLegacySetupActionAuthInfo *v9;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("au"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = [TRDeviceSetupLegacySetupActionAuthInfo alloc];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("h"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("b"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TRDeviceSetupLegacySetupActionAuthInfo initWithHeaders:body:](v6, "initWithHeaders:body:", v7, v8);

  return v9;
}

- (NSString)networkSSID
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ns"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (NSString *)v5;
}

- (NSString)networkPassword
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("np"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (NSString *)v5;
}

- (BOOL)diagnosticsEnabled
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("di"));
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

- (NSString)homeSharingAppleID
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

- (BOOL)rememberPassword
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("rp"));
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

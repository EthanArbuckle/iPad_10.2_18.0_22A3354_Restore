@implementation TRDeviceSetupAction

- (TRDeviceSetupAction)init
{
  return (TRDeviceSetupAction *)-[TRDeviceSetupAction _initWithActionType:parameters:](self, "_initWithActionType:parameters:", 0, 0);
}

- (id)_initWithActionType:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  TRDeviceSetupAction *v8;
  uint64_t v9;
  NSString *actionType;
  uint64_t v11;
  NSDictionary *parameters;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TRDeviceSetupAction;
  v8 = -[TRDeviceSetupAction init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    actionType = v8->_actionType;
    v8->_actionType = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    parameters = v8->_parameters;
    v8->_parameters = (NSDictionary *)v11;

  }
  return v8;
}

+ (id)actionWithActionType:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithActionType:parameters:", v7, v6);

  return v8;
}

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
  objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("a2"));

  -[TRDeviceSetupAction parameters](self, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TRDeviceSetupAction parameters](self, "parameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("p2"));

  }
  objc_msgSend(v7, "setObject:forKey:", &unk_24C2F28C8, CFSTR("_v_"));
  v10 = (void *)objc_msgSend(v7, "copy");

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)TRDeviceSetupAction;
  -[TRDeviceSetupAction description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRDeviceSetupAction actionType](self, "actionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRDeviceSetupAction parameters](self, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ action: \"%@\"; paramaters: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)protocolVersion
{
  return 0;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
}

+ (id)actionWithData:(id)a3 error:(id *)a4 supportsLegacy:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  __objc2_class **v20;
  __objc2_class *v21;

  v5 = a5;
  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    objc_msgSend(v10, "TR_decompressedGzipData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;

      v10 = v13;
    }
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v10, 0, 0, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v18 = 0;
LABEL_44:

      goto LABEL_45;
    }
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("a2"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v15 = 0;
    }
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("p2"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v16 = 0;
    }
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("a"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "length") && !v5 && !v15)
    {
      v18 = 0;
LABEL_43:

      goto LABEL_44;
    }
    if (!objc_msgSend(v17, "length") || !v5)
    {
      if (objc_msgSend(v15, "isEqualToString:", CFSTR("connect")))
      {
        v21 = TRDeviceSetupConnectAction;
      }
      else if (objc_msgSend(v15, "isEqualToString:", CFSTR("auth")))
      {
        v21 = TRDeviceSetupAuthenticateAction;
      }
      else if (objc_msgSend(v15, "isEqualToString:", CFSTR("setup")))
      {
        v21 = TRDeviceSetupGeneralSetupAction;
      }
      else if (objc_msgSend(v15, "isEqualToString:", CFSTR("finish")))
      {
        v21 = TRDeviceSetupFinishAction;
      }
      else if (objc_msgSend(v15, "isEqualToString:", CFSTR("cancel")))
      {
        v21 = TRDeviceSetupCancelAction;
      }
      else
      {
        v21 = (__objc2_class *)a1;
      }
      -[__objc2_class actionWithActionType:parameters:](v21, "actionWithActionType:parameters:", v15, v16);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_43;
    }
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("p"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v19 = 0;
    }
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("auth")) & 1) != 0)
    {
      v20 = off_24C2E4778;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("setup")) & 1) != 0)
    {
      v20 = off_24C2E4790;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("cancel")) & 1) != 0)
    {
      v20 = off_24C2E4780;
    }
    else
    {
      if (!objc_msgSend(v17, "isEqualToString:", CFSTR("finish")))
      {
        v18 = 0;
        goto LABEL_35;
      }
      v20 = off_24C2E4788;
    }
    -[__objc2_class actionWithActionType:parameters:](*v20, "actionWithActionType:parameters:", v17, v19);
    v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:

    goto LABEL_43;
  }
  v18 = objc_alloc_init((Class)a1);
LABEL_45:

  return v18;
}

- (id)dataRepresentationWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD1770];
  -[TRDeviceSetupAction propertyListRepresentation](self, "propertyListRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v5, 200, 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "TR_compressedGzipData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end

@implementation WFINPaymentMethodParameterState

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("Type"));

  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("Name"));

  }
  objc_msgSend(v3, "identificationHint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "identificationHint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("IdentificationHint"));

  }
  return v4;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = objc_opt_class();
  WFEnforceClass(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  WFEnforceClass(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    WFEnforceClass(v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("IdentificationHint"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_class();
    WFEnforceClass(v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA50]), "initWithType:name:identificationHint:icon:", objc_msgSend(v10, "integerValue"), v13, v16, 0);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end

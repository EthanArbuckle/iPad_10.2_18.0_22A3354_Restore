@implementation WFHomeAccessoryConditionalSubjectState

- (WFHomeAccessoryConditionalSubjectState)initWithSerializedWFHMServiceParameter:(id)a3 serializedWFHMCharacteristicSubstitutableState:(id)a4 negatesValue:(BOOL)a5
{
  id v10;
  id v11;
  WFHomeAccessoryConditionalSubjectState *v12;
  WFHomeAccessoryConditionalSubjectState *v13;
  WFHomeAccessoryConditionalSubjectState *v14;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHomeAccessoryConditionalSubjectState.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serializedWFHMServiceParameter"));

  }
  v17.receiver = self;
  v17.super_class = (Class)WFHomeAccessoryConditionalSubjectState;
  v12 = -[WFHomeAccessoryConditionalSubjectState init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serializedWFHMServiceParameter, a3);
    objc_storeStrong((id *)&v13->_serializedWFHMCharacteristicSubstitutableState, a4);
    v13->_negatesValue = a5;
    v14 = v13;
  }

  return v13;
}

- (WFHomeAccessoryConditionalSubjectState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  WFHomeAccessoryConditionalSubjectState *v19;

  v6 = a3;
  v7 = objc_opt_class();
  WFEnforceClass(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HomeService"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    WFEnforceClass(v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HomeCharacteristic"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    WFEnforceClass(v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NegatesValue"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_class();
      WFEnforceClass(v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "BOOLValue");

      self = -[WFHomeAccessoryConditionalSubjectState initWithSerializedWFHMServiceParameter:serializedWFHMCharacteristicSubstitutableState:negatesValue:](self, "initWithSerializedWFHMServiceParameter:serializedWFHMCharacteristicSubstitutableState:negatesValue:", v11, v14, v18);
      v19 = self;
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (WFHomeAccessoryConditionalSubjectState)initWithService:(id)a3 characteristic:(id)a4 homeIdentifier:(id)a5 negatesValue:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  WFHMServiceParameterState *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  WFHMCharacteristicSubstitutableState *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  WFHomeAccessoryConditionalSubjectState *v21;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  v12 = a3;
  v13 = -[WFHMServiceParameterState initWithService:homeIdentifier:]([WFHMServiceParameterState alloc], "initWithService:homeIdentifier:", v12, v11);

  -[WFHMServiceParameterState serializedRepresentation](v13, "serializedRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  WFEnforceClass(v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (v10)
    {
      v17 = -[WFHMCharacteristicSubstitutableState initWithCharacteristic:homeIdentifier:]([WFHMCharacteristicSubstitutableState alloc], "initWithCharacteristic:homeIdentifier:", v10, v11);
      -[WFHMCharacteristicSubstitutableState serializedRepresentation](v17, "serializedRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_opt_class();
      WFEnforceClass(v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = 0;
    }
    self = -[WFHomeAccessoryConditionalSubjectState initWithSerializedWFHMServiceParameter:serializedWFHMCharacteristicSubstitutableState:negatesValue:](self, "initWithSerializedWFHMServiceParameter:serializedWFHMCharacteristicSubstitutableState:negatesValue:", v16, v20, v6);

    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)serializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFHomeAccessoryConditionalSubjectState;
  -[WFConditionalSubjectParameterState serializedRepresentation](&v9, sel_serializedRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[WFHomeAccessoryConditionalSubjectState serializedWFHMServiceParameter](self, "serializedWFHMServiceParameter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("HomeService"));

  -[WFHomeAccessoryConditionalSubjectState serializedWFHMCharacteristicSubstitutableState](self, "serializedWFHMCharacteristicSubstitutableState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFHomeAccessoryConditionalSubjectState serializedWFHMCharacteristicSubstitutableState](self, "serializedWFHMCharacteristicSubstitutableState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("HomeCharacteristic"));

  }
  if (-[WFHomeAccessoryConditionalSubjectState negatesValue](self, "negatesValue"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("NegatesValue"));
  return v4;
}

- (id)unitType
{
  void *v2;
  void *v3;

  -[WFHomeAccessoryConditionalSubjectState unit](self, "unit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC7BE8], "unitTypeForUnitClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)homeIdentifier
{
  void *v2;
  void *v3;

  -[WFHomeAccessoryConditionalSubjectState serviceParameterState](self, "serviceParameterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMHome)home
{
  void *v3;
  void *v4;
  void *v5;

  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHomeAccessoryConditionalSubjectState homeIdentifier](self, "homeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMHome *)v5;
}

- (HMService)service
{
  void *v2;
  void *v3;

  -[WFHomeAccessoryConditionalSubjectState serviceParameterState](self, "serviceParameterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMService *)v3;
}

- (HMCharacteristic)characteristic
{
  void *v2;
  void *v3;

  -[WFHomeAccessoryConditionalSubjectState characteristicSubstitutableState](self, "characteristicSubstitutableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCharacteristic *)v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  unint64_t v9;

  -[WFHomeAccessoryConditionalSubjectState serializedWFHMServiceParameter](self, "serializedWFHMServiceParameter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFHomeAccessoryConditionalSubjectState serializedWFHMCharacteristicSubstitutableState](self, "serializedWFHMCharacteristicSubstitutableState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[WFHomeAccessoryConditionalSubjectState negatesValue](self, "negatesValue");
  v8 = 3405660961;
  if (v7)
    v8 = 305449726;
  v9 = v6 ^ v8;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  WFHomeAccessoryConditionalSubjectState *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;

  v6 = (WFHomeAccessoryConditionalSubjectState *)a3;
  if (self == v6)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFHomeAccessoryConditionalSubjectState serializedWFHMServiceParameter](self, "serializedWFHMServiceParameter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHomeAccessoryConditionalSubjectState serializedWFHMServiceParameter](v6, "serializedWFHMServiceParameter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "isEqual:", v8))
      {
        LOBYTE(v11) = 0;
LABEL_13:

        goto LABEL_14;
      }
      -[WFHomeAccessoryConditionalSubjectState serializedWFHMCharacteristicSubstitutableState](self, "serializedWFHMCharacteristicSubstitutableState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHomeAccessoryConditionalSubjectState serializedWFHMCharacteristicSubstitutableState](v6, "serializedWFHMCharacteristicSubstitutableState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 == v10
        || (-[WFHomeAccessoryConditionalSubjectState serializedWFHMCharacteristicSubstitutableState](self, "serializedWFHMCharacteristicSubstitutableState"), v3 = (void *)objc_claimAutoreleasedReturnValue(), -[WFHomeAccessoryConditionalSubjectState serializedWFHMCharacteristicSubstitutableState](v6, "serializedWFHMCharacteristicSubstitutableState"), v4 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v3, "isEqual:", v4)))
      {
        v12 = -[WFHomeAccessoryConditionalSubjectState negatesValue](self, "negatesValue");
        v11 = v12 ^ -[WFHomeAccessoryConditionalSubjectState negatesValue](v6, "negatesValue") ^ 1;
        if (v9 == v10)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        LOBYTE(v11) = 0;
      }

      goto LABEL_12;
    }
    LOBYTE(v11) = 0;
  }
LABEL_14:

  return v11;
}

- (void)getContentWithContext:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__WFHomeAccessoryConditionalSubjectState_getContentWithContext_completionHandler___block_invoke;
  v8[3] = &unk_1E7AF76F0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "ensureHomesAreLoadedWithCompletionHandler:", v8);

}

- (int64_t)contentType
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  char v18;

  -[WFHomeAccessoryConditionalSubjectState characteristic](self, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  getHMCharacteristicMetadataFormatBool_2213();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v4 & 1) != 0)
  {
    v7 = 1;
    goto LABEL_19;
  }
  getHMCharacteristicMetadataFormatString_2216();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqualToString:", v8);

  if ((v9 & 1) != 0)
  {
    v7 = 2;
    goto LABEL_19;
  }
  getHMCharacteristicMetadataFormatInt_2219();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v10) & 1) == 0)
  {
    getHMCharacteristicMetadataFormatFloat_2222();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", v11) & 1) == 0)
    {
      getHMCharacteristicMetadataFormatUInt8_2225();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isEqualToString:", v12) & 1) == 0)
      {
        getHMCharacteristicMetadataFormatUInt16_2228();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v5, "isEqualToString:", v13) & 1) == 0)
        {
          getHMCharacteristicMetadataFormatUInt32_2231();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v5, "isEqualToString:", v14) & 1) == 0)
          {
            getHMCharacteristicMetadataFormatUInt64_2234();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v5, "isEqualToString:", v17);

            if ((v18 & 1) == 0)
            {
              v7 = 0;
              goto LABEL_19;
            }
            goto LABEL_15;
          }

        }
      }

    }
  }

LABEL_15:
  -[WFHomeAccessoryConditionalSubjectState unit](self, "unit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v7 = 5;
  else
    v7 = 3;

LABEL_19:
  return v7;
}

- (id)maximumLength
{
  void *v2;
  void *v3;
  void *v4;

  -[WFHomeAccessoryConditionalSubjectState characteristic](self, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maxLength");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)minimumValue
{
  void *v2;
  void *v3;
  void *v4;

  -[WFHomeAccessoryConditionalSubjectState characteristic](self, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minimumValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)maximumValue
{
  void *v2;
  void *v3;
  void *v4;

  -[WFHomeAccessoryConditionalSubjectState characteristic](self, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maximumValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)stepValue
{
  void *v2;
  void *v3;
  void *v4;

  -[WFHomeAccessoryConditionalSubjectState characteristic](self, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stepValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)unit
{
  void *v3;
  void *v4;
  void *v5;

  -[WFHomeAccessoryConditionalSubjectState characteristic](self, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFHomeAccessoryConditionalSubjectState characteristic](self, "characteristic");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WFUnitForHMCharacteristic(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (WFHMServiceParameterState)serviceParameterState
{
  WFHMServiceParameterState *serviceParameterState;
  WFHMServiceParameterState *v4;
  void *v5;
  WFHMServiceParameterState *v6;
  WFHMServiceParameterState *v7;

  serviceParameterState = self->_serviceParameterState;
  if (!serviceParameterState)
  {
    v4 = [WFHMServiceParameterState alloc];
    -[WFHomeAccessoryConditionalSubjectState serializedWFHMServiceParameter](self, "serializedWFHMServiceParameter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WFHMServiceParameterState initWithSerializedRepresentation:variableProvider:parameter:](v4, "initWithSerializedRepresentation:variableProvider:parameter:", v5, 0, 0);
    v7 = self->_serviceParameterState;
    self->_serviceParameterState = v6;

    serviceParameterState = self->_serviceParameterState;
  }
  return serviceParameterState;
}

- (WFHMCharacteristicSubstitutableState)characteristicSubstitutableState
{
  void *v3;
  WFHMCharacteristicSubstitutableState *v4;
  void *v5;
  WFHMCharacteristicSubstitutableState *v6;
  WFHMCharacteristicSubstitutableState *characteristicSubstitutableState;

  if (!self->_characteristicSubstitutableState)
  {
    -[WFHomeAccessoryConditionalSubjectState serializedWFHMCharacteristicSubstitutableState](self, "serializedWFHMCharacteristicSubstitutableState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = [WFHMCharacteristicSubstitutableState alloc];
      -[WFHomeAccessoryConditionalSubjectState serializedWFHMCharacteristicSubstitutableState](self, "serializedWFHMCharacteristicSubstitutableState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[WFHMCharacteristicSubstitutableState initWithSerializedRepresentation:variableProvider:parameter:](v4, "initWithSerializedRepresentation:variableProvider:parameter:", v5, 0, 0);
      characteristicSubstitutableState = self->_characteristicSubstitutableState;
      self->_characteristicSubstitutableState = v6;

    }
  }
  return self->_characteristicSubstitutableState;
}

- (BOOL)isEnumeration
{
  void *v3;
  void *v4;
  BOOL IsEnumeration;

  -[WFHomeAccessoryConditionalSubjectState characteristic](self, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[WFHomeAccessoryConditionalSubjectState characteristic](self, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IsEnumeration = WFHMCharacteristicIsEnumeration(v4);

  return IsEnumeration;
}

- (void)getEnumerationPossibleStatesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__WFHomeAccessoryConditionalSubjectState_getEnumerationPossibleStatesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E7AF76F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "ensureHomesAreLoadedWithCompletionHandler:", v7);

}

- (id)localizedLabelForEnumerationPossibleState:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_opt_class();
  WFEnforceClass(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "number");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[WFHomeAccessoryConditionalSubjectState characteristicValueFormatter](self, "characteristicValueFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringForObjectValue:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSFormatter)characteristicValueFormatter
{
  void *v3;
  NSFormatter *characteristicValueFormatter;
  BOOL v5;
  NSFormatter *v6;
  NSFormatter *v7;
  NSFormatter *v8;

  -[WFHomeAccessoryConditionalSubjectState characteristic](self, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  characteristicValueFormatter = self->_characteristicValueFormatter;
  if (characteristicValueFormatter)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3658], "hf_valueFormatterForCharacteristic:options:", v3, 0);
    v6 = (NSFormatter *)objc_claimAutoreleasedReturnValue();
    v7 = self->_characteristicValueFormatter;
    self->_characteristicValueFormatter = v6;

    characteristicValueFormatter = self->_characteristicValueFormatter;
  }
  v8 = characteristicValueFormatter;

  return v8;
}

- (BOOL)negatesValue
{
  return self->_negatesValue;
}

- (NSDictionary)serializedWFHMServiceParameter
{
  return self->_serializedWFHMServiceParameter;
}

- (void)setSerializedWFHMServiceParameter:(id)a3
{
  objc_storeStrong((id *)&self->_serializedWFHMServiceParameter, a3);
}

- (NSDictionary)serializedWFHMCharacteristicSubstitutableState
{
  return self->_serializedWFHMCharacteristicSubstitutableState;
}

- (void)setSerializedWFHMCharacteristicSubstitutableState:(id)a3
{
  objc_storeStrong((id *)&self->_serializedWFHMCharacteristicSubstitutableState, a3);
}

- (void)setServiceParameterState:(id)a3
{
  objc_storeStrong((id *)&self->_serviceParameterState, a3);
}

- (void)setCharacteristicSubstitutableState:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicSubstitutableState, a3);
}

- (void)setCharacteristicValueFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicValueFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicValueFormatter, 0);
  objc_storeStrong((id *)&self->_characteristicSubstitutableState, 0);
  objc_storeStrong((id *)&self->_serviceParameterState, 0);
  objc_storeStrong((id *)&self->_serializedWFHMCharacteristicSubstitutableState, 0);
  objc_storeStrong((id *)&self->_serializedWFHMServiceParameter, 0);
}

void __92__WFHomeAccessoryConditionalSubjectState_getEnumerationPossibleStatesWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id i;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "validValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "minimumValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    objc_msgSend(*(id *)(a1 + 32), "maximumValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    objc_msgSend(*(id *)(a1 + 32), "stepValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    for (i = (id)objc_opt_new(); v7 <= v9; v7 += v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(i, "addObject:", v12);

    }
    v5 = i;
  }
  v13 = *(_QWORD *)(a1 + 40);
  v16 = v5;
  objc_msgSend(v5, "if_map:", &__block_literal_global_2209);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

}

WFNumberSubstitutableState *__92__WFHomeAccessoryConditionalSubjectState_getEnumerationPossibleStatesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  WFNumberSubstitutableState *v3;

  v2 = a2;
  v3 = -[WFNumberSubstitutableState initWithNumber:]([WFNumberSubstitutableState alloc], "initWithNumber:", v2);

  return v3;
}

void __82__WFHomeAccessoryConditionalSubjectState_getContentWithContext_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __82__WFHomeAccessoryConditionalSubjectState_getContentWithContext_completionHandler___block_invoke_2;
  v4[3] = &unk_1E7AF9450;
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "readValueWithCompletionHandler:", v4);

}

void __82__WFHomeAccessoryConditionalSubjectState_getContentWithContext_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "characteristic");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "value");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 32), "negatesValue"))
    {
      v4 = (void *)MEMORY[0x1E0CB37E8];
      v5 = objc_opt_class();
      WFEnforceClass(v15, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "numberWithInt:", objc_msgSend(v6, "BOOLValue") ^ 1);
      v7 = objc_claimAutoreleasedReturnValue();

      v15 = (id)v7;
    }
    v8 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "unit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_alloc(MEMORY[0x1E0CB3758]);
      objc_msgSend(v15, "doubleValue");
      v12 = v11;
      objc_msgSend(*(id *)(a1 + 32), "unit");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v10, "initWithDoubleValue:unit:", v13, v12);

      objc_msgSend(v8, "addObject:", v14);
    }
    else
    {
      objc_msgSend(v8, "addObject:", v15);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

+ (id)subjectType
{
  return CFSTR("HomeAccessory");
}

@end

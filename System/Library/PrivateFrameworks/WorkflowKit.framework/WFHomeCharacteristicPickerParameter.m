@implementation WFHomeCharacteristicPickerParameter

- (void)setService:(id)a3 homeIdentifier:(id)a4
{
  id v7;
  id v8;
  NSString *v9;
  NSString *homeIdentifier;

  objc_storeStrong((id *)&self->_service, a3);
  v7 = a3;
  v8 = a4;
  v9 = (NSString *)objc_msgSend(v8, "copy");

  homeIdentifier = self->_homeIdentifier;
  self->_homeIdentifier = v9;

  -[WFHomeCharacteristicPickerParameter updatePossibleStates](self, "updatePossibleStates");
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (id)localizedLabelForPossibleState:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(a3, "characteristic");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSArray)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  _QWORD v9[5];

  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    -[WFHomeCharacteristicPickerParameter service](self, "service");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WFSupportedCharacteristicsForHMService(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__WFHomeCharacteristicPickerParameter_possibleStates__block_invoke;
    v9[3] = &unk_1E7AEF068;
    v9[4] = self;
    objc_msgSend(v5, "if_compactMap:", v9);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_possibleStates;
    self->_possibleStates = v6;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (id)defaultSerializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  WFHMCharacteristicSubstitutableState *v10;
  void *v11;
  WFHMCharacteristicSubstitutableState *v12;

  -[WFHomeCharacteristicPickerParameter service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "defaultCharacteristic");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      WFSupportedCharacteristicsForHMService(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = [WFHMCharacteristicSubstitutableState alloc];
    -[WFHomeCharacteristicPickerParameter homeIdentifier](self, "homeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WFHMCharacteristicSubstitutableState initWithCharacteristic:homeIdentifier:](v10, "initWithCharacteristic:homeIdentifier:", v7, v11);

    -[WFHMCharacteristicSubstitutableState serializedRepresentation](v12, "serializedRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isHidden
{
  void *v2;
  BOOL v3;

  -[WFHomeCharacteristicPickerParameter service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)updatePossibleStates
{
  NSArray *possibleStates;
  objc_super v4;

  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFHomeCharacteristicPickerParameter;
  -[WFEnumerationParameter possibleStatesDidChange](&v4, sel_possibleStatesDidChange);
  -[WFParameter defaultSerializedRepresentationDidChange](self, "defaultSerializedRepresentationDidChange");
}

- (HMService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (NSString)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void)setHomeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

WFHMCharacteristicSubstitutableState *__53__WFHomeCharacteristicPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  WFHMCharacteristicSubstitutableState *v4;
  void *v5;
  WFHMCharacteristicSubstitutableState *v6;

  v3 = a2;
  v4 = [WFHMCharacteristicSubstitutableState alloc];
  objc_msgSend(*(id *)(a1 + 32), "homeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFHMCharacteristicSubstitutableState initWithCharacteristic:homeIdentifier:](v4, "initWithCharacteristic:homeIdentifier:", v3, v5);

  return v6;
}

@end

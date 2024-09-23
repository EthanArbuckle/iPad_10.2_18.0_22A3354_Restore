@implementation WFGetHomeAccessoryStateAction

- (void)initializeParameters
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFGetHomeAccessoryStateAction;
  -[WFAction initializeParameters](&v4, sel_initializeParameters);
  -[WFGetHomeAccessoryStateAction updateCharacteristicsEnumeration](self, "updateCharacteristicsEnumeration");
  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEventObserver:", self);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeEventObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WFGetHomeAccessoryStateAction;
  -[WFGetHomeAccessoryStateAction dealloc](&v4, sel_dealloc);
}

- (void)wasAddedToWorkflowByUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[5];

  v4 = a3;
  -[WFGetHomeAccessoryStateAction home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__WFGetHomeAccessoryStateAction_wasAddedToWorkflowByUser___block_invoke;
    v8[3] = &unk_1E7AF94B0;
    v8[4] = self;
    objc_msgSend(v6, "ensureHomesAreLoadedWithCompletionHandler:", v8);

  }
  v7.receiver = self;
  v7.super_class = (Class)WFGetHomeAccessoryStateAction;
  -[WFAction wasAddedToWorkflowByUser:](&v7, sel_wasAddedToWorkflowByUser_, v4);

}

- (void)wasAddedToWorkflow:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WFGetHomeAccessoryStateAction;
  -[WFAction wasAddedToWorkflow:](&v7, sel_wasAddedToWorkflow_, v4);
  -[WFAction parameterForKey:](self, "parameterForKey:", CFSTR("WFHome"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "environment") == 2 || objc_msgSend(v4, "environment") == 1;
  objc_msgSend(v5, "setHidden:", v6);

}

- (id)parameterStateForKey:(id)a3 fallingBackToDefaultValue:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  WFStringSubstitutableState *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("WFHome")))
  {
    -[WFGetHomeAccessoryStateAction homeIdentifier](self, "homeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = -[WFVariableSubstitutableParameterState initWithValue:]([WFStringSubstitutableState alloc], "initWithValue:", v7);
    else
      v8 = 0;

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFGetHomeAccessoryStateAction;
    -[WFAction parameterStateForKey:fallingBackToDefaultValue:](&v10, sel_parameterStateForKey_fallingBackToDefaultValue_, v6, v4);
    v8 = (WFStringSubstitutableState *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  WFHMServiceParameterState *v13;
  WFHMCharacteristicSubstitutableState *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("WFHome")))
  {
    v8 = v6;
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v11 = v9;

    objc_msgSend(v11, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v12 != 0;
    if (v12)
    {
      v13 = -[WFHMServiceParameterState initWithService:homeIdentifier:]([WFHMServiceParameterState alloc], "initWithService:homeIdentifier:", 0, v12);
      v14 = -[WFHMCharacteristicSubstitutableState initWithCharacteristic:homeIdentifier:]([WFHMCharacteristicSubstitutableState alloc], "initWithCharacteristic:homeIdentifier:", 0, v12);
      -[WFGetHomeAccessoryStateAction setParameterState:forKey:](self, "setParameterState:forKey:", v13, CFSTR("WFHMService"));
      -[WFGetHomeAccessoryStateAction setParameterState:forKey:](self, "setParameterState:forKey:", v14, CFSTR("WFHMCharacteristic"));

    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFGetHomeAccessoryStateAction;
    if (-[WFAction setParameterState:forKey:](&v16, sel_setParameterState_forKey_, v6, v7))
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("WFHMCharacteristic")))
        -[WFAction outputDetailsUpdated](self, "outputDetailsUpdated");
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("WFHMService")))
        -[WFGetHomeAccessoryStateAction updateCharacteristicsEnumeration](self, "updateCharacteristicsEnumeration");
      v10 = 1;
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  _QWORD v5[5];

  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__WFGetHomeAccessoryStateAction_runAsynchronouslyWithInput___block_invoke;
  v5[3] = &unk_1E7AF94B0;
  v5[4] = self;
  objc_msgSend(v4, "ensureHomesAreLoadedWithCompletionHandler:", v5);

}

- (id)localizedAttributionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  -[WFGetHomeAccessoryStateAction homeName](self, "homeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFGetHomeAccessoryStateAction;
    -[WFAction localizedAttributionWithContext:](&v10, sel_localizedAttributionWithContext_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)outputContentClasses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  -[WFGetHomeAccessoryStateAction characteristic](self, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  getHMCharacteristicMetadataFormatBool();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "isEqualToString:", v6);

  if (!(_DWORD)v4)
  {
    getHMCharacteristicMetadataFormatString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "isEqualToString:", v9);

    if (v10)
    {
      v22 = objc_opt_class();
      v7 = (void *)MEMORY[0x1E0C99D20];
      v8 = &v22;
      goto LABEL_5;
    }
    getHMCharacteristicMetadataFormatInt();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", v12) & 1) == 0)
    {
      getHMCharacteristicMetadataFormatFloat();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isEqualToString:", v13) & 1) == 0)
      {
        getHMCharacteristicMetadataFormatUInt8();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v5, "isEqualToString:", v14) & 1) == 0)
        {
          getHMCharacteristicMetadataFormatUInt16();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v5, "isEqualToString:", v15) & 1) == 0)
          {
            getHMCharacteristicMetadataFormatUInt32();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v5, "isEqualToString:", v16) & 1) == 0)
            {
              getHMCharacteristicMetadataFormatUInt64();
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v5, "isEqualToString:", v19);

              if ((v20 & 1) == 0)
              {
                v11 = (void *)MEMORY[0x1E0C9AA60];
                goto LABEL_17;
              }
              goto LABEL_16;
            }

          }
        }

      }
    }

LABEL_16:
    -[WFGetHomeAccessoryStateAction outputMeasurementUnitType](self, "outputMeasurementUnitType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  v23[0] = objc_opt_class();
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = v23;
LABEL_5:
  objc_msgSend(v7, "arrayWithObjects:count:", v8, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v11;
}

- (id)outputMeasurementUnitType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[WFGetHomeAccessoryStateAction characteristic](self, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0DC7BE8];
    -[WFGetHomeAccessoryStateAction characteristic](self, "characteristic");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WFUnitForHMCharacteristic(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unitTypeForUnitClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  -[WFGetHomeAccessoryStateAction characteristic](self, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFGetHomeAccessoryStateAction;
    -[WFAction localizedDefaultOutputNameWithContext:](&v11, sel_localizedDefaultOutputNameWithContext_, v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  -[WFAction nameUpdated](self, "nameUpdated", a3);
  -[WFAction outputDetailsUpdated](self, "outputDetailsUpdated");
  -[WFGetHomeAccessoryStateAction updateCharacteristicsEnumeration](self, "updateCharacteristicsEnumeration");
}

- (NSString)homeIdentifier
{
  void *v2;
  void *v3;

  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFHMService"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "homeIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v3;
}

- (id)home
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFHMService"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "homeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeWithIdentifier:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)homeName
{
  void *v2;
  void *v3;

  -[WFGetHomeAccessoryStateAction home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)characteristic
{
  void *v2;
  void *v3;

  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFHMCharacteristic"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateCharacteristicsEnumeration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[WFAction parameterForKey:](self, "parameterForKey:", CFSTR("WFHMCharacteristic"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFHMService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setService:homeIdentifier:", v4, v5);

}

void __60__WFGetHomeAccessoryStateAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "characteristic");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __60__WFGetHomeAccessoryStateAction_runAsynchronouslyWithInput___block_invoke_2;
    v5[3] = &unk_1E7AF7B78;
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "readValueWithCompletionHandler:", v5);

  }
  else
  {
    objc_msgSend(v3, "finishRunningWithError:", 0);
  }
}

void __60__WFGetHomeAccessoryStateAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11 && v4)
  {
    WFUnitForHMCharacteristic(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0CB3758]);
      objc_msgSend(v4, "doubleValue");
      v7 = (void *)objc_msgSend(v6, "initWithDoubleValue:unit:", v5);
      objc_msgSend(*(id *)(a1 + 32), "output");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = v7;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "output");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      WFFormattedCharacteristicValueForCharacteristic(v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v10 = v9;
    }
    objc_msgSend(v8, "addObject:", v10);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v11);

}

void __58__WFGetHomeAccessoryStateAction_wasAddedToWorkflowByUser___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  WFHMServiceParameterState *v5;
  WFHMCharacteristicSubstitutableState *v6;
  id v7;

  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryHome");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v7;
  if (v7)
  {
    WFSerializableHomeIdentifier(v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[WFHMServiceParameterState initWithService:homeIdentifier:]([WFHMServiceParameterState alloc], "initWithService:homeIdentifier:", 0, v4);
    v6 = -[WFHMCharacteristicSubstitutableState initWithCharacteristic:homeIdentifier:]([WFHMCharacteristicSubstitutableState alloc], "initWithCharacteristic:homeIdentifier:", 0, v4);
    objc_msgSend(*(id *)(a1 + 32), "setParameterState:forKey:", v5, CFSTR("WFHMService"));
    objc_msgSend(*(id *)(a1 + 32), "setParameterState:forKey:", v6, CFSTR("WFHMCharacteristic"));

    v3 = v7;
  }

}

@end

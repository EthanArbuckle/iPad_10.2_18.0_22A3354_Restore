@implementation WFUnitVariableAggrandizement

- (WFUnitVariableAggrandizement)initWithUnit:(id)a3 unitType:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  WFUnitVariableAggrandizement *v11;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFUnitVariableAggrandizement.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("unitType"));

  }
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("WFMeasurementUnitType"));
  if (v7)
  {
    objc_msgSend(v7, "symbol");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("WFUnitSymbol"));

  }
  v11 = -[WFVariableAggrandizement initWithDictionary:](self, "initWithDictionary:", v9);

  return v11;
}

- (NSString)unitType
{
  void *v2;
  void *v3;

  -[WFVariableAggrandizement dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WFMeasurementUnitType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSUnit)unit
{
  NSUnit *unit;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSUnit *v8;
  NSUnit *v9;

  unit = self->_unit;
  if (!unit)
  {
    -[WFUnitVariableAggrandizement unitType](self, "unitType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFVariableAggrandizement dictionary](self, "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("WFUnitSymbol"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0DC7BE8], "availableUnitsForUnitType:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectMatchingKey:value:", CFSTR("symbol"), v6);
      v8 = (NSUnit *)objc_claimAutoreleasedReturnValue();
      v9 = self->_unit;
      self->_unit = v8;

    }
    unit = self->_unit;
  }
  return unit;
}

- (id)availableUnits
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC7BE8];
  -[WFUnitVariableAggrandizement unitType](self, "unitType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableUnitsForUnitType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)processedContentClasses:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", objc_opt_class());
}

- (void)applyToContentCollection:(id)a3 completionHandler:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__WFUnitVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke;
  v4[3] = &unk_1E7AF6CC8;
  v4[4] = self;
  objc_msgSend(a3, "transformItemsUsingBlock:completionHandler:", v4, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);
}

void __75__WFUnitVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__WFUnitVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke_2;
  v8[3] = &unk_1E7AF5560;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  v7 = a2;
  objc_msgSend(v7, "getObjectRepresentation:forClass:", v8, objc_opt_class());

}

void __75__WFUnitVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "unit");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "measurementByConvertingToUnit:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

@end

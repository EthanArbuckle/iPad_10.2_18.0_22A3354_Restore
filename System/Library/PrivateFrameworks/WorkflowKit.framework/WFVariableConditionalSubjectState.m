@implementation WFVariableConditionalSubjectState

- (WFVariableConditionalSubjectState)initWithVariableState:(id)a3
{
  id v6;
  WFVariableConditionalSubjectState *v7;
  WFVariableConditionalSubjectState *v8;
  WFVariableConditionalSubjectState *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVariableConditionalSubjectState.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("variableState"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFVariableConditionalSubjectState;
  v7 = -[WFVariableConditionalSubjectState init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_variableState, a3);
    v9 = v8;
  }

  return v8;
}

- (WFVariableConditionalSubjectState)initWithVariable:(id)a3
{
  id v5;
  WFVariableParameterState *v6;
  WFVariableConditionalSubjectState *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVariableConditionalSubjectState.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("variable"));

  }
  v6 = -[WFVariableParameterState initWithVariable:]([WFVariableParameterState alloc], "initWithVariable:", v5);
  v7 = -[WFVariableConditionalSubjectState initWithVariableState:](self, "initWithVariableState:", v6);

  return v7;
}

- (WFVariableConditionalSubjectState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  WFVariableParameterState *v17;
  WFVariableConditionalSubjectState *v18;
  int v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = objc_opt_class();
  v12 = v8;
  if (v12 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v20 = 136315906;
      v21 = "WFEnforceClass";
      v22 = 2114;
      v23 = v12;
      v24 = 2114;
      v25 = (id)objc_opt_class();
      v26 = 2114;
      v27 = v11;
      v15 = v25;
      _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v20, 0x2Au);

    }
    v13 = 0;
  }
  else
  {
    v13 = v12;
  }

  objc_msgSend(v13, "objectForKey:", CFSTR("Variable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[WFVariableParameterState initWithSerializedRepresentation:variableProvider:parameter:]([WFVariableParameterState alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v16, v10, v9);

  if (v17)
  {
    self = -[WFVariableConditionalSubjectState initWithVariableState:](self, "initWithVariableState:", v17);
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (WFPropertyListObject)serializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFVariableConditionalSubjectState;
  -[WFConditionalSubjectParameterState serializedRepresentation](&v8, sel_serializedRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[WFVariableConditionalSubjectState variableState](self, "variableState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serializedRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v6, CFSTR("Variable"));

  return (WFPropertyListObject *)v4;
}

- (WFVariable)variable
{
  void *v2;
  void *v3;

  -[WFVariableConditionalSubjectState variableState](self, "variableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "variable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFVariable *)v3;
}

- (BOOL)isEqual:(id)a3
{
  WFVariableConditionalSubjectState *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WFVariableConditionalSubjectState *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFVariableConditionalSubjectState variableState](self, "variableState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFVariableConditionalSubjectState variableState](v4, "variableState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFVariableConditionalSubjectState variableState](self, "variableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSArray)containedVariables
{
  void *v2;
  void *v3;

  -[WFVariableConditionalSubjectState variableState](self, "variableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containedVariables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)getContentWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WFVariableConditionalSubjectState variable](self, "variable");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getContentWithContext:completionHandler:", v7, v6);

}

- (int64_t)contentType
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;

  -[WFVariableConditionalSubjectState effectiveContentProperty](self, "effectiveContentProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_msgSend(v3, "propertyClass");
    if ((objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
    {
      v6 = 8;
    }
    else
    {
      v6 = 1;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class());

      if ((v10 & 1) == 0)
      {
        if ((objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
          || (objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
          || (objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
          || (objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
          || (objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
          || (objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
          || (objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
        {
          v6 = 2;
        }
        else if ((objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
        {
          v6 = 3;
        }
        else if ((objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
        {
          v6 = 5;
        }
        else if ((objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
        {
          v6 = 6;
        }
        else if ((objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
        {
          v6 = 7;
        }
        else if ((objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
        {
          v6 = 4;
        }
        else if (objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()))
        {
          v6 = 4;
        }
        else
        {
          v6 = 0;
        }
      }
    }
  }
  else
  {
    -[WFVariableConditionalSubjectState variable](self, "variable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "possibleAggrandizedContentClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v8, "count") <= 1)
    {
      v11 = (void *)objc_msgSend(v8, "firstObject");
      if ((objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
      {
        v6 = 1;
      }
      else if (v11 == (void *)objc_opt_class()
             || (objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
             || (objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
             || (objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
             || (objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
             || (objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
      {
        v6 = 2;
      }
      else if ((objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
      {
        v6 = 3;
      }
      else if ((objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
      {
        v6 = 5;
      }
      else if ((objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
      {
        v6 = 6;
      }
      else if ((objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
      {
        v6 = 7;
      }
      else if ((objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
      {
        v6 = 4;
      }
      else if (objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()))
      {
        v6 = 8;
      }
      else
      {
        v6 = 0;
      }
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (Class)contentClassProvidingContentProperty
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  id v14;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[WFVariableConditionalSubjectState variable](self, "variable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAvailable");

  if (!v4)
    return (Class)0;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[WFVariableConditionalSubjectState variable](self, "variable", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aggrandizements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v7)
  {

LABEL_15:
    -[WFVariableConditionalSubjectState variable](self, "variable");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "possibleContentClasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(v9, "firstObject");
    if (v17 == (void *)objc_opt_class())
    {
      objc_opt_class();
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v17;
    }
    goto LABEL_18;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v20;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v20 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;

        v9 = v13;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v8);

  if (!v9)
    goto LABEL_15;
  objc_msgSend(v9, "coercionItemClass");
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
  v18 = v14;

  return (Class)v18;
}

- (WFContentProperty)effectiveContentProperty
{
  WFContentProperty *effectiveContentProperty;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WFContentProperty *v8;
  WFContentProperty *v9;
  WFContentProperty *v10;
  void *v12;
  char isKindOfClass;

  effectiveContentProperty = self->_effectiveContentProperty;
  if (effectiveContentProperty)
    goto LABEL_4;
  -[WFVariableConditionalSubjectState variable](self, "variable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aggrandizements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v4, "aggrandizements");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
      goto LABEL_7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v10 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v4, "action");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_7:
      v10 = 0;
    }
    else
    {
      objc_msgSend(v12, "selectedProperty");
      v10 = (WFContentProperty *)objc_claimAutoreleasedReturnValue();
    }

LABEL_9:
    return v10;
  }
  objc_msgSend(v6, "propertyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class propertyForName:](-[WFVariableConditionalSubjectState contentClassProvidingContentProperty](self, "contentClassProvidingContentProperty"), "propertyForName:", v7);
  v8 = (WFContentProperty *)objc_claimAutoreleasedReturnValue();
  v9 = self->_effectiveContentProperty;
  self->_effectiveContentProperty = v8;

  effectiveContentProperty = self->_effectiveContentProperty;
LABEL_4:
  v10 = effectiveContentProperty;
  return v10;
}

- (id)supportedComparisonOperators
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[WFVariableConditionalSubjectState effectiveContentProperty](self, "effectiveContentProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allowedOperators");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFVariableConditionalSubjectState;
    -[WFConditionalSubjectParameterState supportedComparisonOperators](&v8, sel_supportedComparisonOperators);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (Class)effectiveContentClass
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[WFVariableConditionalSubjectState effectiveContentProperty](self, "effectiveContentProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFVariableConditionalSubjectState effectiveContentProperty](self, "effectiveContentProperty");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertyClass");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v7 = (void *)v5;
    goto LABEL_7;
  }
  -[WFVariableConditionalSubjectState variable](self, "variable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "possibleAggrandizedContentClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v4, "count") <= 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v7 = 0;
LABEL_7:

  return (Class)v7;
}

- (BOOL)isCaseInsensitive
{
  void *v3;
  void *v4;
  char v5;

  -[WFVariableConditionalSubjectState effectiveContentProperty](self, "effectiveContentProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFVariableConditionalSubjectState effectiveContentProperty](self, "effectiveContentProperty");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "caseInsensitive");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)unitType
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[WFVariableConditionalSubjectState variable](self, "variable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aggrandizements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {

  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v3, "action");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "outputMeasurementUnitType");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  objc_msgSend(v3, "aggrandizements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[WFVariableConditionalSubjectState effectiveContentProperty](self, "effectiveContentProperty");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "measurementUnitType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  objc_msgSend(v6, "unitType");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v9 = (void *)v7;
LABEL_9:

  return v9;
}

- (BOOL)isIrrational
{
  void *v3;
  void *v4;
  char v5;

  -[WFVariableConditionalSubjectState effectiveContentProperty](self, "effectiveContentProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFVariableConditionalSubjectState effectiveContentProperty](self, "effectiveContentProperty");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isIrrational");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)tense
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[WFVariableConditionalSubjectState effectiveContentProperty](self, "effectiveContentProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFVariableConditionalSubjectState effectiveContentProperty](self, "effectiveContentProperty");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "tense");

  }
  else
  {
    v5 = 3;
  }

  return v5;
}

- (unint64_t)displayableTimeUnits
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[WFVariableConditionalSubjectState effectiveContentProperty](self, "effectiveContentProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFVariableConditionalSubjectState effectiveContentProperty](self, "effectiveContentProperty");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "timeUnits");

  }
  else
  {
    v5 = 8444;
  }

  return v5;
}

- (unint64_t)comparableTimeUnits
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[WFVariableConditionalSubjectState effectiveContentProperty](self, "effectiveContentProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFVariableConditionalSubjectState effectiveContentProperty](self, "effectiveContentProperty");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "comparableUnits");

  }
  else
  {
    v5 = 8444;
  }

  return v5;
}

- (BOOL)isEnumeration
{
  void *v3;
  BOOL v4;

  -[WFVariableConditionalSubjectState effectiveContentProperty](self, "effectiveContentProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "hasPossibleValues") & 1) != 0
    || -[WFVariableConditionalSubjectState contentType](self, "contentType") == 8;

  return v4;
}

- (void)getEnumerationPossibleStatesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[WFVariableConditionalSubjectState effectiveContentProperty](self, "effectiveContentProperty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "possibleValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __87__WFVariableConditionalSubjectState_getEnumerationPossibleStatesWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E7AF8250;
    v13 = v4;
    objc_msgSend(v7, "getValuesWithCompletionBlock:", v12);

  }
  else
  {
    v8 = -[WFVariableConditionalSubjectState effectiveContentClass](self, "effectiveContentClass");
    if (-[objc_class isSubclassOfClass:](v8, "isSubclassOfClass:", objc_opt_class()))
    {
      -[objc_class enumMetadata](v8, "enumMetadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cases");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "if_map:", &__block_literal_global_59321);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v4 + 2))(v4, v11);

    }
    else
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }
  }

}

- (id)localizedLabelForEnumerationPossibleState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  objc_msgSend(v4, "variable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = -[WFVariableConditionalSubjectState effectiveContentClass](self, "effectiveContentClass");
    if (-[objc_class isSubclassOfClass:](v8, "isSubclassOfClass:", objc_opt_class()))
    {
      -[objc_class enumMetadata](v8, "enumMetadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cases");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __79__WFVariableConditionalSubjectState_localizedLabelForEnumerationPossibleState___block_invoke;
      v14[3] = &unk_1E7AF89A0;
      v15 = v4;
      objc_msgSend(v10, "if_firstObjectPassingTest:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "displayRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForLocaleIdentifier:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      goto LABEL_3;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      WFLocalizedContentPropertyPossibleValue(v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
LABEL_2:
  v6 = 0;
LABEL_3:

  return v6;
}

- (WFVariableParameterState)variableState
{
  return self->_variableState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variableState, 0);
  objc_storeStrong((id *)&self->_effectiveContentProperty, 0);
}

uint64_t __79__WFVariableConditionalSubjectState_localizedLabelForEnumerationPossibleState___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(id *)(a1 + 32);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v3, "isEqualToString:", v7);
  return v8;
}

void __87__WFVariableConditionalSubjectState_getEnumerationPossibleStatesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "if_compactMap:", &__block_literal_global_153);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

WFStringSubstitutableState *__87__WFVariableConditionalSubjectState_getEnumerationPossibleStatesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  WFStringSubstitutableState *v3;
  WFStringSubstitutableState *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  WFLinkEnumerationSubstitutableState *v13;
  void *v14;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = -[WFVariableSubstitutableParameterState initWithValue:]([WFStringSubstitutableState alloc], "initWithValue:", v2);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = [WFStringSubstitutableState alloc];
      objc_msgSend(v2, "spokenPhrase");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[WFVariableSubstitutableParameterState initWithValue:](v4, "initWithValue:", v5);

    }
    else
    {
      v6 = v2;
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7 = v6;
        else
          v7 = 0;
      }
      else
      {
        v7 = 0;
      }
      v8 = v7;

      objc_msgSend(v8, "valueType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      LOBYTE(v8) = objc_opt_isKindOfClass();

      if ((v8 & 1) != 0)
      {
        v10 = v6;
        if (v6)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v11 = v10;
          else
            v11 = 0;
        }
        else
        {
          v11 = 0;
        }
        v12 = v11;

        v13 = [WFLinkEnumerationSubstitutableState alloc];
        objc_msgSend(v12, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v3 = -[WFVariableSubstitutableParameterState initWithValue:](v13, "initWithValue:", v14);
      }
      else
      {
        v3 = 0;
      }
    }
  }

  return v3;
}

WFLinkEnumerationSubstitutableState *__87__WFVariableConditionalSubjectState_getEnumerationPossibleStatesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFLinkEnumerationSubstitutableState *v3;
  void *v4;
  WFLinkEnumerationSubstitutableState *v5;

  v2 = a2;
  v3 = [WFLinkEnumerationSubstitutableState alloc];
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[WFVariableSubstitutableParameterState initWithValue:](v3, "initWithValue:", v4);
  return v5;
}

+ (id)subjectType
{
  return CFSTR("Variable");
}

@end

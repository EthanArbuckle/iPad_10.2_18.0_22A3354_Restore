@implementation WFConditionalSubjectParameterState

- (WFConditionalSubjectParameterState)initWithVariable:(id)a3
{
  id v4;
  WFVariableConditionalSubjectState *v5;

  v4 = a3;
  v5 = -[WFVariableConditionalSubjectState initWithVariable:]([WFVariableConditionalSubjectState alloc], "initWithVariable:", v4);

  return &v5->super;
}

- (WFConditionalSubjectParameterState)initWithHomeIdentifier:(id)a3
{
  id v6;
  WFConditionalSubjectParameterState *v7;
  void *v9;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFConditionalSubjectParameterState.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homeIdentifier"));

    if (!self)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (self)
  {
LABEL_3:
    objc_storeStrong((id *)&self->_homeIdentifier, a3);
    v7 = self;
  }
LABEL_4:

  return self;
}

- (WFConditionalSubjectParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  WFConditionalSubjectParameterState *v16;
  uint64_t v17;
  WFConditionalSubjectParameterState *i;
  void *v19;
  void *v20;
  int v21;
  id v22;
  BOOL v23;
  void *v25;
  id v26;
  WFConditionalSubjectParameterState *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class();
  v12 = v8;
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "objectForKey:", CFSTR("Type"));
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("HomeIdentifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      objc_msgSend((id)objc_opt_class(), "subjectClasses");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (WFConditionalSubjectParameterState *)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v16)
      {
        v25 = v14;
        v26 = v9;
        v27 = self;
        v17 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v16; i = (WFConditionalSubjectParameterState *)((char *)i + 1))
          {
            if (*(_QWORD *)v29 != v17)
              objc_enumerationMutation(v15);
            v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v19, "subjectType");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEqualToString:", v13);

            if (v21)
            {
              v9 = v26;
              v16 = (WFConditionalSubjectParameterState *)objc_msgSend(objc_alloc((Class)v19), "initWithSerializedRepresentation:variableProvider:parameter:", v12, v26, v10);
              self = v27;
              goto LABEL_17;
            }
          }
          v16 = (WFConditionalSubjectParameterState *)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          if (v16)
            continue;
          break;
        }
        v9 = v26;
        self = v27;
LABEL_17:
        v14 = v25;
      }

      if (v16)
        v23 = 1;
      else
        v23 = v14 == 0;
      if (!v23)
        v16 = -[WFConditionalSubjectParameterState initWithHomeIdentifier:]([WFConditionalSubjectParameterState alloc], "initWithHomeIdentifier:", v14);

    }
    else
    {
      getWFGeneralLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315906;
        v34 = "WFEnforceClass";
        v35 = 2114;
        v36 = v12;
        v37 = 2114;
        v38 = (id)objc_opt_class();
        v39 = 2114;
        v40 = v11;
        v22 = v38;
        _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

      }
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (WFPropertyListObject)serializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "subjectType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Type"));
  -[WFConditionalSubjectParameterState homeIdentifier](self, "homeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("HomeIdentifier"));

  return (WFPropertyListObject *)v3;
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  if (self == a3)
  {
    isKindOfClass = 1;
  }
  else
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (NSArray)containedVariables
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)getContentWithContext:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__WFConditionalSubjectParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
  v9[3] = &unk_1E7AF6F98;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  -[WFConditionalSubjectParameterState getContentWithContext:completionHandler:](self, "getContentWithContext:completionHandler:", a3, v9);

}

- (int64_t)contentType
{
  return 0;
}

- (id)supportedComparisonOperators
{
  return WFSupportedContentOperatorsForContentType(-[WFConditionalSubjectParameterState contentType](self, "contentType"), -[WFConditionalSubjectParameterState isEnumeration](self, "isEnumeration"), -[WFConditionalSubjectParameterState isIrrational](self, "isIrrational"), -[WFConditionalSubjectParameterState tense](self, "tense"));
}

- (void)getEnumerationPossibleStatesWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (id)localizedLabelForEnumerationPossibleState:(id)a3
{
  return 0;
}

- (NSNumber)maximumLength
{
  return self->_maximumLength;
}

- (BOOL)isCaseInsensitive
{
  return self->_caseInsensitive;
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (BOOL)isIrrational
{
  return self->_irrational;
}

- (unint64_t)tense
{
  return self->_tense;
}

- (unint64_t)displayableTimeUnits
{
  return self->_displayableTimeUnits;
}

- (unint64_t)comparableTimeUnits
{
  return self->_comparableTimeUnits;
}

- (NSString)unitType
{
  return self->_unitType;
}

- (WFVariable)variable
{
  return self->_variable;
}

- (BOOL)isEnumeration
{
  return self->_enumeration;
}

- (NSString)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void)setHomeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_variable, 0);
  objc_storeStrong((id *)&self->_unitType, 0);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
  objc_storeStrong((id *)&self->_maximumLength, 0);
}

void __95__WFConditionalSubjectParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  WFConditionalSubjectValue *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = (uint64_t)v9;
    if (!v9)
      v6 = objc_opt_new();
    v9 = (id)v6;
    v7 = *(_QWORD *)(a1 + 40);
    v8 = -[WFConditionalSubjectValue initWithContent:contentType:caseInsensitive:comparableTimeUnits:]([WFConditionalSubjectValue alloc], "initWithContent:contentType:caseInsensitive:comparableTimeUnits:", v6, objc_msgSend(*(id *)(a1 + 32), "contentType"), objc_msgSend(*(id *)(a1 + 32), "isCaseInsensitive"), objc_msgSend(*(id *)(a1 + 32), "comparableTimeUnits"));
    (*(void (**)(uint64_t, WFConditionalSubjectValue *, _QWORD))(v7 + 16))(v7, v8, 0);

  }
}

+ (id)subjectClasses
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)subjectType
{
  return CFSTR("Default");
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end

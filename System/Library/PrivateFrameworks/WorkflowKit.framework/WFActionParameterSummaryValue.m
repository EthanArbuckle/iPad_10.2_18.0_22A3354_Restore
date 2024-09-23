@implementation WFActionParameterSummaryValue

- (WFActionParameterSummaryValue)initWithKey:(id)a3 summaryString:(id)a4
{
  id v6;
  id v7;
  WFActionParameterSummaryValue *v8;
  WFActionParameterSummaryValue *v9;
  uint64_t v10;
  _NSLocalizedStringResource *summaryString;
  WFActionParameterSummaryValue *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFActionParameterSummaryValue;
  v8 = -[WFActionParameterSummaryValue init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    WFActionParameterSummaryValueCommonInit(v8, v6);
    v10 = objc_msgSend(v7, "copy");
    summaryString = v9->_summaryString;
    v9->_summaryString = (_NSLocalizedStringResource *)v10;

    v12 = v9;
  }

  return v9;
}

- (WFActionParameterSummaryValue)initWithKey:(id)a3 localizedSummaryString:(id)a4
{
  id v6;
  id v7;
  WFActionParameterSummaryValue *v8;
  WFActionParameterSummaryValue *v9;
  uint64_t v10;
  NSString *localizedSummaryString;
  WFActionParameterSummaryValue *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFActionParameterSummaryValue;
  v8 = -[WFActionParameterSummaryValue init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    WFActionParameterSummaryValueCommonInit(v8, v6);
    v10 = objc_msgSend(v7, "copy");
    localizedSummaryString = v9->_localizedSummaryString;
    v9->_localizedSummaryString = (NSString *)v10;

    v12 = v9;
  }

  return v9;
}

- (NSString)localizedString
{
  _NSLocalizedStringResource *summaryString;
  __CFString *v4;
  NSString *localizedSummaryString;

  summaryString = self->_summaryString;
  if (summaryString)
  {
    -[_NSLocalizedStringResource localize](summaryString, "localize");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    localizedSummaryString = self->_localizedSummaryString;
    if (localizedSummaryString)
      return localizedSummaryString;
    v4 = &stru_1E7AFA810;
  }
  return (NSString *)v4;
}

- (id)matchVisibleParameterKeys:(id)a3 checkingRequiredValuesInAction:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  WFActionParameterSummaryValueMatchResult *v28;
  void *v29;
  void *v31;
  void *v32;
  id v33;
  id obj;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[WFActionParameterSummaryValue requiredVisibleParameterKeys](self, "requiredVisibleParameterKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

  if ((objc_msgSend(v10, "isSubsetOfSet:", v6) & 1) != 0)
  {
    v31 = v10;
    v32 = v6;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[WFActionParameterSummaryValue requiredValues](self, "requiredValues");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v37;
      v33 = v7;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v37 != v13)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          -[WFActionParameterSummaryValue requiredValues](self, "requiredValues");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "parameterStateForKey:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v19 = v18;
            v35 = v17;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v17, "BOOLValue"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "number");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isEqualToNumber:", v20);

            if (!v22)
            {
              +[WFActionParameterSummaryValueMatchResult noMatchWithValue:](WFActionParameterSummaryValueMatchResult, "noMatchWithValue:", self);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              v6 = v32;
              v7 = v33;
              v10 = v31;
              v17 = v35;
              goto LABEL_23;
            }

            v7 = v33;
            v23 = v35;
          }
          else
          {
            if (!v18)
              goto LABEL_22;
            objc_msgSend(v18, "serializedRepresentation");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v17;
            v25 = objc_msgSend(v24, "isEqual:", v17);

            if ((v25 & 1) == 0)
            {
              v17 = v23;
LABEL_22:
              +[WFActionParameterSummaryValueMatchResult noMatchWithValue:](WFActionParameterSummaryValueMatchResult, "noMatchWithValue:", self);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v18;
              v10 = v31;
              v6 = v32;
LABEL_23:

              goto LABEL_24;
            }
          }

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v12)
          continue;
        break;
      }
    }

    v10 = v31;
    v26 = objc_msgSend(v31, "count");
    v6 = v32;
    if (v26 == objc_msgSend(v32, "count"))
      v27 = 2;
    else
      v27 = 1;
    v28 = -[WFActionParameterSummaryValueMatchResult initWithValue:matchType:numberOfMatchingParameters:]([WFActionParameterSummaryValueMatchResult alloc], "initWithValue:matchType:numberOfMatchingParameters:", self, v27, objc_msgSend(v31, "count"));
  }
  else
  {
    +[WFActionParameterSummaryValueMatchResult noMatchWithValue:](WFActionParameterSummaryValueMatchResult, "noMatchWithValue:", self);
    v28 = (WFActionParameterSummaryValueMatchResult *)objc_claimAutoreleasedReturnValue();
  }
  v29 = v28;
LABEL_24:

  return v29;
}

- (NSArray)requiredVisibleParameterKeys
{
  return self->_requiredVisibleParameterKeys;
}

- (NSDictionary)requiredValues
{
  return self->_requiredValues;
}

- (NSString)key
{
  return self->_key;
}

- (_NSLocalizedStringResource)summaryString
{
  return self->_summaryString;
}

- (NSString)localizedSummaryString
{
  return self->_localizedSummaryString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSummaryString, 0);
  objc_storeStrong((id *)&self->_summaryString, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_requiredValues, 0);
  objc_storeStrong((id *)&self->_requiredVisibleParameterKeys, 0);
}

+ (id)parenthesisRegularExpression
{
  if (parenthesisRegularExpression_onceToken != -1)
    dispatch_once(&parenthesisRegularExpression_onceToken, &__block_literal_global_45163);
  return (id)parenthesisRegularExpression_regularExpression;
}

void __61__WFActionParameterSummaryValue_parenthesisRegularExpression__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\((.*)\\)"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)parenthesisRegularExpression_regularExpression;
  parenthesisRegularExpression_regularExpression = v0;

}

@end

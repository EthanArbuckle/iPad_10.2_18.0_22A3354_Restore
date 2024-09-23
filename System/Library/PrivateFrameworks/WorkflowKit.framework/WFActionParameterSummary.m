@implementation WFActionParameterSummary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_singleFormatLocalizedString, 0);
  objc_storeStrong((id *)&self->_singleFormatString, 0);
  objc_storeStrong((id *)&self->_possibleValues, 0);
}

- (WFActionParameterSummary)initWithString:(id)a3
{
  return -[WFActionParameterSummary initWithString:title:](self, "initWithString:title:", a3, 0);
}

- (WFActionParameterSummary)initWithLocalizedString:(id)a3
{
  id v6;
  WFActionParameterSummary *v7;
  WFActionParameterSummary *v8;
  WFActionParameterSummary *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionParameterSummary.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFActionParameterSummary;
  v7 = -[WFActionParameterSummary init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_singleFormatLocalizedString, a3);
    v9 = v8;
  }

  return v8;
}

- (WFActionParameterSummary)initWithValues:(id)a3
{
  return -[WFActionParameterSummary initWithValues:title:](self, "initWithValues:title:", a3, 0);
}

- (WFActionParameterSummary)initWithString:(id)a3 title:(id)a4
{
  id v8;
  id v9;
  WFActionParameterSummary *v10;
  WFActionParameterSummary *v11;
  WFActionParameterSummary *v12;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionParameterSummary.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

  }
  v15.receiver = self;
  v15.super_class = (Class)WFActionParameterSummary;
  v10 = -[WFActionParameterSummary init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_singleFormatString, a3);
    objc_storeStrong((id *)&v11->_title, a4);
    v12 = v11;
  }

  return v11;
}

- (WFActionParameterSummary)initWithValues:(id)a3 title:(id)a4
{
  id v8;
  id v9;
  WFActionParameterSummary *v10;
  WFActionParameterSummary *v11;
  WFActionParameterSummary *v12;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionParameterSummary.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("values"));

  }
  v15.receiver = self;
  v15.super_class = (Class)WFActionParameterSummary;
  v10 = -[WFActionParameterSummary init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_possibleValues, a3);
    objc_storeStrong((id *)&v11->_title, a4);
    v12 = v11;
  }

  return v11;
}

- (id)localizedFormatStringWithAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v4 = a3;
  -[WFActionParameterSummary singleFormatString](self, "singleFormatString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFActionParameterSummary singleFormatString](self, "singleFormatString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localize");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFActionParameterSummary singleFormatLocalizedString](self, "singleFormatLocalizedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[WFActionParameterSummary singleFormatLocalizedString](self, "singleFormatLocalizedString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    objc_msgSend(v4, "visibleParametersForParameterSummary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameterKeysIgnoredForParameterSummary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0C99E60]);
    v12 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __60__WFActionParameterSummary_localizedFormatStringWithAction___block_invoke;
    v26[3] = &unk_1E7AF30C0;
    v27 = v10;
    v13 = v10;
    objc_msgSend(v6, "if_compactMap:", v26);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v11, "initWithArray:", v14);

    -[WFActionParameterSummary possibleValues](self, "possibleValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __60__WFActionParameterSummary_localizedFormatStringWithAction___block_invoke_2;
    v23[3] = &unk_1E7AF30E8;
    v24 = v15;
    v25 = v4;
    v17 = v15;
    objc_msgSend(v16, "if_map:", v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "sortedArrayUsingComparator:", &__block_literal_global_38575);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "value");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
LABEL_6:

  return v7;
}

- (id)localizedTitle
{
  void *v2;
  void *v3;

  -[WFActionParameterSummary title](self, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)possibleValues
{
  return self->_possibleValues;
}

- (_NSLocalizedStringResource)singleFormatString
{
  return self->_singleFormatString;
}

- (NSString)singleFormatLocalizedString
{
  return self->_singleFormatLocalizedString;
}

- (_NSLocalizedStringResource)title
{
  return self->_title;
}

id __60__WFActionParameterSummary_localizedFormatStringWithAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v5) & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

uint64_t __60__WFActionParameterSummary_localizedFormatStringWithAction___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchVisibleParameterKeys:checkingRequiredValuesInAction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __60__WFActionParameterSummary_localizedFormatStringWithAction___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "matchType"))
  {
    if (objc_msgSend(v5, "matchType"))
    {
      v6 = objc_msgSend(v4, "numberOfMatchingParameters");
      if (v6 < objc_msgSend(v5, "numberOfMatchingParameters"))
        v7 = -1;
      else
        v7 = 1;
    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

@end

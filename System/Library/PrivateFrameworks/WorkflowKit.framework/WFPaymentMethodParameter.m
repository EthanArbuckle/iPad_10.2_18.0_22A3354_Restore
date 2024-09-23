@implementation WFPaymentMethodParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (BOOL)parameterStateIsValid:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v5 = a3;
  -[WFDynamicEnumerationParameter possibleStates](self, "possibleStates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[WFDynamicEnumerationParameter possibleStatesLoadingError](self, "possibleStatesLoadingError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_11;
  }
  objc_msgSend(v5, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {

    if (v7)
      goto LABEL_5;
LABEL_11:
    v12 = 1;
    goto LABEL_15;
  }

  if (!v7)
    goto LABEL_11;
LABEL_5:
  -[WFDynamicEnumerationParameter possibleStates](self, "possibleStates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(v5, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
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
    v13 = v11;

    -[WFDynamicEnumerationParameter possibleStates](self, "possibleStates");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __50__WFPaymentMethodParameter_parameterStateIsValid___block_invoke;
    v17[3] = &unk_1E7AF38D8;
    v18 = v13;
    v15 = v13;
    v12 = objc_msgSend(v14, "indexOfObjectPassingTest:", v17) != 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v12 = 0;
  }
LABEL_15:

  return v12;
}

uint64_t __50__WFPaymentMethodParameter_parameterStateIsValid___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  v6 = objc_msgSend(*(id *)(a1 + 32), "type");
  if (v6 == objc_msgSend(v5, "type"))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      v12 = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
      {
LABEL_20:

LABEL_21:
        goto LABEL_22;
      }
      v12 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!(_DWORD)v12)
        goto LABEL_21;
    }
    objc_msgSend(*(id *)(a1 + 32), "identificationHint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identificationHint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;
    v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      v12 = 1;
    }
    else
    {
      v12 = 0;
      if (v14 && v17)
        v12 = objc_msgSend(v14, "isEqualToString:", v17);
    }

    goto LABEL_20;
  }
  v12 = 0;
LABEL_22:

  return v12;
}

@end

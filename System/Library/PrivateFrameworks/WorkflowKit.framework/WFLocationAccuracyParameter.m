@implementation WFLocationAccuracyParameter

- (id)defaultSerializedRepresentation
{
  __CFString *v2;

  v2 = CFSTR("HundredMeters");
  return CFSTR("HundredMeters");
}

- (id)possibleStates
{
  void *v2;
  void *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("Best");
  v5[1] = CFSTR("NearestTenMeters");
  v5[2] = CFSTR("HundredMeters");
  v5[3] = CFSTR("Kilometer");
  v5[4] = CFSTR("ThreeKilometers");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_map:", &__block_literal_global_8570);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v3;
  void *v4;
  char v5;
  __CFString *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;

  v3 = a3;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Best"));

  if ((v5 & 1) != 0)
  {
    v6 = CFSTR("Best");
  }
  else
  {
    objc_msgSend(v3, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("NearestTenMeters"));

    if ((v8 & 1) != 0)
    {
      v6 = CFSTR("Nearest Ten Meters");
    }
    else
    {
      objc_msgSend(v3, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("HundredMeters"));

      if ((v10 & 1) != 0)
      {
        v6 = CFSTR("Nearest Hundred Meters");
      }
      else
      {
        objc_msgSend(v3, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Kilometer"));

        if ((v12 & 1) != 0)
        {
          v6 = CFSTR("Nearest Kilometer");
        }
        else
        {
          objc_msgSend(v3, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("ThreeKilometers"));

          if (!v14)
          {
            v15 = 0;
            goto LABEL_12;
          }
          v6 = CFSTR("Nearest Three Kilometers");
        }
      }
    }
  }
  WFLocalizedString(v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v15;
}

WFStringSubstitutableState *__45__WFLocationAccuracyParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFStringSubstitutableState *v3;

  v2 = a2;
  v3 = -[WFVariableSubstitutableParameterState initWithValue:]([WFStringSubstitutableState alloc], "initWithValue:", v2);

  return v3;
}

@end

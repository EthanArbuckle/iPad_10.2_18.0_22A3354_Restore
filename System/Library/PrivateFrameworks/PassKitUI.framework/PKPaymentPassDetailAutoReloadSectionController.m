@implementation PKPaymentPassDetailAutoReloadSectionController

+ (id)autoTopUpActionForPass:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  char v20;
  uint64_t j;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "activationState") && objc_msgSend(v3, "activationState") != 2)
  {
    v32 = 0;
  }
  else
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v3, "balanceFields");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v53;
      v43 = (void *)*MEMORY[0x1E0D6ACB8];
      v40 = v4;
      v41 = v3;
      v34 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v53 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "foreignReferenceIdentifiers", v34);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v49;
            v35 = i;
            v36 = v6;
            v42 = v10;
            v37 = *(_QWORD *)v49;
            do
            {
              v13 = 0;
              v38 = v11;
              do
              {
                if (*(_QWORD *)v49 != v12)
                  objc_enumerationMutation(v10);
                v39 = v13;
                v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v13);
                v44 = 0u;
                v45 = 0u;
                v46 = 0u;
                v47 = 0u;
                objc_msgSend(v3, "availableActions");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
                if (!v16)
                  goto LABEL_41;
                v17 = v16;
                v18 = *(_QWORD *)v45;
                if (v43)
                  v19 = v14 == 0;
                else
                  v19 = 1;
                v20 = !v19;
                while (2)
                {
                  for (j = 0; j != v17; ++j)
                  {
                    if (*(_QWORD *)v45 != v18)
                      objc_enumerationMutation(v15);
                    v22 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
                    if (objc_msgSend(v22, "type") == 6)
                    {
                      v23 = v14;
                      if (v43 == v14)
                      {
                        v28 = v43;
                        goto LABEL_50;
                      }
                      v24 = v23;
                      if ((v20 & 1) != 0)
                      {
                        v25 = objc_msgSend(v43, "caseInsensitiveCompare:", v23);

                        if (!v25)
                          goto LABEL_51;
                      }
                      else
                      {

                      }
                    }
                    objc_msgSend(v22, "associatedAutoTopUpIdentifier");
                    v26 = (id)objc_claimAutoreleasedReturnValue();
                    v27 = v14;
                    v28 = v27;
                    if (v26 == v27)
                    {

LABEL_50:
LABEL_51:
                      v32 = v22;

                      v4 = v40;
                      v3 = v41;
                      goto LABEL_52;
                    }
                    if (v14 && v26)
                    {
                      v29 = objc_msgSend(v26, "caseInsensitiveCompare:", v27);

                      if (!v29)
                        goto LABEL_51;
                    }
                    else
                    {

                    }
                    if (objc_msgSend(v22, "type") == 6)
                    {
                      objc_msgSend(v22, "relevantPropertyIdentifier");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v30)
                      {

                      }
                      else
                      {
                        objc_msgSend(v22, "associatedAutoTopUpIdentifier");
                        v31 = (void *)objc_claimAutoreleasedReturnValue();

                        if (!v31)
                          goto LABEL_51;
                      }
                    }
                  }
                  v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
                  v4 = v40;
                  v3 = v41;
                  v7 = v34;
                  i = v35;
                  v6 = v36;
                  if (v17)
                    continue;
                  break;
                }
LABEL_41:

                v13 = v39 + 1;
                v10 = v42;
                v12 = v37;
              }
              while (v39 + 1 != v38);
              v11 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
            }
            while (v11);
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
        v32 = 0;
      }
      while (v6);
    }
    else
    {
      v32 = 0;
    }
LABEL_52:

  }
  return v32;
}

+ (id)enteredValueActionForPass:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "activationState"))
  {
    v4 = 0;
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(v3, "availableActions", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v6 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v5);
          v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v8, "type") == 1
            && objc_msgSend(v8, "isActionAvailable")
            && (objc_msgSend(v8, "unavailableActionBehavior") & 2) == 0)
          {
            v4 = v8;
            goto LABEL_15;
          }
        }
        v4 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_15:

  }
  return v4;
}

+ (id)autoReloadThresholdForPass:(id)a3 action:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];
  int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(a3, "autoTopUpFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    v10 = *MEMORY[0x1E0D6A6F0];
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v12, "key");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v10);

        if (v14)
        {
          v16 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v12, "threshold");
          objc_msgSend(v16, "numberWithDouble:");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "autoTopUpItem");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "currency");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            v20 = objc_alloc(MEMORY[0x1E0D66C88]);
            v21 = (void *)MEMORY[0x1E0CB3598];
            if (v17)
            {
              objc_msgSend(v17, "decimalValue");
            }
            else
            {
              v25[0] = 0;
              v25[1] = 0;
              v26 = 0;
            }
            objc_msgSend(v21, "decimalNumberWithDecimal:", v25);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)objc_msgSend(v20, "initWithAmount:currency:exponent:", v22, v19, 0);

            objc_msgSend(v23, "formattedStringValue");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            PKFormattedStringMinimalFractionDigitsFromNumber();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_17;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v8)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_17:

  return v15;
}

+ (id)autoReloadAmountForPass:(id)a3 action:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];
  int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(a3, "autoTopUpFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    v10 = *MEMORY[0x1E0D6A6F0];
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v12, "key");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v10);

        if (v14)
        {
          v16 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v12, "amount");
          objc_msgSend(v16, "numberWithDouble:");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "autoTopUpItem");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "currency");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            v20 = objc_alloc(MEMORY[0x1E0D66C88]);
            v21 = (void *)MEMORY[0x1E0CB3598];
            if (v17)
            {
              objc_msgSend(v17, "decimalValue");
            }
            else
            {
              v25[0] = 0;
              v25[1] = 0;
              v26 = 0;
            }
            objc_msgSend(v21, "decimalNumberWithDecimal:", v25);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)objc_msgSend(v20, "initWithAmount:currency:exponent:", v22, v19, 0);

            objc_msgSend(v23, "formattedStringValue");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            PKFormattedStringMinimalFractionDigitsFromNumber();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_17;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v8)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_17:

  return v15;
}

@end

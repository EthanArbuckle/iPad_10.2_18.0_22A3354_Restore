@implementation NSValueTransformer

uint64_t __68__NSValueTransformer_MTLInversionAdditions__mtl_invertedTransformer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "reverseTransformedValue:success:error:", a2, a3, a4);
}

uint64_t __68__NSValueTransformer_MTLInversionAdditions__mtl_invertedTransformer__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "transformedValue:success:error:", a2, a3, a4);
}

uint64_t __68__NSValueTransformer_MTLInversionAdditions__mtl_invertedTransformer__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "reverseTransformedValue:", a2);
}

uint64_t __68__NSValueTransformer_MTLInversionAdditions__mtl_invertedTransformer__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "transformedValue:", a2);
}

id __101__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_transformerWithFormatter_forObjectClass___block_invoke(uint64_t a1, void *a2, _BYTE *a3, _QWORD *a4)
{
  id v7;
  void *v8;
  char v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[5];

  v45[3] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = *(void **)(a1 + 32);
      v38 = 0;
      v39 = 0;
      v9 = objc_msgSend(v8, "getObjectValue:forString:errorDescription:", &v39, v7, &v38);
      v10 = v39;
      v11 = v38;
      *a3 = v9;
      if (v11)
      {
        if (a4)
        {
          v42[0] = *MEMORY[0x1E0CB2D50];
          v12 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Could not convert string to %@"), &stru_1E7AFA810, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", v14, *(_QWORD *)(a1 + 40));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = *MEMORY[0x1E0CB2D68];
          v43[0] = v15;
          v43[1] = v11;
          v42[1] = v16;
          v42[2] = CFSTR("MTLTransformerErrorHandlingInputValueErrorKey");
          v43[2] = v7;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLTransformerErrorHandlingErrorDomain"), 1, v17);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = v10;
LABEL_15:

          goto LABEL_16;
        }
        if (a4)
        {
          v40[0] = *MEMORY[0x1E0CB2D50];
          v28 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Could not convert string to %@"), &stru_1E7AFA810, 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringWithFormat:", v36, *(_QWORD *)(a1 + 40));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v41[0] = v29;
          v40[1] = *MEMORY[0x1E0CB2D68];
          v30 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Expected an %@ as output from the formatter, got: %@."), &stru_1E7AFA810, 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "stringWithFormat:", v32, *(_QWORD *)(a1 + 40), v10);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v41[1] = v33;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 2048, v34);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      v18 = 0;
      *a3 = 0;
      goto LABEL_15;
    }
    if (a4)
    {
      v44[0] = *MEMORY[0x1E0CB2D50];
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Could not convert string to %@"), &stru_1E7AFA810, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", v21, *(_QWORD *)(a1 + 40));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v22;
      v44[1] = *MEMORY[0x1E0CB2D68];
      v23 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Expected an NSString as input, got: %@."), &stru_1E7AFA810, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", v25, v7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v44[2] = CFSTR("MTLTransformerErrorHandlingInputValueErrorKey");
      v45[1] = v26;
      v45[2] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLTransformerErrorHandlingErrorDomain"), 1, v27);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v18 = 0;
    *a3 = 0;
  }
  else
  {
    v18 = 0;
  }
LABEL_16:

  return v18;
}

_QWORD *__101__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_transformerWithFormatter_forObjectClass___block_invoke_2(uint64_t a1, void *a2, BOOL *a3, _QWORD *a4)
{
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "stringForObjectValue:", v7);
      a4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v8 = a4 != 0;
    }
    else if (a4)
    {
      v19[0] = *MEMORY[0x1E0CB2D50];
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Could not convert %@ to string"), &stru_1E7AFA810, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v11, *(_QWORD *)(a1 + 40));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v12;
      v19[1] = *MEMORY[0x1E0CB2D68];
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Expected an %@ as input, got: %@."), &stru_1E7AFA810, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", v15, *(_QWORD *)(a1 + 40), v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2] = CFSTR("MTLTransformerErrorHandlingInputValueErrorKey");
      v20[1] = v16;
      v20[2] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLTransformerErrorHandlingErrorDomain"), 1, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v8 = 0;
      a4 = 0;
    }
    else
    {
      v8 = 0;
    }
    *a3 = v8;
  }
  else
  {
    a4 = 0;
  }

  return a4;
}

id __132__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_valueMappingTransformerWithDictionary_defaultValue_reverseDefaultValue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = *(void **)(a1 + 40);
  v8 = v6;

  if (!v3)
  return v8;
}

id __132__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_valueMappingTransformerWithDictionary_defaultValue_reverseDefaultValue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__53121;
  v16 = __Block_byref_object_dispose__53122;
  v17 = 0;
  v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __132__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_valueMappingTransformerWithDictionary_defaultValue_reverseDefaultValue___block_invoke_118;
  v9[3] = &unk_1E7AF6828;
  v5 = v3;
  v10 = v5;
  v11 = &v12;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);
  v6 = (void *)v13[5];
  if (!v6)
    v6 = *(void **)(a1 + 40);
  v7 = v6;

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __132__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_valueMappingTransformerWithDictionary_defaultValue_reverseDefaultValue___block_invoke_118(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", a3))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

id __91__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_validatingTransformerForClass___block_invoke(uint64_t a1, void *a2, _BYTE *a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v17[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Value did not match expected type"), &stru_1E7AFA810, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v10;
      v17[1] = *MEMORY[0x1E0CB2D68];
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Expected %1$@ to be of class %2$@ but got %3$@"), &stru_1E7AFA810, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v13, v7, *(_QWORD *)(a1 + 32), objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2] = CFSTR("MTLTransformerErrorHandlingInputValueErrorKey");
      v18[1] = v14;
      v18[2] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLTransformerErrorHandlingErrorDomain"), 1, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v8 = 0;
    *a3 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

id __100__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_arrayMappingTransformerWithTransformer___block_invoke(uint64_t a1, void *a2, _BYTE *a3, _QWORD *a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  _QWORD v51[4];
  _BYTE v52[128];
  _QWORD v53[3];
  _QWORD v54[5];

  v54[3] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v41 = v7;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v47;
        v13 = -1;
LABEL_5:
        v14 = 0;
        v42 = v13 + 1;
        v43 = v13 + v11;
        while (1)
        {
          if (*(_QWORD *)v47 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v14);
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 == v16)
            break;
          v17 = objc_msgSend(*(id *)(a1 + 32), "conformsToProtocol:", &unk_1EF727668);
          v18 = *(void **)(a1 + 32);
          if (v17)
          {
            v45 = 0;
            objc_msgSend(v18, "transformedValue:success:error:", v15, a3, &v45);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v45;
            v21 = v20;
            if (!*a3)
            {
              if (a4)
              {
                v30 = v9;
                v31 = v42 + v14;
                v50[0] = *MEMORY[0x1E0CB2D50];
                objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("Could not transform array"), &stru_1E7AFA810, 0);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v51[0] = v32;
                v50[1] = *MEMORY[0x1E0CB2D68];
                v33 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("Could not transform value at index %ld"), &stru_1E7AFA810, 0);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = v31;
                v9 = v30;
                objc_msgSend(v33, "stringWithFormat:", v35, v40);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = *MEMORY[0x1E0CB3388];
                v51[1] = v36;
                v51[2] = v21;
                v50[2] = v37;
                v50[3] = CFSTR("MTLTransformerErrorHandlingInputValueErrorKey");
                v51[3] = v30;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 4);
                v38 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLTransformerErrorHandlingErrorDomain"), 1, v38);
                *a4 = (id)objc_claimAutoreleasedReturnValue();

              }
              v22 = 0;
              goto LABEL_26;
            }

            if (!v19)
              goto LABEL_16;
            goto LABEL_15;
          }
          objc_msgSend(v18, "transformedValue:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            goto LABEL_15;
LABEL_16:

          if (v11 == ++v14)
          {
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
            v13 = v43;
            if (v11)
              goto LABEL_5;
            goto LABEL_18;
          }
        }
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
        objc_msgSend(v8, "addObject:", v19);
        goto LABEL_16;
      }
LABEL_18:

      v22 = v8;
LABEL_26:

      v7 = v41;
    }
    else
    {
      if (a4)
      {
        v53[0] = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Could not transform non-array type"), &stru_1E7AFA810, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = v24;
        v53[1] = *MEMORY[0x1E0CB2D68];
        v25 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Expected an NSArray, got: %@."), &stru_1E7AFA810, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", v27, v7);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v53[2] = CFSTR("MTLTransformerErrorHandlingInputValueErrorKey");
        v54[1] = v28;
        v54[2] = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 3);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLTransformerErrorHandlingErrorDomain"), 1, v29);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v22 = 0;
      *a3 = 0;
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

id __100__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_arrayMappingTransformerWithTransformer___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3, _QWORD *a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v39;
  _QWORD *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v45;
  id obj;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  _QWORD v53[4];
  _BYTE v54[128];
  _QWORD v55[3];
  _QWORD v56[5];

  v56[3] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = a4;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v41 = v6;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v49;
        v12 = -1;
        obj = v8;
LABEL_5:
        v13 = 0;
        v42 = v12 + 1;
        v43 = v12 + v10;
        while (1)
        {
          if (*(_QWORD *)v49 != v11)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v13);
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14 == v15)
            break;
          v16 = objc_opt_respondsToSelector();
          v17 = *(void **)(a1 + 32);
          if ((v16 & 1) != 0)
          {
            v47 = 0;
            objc_msgSend(v17, "reverseTransformedValue:success:error:", v14, a3, &v47);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v47;
            v20 = v19;
            if (!*a3)
            {
              v29 = obj;
              if (v40)
              {
                v30 = v42 + v13;
                v52[0] = *MEMORY[0x1E0CB2D50];
                objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("Could not transform array"), &stru_1E7AFA810, 0);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v53[0] = v31;
                v52[1] = *MEMORY[0x1E0CB2D68];
                v32 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Could not transform value at index %ld"), &stru_1E7AFA810, 0);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = v30;
                v29 = obj;
                objc_msgSend(v32, "stringWithFormat:", v34, v39);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = *MEMORY[0x1E0CB3388];
                v53[1] = v35;
                v53[2] = v20;
                v52[2] = v36;
                v52[3] = CFSTR("MTLTransformerErrorHandlingInputValueErrorKey");
                v53[3] = obj;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 4);
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLTransformerErrorHandlingErrorDomain"), 1, v37);
                *v40 = (id)objc_claimAutoreleasedReturnValue();

              }
              v21 = 0;
              goto LABEL_26;
            }

            if (!v18)
              goto LABEL_16;
            goto LABEL_15;
          }
          objc_msgSend(v17, "reverseTransformedValue:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            goto LABEL_15;
LABEL_16:

          if (v10 == ++v13)
          {
            v8 = obj;
            v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
            v12 = v43;
            if (v10)
              goto LABEL_5;
            goto LABEL_18;
          }
        }
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
        objc_msgSend(v7, "addObject:", v18);
        goto LABEL_16;
      }
LABEL_18:

      v21 = v7;
LABEL_26:

      v6 = v41;
    }
    else
    {
      if (a4)
      {
        v55[0] = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Could not transform non-array type"), &stru_1E7AFA810, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = v23;
        v55[1] = *MEMORY[0x1E0CB2D68];
        v24 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Expected an NSArray, got: %@."), &stru_1E7AFA810, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", v26, v6);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v55[2] = CFSTR("MTLTransformerErrorHandlingInputValueErrorKey");
        v56[1] = v27;
        v56[2] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 3);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLTransformerErrorHandlingErrorDomain"), 1, v28);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v21 = 0;
      *a3 = 0;
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

void __84__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_BOOLeanValueTransformer__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[MTLValueTransformer transformerUsingReversibleBlock:](MTLValueTransformer, "transformerUsingReversibleBlock:", &__block_literal_global_36);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mtl_BOOLeanValueTransformer_BOOLeanValueTransformer;
  mtl_BOOLeanValueTransformer_BOOLeanValueTransformer = v0;

}

id __84__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_BOOLeanValueTransformer__block_invoke_2(uint64_t a1, void *a2, _BYTE *a3, _QWORD *a4)
{
  id v6;
  int v7;
  id *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "BOOLValue");
      v8 = (id *)MEMORY[0x1E0C9AE50];
      if (!v7)
        v8 = (id *)MEMORY[0x1E0C9AE40];
      v9 = *v8;
    }
    else
    {
      if (a4)
      {
        v18[0] = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Could not convert number to BOOLean-backed number or vice-versa"), &stru_1E7AFA810, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = v11;
        v18[1] = *MEMORY[0x1E0CB2D68];
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Expected an NSNumber, got: %@."), &stru_1E7AFA810, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", v14, v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18[2] = CFSTR("MTLTransformerErrorHandlingInputValueErrorKey");
        v19[1] = v15;
        v19[2] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLTransformerErrorHandlingErrorDomain"), 1, v16);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v9 = 0;
      *a3 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __81__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_UUIDValueTransformer__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[MTLValueTransformer transformerUsingForwardBlock:reverseBlock:](MTLValueTransformer, "transformerUsingForwardBlock:reverseBlock:", &__block_literal_global_22, &__block_literal_global_29);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mtl_UUIDValueTransformer_UUIDValueTransformer;
  mtl_UUIDValueTransformer_UUIDValueTransformer = v0;

}

id __81__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_UUIDValueTransformer__block_invoke_3(uint64_t a1, void *a2, _BYTE *a3, _QWORD *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4)
      {
        v16[0] = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Could not convert UUID to string"), &stru_1E7AFA810, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v9;
        v16[1] = *MEMORY[0x1E0CB2D68];
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Expected an NSUUID, got: %@."), &stru_1E7AFA810, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", v12, v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16[2] = CFSTR("MTLTransformerErrorHandlingInputValueErrorKey");
        v17[1] = v13;
        v17[2] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLTransformerErrorHandlingErrorDomain"), 1, v14);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v7 = 0;
      *a3 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __81__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_UUIDValueTransformer__block_invoke_2(uint64_t a1, void *a2, _BYTE *a3, _QWORD *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        if (a4)
        {
          v25[0] = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Could not convert string to UUID"), &stru_1E7AFA810, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = v18;
          v25[1] = *MEMORY[0x1E0CB2D68];
          v19 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Input UUID string %@ was malformed"), &stru_1E7AFA810, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", v21, v6);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v25[2] = CFSTR("MTLTransformerErrorHandlingInputValueErrorKey");
          v26[1] = v22;
          v26[2] = v6;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLTransformerErrorHandlingErrorDomain"), 1, v23);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        *a3 = 0;
      }

    }
    else
    {
      if (a4)
      {
        v27[0] = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Could not convert string to UUID"), &stru_1E7AFA810, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v11;
        v27[1] = *MEMORY[0x1E0CB2D68];
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Expected an NSString, got: %@."), &stru_1E7AFA810, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", v14, v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v27[2] = CFSTR("MTLTransformerErrorHandlingInputValueErrorKey");
        v28[1] = v15;
        v28[2] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLTransformerErrorHandlingErrorDomain"), 1, v16);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v8 = 0;
      *a3 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __80__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_URLValueTransformer__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[MTLValueTransformer transformerUsingForwardBlock:reverseBlock:](MTLValueTransformer, "transformerUsingForwardBlock:reverseBlock:", &__block_literal_global_2, &__block_literal_global_16);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mtl_URLValueTransformer_URLValueTransformer;
  mtl_URLValueTransformer_URLValueTransformer = v0;

}

id __80__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_URLValueTransformer__block_invoke_3(uint64_t a1, void *a2, _BYTE *a3, _QWORD *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "absoluteString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4)
      {
        v16[0] = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Could not convert URL to string"), &stru_1E7AFA810, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v9;
        v16[1] = *MEMORY[0x1E0CB2D68];
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Expected an NSURL, got: %@."), &stru_1E7AFA810, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", v12, v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16[2] = CFSTR("MTLTransformerErrorHandlingInputValueErrorKey");
        v17[1] = v13;
        v17[2] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLTransformerErrorHandlingErrorDomain"), 1, v14);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v7 = 0;
      *a3 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __80__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_URLValueTransformer__block_invoke_2(uint64_t a1, void *a2, _BYTE *a3, _QWORD *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        if (a4)
        {
          v25[0] = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Could not convert string to URL"), &stru_1E7AFA810, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = v18;
          v25[1] = *MEMORY[0x1E0CB2D68];
          v19 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Input URL string %@ was malformed"), &stru_1E7AFA810, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", v21, v6);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v25[2] = CFSTR("MTLTransformerErrorHandlingInputValueErrorKey");
          v26[1] = v22;
          v26[2] = v6;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLTransformerErrorHandlingErrorDomain"), 1, v23);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        *a3 = 0;
      }

    }
    else
    {
      if (a4)
      {
        v27[0] = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Could not convert string to URL"), &stru_1E7AFA810, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v11;
        v27[1] = *MEMORY[0x1E0CB2D68];
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Expected an NSString, got: %@."), &stru_1E7AFA810, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", v14, v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v27[2] = CFSTR("MTLTransformerErrorHandlingInputValueErrorKey");
        v28[1] = v15;
        v28[2] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLTransformerErrorHandlingErrorDomain"), 1, v16);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v8 = 0;
      *a3 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end

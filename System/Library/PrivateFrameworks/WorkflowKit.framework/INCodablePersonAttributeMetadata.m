@implementation INCodablePersonAttributeMetadata

id __98__INCodablePersonAttributeMetadata_Workflow__wf_parameterStateForIntentValue_parameterDefinition___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id *v12;
  uint64_t v13;
  BOOL v14;
  unsigned int v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v3 = a2;
  objc_msgSend(v3, "contactIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (*(_BYTE *)(a1 + 48))
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "unifiedContactWithIdentifier:keysToFetch:error:", v4, *(_QWORD *)(a1 + 40), 0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v3, "personHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "type");

      if (v10 == 2)
      {
        objc_msgSend(v8, "phoneNumbers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __98__INCodablePersonAttributeMetadata_Workflow__wf_parameterStateForIntentValue_parameterDefinition___block_invoke_4;
        v23[3] = &unk_1E7AF7A10;
        v12 = &v24;
        v24 = v3;
        v13 = objc_msgSend(v18, "indexOfObjectPassingTest:", v23);

        v14 = v13 == 0x7FFFFFFFFFFFFFFFLL;
        v15 = 3;
      }
      else
      {
        if (v10 != 1)
        {
          v13 = -1;
          v19 = 0xFFFFFFFFLL;
LABEL_19:
          v20 = objc_alloc(MEMORY[0x1E0D13E78]);
          objc_msgSend(MEMORY[0x1E0D13E30], "contactWithCNContact:propertyID:multivalueIndex:", v8, v19, v13);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v20, "initWithContact:", v21);

          goto LABEL_20;
        }
        objc_msgSend(v8, "emailAddresses");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __98__INCodablePersonAttributeMetadata_Workflow__wf_parameterStateForIntentValue_parameterDefinition___block_invoke_3;
        v25[3] = &unk_1E7AF7A10;
        v12 = &v26;
        v26 = v3;
        v13 = objc_msgSend(v11, "indexOfObjectPassingTest:", v25);

        v14 = v13 == 0x7FFFFFFFFFFFFFFFLL;
        v15 = 4;
      }
      if (v14)
        v19 = 0xFFFFFFFFLL;
      else
        v19 = v15;
      if (v14)
        v13 = -1;

      goto LABEL_19;
    }
  }
  v16 = objc_alloc(MEMORY[0x1E0D13E78]);
  objc_msgSend(MEMORY[0x1E0D13FB0], "contactWithPerson:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "initWithContact:", v8);
LABEL_20:

  return v17;
}

uint64_t __98__INCodablePersonAttributeMetadata_Workflow__wf_parameterStateForIntentValue_parameterDefinition___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

uint64_t __98__INCodablePersonAttributeMetadata_Workflow__wf_parameterStateForIntentValue_parameterDefinition___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v5 = (void *)getCNPhoneNumberClass_softClass;
  v17 = getCNPhoneNumberClass_softClass;
  if (!getCNPhoneNumberClass_softClass)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getCNPhoneNumberClass_block_invoke;
    v13[3] = &unk_1E7AF9520;
    v13[4] = &v14;
    __getCNPhoneNumberClass_block_invoke((uint64_t)v13);
    v5 = (void *)v15[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v14, 8);
  v7 = [v6 alloc];
  objc_msgSend(*(id *)(a1 + 32), "personHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithStringValue:", v9);
  v11 = objc_msgSend(v4, "isLikePhoneNumber:", v10);

  return v11;
}

id __98__INCodablePersonAttributeMetadata_Workflow__wf_parameterStateForIntentValue_parameterDefinition___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (v4 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v9 = 136315906;
      v10 = "WFEnforceClass";
      v11 = 2114;
      v12 = v4;
      v13 = 2114;
      v14 = (id)objc_opt_class();
      v15 = 2114;
      v16 = v3;
      v7 = v14;
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v9, 0x2Au);

    }
    v5 = 0;
  }
  else
  {
    v5 = v4;
  }

  return v5;
}

@end

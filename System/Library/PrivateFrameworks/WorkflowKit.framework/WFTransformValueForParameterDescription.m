@implementation WFTransformValueForParameterDescription

void __WFTransformValueForParameterDescription_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = a4;
  v8 = a2;
  WFTransformObjectRepresentationToFacadeObject(v8, (void *)objc_msgSend(v6, "wf_facadeClass"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v9, v7);
}

void __WFTransformValueForParameterDescription_block_invoke_3(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __WFTransformValueForParameterDescription_block_invoke_4;
  v7[3] = &unk_1E7AF7718;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(a2, "if_compactMap:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  if (objc_msgSend(*(id *)(a1 + 32), "wf_multipleValues"))
  {
    (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v4, 0);
  }
  else
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);

  }
}

id __WFTransformValueForParameterDescription_block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  id v32;
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "codableDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = v3;
    if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      getWFGeneralLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315906;
        v40 = "WFEnforceClass";
        v41 = 2114;
        v42 = v8;
        v43 = 2114;
        v44 = (id)objc_opt_class();
        v45 = 2114;
        v46 = v7;
        v12 = v44;
        _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

      }
      v9 = 0;
    }
    else
    {
      v9 = v8;
    }

    v13 = v6;
    objc_msgSend(v9, "codableDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "typeName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "typeName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqualToString:", v16);

    if (v17)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend(v13, "attributes");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, buf, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v36;
        v32 = v9;
        v33 = v3;
        while (2)
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v36 != v20)
              objc_enumerationMutation(obj);
            v22 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v21);
            objc_msgSend(v13, "attributes");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "attributes");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectForKeyedSubscript:", v22);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = objc_opt_class();
            if (v27 != objc_opt_class()
              || (objc_msgSend(v24, "propertyName"),
                  v28 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v26, "propertyName"),
                  v29 = (void *)objc_claimAutoreleasedReturnValue(),
                  v30 = objc_msgSend(v28, "isEqualToString:", v29),
                  v29,
                  v28,
                  !v30))
            {

              v9 = v32;
              v3 = v33;
              goto LABEL_21;
            }

            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, buf, 16);
          v9 = v32;
          v3 = v33;
          if (v19)
            continue;
          break;
        }
      }

      v10 = v9;
    }
    else
    {
LABEL_21:

      v10 = 0;
    }

  }
  else
  {
    WFTransformObjectRepresentationToFacadeObject(v3, (void *)objc_msgSend(v5, "wf_facadeClass"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

id __WFTransformValueForParameterDescription_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(MEMORY[0x1E0D13EC0], "itemWithFile:", v2);
    else
      objc_msgSend(MEMORY[0x1E0D13EC0], "itemWithObject:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

@end

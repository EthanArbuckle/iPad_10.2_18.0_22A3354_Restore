@implementation LNEntity(WFSerializableContent)

- (id)wfSerializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "isTransient"))
    return MEMORY[0x1E0C9AA70];
  v17[0] = CFSTR("typeIdentifier");
  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("instanceIdentifier");
  v18[0] = v3;
  objc_msgSend(a1, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "instanceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_compactMap:", &__block_literal_global_56990);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E08];
  v15[0] = CFSTR("identifier");
  v15[1] = CFSTR("properties");
  v16[0] = v6;
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "managedAccountIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "if_setValueIfNonNil:forKey:", v12, CFSTR("managedAccountIdentifier"));

  objc_msgSend(a1, "prototypeMangledTypeName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "if_setValueIfNonNil:forKey:", v13, CFSTR("prototypeMangledTypeName"));

  return v11;
}

+ (id)valueFromSerializedRepresentation:()WFSerializableContent metadata:variableProvider:parameter:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v38;
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v9;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("identifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("typeIdentifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("instanceIdentifier"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {

      objc_msgSend(v10, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("identifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v18 = v15;
        else
          v18 = 0;
      }
      else
      {
        v18 = 0;
      }
      v17 = v18;
    }
    v20 = v17;

    v19 = 0;
    if (v16 && v20)
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43C80]), "initWithTypeIdentifier:instanceIdentifier:", v16, v20);
      if (v10 && (objc_msgSend(v10, "isTransient") & 1) != 0)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("properties"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v11;
        if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v23 = v14;
          if (v23)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v24 = v23;
            else
              v24 = 0;
          }
          else
          {
            v24 = 0;
          }
          v25 = v24;

          objc_msgSend(v25, "if_compactMap:", &__block_literal_global_207_57014);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "allValues");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = v40;
        }
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __105__LNEntity_WFSerializableContent__valueFromSerializedRepresentation_metadata_variableProvider_parameter___block_invoke_2;
        v41[3] = &unk_1E7AF74B0;
        v42 = v10;
        v43 = v11;
        v44 = v12;
        v39 = v22;
        objc_msgSend(v22, "if_compactMap:", v41);
        v27 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("prototypeMangledTypeName"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v29 = v28;
          else
            v29 = 0;
        }
        else
        {
          v29 = 0;
        }
        v30 = v29;

        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("managedAccountIdentifier"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v12;
        v32 = v30;
        v33 = (void *)v27;
        v34 = v21;
        if (v31)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v35 = v31;
          else
            v35 = 0;
        }
        else
        {
          v35 = 0;
        }
        v36 = v35;

        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43C78]), "initWithTransient:identifier:properties:prototypeMangledTypeName:managedAccountIdentifier:", 1, v34, v33, v32, v36);
        v21 = v34;

        v11 = v40;
        v12 = v38;
      }
      else
      {
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43C78]), "initWithIdentifier:", v21);
      }

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end

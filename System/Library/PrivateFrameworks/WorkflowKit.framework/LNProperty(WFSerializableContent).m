@implementation LNProperty(WFSerializableContent)

- (id)wfSerializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E08];
  v9 = CFSTR("identifier");
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wfSerializedRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "if_setValueIfNonNil:forKey:", v7, CFSTR("value"));

  return v5;
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
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

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
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v15);

        if (!v17)
        {
          v22 = 0;
          goto LABEL_15;
        }
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("value"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0D43E38];
        objc_msgSend(v10, "valueType");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "valueFromSerializedRepresentation:valueType:variableProvider:parameter:", v18, v20, v11, v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43D98]), "initWithIdentifier:value:", v15, v21);
      }
      else
      {
        v22 = 0;
        v18 = v15;
        v15 = 0;
      }
    }
    else
    {
      v18 = 0;
      v22 = 0;
    }

LABEL_15:
    goto LABEL_16;
  }
  v22 = 0;
LABEL_16:

  return v22;
}

@end

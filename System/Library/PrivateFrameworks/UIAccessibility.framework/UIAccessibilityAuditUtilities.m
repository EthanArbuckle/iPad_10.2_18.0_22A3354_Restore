@implementation UIAccessibilityAuditUtilities

+ (id)dictionaryWithAXAuditIssue:(int64_t)a3 element:(id)a4 additionalInfo:(id)a5 identifier:(id)a6 foregroundColor:(id)a7 backgroundColor:(id)a8 fontSize:(id)a9 elementRect:(id)a10 text:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li"), a3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v26, *MEMORY[0x1E0CF3F78]);

    objc_msgSend(v25, "setObject:forKey:", v16, *MEMORY[0x1E0CF3F48]);
    if (v17)
      objc_msgSend(v25, "setObject:forKey:", v17, *MEMORY[0x1E0CF3F38]);
    if (v18)
      objc_msgSend(v25, "setObject:forKey:", v18, *MEMORY[0x1E0CF3F68]);
    if (v19)
      objc_msgSend(v25, "setObject:forKey:", v19, *MEMORY[0x1E0CF3F60]);
    if (v20)
      objc_msgSend(v25, "setObject:forKey:", v20, *MEMORY[0x1E0CF3F40]);
    if (v21)
      objc_msgSend(v25, "setObject:forKey:", v21, *MEMORY[0x1E0CF3F58]);
    if (v22)
      objc_msgSend(v25, "setObject:forKey:", v22, *MEMORY[0x1E0CF3F50]);
    if (v23)
      objc_msgSend(v25, "setObject:forKey:", v23, *MEMORY[0x1E0CF3F70]);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v25);
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = v24;
  }
  v28 = v27;

  return v28;
}

+ (BOOL)checkBoolValueForOptionsKey:(id)a3 inDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  if (!a4)
    return 0;
  v5 = a4;
  v6 = a3;
  objc_opt_class();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = objc_msgSend(v8, "BOOLValue");
  else
    v9 = 0;

  return v9;
}

+ (id)optionsDictionaryForAuditTest:(id)a3 inDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  if (a4)
  {
    v5 = a4;
    v6 = a3;
    objc_opt_class();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end

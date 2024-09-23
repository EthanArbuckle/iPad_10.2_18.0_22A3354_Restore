@implementation LNEntity

uint64_t __61__LNEntity_WFSerializableContent__wfSerializedRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wfSerializedRepresentation");
}

id __105__LNEntity_WFSerializableContent__valueFromSerializedRepresentation_metadata_variableProvider_parameter___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = a2;
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
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __105__LNEntity_WFSerializableContent__valueFromSerializedRepresentation_metadata_variableProvider_parameter___block_invoke_3;
  v12[3] = &unk_1E7AF7558;
  v13 = v6;
  v8 = v6;
  objc_msgSend(v7, "if_firstObjectPassingTest:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D43D98], "valueFromSerializedRepresentation:metadata:variableProvider:parameter:", v5, v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __105__LNEntity_WFSerializableContent__valueFromSerializedRepresentation_metadata_variableProvider_parameter___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __105__LNEntity_WFSerializableContent__valueFromSerializedRepresentation_metadata_variableProvider_parameter___block_invoke(int a1, id a2, void *a3, _QWORD *a4, _QWORD *a5)
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = objc_retainAutorelease(a2);
  *a4 = v8;
  v15 = a3;
  v16[0] = CFSTR("identifier");
  v16[1] = CFSTR("value");
  v17[0] = v8;
  v14 = CFSTR("value");
  v9 = (void *)MEMORY[0x1E0C99D80];
  v10 = a3;
  v11 = v8;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  *a5 = v13;
}

@end

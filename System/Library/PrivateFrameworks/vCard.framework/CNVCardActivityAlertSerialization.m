@implementation CNVCardActivityAlertSerialization

+ (id)stringWithType:(id)a3 info:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "dictionaryWithType:info:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNVCardActivityAlertSerializer serializeDictionary:](CNVCardActivityAlertSerializer, "serializeDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)dictionaryWithType:(id)a3 info:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  sAPITypeToSerializedType_block_invoke_3((uint64_t)v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_cn_setNonNilObject:forKey:", v9, CFSTR("type"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__CNVCardActivityAlertSerialization_dictionaryWithType_info___block_invoke;
  v12[3] = &unk_1E956F9E0;
  v10 = v8;
  v13 = v10;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);

  return v10;
}

void __61__CNVCardActivityAlertSerialization_dictionaryWithType_info___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  sAPIKeyToSerializedKey_block_invoke((uint64_t)v5, a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, v6);

}

+ (void)parseString:(id)a3 intoTypeAndInfo:(id)a4
{
  void (**v6)(id, void *, void *);
  void *v7;
  void *v8;
  id v9;

  v6 = (void (**)(id, void *, void *))a4;
  objc_msgSend(a1, "activityAlertWithString:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "typeFromDictionary:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "infoFromDictionary:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7, v8);

}

+ (id)activityAlertWithString:(id)a3
{
  return +[CNVCardActivityAlertScanner scanAlertValueFromString:](CNVCardActivityAlertScanner, "scanAlertValueFromString:", a3);
}

+ (id)typeFromDictionary:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sSerializedTypeToAPIType_block_invoke_4((uint64_t)v3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)infoFromDictionary:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__CNVCardActivityAlertSerialization_infoFromDictionary___block_invoke;
  v8[3] = &unk_1E956F9E0;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

void __56__CNVCardActivityAlertSerialization_infoFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = objc_msgSend(v8, "_cn_caseInsensitiveIsEqual:", CFSTR("type"));
  if ((v6 & 1) == 0)
  {
    sSerializedKeyToAPIKey_block_invoke_2(v6, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v7);

  }
}

@end

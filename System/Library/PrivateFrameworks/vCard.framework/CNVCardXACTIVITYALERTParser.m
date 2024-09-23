@implementation CNVCardXACTIVITYALERTParser

+ (id)valueWithParser:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a3, "parseRemainingLine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__CNVCardXACTIVITYALERTParser_valueWithParser___block_invoke;
  v9[3] = &unk_1E956F990;
  v10 = v4;
  v5 = v4;
  +[CNVCardActivityAlertSerialization parseString:intoTypeAndInfo:](CNVCardActivityAlertSerialization, "parseString:intoTypeAndInfo:", v3, v9);
  if (objc_msgSend(v5, "count"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

void __47__CNVCardXACTIVITYALERTParser_valueWithParser___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0 && objc_msgSend(v5, "count"))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

}

@end

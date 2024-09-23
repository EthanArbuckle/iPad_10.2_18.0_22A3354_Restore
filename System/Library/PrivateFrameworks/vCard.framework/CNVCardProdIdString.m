@implementation CNVCardProdIdString

+ (id)stringForCurrentBuild
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)_CFCopySystemVersionDictionary();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C9AB98]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C9ABB0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringWithProduct:version:language:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)stringWithProduct:(id)a3 version:(id)a4 language:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("-//Apple Inc."));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D13848];
  if (((*(uint64_t (**)(_QWORD, id))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v7) & 1) == 0)
  {
    objc_msgSend(v10, "appendFormat:", CFSTR("//%@"), v7);
    if (((*(uint64_t (**)(uint64_t, id))(v11 + 16))(v11, v8) & 1) == 0)
      objc_msgSend(v10, "appendFormat:", CFSTR(" %@"), v8);
  }
  if (((*(uint64_t (**)(uint64_t, id))(v11 + 16))(v11, v9) & 1) == 0)
    objc_msgSend(v10, "appendFormat:", CFSTR("//%@"), v9);

  return v10;
}

+ (id)defaultLanguage
{
  return CFSTR("EN");
}

@end

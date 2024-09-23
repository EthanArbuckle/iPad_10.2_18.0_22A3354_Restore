@implementation WCRCipherMLClient

+ (id)categoryForCategoryLetter:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("v")) & 1) != 0)
  {
    v4 = &unk_251BCD9C8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("|")) & 1) != 0)
  {
    v4 = &unk_251BCD9E0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("g")) & 1) != 0)
  {
    v4 = &unk_251BCD9F8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("w")))
  {
    v4 = &unk_251BCDA10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)categoryForString:(id)a3 withError:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v5 = (objc_class *)MEMORY[0x24BE16DD0];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithUseCase:", CFSTR("webContentRestrictions"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE16DE0]), "initWithClientConfig:", v7);
  v15 = 0;
  objc_msgSend(v8, "dataByStringKeyword:error:", v6, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v15;
  v11 = v10;
  if (v9)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v9, 4);
    objc_msgSend((id)objc_opt_class(), "categoryForCategoryLetter:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }

  return v13;
}

+ (void)activateCipherML
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Getting CipherML status..."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WCRLogging log:withType:](WCRLogging, "log:withType:", v2, 0);

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE16DD0]), "initWithUseCase:", CFSTR("webContentRestrictions"));
  v4 = (void *)MEMORY[0x24BE16DF0];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__WCRCipherMLClient_activateCipherML__block_invoke;
  v6[3] = &unk_251BCC078;
  v7 = 0;
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "requestStatusForClientConfig:options:completionHandler:", v5, 0, v6);

}

void __37__WCRCipherMLClient_activateCipherML__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (v11)
  {
    v6 = objc_msgSend(v11, "status");
    v7 = "needs activation";
    if (v6 == 6)
      v7 = "doesn't need activation";
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CipherML status: %s"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[WCRLogging log:withType:](WCRLogging, "log:withType:", v8, 0);

    if (v6 != 6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Activating CipherML..."));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[WCRLogging log:withType:](WCRLogging, "log:withType:", v9, 0);

      objc_msgSend(MEMORY[0x24BE16DF0], "requestStatusForClientConfig:options:completionHandler:", *(_QWORD *)(a1 + 40), 11, &__block_literal_global_0);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get CipherML status: %@"), *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WCRLogging log:withType:](WCRLogging, "log:withType:", v10, 1);

  }
}

void __37__WCRCipherMLClient_activateCipherML__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(a2, "status");
  v5 = "inactive";
  if (v4 == 6)
    v5 = "active";
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CipherML activation response: %s"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WCRLogging log:withType:](WCRLogging, "log:withType:", v6, 0);

  v7 = v9;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CipherML activation error: %@"), v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[WCRLogging log:withType:](WCRLogging, "log:withType:", v8, 1);

    v7 = v9;
  }

}

@end

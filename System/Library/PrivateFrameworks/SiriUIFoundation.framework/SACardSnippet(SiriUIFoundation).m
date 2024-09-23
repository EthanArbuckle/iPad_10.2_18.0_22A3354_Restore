@implementation SACardSnippet(SiriUIFoundation)

- (id)siriui_eventInfo
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BE850A0]);
  objc_msgSend(a1, "siriui_card");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFacade:", v3);

  objc_msgSend(v4, "cardSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKeyPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = CFSTR("numberOfSections");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("cardSections");
  v15[0] = v8;
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = &stru_24DC1C4B0;
  if (v9)
    v11 = (const __CFString *)v9;
  v15[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)siriui_card
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BE154F8];
  objc_msgSend(a1, "cardData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cardForData:messageName:", v2, CFSTR("searchfoundation.Card"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)siriui_card_compact
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BE154F8];
  objc_msgSend(a1, "compactSizeCardData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cardForData:messageName:", v2, CFSTR("searchfoundation.Card"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

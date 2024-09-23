@implementation SXWebCalActionActivityProvider

- (id)activityGroupForAction:(id)a3
{
  id v3;
  SXActionActivityGroup *v4;
  void *v5;
  void *v6;
  SXActionActivityGroup *v7;
  SXBlockActionActivity *v8;
  void *v9;
  void *v10;
  id v11;
  SXBlockActionActivity *v12;
  _QWORD v14[4];
  id v15;

  v3 = a3;
  v4 = [SXActionActivityGroup alloc];
  SXBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Calendar"), &stru_24D68E0F8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SXActionActivityGroup initWithTitle:](v4, "initWithTitle:", v6);

  v8 = [SXBlockActionActivity alloc];
  SXBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Subscribe"), &stru_24D68E0F8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __57__SXWebCalActionActivityProvider_activityGroupForAction___block_invoke;
  v14[3] = &unk_24D688798;
  v15 = v3;
  v11 = v3;
  v12 = -[SXBlockActionActivity initWithLabel:type:block:](v8, "initWithLabel:type:block:", v10, 0, v14);
  -[SXActionActivityGroup addActivity:](v7, "addActivity:", v12);

  return v7;
}

void __57__SXWebCalActionActivityProvider_activityGroupForAction___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE2ACF0], "sharedConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleURL:", v2);

}

@end

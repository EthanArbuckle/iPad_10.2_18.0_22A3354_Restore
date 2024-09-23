@implementation UNCNotificationCategoryRecordMapper

- (UNCNotificationCategoryRecordMapper)initWithBundle:(id)a3
{
  id v5;
  UNCNotificationCategoryRecordMapper *v6;
  UNCNotificationCategoryRecordMapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNCNotificationCategoryRecordMapper;
  v6 = -[UNCNotificationCategoryRecordMapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundle, a3);

  return v7;
}

- (id)notificationCategoryForNotificationCategoryRecord:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __89__UNCNotificationCategoryRecordMapper_notificationCategoryForNotificationCategoryRecord___block_invoke;
  v27[3] = &unk_251AE15C8;
  v27[4] = self;
  objc_msgSend(v5, "bs_map:", v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "minimalActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v6;
  v26[1] = 3221225472;
  v26[2] = __89__UNCNotificationCategoryRecordMapper_notificationCategoryForNotificationCategoryRecord___block_invoke_2;
  v26[3] = &unk_251AE15C8;
  v26[4] = self;
  objc_msgSend(v7, "bs_map:", v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "intentIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "hasCustomDismissAction");
  v10 = objc_msgSend(v4, "hasFollowActivityAction");
  v11 = objc_msgSend(v4, "shouldAllowInCarPlay");
  v12 = objc_msgSend(v4, "privacyOptionShowTitle");
  v13 = objc_msgSend(v4, "privacyOptionShowSubtitle");
  v14 = objc_msgSend(v4, "hasCustomSilenceAction");
  objc_msgSend(v4, "backgroundStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("System")) & 1) != 0)
  {
    v16 = 1;
  }
  else if (objc_msgSend(v15, "isEqualToString:", CFSTR("Dark")))
  {
    v16 = 2;
  }
  else
  {
    v16 = 0;
  }
  v17 = v9;
  if (v10)
    v17 = v9 | 0x80000000;
  if (v11)
    v17 |= 2uLL;
  if (v12)
    v17 |= 4uLL;
  if (v13)
    v17 |= 8uLL;
  if (v14)
    v18 = v17 | 0x400000;
  else
    v18 = v17;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF87F8]), "initWithIdentifier:", v25);
  objc_msgSend(v19, "setActions:", v24);
  objc_msgSend(v19, "setMinimalActions:", v23);
  objc_msgSend(v19, "setIntentIdentifiers:", v8);
  objc_msgSend(v4, "privateBody");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHiddenPreviewsBodyPlaceholder:", v20);

  objc_msgSend(v4, "summaryFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCategorySummaryFormat:", v21);

  objc_msgSend(v19, "setOptions:", v18);
  objc_msgSend(v19, "setBackgroundStyle:", v16);

  return v19;
}

uint64_t __89__UNCNotificationCategoryRecordMapper_notificationCategoryForNotificationCategoryRecord___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notificationActionForNotificationActionRecord:", a2);
}

uint64_t __89__UNCNotificationCategoryRecordMapper_notificationCategoryForNotificationCategoryRecord___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notificationActionForNotificationActionRecord:", a2);
}

- (id)notificationActionForNotificationActionRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v36 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDF87E0];
  objc_msgSend(v4, "titleLocalizationKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLocalizationArguments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BSCFBundle cfBundle](self->_bundle, "cfBundle");
  objc_msgSend(v4, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedUserNotificationStringForKey:arguments:cfBundle:defaultValue:", v6, v7, v8, v9);
  v35 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconImageName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "isAuthenticationRequired");
  if (objc_msgSend(v4, "isDestructive"))
    v12 |= 2uLL;
  if (objc_msgSend(v4, "isForeground"))
    v12 |= 4uLL;
  if (objc_msgSend(v4, "shouldPreventNotificationDismiss"))
    v13 = v12 | 0x10000;
  else
    v13 = v12;
  objc_msgSend(v11, "length");
  if ((objc_msgSend(v4, "hasSystemIcon") & 1) != 0)
    objc_msgSend(MEMORY[0x24BDF8828], "iconWithSystemImageName:", v11);
  else
    objc_msgSend(MEMORY[0x24BDF8828], "iconWithTemplateImageName:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("TextInput"));

  if (v16)
  {
    v17 = (void *)MEMORY[0x24BDF87E0];
    objc_msgSend(v4, "textInputButtonTitleLocalizationKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textInputButtonTitleLocalizationArguments");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[BSCFBundle cfBundle](self->_bundle, "cfBundle");
    objc_msgSend(v4, "textInputButtonTitle");
    v34 = v13;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedUserNotificationStringForKey:arguments:cfBundle:defaultValue:", v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x24BDF87E0];
    objc_msgSend(v4, "textInputPlaceholderLocalizationKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textInputPlaceholderLocalizationArguments");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[BSCFBundle cfBundle](self->_bundle, "cfBundle");
    objc_msgSend(v4, "textInputPlaceholder");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedUserNotificationStringForKey:arguments:cfBundle:defaultValue:", v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)v35;
    v29 = (void *)v36;
    objc_msgSend(MEMORY[0x24BDF88A0], "actionWithIdentifier:title:options:icon:textInputButtonTitle:textInputPlaceholder:", v36, v35, v34, v14, v22, v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v10)
    {
      v30 = (void *)v35;
      v29 = (void *)v36;
      objc_msgSend(MEMORY[0x24BDF8820], "actionWithIdentifier:title:url:icon:", v36, v35, v10, v14);
    }
    else
    {
      v32 = v13;
      v30 = (void *)v35;
      v29 = (void *)v36;
      objc_msgSend(MEMORY[0x24BDF8820], "actionWithIdentifier:title:options:icon:", v36, v35, v32, v14);
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end

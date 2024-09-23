@implementation SXEmailActionActivityProvider

- (SXEmailActionActivityProvider)initWithMailPresenter:(id)a3
{
  id v5;
  SXEmailActionActivityProvider *v6;
  SXEmailActionActivityProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXEmailActionActivityProvider;
  v6 = -[SXEmailActionActivityProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mailPresenter, a3);

  return v7;
}

- (id)activityGroupForAction:(id)a3
{
  id v4;
  SXActionActivityGroup *v5;
  void *v6;
  SXActionActivityGroup *v7;
  void *v8;
  uint64_t v9;
  SXBlockActionActivity *v10;
  void *v11;
  void *v12;
  id v13;
  SXBlockActionActivity *v14;
  SXPasteboardActionActivity *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SXPasteboardActionActivity *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  SXEmailActionActivityProvider *v26;
  id v27;

  v4 = a3;
  v5 = [SXActionActivityGroup alloc];
  objc_msgSend(v4, "recipient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SXActionActivityGroup initWithTitle:](v5, "initWithTitle:", v6);

  -[SXEmailActionActivityProvider mailPresenter](self, "mailPresenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "canComposeMail") ^ 1;

  v10 = [SXBlockActionActivity alloc];
  SXBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("New Message"), &stru_24D68E0F8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __56__SXEmailActionActivityProvider_activityGroupForAction___block_invoke;
  v25 = &unk_24D6875A0;
  v26 = self;
  v27 = v4;
  v13 = v4;
  v14 = -[SXBlockActionActivity initWithLabel:type:block:](v10, "initWithLabel:type:block:", v12, v9, &v22);
  -[SXActionActivityGroup addActivity:](v7, "addActivity:", v14, v22, v23, v24, v25, v26);

  v15 = [SXPasteboardActionActivity alloc];
  SXBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Copy"), &stru_24D68E0F8, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6C40], "generalPasteboard");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recipient");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[SXPasteboardActionActivity initWithLabel:type:pasteboard:string:](v15, "initWithLabel:type:pasteboard:string:", v17, 1, v18, v19);
  -[SXActionActivityGroup addActivity:](v7, "addActivity:", v20);

  return v7;
}

void __56__SXEmailActionActivityProvider_activityGroupForAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "recipient");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "subject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "composeMailTo:subject:", v4, v3);

}

- (void)composeMailTo:(id)a3 subject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SXPresentableMail *v9;

  v6 = a4;
  v7 = a3;
  v9 = -[SXPresentableMail initWithRecipient:subject:]([SXPresentableMail alloc], "initWithRecipient:subject:", v7, v6);

  -[SXEmailActionActivityProvider mailPresenter](self, "mailPresenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentMail:", v9);

}

- (SXMailPresenter)mailPresenter
{
  return self->_mailPresenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailPresenter, 0);
}

@end

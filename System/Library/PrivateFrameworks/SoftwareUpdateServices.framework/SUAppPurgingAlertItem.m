@implementation SUAppPurgingAlertItem

- (SUAppPurgingAlertItem)initWithHandler:(id)a3 bytesNeeded:(unint64_t)a4
{
  id v6;
  SUAppPurgingAlertItem *v7;
  uint64_t v8;
  id handler;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUAppPurgingAlertItem;
  v7 = -[SUBaseAlertItem init](&v11, sel_init);
  if (v7)
  {
    v8 = MEMORY[0x212BF6094](v6);
    handler = v7->_handler;
    v7->_handler = (id)v8;

    v7->_bytesNeeded = a4;
  }

  return v7;
}

- (void)alertWasDismissed:(unint64_t)a3
{
  void (**handler)(id, _QWORD);
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUAppPurgingAlertItem;
  -[SUBaseAlertItem alertWasDismissed:](&v6, sel_alertWasDismissed_);
  if (a3 != 1)
  {
    handler = (void (**)(id, _QWORD))self->_handler;
    if (handler)
      handler[2](handler, 0);
  }
}

- (id)title
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DISK_SPACE_HEADER"), &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)message
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", self->_bytesNeeded, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("APP_DEMOTION_BODY"), &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)buttons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUAppPurgingAlertItem _yesButton](self, "_yesButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[SUAppPurgingAlertItem _noButton](self, "_noButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (id)_yesButton
{
  SUAlertButtonDefinition *v3;
  void *v4;
  void *v5;
  SUAlertButtonDefinition *v6;
  _QWORD v8[5];

  v3 = [SUAlertButtonDefinition alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DISK_SPACE_DEFAULT"), &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __35__SUAppPurgingAlertItem__yesButton__block_invoke;
  v8[3] = &unk_24CE3B5C0;
  v8[4] = self;
  v6 = -[SUAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v3, "initWithLabel:presentationStyle:isPreferredButton:handler:", v5, 0, 1, v8);

  return v6;
}

uint64_t __35__SUAppPurgingAlertItem__yesButton__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  SULogAlerts();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  SULogInfoForSubsystem(v2, CFSTR("[%@] User accepted to purge apps."), v4, v5, v6, v7, v8, v9, v3);

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (id)_noButton
{
  SUAlertButtonDefinition *v3;
  void *v4;
  void *v5;
  SUAlertButtonDefinition *v6;
  _QWORD v8[5];

  v3 = [SUAlertButtonDefinition alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CANCEL_BUTTON"), &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__SUAppPurgingAlertItem__noButton__block_invoke;
  v8[3] = &unk_24CE3B5C0;
  v8[4] = self;
  v6 = -[SUAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v3, "initWithLabel:presentationStyle:isPreferredButton:handler:", v5, 2, 0, v8);

  return v6;
}

uint64_t __34__SUAppPurgingAlertItem__noButton__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  SULogAlerts();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  SULogInfoForSubsystem(v2, CFSTR("[%@] User declined to purge apps."), v4, v5, v6, v7, v8, v9, v3);

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end

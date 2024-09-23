@implementation NCNotificationAction

- (NCNotificationAction)initWithNotificationAction:(id)a3
{
  id v4;
  NCNotificationAction *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSString *title;
  void *v12;
  uint64_t v13;
  NSURL *launchURL;
  void *v15;
  uint64_t v16;
  NSString *launchBundleID;
  void *v18;
  uint64_t v19;
  NSDictionary *behaviorParameters;
  uint64_t v21;
  NCNotificationActionRunner *actionRunner;
  void *v23;
  uint64_t v24;
  NSString *iconImageName;
  void *v26;
  uint64_t v27;
  NSString *iconImageBundlePath;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)NCNotificationAction;
  v5 = -[NCNotificationAction init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_msgSend(v4, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v10;

    v5->_activationMode = objc_msgSend(v4, "activationMode");
    v5->_requiresAuthentication = objc_msgSend(v4, "requiresAuthentication");
    objc_msgSend(v4, "launchURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    launchURL = v5->_launchURL;
    v5->_launchURL = (NSURL *)v13;

    objc_msgSend(v4, "launchBundleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    launchBundleID = v5->_launchBundleID;
    v5->_launchBundleID = (NSString *)v16;

    v5->_behavior = objc_msgSend(v4, "behavior");
    objc_msgSend(v4, "behaviorParameters");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    behaviorParameters = v5->_behaviorParameters;
    v5->_behaviorParameters = (NSDictionary *)v19;

    objc_msgSend(v4, "actionRunner");
    v21 = objc_claimAutoreleasedReturnValue();
    actionRunner = v5->_actionRunner;
    v5->_actionRunner = (NCNotificationActionRunner *)v21;

    v5->_destructiveAction = objc_msgSend(v4, "isDestructiveAction");
    v5->_shouldDismissNotification = objc_msgSend(v4, "shouldDismissNotification");
    objc_msgSend(v4, "iconImageName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    iconImageName = v5->_iconImageName;
    v5->_iconImageName = (NSString *)v24;

    objc_msgSend(v4, "iconImageBundlePath");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "copy");
    iconImageBundlePath = v5->_iconImageBundlePath;
    v5->_iconImageBundlePath = (NSString *)v27;

    v5->_isSiriActionCandidate = objc_msgSend(v4, "isSiriActionCandidate");
  }

  return v5;
}

- (NSString)debugDescription
{
  return (NSString *)-[NCNotificationAction descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)isSystemAction
{
  void *v3;
  char v4;
  void *v5;

  -[NCNotificationAction identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", *MEMORY[0x24BDF8A60]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[NCNotificationAction identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqual:", *MEMORY[0x24BDF8A70]);

  }
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NCNotificationAction initWithNotificationAction:]([NCMutableNotificationAction alloc], "initWithNotificationAction:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[NCNotificationAction descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  NCNotificationAction *v12;

  v4 = (void *)MEMORY[0x24BE0BE08];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__NCNotificationAction_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_24D270158;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

id __62__NCNotificationAction_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  const __CFString *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("identifier"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("title"));

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "launchURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "appendObject:withName:", v9, CFSTR("launchURL"));

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "launchBundleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v11, "appendObject:withName:", v12, CFSTR("launchBundleID"));

  v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "activationMode"), CFSTR("activationMode"));
  v15 = *(void **)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 40), "behavior"))
    v16 = CFSTR("TextInput");
  else
    v16 = CFSTR("Default");
  v17 = (id)objc_msgSend(v15, "appendObject:withName:", v16, CFSTR("behavior"));
  v18 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "requiresAuthentication"), CFSTR("requiresUnlock"));
  v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isDestructiveAction"), CFSTR("destructiveAction"));
  v20 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "shouldDismissNotification"), CFSTR("shouldDismiss"));
  v21 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "actionRunner");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v21, "appendObject:withName:", v22, CFSTR("actionRunner"));

  v24 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "behaviorParameters");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v24, "appendObject:withName:skipIfNil:", v25, CFSTR("behaviorParameters"), 0);

  v27 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "iconImageName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_msgSend(v27, "appendObject:withName:", v28, CFSTR("iconImageName"));

  v30 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "iconImageBundlePath");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (id)objc_msgSend(v30, "appendObject:withName:", v31, CFSTR("iconImageBundlePath"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isSiriActionCandidate"), CFSTR("isSiriAction"));
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[NCNotificationAction succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationAction identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("identifier"));

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)iconImageName
{
  return self->_iconImageName;
}

- (NSString)iconImageBundlePath
{
  return self->_iconImageBundlePath;
}

- (unint64_t)activationMode
{
  return self->_activationMode;
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (NSString)launchBundleID
{
  return self->_launchBundleID;
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (NSDictionary)behaviorParameters
{
  return self->_behaviorParameters;
}

- (NCNotificationActionRunner)actionRunner
{
  return self->_actionRunner;
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (BOOL)isDestructiveAction
{
  return self->_destructiveAction;
}

- (BOOL)shouldDismissNotification
{
  return self->_shouldDismissNotification;
}

- (BOOL)isSiriActionCandidate
{
  return self->_isSiriActionCandidate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionRunner, 0);
  objc_storeStrong((id *)&self->_behaviorParameters, 0);
  objc_storeStrong((id *)&self->_launchBundleID, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_iconImageBundlePath, 0);
  objc_storeStrong((id *)&self->_iconImageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

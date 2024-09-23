@implementation NCNotificationAlertOptions

- (NCNotificationAlertOptions)initWithNotificationAlertOptions:(id)a3
{
  id v4;
  NCNotificationAlertOptions *v5;
  void *v6;
  uint64_t v7;
  NSUUID *activeModeUUID;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NCNotificationAlertOptions;
  v5 = -[NCNotificationAlertOptions init](&v10, sel_init);
  if (v5)
  {
    v5->_suppression = objc_msgSend(v4, "suppression");
    v5->_intelligentBehavior = objc_msgSend(v4, "intelligentBehavior");
    v5->_reason = objc_msgSend(v4, "reason");
    objc_msgSend(v4, "activeModeUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    activeModeUUID = v5->_activeModeUUID;
    v5->_activeModeUUID = (NSUUID *)v7;

  }
  return v5;
}

- (BOOL)shouldSuppress
{
  return -[NCNotificationAlertOptions suppression](self, "suppression") != 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
LABEL_9:
      v11 = 0;
      goto LABEL_10;
    }
  }
  v5 = v4;
  if (!v5)
    goto LABEL_9;
  v6 = -[NCNotificationAlertOptions suppression](self, "suppression");
  if (v6 != objc_msgSend(v5, "suppression"))
    goto LABEL_9;
  v7 = -[NCNotificationAlertOptions intelligentBehavior](self, "intelligentBehavior");
  if (v7 != objc_msgSend(v5, "intelligentBehavior"))
    goto LABEL_9;
  v8 = -[NCNotificationAlertOptions reason](self, "reason");
  if (v8 != objc_msgSend(v5, "reason"))
    goto LABEL_9;
  -[NCNotificationAlertOptions activeModeUUID](self, "activeModeUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeModeUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = NCIsEqual(v9, v10);

LABEL_10:
  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[NCNotificationAlertOptions suppression](self, "suppression");
  v4 = -[NCNotificationAlertOptions intelligentBehavior](self, "intelligentBehavior") ^ v3;
  v5 = v4 ^ -[NCNotificationAlertOptions reason](self, "reason");
  -[NCNotificationAlertOptions activeModeUUID](self, "activeModeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (NSString)debugDescription
{
  return (NSString *)-[NCNotificationAlertOptions descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NCNotificationAlertOptions initWithNotificationAlertOptions:]([NCMutableNotificationAlertOptions alloc], "initWithNotificationAlertOptions:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[NCNotificationAlertOptions descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  NCNotificationAlertOptions *v12;

  v4 = (void *)MEMORY[0x24BE0BE08];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__NCNotificationAlertOptions_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_24D270158;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

void __68__NCNotificationAlertOptions_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;
  id v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "suppression");
  if (v3 > 2)
    v4 = CFSTR("<invalid>");
  else
    v4 = off_24D270308[v3];
  objc_msgSend(v2, "appendString:withName:", v4, CFSTR("suppression"));
  v5 = *(void **)(a1 + 32);
  v6 = objc_msgSend(*(id *)(a1 + 40), "intelligentBehavior");
  if (v6 > 3)
    v7 = 0;
  else
    v7 = off_24D270320[v6];
  objc_msgSend(v5, "appendString:withName:", v7, CFSTR("intelligentBehavior"));
  v8 = *(void **)(a1 + 32);
  v9 = objc_msgSend(*(id *)(a1 + 40), "reason");
  if (v9 > 4)
    v10 = CFSTR("<invalid>");
  else
    v10 = off_24D270340[v9];
  objc_msgSend(v8, "appendString:withName:", v10, CFSTR("reason"));
  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "activeModeUUID");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "appendObject:withName:skipIfNil:", v13, CFSTR("activeModeUUID"), 1);

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[NCNotificationAlertOptions succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
}

- (unint64_t)suppression
{
  return self->_suppression;
}

- (unint64_t)intelligentBehavior
{
  return self->_intelligentBehavior;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (NSUUID)activeModeUUID
{
  return self->_activeModeUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeModeUUID, 0);
}

@end

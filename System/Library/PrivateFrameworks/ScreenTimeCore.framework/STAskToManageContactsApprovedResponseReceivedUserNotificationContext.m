@implementation STAskToManageContactsApprovedResponseReceivedUserNotificationContext

- (STAskToManageContactsApprovedResponseReceivedUserNotificationContext)initWithChildName:(id)a3
{
  id v3;
  STAskToManageContactsApprovedResponseReceivedUserNotificationContext *v4;
  uint64_t v5;
  NSString *childName;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STAskToManageContactsApprovedResponseReceivedUserNotificationContext;
  v3 = a3;
  v4 = -[STUserNotificationContext initWithIdentifier:](&v8, sel_initWithIdentifier_, CFSTR("AskToManageContactsResponseReceivedUserNotificationContextIdentifier"));
  v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  childName = v4->_childName;
  v4->_childName = (NSString *)v5;

  return v4;
}

- (STAskToManageContactsApprovedResponseReceivedUserNotificationContext)initWithCoder:(id)a3
{
  id v4;
  STAskToManageContactsApprovedResponseReceivedUserNotificationContext *v5;
  uint64_t v6;
  NSString *childName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STAskToManageContactsApprovedResponseReceivedUserNotificationContext;
  v5 = -[STUserNotificationContext initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("childName"));
    v6 = objc_claimAutoreleasedReturnValue();
    childName = v5->_childName;
    v5->_childName = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STAskToManageContactsApprovedResponseReceivedUserNotificationContext;
  v4 = a3;
  -[STUserNotificationContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_childName, CFSTR("childName"), v5.receiver, v5.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  STAskToManageContactsApprovedResponseReceivedUserNotificationContext *v11;
  id v12;

  v9[1] = 3221225472;
  v9[2] = __121__STAskToManageContactsApprovedResponseReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke;
  v9[3] = &unk_1E9370AC8;
  v10 = a3;
  v11 = self;
  v12 = a4;
  v8.receiver = self;
  v8.super_class = (Class)STAskToManageContactsApprovedResponseReceivedUserNotificationContext;
  v9[0] = MEMORY[0x1E0C809B0];
  v6 = v12;
  v7 = v10;
  -[STUserNotificationContext customizeNotificationContent:withCompletionBlock:](&v8, sel_customizeNotificationContent_withCompletionBlock_, v7, v9);

}

uint64_t __121__STAskToManageContactsApprovedResponseReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 40), "childName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedUserNotificationStringForKey:arguments:", CFSTR("AskToManageContactsApprovedResponseReceivedNotificationTitle"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTitle:", v5);

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 40), "childName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedUserNotificationStringForKey:arguments:", CFSTR("AskToManageContactsApprovedResponseReceivedNotificationBody"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBody:", v9);

  objc_msgSend(*(id *)(a1 + 32), "setShouldPreventNotificationDismissalAfterDefaultAction:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (NSString)childName
{
  return self->_childName;
}

- (void)setChildName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childName, 0);
}

@end

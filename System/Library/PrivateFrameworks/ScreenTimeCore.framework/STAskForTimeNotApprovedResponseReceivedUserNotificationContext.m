@implementation STAskForTimeNotApprovedResponseReceivedUserNotificationContext

- (STAskForTimeNotApprovedResponseReceivedUserNotificationContext)initWithAskForTimeRequestIdentifier:(id)a3 parentName:(id)a4 requestedResourceName:(id)a5
{
  id v8;
  id v9;
  STAskForTimeNotApprovedResponseReceivedUserNotificationContext *v10;
  uint64_t v11;
  NSString *parentName;
  uint64_t v13;
  NSString *requestedResourceName;
  objc_super v16;

  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)STAskForTimeNotApprovedResponseReceivedUserNotificationContext;
  v10 = -[STUserNotificationContext initWithIdentifier:](&v16, sel_initWithIdentifier_, a3);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    parentName = v10->_parentName;
    v10->_parentName = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    requestedResourceName = v10->_requestedResourceName;
    v10->_requestedResourceName = (NSString *)v13;

  }
  return v10;
}

- (STAskForTimeNotApprovedResponseReceivedUserNotificationContext)initWithCoder:(id)a3
{
  id v4;
  STAskForTimeNotApprovedResponseReceivedUserNotificationContext *v5;
  uint64_t v6;
  NSString *parentName;
  uint64_t v8;
  NSString *requestedResourceName;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STAskForTimeNotApprovedResponseReceivedUserNotificationContext;
  v5 = -[STUserNotificationContext initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentName"));
    v6 = objc_claimAutoreleasedReturnValue();
    parentName = v5->_parentName;
    v5->_parentName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestedResourceName"));
    v8 = objc_claimAutoreleasedReturnValue();
    requestedResourceName = v5->_requestedResourceName;
    v5->_requestedResourceName = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STAskForTimeNotApprovedResponseReceivedUserNotificationContext;
  v4 = a3;
  -[STUserNotificationContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_parentName, CFSTR("parentName"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_requestedResourceName, CFSTR("requestedResourceName"));

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
  STAskForTimeNotApprovedResponseReceivedUserNotificationContext *v11;
  id v12;

  v9[1] = 3221225472;
  v9[2] = __115__STAskForTimeNotApprovedResponseReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke;
  v9[3] = &unk_1E9370AC8;
  v10 = a3;
  v11 = self;
  v12 = a4;
  v8.receiver = self;
  v8.super_class = (Class)STAskForTimeNotApprovedResponseReceivedUserNotificationContext;
  v9[0] = MEMORY[0x1E0C809B0];
  v6 = v12;
  v7 = v10;
  -[STUserNotificationContext customizeNotificationContent:withCompletionBlock:](&v8, sel_customizeNotificationContent_withCompletionBlock_, v7, v9);

}

uint64_t __115__STAskForTimeNotApprovedResponseReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke(uint64_t a1)
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
  objc_msgSend(*(id *)(a1 + 40), "parentName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedUserNotificationStringForKey:arguments:", CFSTR("AskForTimeNotApprovedResposeReceivedNotificationTitle"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTitle:", v5);

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 40), "requestedResourceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedUserNotificationStringForKey:arguments:", CFSTR("AskForTimeNotApprovedResposeReceivedNotificationBody"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBody:", v9);

  objc_msgSend(*(id *)(a1 + 32), "setInterruptionLevel:", 2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (NSString)parentName
{
  return self->_parentName;
}

- (void)setParentName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)requestedResourceName
{
  return self->_requestedResourceName;
}

- (void)setRequestedResourceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedResourceName, 0);
  objc_storeStrong((id *)&self->_parentName, 0);
}

@end

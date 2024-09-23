@implementation STAskForTimeApprovedResponseReceivedUserNotificationContext

- (STAskForTimeApprovedResponseReceivedUserNotificationContext)initWithAskForTimeRequestIdentifier:(id)a3 parentName:(id)a4 requestedResourceName:(id)a5 amountGranted:(double)a6
{
  id v10;
  id v11;
  STAskForTimeApprovedResponseReceivedUserNotificationContext *v12;
  uint64_t v13;
  NSString *parentName;
  uint64_t v15;
  NSString *requestedResourceName;
  objc_super v18;

  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)STAskForTimeApprovedResponseReceivedUserNotificationContext;
  v12 = -[STUserNotificationContext initWithIdentifier:](&v18, sel_initWithIdentifier_, a3);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    parentName = v12->_parentName;
    v12->_parentName = (NSString *)v13;

    v15 = objc_msgSend(v11, "copy");
    requestedResourceName = v12->_requestedResourceName;
    v12->_requestedResourceName = (NSString *)v15;

    v12->_amountGranted = a6;
  }

  return v12;
}

- (STAskForTimeApprovedResponseReceivedUserNotificationContext)initWithCoder:(id)a3
{
  id v4;
  STAskForTimeApprovedResponseReceivedUserNotificationContext *v5;
  uint64_t v6;
  NSString *parentName;
  uint64_t v8;
  NSString *requestedResourceName;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)STAskForTimeApprovedResponseReceivedUserNotificationContext;
  v5 = -[STUserNotificationContext initWithCoder:](&v12, sel_initWithCoder_, v4);
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

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("amountGranted"));
    v5->_amountGranted = v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STAskForTimeApprovedResponseReceivedUserNotificationContext;
  v4 = a3;
  -[STUserNotificationContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_parentName, CFSTR("parentName"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_requestedResourceName, CFSTR("requestedResourceName"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("amountGranted"), self->_amountGranted);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4
{
  id v5;
  id v6;
  objc_super v7;
  _QWORD v8[4];
  STAskForTimeApprovedResponseReceivedUserNotificationContext *v9;
  id v10;
  id v11;

  v8[1] = 3221225472;
  v8[2] = __112__STAskForTimeApprovedResponseReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke;
  v8[3] = &unk_1E9370AC8;
  v9 = self;
  v10 = a3;
  v11 = a4;
  v7.receiver = v9;
  v7.super_class = (Class)STAskForTimeApprovedResponseReceivedUserNotificationContext;
  v8[0] = MEMORY[0x1E0C809B0];
  v5 = v11;
  v6 = v10;
  -[STUserNotificationContext customizeNotificationContent:withCompletionBlock:](&v7, sel_customizeNotificationContent_withCompletionBlock_, v6, v8);

}

void __112__STAskForTimeApprovedResponseReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setAllowedUnits:", 96);
  objc_msgSend(v2, "setUnitsStyle:", 3);
  objc_msgSend(v2, "setFormattingContext:", 5);
  objc_msgSend(*(id *)(a1 + 32), "amountGranted");
  objc_msgSend(v2, "stringFromTimeInterval:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "parentName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedUserNotificationStringForKey:arguments:", CFSTR("AskForTimeApprovedResposeReceivedNotificationTitle"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setTitle:", v7);

  objc_msgSend(*(id *)(a1 + 32), "requestedResourceName");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = (void *)MEMORY[0x1E0CB3940];
  if (v8)
  {
    v15[0] = v3;
    v15[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("AskForTimeApprovedResposeReceivedNotificationBody");
  }
  else
  {
    v14 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("AskForTimeApprovedNoResourceResposeReceivedNotificationBody");
  }
  objc_msgSend(v10, "localizedUserNotificationStringForKey:arguments:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setBody:", v13);

  objc_msgSend(*(id *)(a1 + 40), "setInterruptionLevel:", 2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

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

- (double)amountGranted
{
  return self->_amountGranted;
}

- (void)setAmountGranted:(double)a3
{
  self->_amountGranted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedResourceName, 0);
  objc_storeStrong((id *)&self->_parentName, 0);
}

@end

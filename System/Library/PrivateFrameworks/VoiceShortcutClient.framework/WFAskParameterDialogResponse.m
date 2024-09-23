@implementation WFAskParameterDialogResponse

- (WFAskParameterDialogResponse)initWithSerializedParameterState:(id)a3 cancelled:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  WFAskParameterDialogResponse *v8;
  WFAskParameterDialogResponse *v9;
  WFAskParameterDialogResponse *v10;
  objc_super v12;

  v4 = a4;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFAskParameterDialogResponse;
  v8 = -[WFDialogResponse initWithCancelled:](&v12, sel_initWithCancelled_, v4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_serializedParameterState, a3);
    v10 = v9;
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAskParameterDialogResponse serializedParameterState](self, "serializedParameterState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFDialogResponse isCancelled](self, "isCancelled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, serializedParameterState: %@, cancelled: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (WFAskParameterDialogResponse)initWithCoder:(id)a3
{
  id v4;
  WFAskParameterDialogResponse *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  WFPropertyListObject *serializedParameterState;
  WFAskParameterDialogResponse *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WFAskParameterDialogResponse;
  v5 = -[WFDialogResponse initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("serializedParameterState"));
    v13 = objc_claimAutoreleasedReturnValue();
    serializedParameterState = v5->_serializedParameterState;
    v5->_serializedParameterState = (WFPropertyListObject *)v13;

    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFAskParameterDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFAskParameterDialogResponse serializedParameterState](self, "serializedParameterState", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("serializedParameterState"));

}

- (WFAskParameterDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  WFAskParameterDialogResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  WFPropertyListObject *serializedParameterState;
  WFAskParameterDialogResponse *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFAskParameterDialogResponse;
  v5 = -[WFDialogResponse initWithBSXPCCoder:](&v19, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serializedParameterState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3710];
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v14, v6, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    serializedParameterState = v5->_serializedParameterState;
    v5->_serializedParameterState = (WFPropertyListObject *)v15;

    v17 = v5;
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFAskParameterDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithBSXPCCoder:](&v8, sel_encodeWithBSXPCCoder_, v4);
  v5 = (void *)MEMORY[0x1E0CB36F8];
  -[WFAskParameterDialogResponse serializedParameterState](self, "serializedParameterState", v8.receiver, v8.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("serializedParameterState"));
}

- (WFPropertyListObject)serializedParameterState
{
  return self->_serializedParameterState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedParameterState, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

@end

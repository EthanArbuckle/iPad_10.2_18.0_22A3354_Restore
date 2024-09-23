@implementation WFAskParameterDialogRequest

- (WFAskParameterDialogRequest)initWithActionIdentifier:(id)a3 parameterKey:(id)a4 serializedParameterStates:(id)a5 style:(int64_t)a6 attribution:(id)a7 prompt:(id)a8 doneButton:(id)a9 focusImmediatelyWhenPresented:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  WFAskParameterDialogRequest *v20;
  uint64_t v21;
  NSString *actionIdentifier;
  uint64_t v23;
  NSString *parameterKey;
  uint64_t v25;
  WFDialogButton *cancelButton;
  WFAskParameterDialogRequest *v27;
  objc_super v29;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a9;
  v29.receiver = self;
  v29.super_class = (Class)WFAskParameterDialogRequest;
  v20 = -[WFDialogRequest initWithAttribution:prompt:](&v29, sel_initWithAttribution_prompt_, a7, a8);
  if (v20)
  {
    v21 = objc_msgSend(v16, "copy");
    actionIdentifier = v20->_actionIdentifier;
    v20->_actionIdentifier = (NSString *)v21;

    v23 = objc_msgSend(v17, "copy");
    parameterKey = v20->_parameterKey;
    v20->_parameterKey = (NSString *)v23;

    objc_storeStrong((id *)&v20->_serializedParameterStates, a5);
    v20->_style = a6;
    +[WFDialogButton cancelButton](WFDialogButton, "cancelButton");
    v25 = objc_claimAutoreleasedReturnValue();
    cancelButton = v20->_cancelButton;
    v20->_cancelButton = (WFDialogButton *)v25;

    objc_storeStrong((id *)&v20->_doneButton, a9);
    v20->_focusImmediatelyWhenPresented = a10;
    v27 = v20;
  }

  return v20;
}

- (WFAskParameterDialogRequest)initWithActionIdentifier:(id)a3 parameterKey:(id)a4 serializedParameterStates:(id)a5 style:(int64_t)a6 attribution:(id)a7 prompt:(id)a8 focusImmediatelyWhenPresented:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  WFAskParameterDialogRequest *v21;
  uint64_t v23;

  v15 = a8;
  v16 = a7;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  +[WFDialogButton doneButton](WFDialogButton, "doneButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v23) = a9;
  v21 = -[WFAskParameterDialogRequest initWithActionIdentifier:parameterKey:serializedParameterStates:style:attribution:prompt:doneButton:focusImmediatelyWhenPresented:](self, "initWithActionIdentifier:parameterKey:serializedParameterStates:style:attribution:prompt:doneButton:focusImmediatelyWhenPresented:", v19, v18, v17, a6, v16, v15, v20, v23);

  return v21;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;

  v17 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogRequest attribution](self, "attribution");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogRequest prompt](self, "prompt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAskParameterDialogRequest actionIdentifier](self, "actionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAskParameterDialogRequest parameterKey](self, "parameterKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAskParameterDialogRequest serializedParameterStates](self, "serializedParameterStates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFAskParameterDialogRequest style](self, "style");
  v11 = CFSTR("Inline");
  if (v10 == 1)
    v11 = CFSTR("Modal");
  v12 = v11;
  -[WFAskParameterDialogRequest cancelButton](self, "cancelButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAskParameterDialogRequest doneButton](self, "doneButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p, title: %@, prompt: %@, actionIdentifier: %@, parameterKey: %@, serializedParameterStates: %@, style: %@, cancelButton: %@, doneButton: %@>"), v4, self, v5, v6, v7, v8, v9, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)requestBySettingFocusImmediatelyWhenPresented:(BOOL)a3
{
  WFAskParameterDialogRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  WFAskParameterDialogRequest *v12;
  uint64_t v14;

  v5 = [WFAskParameterDialogRequest alloc];
  -[WFAskParameterDialogRequest actionIdentifier](self, "actionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAskParameterDialogRequest parameterKey](self, "parameterKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAskParameterDialogRequest serializedParameterStates](self, "serializedParameterStates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFAskParameterDialogRequest style](self, "style");
  -[WFDialogRequest attribution](self, "attribution");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogRequest prompt](self, "prompt");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = a3;
  v12 = -[WFAskParameterDialogRequest initWithActionIdentifier:parameterKey:serializedParameterStates:style:attribution:prompt:focusImmediatelyWhenPresented:](v5, "initWithActionIdentifier:parameterKey:serializedParameterStates:style:attribution:prompt:focusImmediatelyWhenPresented:", v6, v7, v8, v9, v10, v11, v14);

  return v12;
}

- (WFAskParameterDialogRequest)initWithCoder:(id)a3
{
  id v4;
  WFAskParameterDialogRequest *v5;
  uint64_t v6;
  NSString *actionIdentifier;
  uint64_t v8;
  NSString *parameterKey;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSDictionary *serializedParameterStates;
  uint64_t v19;
  WFDialogButton *cancelButton;
  uint64_t v21;
  WFDialogButton *doneButton;
  WFAskParameterDialogRequest *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WFAskParameterDialogRequest;
  v5 = -[WFDialogRequest initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    actionIdentifier = v5->_actionIdentifier;
    v5->_actionIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    parameterKey = v5->_parameterKey;
    v5->_parameterKey = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("serializedParameterStates"));
    v17 = objc_claimAutoreleasedReturnValue();
    serializedParameterStates = v5->_serializedParameterStates;
    v5->_serializedParameterStates = (NSDictionary *)v17;

    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cancelButton"));
    v19 = objc_claimAutoreleasedReturnValue();
    cancelButton = v5->_cancelButton;
    v5->_cancelButton = (WFDialogButton *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("doneButton"));
    v21 = objc_claimAutoreleasedReturnValue();
    doneButton = v5->_doneButton;
    v5->_doneButton = (WFDialogButton *)v21;

    v5->_focusImmediatelyWhenPresented = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("focusImmediatelyWhenPresented"));
    v23 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFAskParameterDialogRequest;
  v4 = a3;
  -[WFDialogRequest encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[WFAskParameterDialogRequest actionIdentifier](self, "actionIdentifier", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actionIdentifier"));

  -[WFAskParameterDialogRequest parameterKey](self, "parameterKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("parameterKey"));

  -[WFAskParameterDialogRequest serializedParameterStates](self, "serializedParameterStates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("serializedParameterStates"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFAskParameterDialogRequest style](self, "style"), CFSTR("style"));
  -[WFAskParameterDialogRequest cancelButton](self, "cancelButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("cancelButton"));

  -[WFAskParameterDialogRequest doneButton](self, "doneButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("doneButton"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFAskParameterDialogRequest focusImmediatelyWhenPresented](self, "focusImmediatelyWhenPresented"), CFSTR("focusImmediatelyWhenPresented"));
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)parameterKey
{
  return self->_parameterKey;
}

- (NSDictionary)serializedParameterStates
{
  return self->_serializedParameterStates;
}

- (int64_t)style
{
  return self->_style;
}

- (WFDialogButton)cancelButton
{
  return self->_cancelButton;
}

- (WFDialogButton)doneButton
{
  return self->_doneButton;
}

- (BOOL)focusImmediatelyWhenPresented
{
  return self->_focusImmediatelyWhenPresented;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_serializedParameterStates, 0);
  objc_storeStrong((id *)&self->_parameterKey, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

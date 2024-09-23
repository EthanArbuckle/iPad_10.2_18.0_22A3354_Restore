@implementation WFEntityPickerDialogRequest

- (WFEntityPickerDialogRequest)initWithActionIdentifier:(id)a3 parameterKey:(id)a4 items:(id)a5 attribution:(id)a6 prompt:(id)a7
{
  id v12;
  id v13;
  id v14;
  WFEntityPickerDialogRequest *v15;
  uint64_t v16;
  NSString *actionIdentifier;
  uint64_t v18;
  NSString *parameterKey;
  WFEntityPickerDialogRequest *v20;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v22.receiver = self;
  v22.super_class = (Class)WFEntityPickerDialogRequest;
  v15 = -[WFDialogRequest initWithAttribution:prompt:](&v22, sel_initWithAttribution_prompt_, a6, a7);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    actionIdentifier = v15->_actionIdentifier;
    v15->_actionIdentifier = (NSString *)v16;

    v18 = objc_msgSend(v13, "copy");
    parameterKey = v15->_parameterKey;
    v15->_parameterKey = (NSString *)v18;

    objc_storeStrong((id *)&v15->_items, a5);
    v20 = v15;
  }

  return v15;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEntityPickerDialogRequest actionIdentifier](self, "actionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEntityPickerDialogRequest parameterKey](self, "parameterKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEntityPickerDialogRequest items](self, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, actionId: %@, parameterKey: %@, items: %@"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (WFEntityPickerDialogRequest)initWithCoder:(id)a3
{
  id v4;
  WFEntityPickerDialogRequest *v5;
  uint64_t v6;
  NSString *actionIdentifier;
  uint64_t v8;
  NSString *parameterKey;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *items;
  WFEntityPickerDialogRequest *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WFEntityPickerDialogRequest;
  v5 = -[WFDialogRequest initWithCoder:](&v17, sel_initWithCoder_, v4);
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
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("items"));
    v13 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v13;

    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFEntityPickerDialogRequest;
  v4 = a3;
  -[WFDialogRequest encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[WFEntityPickerDialogRequest actionIdentifier](self, "actionIdentifier", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actionIdentifier"));

  -[WFEntityPickerDialogRequest parameterKey](self, "parameterKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("parameterKey"));

  -[WFEntityPickerDialogRequest items](self, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("items"));

}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)parameterKey
{
  return self->_parameterKey;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_parameterKey, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation WFInputTextDialogRequest

- (WFInputTextDialogRequest)initWithTextFieldConfiguration:(id)a3 message:(id)a4 attribution:(id)a5 prompt:(id)a6 parameterKey:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  int v21;
  WFInputTextDialogRequest *v22;
  uint64_t v23;
  WFTextFieldConfiguration *textFieldConfiguration;
  uint64_t v25;
  NSString *message;
  uint64_t v27;
  WFDialogButton *cancelButton;
  uint64_t v29;
  WFDialogButton *doneButton;
  uint64_t v31;
  NSString *parameterKey;
  void *v33;
  WFInputTextDialogRequest *v34;
  objc_super v36;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = a5;
  objc_msgSend(v16, "appBundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.mobilenotes")))
  {

LABEL_4:
    v20 = 0;
    v21 = 1;
    goto LABEL_6;
  }
  objc_msgSend(v12, "placeholder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", v14);

  if (v19)
    goto LABEL_4;
  v21 = 0;
  v20 = v14;
LABEL_6:
  v36.receiver = self;
  v36.super_class = (Class)WFInputTextDialogRequest;
  v22 = -[WFDialogRequest initWithAttribution:prompt:](&v36, sel_initWithAttribution_prompt_, v16, v20);

  if (v22)
  {
    v23 = objc_msgSend(v12, "copy");
    textFieldConfiguration = v22->_textFieldConfiguration;
    v22->_textFieldConfiguration = (WFTextFieldConfiguration *)v23;

    v25 = objc_msgSend(v13, "copy");
    message = v22->_message;
    v22->_message = (NSString *)v25;

    +[WFDialogButton cancelButton](WFDialogButton, "cancelButton");
    v27 = objc_claimAutoreleasedReturnValue();
    cancelButton = v22->_cancelButton;
    v22->_cancelButton = (WFDialogButton *)v27;

    +[WFDialogButton doneButton](WFDialogButton, "doneButton");
    v29 = objc_claimAutoreleasedReturnValue();
    doneButton = v22->_doneButton;
    v22->_doneButton = (WFDialogButton *)v29;

    v31 = objc_msgSend(v15, "copy");
    parameterKey = v22->_parameterKey;
    v22->_parameterKey = (NSString *)v31;

    if (v21)
    {
      -[WFInputTextDialogRequest textFieldConfiguration](v22, "textFieldConfiguration");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setPlaceholder:", v14);

    }
    v34 = v22;
  }

  return v22;
}

- (BOOL)hasMultilineTextEntry
{
  void *v2;
  char v3;

  -[WFInputTextDialogRequest textFieldConfiguration](self, "textFieldConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMultiline");

  return v3;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogRequest attribution](self, "attribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogRequest prompt](self, "prompt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFInputTextDialogRequest message](self, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFInputTextDialogRequest textFieldConfiguration](self, "textFieldConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFInputTextDialogRequest cancelButton](self, "cancelButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFInputTextDialogRequest doneButton](self, "doneButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, title: %@, prompt: %@, message: %@, configuration: %@, cancelButton: %@, doneButton: %@>"), v5, self, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (WFInputTextDialogRequest)initWithCoder:(id)a3
{
  id v4;
  WFInputTextDialogRequest *v5;
  uint64_t v6;
  WFTextFieldConfiguration *textFieldConfiguration;
  uint64_t v8;
  NSString *message;
  uint64_t v10;
  WFDialogButton *cancelButton;
  uint64_t v12;
  WFDialogButton *doneButton;
  uint64_t v14;
  NSString *parameterKey;
  WFInputTextDialogRequest *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFInputTextDialogRequest;
  v5 = -[WFDialogRequest initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textFieldConfiguration"));
    v6 = objc_claimAutoreleasedReturnValue();
    textFieldConfiguration = v5->_textFieldConfiguration;
    v5->_textFieldConfiguration = (WFTextFieldConfiguration *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v8 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cancelButton"));
    v10 = objc_claimAutoreleasedReturnValue();
    cancelButton = v5->_cancelButton;
    v5->_cancelButton = (WFDialogButton *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("doneButton"));
    v12 = objc_claimAutoreleasedReturnValue();
    doneButton = v5->_doneButton;
    v5->_doneButton = (WFDialogButton *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    parameterKey = v5->_parameterKey;
    v5->_parameterKey = (NSString *)v14;

    v16 = v5;
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
  v10.super_class = (Class)WFInputTextDialogRequest;
  v4 = a3;
  -[WFDialogRequest encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[WFInputTextDialogRequest textFieldConfiguration](self, "textFieldConfiguration", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("textFieldConfiguration"));

  -[WFInputTextDialogRequest message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("message"));

  -[WFInputTextDialogRequest cancelButton](self, "cancelButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("cancelButton"));

  -[WFInputTextDialogRequest doneButton](self, "doneButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("doneButton"));

  -[WFInputTextDialogRequest parameterKey](self, "parameterKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("parameterKey"));

}

- (WFTextFieldConfiguration)textFieldConfiguration
{
  return self->_textFieldConfiguration;
}

- (NSString)message
{
  return self->_message;
}

- (WFDialogButton)cancelButton
{
  return self->_cancelButton;
}

- (WFDialogButton)doneButton
{
  return self->_doneButton;
}

- (NSString)parameterKey
{
  return self->_parameterKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterKey, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_textFieldConfiguration, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

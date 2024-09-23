@implementation WFShowAlertDialogRequest

- (WFShowAlertDialogRequest)initWithPrompt:(id)a3 message:(id)a4 cancelButton:(id)a5 attribution:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  WFShowAlertDialogRequest *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[WFDialogButton okButton](WFDialogButton, "okButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[WFShowAlertDialogRequest initWithPrompt:message:okButton:cancelButton:attribution:](self, "initWithPrompt:message:okButton:cancelButton:attribution:", v13, v12, v14, v11, v10);

  return v15;
}

- (WFShowAlertDialogRequest)initWithPrompt:(id)a3 message:(id)a4 okButton:(id)a5 cancelButton:(id)a6 attribution:(id)a7
{
  id v12;
  id v13;
  id v14;
  WFShowAlertDialogRequest *v15;
  uint64_t v16;
  NSString *message;
  uint64_t v18;
  WFDialogButton *okButton;
  uint64_t v20;
  WFDialogButton *cancelButton;
  WFShowAlertDialogRequest *v22;
  objc_super v24;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)WFShowAlertDialogRequest;
  v15 = -[WFDialogRequest initWithAttribution:prompt:](&v24, sel_initWithAttribution_prompt_, a7, a3);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    message = v15->_message;
    v15->_message = (NSString *)v16;

    v18 = objc_msgSend(v13, "copy");
    okButton = v15->_okButton;
    v15->_okButton = (WFDialogButton *)v18;

    v20 = objc_msgSend(v14, "copy");
    cancelButton = v15->_cancelButton;
    v15->_cancelButton = (WFDialogButton *)v20;

    v22 = v15;
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
  void *v10;
  void *v11;
  void *v12;

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
  -[WFShowAlertDialogRequest message](self, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShowAlertDialogRequest okButton](self, "okButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShowAlertDialogRequest cancelButton](self, "cancelButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, title: %@, prompt: %@, message: %@, okButton: %@, cancelButton: %@>"), v5, self, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (WFShowAlertDialogRequest)initWithCoder:(id)a3
{
  id v4;
  WFShowAlertDialogRequest *v5;
  uint64_t v6;
  NSString *message;
  uint64_t v8;
  WFDialogButton *okButton;
  uint64_t v10;
  WFDialogButton *cancelButton;
  WFShowAlertDialogRequest *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFShowAlertDialogRequest;
  v5 = -[WFDialogRequest initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v6 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("okButton"));
    v8 = objc_claimAutoreleasedReturnValue();
    okButton = v5->_okButton;
    v5->_okButton = (WFDialogButton *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cancelButton"));
    v10 = objc_claimAutoreleasedReturnValue();
    cancelButton = v5->_cancelButton;
    v5->_cancelButton = (WFDialogButton *)v10;

    v12 = v5;
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
  v8.super_class = (Class)WFShowAlertDialogRequest;
  v4 = a3;
  -[WFDialogRequest encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[WFShowAlertDialogRequest message](self, "message", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("message"));

  -[WFShowAlertDialogRequest okButton](self, "okButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("okButton"));

  -[WFShowAlertDialogRequest cancelButton](self, "cancelButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("cancelButton"));

}

- (NSString)message
{
  return self->_message;
}

- (WFDialogButton)okButton
{
  return self->_okButton;
}

- (WFDialogButton)cancelButton
{
  return self->_cancelButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_okButton, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

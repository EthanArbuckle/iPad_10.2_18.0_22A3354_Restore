@implementation WFInputDateDialogRequest

- (WFInputDateDialogRequest)initWithDatePickerConfiguration:(id)a3 message:(id)a4 attribution:(id)a5 prompt:(id)a6
{
  id v11;
  id v12;
  WFInputDateDialogRequest *v13;
  WFInputDateDialogRequest *v14;
  uint64_t v15;
  NSString *message;
  uint64_t v17;
  WFDialogButton *cancelButton;
  uint64_t v19;
  WFDialogButton *doneButton;
  WFInputDateDialogRequest *v21;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v23.receiver = self;
  v23.super_class = (Class)WFInputDateDialogRequest;
  v13 = -[WFDialogRequest initWithAttribution:prompt:](&v23, sel_initWithAttribution_prompt_, a5, a6);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_configuration, a3);
    v15 = objc_msgSend(v12, "copy");
    message = v14->_message;
    v14->_message = (NSString *)v15;

    +[WFDialogButton cancelButton](WFDialogButton, "cancelButton");
    v17 = objc_claimAutoreleasedReturnValue();
    cancelButton = v14->_cancelButton;
    v14->_cancelButton = (WFDialogButton *)v17;

    +[WFDialogButton doneButton](WFDialogButton, "doneButton");
    v19 = objc_claimAutoreleasedReturnValue();
    doneButton = v14->_doneButton;
    v14->_doneButton = (WFDialogButton *)v19;

    v21 = v14;
  }

  return v14;
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
  -[WFInputDateDialogRequest message](self, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFInputDateDialogRequest configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFInputDateDialogRequest cancelButton](self, "cancelButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFInputDateDialogRequest doneButton](self, "doneButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, title: %@, prompt: %@, message: %@, configuration: %@, cancelButton: %@, doneButton: %@>"), v5, self, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)overrideDoneButtonTitle:(id)a3
{
  id v4;
  WFDialogButton *v5;
  WFDialogButton *v6;
  WFDialogButton *doneButton;
  id v8;

  v4 = a3;
  v5 = [WFDialogButton alloc];
  -[WFInputDateDialogRequest doneButton](self, "doneButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[WFDialogButton initWithTitle:style:](v5, "initWithTitle:style:", v4, objc_msgSend(v8, "style"));

  doneButton = self->_doneButton;
  self->_doneButton = v6;

}

- (WFInputDateDialogRequest)initWithCoder:(id)a3
{
  id v4;
  WFInputDateDialogRequest *v5;
  uint64_t v6;
  WFDatePickerConfiguration *configuration;
  uint64_t v8;
  NSString *message;
  uint64_t v10;
  WFDialogButton *cancelButton;
  uint64_t v12;
  WFDialogButton *doneButton;
  WFInputDateDialogRequest *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFInputDateDialogRequest;
  v5 = -[WFDialogRequest initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration"));
    v6 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (WFDatePickerConfiguration *)v6;

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

    v14 = v5;
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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFInputDateDialogRequest;
  v4 = a3;
  -[WFDialogRequest encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[WFInputDateDialogRequest configuration](self, "configuration", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("configuration"));

  -[WFInputDateDialogRequest message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("message"));

  -[WFInputDateDialogRequest cancelButton](self, "cancelButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("cancelButton"));

  -[WFInputDateDialogRequest doneButton](self, "doneButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("doneButton"));

}

- (WFDatePickerConfiguration)configuration
{
  return self->_configuration;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

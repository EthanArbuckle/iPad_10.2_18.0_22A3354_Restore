@implementation WFFileAccessDialogRequest

- (WFFileAccessDialogRequest)initWithPrompt:(id)a3 message:(id)a4 okButton:(id)a5 cancelButton:(id)a6 attribution:(id)a7 workflowID:(id)a8 URLs:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  WFFileAccessDialogRequest *v23;
  uint64_t v24;
  NSString *message;
  uint64_t v26;
  WFDialogButton *okButton;
  uint64_t v28;
  WFDialogButton *cancelButton;
  uint64_t v30;
  NSString *workflowID;
  WFFileAccessDialogRequest *v32;
  void *v34;
  objc_super v35;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFileAccessDialogRequest.m"), 15, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflowID"));

  }
  v35.receiver = self;
  v35.super_class = (Class)WFFileAccessDialogRequest;
  v23 = -[WFDialogRequest initWithAttribution:prompt:](&v35, sel_initWithAttribution_prompt_, v20, v16);
  if (v23)
  {
    v24 = objc_msgSend(v17, "copy");
    message = v23->_message;
    v23->_message = (NSString *)v24;

    v26 = objc_msgSend(v18, "copy");
    okButton = v23->_okButton;
    v23->_okButton = (WFDialogButton *)v26;

    v28 = objc_msgSend(v19, "copy");
    cancelButton = v23->_cancelButton;
    v23->_cancelButton = (WFDialogButton *)v28;

    v30 = objc_msgSend(v21, "copy");
    workflowID = v23->_workflowID;
    v23->_workflowID = (NSString *)v30;

    objc_storeStrong((id *)&v23->_URLs, a9);
    v32 = v23;
  }

  return v23;
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
  -[WFFileAccessDialogRequest message](self, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFileAccessDialogRequest okButton](self, "okButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFileAccessDialogRequest cancelButton](self, "cancelButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFileAccessDialogRequest workflowID](self, "workflowID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, title: %@, prompt: %@, message: %@, okButton: %@, cancelButton: %@, workflowID: %@>"), v5, self, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)shouldCenterPrompt
{
  return 1;
}

- (WFFileAccessDialogRequest)initWithCoder:(id)a3
{
  id v4;
  WFFileAccessDialogRequest *v5;
  uint64_t v6;
  NSString *message;
  uint64_t v8;
  WFDialogButton *okButton;
  uint64_t v10;
  WFDialogButton *cancelButton;
  uint64_t v12;
  NSString *workflowID;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *URLs;
  WFFileAccessDialogRequest *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFFileAccessDialogRequest;
  v5 = -[WFDialogRequest initWithCoder:](&v21, sel_initWithCoder_, v4);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workflowID"));
    v12 = objc_claimAutoreleasedReturnValue();
    workflowID = v5->_workflowID;
    v5->_workflowID = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("URLs"));
    v17 = objc_claimAutoreleasedReturnValue();
    URLs = v5->_URLs;
    v5->_URLs = (NSArray *)v17;

    v19 = v5;
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
  v10.super_class = (Class)WFFileAccessDialogRequest;
  v4 = a3;
  -[WFDialogRequest encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[WFFileAccessDialogRequest message](self, "message", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("message"));

  -[WFFileAccessDialogRequest okButton](self, "okButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("okButton"));

  -[WFFileAccessDialogRequest cancelButton](self, "cancelButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("cancelButton"));

  -[WFFileAccessDialogRequest workflowID](self, "workflowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("workflowID"));

  -[WFFileAccessDialogRequest URLs](self, "URLs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("URLs"));

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

- (NSArray)URLs
{
  return self->_URLs;
}

- (NSString)workflowID
{
  return self->_workflowID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowID, 0);
  objc_storeStrong((id *)&self->_URLs, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_okButton, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

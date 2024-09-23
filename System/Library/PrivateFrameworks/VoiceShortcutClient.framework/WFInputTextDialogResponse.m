@implementation WFInputTextDialogResponse

- (WFInputTextDialogResponse)initWithInputtedText:(id)a3 cancelled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  WFInputTextDialogResponse *v7;
  uint64_t v8;
  NSString *inputtedText;
  WFInputTextDialogResponse *v10;
  objc_super v12;

  v4 = a4;
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFInputTextDialogResponse;
  v7 = -[WFDialogResponse initWithCancelled:](&v12, sel_initWithCancelled_, v4);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    inputtedText = v7->_inputtedText;
    v7->_inputtedText = (NSString *)v8;

    v10 = v7;
  }

  return v7;
}

- (WFInputTextDialogResponse)initWithResponseCode:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFInputTextDialogResponse;
  return -[WFDialogResponse initWithResponseCode:](&v4, sel_initWithResponseCode_, a3);
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
  -[WFInputTextDialogResponse inputtedText](self, "inputtedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFDialogResponse isCancelled](self, "isCancelled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, inputtedText: %@, cancelled: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (WFInputTextDialogResponse)initWithCoder:(id)a3
{
  id v4;
  WFInputTextDialogResponse *v5;
  uint64_t v6;
  NSString *inputtedText;
  WFInputTextDialogResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFInputTextDialogResponse;
  v5 = -[WFDialogResponse initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputtedText"));
    v6 = objc_claimAutoreleasedReturnValue();
    inputtedText = v5->_inputtedText;
    v5->_inputtedText = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFInputTextDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFInputTextDialogResponse inputtedText](self, "inputtedText", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("inputtedText"));

}

- (WFInputTextDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  WFInputTextDialogResponse *v5;
  uint64_t v6;
  NSString *inputtedText;
  WFInputTextDialogResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFInputTextDialogResponse;
  v5 = -[WFDialogResponse initWithBSXPCCoder:](&v10, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputtedText"));
    v6 = objc_claimAutoreleasedReturnValue();
    inputtedText = v5->_inputtedText;
    v5->_inputtedText = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFInputTextDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithBSXPCCoder:](&v6, sel_encodeWithBSXPCCoder_, v4);
  -[WFInputTextDialogResponse inputtedText](self, "inputtedText", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("inputtedText"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFDialogResponse isCancelled](self, "isCancelled"), CFSTR("cancelled"));
}

- (NSString)inputtedText
{
  return self->_inputtedText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputtedText, 0);
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

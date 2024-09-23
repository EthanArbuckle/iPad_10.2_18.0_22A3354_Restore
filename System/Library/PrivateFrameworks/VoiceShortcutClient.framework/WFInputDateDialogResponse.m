@implementation WFInputDateDialogResponse

- (WFInputDateDialogResponse)initWithInputtedDate:(id)a3 cancelled:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  WFInputDateDialogResponse *v8;
  WFInputDateDialogResponse *v9;
  WFInputDateDialogResponse *v10;
  objc_super v12;

  v4 = a4;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFInputDateDialogResponse;
  v8 = -[WFDialogResponse initWithCancelled:](&v12, sel_initWithCancelled_, v4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_inputtedDate, a3);
    v10 = v9;
  }

  return v9;
}

- (NSString)description
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
  -[WFInputDateDialogResponse inputtedDate](self, "inputtedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFDialogResponse isCancelled](self, "isCancelled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, inputtedDate: %@, cancelled: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (WFInputDateDialogResponse)initWithCoder:(id)a3
{
  id v4;
  WFInputDateDialogResponse *v5;
  uint64_t v6;
  NSDate *inputtedDate;
  WFInputDateDialogResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFInputDateDialogResponse;
  v5 = -[WFDialogResponse initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputtedDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    inputtedDate = v5->_inputtedDate;
    v5->_inputtedDate = (NSDate *)v6;

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
  v6.super_class = (Class)WFInputDateDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFInputDateDialogResponse inputtedDate](self, "inputtedDate", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("inputtedDate"));

}

- (WFInputDateDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  WFInputDateDialogResponse *v5;
  uint64_t v6;
  NSDate *inputtedDate;
  WFInputDateDialogResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFInputDateDialogResponse;
  v5 = -[WFDialogResponse initWithBSXPCCoder:](&v10, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputtedDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    inputtedDate = v5->_inputtedDate;
    v5->_inputtedDate = (NSDate *)v6;

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
  v6.super_class = (Class)WFInputDateDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithBSXPCCoder:](&v6, sel_encodeWithBSXPCCoder_, v4);
  -[WFInputDateDialogResponse inputtedDate](self, "inputtedDate", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("inputtedDate"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFDialogResponse isCancelled](self, "isCancelled"), CFSTR("cancelled"));
}

- (NSDate)inputtedDate
{
  return self->_inputtedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputtedDate, 0);
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

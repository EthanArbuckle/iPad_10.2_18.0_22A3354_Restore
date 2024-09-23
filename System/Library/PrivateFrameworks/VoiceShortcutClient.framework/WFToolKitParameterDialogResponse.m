@implementation WFToolKitParameterDialogResponse

- (WFToolKitParameterDialogResponse)initWithEncodedTypedValue:(id)a3
{
  id v5;
  WFToolKitParameterDialogResponse *v6;
  WFToolKitParameterDialogResponse *v7;
  WFToolKitParameterDialogResponse *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFToolKitParameterDialogResponse;
  v6 = -[WFDialogResponse initWithCancelled:](&v10, sel_initWithCancelled_, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_encodedTypedValue, a3);
    v8 = v7;
  }

  return v7;
}

- (WFToolKitParameterDialogResponse)initWithCoder:(id)a3
{
  id v4;
  WFToolKitParameterDialogResponse *v5;
  uint64_t v6;
  WFEncodedTypedValue *encodedTypedValue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFToolKitParameterDialogResponse;
  v5 = -[WFDialogResponse initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encodedTypedValue"));
    v6 = objc_claimAutoreleasedReturnValue();
    encodedTypedValue = v5->_encodedTypedValue;
    v5->_encodedTypedValue = (WFEncodedTypedValue *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFToolKitParameterDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFToolKitParameterDialogResponse encodedTypedValue](self, "encodedTypedValue", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("encodedTypedValue"));

}

- (WFToolKitParameterDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  WFToolKitParameterDialogResponse *v5;
  uint64_t v6;
  WFEncodedTypedValue *encodedTypedValue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFToolKitParameterDialogResponse;
  v5 = -[WFDialogResponse initWithBSXPCCoder:](&v9, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encodedTypedValue"));
    v6 = objc_claimAutoreleasedReturnValue();
    encodedTypedValue = v5->_encodedTypedValue;
    v5->_encodedTypedValue = (WFEncodedTypedValue *)v6;

  }
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFToolKitParameterDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithBSXPCCoder:](&v6, sel_encodeWithBSXPCCoder_, v4);
  -[WFToolKitParameterDialogResponse encodedTypedValue](self, "encodedTypedValue", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("encodedTypedValue"));

}

- (WFEncodedTypedValue)encodedTypedValue
{
  return self->_encodedTypedValue;
}

- (void)setEncodedTypedValue:(id)a3
{
  objc_storeStrong((id *)&self->_encodedTypedValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedTypedValue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

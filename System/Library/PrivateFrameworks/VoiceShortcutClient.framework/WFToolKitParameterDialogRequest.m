@implementation WFToolKitParameterDialogRequest

- (WFToolKitParameterDialogRequest)initWithParameterKey:(id)a3 attribution:(id)a4 prompt:(id)a5
{
  id v9;
  WFToolKitParameterDialogRequest *v10;
  WFToolKitParameterDialogRequest *v11;
  WFToolKitParameterDialogRequest *v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFToolKitParameterDialogRequest;
  v10 = -[WFDialogRequest initWithAttribution:prompt:](&v14, sel_initWithAttribution_prompt_, a4, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_parameterKey, a3);
    v12 = v11;
  }

  return v11;
}

- (WFToolKitParameterDialogRequest)initWithCoder:(id)a3
{
  id v4;
  WFToolKitParameterDialogRequest *v5;
  uint64_t v6;
  NSString *parameterKey;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFToolKitParameterDialogRequest;
  v5 = -[WFDialogRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    parameterKey = v5->_parameterKey;
    v5->_parameterKey = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFToolKitParameterDialogRequest;
  v4 = a3;
  -[WFDialogRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFToolKitParameterDialogRequest parameterKey](self, "parameterKey", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("parameterKey"));

}

- (NSString)parameterKey
{
  return self->_parameterKey;
}

- (void)setParameterKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterKey, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

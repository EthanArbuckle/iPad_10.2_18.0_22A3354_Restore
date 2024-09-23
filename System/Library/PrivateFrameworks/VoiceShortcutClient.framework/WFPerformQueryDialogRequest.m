@implementation WFPerformQueryDialogRequest

- (WFPerformQueryDialogRequest)initWithParameterKey:(id)a3 attribution:(id)a4 prompt:(id)a5
{
  id v8;
  WFPerformQueryDialogRequest *v9;
  uint64_t v10;
  NSString *parameterKey;
  WFPerformQueryDialogRequest *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFPerformQueryDialogRequest;
  v9 = -[WFDialogRequest initWithAttribution:prompt:](&v14, sel_initWithAttribution_prompt_, a4, a5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    parameterKey = v9->_parameterKey;
    v9->_parameterKey = (NSString *)v10;

    v12 = v9;
  }

  return v9;
}

- (WFPerformQueryDialogRequest)initWithCoder:(id)a3
{
  id v4;
  WFPerformQueryDialogRequest *v5;
  uint64_t v6;
  NSString *parameterKey;
  WFPerformQueryDialogRequest *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFPerformQueryDialogRequest;
  v5 = -[WFDialogRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    parameterKey = v5->_parameterKey;
    v5->_parameterKey = (NSString *)v6;

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
  v6.super_class = (Class)WFPerformQueryDialogRequest;
  v4 = a3;
  -[WFDialogRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFPerformQueryDialogRequest parameterKey](self, "parameterKey", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("parameterKey"));

}

- (NSString)parameterKey
{
  return self->_parameterKey;
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

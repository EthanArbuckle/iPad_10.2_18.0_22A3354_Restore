@implementation WFSiriLinkResponse

- (WFSiriLinkResponse)initWithOutput:(id)a3 andError:(id)a4
{
  id v7;
  WFSiriLinkResponse *v8;
  WFSiriLinkResponse *v9;
  WFSiriLinkResponse *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFSiriLinkResponse;
  v8 = -[WFSiriActionResponse initWithError:](&v12, sel_initWithError_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_actionOutput, a3);
    v10 = v9;
  }

  return v9;
}

- (WFSiriLinkResponse)initWithCoder:(id)a3
{
  id v4;
  WFSiriLinkResponse *v5;
  uint64_t v6;
  LNActionOutput *actionOutput;
  WFSiriLinkResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriLinkResponse;
  v5 = -[WFSiriActionResponse initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionOutput"));
    v6 = objc_claimAutoreleasedReturnValue();
    actionOutput = v5->_actionOutput;
    v5->_actionOutput = (LNActionOutput *)v6;

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
  v6.super_class = (Class)WFSiriLinkResponse;
  v4 = a3;
  -[WFSiriActionResponse encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFSiriLinkResponse actionOutput](self, "actionOutput", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actionOutput"));

}

- (LNActionOutput)actionOutput
{
  return self->_actionOutput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionOutput, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation WFLinkSnippetEnvironmentDialogResponse

- (WFLinkSnippetEnvironmentDialogResponse)initWithEnvironment:(id)a3
{
  id v5;
  WFLinkSnippetEnvironmentDialogResponse *v6;
  WFLinkSnippetEnvironmentDialogResponse *v7;
  WFLinkSnippetEnvironmentDialogResponse *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLinkSnippetEnvironmentDialogResponse;
  v6 = -[WFDialogResponse initWithResponseCode:](&v10, sel_initWithResponseCode_, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_environment, a3);
    v8 = v7;
  }

  return v7;
}

- (WFLinkSnippetEnvironmentDialogResponse)initWithCancelled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFLinkSnippetEnvironmentDialogResponse;
  return -[WFDialogResponse initWithCancelled:](&v4, sel_initWithCancelled_, a3);
}

- (WFLinkSnippetEnvironmentDialogResponse)initWithCoder:(id)a3
{
  id v4;
  WFLinkSnippetEnvironmentDialogResponse *v5;
  uint64_t v6;
  LNSnippetEnvironment *environment;
  WFLinkSnippetEnvironmentDialogResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLinkSnippetEnvironmentDialogResponse;
  v5 = -[WFDialogResponse initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("environment"));
    v6 = objc_claimAutoreleasedReturnValue();
    environment = v5->_environment;
    v5->_environment = (LNSnippetEnvironment *)v6;

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
  v6.super_class = (Class)WFLinkSnippetEnvironmentDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFLinkSnippetEnvironmentDialogResponse environment](self, "environment", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("environment"));

}

- (WFLinkSnippetEnvironmentDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  WFLinkSnippetEnvironmentDialogResponse *v5;
  uint64_t v6;
  LNSnippetEnvironment *environment;
  WFLinkSnippetEnvironmentDialogResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLinkSnippetEnvironmentDialogResponse;
  v5 = -[WFDialogResponse initWithBSXPCCoder:](&v10, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("environment"));
    v6 = objc_claimAutoreleasedReturnValue();
    environment = v5->_environment;
    v5->_environment = (LNSnippetEnvironment *)v6;

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
  v6.super_class = (Class)WFLinkSnippetEnvironmentDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithBSXPCCoder:](&v6, sel_encodeWithBSXPCCoder_, v4);
  -[WFLinkSnippetEnvironmentDialogResponse environment](self, "environment", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("environment"));

}

- (LNSnippetEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
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

@implementation WFLinkSnippetEnvironmentDialogRequest

- (WFLinkSnippetEnvironmentDialogRequest)initWithAttribution:(id)a3 prompt:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFLinkSnippetEnvironmentDialogRequest;
  return -[WFDialogRequest initWithAttribution:prompt:](&v5, sel_initWithAttribution_prompt_, a3, a4);
}

- (WFLinkSnippetEnvironmentDialogRequest)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFLinkSnippetEnvironmentDialogRequest;
  return -[WFDialogRequest initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFLinkSnippetEnvironmentDialogRequest;
  -[WFDialogRequest encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

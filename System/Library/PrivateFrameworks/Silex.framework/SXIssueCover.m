@implementation SXIssueCover

- (SXIssueCover)initWithIssueIdentifier:(id)a3
{
  id v4;
  SXIssueCover *v5;
  uint64_t v6;
  NSString *issueIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXIssueCover;
  v5 = -[SXIssueCover init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    issueIdentifier = v5->_issueIdentifier;
    v5->_issueIdentifier = (NSString *)v6;

  }
  return v5;
}

- (NSString)issueIdentifier
{
  return self->_issueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issueIdentifier, 0);
}

@end

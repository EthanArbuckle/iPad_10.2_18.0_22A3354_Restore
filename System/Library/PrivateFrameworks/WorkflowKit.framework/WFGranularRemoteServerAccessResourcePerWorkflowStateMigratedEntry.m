@implementation WFGranularRemoteServerAccessResourcePerWorkflowStateMigratedEntry

- (WFGranularRemoteServerAccessResourcePerWorkflowStateMigratedEntry)initWithCoder:(id)a3
{
  id v4;
  WFGranularRemoteServerAccessResourcePerWorkflowStateMigratedEntry *v5;
  uint64_t v6;
  NSNumber *authorized;
  uint64_t v8;
  NSString *host;
  WFGranularRemoteServerAccessResourcePerWorkflowStateMigratedEntry *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFGranularRemoteServerAccessResourcePerWorkflowStateMigratedEntry;
  v5 = -[WFGranularRemoteServerAccessResourcePerWorkflowStateMigratedEntry init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isAuthorized"));
    v6 = objc_claimAutoreleasedReturnValue();
    authorized = v5->authorized;
    v5->authorized = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("host"));
    v8 = objc_claimAutoreleasedReturnValue();
    host = v5->host;
    v5->host = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->host, 0);
  objc_storeStrong((id *)&self->authorized, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

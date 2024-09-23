@implementation WFGranularHealthKitAccessResourcePerWorkflowStateMigratedEntry

- (WFGranularHealthKitAccessResourcePerWorkflowStateMigratedEntry)initWithCoder:(id)a3
{
  id v4;
  WFGranularHealthKitAccessResourcePerWorkflowStateMigratedEntry *v5;
  uint64_t v6;
  NSNumber *authorized;
  WFGranularHealthKitAccessResourcePerWorkflowStateMigratedEntry *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFGranularHealthKitAccessResourcePerWorkflowStateMigratedEntry;
  v5 = -[WFGranularHealthKitAccessResourcePerWorkflowStateMigratedEntry init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isAuthorized"));
    v6 = objc_claimAutoreleasedReturnValue();
    authorized = v5->authorized;
    v5->authorized = (NSNumber *)v6;

    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->authorized, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

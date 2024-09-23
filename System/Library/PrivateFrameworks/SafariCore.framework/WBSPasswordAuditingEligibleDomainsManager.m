@implementation WBSPasswordAuditingEligibleDomainsManager

- (WBSPasswordAuditingEligibleDomainsManager)init
{

  return 0;
}

- (WBSPasswordAuditingEligibleDomainsManager)initWithDomainsIneligibleForPasswordAuditing:(id)a3
{
  id v4;
  WBSPasswordAuditingEligibleDomainsManager *v5;
  uint64_t v6;
  NSSet *domainsIneligibleForPasswordAuditing;
  WBSPasswordAuditingEligibleDomainsManager *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSPasswordAuditingEligibleDomainsManager;
  v5 = -[WBSPasswordAuditingEligibleDomainsManager init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    domainsIneligibleForPasswordAuditing = v5->_domainsIneligibleForPasswordAuditing;
    v5->_domainsIneligibleForPasswordAuditing = (NSSet *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSSet)domainsIneligibleForPasswordAuditing
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDomainsIneligibleForPasswordAuditing:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainsIneligibleForPasswordAuditing, 0);
}

@end

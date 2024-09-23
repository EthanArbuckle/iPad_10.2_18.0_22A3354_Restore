@implementation WBSAppIDsToDomainsAssociationManager

- (WBSAppIDsToDomainsAssociationManager)initWithAppIDsToDomains:(id)a3
{
  id v4;
  WBSAppIDsToDomainsAssociationManager *v5;
  uint64_t v6;
  NSDictionary *appIDsToDomains;
  WBSAppIDsToDomainsAssociationManager *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSAppIDsToDomainsAssociationManager;
  v5 = -[WBSAppIDsToDomainsAssociationManager init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    appIDsToDomains = v5->_appIDsToDomains;
    v5->_appIDsToDomains = (NSDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)domainsWithAssociatedCredentialsForAppID:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_appIDsToDomains, "objectForKeyedSubscript:", a3);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; appIDsToDomains: %@>"),
               objc_opt_class(),
               self,
               self->_appIDsToDomains);
}

- (NSDictionary)appIDsToDomains
{
  return self->_appIDsToDomains;
}

- (void)setAppIDsToDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIDsToDomains, 0);
}

@end

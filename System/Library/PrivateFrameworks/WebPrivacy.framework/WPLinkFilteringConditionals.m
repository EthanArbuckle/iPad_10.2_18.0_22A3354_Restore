@implementation WPLinkFilteringConditionals

- (WPLinkFilteringConditionals)init
{
  WPLinkFilteringConditionals *v2;
  uint64_t v3;
  NSMutableSet *domains;
  uint64_t v5;
  NSMutableArray *paths;
  WPLinkFilteringConditionals *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WPLinkFilteringConditionals;
  v2 = -[WPLinkFilteringConditionals init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    domains = v2->_domains;
    v2->_domains = (NSMutableSet *)v3;

    v5 = objc_opt_new();
    paths = v2->_paths;
    v2->_paths = (NSMutableArray *)v5;

    v7 = v2;
  }

  return v2;
}

- (NSMutableArray)paths
{
  return self->_paths;
}

- (NSMutableSet)domains
{
  return self->_domains;
}

- (void)setDomains:(id)a3
{
  objc_storeStrong((id *)&self->_domains, a3);
}

- (void)setPaths:(id)a3
{
  objc_storeStrong((id *)&self->_paths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_domains, 0);
}

@end

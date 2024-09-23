@implementation PommesSearchServiceLauncher

- (PommesSearchServiceLauncher)init
{
  PommesSearchServiceLauncher *v2;
  PommesSearchXPCServer *v3;
  PommesSearchXPCServer *pommesSearchService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PommesSearchServiceLauncher;
  v2 = -[PommesSearchServiceLauncher init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PommesSearchXPCServer);
    pommesSearchService = v2->_pommesSearchService;
    v2->_pommesSearchService = v3;

  }
  return v2;
}

- (PommesSearchXPCServer)pommesSearchService
{
  return self->_pommesSearchService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pommesSearchService, 0);
}

@end

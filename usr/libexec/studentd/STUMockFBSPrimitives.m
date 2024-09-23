@implementation STUMockFBSPrimitives

- (STUMockFBSPrimitives)init
{
  STUMockFBSPrimitives *v2;
  NSMutableArray *v3;
  NSMutableArray *openedApps;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUMockFBSPrimitives;
  v2 = -[STUMockFBSPrimitives init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableArray);
    openedApps = v2->_openedApps;
    v2->_openedApps = v3;

  }
  return v2;
}

- (void)openApplication:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void (**v10)(id, _QWORD);

  v10 = (void (**)(id, _QWORD))a5;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUMockFBSPrimitives openedApps](self, "openedApps"));
  v9 = objc_msgSend(v7, "copy");

  objc_msgSend(v8, "addObject:", v9);
  v10[2](v10, 0);

}

- (NSMutableArray)openedApps
{
  return self->_openedApps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openedApps, 0);
}

@end

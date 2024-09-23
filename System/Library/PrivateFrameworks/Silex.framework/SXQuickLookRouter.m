@implementation SXQuickLookRouter

- (SXQuickLookRouter)initWithResolver:(id)a3
{
  id v5;
  SXQuickLookRouter *v6;
  SXQuickLookRouter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXQuickLookRouter;
  v6 = -[SXQuickLookRouter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_resolver, a3);

  return v7;
}

- (void)presentFile:(id)a3 transitionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[SXQuickLookRouter resolver](self, "resolver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resolveProtocol:", &unk_254F7FD18);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "viewControllerForFile:transitionContext:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SXQuickLookRouter resolver](self, "resolver");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resolveProtocol:", &unk_254F40D68);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "presentViewController:animated:", v9, 1);
  }

}

- (TFResolver)resolver
{
  return self->_resolver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolver, 0);
}

@end

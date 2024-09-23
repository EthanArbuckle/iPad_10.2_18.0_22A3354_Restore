@implementation SYShowBacklinkIndicatorCommand

- (void)runWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SYShowBacklinkIndicatorCommand _impl](self, "_impl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "runWithCompletion:", v4);

}

- (BOOL)isActive
{
  void *v2;
  char v3;

  -[SYShowBacklinkIndicatorCommand _impl](self, "_impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActive");

  return v3;
}

- (SYShowBacklinkIndicatorCommand)initWithDomainIdentifiers:(id)a3 linkIdentifiers:(id)a4
{
  id v6;
  id v7;
  SYShowBacklinkIndicatorCommand *v8;
  _BOOL4 v9;
  __objc2_class **v10;
  uint64_t v11;
  SYShowBacklinkIndicatorCommandImpl *impl;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SYShowBacklinkIndicatorCommand;
  v8 = -[SYShowBacklinkIndicatorCommand init](&v14, sel_init);
  if (v8)
  {
    v9 = SYIsPhone();
    v10 = off_1E757AA88;
    if (!v9)
      v10 = off_1E757AA90;
    v11 = objc_msgSend(objc_alloc(*v10), "initWithDomainIdentifiers:linkIdentifiers:", v6, v7);
    impl = v8->__impl;
    v8->__impl = (SYShowBacklinkIndicatorCommandImpl *)v11;

  }
  return v8;
}

- (SYShowBacklinkIndicatorCommandImpl)_impl
{
  return self->__impl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__impl, 0);
}

- (void)invalidate
{
  id v2;

  -[SYShowBacklinkIndicatorCommand _impl](self, "_impl");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)set_impl:(id)a3
{
  objc_storeStrong((id *)&self->__impl, a3);
}

@end

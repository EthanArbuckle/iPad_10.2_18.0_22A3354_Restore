@implementation TYUsagePairs

- (TYUsagePairs)init
{
  TYUsagePairs *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TYUsagePairs;
  v2 = -[TYUsagePairs init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[TYUsagePairs set_usages:](v2, "set_usages:", v3);

    v4 = (void *)objc_opt_new();
    -[TYUsagePairs set_usagePages:](v2, "set_usagePages:", v4);

  }
  return v2;
}

- (id)usagePages
{
  void *v2;
  void *v3;

  -[TYUsagePairs _usagePages](self, "_usagePages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)usages
{
  void *v2;
  void *v3;

  -[TYUsagePairs _usages](self, "_usages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (NSMutableArray)_usagePages
{
  return self->__usagePages;
}

- (void)set_usagePages:(id)a3
{
  objc_storeStrong((id *)&self->__usagePages, a3);
}

- (NSMutableArray)_usages
{
  return self->__usages;
}

- (void)set_usages:(id)a3
{
  objc_storeStrong((id *)&self->__usages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__usages, 0);
  objc_storeStrong((id *)&self->__usagePages, 0);
}

@end

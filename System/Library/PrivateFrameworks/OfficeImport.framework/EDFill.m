@implementation EDFill

+ (EDFill)fillWithResources:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResources:", v3);

  return (EDFill *)v4;
}

- (EDFill)initWithResources:(id)a3
{
  id v4;
  EDFill *v5;
  EDFill *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EDFill;
  v5 = -[EDFill init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->mResources, v4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  id WeakRetained;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v6 = (void *)objc_msgSend(v4, "initWithResources:", WeakRetained);

  return v6;
}

- (BOOL)isEmpty
{
  return 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDFill;
  -[EDFill description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mResources);
}

@end

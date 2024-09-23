@implementation ClientTypeResolverParkedCarSource

- (ClientTypeResolverParkedCarSource)initWithParkedCarManager:(id)a3
{
  id v5;
  ClientTypeResolverParkedCarSource *v6;
  ClientTypeResolverParkedCarSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ClientTypeResolverParkedCarSource;
  v6 = -[ClientTypeResolverParkedCarSource init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_parkedCarManager, a3);

  return v7;
}

- (id)knownTypes
{
  return &off_101273E48;
}

- (BOOL)hasObjectWithType:(int)a3
{
  void *v4;
  BOOL v5;

  if (!-[ClientTypeResolverSource typeIsValid:](self, "typeIsValid:", *(_QWORD *)&a3))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolverParkedCarSource cachedObject](self, "cachedObject"));
  v5 = v4 != 0;

  return v5;
}

- (void)objectWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolverParkedCarSource cachedObject](self, "cachedObject"));
    if (v5)
    {
      v7[2](v7, v5);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolverParkedCarSource parkedCarManager](self, "parkedCarManager"));
      objc_msgSend(v6, "fetchParkedCar:", v7);

    }
    v4 = v7;
  }

}

- (id)cachedObject
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolverParkedCarSource parkedCarManager](self, "parkedCarManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "parkedCar"));

  return v3;
}

- (ParkedCarManager)parkedCarManager
{
  return self->_parkedCarManager;
}

- (void)setParkedCarManager:(id)a3
{
  objc_storeStrong((id *)&self->_parkedCarManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parkedCarManager, 0);
}

@end

@implementation ShowCollectionAction

- (ShowCollectionAction)initWithCollectionStorage:(id)a3
{
  id v5;
  ShowCollectionAction *v6;
  ShowCollectionAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ShowCollectionAction;
  v6 = -[ShowCollectionAction init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_collectionStorage, a3);

  return v7;
}

- (BOOL)isCompatibleWithNavigation
{
  return 0;
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 4;
}

- (GEOURLCollectionStorage)collectionStorage
{
  return self->_collectionStorage;
}

- (void)setCollectionStorage:(id)a3
{
  objc_storeStrong((id *)&self->_collectionStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionStorage, 0);
}

@end

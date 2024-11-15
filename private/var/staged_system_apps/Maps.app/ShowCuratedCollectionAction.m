@implementation ShowCuratedCollectionAction

- (ShowCuratedCollectionAction)initWithCuratedCollectionID:(unint64_t)a3 resultProviderID:(int)a4
{
  ShowCuratedCollectionAction *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ShowCuratedCollectionAction;
  result = -[ShowCuratedCollectionAction init](&v7, "init");
  if (result)
  {
    result->_curatedCollectionMUID = a3;
    result->_resultProviderID = a4;
  }
  return result;
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
  return 34;
}

- (unint64_t)curatedCollectionMUID
{
  return self->_curatedCollectionMUID;
}

- (int)resultProviderID
{
  return self->_resultProviderID;
}

@end

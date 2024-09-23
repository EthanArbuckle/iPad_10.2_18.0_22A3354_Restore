@implementation ShowPublisherAction

- (ShowPublisherAction)initWithPublisherID:(unint64_t)a3 resultProviderID:(int)a4
{
  ShowPublisherAction *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ShowPublisherAction;
  result = -[ShowPublisherAction init](&v7, "init");
  if (result)
  {
    result->_publisherMUID = a3;
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
  return 35;
}

- (unint64_t)publisherMUID
{
  return self->_publisherMUID;
}

- (int)resultProviderID
{
  return self->_resultProviderID;
}

@end

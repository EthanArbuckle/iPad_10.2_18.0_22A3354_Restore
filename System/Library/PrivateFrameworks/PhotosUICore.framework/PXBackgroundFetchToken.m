@implementation PXBackgroundFetchToken

- (PXBackgroundFetchToken)init
{
  PXBackgroundFetchToken *v2;
  NSObject *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXBackgroundFetchToken;
  v2 = -[PXBackgroundFetchToken init](&v5, sel_init);
  if (v2)
  {
    kdebug_trace();
    +[PXPhotosDataSource backgroundFetchingGroup](PXPhotosDataSource, "backgroundFetchingGroup");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v3);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[PXBackgroundFetchToken finish](self, "finish");
  v3.receiver = self;
  v3.super_class = (Class)PXBackgroundFetchToken;
  -[PXBackgroundFetchToken dealloc](&v3, sel_dealloc);
}

- (void)finish
{
  PXBackgroundFetchToken *v2;
  PXBackgroundFetchToken *v3;
  NSObject *v4;
  PXBackgroundFetchToken *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_finished)
  {
    obj->_finished = 1;
    v3 = obj;
    kdebug_trace();

    +[PXPhotosDataSource backgroundFetchingGroup](PXPhotosDataSource, "backgroundFetchingGroup");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v4);

    v2 = obj;
  }
  objc_sync_exit(v2);

}

@end

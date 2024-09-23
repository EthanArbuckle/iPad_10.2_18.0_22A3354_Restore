@implementation TUIImagePrefetchController

- (TUIImagePrefetchController)initWithResourceLoader:(id)a3
{
  id v5;
  TUIImagePrefetchController *v6;
  TUIImagePrefetchController *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  dispatch_queue_t v12;
  OS_dispatch_queue *access;
  uint64_t v14;
  NSUUID *controllerID;
  uint64_t v16;
  NSDate *lastUpdate;
  void *v18;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TUIImagePrefetchController;
  v6 = -[TUIImagePrefetchController init](&v20, "init");
  v7 = v6;
  if (v6)
  {
    v6->_priority = 0.5;
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("TUIImagePrefetchController.workQueue", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("TUIImagePrefetchController.access", 0);
    access = v7->_access;
    v7->_access = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v7->_resourceLoader, a3);
    v14 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    controllerID = v7->_controllerID;
    v7->_controllerID = (NSUUID *)v14;

    v16 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", 0.0));
    lastUpdate = v7->_lastUpdate;
    v7->_lastUpdate = (NSDate *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[TUIImagePrefetchControllerManager sharedManager](TUIImagePrefetchControllerManager, "sharedManager"));
    objc_msgSend(v18, "registerPrefetchController:", v7);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUIImagePrefetchControllerManager sharedManager](TUIImagePrefetchControllerManager, "sharedManager"));
  objc_msgSend(v3, "unregisterPrefetchController:", self);

  v4.receiver = self;
  v4.super_class = (Class)TUIImagePrefetchController;
  -[TUIImagePrefetchController dealloc](&v4, "dealloc");
}

- (float)_adjustedPriority:(float)result
{
  float priority;
  float v4;

  priority = self->_priority;
  v4 = 0.75;
  if (priority < 0.5)
    return TUIPriorityClamp(v4 * result);
  v4 = 1.25;
  if (priority > 0.5)
    return TUIPriorityClamp(v4 * result);
  return result;
}

- (void)updatePrioritiesForRenderModel:(id)a3 visibleRect:(CGRect)a4 viewState:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  double v13;
  double v14;
  NSDate *v15;
  NSDate *lastUpdate;
  id v17;
  NSObject *queue;
  _QWORD block[4];
  id v20;
  id v21;
  TUIImagePrefetchController *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGRect v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = a5;
  -[NSDate timeIntervalSinceNow](self->_lastUpdate, "timeIntervalSinceNow");
  if (v13 >= 0.0)
    v14 = v13;
  else
    v14 = -v13;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  if (!CGRectIsEmpty(v27) && v14 > 0.25)
  {
    v15 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    lastUpdate = self->_lastUpdate;
    self->_lastUpdate = v15;

    v17 = objc_msgSend(v12, "copy");
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_9744;
    block[3] = &unk_23D780;
    v20 = v11;
    v23 = x;
    v24 = y;
    v25 = width;
    v26 = height;
    v12 = v17;
    v21 = v12;
    v22 = self;
    dispatch_async(queue, block);

  }
}

- (void)urlLoaded:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_9EFC;
  v7[3] = &unk_23D7D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_checkInitialResourcesAndInvokeDelegateIfNeeded
{
  NSMutableSet *initialResources;
  NSMutableSet *initialResourcesToLoad;
  NSMutableSet *initialResourcesLoaded;
  id WeakRetained;
  char v7;
  id v8;

  if (!-[NSMutableSet count](self->_initialResourcesToLoad, "count"))
  {
    initialResources = self->_initialResources;
    self->_initialResources = 0;

    initialResourcesToLoad = self->_initialResourcesToLoad;
    self->_initialResourcesToLoad = 0;

    initialResourcesLoaded = self->_initialResourcesLoaded;
    self->_initialResourcesLoaded = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector(WeakRetained, "imagePrefetchControllerDidLoadInitialResources:");

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "imagePrefetchControllerDidLoadInitialResources:", self);

    }
    self->_hasNotifyInitialResourcesLoad = 1;
  }
}

- (TUIImagePrefetchControllerDelegate)delegate
{
  return (TUIImagePrefetchControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)controllerID
{
  return self->_controllerID;
}

- (float)priority
{
  return self->_priority;
}

- (void)setPriority:(float)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_lastUpdate, 0);
  objc_storeStrong((id *)&self->_resourcesToLoad, 0);
  objc_storeStrong((id *)&self->_initialResourcesLoaded, 0);
  objc_storeStrong((id *)&self->_initialResourcesToLoad, 0);
  objc_storeStrong((id *)&self->_initialResources, 0);
  objc_storeStrong((id *)&self->_access, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

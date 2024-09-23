@implementation BKLibraryUpdateGroup

- (BKLibraryUpdateGroup)initWithName:(id)a3
{
  id v4;
  id v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  dispatch_group_t v10;
  void *v11;
  id v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BKLibraryUpdateGroup;
  v5 = -[BKLibraryUpdateGroup init](&v15, "init");
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("com.apple.ibooks.BKLibraryUpdateGroup", v7);
    v9 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v8;

    v10 = dispatch_group_create();
    v11 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v10;

    v12 = objc_msgSend(v4, "copy");
    v13 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v12;

    dispatch_suspend(*((dispatch_object_t *)v5 + 1));
    dispatch_group_enter(*((dispatch_group_t *)v5 + 2));
  }

  return (BKLibraryUpdateGroup *)v5;
}

- (void)addOperationBlock:(id)a3
{
  if (a3)
    dispatch_async((dispatch_queue_t)self->_updateQueue, a3);
}

- (void)finishedWithOperations
{
  dispatch_group_leave((dispatch_group_t)self->_finishGroup);
}

- (id)holdOperationsAssetion
{
  OS_dispatch_queue *v2;
  BKLibraryUpdateHoldAssertion *v3;
  OS_dispatch_queue *v4;
  BKLibraryUpdateHoldAssertion *v5;
  _QWORD v7[4];
  OS_dispatch_queue *v8;

  v2 = self->_updateQueue;
  dispatch_suspend((dispatch_object_t)v2);
  v3 = [BKLibraryUpdateHoldAssertion alloc];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_7EF0;
  v7[3] = &unk_C1400;
  v8 = v2;
  v4 = v2;
  v5 = -[BKLibraryUpdateHoldAssertion initWithRelease:](v3, "initWithRelease:", v7);

  return v5;
}

- (void)executeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *finishGroup;
  NSObject *updateQueue;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    updateQueue = self->_updateQueue;
    finishGroup = self->_finishGroup;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_7F90;
    v8[3] = &unk_C1428;
    v8[4] = self;
    v9 = v4;
    dispatch_group_notify(finishGroup, updateQueue, v8);

  }
  dispatch_resume((dispatch_object_t)self->_updateQueue);

}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (OS_dispatch_group)finishGroup
{
  return self->_finishGroup;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_finishGroup, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
}

@end

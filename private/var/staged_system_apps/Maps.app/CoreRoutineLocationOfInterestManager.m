@implementation CoreRoutineLocationOfInterestManager

+ (id)sharedManager
{
  if (qword_1014D2E20 != -1)
    dispatch_once(&qword_1014D2E20, &stru_1011C01F0);
  return (id)qword_1014D2E18;
}

- (CoreRoutineLocationOfInterestManager)init
{
  CoreRoutineLocationOfInterestManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *loisByType;
  NSMutableSet *v5;
  NSMutableSet *retrievingLOIsOfTypes;
  NSMutableSet *v7;
  NSMutableSet *invalidatedLOIsOfTypes;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *dispatchQueue;
  dispatch_group_t v13;
  OS_dispatch_group *initialRetrievalDispatchGroup;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CoreRoutineLocationOfInterestManager;
  v2 = -[CoreRoutineLocationOfInterestManager init](&v16, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    loisByType = v2->_loisByType;
    v2->_loisByType = v3;

    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    retrievingLOIsOfTypes = v2->_retrievingLOIsOfTypes;
    v2->_retrievingLOIsOfTypes = v5;

    v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    invalidatedLOIsOfTypes = v2->_invalidatedLOIsOfTypes;
    v2->_invalidatedLOIsOfTypes = v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_create("CoreRoutineLocationOfInterestManager", v10);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v11;

    v13 = dispatch_group_create();
    initialRetrievalDispatchGroup = v2->_initialRetrievalDispatchGroup;
    v2->_initialRetrievalDispatchGroup = (OS_dispatch_group *)v13;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self->_notificationObserver);

  v4.receiver = self;
  v4.super_class = (Class)CoreRoutineLocationOfInterestManager;
  -[CoreRoutineLocationOfInterestManager dealloc](&v4, "dealloc");
}

- (NSArray)homeLOIs
{
  return (NSArray *)-[CoreRoutineLocationOfInterestManager locationsOfInterestWithType:](self, "locationsOfInterestWithType:", 0);
}

- (NSArray)workLOIs
{
  return (NSArray *)-[CoreRoutineLocationOfInterestManager locationsOfInterestWithType:](self, "locationsOfInterestWithType:", 1);
}

- (NSArray)schoolLOIs
{
  return (NSArray *)-[CoreRoutineLocationOfInterestManager locationsOfInterestWithType:](self, "locationsOfInterestWithType:", 2);
}

- (NSArray)gymLOIs
{
  return (NSArray *)-[CoreRoutineLocationOfInterestManager locationsOfInterestWithType:](self, "locationsOfInterestWithType:", 3);
}

- (id)locationsOfInterestWithType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CoreRoutineLocationOfInterestManager loisByType](self, "loisByType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v5));

  return v6;
}

- (void)locationsOfInterestWithType:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  void *v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v14 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1006B2DF8;
  v11[3] = &unk_1011AE290;
  v11[4] = self;
  v12 = v6;
  v13 = a3;
  v10 = v6;
  -[CoreRoutineLocationOfInterestManager afterInitialRetrievalOfLOIsOfTypes:perform:](self, "afterInitialRetrievalOfLOIsOfTypes:perform:", v9, v11);

}

- (void)monitorLOIsOfTypes:(id)a3
{
  -[CoreRoutineLocationOfInterestManager afterInitialRetrievalOfLOIsOfTypes:perform:](self, "afterInitialRetrievalOfLOIsOfTypes:perform:", a3, &stru_1011C0210);
}

- (void)monitorLOIsOfTypes:(id)a3 initialRetrievalComplete:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void (**v10)(_QWORD);
  _QWORD v11[4];
  id v12;
  CoreRoutineLocationOfInterestManager *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  -[CoreRoutineLocationOfInterestManager addNotificationObserverIfNeeded](self, "addNotificationObserverIfNeeded");
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  v8 = objc_claimAutoreleasedReturnValue(-[CoreRoutineLocationOfInterestManager dispatchQueue](self, "dispatchQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1006B2F84;
  v11[3] = &unk_1011C0238;
  v9 = v6;
  v12 = v9;
  v13 = self;
  v10 = (void (**)(_QWORD))v7;
  v14 = v10;
  v15 = &v16;
  dispatch_sync(v8, v11);

  if (*((_BYTE *)v17 + 24))
    v10[2](v10);

  _Block_object_dispose(&v16, 8);
}

- (void)afterInitialRetrievalOfLOIsOfTypes:(id)a3 perform:(id)a4
{
  -[CoreRoutineLocationOfInterestManager monitorLOIsOfTypes:initialRetrievalComplete:](self, "monitorLOIsOfTypes:initialRetrievalComplete:", a3, a4);
}

- (void)invalidateLOIs
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[CoreRoutineLocationOfInterestManager dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006B3174;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)invalidateLOIsOfType:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  v5 = objc_claimAutoreleasedReturnValue(-[CoreRoutineLocationOfInterestManager dispatchQueue](self, "dispatchQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1006B3328;
  v6[3] = &unk_1011AD518;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

- (void)addNotificationObserverIfNeeded
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *notificationObserver;
  _QWORD v7[4];
  id v8;
  id location;

  if (!self->_notificationObserver)
  {
    objc_initWeak(&location, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v4 = RTLocationsOfInterestDidChangeNotification;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1006B34AC;
    v7[3] = &unk_1011AD288;
    objc_copyWeak(&v8, &location);
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, 0, v7));
    notificationObserver = self->_notificationObserver;
    self->_notificationObserver = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (BOOL)monitoringLOIsOfType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CoreRoutineLocationOfInterestManager loisByType](self, "loisByType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v6));
  if (v7)
  {
    v8 = 1;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CoreRoutineLocationOfInterestManager retrievingLOIsOfTypes](self, "retrievingLOIsOfTypes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v8 = objc_msgSend(v9, "containsObject:", v10);

  }
  return v8;
}

- (id)monitoredLOITypes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CoreRoutineLocationOfInterestManager retrievingLOIsOfTypes](self, "retrievingLOIsOfTypes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CoreRoutineLocationOfInterestManager loisByType](self, "loisByType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "setByAddingObjectsFromArray:", v5));

  return v6;
}

- (void)retrieveLOIsOfType:(int64_t)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  int64_t v16;
  BOOL v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CoreRoutineLocationOfInterestManager retrievingLOIsOfTypes](self, "retrievingLOIsOfTypes"));
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CoreRoutineLocationOfInterestManager retrievingLOIsOfTypes](self, "retrievingLOIsOfTypes"));
    objc_msgSend(v8, "addObject:", v5);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CoreRoutineLocationOfInterestManager invalidatedLOIsOfTypes](self, "invalidatedLOIsOfTypes"));
    objc_msgSend(v9, "removeObject:", v5);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CoreRoutineLocationOfInterestManager loisByType](self, "loisByType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v5));

    if (!v11)
    {
      v12 = objc_claimAutoreleasedReturnValue(-[CoreRoutineLocationOfInterestManager initialRetrievalDispatchGroup](self, "initialRetrievalDispatchGroup"));
      dispatch_group_enter(v12);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1006B376C;
    v14[3] = &unk_1011C0288;
    v14[4] = self;
    v17 = v11 == 0;
    v15 = v5;
    v16 = a3;
    objc_msgSend(v13, "fetchLocationsOfInterestOfType:withHandler:", a3, v14);

  }
}

- (NSMutableDictionary)loisByType
{
  return self->_loisByType;
}

- (NSMutableSet)retrievingLOIsOfTypes
{
  return self->_retrievingLOIsOfTypes;
}

- (NSMutableSet)invalidatedLOIsOfTypes
{
  return self->_invalidatedLOIsOfTypes;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (OS_dispatch_group)initialRetrievalDispatchGroup
{
  return self->_initialRetrievalDispatchGroup;
}

- (void)setInitialRetrievalDispatchGroup:(id)a3
{
  objc_storeStrong((id *)&self->_initialRetrievalDispatchGroup, a3);
}

- (NSObject)notificationObserver
{
  return self->_notificationObserver;
}

- (void)setNotificationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_notificationObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationObserver, 0);
  objc_storeStrong((id *)&self->_initialRetrievalDispatchGroup, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_invalidatedLOIsOfTypes, 0);
  objc_storeStrong((id *)&self->_retrievingLOIsOfTypes, 0);
  objc_storeStrong((id *)&self->_loisByType, 0);
}

@end

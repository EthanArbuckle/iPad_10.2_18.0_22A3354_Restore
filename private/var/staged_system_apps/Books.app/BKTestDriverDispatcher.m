@implementation BKTestDriverDispatcher

+ (void)prewarm
{
  if (qword_1009F4DD8 != -1)
    dispatch_once(&qword_1009F4DD8, &stru_1008E7900);
}

+ (id)shared
{
  return (id)qword_1009F4DD0;
}

- (BKTestDriverDispatcher)init
{
  BKTestDriverDispatcher *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMutableDictionary *types;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKTestDriverDispatcher;
  v2 = -[BKTestDriverDispatcher init](&v11, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iBooks.TestDriverDispatcher", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    types = v2->_types;
    v2->_types = (NSMutableDictionary *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v7, "setEventDispatcher:", v2);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKTestDriver shared](BKTestDriver, "shared"));
    objc_msgSend(v8, "setEventDispatcher:", v2);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, "notifyTHBookControllerChange:", kTHPPT_bookControllerChange, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BKTestDriverDispatcher;
  -[BKTestDriverDispatcher dealloc](&v4, "dealloc");
}

- (id)getReceivers:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_types, "objectForKey:", v4));
  if (!v5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[NSMutableDictionary setObject:forKey:](self->_types, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void)addReceiver:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BKTestDriverDispatcher queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100082708;
  block[3] = &unk_1008E7928;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)subscribeForBookController:(id)a3
{
  -[BKTestDriverDispatcher addReceiver:type:](self, "addReceiver:type:", a3, CFSTR("BookController"));
}

- (void)subscribeForLibraryController:(id)a3
{
  -[BKTestDriverDispatcher addReceiver:type:](self, "addReceiver:type:", a3, CFSTR("LibraryController"));
}

- (void)unsubscribe:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BKTestDriverDispatcher queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000827FC;
  v7[3] = &unk_1008E7338;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)async:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BKTestDriverDispatcher queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008299C;
  v7[3] = &unk_1008E7950;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)sync:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BKTestDriverDispatcher queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100082A44;
  block[3] = &unk_1008E7950;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)onEventType:(id)a3 update:(id)a4 receive:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100082B1C;
  v15[3] = &unk_1008E7978;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(queue, v15);

}

- (void)notifyTHBookControllerChange:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  -[BKTestDriverDispatcher notifyBookController:](self, "notifyBookController:", v4);

}

- (void)notifyBookController:(id)a3
{
  id v3;
  _QWORD v4[4];
  BKTestDriverDispatcher *v5;
  _QWORD v6[5];
  id v7;

  v5 = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100082D04;
  v6[3] = &unk_1008E7338;
  v6[4] = self;
  v7 = a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100082D10;
  v4[3] = &unk_1008E79A0;
  v3 = v7;
  -[BKTestDriverDispatcher onEventType:update:receive:](v5, "onEventType:update:receive:", CFSTR("BookController"), v6, v4);

}

- (void)notifyLibraryController:(id)a3
{
  id v3;
  _QWORD v4[4];
  BKTestDriverDispatcher *v5;
  _QWORD v6[5];
  id v7;

  v5 = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100082DFC;
  v6[3] = &unk_1008E7338;
  v6[4] = self;
  v7 = a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100082E08;
  v4[3] = &unk_1008E79A0;
  v3 = v7;
  -[BKTestDriverDispatcher onEventType:update:receive:](v5, "onEventType:update:receive:", CFSTR("LibraryController"), v6, v4);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)types
{
  return self->_types;
}

- (void)setTypes:(id)a3
{
  objc_storeStrong((id *)&self->_types, a3);
}

- (NSObject)bookController
{
  return self->_bookController;
}

- (void)setBookController:(id)a3
{
  objc_storeStrong((id *)&self->_bookController, a3);
}

- (NSObject)libraryController
{
  return self->_libraryController;
}

- (void)setLibraryController:(id)a3
{
  objc_storeStrong((id *)&self->_libraryController, a3);
}

- (BOOL)bookPageCurlAnimationIsRunning
{
  return self->_bookPageCurlAnimationIsRunning;
}

- (void)setBookPageCurlAnimationIsRunning:(BOOL)a3
{
  self->_bookPageCurlAnimationIsRunning = a3;
}

- (BOOL)bookPageSlideAnimationIsRunning
{
  return self->_bookPageSlideAnimationIsRunning;
}

- (void)setBookPageSlideAnimationIsRunning:(BOOL)a3
{
  self->_bookPageSlideAnimationIsRunning = a3;
}

- (BOOL)pagedToScrolledAnimationIsRunning
{
  return self->_pagedToScrolledAnimationIsRunning;
}

- (void)setPagedToScrolledAnimationIsRunning:(BOOL)a3
{
  self->_pagedToScrolledAnimationIsRunning = a3;
}

- (BOOL)pageScrollerAnimationIsRunning
{
  return self->_pageScrollerAnimationIsRunning;
}

- (void)setPageScrollerAnimationIsRunning:(BOOL)a3
{
  self->_pageScrollerAnimationIsRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryController, 0);
  objc_storeStrong((id *)&self->_bookController, 0);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

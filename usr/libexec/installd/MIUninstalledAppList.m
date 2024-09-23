@implementation MIUninstalledAppList

- (MIUninstalledAppList)init
{
  MIUninstalledAppList *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *listQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MIUninstalledAppList;
  v2 = -[MIUninstalledAppList init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.MobileInstallation.UninstalledAppListQueue", v4);
    listQueue = v2->_listQueue;
    v2->_listQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

+ (id)sharedList
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037EBC;
  block[3] = &unk_100084C08;
  block[4] = a1;
  if (qword_10009DFE8 != -1)
    dispatch_once(&qword_10009DFE8, block);
  return (id)qword_10009DFE0;
}

- (id)_mapPath
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dataDirectory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("UninstalledApplications.plist"), 0));

  return v4;
}

- (id)_onQueue_uninstalledList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstalledAppList uninstalledList](self, "uninstalledList"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstalledAppList _mapPath](self, "_mapPath"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfURL:](NSMutableDictionary, "dictionaryWithContentsOfURL:", v4));
    -[MIUninstalledAppList setUninstalledList:](self, "setUninstalledList:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstalledAppList uninstalledList](self, "uninstalledList"));
    if (!v6)
    {
      v7 = objc_opt_new(NSMutableDictionary);
      -[MIUninstalledAppList setUninstalledList:](self, "setUninstalledList:", v7);

    }
  }
  return -[MIUninstalledAppList uninstalledList](self, "uninstalledList");
}

- (void)_onQueue_setUninstalledList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  uint64_t v13;
  int *v14;
  id v15;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    -[MIUninstalledAppList setUninstalledList:](self, "setUninstalledList:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstalledAppList uninstalledList](self, "uninstalledList"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstalledAppList _mapPath](self, "_mapPath"));
    v8 = objc_msgSend(v6, "writeToURL:atomically:", v7, 1);

    if ((v8 & 1) == 0 && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
      MOLogWrite(qword_10009E048, 3, "-[MIUninstalledAppList _onQueue_setUninstalledList:]", CFSTR("Failed to write uninstalled list"));
  }
  else
  {
    -[MIUninstalledAppList setUninstalledList:](self, "setUninstalledList:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstalledAppList _mapPath](self, "_mapPath"));
    v15 = 0;
    v11 = objc_msgSend(v9, "removeItemAtURL:error:", v10, &v15);
    v12 = v15;

    if ((v11 & 1) == 0)
    {
      v13 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v14 = __error();
        strerror(*v14);
        MOLogWrite(v13, 3, "-[MIUninstalledAppList _onQueue_setUninstalledList:]", CFSTR("Failed to unlink no longer needed install map: %s"));
      }
    }

  }
}

- (void)preflightUninstalledMap
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  uint64_t v7;
  int *v8;
  id v9;

  if (!sub_10003824C())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstalledAppList _mapPath](self, "_mapPath"));
    v9 = 0;
    v5 = objc_msgSend(v3, "removeItemAtURL:error:", v4, &v9);
    v6 = v9;

    if ((v5 & 1) == 0)
    {
      v7 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v8 = __error();
        strerror(*v8);
        MOLogWrite(v7, 3, "-[MIUninstalledAppList preflightUninstalledMap]", CFSTR("Failed to unlink no longer needed install map: %s"));
      }
    }

  }
}

- (NSDictionary)uninstalledDictionary
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1000383A4;
  v11 = sub_1000383B4;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MIUninstalledAppList listQueue](self, "listQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000383BC;
  v6[3] = &unk_100084F90;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (void)addIdentifier:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (sub_10003824C())
  {
    v4 = objc_claimAutoreleasedReturnValue(-[MIUninstalledAppList listQueue](self, "listQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100038490;
    block[3] = &unk_100084F18;
    block[4] = self;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

- (void)removeIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MIUninstalledAppList listQueue](self, "listQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038598;
  block[3] = &unk_100084F18;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (OS_dispatch_queue)listQueue
{
  return self->_listQueue;
}

- (NSMutableDictionary)uninstalledList
{
  return self->_uninstalledList;
}

- (void)setUninstalledList:(id)a3
{
  objc_storeStrong((id *)&self->_uninstalledList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uninstalledList, 0);
  objc_storeStrong((id *)&self->_listQueue, 0);
}

@end

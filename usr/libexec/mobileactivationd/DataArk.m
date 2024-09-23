@implementation DataArk

- (NSMutableDictionary)store
{
  return self->_store;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (DataArk)initWithPath:(id)a3
{
  id v4;
  DataArk *v5;
  NSFileManager *v6;
  NSDictionary *v7;
  unsigned __int8 v8;
  NSMutableDictionary *v9;
  NSString *v10;
  NSString *path;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *store;
  NSMutableDictionary *v17;
  NSMutableDictionary *set_notifications;
  NSMutableDictionary *v19;
  NSMutableDictionary *change_notifications;
  NSMutableDictionary *v21;
  NSMutableDictionary *remove_notifications;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *queue;
  DataArk *v26;
  id v28;
  objc_super v29;
  NSFileAttributeKey v30;
  _UNKNOWN **v31;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)DataArk;
  v5 = -[DataArk init](&v29, "init");
  if (!v5)
    goto LABEL_18;
  if (!v4)
  {
    maLog((uint64_t)"-[DataArk initWithPath:]", 0, CFSTR("Invalid input."));
LABEL_23:
    v26 = 0;
    goto LABEL_24;
  }
  v6 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v30 = NSFilePosixPermissions;
  v31 = &off_100271598;
  v7 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v28 = 0;
  v8 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, v7, &v28);
  v9 = (NSMutableDictionary *)v28;

  if ((v8 & 1) == 0)
  {
    maLog((uint64_t)"-[DataArk initWithPath:]", 0, CFSTR("Could not create path %@: %@"), v4, v9);
LABEL_10:
    v15 = v9;
LABEL_22:

    goto LABEL_23;
  }
  v10 = (NSString *)objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("data_ark.plist"));
  path = v5->_path;
  v5->_path = v10;

  v12 = (NSMutableDictionary *)v5->_path;
  if (!v12)
  {
    maLog((uint64_t)"-[DataArk initWithPath:]", 0, CFSTR("Failed to create string."));
    goto LABEL_10;
  }
  v13 = load_dict(v12);
  if (v13)
    v14 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v13);
  else
    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  store = v5->_store;
  v5->_store = v14;

  if (!v5->_store)
  {
    maLog((uint64_t)"-[DataArk initWithPath:]", 0, CFSTR("Failed to create dictionary."));
    goto LABEL_21;
  }
  v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  set_notifications = v5->_set_notifications;
  v5->_set_notifications = v17;

  v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  change_notifications = v5->_change_notifications;
  v5->_change_notifications = v19;

  v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  remove_notifications = v5->_remove_notifications;
  v5->_remove_notifications = v21;

  if (!v5->_set_notifications || !v5->_change_notifications || !v5->_remove_notifications)
  {
    maLog((uint64_t)"-[DataArk initWithPath:]", 0, CFSTR("Failed to allocate dictionary."));
LABEL_21:

    v15 = v13;
    goto LABEL_22;
  }
  v23 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v24 = dispatch_queue_create("com.apple.mobileactivationd.dark", v23);
  queue = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v24;

  if (!v5->_queue)
  {
    maLog((uint64_t)"-[DataArk initWithPath:]", 0, CFSTR("Failed to create queue."));
    goto LABEL_21;
  }

LABEL_18:
  v26 = v5;
LABEL_24:

  return v26;
}

- (DataArk)init
{

  return 0;
}

- (void)postNotification:(id)a3
{
  __CFString *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = (__CFString *)a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v3, v3, 0, 1u);

}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (NSMutableDictionary)set_notifications
{
  return self->_set_notifications;
}

- (void)setSet_notifications:(id)a3
{
  objc_storeStrong((id *)&self->_set_notifications, a3);
}

- (NSMutableDictionary)change_notifications
{
  return self->_change_notifications;
}

- (void)setChange_notifications:(id)a3
{
  objc_storeStrong((id *)&self->_change_notifications, a3);
}

- (NSMutableDictionary)remove_notifications
{
  return self->_remove_notifications;
}

- (void)setRemove_notifications:(id)a3
{
  objc_storeStrong((id *)&self->_remove_notifications, a3);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_remove_notifications, 0);
  objc_storeStrong((id *)&self->_change_notifications, 0);
  objc_storeStrong((id *)&self->_set_notifications, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end

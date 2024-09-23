@implementation NEHelperCacheManager

- (NEHelperCacheManager)initWithFirstMessage:(id)a3
{
  id v4;
  NEHelperCacheManager *v5;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v7;
  _xpc_connection_s *v8;
  pid_t pid;
  uint64_t v10;
  uint64_t v11;
  NSString *v12;
  NSObject *clientName;
  uint64_t v14;
  objc_super v16;
  uint8_t buf[4];
  pid_t v18;
  _BYTE buffer[256];

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NEHelperCacheManager;
  v5 = -[NEHelperCacheManager init](&v16, "init");
  if (v5)
  {
    remote_connection = xpc_dictionary_get_remote_connection(v4);
    v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    v8 = v7;
    if (v7)
    {
      pid = xpc_connection_get_pid(v7);
      v10 = proc_name(pid, buffer, 0x100u);
      if ((int)v10 < 1)
      {
        v14 = ne_log_obj(v10, v11);
        clientName = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(clientName, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v18 = pid;
          _os_log_error_impl((void *)&_mh_execute_header, clientName, OS_LOG_TYPE_ERROR, "Failed to get the process name for %d", buf, 8u);
        }
      }
      else
      {
        v12 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", buffer, 4);
        clientName = v5->_clientName;
        v5->_clientName = v12;
      }

    }
  }

  return v5;
}

- (NEHelperCacheManager)init
{
  NEHelperCacheManager *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  SCPreferencesRef v7;
  NEHelperCacheManager *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NEHelperCacheManager;
  v2 = -[NEHelperCacheManager init](&v10, "init");
  if (!v2)
    goto LABEL_3;
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = dispatch_queue_create("nehelper cache manager", v4);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v5;

  v7 = SCPreferencesCreate(kCFAllocatorDefault, CFSTR("nehelper"), CFSTR("/Library/Preferences/com.apple.networkextension.cache.plist"));
  v2->_prefs = v7;
  if (!v7)
    v8 = 0;
  else
LABEL_3:
    v8 = v2;

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  myCFRelease(&self->_prefs);
  v3.receiver = self;
  v3.super_class = (Class)NEHelperCacheManager;
  -[NEHelperCacheManager dealloc](&v3, "dealloc");
}

- (OS_dispatch_queue)handlerQueue
{
  id v2;
  id Property;
  const char *v4;
  void *v5;
  OS_dispatch_queue *v6;

  v2 = sub_100020DBC((uint64_t)NEHelperCacheManager);
  Property = (id)objc_claimAutoreleasedReturnValue(v2);
  v5 = Property;
  if (Property)
    Property = objc_getProperty(Property, v4, 8, 1);
  v6 = (OS_dispatch_queue *)Property;

  return v6;
}

- (void)handleMessage:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  id Property;
  SCPreferencesRef *v8;
  SCPreferencesRef *selfa;

  v4 = a3;
  v5 = sub_100020DBC((uint64_t)NEHelperCacheManager);
  selfa = (SCPreferencesRef *)objc_claimAutoreleasedReturnValue(v5);
  if (self)
    Property = objc_getProperty(self, v6, 24, 1);
  else
    Property = 0;
  v8 = selfa;
  if (selfa)
  {
    objc_setProperty_atomic(selfa, v6, Property, 24);
    v8 = selfa;
  }
  sub_100020E00(v8, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

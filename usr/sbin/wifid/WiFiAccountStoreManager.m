@implementation WiFiAccountStoreManager

+ (id)sharedWiFiAccountStoreManager
{
  if (qword_10026D648 != -1)
    dispatch_once(&qword_10026D648, &stru_10022F8B8);
  return (id)qword_10026D640;
}

- (WiFiAccountStoreManager)init
{
  WiFiAccountStoreManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  ACAccountStore *v5;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WiFiAccountStoreManager;
  v2 = -[WiFiAccountStoreManager init](&v8, "init");
  if (!v2)
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Failed in super-init", "-[WiFiAccountStoreManager init]");
    goto LABEL_12;
  }
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = dispatch_queue_create("com.apple.wifid.accountstore", v3);
  v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  if (!v4)
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null dispatchQueue", "-[WiFiAccountStoreManager init]");
    goto LABEL_12;
  }
  v5 = (ACAccountStore *)objc_alloc_init((Class)ACAccountStore);
  v2->_accountStore = v5;
  if (!v5)
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Null _accountStore", "-[WiFiAccountStoreManager init]");
LABEL_12:
    objc_autoreleasePoolPop(v7);

    return 0;
  }
  -[WiFiAccountStoreManager _updateIsManagedAppleIDAndNotify:](v2, "_updateIsManagedAppleIDAndNotify:", 0);
  -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", v2, "_accountStoreDidChange:", ACAccountStoreDidChangeNotification, 0);
  return v2;
}

- (void)dealloc
{
  NSObject *dispatchQueue;
  void *callback;
  ACAccountStore *accountStore;
  objc_super v6;

  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, ACAccountStoreDidChangeNotification, 0);
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);
  callback = self->_callback;
  if (callback)
  {
    _Block_release(callback);
    self->_callback = 0;
  }
  if (self->_context)
    self->_context = 0;
  accountStore = self->_accountStore;
  if (accountStore)

  v6.receiver = self;
  v6.super_class = (Class)WiFiAccountStoreManager;
  -[WiFiAccountStoreManager dealloc](&v6, "dealloc");
}

- (void)registerCallback:(void *)a3 withContext:(void *)a4
{
  -[WiFiAccountStoreManager setCallback:](self, "setCallback:", a3);
  -[WiFiAccountStoreManager setContext:](self, "setContext:", a4);
}

- (BOOL)isManagedAppleID
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007FBB8;
  v4[3] = &unk_10022EC00;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WiFiAccountStoreManager dispatchQueue](self, "dispatchQueue"), v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_updateIsManagedAppleIDAndNotify:(BOOL)a3
{
  _QWORD block[6];
  BOOL v6;
  _QWORD v7[3];
  unsigned __int8 v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v8 = -86;
  v8 = objc_msgSend(-[ACAccountStore aa_primaryAppleAccount](-[WiFiAccountStoreManager accountStore](self, "accountStore"), "aa_primaryAppleAccount"), "aa_isManagedAppleID");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007FC90;
  block[3] = &unk_10022F8E0;
  block[4] = self;
  block[5] = v7;
  v6 = a3;
  dispatch_sync((dispatch_queue_t)-[WiFiAccountStoreManager dispatchQueue](self, "dispatchQueue"), block);
  _Block_object_dispose(v7, 8);
}

- (void)_accountStoreDidChange:(id)a3
{
  -[WiFiAccountStoreManager _updateIsManagedAppleIDAndNotify:](self, "_updateIsManagedAppleIDAndNotify:", 1);
}

- (void)setIsManagedAppleID:(BOOL)a3
{
  self->_isManagedAppleID = a3;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)callback
{
  return self->_callback;
}

- (void)setCallback:(void *)a3
{
  self->_callback = a3;
}

- (void)context
{
  return self->_context;
}

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

@end

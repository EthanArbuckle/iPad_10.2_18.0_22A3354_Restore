@implementation KmlSharingManager

- (KmlSharingManager)init
{
  KmlSharingManager *v2;
  uint64_t v3;
  NSMutableArray *validShareInitiatorEndpoints;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *ksmQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)KmlSharingManager;
  v2 = -[KmlSharingManager init](&v10, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    validShareInitiatorEndpoints = v2->_validShareInitiatorEndpoints;
    v2->_validShareInitiatorEndpoints = (NSMutableArray *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.sesd.kml.sharingManager", v6);
    ksmQueue = v2->_ksmQueue;
    v2->_ksmQueue = (OS_dispatch_queue *)v7;

    *(_WORD *)&v2->_alarmCheckedOnFirstunlock = 0;
  }
  return v2;
}

- (void)setAppletLockState:(BOOL)a3
{
  NSObject *ksmQueue;
  _QWORD v4[5];
  BOOL v5;

  ksmQueue = self->_ksmQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10023E94C;
  v4[3] = &unk_100304DB0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(ksmQueue, v4);
}

- (void)onAlarm:(id)a3
{
  NSObject *ksmQueue;
  _QWORD block[5];

  ksmQueue = self->_ksmQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023EA60;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(ksmQueue, block);
}

- (BOOL)sharingBlockedByApplet
{
  return self->_sharingBlockedByApplet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ksmQueue, 0);
  objc_storeStrong((id *)&self->_friendRecordsUpdater, 0);
  objc_storeStrong((id *)&self->_validShareInitiatorEndpoints, 0);
}

@end

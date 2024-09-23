@implementation fskitdDAOperations

+ (__DASession)getMainDASession
{
  if (qword_10005C790 != -1)
    dispatch_once(&qword_10005C790, &stru_1000553D0);
  return (__DASession *)qword_10005C798;
}

+ (void)probeDisk:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  __DASession *v8;
  DADiskRef v9;
  DADiskRef v10;
  _QWORD v11[4];
  id v12;
  DADiskRef v13;

  v6 = a3;
  v7 = a4;
  v8 = (__DASession *)objc_msgSend(a1, "getMainDASession");
  if (v8
    && (v9 = DADiskCreateFromBSDName(kCFAllocatorDefault, v8, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"))) != 0)
  {
    v10 = v9;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100016D4C;
    v11[3] = &unk_1000553F8;
    v13 = v9;
    v12 = v7;
    DADiskProbeWithBlock(v10, v11);

  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 4175036417);
  }

}

+ (void)setFSKitAdditions:(id)a3 disk:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  __DASession *v11;
  DADiskRef v12;
  DADiskRef v13;
  _QWORD v14[4];
  id v15;
  DADiskRef v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (__DASession *)objc_msgSend(a1, "getMainDASession");
  if (v11
    && (v12 = DADiskCreateFromBSDName(kCFAllocatorDefault, v11, (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"))) != 0)
  {
    v13 = v12;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100016E88;
    v14[3] = &unk_1000553F8;
    v16 = v12;
    v15 = v10;
    DADiskSetFSKitAdditions(v13, v8, v14);

  }
  else
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 4175036417);
  }

}

@end

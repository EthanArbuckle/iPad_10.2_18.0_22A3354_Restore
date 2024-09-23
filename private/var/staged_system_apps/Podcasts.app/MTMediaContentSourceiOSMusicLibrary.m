@implementation MTMediaContentSourceiOSMusicLibrary

- (MTMediaContentSourceiOSMusicLibrary)init
{
  MTMediaContentSourceiOSMusicLibrary *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *workQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTMediaContentSourceiOSMusicLibrary;
  v2 = -[MTMediaContentSourceiOSMusicLibrary init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -15);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("MTMediaContentSourceiOSMusicLibrary", v4);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)determineiTunesMatchEnabledWithCompletion:(id)a3
{
  id v4;
  _QWORD *v5;
  NSObject *v6;
  _QWORD *v7;
  _QWORD block[5];
  id v9;
  _QWORD v10[4];
  id v11;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100047F20;
  v10[3] = &unk_1004ABBF8;
  v11 = a3;
  v4 = v11;
  v5 = objc_retainBlock(v10);
  v6 = objc_claimAutoreleasedReturnValue(-[MTMediaContentSourceiOSMusicLibrary workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F430;
  block[3] = &unk_1004A63C8;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (BOOL)iTunesMatchEnabled
{
  return self->_iTunesMatchEnabled;
}

+ (id)sharedInstance
{
  if (qword_100567580 != -1)
    dispatch_once(&qword_100567580, &stru_1004ABBD0);
  return (id)qword_100567588;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end

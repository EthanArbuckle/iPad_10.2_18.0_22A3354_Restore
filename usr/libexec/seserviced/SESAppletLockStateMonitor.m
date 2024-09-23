@implementation SESAppletLockStateMonitor

- (void)onEvent:(id)a3 eventPayload:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  SESAppletLockStateMonitor *v14;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036B90;
  block[3] = &unk_100304490;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchedAID, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

@implementation RMHeadphoneActivityProvider

- (id)startProducingDataWithCallback:(id)a3
{
  id v4;
  RMAudioAccessoryManager *v5;
  id v6;
  void ***v7;
  RMAudioAccessoryManager *audioAccessoryManager;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  RMHeadphoneActivityProvider *v14;
  id v15;

  v4 = a3;
  v5 = objc_opt_new(RMAudioAccessoryManager);
  sub_10000402C((uint64_t)self, v5);

  +[CMAudioAccessoryManager _isAvailable](CMAudioAccessoryManager, "_isAvailable");
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_100008898;
  v13 = &unk_100024B70;
  v14 = self;
  v15 = v4;
  v6 = v4;
  v7 = objc_retainBlock(&v10);
  if (self)
    audioAccessoryManager = self->_audioAccessoryManager;
  else
    audioAccessoryManager = 0;
  -[RMAudioAccessoryManager startActivityUpdatesWithHandler:](audioAccessoryManager, "startActivityUpdatesWithHandler:", v7, v10, v11, v12, v13, v14);

  return 0;
}

- (void)stopProducingData
{
  SEL v3;

  if (self)
  {
    -[RMAudioAccessoryManager stopActivityUpdates](self->_audioAccessoryManager, "stopActivityUpdates");
    sub_10000402C((uint64_t)self, 0);
    objc_setProperty_atomic(self, v3, 0, 24);
  }
  else
  {
    objc_msgSend(0, "stopActivityUpdates");
    sub_10000402C(0, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActivity, 0);
  objc_storeStrong((id *)&self->_audioAccessoryManager, 0);
  objc_storeStrong((id *)&self->_receiverQueue, 0);
}

@end

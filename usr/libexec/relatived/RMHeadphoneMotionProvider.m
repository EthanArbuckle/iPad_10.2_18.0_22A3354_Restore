@implementation RMHeadphoneMotionProvider

- (id)startProducingDataWithCallback:(id)a3
{
  id v4;
  RMAudioAccessoryManager *v5;
  id v6;
  void ***v7;
  RMAudioAccessoryManager *audioAccessoryManager;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  RMHeadphoneMotionProvider *v14;
  id v15;

  v4 = a3;
  v5 = objc_opt_new(RMAudioAccessoryManager);
  sub_10000403C((uint64_t)self, v5);

  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_10000C508;
  v13 = &unk_100024D10;
  v14 = self;
  v15 = v4;
  v6 = v4;
  v7 = objc_retainBlock(&v10);
  if (self)
    audioAccessoryManager = self->_audioAccessoryManager;
  else
    audioAccessoryManager = 0;
  -[RMAudioAccessoryManager startDeviceMotionUpdatesWithHandler:](audioAccessoryManager, "startDeviceMotionUpdatesWithHandler:", v7, v10, v11, v12, v13, v14);

  return 0;
}

- (void)stopProducingData
{
  RMHeadphoneMotionProvider *v2;

  v2 = self;
  if (self)
    self = (RMHeadphoneMotionProvider *)self->_audioAccessoryManager;
  -[RMHeadphoneMotionProvider stopDeviceMotionUpdates](self, "stopDeviceMotionUpdates");
  sub_10000403C((uint64_t)v2, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAccessoryManager, 0);
  objc_storeStrong((id *)&self->_receiverQueue, 0);
}

@end

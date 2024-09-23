@implementation RMMediaSessionObserver

- (void)startSessionStatusUpdatesForClientMode:(int64_t)a3 toQueue:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  RMRelativeMotionManager *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[RMMediaSessionObserver manager](self, "manager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = -[RMRelativeMotionManager initWithQueue:]([RMRelativeMotionManager alloc], "initWithQueue:", v8);
    -[RMMediaSessionObserver setManager:](self, "setManager:", v11);

    v16[0] = *MEMORY[0x24BDC1458];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = *MEMORY[0x24BDC1460];
    v17[0] = v12;
    v17[1] = &unk_24F0D6B98;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RMMediaSessionObserver manager](self, "manager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAudioListenerPoseOptions:", v13);

    -[RMMediaSessionObserver manager](self, "manager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startReceivingAudioListenerPoseWithStatusCallback:", v9);

  }
}

- (void)stopSessionStatusUpdates
{
  void *v3;
  void *v4;

  -[RMMediaSessionObserver manager](self, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RMMediaSessionObserver manager](self, "manager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopReceivingAudioListenerPose");

    -[RMMediaSessionObserver setManager:](self, "setManager:", 0);
  }
}

- (RMRelativeMotionManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
}

@end

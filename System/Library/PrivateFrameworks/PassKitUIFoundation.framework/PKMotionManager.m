@implementation PKMotionManager

void __34__PKMotionManager_registerClient___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a2;
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v5 + 24))
    {
      v6 = v4;
      objc_storeStrong((id *)(v5 + 32), a2);
      objc_msgSend(*(id *)(a1 + 32), "updateWithMotion:", v6);
      v4 = v6;
    }
  }

}

- (void)updateWithMotion:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_clients;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "motionManager:didReceiveMotion:", self, v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)registerClient:(id)a3
{
  id v4;
  CMMotionManager *motionManager;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  if (v4)
  {
    -[NSHashTable addObject:](self->_clients, "addObject:", v4);
    if (self->_monitoring)
    {
      if (self->_motion)
        objc_msgSend(v4, "motionManager:didReceiveMotion:", self);
    }
    else
    {
      self->_monitoring = 1;
      motionManager = self->_motionManager;
      objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __34__PKMotionManager_registerClient___block_invoke;
      v7[3] = &unk_24D0A1688;
      v7[4] = self;
      -[CMMotionManager startDeviceMotionUpdatesToQueue:withHandler:](motionManager, "startDeviceMotionUpdatesToQueue:withHandler:", v6, v7);

    }
  }

}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_4);
  return (id)sharedManager_manager;
}

void __32__PKMotionManager_sharedManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PKMotionManager _init]([PKMotionManager alloc], "_init");
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

- (id)_init
{
  PKMotionManager *v2;
  uint64_t v3;
  NSHashTable *clients;
  CMMotionManager *v5;
  CMMotionManager *motionManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKMotionManager;
  v2 = -[PKMotionManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "pk_weakObjectsHashTableUsingPointerPersonality");
    v3 = objc_claimAutoreleasedReturnValue();
    clients = v2->_clients;
    v2->_clients = (NSHashTable *)v3;

    v5 = (CMMotionManager *)objc_alloc_init(MEMORY[0x24BDC1400]);
    motionManager = v2->_motionManager;
    v2->_motionManager = v5;

    -[CMMotionManager setDeviceMotionUpdateInterval:](v2->_motionManager, "setDeviceMotionUpdateInterval:", 0.05);
  }
  return v2;
}

- (PKMotionManager)init
{

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_monitoring)
    -[CMMotionManager stopDeviceMotionUpdates](self->_motionManager, "stopDeviceMotionUpdates");
  v3.receiver = self;
  v3.super_class = (Class)PKMotionManager;
  -[PKMotionManager dealloc](&v3, sel_dealloc);
}

- (void)unregisterClient:(id)a3
{
  id v4;
  void *v5;
  CMDeviceMotion *motion;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[NSHashTable removeObject:](self->_clients, "removeObject:", v4);
    -[NSHashTable anyObject](self->_clients, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

LABEL_6:
      v4 = v7;
      goto LABEL_7;
    }
    v4 = v7;
    if (self->_monitoring)
    {
      self->_monitoring = 0;
      motion = self->_motion;
      self->_motion = 0;

      -[CMMotionManager stopDeviceMotionUpdates](self->_motionManager, "stopDeviceMotionUpdates");
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (BOOL)isMonitoring
{
  return self->_monitoring;
}

- (CMDeviceMotion)motion
{
  return self->_motion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motion, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
}

@end

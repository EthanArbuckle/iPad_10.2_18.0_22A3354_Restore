@implementation SCDAArbitrationParticipationController

- (SCDAArbitrationParticipationController)init
{
  SCDAArbitrationParticipationController *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *xpcConnectionQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SCDAArbitrationParticipationController;
  v2 = -[SCDAArbitrationParticipationController init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("AFArbitrationParticipationXPCConnectionQueue", v4);
    xpcConnectionQueue = v2->_xpcConnectionQueue;
    v2->_xpcConnectionQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("AFArbitrationParticipationQueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)notificationNearMissCallback, CFSTR("com.apple.voicetrigger.NearTrigger"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.voicetrigger.NearTrigger"), 0);
  v4.receiver = self;
  v4.super_class = (Class)SCDAArbitrationParticipationController;
  -[SCDAArbitrationParticipationController dealloc](&v4, sel_dealloc);
}

- (void)_publishFeedbackArbitrationRecordForNearMiss
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__SCDAArbitrationParticipationController__publishFeedbackArbitrationRecordForNearMiss__block_invoke;
  block[3] = &unk_25174AD68;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)publishArbitrationParticipationContext:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  SCDAArbitrationParticipationController *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__SCDAArbitrationParticipationController_publishArbitrationParticipationContext___block_invoke;
  v7[3] = &unk_25174A620;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (AFSettingsConnection)settingsConnection
{
  AFSettingsConnection *settingsConnection;
  AFSettingsConnection *v4;
  AFSettingsConnection *v5;

  if (!self->_settingsConnection)
  {
    settingsConnection = 0;
    goto LABEL_5;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    settingsConnection = self->_settingsConnection;
LABEL_5:
    self->_settingsConnection = 0;

    v4 = (AFSettingsConnection *)objc_alloc_init(MEMORY[0x24BE092B8]);
    v5 = self->_settingsConnection;
    self->_settingsConnection = v4;

    -[AFSettingsConnection setXPCConnectionManagementQueue:](self->_settingsConnection, "setXPCConnectionManagementQueue:", self->_xpcConnectionQueue);
  }
  return self->_settingsConnection;
}

- (void)_resetSettingsConnection
{
  AFSettingsConnection *settingsConnection;

  settingsConnection = self->_settingsConnection;
  if (settingsConnection)
  {
    self->_settingsConnection = 0;

  }
}

- (void)setSettingsConnection:(id)a3
{
  objc_storeStrong((id *)&self->_settingsConnection, a3);
}

- (OS_dispatch_queue)xpcConnectionQueue
{
  return self->_xpcConnectionQueue;
}

- (void)setXpcConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnectionQueue, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
}

void __81__SCDAArbitrationParticipationController_publishArbitrationParticipationContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;

  v16 = objc_alloc(MEMORY[0x24BE920A8]);
  objc_msgSend(*(id *)(a1 + 32), "myAdvertisement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "boosts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cdaId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (double)objc_msgSend(*(id *)(a1 + 32), "rawGoodnessScore");
  objc_msgSend(*(id *)(a1 + 32), "requestStartDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(*(id *)(a1 + 32), "result");
  objc_msgSend(*(id *)(a1 + 32), "seenAdvertisements");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "msSinceTrigger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "msSinceLastWin");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "triggerType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "trumpReasons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "winnerAdvertisement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "initWithAdvertisement:boosts:cdaId:rawGoodnessScore:requestStartDate:result:seenAdvertisements:timeSinceLastTriggerInMilliseconds:timeSinceLastWinInMilliseconds:triggerType:trumpReasons:voiceTriggerDate:winnerAdvertisement:", v2, v3, v4, v15, v14, v13, v5, v12, v11, v6, v7, v8, v9);

  objc_msgSend(*(id *)(a1 + 40), "settingsConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "publishFeedbackArbitrationParticipation:", v17);

  objc_msgSend(*(id *)(a1 + 40), "_resetSettingsConnection");
}

void __86__SCDAArbitrationParticipationController__publishFeedbackArbitrationRecordForNearMiss__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE920A8]), "initNearMiss");
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[SCDAArbitrationParticipationController _publishFeedbackArbitrationRecordForNearMiss]_block_invoke";
    _os_log_debug_impl(&dword_246211000, v3, OS_LOG_TYPE_DEBUG, "%s #scda #feedback", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "settingsConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publishFeedbackArbitrationParticipation:", v2);

  objc_msgSend(*(id *)(a1 + 32), "_resetSettingsConnection");
}

@end

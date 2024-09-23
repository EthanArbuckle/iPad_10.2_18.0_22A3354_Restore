@implementation SVXPowerLevelListener

- (SVXPowerLevelListener)init
{
  SVXAFAudioPowerUpdaterProvider *v3;
  SVXPowerLevelListener *v4;

  v3 = objc_alloc_init(SVXAFAudioPowerUpdaterProvider);
  v4 = -[SVXPowerLevelListener initWithAudioPowerUpdaterProvider:](self, "initWithAudioPowerUpdaterProvider:", v3);

  return v4;
}

- (SVXPowerLevelListener)initWithAudioPowerUpdaterProvider:(id)a3
{
  id v5;
  SVXPowerLevelListener *v6;
  SVXPowerLevelListener *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXPowerLevelListener;
  v6 = -[SVXPowerLevelListener init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_audioPowerUpdaterProvider, a3);

  return v7;
}

- (void)beginListeningToAudioPowerProvider:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *outputAudioPowerUpdaterQueue;
  AFAudioPowerUpdater *v10;
  AFAudioPowerUpdater *outputAudioPowerUpdater;
  NSObject *v12;

  v6 = a4;
  v7 = a3;
  -[SVXPowerLevelListener endListening](self, "endListening");
  objc_storeWeak((id *)&self->_audioPowerProvider, v7);

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v8 = (OS_dispatch_queue *)dispatch_queue_create("TTSPowerUpdateQueue", v12);
  outputAudioPowerUpdaterQueue = self->_outputAudioPowerUpdaterQueue;
  self->_outputAudioPowerUpdaterQueue = v8;

  -[SVXAFAudioPowerUpdaterProvider createWithProvider:queue:frequency:delegate:](self->_audioPowerUpdaterProvider, "createWithProvider:queue:frequency:delegate:", self, self->_outputAudioPowerUpdaterQueue, -[SVXPowerLevelListener _frequency](self, "_frequency"), 0);
  v10 = (AFAudioPowerUpdater *)objc_claimAutoreleasedReturnValue();
  outputAudioPowerUpdater = self->_outputAudioPowerUpdater;
  self->_outputAudioPowerUpdater = v10;

  -[AFAudioPowerUpdater createNewXPCWrapperWithCompletion:](self->_outputAudioPowerUpdater, "createNewXPCWrapperWithCompletion:", v6);
  -[AFAudioPowerUpdater beginUpdate](self->_outputAudioPowerUpdater, "beginUpdate");

}

- (void)endListening
{
  AFAudioPowerUpdater *outputAudioPowerUpdater;
  OS_dispatch_queue *outputAudioPowerUpdaterQueue;

  objc_storeWeak((id *)&self->_audioPowerProvider, 0);
  -[AFAudioPowerUpdater endUpdate](self->_outputAudioPowerUpdater, "endUpdate");
  -[AFAudioPowerUpdater invalidate](self->_outputAudioPowerUpdater, "invalidate");
  outputAudioPowerUpdater = self->_outputAudioPowerUpdater;
  self->_outputAudioPowerUpdater = 0;

  outputAudioPowerUpdaterQueue = self->_outputAudioPowerUpdaterQueue;
  self->_outputAudioPowerUpdaterQueue = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[SVXPowerLevelListener endListening](self, "endListening");
  v3.receiver = self;
  v3.super_class = (Class)SVXPowerLevelListener;
  -[SVXPowerLevelListener dealloc](&v3, sel_dealloc);
}

- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4
{
  dispatch_semaphore_t v7;
  id WeakRetained;
  NSObject *v9;
  dispatch_time_t v10;
  intptr_t v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  float *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  float *v22;
  uint64_t v23;
  int v24;

  v21 = 0;
  v22 = (float *)&v21;
  v23 = 0x2020000000;
  v24 = -1024458752;
  v17 = 0;
  v18 = (float *)&v17;
  v19 = 0x2020000000;
  v20 = -1024458752;
  v7 = dispatch_semaphore_create(0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_audioPowerProvider);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __54__SVXPowerLevelListener_getAveragePower_andPeakPower___block_invoke;
  v13[3] = &unk_24D24D758;
  v15 = &v21;
  v16 = &v17;
  v9 = v7;
  v14 = v9;
  objc_msgSend(WeakRetained, "getAudioPower:", v13);

  v10 = dispatch_time(0, 500000000);
  v11 = dispatch_semaphore_wait(v9, v10);
  *a3 = v22[6];
  *a4 = v18[6];
  LOBYTE(a4) = v11 == 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return (char)a4;
}

- (int64_t)_frequency
{
  return 1;
}

- (SVXAudioPowerProviding)audioPowerProvider
{
  return (SVXAudioPowerProviding *)objc_loadWeakRetained((id *)&self->_audioPowerProvider);
}

- (void)setAudioPowerProvider:(id)a3
{
  objc_storeWeak((id *)&self->_audioPowerProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_audioPowerProvider);
  objc_storeStrong((id *)&self->_outputAudioPowerUpdaterQueue, 0);
  objc_storeStrong((id *)&self->_outputAudioPowerUpdater, 0);
  objc_storeStrong((id *)&self->_audioPowerUpdaterProvider, 0);
}

intptr_t __54__SVXPowerLevelListener_getAveragePower_andPeakPower___block_invoke(uint64_t a1, float a2, float a3)
{
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end

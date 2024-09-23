@implementation _UIMotionEffectCoreMotionEventProvider

- (void)stopGeneratingEvents
{
  NSOperationQueue *motionEventQueue;
  _QWORD v4[5];

  -[NSOperationQueue cancelAllOperations](self->_motionEventQueue, "cancelAllOperations");
  motionEventQueue = self->_motionEventQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62___UIMotionEffectCoreMotionEventProvider_stopGeneratingEvents__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  -[NSOperationQueue addOperationWithBlock:](motionEventQueue, "addOperationWithBlock:", v4);
}

- (id)currentEvent
{
  void *v2;
  _UIMotionEffectAttitudeEvent *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _UIMotionEffectAttitudeEvent *v11;

  -[CMMotionManager deviceMotion](self->_motionManager, "deviceMotion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = [_UIMotionEffectAttitudeEvent alloc];
    objc_msgSend(v2, "timestamp");
    v5 = v4;
    objc_msgSend(v2, "attitude");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "quaternion");
    v11 = -[_UIMotionEffectAttitudeEvent initWithTimestamp:attitude:](v3, "initWithTimestamp:attitude:", v5, v7, v8, v9, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)startGeneratingEvents
{
  NSOperationQueue *motionEventQueue;
  _QWORD v4[5];

  if (-[CMMotionManager isDeviceMotionAvailable](self->_motionManager, "isDeviceMotionAvailable"))
  {
    -[CMMotionManager setNotificationCallback:info:](self->_motionManager, "setNotificationCallback:info:", _HandleMotionManagerNotification, self);
    -[NSOperationQueue cancelAllOperations](self->_motionEventQueue, "cancelAllOperations");
    motionEventQueue = self->_motionEventQueue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __63___UIMotionEffectCoreMotionEventProvider_startGeneratingEvents__block_invoke;
    v4[3] = &unk_1E16B1B28;
    v4[4] = self;
    -[NSOperationQueue addOperationWithBlock:](motionEventQueue, "addOperationWithBlock:", v4);
  }
}

- (_UIMotionEffectCoreMotionEventProvider)init
{
  _UIMotionEffectCoreMotionEventProvider *v2;
  NSOperationQueue *v3;
  NSOperationQueue *motionEventQueue;
  void *v5;
  objc_class *v6;
  uint64_t v7;
  CMMotionManager *motionManager;
  objc_super v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v10.receiver = self;
  v10.super_class = (Class)_UIMotionEffectCoreMotionEventProvider;
  v2 = -[_UIMotionEffectCoreMotionEventProvider init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    motionEventQueue = v2->_motionEventQueue;
    v2->_motionEventQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_motionEventQueue, "setMaxConcurrentOperationCount:", 1);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v5 = (void *)_MergedGlobals_9_4;
    v15 = _MergedGlobals_9_4;
    if (!_MergedGlobals_9_4)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __getCMMotionManagerClass_block_invoke_0;
      v11[3] = &unk_1E16B14C0;
      v11[4] = &v12;
      __getCMMotionManagerClass_block_invoke_0((uint64_t)v11);
      v5 = (void *)v13[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v12, 8);
    v7 = objc_msgSend([v6 alloc], "initUsingGyroOnlySensorFusion");
    motionManager = v2->_motionManager;
    v2->_motionManager = (CMMotionManager *)v7;

    -[CMMotionManager setPowerConservationMode:](v2->_motionManager, "setPowerConservationMode:", 1);
    -[CMMotionManager setDeviceMotionUpdateInterval:](v2->_motionManager, "setDeviceMotionUpdateInterval:", 1.0 / _UIGetUIMotionEffectMotionUpdateFrequency());
  }
  return v2;
}

- (void)setSlowUpdatesEnabled:(BOOL)a3
{
  int v4;
  double updated;

  if (a3)
  {
    v4 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_UIMotionEffectMotionUpdateSlowFrequency, (uint64_t)CFSTR("UIMotionEffectMotionUpdateSlowFrequency"));
    updated = *(double *)&qword_1EDDA81E8;
    if (v4)
      updated = 5.0;
  }
  else
  {
    updated = _UIGetUIMotionEffectMotionUpdateFrequency();
  }
  -[CMMotionManager setDeviceMotionCallback:info:interval:fsync:](self->_motionManager, "setDeviceMotionCallback:info:interval:fsync:", _HandleNewDeviceMotion, self, 0, 1.0 / updated);
}

- (void)dealloc
{
  objc_super v3;

  -[NSOperationQueue cancelAllOperations](self->_motionEventQueue, "cancelAllOperations");
  -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_motionEventQueue, "waitUntilAllOperationsAreFinished");
  v3.receiver = self;
  v3.super_class = (Class)_UIMotionEffectCoreMotionEventProvider;
  -[_UIMotionEffectCoreMotionEventProvider dealloc](&v3, sel_dealloc);
}

- (BOOL)shouldLogEvents
{
  return 1;
}

- (double)fastUpdateIntervalForLogs
{
  return 1.0 / _UIGetUIMotionEffectMotionUpdateFrequency();
}

- (double)slowUpdateIntervalForLogs
{
  int v2;
  double result;

  v2 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_UIMotionEffectMotionUpdateSlowFrequency, (uint64_t)CFSTR("UIMotionEffectMotionUpdateSlowFrequency"));
  result = 1.0 / *(double *)&qword_1EDDA81E8;
  if (v2)
    return 0.2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionEventQueue, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
}

@end

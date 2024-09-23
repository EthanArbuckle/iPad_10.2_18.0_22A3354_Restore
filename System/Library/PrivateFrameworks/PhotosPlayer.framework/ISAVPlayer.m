@implementation ISAVPlayer

- (void)dealloc
{
  objc_super v3;

  -[ISAVPlayer _cancelRateCurveRequest](self, "_cancelRateCurveRequest");
  v3.receiver = self;
  v3.super_class = (Class)ISAVPlayer;
  -[ISAVPlayer dealloc](&v3, sel_dealloc);
}

- (ISAVPlayer)init
{
  ISAVPlayer *v2;
  ISAVPlayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISAVPlayer;
  v2 = -[ISAVPlayer init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_initializedDispatchQueue, MEMORY[0x1E0C80D38]);
    objc_storeStrong((id *)&v3->_actualDispatchQueue, v3->_initializedDispatchQueue);
  }
  return v3;
}

- (ISAVPlayer)initWithDispatchQueue:(id)a3
{
  id v5;
  int v6;
  int AppBooleanValue;
  int v8;
  ISAVPlayer *v9;
  int v10;
  OS_dispatch_queue *v11;
  id v12;
  OS_dispatch_queue *actualDispatchQueue;
  OS_dispatch_queue *v14;
  void *v15;
  int v16;
  objc_super v18;
  objc_super v19;
  objc_super v20;
  objc_super v21;

  v5 = a3;
  v6 = objc_msgSend((id)objc_opt_class(), "isSpringBoard");
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("PhotosPlayer.disablePrivatePlayerQueue"), CFSTR("com.apple.mobileslideshow"), 0);
  if ((v6 & 1) != 0
    || (v8 = AppBooleanValue, objc_msgSend((id)objc_opt_class(), "isAppleInternal")) && v8)
  {
    v21.receiver = self;
    v21.super_class = (Class)ISAVPlayer;
    v9 = -[ISAVPlayer init](&v21, sel_init);
    v10 = 1;
    if (!v9)
      goto LABEL_16;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)ISAVPlayer;
    v9 = -[ISAVPlayer initWithDispatchQueue:](&v20, sel_initWithDispatchQueue_, v5);
    v10 = 0;
    if (!v9)
      goto LABEL_16;
  }
  objc_storeStrong((id *)&v9->_initializedDispatchQueue, a3);
  if (v10)
  {
    v11 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C80D38];
    actualDispatchQueue = v9->_actualDispatchQueue;
    v9->_actualDispatchQueue = v11;
  }
  else
  {
    v14 = (OS_dispatch_queue *)v5;
    actualDispatchQueue = v9->_actualDispatchQueue;
    v9->_actualDispatchQueue = v14;
  }

  +[ISPlayerSettings sharedInstance](ISPlayerSettings, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = v9;
  v19.super_class = (Class)ISAVPlayer;
  -[ISAVPlayer setUsesDedicatedNotificationQueueForMediaServices:](&v19, sel_setUsesDedicatedNotificationQueueForMediaServices_, objc_msgSend(v15, "useDedicatedQueues"));

  if (CFPreferencesGetAppBooleanValue(CFSTR("PhotosPlayer.enablePixelBufferPoolSharing"), CFSTR("com.apple.mobileslideshow"), 0))
  {
    v16 = 1;
  }
  else
  {
    v16 = v6;
  }
  if (v16 == 1)
  {
    v18.receiver = v9;
    v18.super_class = (Class)ISAVPlayer;
    -[ISAVPlayer setAllowsPixelBufferPoolSharing:](&v18, sel_setAllowsPixelBufferPoolSharing_, 1);
  }
  -[ISAVPlayer setClosedCaptionDisplayEnabled:](v9, "setClosedCaptionDisplayEnabled:", 0);
LABEL_16:

  return v9;
}

- (void)setUsesDedicatedNotificationQueueForMediaServices:(BOOL)a3
{
  objc_msgSend((id)objc_opt_class(), "isAppleInternal");
}

- (void)setAllowsPixelBufferPoolSharing:(BOOL)a3
{
  objc_msgSend((id)objc_opt_class(), "isAppleInternal");
}

- (id)dispatchQueue
{
  return self->_initializedDispatchQueue;
}

- (void)setRate:(float)a3
{
  double v5;

  -[ISAVPlayer _cancelRateCurveRequest](self, "_cancelRateCurveRequest");
  *(float *)&v5 = a3;
  -[ISAVPlayer _setRate:](self, "_setRate:", v5);
}

- (void)_setRate:(float)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISAVPlayer;
  -[ISAVPlayer setRate:](&v3, sel_setRate_);
}

- (void)playToTime:(id *)a3 withInitialRate:(float)a4 overDuration:(double)a5 progressHandler:(id)a6
{
  id v10;
  ISRateCurveRequest *v11;
  double v12;
  ISRateCurveRequest *v13;
  ISRateCurveRequest *currentRequest;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;

  v10 = a6;
  -[ISAVPlayer _cancelRateCurveRequest](self, "_cancelRateCurveRequest");
  v11 = [ISRateCurveRequest alloc];
  v15 = *a3;
  *(float *)&v12 = a4;
  v13 = -[ISRateCurveRequest initWithTargetTime:duration:initialRate:avPlayer:progressHandler:](v11, "initWithTargetTime:duration:initialRate:avPlayer:progressHandler:", &v15, self, v10, a5, v12);

  currentRequest = self->_currentRequest;
  self->_currentRequest = v13;

  -[ISRateCurveRequest start](self->_currentRequest, "start");
}

- (void)_cancelRateCurveRequest
{
  ISRateCurveRequest *currentRequest;

  -[ISRateCurveRequest cancel](self->_currentRequest, "cancel");
  currentRequest = self->_currentRequest;
  self->_currentRequest = 0;

}

- (OS_dispatch_queue)actualDispatchQueue
{
  return self->_actualDispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualDispatchQueue, 0);
  objc_storeStrong((id *)&self->_initializedDispatchQueue, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
}

+ (BOOL)isAppleInternal
{
  if (isAppleInternal_onceToken != -1)
    dispatch_once(&isAppleInternal_onceToken, &__block_literal_global);
  return isAppleInternal_isAppleInternal;
}

+ (BOOL)isSpringBoard
{
  if (isSpringBoard_onceToken != -1)
    dispatch_once(&isSpringBoard_onceToken, &__block_literal_global_2);
  return isSpringBoard_isSpringBoard;
}

void __27__ISAVPlayer_isSpringBoard__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "processName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  isSpringBoard_isSpringBoard = objc_msgSend(v0, "isEqualToString:", CFSTR("SpringBoard"));

}

uint64_t __29__ISAVPlayer_isAppleInternal__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  isAppleInternal_isAppleInternal = result;
  return result;
}

@end

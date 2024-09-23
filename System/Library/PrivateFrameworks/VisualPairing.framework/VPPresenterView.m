@implementation VPPresenterView

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VPPresenterView;
  -[VPPresenterView layoutSubviews](&v3, sel_layoutSubviews);
  if (self->_watermarkLayer)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    -[VPPresenterView bounds](self, "bounds");
    -[CALayer setFrame:](self->_watermarkLayer, "setFrame:");
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
}

- (void)setVerificationCode:(id)a3
{
  NSString *v4;
  NSString *verificationCode;
  NSString *v6;
  NSArray *watermarkPixelBuffers;

  v4 = (NSString *)a3;
  if (gLogCategory_PV <= 30 && (gLogCategory_PV != -1 || _LogCategory_Initialize()))
  {
    IsAppleInternalBuild();
    LogPrintF();
  }
  verificationCode = self->_verificationCode;
  self->_verificationCode = v4;
  v6 = v4;

  watermarkPixelBuffers = self->_watermarkPixelBuffers;
  self->_watermarkPixelBuffers = 0;

  if (self->_started)
    -[VPPresenterView start](self, "start");
}

- (void)start
{
  CALayer *v3;
  CALayer *watermarkLayer;
  void *v5;
  AVPlayer *v6;
  AVPlayer *moviePlayer;
  NSObject *v8;
  OS_dispatch_source *v9;
  OS_dispatch_source *watermarkStepTimer;
  NSObject *v11;
  char *v12;
  double v13;
  unint64_t v14;
  double v15;
  NSArray *v16;
  NSArray *watermarkPixelBuffers;
  _QWORD handler[5];
  int v19;

  if (gLogCategory_PV <= 30 && (gLogCategory_PV != -1 || _LogCategory_Initialize()))
    LogPrintF();
  self->_started = 1;
  if (-[NSString length](self->_verificationCode, "length"))
  {
    v19 = 0;
    if (self->_watermarkPixelBuffers)
      goto LABEL_22;
    v12 = -[NSString UTF8String](self->_verificationCode, "UTF8String");
    -[VPPresenterView bounds](self, "bounds");
    v14 = (unint64_t)v13;
    -[VPPresenterView bounds](self, "bounds");
    v16 = (NSArray *)VPCreateWatermarkPixelBuffers(v12, 0xFFFFFFFFFFFFFFFFLL, v14, (unint64_t)v15, (__CFArray *)0x20, &v19, 0.95);
    watermarkPixelBuffers = self->_watermarkPixelBuffers;
    self->_watermarkPixelBuffers = v16;

    if (!v19)
    {
LABEL_22:
      if (!self->_watermarkLayer)
      {
        objc_msgSend(MEMORY[0x24BDE56D0], "layer");
        v3 = (CALayer *)objc_claimAutoreleasedReturnValue();
        watermarkLayer = self->_watermarkLayer;
        self->_watermarkLayer = v3;

        -[CALayer setContentsDither:](self->_watermarkLayer, "setContentsDither:", 0);
        -[VPPresenterView bounds](self, "bounds");
        -[CALayer setFrame:](self->_watermarkLayer, "setFrame:");
        -[VPPresenterView layer](self, "layer");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addSublayer:", self->_watermarkLayer);

      }
      if (!self->_moviePlayer)
      {
        v6 = (AVPlayer *)objc_alloc_init(MEMORY[0x24BDB2610]);
        moviePlayer = self->_moviePlayer;
        self->_moviePlayer = v6;

      }
      if (!self->_watermarkStepTimer)
      {
        self->_watermarkStepIndex = 0;
        CUMainQueue();
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v8);
        watermarkStepTimer = self->_watermarkStepTimer;
        self->_watermarkStepTimer = v9;

        v11 = self->_watermarkStepTimer;
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = __24__VPPresenterView_start__block_invoke;
        handler[3] = &unk_24E04D040;
        handler[4] = self;
        dispatch_source_set_event_handler(v11, handler);
        CUDispatchTimerSet();
        dispatch_resume((dispatch_object_t)self->_watermarkStepTimer);
      }
    }
    else if (gLogCategory_PV <= 60 && (gLogCategory_PV != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __24__VPPresenterView_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_watermarkStep");
}

- (void)stop
{
  AVPlayer *moviePlayer;
  AVPlayer *v4;
  OS_dispatch_source *watermarkStepTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  CALayer *watermarkLayer;
  CALayer *v9;
  NSArray *watermarkPixelBuffers;

  if (self->_started && gLogCategory_PV <= 30 && (gLogCategory_PV != -1 || _LogCategory_Initialize()))
    LogPrintF();
  self->_started = 0;
  moviePlayer = self->_moviePlayer;
  if (moviePlayer)
  {
    -[AVPlayer pause](moviePlayer, "pause");
    v4 = self->_moviePlayer;
    self->_moviePlayer = 0;

  }
  watermarkStepTimer = self->_watermarkStepTimer;
  if (watermarkStepTimer)
  {
    v6 = watermarkStepTimer;
    dispatch_source_cancel(v6);
    v7 = self->_watermarkStepTimer;
    self->_watermarkStepTimer = 0;

  }
  watermarkLayer = self->_watermarkLayer;
  if (watermarkLayer)
  {
    -[CALayer removeFromSuperlayer](watermarkLayer, "removeFromSuperlayer");
    v9 = self->_watermarkLayer;
    self->_watermarkLayer = 0;

  }
  watermarkPixelBuffers = self->_watermarkPixelBuffers;
  self->_watermarkPixelBuffers = 0;

}

- (void)_watermarkStep
{
  unint64_t watermarkStepIndex;
  void *v4;
  void *v5;

  watermarkStepIndex = self->_watermarkStepIndex;
  self->_watermarkStepIndex = watermarkStepIndex + 1;
  -[NSArray objectAtIndexedSubscript:](self->_watermarkPixelBuffers, "objectAtIndexedSubscript:", watermarkStepIndex % -[NSArray count](self->_watermarkPixelBuffers, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[CALayer setContents:](self->_watermarkLayer, "setContents:", v4);
  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALayer setCompositingFilter:](self->_watermarkLayer, "setCompositingFilter:", v5);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationCode, 0);
  objc_storeStrong((id *)&self->_watermarkStepTimer, 0);
  objc_storeStrong((id *)&self->_watermarkPixelBuffers, 0);
  objc_storeStrong((id *)&self->_watermarkLayer, 0);
  objc_storeStrong((id *)&self->_moviePlayer, 0);
}

@end

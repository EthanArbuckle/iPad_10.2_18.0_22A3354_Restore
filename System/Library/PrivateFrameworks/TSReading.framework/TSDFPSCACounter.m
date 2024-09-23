@implementation TSDFPSCACounter

- (void)reset
{
  objc_super v3;

  -[TSDFPSCACounter stopLoggingFPS](self, "stopLoggingFPS");
  self->mCAFrameCount = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSDFPSCACounter;
  -[TSDFPSCounter reset](&v3, sel_reset);
}

- (void)p_updateFrameCount
{
  if (p_updateFrameCount_onceToken != -1)
    dispatch_once(&p_updateFrameCount_onceToken, &__block_literal_global_48);
  if (self->mCAFrameCount)
    -[TSDFPSCounter addFrame](self, "addFrame");
  self->mCAFrameCount = 0;
}

uint64_t __37__TSDFPSCACounter_p_updateFrameCount__block_invoke()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v1 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFPSCACounter p_updateFrameCount]_block_invoke");
  return objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFPSCounter.m"), 310, CFSTR("To log CA framerates, you need to set \"CARENDERSERVERGETFRAMECOUNTER_SPI_ALLOWED\" to 1! (This message will only be shown once.)"));
}

- (void)startLoggingFPS
{
  -[TSDFPSCACounter reset](self, "reset");
  self->mTimer = (NSTimer *)objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_p_updateFrameCount, 0, 1, 0.00555555556);
}

- (void)stopLoggingFPS
{
  -[NSTimer invalidate](self->mTimer, "invalidate");
  self->mTimer = 0;
}

@end

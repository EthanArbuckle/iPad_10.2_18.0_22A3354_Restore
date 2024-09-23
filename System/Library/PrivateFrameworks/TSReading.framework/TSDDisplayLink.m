@implementation TSDDisplayLink

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDDisplayLink;
  -[TSDDisplayLink dealloc](&v3, sel_dealloc);
}

- (void)start
{
  void *v3;
  uint64_t v4;
  CADisplayLink *v5;
  uint64_t v6;
  double v7;

  if (self->_displayLink)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDisplayLink start]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDisplayLink.m"), 43, CFSTR("expected nil value for '%s'"), "_displayLink");
  }
  v5 = (CADisplayLink *)objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", self, sel_p_handleDisplayLink_);
  self->_displayLink = v5;
  v6 = objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v6, *MEMORY[0x24BDBCA90]);
  v7 = CACurrentMediaTime();
  self->_startTime = v7;
  self->_lastTime = v7;
}

- (void)teardown
{
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  self->_displayLink = 0;
}

- (void)p_handleDisplayLink:(id)a3
{
  double v5;
  double v6;
  void (**completionBlock)(void);

  objc_msgSend(a3, "timestamp");
  v6 = v5;
  if ((*((unsigned int (**)(double, double))self->_tickBlock + 2))(v5 - self->_startTime, v5 - self->_lastTime))
  {
    completionBlock = (void (**)(void))self->_completionBlock;
    if (completionBlock)
      completionBlock[2]();
    objc_msgSend(a3, "invalidate");
    self->_displayLink = 0;
  }
  self->_lastTime = v6;
}

- (id)tickBlock
{
  return self->_tickBlock;
}

- (void)setTickBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)lastTime
{
  return self->_lastTime;
}

- (void)setLastTime:(double)a3
{
  self->_lastTime = a3;
}

@end

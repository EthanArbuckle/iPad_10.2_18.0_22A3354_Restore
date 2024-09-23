@implementation BKMousePointerAnimation

- (BKMousePointerAnimation)initWithRelativeTranslation:(CGPoint)a3 destinationPoint:(CGPoint)a4 animationDriver:(id)a5 updateRate:(int64_t)a6 applierBlock:(id)a7 completionBlock:(id)a8
{
  CGFloat y;
  CGFloat x;
  CGFloat v14;
  CGFloat v15;
  id v17;
  id v18;
  id v19;
  BKMousePointerAnimation *v20;
  BKMousePointerAnimation *v21;
  id v22;
  id applierBlock;
  id v24;
  id completionBlock;
  objc_super v27;

  y = a4.y;
  x = a4.x;
  v14 = a3.y;
  v15 = a3.x;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v27.receiver = self;
  v27.super_class = (Class)BKMousePointerAnimation;
  v20 = -[BKMousePointerAnimation init](&v27, "init");
  v21 = v20;
  if (v20)
  {
    v20->_initialTimestamp = 0.0;
    v20->_lastSentOriginRelativeOffset = CGPointZero;
    v20->_relativeTranslation.x = v15;
    v20->_relativeTranslation.y = v14;
    v20->_destinationPoint.x = x;
    v20->_destinationPoint.y = y;
    objc_storeStrong((id *)&v20->_animationDriver, a5);
    v21->_targetFPS = a6;
    v22 = objc_msgSend(v18, "copy");
    applierBlock = v21->_applierBlock;
    v21->_applierBlock = v22;

    v24 = objc_msgSend(v19, "copy");
    completionBlock = v21->_completionBlock;
    v21->_completionBlock = v24;

  }
  return v21;
}

- (void)displayLinkFired:(id)a3
{
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  uint64_t (**applierBlock)(void);
  CADisplayLink *displayLink;
  id v10;
  id completionBlock;
  id v12;

  objc_msgSend(a3, "timestamp");
  -[BKMousePointerAnimationDriver applyForTime:](self->_animationDriver, "applyForTime:", v4 - self->_initialTimestamp);
  -[BKMousePointerAnimationDriver currentTranslation](self->_animationDriver, "currentTranslation");
  v7 = self->_lastSentOriginRelativeOffset.y + v6 - self->_lastSentOriginRelativeOffset.y;
  self->_lastSentOriginRelativeOffset.x = self->_lastSentOriginRelativeOffset.x
                                        + v5
                                        - self->_lastSentOriginRelativeOffset.x;
  self->_lastSentOriginRelativeOffset.y = v7;
  applierBlock = (uint64_t (**)(void))self->_applierBlock;
  if (applierBlock && (applierBlock[2]() & 1) == 0)
    -[BKMousePointerAnimation stop](self, "stop");
  if (-[BKMousePointerAnimation isComplete](self, "isComplete"))
  {
    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    displayLink = self->_displayLink;
    self->_displayLink = 0;

    v10 = objc_retainBlock(self->_completionBlock);
    if (v10)
    {
      v12 = v10;
      (*((void (**)(id, uint64_t, BKMousePointerAnimation *))v10 + 2))(v10, 1, self);
      completionBlock = self->_completionBlock;
      self->_completionBlock = 0;

      v10 = v12;
    }

  }
}

- (void)start
{
  CADisplayLink *v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  id v6;

  self->_initialTimestamp = CACurrentMediaTime();
  if (self->_targetFPS >= 1)
  {
    v3 = (CADisplayLink *)objc_claimAutoreleasedReturnValue(+[CADisplayLink displayLinkWithTarget:selector:](CADisplayLink, "displayLinkWithTarget:selector:", self, "displayLinkFired:"));
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", self->_targetFPS);
    v5 = self->_displayLink;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v6, NSRunLoopCommonModes);

  }
}

- (void)stop
{
  CADisplayLink *displayLink;
  id v4;
  id completionBlock;
  id v6;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  v4 = objc_retainBlock(self->_completionBlock);
  if (v4)
  {
    v6 = v4;
    (*((void (**)(id, _QWORD, BKMousePointerAnimation *))v4 + 2))(v4, 0, self);
    completionBlock = self->_completionBlock;
    self->_completionBlock = 0;

    v4 = v6;
  }

}

- (BOOL)isComplete
{
  return -[BKMousePointerAnimationDriver isComplete](self->_animationDriver, "isComplete")
      || CACurrentMediaTime() - self->_initialTimestamp > 5.0;
}

- (CGPoint)destinationPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_destinationPoint.x;
  y = self->_destinationPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_applierBlock, 0);
  objc_storeStrong((id *)&self->_animationDriver, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end

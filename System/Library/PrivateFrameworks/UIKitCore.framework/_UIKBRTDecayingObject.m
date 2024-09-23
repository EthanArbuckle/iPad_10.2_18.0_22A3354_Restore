@implementation _UIKBRTDecayingObject

- (_UIKBRTDecayingObject)initWithTimeoutDuration:(double)a3
{
  _UIKBRTDecayingObject *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIKBRTDecayingObject;
  result = -[_UIKBRTDecayingObject init](&v5, sel_init);
  if (result)
    result->_timeoutDuration = a3;
  return result;
}

- (void)startDecaying
{
  if (self->_isHolding)
  {
    *(_WORD *)&self->_isDecaying = 1;
    self->_lastUpdate = CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
  }
}

- (BOOL)isActive
{
  return self->_isHolding || self->_isDecaying;
}

- (void)resetDecayTo:(double)a3
{
  if (CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff - a3 >= self->_timeoutDuration)
  {
    -[_UIKBRTDecayingObject reset](self, "reset");
  }
  else
  {
    self->_lastUpdate = a3;
    *(_WORD *)&self->_isDecaying = 256;
  }
}

- (void)reset
{
  *(_WORD *)&self->_isDecaying = 0;
  self->_lastUpdate = 0.0;
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_resetBlocks, "enumerateObjectsUsingBlock:", &__block_literal_global_238_0);
}

- (void)updateDecay
{
  if (self->_isDecaying
    && CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff - self->_lastUpdate >= self->_timeoutDuration)
  {
    -[_UIKBRTDecayingObject reset](self, "reset");
  }
}

- (void)startOrUpdateDecay
{
  if (self->_isHolding)
  {
    -[_UIKBRTDecayingObject startDecaying](self, "startDecaying");
  }
  else if (self->_isDecaying)
  {
    -[_UIKBRTDecayingObject updateDecay](self, "updateDecay");
  }
}

- (void)resetActiveDecayTo:(double)a3
{
  if (self->_isHolding || self->_isDecaying)
    -[_UIKBRTDecayingObject resetDecayTo:](self, "resetDecayTo:", a3);
}

- (void)onResetDo:(id)a3
{
  _UIKBRTDecayingObject *v4;
  NSMutableArray *v5;
  NSMutableArray *resetBlocks;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (!v4->_resetBlocks)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    resetBlocks = v4->_resetBlocks;
    v4->_resetBlocks = v5;

  }
  objc_sync_exit(v4);

  v7 = v4->_resetBlocks;
  v8 = (void *)objc_msgSend(v10, "copy");
  v9 = _Block_copy(v8);
  -[NSMutableArray addObject:](v7, "addObject:", v9);

}

- (double)lastUpdate
{
  return self->_lastUpdate;
}

- (double)timeoutDuration
{
  return self->_timeoutDuration;
}

- (void)setTimeoutDuration:(double)a3
{
  self->_timeoutDuration = a3;
}

- (BOOL)isDecaying
{
  return self->_isDecaying;
}

- (BOOL)isHolding
{
  return self->_isHolding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetBlocks, 0);
}

@end

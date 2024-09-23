@implementation VFXClock

- (VFXClock)init
{
  VFXClock *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXClock;
  result = -[VFXClock init](&v3, sel_init);
  if (result)
  {
    result->_speed = 1.0;
    result->_replayLoopRange.begin = 0.0;
    result->_replayLoopRange.end = 0.0;
  }
  return result;
}

- (void)dealloc
{
  __CFXWorld *world;
  objc_super v4;

  world = self->_world;
  if (world)
  {
    CFRelease(world);
    self->_world = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VFXClock;
  -[VFXClock dealloc](&v4, sel_dealloc);
}

- (void)_updateVFXCoreSpeedFactor
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = sub_1B187A9C4((uint64_t)self->_world, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (v8)
    MEMORY[0x1E0DE7D20](v8, sel_setSpeedFactor_, v9, v10);
}

- (void)_updateVFXCorePause
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  const char *v10;
  uint64_t v11;

  v9 = (void *)sub_1B187A9C4((uint64_t)self->_world, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (v9)
    objc_msgSend_setPaused_(v9, v10, self->_paused, v11);
}

- (void)_updateVFXCoreTime:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;

  v10 = (void *)sub_1B187A9C4((uint64_t)self->_world, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
  if (v10)
  {
    *(float *)&v14 = a3;
    objc_msgSend_setTime_(v10, v11, v12, v13, v14);
  }
}

- (void)setSpeed:(float)a3
{
  if (self->_speed != a3)
  {
    self->_speed = a3;
    ((void (*)(VFXClock *, char *))MEMORY[0x1E0DE7D20])(self, sel__updateVFXCoreSpeedFactor);
  }
}

- (float)speed
{
  return self->_speed;
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    if (a3)
      self->_wasPaused = 1;
    ((void (*)(VFXClock *, char *, BOOL))MEMORY[0x1E0DE7D20])(self, sel__updateVFXCorePause, a3);
  }
}

- (void)updateWithAbsoluteTime:(double)a3
{
  double lastUpdateTime;

  if (self->_replayLoopRange.end == self->_replayLoopRange.begin)
  {
    lastUpdateTime = self->_lastUpdateTime;
    if (lastUpdateTime < a3)
    {
      if (lastUpdateTime == 0.0)
        lastUpdateTime = a3;
      if (self->_paused)
      {
        self->_wasPaused = 1;
      }
      else if (self->_wasPaused)
      {
        self->_wasPaused = 0;
      }
      else
      {
        self->_time = self->_time + (a3 - lastUpdateTime) * self->_speed;
      }
      self->_lastUpdateTime = a3;
    }
  }
  else
  {
    ((void (*)(VFXClock *, char *))MEMORY[0x1E0DE7D20])(self, sel__updateWithAbsoluteTime_usingLoopRange_);
  }
}

- (void)_updateWithAbsoluteTime:(double)a3 usingLoopRange:(VFXClockTimeRange)a4
{
  double begin;
  double time;
  BOOL paused;
  double end;
  double v10;
  double v11;

  begin = a4.begin;
  time = self->_time;
  if (time <= a4.end)
  {
    if (self->_paused)
    {
      self->_wasPaused = 1;
    }
    else if (self->_wasPaused)
    {
      self->_wasPaused = 0;
    }
    else
    {
      v10 = self->_replayLoopRange.begin;
      end = self->_replayLoopRange.end;
      v11 = time + (a3 - self->_lastUpdateTime) * self->_speed;
      self->_time = v11;
      if (v11 <= a4.end)
      {
        if (v11 < begin)
          self->_time = begin;
      }
      else
      {
        self->_time = begin + fmod(v11 - begin, end - v10);
      }
    }
    self->_lastUpdateTime = a3;
  }
  else
  {
    paused = self->_paused;
    if (!paused)
    {
      self->_time = a4.begin;
      self->_lastUpdateTime = a3;
    }
    self->_wasPaused = paused;
  }
}

- (void)setWorld:(__CFXWorld *)a3
{
  __CFXWorld *world;
  __CFXWorld *v6;

  world = self->_world;
  if (world != a3)
  {
    if (world)
    {
      CFRelease(world);
      self->_world = 0;
    }
    if (a3)
      v6 = (__CFXWorld *)CFRetain(a3);
    else
      v6 = 0;
    self->_world = v6;
  }
}

- (void)setTime:(double)a3
{
  __CFXWorld *world;
  _QWORD v4[6];

  self->_time = a3;
  world = self->_world;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1B17EF774;
  v4[3] = &unk_1E63D5440;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, (uint64_t)world, 0, v4);
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (double)time
{
  return self->_time;
}

- (VFXClockTimeRange)replayLoopRange
{
  double begin;
  double end;
  VFXClockTimeRange result;

  begin = self->_replayLoopRange.begin;
  end = self->_replayLoopRange.end;
  result.end = end;
  result.begin = begin;
  return result;
}

- (void)setReplayLoopRange:(VFXClockTimeRange)a3
{
  self->_replayLoopRange = a3;
}

@end

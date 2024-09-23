@implementation SignpostAnimationSubInterval

- (unint64_t)endMachContinuousTime
{
  return self->_endMachContinuousTime;
}

- (unint64_t)startMachContinuousTime
{
  return self->_startMachContinuousTime;
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3;

  v3 = -[SignpostAnimationSubInterval endMachContinuousTime](self, "endMachContinuousTime");
  return v3 - -[SignpostAnimationSubInterval startMachContinuousTime](self, "startMachContinuousTime");
}

- (SignpostAnimationSubInterval)initWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4 timebaseRatio:(double)a5
{
  SignpostAnimationSubInterval *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SignpostAnimationSubInterval *v14;
  SignpostAnimationSubInterval *v18;
  objc_super v20;

  v5 = self;
  if (a3 <= a4)
  {
    v20.receiver = self;
    v20.super_class = (Class)SignpostAnimationSubInterval;
    v18 = -[SignpostAnimationSubInterval init](&v20, sel_init);
    if (v18)
    {
      v18->_startMachContinuousTime = a3;
      v18->_endMachContinuousTime = a4;
      v18->_timebaseRatio = a5;
    }
    v5 = v18;
    v14 = v5;
  }
  else
  {
    _signpost_debug_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[SignpostAnimationSubInterval initWithStartMCT:endMCT:timebaseRatio:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    v14 = 0;
  }

  return v14;
}

- (SignpostAnimationSubInterval)initWithInterval:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "startMachContinuousTime");
  v6 = objc_msgSend(v4, "endMachContinuousTime");
  objc_msgSend(v4, "timebaseRatio");
  v8 = v7;

  return -[SignpostAnimationSubInterval initWithStartMCT:endMCT:timebaseRatio:](self, "initWithStartMCT:endMCT:timebaseRatio:", v5, v6, v8);
}

- (double)startSeconds
{
  return (double)-[SignpostAnimationSubInterval startNanoseconds](self, "startNanoseconds") / 1000000000.0;
}

- (double)endSeconds
{
  return (double)-[SignpostAnimationSubInterval endNanoseconds](self, "endNanoseconds") / 1000000000.0;
}

- (float)durationSeconds
{
  return (double)-[SignpostAnimationSubInterval durationNanoseconds](self, "durationNanoseconds") / 1000000000.0;
}

- (unint64_t)durationNanoseconds
{
  double v3;
  double v4;

  v3 = (double)-[SignpostAnimationSubInterval durationMachContinuousTime](self, "durationMachContinuousTime");
  -[SignpostAnimationSubInterval timebaseRatio](self, "timebaseRatio");
  return (unint64_t)(v4 * v3);
}

- (unint64_t)endNanoseconds
{
  double v3;
  double v4;

  v3 = (double)-[SignpostAnimationSubInterval endMachContinuousTime](self, "endMachContinuousTime");
  -[SignpostAnimationSubInterval timebaseRatio](self, "timebaseRatio");
  return (unint64_t)(v4 * v3);
}

- (unint64_t)startNanoseconds
{
  double v3;
  double v4;

  v3 = (double)-[SignpostAnimationSubInterval startMachContinuousTime](self, "startMachContinuousTime");
  -[SignpostAnimationSubInterval timebaseRatio](self, "timebaseRatio");
  return (unint64_t)(v4 * v3);
}

- (double)startMs
{
  return (double)-[SignpostAnimationSubInterval startNanoseconds](self, "startNanoseconds") / 1000000.0;
}

- (double)endMs
{
  return (double)-[SignpostAnimationSubInterval endNanoseconds](self, "endNanoseconds") / 1000000.0;
}

- (double)durationMs
{
  return (double)-[SignpostAnimationSubInterval durationNanoseconds](self, "durationNanoseconds") / 1000000.0;
}

- (BOOL)isEqual:(id)a3
{
  SignpostAnimationSubInterval *v4;
  SignpostAnimationSubInterval *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (SignpostAnimationSubInterval *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[SignpostAnimationSubInterval startMachContinuousTime](v5, "startMachContinuousTime");
      if (v6 == -[SignpostAnimationSubInterval startMachContinuousTime](self, "startMachContinuousTime"))
      {
        v7 = -[SignpostAnimationSubInterval durationMachContinuousTime](v5, "durationMachContinuousTime");
        v8 = v7 == -[SignpostAnimationSubInterval durationMachContinuousTime](self, "durationMachContinuousTime");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[SignpostAnimationSubInterval durationMachContinuousTime](self, "durationMachContinuousTime");
  v4 = -[SignpostAnimationSubInterval startMachContinuousTime](self, "startMachContinuousTime");
  if (v3)
    v4 ^= -[SignpostAnimationSubInterval endMachContinuousTime](self, "endMachContinuousTime");
  return v4;
}

- (double)timebaseRatio
{
  return self->_timebaseRatio;
}

- (void)initWithStartMCT:(uint64_t)a3 endMCT:(uint64_t)a4 timebaseRatio:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1A1A28000, a1, a3, "Tried to create sub-interval with end time before start time", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

@end

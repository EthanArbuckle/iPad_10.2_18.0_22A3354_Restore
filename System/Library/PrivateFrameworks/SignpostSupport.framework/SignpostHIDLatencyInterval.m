@implementation SignpostHIDLatencyInterval

- (SignpostHIDLatencyInterval)initWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4 timebaseRatio:(double)a5 swapID:(unsigned int)a6 frameSeed:(unsigned int)a7
{
  SignpostHIDLatencyInterval *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SignpostHIDLatencyInterval;
  result = -[SignpostAnimationSubInterval initWithStartMCT:endMCT:timebaseRatio:](&v10, sel_initWithStartMCT_endMCT_timebaseRatio_, a3, a4, a5);
  if (result)
  {
    result->_swapId = a6;
    result->_frameSeed = a7;
  }
  return result;
}

- (unsigned)frameSeed
{
  return self->_frameSeed;
}

- (SignpostHIDLatencyInterval)initWithHIDLatencyInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  SignpostHIDLatencyInterval *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  objc_msgSend(v4, "beginEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_numberArgumentWithName:", CFSTR("frame_seed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "unsignedLongLongValue");
    v8 = objc_msgSend(v4, "startMachContinuousTime");
    v9 = objc_msgSend(v4, "endMachContinuousTime");
    objc_msgSend(v4, "timebaseRatio");
    self = -[SignpostHIDLatencyInterval initWithStartMCT:endMCT:timebaseRatio:swapID:frameSeed:](self, "initWithStartMCT:endMCT:timebaseRatio:swapID:frameSeed:", v8, v9, objc_msgSend(v4, "signpostId"), v7, v10);
    v11 = self;
  }
  else
  {
    _signpost_debug_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[SignpostHIDLatencyInterval initWithHIDLatencyInterval:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    v11 = 0;
  }

  return v11;
}

- (unsigned)swapId
{
  return self->_swapId;
}

- (void)initWithHIDLatencyInterval:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "Could not find frame_seed in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end

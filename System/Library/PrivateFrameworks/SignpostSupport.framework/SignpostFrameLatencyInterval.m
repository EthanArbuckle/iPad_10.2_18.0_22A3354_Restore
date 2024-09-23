@implementation SignpostFrameLatencyInterval

- (SignpostFrameLatencyInterval)initWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4 timebaseRatio:(double)a5 swapID:(unsigned int)a6 frameSeed:(unsigned int)a7 totalFrameCount:(unint64_t)a8 lateFrameCount:(unint64_t)a9
{
  SignpostFrameLatencyInterval *result;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SignpostFrameLatencyInterval;
  result = -[SignpostAnimationSubInterval initWithStartMCT:endMCT:timebaseRatio:](&v14, sel_initWithStartMCT_endMCT_timebaseRatio_, a3, a4, a5);
  if (result)
  {
    result->_swapId = a6;
    result->_frameSeed = a7;
    result->_totalFrameCount = a8;
    result->_lateFrameCount = a9;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contributingPids, 0);
}

- (NSSet)contributingPids
{
  return self->_contributingPids;
}

- (unsigned)frameSeed
{
  return self->_frameSeed;
}

- (SignpostFrameLatencyInterval)initWithFrameLatencyInterval:(id)a3 isLong:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  SignpostFrameLatencyInterval *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  SignpostFrameLatencyInterval *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  objc_super v45;

  v4 = a4;
  v6 = a3;
  v45.receiver = self;
  v45.super_class = (Class)SignpostFrameLatencyInterval;
  v7 = -[SignpostAnimationSubInterval initWithInterval:](&v45, sel_initWithInterval_, v6);
  v8 = objc_msgSend(v6, "signpostId");
  objc_msgSend(v6, "beginEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_numberArgumentWithName:", CFSTR("frame_seed"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    _signpost_debug_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[SignpostFrameLatencyInterval initWithFrameLatencyInterval:isLong:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_12;
  }
  v11 = objc_msgSend(v10, "unsignedLongLongValue");
  if (!v4)
  {
    v14 = 0;
    v17 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v6, "beginEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_numberArgumentWithName:", CFSTR("frame_count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    _signpost_debug_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[SignpostFrameLatencyInterval initWithFrameLatencyInterval:isLong:].cold.2(v18, v29, v30, v31, v32, v33, v34, v35);
LABEL_12:

LABEL_13:
    v28 = 0;
    goto LABEL_14;
  }
  v14 = objc_msgSend(v13, "unsignedLongLongValue");
  objc_msgSend(v6, "beginEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_numberArgumentWithName:", CFSTR("late_frame_count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    _signpost_debug_log();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      -[SignpostFrameLatencyInterval initWithFrameLatencyInterval:isLong:].cold.3(v37, v38, v39, v40, v41, v42, v43, v44);

    goto LABEL_13;
  }
  v17 = objc_msgSend(v16, "unsignedLongLongValue");

LABEL_9:
  v26 = objc_msgSend(v6, "startMachContinuousTime");
  v27 = objc_msgSend(v6, "endMachContinuousTime");
  objc_msgSend(v6, "timebaseRatio");
  v7 = -[SignpostFrameLatencyInterval initWithStartMCT:endMCT:timebaseRatio:swapID:frameSeed:totalFrameCount:lateFrameCount:](v7, "initWithStartMCT:endMCT:timebaseRatio:swapID:frameSeed:totalFrameCount:lateFrameCount:", v26, v27, v8, v11, v14, v17);
  v28 = v7;
LABEL_14:

  return v28;
}

- (unsigned)swapId
{
  return self->_swapId;
}

- (unint64_t)totalFrameCount
{
  return self->_totalFrameCount;
}

- (unint64_t)lateFrameCount
{
  return self->_lateFrameCount;
}

- (void)setContributingPids:(id)a3
{
  objc_storeStrong((id *)&self->_contributingPids, a3);
}

- (void)initWithFrameLatencyInterval:(uint64_t)a3 isLong:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "Could not find frame_seed in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithFrameLatencyInterval:(uint64_t)a3 isLong:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "Could not find frame_count in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithFrameLatencyInterval:(uint64_t)a3 isLong:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "Could not find late_frame_count in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end

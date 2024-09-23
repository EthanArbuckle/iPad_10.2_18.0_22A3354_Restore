@implementation SignpostImageQueueSampleEvent

- (SignpostImageQueueSampleEvent)initWithImageQueueSampleEvent:(id)a3
{
  id v4;
  SignpostImageQueueSampleEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SignpostImageQueueSampleEvent *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)SignpostImageQueueSampleEvent;
  v5 = -[SignpostImageQueueSampleEvent init](&v45, sel_init);
  if (!v5)
    goto LABEL_7;
  v5->_queueID = objc_msgSend(v4, "signpostId");
  objc_msgSend(v4, "_numberArgumentWithName:", CFSTR("surfaceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    _signpost_debug_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[SignpostImageQueueSampleEvent initWithImageQueueSampleEvent:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_16;
  }
  v7 = v6;
  v5->_surfaceID = objc_msgSend(v6, "unsignedLongLongValue");

  objc_msgSend(v4, "_numberArgumentWithName:", CFSTR("serverSamplingTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    _signpost_debug_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[SignpostImageQueueSampleEvent initWithImageQueueSampleEvent:].cold.2(v15, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_16;
  }
  v9 = v8;
  v5->_serverSamplingTime = (double)(unint64_t)objc_msgSend(v8, "unsignedLongLongValue");

  objc_msgSend(v4, "_numberArgumentWithName:", CFSTR("queueGeneration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    _signpost_debug_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[SignpostImageQueueSampleEvent initWithImageQueueSampleEvent:].cold.3(v15, v30, v31, v32, v33, v34, v35, v36);
    goto LABEL_16;
  }
  v11 = v10;
  v5->_queueGeneration = objc_msgSend(v10, "unsignedLongLongValue");

  objc_msgSend(v4, "_numberArgumentWithName:", CFSTR("updateSeed"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    _signpost_debug_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[SignpostImageQueueSampleEvent initWithImageQueueSampleEvent:].cold.4(v15, v37, v38, v39, v40, v41, v42, v43);
LABEL_16:

    v14 = 0;
    goto LABEL_17;
  }
  v13 = v12;
  v5->_frameSeed = objc_msgSend(v12, "unsignedLongLongValue");

LABEL_7:
  v14 = v5;
LABEL_17:

  return v14;
}

- (unsigned)queueID
{
  return self->_queueID;
}

- (unsigned)surfaceID
{
  return self->_surfaceID;
}

- (double)serverSamplingTime
{
  return self->_serverSamplingTime;
}

- (unsigned)queueGeneration
{
  return self->_queueGeneration;
}

- (unsigned)frameSeed
{
  return self->_frameSeed;
}

- (void)initWithImageQueueSampleEvent:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "Could not find surfaceID in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithImageQueueSampleEvent:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "Could not find serverSamplingTime in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithImageQueueSampleEvent:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "Could not find queueGeneration in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithImageQueueSampleEvent:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "Could not find updateSeed in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end

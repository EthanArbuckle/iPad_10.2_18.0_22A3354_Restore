@implementation PNTextEmbeddingResultWithThreshold

- (PNTextEmbeddingResultWithThreshold)initWithEmbedding:(id)a3 threshold:(id)a4
{
  id v7;
  id v8;
  PNTextEmbeddingResultWithThreshold *v9;
  PNTextEmbeddingResultWithThreshold *v10;
  os_log_t v11;
  OS_os_log *log;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PNTextEmbeddingResultWithThreshold;
  v9 = -[PNTextEmbeddingResultWithThreshold init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_embedding, a3);
    objc_storeStrong((id *)&v10->_threshold, a4);
    v11 = os_log_create((const char *)*MEMORY[0x24BE72308], "PNTextEmbeddingService");
    log = v10->_log;
    v10->_log = (OS_os_log *)v11;

  }
  return v10;
}

- (id)defaultThresholdForImageSearch
{
  return self->_threshold;
}

- (id)calibratedThresholdForImageSearchWithBaseThreshold:(id)a3
{
  NSObject *log;
  NSObject *v7;
  float v8;
  double v9;
  float v10;
  int v11;
  double v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    v7 = log;
    objc_msgSend(a3, "floatValue");
    v9 = v8;
    -[NSNumber floatValue](self->_threshold, "floatValue");
    v11 = 134218240;
    v12 = v9;
    v13 = 2048;
    v14 = v10;
    _os_log_error_impl(&dword_243C3E000, v7, OS_LOG_TYPE_ERROR, "This version of PNTextEmbeddingService does not receive calibration parameters from MAD, so the given baseThreshold (%f) cannot be calibrated. Returning default threshold (%f)", (uint8_t *)&v11, 0x16u);

  }
  return self->_threshold;
}

- (NSArray)embedding
{
  return self->_embedding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embedding, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_threshold, 0);
}

@end

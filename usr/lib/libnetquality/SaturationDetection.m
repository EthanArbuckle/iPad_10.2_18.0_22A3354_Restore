@implementation SaturationDetection

- (SaturationDetection)initWithConfig:(id)a3
{
  double v3;

  LODWORD(v3) = 1.0;
  return -[SaturationDetection initWithConfig:withScalingFactor:](self, "initWithConfig:withScalingFactor:", a3, v3);
}

- (SaturationDetection)initWithConfig:(id)a3 withScalingFactor:(float)a4
{
  id v7;
  SaturationDetection *v8;
  SaturationDetection *v9;
  MovingAverage *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  MovingAverage *movingAvg;
  MovingAverage *v15;
  double v16;
  unint64_t v17;
  uint64_t v18;
  MovingAverage *instAvg;
  uint64_t v20;
  NSDate *start;
  objc_super v23;

  v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SaturationDetection;
  v8 = -[SaturationDetection init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_config, a3);
    v9->_scalingFactor = a4;
    v10 = [MovingAverage alloc];
    v11 = -[NetworkQualityConfiguration movingAveragePeriod](v9->_config, "movingAveragePeriod");
    *(float *)&v12 = v9->_scalingFactor;
    v13 = -[MovingAverage initWithSize:withScalingFactor:](v10, "initWithSize:withScalingFactor:", v11, v12);
    movingAvg = v9->_movingAvg;
    v9->_movingAvg = (MovingAverage *)v13;

    v15 = [MovingAverage alloc];
    v16 = (double)-[NetworkQualityConfiguration movingAveragePeriod](v9->_config, "movingAveragePeriod") / 0.2;
    v17 = (unint64_t)v16;
    *(float *)&v16 = v9->_scalingFactor;
    v18 = -[MovingAverage initWithSize:withScalingFactor:](v15, "initWithSize:withScalingFactor:", v17, v16);
    instAvg = v9->_instAvg;
    v9->_instAvg = (MovingAverage *)v18;

    v9->_instValues = 0;
    *(_QWORD *)&v9->_currentAverage = 0;
    v9->_saturated = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v20 = objc_claimAutoreleasedReturnValue();
    start = v9->_start;
    v9->_start = (NSDate *)v20;

  }
  return v9;
}

- (BOOL)add:(float)a3
{
  float v4;
  int64_t v5;
  _BOOL4 v6;
  float v7;
  float v8;
  float v9;
  void *v10;
  _BOOL4 v11;
  NSString *name;
  NSObject *v13;
  uint64_t v14;
  float scalingFactor;
  float v16;
  float v17;
  float v18;
  void *v19;
  NSString *v20;
  NSObject *v21;
  uint64_t v22;
  float v23;
  MovingAverage *movingAvg;
  NSString *v25;
  NSObject *v26;
  uint64_t v27;
  float v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  int v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  __int16 v45;
  double v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  -[MovingAverage add:overflow:](self->_instAvg, "add:overflow:", self->_saturated);
  v5 = self->_instValues + 1;
  self->_instValues = v5;
  if (0xCCCCCCCCCCCCCCCDLL * v5 + 0x1999999999999999 > 0x3333333333333332)
  {
LABEL_2:
    LOBYTE(v6) = 0;
    return v6;
  }
  v7 = v4;
  -[MovingAverage add:overflow:](self->_movingAvg, "add:overflow:", 0);
  self->_currentAverage = v8;
  -[MovingAverage getStdDev](self->_movingAvg, "getStdDev");
  if (v9 < 0.0)
  {
    netqual_log_init();
    v10 = (void *)os_log_netqual;
    v11 = os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT);
    LOBYTE(v6) = 0;
    if (!v11)
      return v6;
    name = self->name;
    v13 = v10;
    v14 = -[NSString UTF8String](name, "UTF8String");
    v35 = 136315906;
    scalingFactor = self->_scalingFactor;
    v36 = "-[SaturationDetection add:]";
    v37 = 1024;
    v38 = 160;
    v39 = 2080;
    v40 = v14;
    v41 = 2048;
    v42 = (float)(v7 / scalingFactor);
    _os_log_impl(&dword_20E622000, v13, OS_LOG_TYPE_DEFAULT, "%s:%u - %s - Not enough samples with instantaneous moving average val %.2f", (uint8_t *)&v35, 0x26u);

    goto LABEL_2;
  }
  v16 = v9;
  v17 = v9 / self->_currentAverage;
  v18 = (float)-[NetworkQualityConfiguration standardDeviationThreshold](self->_config, "standardDeviationThreshold")
      / 100.0;
  netqual_log_init();
  v19 = (void *)os_log_netqual;
  v6 = os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT);
  if (v17 >= v18)
  {
    if (!v6)
      return v6;
    v25 = self->name;
    v26 = v19;
    v27 = -[NSString UTF8String](v25, "UTF8String");
    v28 = self->_scalingFactor;
    v29 = (float)(v7 / v28);
    v30 = (float)(v16 / v28);
    v31 = (float)((float)(v16 / self->_currentAverage) * 100.0);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "timeIntervalSinceDate:", self->_start);
    v35 = 136316674;
    v36 = "-[SaturationDetection add:]";
    v37 = 1024;
    v38 = 173;
    v39 = 2080;
    v40 = v27;
    v41 = 2048;
    v42 = v29;
    v43 = 2048;
    v44 = v30;
    v45 = 2048;
    v46 = v31;
    v47 = 2048;
    v48 = v33;
    _os_log_impl(&dword_20E622000, v26, OS_LOG_TYPE_DEFAULT, "%s:%u - %s - Didn't yet reach stability with instantaneous val %.2f stddev %.2f (%.2f %%), running for %.2f sec", (uint8_t *)&v35, 0x44u);

    goto LABEL_2;
  }
  if (v6)
  {
    v20 = self->name;
    v21 = v19;
    v22 = -[NSString UTF8String](v20, "UTF8String");
    v35 = 136316162;
    v23 = self->_scalingFactor;
    movingAvg = self->_movingAvg;
    v36 = "-[SaturationDetection add:]";
    v37 = 1024;
    v38 = 165;
    v39 = 2080;
    v40 = v22;
    v41 = 2048;
    v42 = (float)(v7 / v23);
    v43 = 2112;
    v44 = *(double *)&movingAvg;
    _os_log_impl(&dword_20E622000, v21, OS_LOG_TYPE_DEFAULT, "%s:%u - %s - Reached stability with last inst. val %.2f at: %@", (uint8_t *)&v35, 0x30u);

  }
  self->_saturationValue = self->_currentAverage;
  LOBYTE(v6) = 1;
  self->_saturated = 1;
  return v6;
}

- (float)getAverage
{
  float result;

  -[MovingAverage getAvg](self->_instAvg, "getAvg");
  return result;
}

- (float)getSaturation
{
  return self->_saturationValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->name, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_instAvg, 0);
  objc_storeStrong((id *)&self->_movingAvg, 0);
}

@end

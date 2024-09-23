@implementation RCActivityWaveformDataProvider

- (RCActivityWaveformDataProvider)initWithWaveformProcessor:(id)a3
{
  id v4;
  RCActivityWaveformDataProvider *v5;
  RCActivityWaveformDataProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RCActivityWaveformDataProvider;
  v5 = -[RCActivityWaveformDataProvider init](&v8, "init");
  v6 = v5;
  if (v5)
    -[RCActivityWaveformDataProvider setProcessor:](v5, "setProcessor:", v4);

  return v6;
}

- (float)_processAmplitude:(float)a3
{
  void *v4;
  float v5;
  float v6;
  double v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCActivityWaveformDataProvider processor](self, "processor"));
  objc_msgSend(v4, "runningAverage");
  v6 = v5;

  v7 = (1.0 - sub_10003B450(v6)) * 6.0 * a3;
  if (v7 > 1.0)
    return 1.0;
  return v7;
}

- (double)amplitudeForSliceWithTimeRange:(id)a3 fullTimeRangeSampled:(BOOL *)a4
{
  double var1;
  double var0;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  unsigned __int8 v15;
  double v16;
  double v17;
  float v18;
  float v20;

  var1 = a3.var1;
  var0 = a3.var0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCActivityWaveformDataProvider processor](self, "processor"));
  objc_msgSend(v8, "recordingStartTime");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCActivityWaveformDataProvider processor](self, "processor"));
  objc_msgSend(v11, "punchInTime");
  v13 = v12;

  v20 = 0.0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCActivityWaveformDataProvider processor](self, "processor"));
  v15 = objc_msgSend(v14, "getAmplitudes:count:startTime:endTime:", &v20, 1, v10 + var0 - v13 + -0.1, v10 + var1 - v13 + -0.1);

  if (a4)
    *a4 = v15;
  *(float *)&v16 = v20;
  v17 = 0.0;
  if (v20 != 0.0)
  {
    -[RCActivityWaveformDataProvider _processAmplitude:](self, "_processAmplitude:", v16, 0.0);
    return v18;
  }
  return v17;
}

- (RCActivityWaveformProcessor)processor
{
  return (RCActivityWaveformProcessor *)objc_loadWeakRetained((id *)&self->_processor);
}

- (void)setProcessor:(id)a3
{
  objc_storeWeak((id *)&self->_processor, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_processor);
}

@end

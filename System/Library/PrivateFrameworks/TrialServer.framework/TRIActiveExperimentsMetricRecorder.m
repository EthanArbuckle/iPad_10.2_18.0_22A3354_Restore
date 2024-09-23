@implementation TRIActiveExperimentsMetricRecorder

- (TRIActiveExperimentsMetricRecorder)initWithExperimentCountProvider:(id)a3 client:(id)a4
{
  id v7;
  id v8;
  TRIActiveExperimentsMetricRecorder *v9;
  TRIActiveExperimentsMetricRecorder *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRIActiveExperimentsMetricRecorder;
  v9 = -[TRIActiveExperimentsMetricRecorder init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_experimentCountProvider, a3);
    objc_storeStrong((id *)&v10->_client, a4);
  }

  return v10;
}

- (TRIActiveExperimentsMetricRecorder)initWithServerContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  TRIActiveExperimentsMetricRecorder *v7;

  v4 = a3;
  objc_msgSend(v4, "experimentDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TRIActiveExperimentsMetricRecorder initWithExperimentCountProvider:client:](self, "initWithExperimentCountProvider:client:", v5, v6);
  return v7;
}

- (BOOL)_isValidCount:(int64_t)a3
{
  return (unint64_t)a3 < 0x7FFFFFFFFFFFFFFFLL;
}

- (id)loggableMetrics
{
  TRIExperimentCountProviding *experimentCountProvider;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0x7FFFFFFFFFFFFFFFLL;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  experimentCountProvider = self->_experimentCountProvider;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__TRIActiveExperimentsMetricRecorder_loggableMetrics__block_invoke;
  v9[3] = &unk_1E9330200;
  v9[4] = &v14;
  v9[5] = &v10;
  -[TRIExperimentCountProviding activeCountWithCompletion:](experimentCountProvider, "activeCountWithCompletion:", v9);
  v4 = (void *)objc_opt_new();
  if (-[TRIActiveExperimentsMetricRecorder _isValidCount:](self, "_isValidCount:", v15[3]))
  {
    objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:integerValue:", CFSTR("activeDeviceExperiments"), v15[3]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  if (-[TRIActiveExperimentsMetricRecorder _isValidCount:](self, "_isValidCount:", v11[3]))
  {
    objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:integerValue:", CFSTR("activeServerExperiments"), v11[3]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  v7 = (void *)objc_msgSend(v4, "copy");

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __53__TRIActiveExperimentsMetricRecorder_loggableMetrics__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a3;
  return result;
}

- (void)recordMetric
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[TRIActiveExperimentsMetricRecorder loggableMetrics](self, "loggableMetrics");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    -[TRIActiveExperimentsMetricRecorder client](self, "client");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIActiveExperimentsMetricRecorder client](self, "client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trackingId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logWithTrackingId:metrics:dimensions:trialSystemTelemetry:", v6, v7, 0, 0);

  }
}

- (TRIExperimentCountProviding)experimentCountProvider
{
  return self->_experimentCountProvider;
}

- (TRIClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_experimentCountProvider, 0);
}

@end

@implementation HLOxygenSaturationSession

- (HLOxygenSaturationSession)initWithDelegate:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  HLOxygenSaturationSession *v8;
  HLOxygenSaturationSession *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HLOxygenSaturationSession;
  v8 = -[HLOxygenSaturationSession init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
  }

  return v9;
}

- (void)begin
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__HLOxygenSaturationSession_begin__block_invoke;
  block[3] = &unk_24DD429B8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __34__HLOxygenSaturationSession_begin__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "oxygenSaturationSession:didBeginWithStartTime:expectedDuration:", *(_QWORD *)(a1 + 32), CACurrentMediaTime(), 15.0);

}

- (void)abort
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__HLOxygenSaturationSession_abort__block_invoke;
  block[3] = &unk_24DD429B8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __34__HLOxygenSaturationSession_abort__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "oxygenSaturationSession:didEndForReason:measurement:", *(_QWORD *)(a1 + 32), 2, 0);

}

- (void)unitTesting_deliverFeedback:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__HLOxygenSaturationSession_unitTesting_deliverFeedback___block_invoke;
  v4[3] = &unk_24DD429E0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __57__HLOxygenSaturationSession_unitTesting_deliverFeedback___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "oxygenSaturationSession:feedbackDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)unitTesting_endSessionWithReason:(unint64_t)a3 saturation:(id)a4 barometricPressure:(id)a5 averageHeartRate:(id)a6 averageHeartRateUUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HLHeartRateData *v16;
  double v17;
  double v18;
  HLOxygenSaturationMeasurement *v19;
  NSObject *queue;
  HLOxygenSaturationMeasurement *v21;
  _QWORD block[5];
  HLOxygenSaturationMeasurement *v23;
  unint64_t v24;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = objc_alloc_init(HLHeartRateData);
  objc_msgSend(v13, "doubleValue");
  v18 = v17;

  -[HLHeartRateData setHeartRate:](v16, "setHeartRate:", v18);
  -[HLHeartRateData setUuid:](v16, "setUuid:", v12);

  v19 = objc_alloc_init(HLOxygenSaturationMeasurement);
  -[HLOxygenSaturationMeasurement setOxygenSaturationPercentage:](v19, "setOxygenSaturationPercentage:", v15);

  -[HLOxygenSaturationMeasurement setAverageHeartRateData:](v19, "setAverageHeartRateData:", v16);
  -[HLOxygenSaturationMeasurement setPressureInKilopascals:](v19, "setPressureInKilopascals:", v14);

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __130__HLOxygenSaturationSession_unitTesting_endSessionWithReason_saturation_barometricPressure_averageHeartRate_averageHeartRateUUID___block_invoke;
  block[3] = &unk_24DD42A08;
  v23 = v19;
  v24 = a3;
  block[4] = self;
  v21 = v19;
  dispatch_async(queue, block);

}

void __130__HLOxygenSaturationSession_unitTesting_endSessionWithReason_saturation_barometricPressure_averageHeartRate_averageHeartRateUUID___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "oxygenSaturationSession:didEndForReason:measurement:", a1[4], a1[6], a1[5]);

}

- (HLOxygenSaturationSessionDelegate)delegate
{
  return (HLOxygenSaturationSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

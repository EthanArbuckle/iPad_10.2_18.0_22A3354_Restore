@implementation OSBatteryDrainPredictor

uint64_t __64___OSBatteryDrainPredictor_drainPerDayFromDate_forNumberOfDays___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasBatteryPercentage");

  return v3;
}

uint64_t __64___OSBatteryDrainPredictor_drainPerDayFromDate_forNumberOfDays___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "logCompletion:", a2);
}

void __64___OSBatteryDrainPredictor_drainPerDayFromDate_forNumberOfDays___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "batteryPercentage");
  v5 = v4;
  v6 = (double)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "lastBatterySoC");

  if (v5 < v6)
  {
    v7 = (double)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "drainSoFar");
    v8 = (double)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "lastBatterySoC");
    objc_msgSend(v13, "eventBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "batteryPercentage");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setDrainSoFar:", (uint64_t)(v8 - v10 + v7));

  }
  objc_msgSend(v13, "eventBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "batteryPercentage");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setLastBatterySoC:", (uint64_t)v12);

}

@end

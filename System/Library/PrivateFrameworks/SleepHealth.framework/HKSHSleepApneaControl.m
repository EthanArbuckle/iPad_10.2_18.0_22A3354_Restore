@implementation HKSHSleepApneaControl

- (HKSHSleepApneaControl)initWithHealthStore:(id)a3
{
  id v5;
  HKSHSleepApneaControl *v6;
  HKSHSleepApneaControl *v7;
  id v8;
  void *v9;
  uint64_t v10;
  HKTaskServerProxyProvider *proxyProvider;
  id v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKSHSleepApneaControl;
  v6 = -[HKSHSleepApneaControl init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = objc_alloc(MEMORY[0x24BDD4038]);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v5, CFSTR("HKSHSleepApneaControlServer"), v7, v9);
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v10;

    -[HKTaskServerProxyProvider setShouldRetryOnInterruption:](v7->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    v12 = objc_alloc_init(MEMORY[0x24BDD4030]);
    -[HKTaskServerProxyProvider setTaskConfiguration:](v7->_proxyProvider, "setTaskConfiguration:", v12);

  }
  return v7;
}

- (BOOL)forceBreathingDisturbanceAnalysisWithError:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  id v5;
  void *v6;
  BOOL v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __68__HKSHSleepApneaControl_forceBreathingDisturbanceAnalysisWithError___block_invoke_2;
  v9[3] = &unk_24C302320;
  v9[4] = &v10;
  -[HKTaskServerProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", &__block_literal_global, v9);
  v5 = (id)v11[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError();
  }

  v7 = v11[5] == 0;
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __68__HKSHSleepApneaControl_forceBreathingDisturbanceAnalysisWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_forceBreathingDisturbanceAnalysis");
}

void __68__HKSHSleepApneaControl_forceBreathingDisturbanceAnalysisWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)overrideTimeIntervalAndResetActivityWithTimeInterval:(double)a3 error:(id *)a4
{
  HKTaskServerProxyProvider *proxyProvider;
  id v6;
  void *v7;
  BOOL v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  proxyProvider = self->_proxyProvider;
  v10[4] = &v12;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __84__HKSHSleepApneaControl_overrideTimeIntervalAndResetActivityWithTimeInterval_error___block_invoke;
  v11[3] = &__block_descriptor_40_e39_v16__0___HKSHSleepApneaControlServer__8l;
  *(double *)&v11[4] = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __84__HKSHSleepApneaControl_overrideTimeIntervalAndResetActivityWithTimeInterval_error___block_invoke_2;
  v10[3] = &unk_24C302320;
  -[HKTaskServerProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v11, v10);
  v6 = (id)v13[5];
  v7 = v6;
  if (v6)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v6);
    else
      _HKLogDroppedError();
  }

  v8 = v13[5] == 0;
  _Block_object_dispose(&v12, 8);

  return v8;
}

uint64_t __84__HKSHSleepApneaControl_overrideTimeIntervalAndResetActivityWithTimeInterval_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_overridePreviousTimeIntervalWithTimeInterval:", *(double *)(a1 + 32));
}

void __84__HKSHSleepApneaControl_overrideTimeIntervalAndResetActivityWithTimeInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getSamplesFromLastAnalysisWithError:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  proxyProvider = self->_proxyProvider;
  v9[4] = &v17;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__HKSHSleepApneaControl_getSamplesFromLastAnalysisWithError___block_invoke;
  v10[3] = &unk_24C302390;
  v10[4] = self;
  v10[5] = &v11;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__HKSHSleepApneaControl_getSamplesFromLastAnalysisWithError___block_invoke_3;
  v9[3] = &unk_24C302320;
  -[HKTaskServerProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);
  v5 = (id)v18[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError();
  }

  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __61__HKSHSleepApneaControl_getSamplesFromLastAnalysisWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "getDateIntervalOfLastAnalysis");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__HKSHSleepApneaControl_getSamplesFromLastAnalysisWithError___block_invoke_2;
  v6[3] = &unk_24C302368;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "remote_getBreathingDisturbanceSamplesInDateInterval:completion:", v5, v6);

}

void __61__HKSHSleepApneaControl_getSamplesFromLastAnalysisWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __61__HKSHSleepApneaControl_getSamplesFromLastAnalysisWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getDateIntervalOfLastAnalysis
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3C98]), "initWithCategory:domainName:healthStore:", 2, CFSTR("com.apple.health.Sleep.BreathingDisturbanceAnalysis"), self->_healthStore);
  v37 = 0;
  objc_msgSend(v3, "numberForKey:error:", CFSTR("HDSHBreathingDisturbanceAnalysisSchedulerSuccessfulAnalysisAttemptCountKey"), &v37);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v37;
  if (!v5)
  {
    if (!v4)
    {
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x24BDD3060];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_ERROR))
        goto LABEL_3;
      v14 = v13;
      v15 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v39 = v15;
      v16 = v15;
      v17 = "[%{public}@] No analysis has been performed yet; not returning date interval from the most recent analysis.";
      v18 = v14;
      v19 = 12;
LABEL_15:
      _os_log_error_impl(&dword_20A366000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);

      goto LABEL_3;
    }
    v8 = objc_alloc(MEMORY[0x24BDD3BE0]);
    v9 = (void *)objc_msgSend(v8, "initWithFeatureIdentifier:healthStore:", *MEMORY[0x24BDD2E68], self->_healthStore);
    v36 = 0;
    objc_msgSend(v9, "featureOnboardingRecordWithError:", &v36);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v36;
    if (v11)
    {
      _HKInitializeLogging();
      v12 = (void *)*MEMORY[0x24BDD3060];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v27 = v12;
      v33 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v39 = v33;
      v40 = 2112;
      v41 = v11;
      v29 = v33;
      v30 = "[%{public}@] Unable to fetch onboarding record with error: %@";
      v31 = v27;
      v32 = 22;
    }
    else
    {
      if (v10)
      {
        objc_msgSend(v10, "earliestDateOfAnyOnboardingCompletion");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_alloc_init(MEMORY[0x24BDBCE68]);
        objc_msgSend(v21, "setDay:", 30 * objc_msgSend(v4, "integerValue") - 30);
        v34 = v20;
        objc_msgSend(v20, "dateByAddingComponents:toDate:options:", v21, v35, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setDay:", 30 * objc_msgSend(v4, "integerValue"));
        objc_msgSend(v20, "dateByAddingComponents:toDate:options:", v21, v35, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v22, v23);

        goto LABEL_12;
      }
      _HKInitializeLogging();
      v26 = (void *)*MEMORY[0x24BDD3060];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_ERROR))
      {
LABEL_7:
        v7 = 0;
LABEL_12:

        goto LABEL_13;
      }
      v27 = v26;
      v28 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v39 = v28;
      v29 = v28;
      v30 = "[%{public}@] Fetched nil onboarding record; cannot calculate date interval.";
      v31 = v27;
      v32 = 12;
    }
    _os_log_error_impl(&dword_20A366000, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);

    goto LABEL_7;
  }
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_ERROR))
  {
    v14 = v6;
    v25 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v39 = v25;
    v40 = 2112;
    v41 = v5;
    v16 = v25;
    v17 = "[%{public}@] Error fetching count of successful analysis attempts: %@";
    v18 = v14;
    v19 = 22;
    goto LABEL_15;
  }
LABEL_3:
  v7 = 0;
LABEL_13:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end

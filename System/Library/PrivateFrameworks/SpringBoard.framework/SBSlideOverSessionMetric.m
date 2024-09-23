@implementation SBSlideOverSessionMetric

uint64_t __63__SBSlideOverSessionMetric_initWithHeartbeatMetricPersistence___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;

  v5 = a3;
  v6 = v5;
  if (a2 == 5)
  {
    objc_msgSend(v5, "eventPayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_bundleIdentifierForElementWithLayoutRole:fromContext:", 3, v6);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = &stru_1E8EC7EC0;
    if (v14)
      v16 = (__CFString *)v14;
    v17 = v16;

    objc_msgSend(*(id *)(a1 + 32), "setFloatingBundleIdentifier:", v17);
    objc_msgSend(*(id *)(a1 + 32), "floatingBundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    if (v19)
    {
      v20 = *(void **)(a1 + 32);
      objc_msgSend(v7, "timestamp");
      objc_msgSend(v20, "setStartTimestamp:");
      v21 = *(void **)(a1 + 32);
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE70]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      SBMainWorkspaceTransitionSourceDescription(objc_msgSend(v22, "integerValue"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setStartReason:", v23);

      goto LABEL_12;
    }

LABEL_15:
    v24 = 0;
    goto LABEL_16;
  }
  if (a2 == 48)
  {
    objc_msgSend(v5, "eventPayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(*(id *)(a1 + 32), "floatingBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v9)
      v12 = 1;
    else
      v12 = v11 == 0;
    if (!v12)
    {
      v13 = *(void **)(a1 + 32);
      objc_msgSend(v7, "timestamp");
      objc_msgSend(v13, "setStartTimestamp:");
      objc_msgSend(*(id *)(a1 + 32), "setStartReason:", CFSTR("Unlock"));
LABEL_12:
      v24 = 1;
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_15;
  }
  v24 = 0;
LABEL_17:

  return v24;
}

- (void)setFloatingBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)floatingBundleIdentifier
{
  return self->_floatingBundleIdentifier;
}

- (id)_bundleIdentifierForElementWithLayoutRole:(int64_t)a3 fromContext:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  objc_msgSend(a4, "eventPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE50]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__SBSlideOverSessionMetric__bundleIdentifierForElementWithLayoutRole_fromContext___block_invoke;
  v10[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
  v10[4] = a3;
  objc_msgSend(v6, "bs_firstObjectPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0DABE30]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __82__SBSlideOverSessionMetric__bundleIdentifierForElementWithLayoutRole_fromContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0DABE48]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == *(_QWORD *)(a1 + 32);

  return v4;
}

- (SBSlideOverSessionMetric)initWithHeartbeatMetricPersistence:(id)a3
{
  id v4;
  SBSlideOverSessionMetric *v5;
  SBSlideOverSessionMetric *v6;
  NSString *startReason;
  NSString *floatingBundleIdentifier;
  uint64_t v9;
  SBSlideOverSessionMetric *v10;
  void *v11;
  SBSlideOverSessionMetric *v12;
  void *v13;
  _QWORD v15[4];
  SBSlideOverSessionMetric *v16;
  id v17;
  _QWORD v18[4];
  SBSlideOverSessionMetric *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SBSlideOverSessionMetric;
  v5 = -[SBAnalyticsStateMachineEventHandler init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_startTimestamp = 0.0;
    startReason = v5->_startReason;
    v5->_startReason = (NSString *)&stru_1E8EC7EC0;

    floatingBundleIdentifier = v6->_floatingBundleIdentifier;
    v6->_floatingBundleIdentifier = (NSString *)&stru_1E8EC7EC0;

    v9 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __63__SBSlideOverSessionMetric_initWithHeartbeatMetricPersistence___block_invoke;
    v18[3] = &unk_1E8E9E018;
    v10 = v6;
    v19 = v10;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 0, v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAnalyticsStateMachineEventHandler addEdge:](v10, "addEdge:", v11);

    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __63__SBSlideOverSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_2;
    v15[3] = &unk_1E8EA2DA8;
    v12 = v10;
    v16 = v12;
    v17 = v4;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 1, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAnalyticsStateMachineEventHandler addEdge:](v12, "addEdge:", v13);

  }
  return v6;
}

uint64_t __63__SBSlideOverSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  char v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  char v31;
  void *v32;
  int v33;
  id *v34;
  id *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id *v41;
  id *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  _QWORD v48[2];
  char v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  _QWORD v54[2];
  char v55;
  _QWORD v56[4];
  id v57;
  id v58;
  __CFString *v59;
  double v60;
  char v61;

  v5 = a3;
  v6 = v5;
  if (a2 == 5)
  {
    objc_msgSend(v5, "eventPayload");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "floatingBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_bundleIdentifierForElementWithLayoutRole:fromContext:", 3, v6);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = &stru_1E8EC7EC0;
    if (v20)
      v22 = (__CFString *)v20;
    v23 = v22;

    objc_msgSend(*(id *)(a1 + 32), "setFloatingBundleIdentifier:", v23);
    objc_msgSend(*(id *)(a1 + 32), "startReason");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE70]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    SBMainWorkspaceTransitionSourceDescription(objc_msgSend(v25, "integerValue"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "timestamp");
    v28 = v27;
    objc_msgSend(*(id *)(a1 + 32), "startTimestamp");
    v30 = v28 - v29;
    v31 = objc_msgSend((id)SBApp, "isHardwareKeyboardAttached");
    if (-[__CFString length](v23, "length"))
    {
      if ((-[__CFString isEqualToString:](v23, "isEqualToString:", v19) & 1) != 0)
      {
        v32 = v24;
        v17 = 0;
        v33 = 1;
        goto LABEL_14;
      }
      objc_msgSend(*(id *)(a1 + 40), "trackInteractionWithFeatureNamed:duration:", CFSTR("SlideOverSession"), v30);
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __63__SBSlideOverSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_4;
      v50[3] = &unk_1E8EA2D80;
      v42 = &v51;
      v51 = *(id *)(a1 + 32);
      v41 = &v52;
      v32 = v24;
      v52 = v24;
      v34 = &v53;
      v43 = v26;
      v36 = v19;
      v37 = v26;
      v53 = v37;
      *(double *)&v54[1] = v30;
      v35 = (id *)v54;
      v54[0] = v36;
      v55 = v31;
      objc_msgSend(v6, "stateForQueryName:completion:", 5, v50);
      v38 = *(void **)(a1 + 32);
      objc_msgSend(v18, "timestamp");
      objc_msgSend(v38, "setStartTimestamp:");
      v39 = v37;
      v19 = v36;
      objc_msgSend(*(id *)(a1 + 32), "setStartReason:", v39);
      v17 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "trackInteractionWithFeatureNamed:duration:", CFSTR("SlideOverSession"), v30);
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __63__SBSlideOverSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_5;
      v44[3] = &unk_1E8EA2D80;
      v42 = &v45;
      v45 = *(id *)(a1 + 32);
      v41 = &v46;
      v32 = v24;
      v46 = v24;
      v34 = &v47;
      v43 = v26;
      v47 = v26;
      *(double *)&v48[1] = v30;
      v35 = (id *)v48;
      v48[0] = v19;
      v49 = v31;
      objc_msgSend(v6, "stateForQueryName:completion:", 5, v44);
      v17 = 0;
    }

    v33 = 0;
    v26 = v43;
LABEL_14:

    if (!v33)
      goto LABEL_16;
LABEL_15:
    v17 = 1;
    goto LABEL_16;
  }
  if (a2 != 48)
    goto LABEL_15;
  objc_msgSend(v5, "eventPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (!v9)
  {

    goto LABEL_15;
  }
  objc_msgSend(*(id *)(a1 + 32), "startReason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timestamp");
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "startTimestamp");
  v14 = v12 - v13;
  v15 = objc_msgSend((id)SBApp, "isHardwareKeyboardAttached");
  objc_msgSend(*(id *)(a1 + 40), "trackInteractionWithFeatureNamed:duration:", CFSTR("SlideOverSession"), v14);
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __63__SBSlideOverSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_3;
  v56[3] = &unk_1E8EA2D58;
  v57 = *(id *)(a1 + 32);
  v58 = v10;
  v59 = CFSTR("Lock");
  v60 = v14;
  v61 = v15;
  v16 = v10;
  objc_msgSend(v6, "stateForQueryName:completion:", 5, v56);

  v17 = 0;
LABEL_16:

  return v17;
}

void __63__SBSlideOverSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  id v9;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(double *)(a1 + 56);
  objc_msgSend(v5, "floatingBundleIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sendCoreAnalyticsEventWithStartReason:endReason:duration:floatingBundleIdentifier:doNotDisturbActive:hardwareKeyboardAttached:", v6, v7, v9, v4, *(unsigned __int8 *)(a1 + 64), v8);

}

uint64_t __63__SBSlideOverSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return objc_msgSend(*(id *)(a1 + 32), "_sendCoreAnalyticsEventWithStartReason:endReason:duration:floatingBundleIdentifier:doNotDisturbActive:hardwareKeyboardAttached:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v4, *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 64));
}

uint64_t __63__SBSlideOverSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return objc_msgSend(*(id *)(a1 + 32), "_sendCoreAnalyticsEventWithStartReason:endReason:duration:floatingBundleIdentifier:doNotDisturbActive:hardwareKeyboardAttached:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v4, *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 64));
}

- (BOOL)sendCoreAnalyticsEventWithName:(id)a3 payload:(id)a4
{
  id v4;
  char v5;
  id v7;

  v7 = a4;
  v4 = v7;
  v5 = AnalyticsSendEventLazy();

  return v5;
}

id __67__SBSlideOverSessionMetric_sendCoreAnalyticsEventWithName_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)_sendCoreAnalyticsEventWithStartReason:(id)a3 endReason:(id)a4 duration:(double)a5 floatingBundleIdentifier:(id)a6 doNotDisturbActive:(BOOL)a7 hardwareKeyboardAttached:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[6];
  _QWORD v24[7];

  v8 = a8;
  v9 = a7;
  v24[6] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("StartReason");
  v23[1] = CFSTR("EndReason");
  v24[0] = a3;
  v24[1] = a4;
  v23[2] = CFSTR("Duration");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = a6;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v14, "numberWithDouble:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v18;
  v24[3] = v15;
  v23[3] = CFSTR("FloatingBundleID");
  v23[4] = CFSTR("IsDoNotDisturbActive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v19;
  v23[5] = CFSTR("IsHardwareKeyboardAttached");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[SBSlideOverSessionMetric sendCoreAnalyticsEventWithName:payload:](self, "sendCoreAnalyticsEventWithName:payload:", CFSTR("com.apple.SpringBoard.Analytics.SlideOverSession"), v21);
  return (char)self;
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(double)a3
{
  self->_startTimestamp = a3;
}

- (NSString)startReason
{
  return self->_startReason;
}

- (void)setStartReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_startReason, 0);
}

@end

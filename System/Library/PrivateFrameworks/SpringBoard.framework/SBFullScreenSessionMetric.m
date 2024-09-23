@implementation SBFullScreenSessionMetric

uint64_t __33__SBFullScreenSessionMetric_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;

  v5 = a3;
  v6 = v5;
  if (a2 == 5)
  {
    objc_msgSend(v5, "eventPayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_bundleIdentifierForElementWithLayoutRole:fromContext:", 1, v6);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (__CFString *)v17;
    else
      v19 = &stru_1E8EC7EC0;
    v20 = v19;

    objc_msgSend(*(id *)(a1 + 32), "_bundleIdentifierForElementWithLayoutRole:fromContext:", 2, v6);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (__CFString *)v21;
    else
      v23 = &stru_1E8EC7EC0;
    v24 = v23;

    objc_msgSend(*(id *)(a1 + 32), "setPrimaryBundleIdentifier:", v20);
    objc_msgSend(*(id *)(a1 + 32), "setSideBundleIdentifier:", v24);
    objc_msgSend(*(id *)(a1 + 32), "primaryBundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "length");

    objc_msgSend(*(id *)(a1 + 32), "sideBundleIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "length");

    if (!v26 || v28)
    {

LABEL_24:
      v33 = 0;
      goto LABEL_25;
    }
    v29 = *(void **)(a1 + 32);
    objc_msgSend(v7, "timestamp");
    objc_msgSend(v29, "setStartTimestamp:");
    v30 = *(void **)(a1 + 32);
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE70]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    SBMainWorkspaceTransitionSourceDescription(objc_msgSend(v31, "integerValue"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setStartReason:", v32);

LABEL_21:
    v33 = 1;
LABEL_25:

    goto LABEL_26;
  }
  if (a2 == 48)
  {
    objc_msgSend(v5, "eventPayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(*(id *)(a1 + 32), "primaryBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    objc_msgSend(*(id *)(a1 + 32), "sideBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v9)
      v14 = 1;
    else
      v14 = v11 == 0;
    if (v14 || v13 != 0)
      goto LABEL_24;
    v16 = *(void **)(a1 + 32);
    objc_msgSend(v7, "timestamp");
    objc_msgSend(v16, "setStartTimestamp:");
    objc_msgSend(*(id *)(a1 + 32), "setStartReason:", CFSTR("Unlock"));
    goto LABEL_21;
  }
  v33 = 0;
LABEL_26:

  return v33;
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
  v10[2] = __83__SBFullScreenSessionMetric__bundleIdentifierForElementWithLayoutRole_fromContext___block_invoke;
  v10[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
  v10[4] = a3;
  objc_msgSend(v6, "bs_firstObjectPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0DABE30]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)sideBundleIdentifier
{
  return self->_sideBundleIdentifier;
}

- (void)setSideBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setPrimaryBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)primaryBundleIdentifier
{
  return self->_primaryBundleIdentifier;
}

- (void)setStartTimestamp:(double)a3
{
  self->_startTimestamp = a3;
}

- (void)setStartReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

uint64_t __33__SBFullScreenSessionMetric_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
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
  void *v15;
  char v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  char v36;
  char v37;
  __CFString *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  id *v42;
  id *v43;
  void *v44;
  id v45;
  id *v46;
  int v47;
  void *v49;
  void *v50;
  id v51;
  id *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  _QWORD v59[2];
  char v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  _QWORD v65[2];
  char v66;
  _QWORD v67[4];
  id v68;
  id v69;
  __CFString *v70;
  id v71;
  double v72;
  char v73;

  v5 = a3;
  v6 = v5;
  if (a2 == 5)
  {
    objc_msgSend(v5, "eventPayload");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "primaryBundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_bundleIdentifierForElementWithLayoutRole:fromContext:", 1, v6);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (v22)
      v24 = (__CFString *)v22;
    else
      v24 = &stru_1E8EC7EC0;
    v25 = v24;

    objc_msgSend(*(id *)(a1 + 32), "_bundleIdentifierForElementWithLayoutRole:fromContext:", 2, v6);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26)
      v28 = (__CFString *)v26;
    else
      v28 = &stru_1E8EC7EC0;
    v29 = v28;

    objc_msgSend(*(id *)(a1 + 32), "setPrimaryBundleIdentifier:", v25);
    objc_msgSend(*(id *)(a1 + 32), "setSideBundleIdentifier:", v29);
    objc_msgSend(*(id *)(a1 + 32), "startReason");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE70]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    SBMainWorkspaceTransitionSourceDescription(objc_msgSend(v31, "integerValue"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "timestamp");
    v33 = v32;
    objc_msgSend(*(id *)(a1 + 32), "startTimestamp");
    v35 = v33 - v34;
    v36 = objc_msgSend((id)SBApp, "isHardwareKeyboardAttached");
    if (-[__CFString length](v25, "length") && !-[__CFString length](v29, "length"))
    {
      if ((-[__CFString isEqualToString:](v25, "isEqualToString:", v21) & 1) != 0)
      {
        v19 = 0;
        v47 = 1;
LABEL_15:

        if (!v47)
          goto LABEL_19;
        goto LABEL_18;
      }
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __33__SBFullScreenSessionMetric_init__block_invoke_4;
      v61[3] = &unk_1E8EA2D80;
      v50 = v21;
      v42 = &v62;
      v62 = *(id *)(a1 + 32);
      v52 = &v63;
      v53 = v30;
      v63 = v30;
      v46 = &v64;
      v51 = v54;
      v64 = v51;
      *(double *)&v65[1] = v35;
      v43 = (id *)v65;
      v44 = v50;
      v65[0] = v50;
      v66 = v36;
      objc_msgSend(v6, "stateForQueryName:completion:", 5, v61);
      v49 = *(void **)(a1 + 32);
      objc_msgSend(v20, "timestamp");
      objc_msgSend(v49, "setStartTimestamp:");
      objc_msgSend(*(id *)(a1 + 32), "setStartReason:", v51);
      v19 = 1;
    }
    else
    {
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __33__SBFullScreenSessionMetric_init__block_invoke_5;
      v55[3] = &unk_1E8EA2D80;
      v37 = v36;
      v38 = v25;
      v39 = v29;
      v40 = v20;
      v41 = v21;
      v42 = &v56;
      v56 = *(id *)(a1 + 32);
      v52 = &v57;
      v53 = v30;
      v57 = v30;
      v58 = v54;
      *(double *)&v59[1] = v35;
      v43 = (id *)v59;
      v44 = v41;
      v45 = v41;
      v20 = v40;
      v29 = v39;
      v25 = v38;
      v59[0] = v45;
      v60 = v37;
      v46 = &v58;
      objc_msgSend(v6, "stateForQueryName:completion:", 5, v55);
      v19 = 0;
    }

    v47 = 0;
    v21 = v44;
    v30 = v53;
    goto LABEL_15;
  }
  if (a2 != 48)
  {
LABEL_18:
    v19 = 1;
    goto LABEL_19;
  }
  objc_msgSend(v5, "eventPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (!v9)
  {

    goto LABEL_18;
  }
  objc_msgSend(*(id *)(a1 + 32), "startReason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timestamp");
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "startTimestamp");
  v14 = v12 - v13;
  objc_msgSend(*(id *)(a1 + 32), "primaryBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend((id)SBApp, "isHardwareKeyboardAttached");
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __33__SBFullScreenSessionMetric_init__block_invoke_3;
  v67[3] = &unk_1E8EA2D80;
  v68 = *(id *)(a1 + 32);
  v69 = v10;
  v72 = v14;
  v70 = CFSTR("Lock");
  v71 = v15;
  v73 = v16;
  v17 = v15;
  v18 = v10;
  objc_msgSend(v6, "stateForQueryName:completion:", 5, v67);

  v19 = 0;
LABEL_19:

  return v19;
}

BOOL __83__SBFullScreenSessionMetric__bundleIdentifierForElementWithLayoutRole_fromContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0DABE48]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == *(_QWORD *)(a1 + 32);

  return v4;
}

- (SBFullScreenSessionMetric)init
{
  SBFullScreenSessionMetric *v2;
  SBFullScreenSessionMetric *v3;
  NSString *startReason;
  NSString *primaryBundleIdentifier;
  NSString *sideBundleIdentifier;
  uint64_t v7;
  SBFullScreenSessionMetric *v8;
  void *v9;
  SBFullScreenSessionMetric *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, void *);
  void *v16;
  SBFullScreenSessionMetric *v17;
  _QWORD v18[4];
  SBFullScreenSessionMetric *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SBFullScreenSessionMetric;
  v2 = -[SBAnalyticsStateMachineEventHandler init](&v20, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_startTimestamp = 0.0;
    startReason = v2->_startReason;
    v2->_startReason = (NSString *)&stru_1E8EC7EC0;

    primaryBundleIdentifier = v3->_primaryBundleIdentifier;
    v3->_primaryBundleIdentifier = (NSString *)&stru_1E8EC7EC0;

    sideBundleIdentifier = v3->_sideBundleIdentifier;
    v3->_sideBundleIdentifier = (NSString *)&stru_1E8EC7EC0;

    v7 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __33__SBFullScreenSessionMetric_init__block_invoke;
    v18[3] = &unk_1E8E9E018;
    v8 = v3;
    v19 = v8;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 0, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAnalyticsStateMachineEventHandler addEdge:](v8, "addEdge:", v9);

    v13 = v7;
    v14 = 3221225472;
    v15 = __33__SBFullScreenSessionMetric_init__block_invoke_2;
    v16 = &unk_1E8E9E018;
    v10 = v8;
    v17 = v10;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 1, &v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAnalyticsStateMachineEventHandler addEdge:](v10, "addEdge:", v11, v13, v14, v15, v16);

  }
  return v3;
}

uint64_t __33__SBFullScreenSessionMetric_init__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return objc_msgSend(*(id *)(a1 + 32), "_sendCoreAnalyticsEventWithStartReason:endReason:duration:primaryBundleIdentifier:doNotDisturbActive:hardwareKeyboardAttached:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v4, *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 64));
}

uint64_t __33__SBFullScreenSessionMetric_init__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return objc_msgSend(*(id *)(a1 + 32), "_sendCoreAnalyticsEventWithStartReason:endReason:duration:primaryBundleIdentifier:doNotDisturbActive:hardwareKeyboardAttached:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v4, *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 64));
}

uint64_t __33__SBFullScreenSessionMetric_init__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return objc_msgSend(*(id *)(a1 + 32), "_sendCoreAnalyticsEventWithStartReason:endReason:duration:primaryBundleIdentifier:doNotDisturbActive:hardwareKeyboardAttached:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v4, *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 64));
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

id __68__SBFullScreenSessionMetric_sendCoreAnalyticsEventWithName_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)_sendCoreAnalyticsEventWithStartReason:(id)a3 endReason:(id)a4 duration:(double)a5 primaryBundleIdentifier:(id)a6 doNotDisturbActive:(BOOL)a7 hardwareKeyboardAttached:(BOOL)a8
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
  v23[3] = CFSTR("PrimaryBundleID");
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

  LOBYTE(self) = -[SBFullScreenSessionMetric sendCoreAnalyticsEventWithName:payload:](self, "sendCoreAnalyticsEventWithName:payload:", CFSTR("com.apple.SpringBoard.Analytics.SingleAppSession"), v21);
  return (char)self;
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (NSString)startReason
{
  return self->_startReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sideBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_startReason, 0);
}

@end

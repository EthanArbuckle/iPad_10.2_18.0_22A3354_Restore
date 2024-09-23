@implementation SBSplitViewSessionMetric

uint64_t __63__SBSplitViewSessionMetric_initWithHeartbeatMetricPersistence___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;

  v5 = a3;
  v6 = v5;
  if (a2 == 5)
  {
    objc_msgSend(v5, "eventPayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_bundleIdentifierForElementWithLayoutRole:fromContext:", 1, v6);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
      v22 = (__CFString *)v20;
    else
      v22 = &stru_1E8EC7EC0;
    v23 = v22;

    objc_msgSend(*(id *)(a1 + 32), "_bundleIdentifierForElementWithLayoutRole:fromContext:", 2, v6);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (v24)
      v26 = (__CFString *)v24;
    else
      v26 = &stru_1E8EC7EC0;
    v27 = v26;

    objc_msgSend(*(id *)(a1 + 32), "setIndividualSessionPrimaryBundleIdentifier:", v23);
    objc_msgSend(*(id *)(a1 + 32), "setIndividualSessionSideBundleIdentifier:", v27);
    objc_msgSend(*(id *)(a1 + 32), "individualSessionPrimaryBundleIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "length");

    objc_msgSend(*(id *)(a1 + 32), "individualSessionSideBundleIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "length");

    if (v29 && v31)
    {
      objc_msgSend(v7, "timestamp");
      v33 = v32;
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE70]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      SBMainWorkspaceTransitionSourceDescription(objc_msgSend(v34, "integerValue"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setAggregateSessionIdentifier:", v37);

      objc_msgSend(*(id *)(a1 + 32), "setAggregateSessionStartTimestamp:", v33);
      objc_msgSend(*(id *)(a1 + 32), "setAggregateSessionStartReason:", v35);
      objc_msgSend(*(id *)(a1 + 32), "setIndividualSessionStartTimestamp:", v33);
      objc_msgSend(*(id *)(a1 + 32), "setIndividualSessionStartReason:", v35);

      goto LABEL_20;
    }

LABEL_23:
    v38 = 0;
    goto LABEL_24;
  }
  if (a2 == 48)
  {
    objc_msgSend(v5, "eventPayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(*(id *)(a1 + 32), "individualSessionPrimaryBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    objc_msgSend(*(id *)(a1 + 32), "individualSessionSideBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v9)
      v14 = 1;
    else
      v14 = v11 == 0;
    if (!v14 && v13 != 0)
    {
      objc_msgSend(v7, "timestamp");
      v17 = v16;
      v18 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAggregateSessionIdentifier:", v19);

      objc_msgSend(*(id *)(a1 + 32), "setAggregateSessionStartTimestamp:", v17);
      objc_msgSend(*(id *)(a1 + 32), "setAggregateSessionStartReason:", CFSTR("Unlock"));
      objc_msgSend(*(id *)(a1 + 32), "setIndividualSessionStartTimestamp:", v17);
      objc_msgSend(*(id *)(a1 + 32), "setIndividualSessionStartReason:", CFSTR("Unlock"));
LABEL_20:
      v38 = 1;
LABEL_24:

      goto LABEL_25;
    }
    goto LABEL_23;
  }
  v38 = 0;
LABEL_25:

  return v38;
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
  v10[2] = __82__SBSplitViewSessionMetric__bundleIdentifierForElementWithLayoutRole_fromContext___block_invoke;
  v10[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
  v10[4] = a3;
  objc_msgSend(v6, "bs_firstObjectPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0DABE30]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setIndividualSessionSideBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setIndividualSessionPrimaryBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)individualSessionSideBundleIdentifier
{
  return self->_individualSessionSideBundleIdentifier;
}

- (NSString)individualSessionPrimaryBundleIdentifier
{
  return self->_individualSessionPrimaryBundleIdentifier;
}

BOOL __82__SBSplitViewSessionMetric__bundleIdentifierForElementWithLayoutRole_fromContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0DABE48]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == *(_QWORD *)(a1 + 32);

  return v4;
}

- (SBSplitViewSessionMetric)initWithHeartbeatMetricPersistence:(id)a3
{
  id v4;
  SBSplitViewSessionMetric *v5;
  uint64_t v6;
  NSUUID *aggregateSessionIdentifier;
  NSString *aggregateSessionStartReason;
  NSString *individualSessionStartReason;
  NSString *individualSessionPrimaryBundleIdentifier;
  NSString *individualSessionSideBundleIdentifier;
  uint64_t v12;
  SBSplitViewSessionMetric *v13;
  void *v14;
  SBSplitViewSessionMetric *v15;
  void *v16;
  _QWORD v18[4];
  SBSplitViewSessionMetric *v19;
  id v20;
  _QWORD v21[4];
  SBSplitViewSessionMetric *v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SBSplitViewSessionMetric;
  v5 = -[SBAnalyticsStateMachineEventHandler init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    aggregateSessionIdentifier = v5->_aggregateSessionIdentifier;
    v5->_aggregateSessionIdentifier = (NSUUID *)v6;

    v5->_aggregateSessionStartTimestamp = 0.0;
    aggregateSessionStartReason = v5->_aggregateSessionStartReason;
    v5->_aggregateSessionStartReason = (NSString *)&stru_1E8EC7EC0;

    v5->_individualSessionStartTimestamp = 0.0;
    individualSessionStartReason = v5->_individualSessionStartReason;
    v5->_individualSessionStartReason = (NSString *)&stru_1E8EC7EC0;

    individualSessionPrimaryBundleIdentifier = v5->_individualSessionPrimaryBundleIdentifier;
    v5->_individualSessionPrimaryBundleIdentifier = (NSString *)&stru_1E8EC7EC0;

    individualSessionSideBundleIdentifier = v5->_individualSessionSideBundleIdentifier;
    v5->_individualSessionSideBundleIdentifier = (NSString *)&stru_1E8EC7EC0;

    v12 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __63__SBSplitViewSessionMetric_initWithHeartbeatMetricPersistence___block_invoke;
    v21[3] = &unk_1E8E9E018;
    v13 = v5;
    v22 = v13;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 0, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAnalyticsStateMachineEventHandler addEdge:](v13, "addEdge:", v14);

    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __63__SBSplitViewSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_2;
    v18[3] = &unk_1E8EA2DA8;
    v15 = v13;
    v19 = v15;
    v20 = v4;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 1, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAnalyticsStateMachineEventHandler addEdge:](v15, "addEdge:", v16);

  }
  return v5;
}

uint64_t __63__SBSplitViewSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  uint64_t v34;
  void *v35;
  __CFString *v36;
  __CFString *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  char v49;
  int v50;
  void *v51;
  id *v52;
  id v53;
  id *v54;
  id *v55;
  id *v56;
  id *v57;
  id v58;
  void *v59;
  id v60;
  id *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD v70[4];
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  double v78;
  double v79;
  char v80;
  _QWORD v81[4];
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  _QWORD v87[2];
  char v88;
  _QWORD v89[4];
  id v90;
  id v91;
  id v92;
  __CFString *v93;
  id v94;
  id v95;
  id v96;
  double v97;
  double v98;
  char v99;

  v5 = a3;
  v6 = v5;
  if (a2 == 5)
  {
    objc_msgSend(v5, "eventPayload");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "individualSessionPrimaryBundleIdentifier");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "individualSessionSideBundleIdentifier");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_bundleIdentifierForElementWithLayoutRole:fromContext:", 1, v6);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    if (v30)
      v32 = (__CFString *)v30;
    else
      v32 = &stru_1E8EC7EC0;
    v33 = v32;

    objc_msgSend(*(id *)(a1 + 32), "_bundleIdentifierForElementWithLayoutRole:fromContext:", 2, v6);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v34;
    if (v34)
      v36 = (__CFString *)v34;
    else
      v36 = &stru_1E8EC7EC0;
    v37 = v36;

    objc_msgSend(*(id *)(a1 + 32), "setIndividualSessionPrimaryBundleIdentifier:", v33);
    objc_msgSend(*(id *)(a1 + 32), "setIndividualSessionSideBundleIdentifier:", v37);
    objc_msgSend(v29, "timestamp");
    v39 = v38;
    v66 = v29;
    objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE70]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    SBMainWorkspaceTransitionSourceDescription(objc_msgSend(v40, "integerValue"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "aggregateSessionIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "UUIDString");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "aggregateSessionStartReason");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "aggregateSessionStartTimestamp");
    v46 = v45;
    objc_msgSend(*(id *)(a1 + 32), "individualSessionStartReason");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "individualSessionStartTimestamp");
    v48 = v39 - v47;
    v49 = objc_msgSend((id)SBApp, "isHardwareKeyboardAttached");
    v65 = v44;
    if (-[__CFString length](v33, "length") && -[__CFString length](v37, "length"))
    {
      if (-[__CFString isEqualToString:](v33, "isEqualToString:", v69)
        && (-[__CFString isEqualToString:](v37, "isEqualToString:", v67) & 1) != 0)
      {
        v28 = 0;
        v50 = 1;
        v51 = v67;
        goto LABEL_20;
      }
      objc_msgSend(*(id *)(a1 + 40), "trackInteractionWithFeatureNamed:duration:", CFSTR("SplitViewSession"), v48);
      v81[0] = MEMORY[0x1E0C809B0];
      v81[1] = 3221225472;
      v81[2] = __63__SBSplitViewSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_4;
      v81[3] = &unk_1E8EAD830;
      v82 = *(id *)(a1 + 32);
      v63 = v43;
      v83 = v43;
      v62 = &v84;
      v84 = v68;
      v55 = &v85;
      v64 = v41;
      v58 = v41;
      v85 = v58;
      *(double *)&v87[1] = v48;
      v56 = &v86;
      v86 = v69;
      v57 = (id *)v87;
      v87[0] = v67;
      v88 = v49;
      objc_msgSend(v6, "stateForQueryName:completion:", 5, v81);
      objc_msgSend(*(id *)(a1 + 32), "setIndividualSessionStartTimestamp:", v39);
      v59 = *(void **)(a1 + 32);
      v51 = v67;
      v60 = v58;
      v54 = &v83;
      v52 = &v82;
      objc_msgSend(v59, "setIndividualSessionStartReason:", v60);
      v28 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "trackInteractionWithFeatureNamed:duration:", CFSTR("SplitViewSession"), v48);
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __63__SBSplitViewSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_5;
      v70[3] = &unk_1E8EAD808;
      v52 = &v71;
      v71 = *(id *)(a1 + 32);
      v63 = v43;
      v72 = v43;
      v62 = &v73;
      v53 = v44;
      v54 = &v72;
      v73 = v53;
      v55 = &v74;
      v64 = v41;
      v74 = v41;
      v78 = v39 - v46;
      v80 = v49;
      v56 = &v75;
      v75 = v68;
      v79 = v48;
      v57 = &v76;
      v76 = v69;
      v51 = v67;
      v77 = v67;
      objc_msgSend(v6, "stateForQueryName:completion:", 5, v70);

      v28 = 0;
    }

    v50 = 0;
    v43 = v63;
    v41 = v64;
LABEL_20:

    if (!v50)
      goto LABEL_22;
LABEL_21:
    v28 = 1;
    goto LABEL_22;
  }
  if (a2 != 48)
    goto LABEL_21;
  objc_msgSend(v5, "eventPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (!v9)
  {

    goto LABEL_21;
  }
  objc_msgSend(v7, "timestamp");
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "aggregateSessionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "aggregateSessionStartReason");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "aggregateSessionStartTimestamp");
  v16 = v11 - v15;
  objc_msgSend(*(id *)(a1 + 32), "individualSessionStartReason");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "individualSessionStartTimestamp");
  v19 = v18;
  objc_msgSend(*(id *)(a1 + 32), "individualSessionPrimaryBundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "individualSessionSideBundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend((id)SBApp, "isHardwareKeyboardAttached");
  objc_msgSend(*(id *)(a1 + 40), "trackInteractionWithFeatureNamed:duration:", CFSTR("SplitViewSession"), v19);
  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __63__SBSplitViewSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_3;
  v89[3] = &unk_1E8EAD808;
  v90 = *(id *)(a1 + 32);
  v91 = v13;
  v92 = v14;
  v93 = CFSTR("Lock");
  v99 = v22;
  v97 = v16;
  v98 = v19;
  v94 = v17;
  v95 = v20;
  v96 = v21;
  v23 = v21;
  v24 = v20;
  v25 = v17;
  v26 = v14;
  v27 = v13;
  objc_msgSend(v6, "stateForQueryName:completion:", 5, v89);

  v28 = 0;
LABEL_22:

  return v28;
}

uint64_t __63__SBSplitViewSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v6;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  objc_msgSend(*(id *)(a1 + 32), "_sendAggregateSessionCoreAnalyticsEventWithIdentifier:startReason:endReason:duration:doNotDisturbActive:hardwareKeyboardAttached:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v4, *(unsigned __int8 *)(a1 + 104), *(double *)(a1 + 88));
  LOBYTE(v6) = *(_BYTE *)(a1 + 104);
  return objc_msgSend(*(id *)(a1 + 32), "_sendIndividualSessionCoreAnalyticsEventWithAggregateIdentifier:startReason:endReason:duration:primaryBundleIdentifier:sideBundleIdentifier:doNotDisturbActive:hardwareKeyboardAttached:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v4, *(double *)(a1 + 96), v6);
}

uint64_t __63__SBSplitViewSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v6;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  LOBYTE(v6) = *(_BYTE *)(a1 + 88);
  return objc_msgSend(*(id *)(a1 + 32), "_sendIndividualSessionCoreAnalyticsEventWithAggregateIdentifier:startReason:endReason:duration:primaryBundleIdentifier:sideBundleIdentifier:doNotDisturbActive:hardwareKeyboardAttached:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v4, *(double *)(a1 + 80), v6);
}

uint64_t __63__SBSplitViewSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v6;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  objc_msgSend(*(id *)(a1 + 32), "_sendAggregateSessionCoreAnalyticsEventWithIdentifier:startReason:endReason:duration:doNotDisturbActive:hardwareKeyboardAttached:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v4, *(unsigned __int8 *)(a1 + 104), *(double *)(a1 + 88));
  LOBYTE(v6) = *(_BYTE *)(a1 + 104);
  return objc_msgSend(*(id *)(a1 + 32), "_sendIndividualSessionCoreAnalyticsEventWithAggregateIdentifier:startReason:endReason:duration:primaryBundleIdentifier:sideBundleIdentifier:doNotDisturbActive:hardwareKeyboardAttached:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v4, *(double *)(a1 + 96), v6);
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

id __67__SBSplitViewSessionMetric_sendCoreAnalyticsEventWithName_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)_sendAggregateSessionCoreAnalyticsEventWithIdentifier:(id)a3 startReason:(id)a4 endReason:(id)a5 duration:(double)a6 doNotDisturbActive:(BOOL)a7 hardwareKeyboardAttached:(BOOL)a8
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
  v23[0] = CFSTR("ID");
  v23[1] = CFSTR("StartReason");
  v24[0] = a3;
  v24[1] = a4;
  v24[2] = a5;
  v23[2] = CFSTR("EndReason");
  v23[3] = CFSTR("Duration");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v14, "numberWithDouble:", a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v18;
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

  LOBYTE(self) = -[SBSplitViewSessionMetric sendCoreAnalyticsEventWithName:payload:](self, "sendCoreAnalyticsEventWithName:payload:", CFSTR("com.apple.SpringBoard.Analytics.SplitViewSession.Aggregate"), v21);
  return (char)self;
}

- (BOOL)_sendIndividualSessionCoreAnalyticsEventWithAggregateIdentifier:(id)a3 startReason:(id)a4 endReason:(id)a5 duration:(double)a6 primaryBundleIdentifier:(id)a7 sideBundleIdentifier:(id)a8 doNotDisturbActive:(BOOL)a9 hardwareKeyboardAttached:(BOOL)a10
{
  _BOOL8 v10;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  _QWORD v29[8];
  _QWORD v30[10];

  v10 = a9;
  v30[8] = *MEMORY[0x1E0C80C00];
  v29[0] = CFSTR("AggregateID");
  v29[1] = CFSTR("StartReason");
  v30[0] = a3;
  v30[1] = a4;
  v30[2] = a5;
  v29[2] = CFSTR("EndReason");
  v29[3] = CFSTR("Duration");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v17 = a8;
  v18 = a7;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  objc_msgSend(v16, "numberWithDouble:", a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v22;
  v30[4] = v18;
  v29[4] = CFSTR("PrimaryBundleID");
  v29[5] = CFSTR("SideBundleID");
  v30[5] = v17;
  v29[6] = CFSTR("IsDoNotDisturbActive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v23;
  v29[7] = CFSTR("IsHardwareKeyboardAttached");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = -[SBSplitViewSessionMetric sendCoreAnalyticsEventWithName:payload:](self, "sendCoreAnalyticsEventWithName:payload:", CFSTR("com.apple.SpringBoard.Analytics.SplitViewSession.Individual"), v25);
  return v26;
}

- (NSUUID)aggregateSessionIdentifier
{
  return self->_aggregateSessionIdentifier;
}

- (void)setAggregateSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)aggregateSessionStartTimestamp
{
  return self->_aggregateSessionStartTimestamp;
}

- (void)setAggregateSessionStartTimestamp:(double)a3
{
  self->_aggregateSessionStartTimestamp = a3;
}

- (NSString)aggregateSessionStartReason
{
  return self->_aggregateSessionStartReason;
}

- (void)setAggregateSessionStartReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)individualSessionStartTimestamp
{
  return self->_individualSessionStartTimestamp;
}

- (void)setIndividualSessionStartTimestamp:(double)a3
{
  self->_individualSessionStartTimestamp = a3;
}

- (NSString)individualSessionStartReason
{
  return self->_individualSessionStartReason;
}

- (void)setIndividualSessionStartReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_individualSessionSideBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_individualSessionPrimaryBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_individualSessionStartReason, 0);
  objc_storeStrong((id *)&self->_aggregateSessionStartReason, 0);
  objc_storeStrong((id *)&self->_aggregateSessionIdentifier, 0);
}

@end

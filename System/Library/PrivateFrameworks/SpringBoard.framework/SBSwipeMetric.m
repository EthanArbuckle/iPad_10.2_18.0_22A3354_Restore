@implementation SBSwipeMetric

uint64_t __21__SBSwipeMetric_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;

  if (a2 != 33)
    return 0;
  objc_msgSend(a3, "eventPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32) + 24;
  *(double *)v5 = CGPointFromState(v4);
  *(_QWORD *)(v5 + 8) = v6;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DABEF8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DABF08]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  *(double *)(*(_QWORD *)(a1 + 32) + 48) = v9 * 1000.0;

  return 1;
}

- (SBSwipeMetric)init
{
  SBSwipeMetric *v2;
  SBSwipeMetric *v3;
  uint64_t v4;
  SBSwipeMetric *v5;
  void *v6;
  SBSwipeMetric *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  SBSwipeMetric *v14;
  _QWORD v15[4];
  SBSwipeMetric *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SBSwipeMetric;
  v2 = -[SBAnalyticsStateMachineEventHandler init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __21__SBSwipeMetric_init__block_invoke;
    v15[3] = &unk_1E8E9E018;
    v5 = v2;
    v16 = v5;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 0, v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAnalyticsStateMachineEventHandler addEdge:](v5, "addEdge:", v6);
    v10 = v4;
    v11 = 3221225472;
    v12 = __21__SBSwipeMetric_init__block_invoke_2;
    v13 = &unk_1E8E9E018;
    v7 = v5;
    v14 = v7;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 1, &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAnalyticsStateMachineEventHandler addEdge:](v7, "addEdge:", v8, v10, v11, v12, v13);

  }
  return v3;
}

uint64_t __21__SBSwipeMetric_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  double v5;
  double v6;
  CGFloat v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  unint64_t v31;
  const __CFString *v32;
  NSObject *v34;
  const __CFString *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;
  CGPoint v50;

  v49 = *MEMORY[0x1E0C80C00];
  if (a2 != 34)
    return 1;
  objc_msgSend(a3, "eventPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CGPointFromState(v4);
  v7 = v6;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DABED8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DABEE8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DABEF0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DABEE0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DABF00]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appSwitcherDefaults");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v23, "bottomEdgeGestureSwipeCount");
  objc_msgSend(v23, "setBottomEdgeGestureSwipeCount:", v24 + 1);
  SBLogSystemGestureHome();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v46 = v24;
    _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_INFO, "----SWIPE BEGIN %lu----", buf, 0xCu);
  }

  SBLogSystemGestureHome();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    NSStringFromCGPoint(*(CGPoint *)(*(_QWORD *)(a1 + 32) + 24));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v46 = (uint64_t)v27;
    _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_INFO, "initialLocation: %{public}@", buf, 0xCu);

  }
  SBLogSystemGestureHome();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v50.x = v5;
    v50.y = v7;
    NSStringFromCGPoint(v50);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v46 = (uint64_t)v29;
    _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_INFO, "finalLocation: %{public}@", buf, 0xCu);

  }
  SBLogSystemGestureHome();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) - 1;
    if (v31 > 3)
      v32 = CFSTR("unknown");
    else
      v32 = off_1E8EB59E8[v31];
    *(_DWORD *)buf = 138543362;
    v46 = (uint64_t)v32;
    _os_log_impl(&dword_1D0540000, v30, OS_LOG_TYPE_INFO, "orientation: %{public}@", buf, 0xCu);
  }

  SBLogSystemGestureHome();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    if (v9 > 3)
      v35 = CFSTR("home");
    else
      v35 = off_1E8EB5A08[v9];
    *(_DWORD *)buf = 138543362;
    v46 = (uint64_t)v35;
    _os_log_impl(&dword_1D0540000, v34, OS_LOG_TYPE_INFO, "finalAction: %{public}@", buf, 0xCu);
  }

  SBLogSystemGestureHome();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v46 = v21;
    _os_log_impl(&dword_1D0540000, v36, OS_LOG_TYPE_INFO, "peakSpeed: %g", buf, 0xCu);
  }

  SBLogSystemGestureHome();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v46 = v12;
    v47 = 2048;
    v48 = v15;
    _os_log_impl(&dword_1D0540000, v37, OS_LOG_TYPE_INFO, "liftOffVelocity: (%g, %g)", buf, 0x16u);
  }

  SBLogSystemGestureHome();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v46 = v18;
    _os_log_impl(&dword_1D0540000, v38, OS_LOG_TYPE_INFO, "liftOffAngle: %g", buf, 0xCu);
  }

  SBLogSystemGestureHome();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    v40 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    *(_DWORD *)buf = 134217984;
    v46 = v40;
    _os_log_impl(&dword_1D0540000, v39, OS_LOG_TYPE_INFO, "timestampDelta: %g", buf, 0xCu);
  }

  SBLogSystemGestureHome();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "timestamp");
    *(_DWORD *)buf = 134217984;
    v46 = v42;
    _os_log_impl(&dword_1D0540000, v41, OS_LOG_TYPE_INFO, "timestamp: %g", buf, 0xCu);
  }

  SBLogSystemGestureHome();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v46 = v24;
    _os_log_impl(&dword_1D0540000, v43, OS_LOG_TYPE_INFO, "----SWIPE END %lu----", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.d22.swipe.%lu."), v24);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "stringByAppendingString:", CFSTR("il.x"));
  ADClientSetValueForScalarKey();
  objc_msgSend(v44, "stringByAppendingString:", CFSTR("il.y"));
  ADClientSetValueForScalarKey();
  objc_msgSend(v44, "stringByAppendingString:", CFSTR("fl.x"));
  ADClientSetValueForScalarKey();
  objc_msgSend(v44, "stringByAppendingString:", CFSTR("fl.y"));
  ADClientSetValueForScalarKey();
  objc_msgSend(v44, "stringByAppendingString:", CFSTR("o"));
  ADClientSetValueForScalarKey();
  objc_msgSend(v44, "stringByAppendingString:", CFSTR("ps"));
  ADClientSetValueForScalarKey();
  objc_msgSend(v44, "stringByAppendingString:", CFSTR("lov.x"));
  ADClientSetValueForScalarKey();
  objc_msgSend(v44, "stringByAppendingString:", CFSTR("lov.y"));
  ADClientSetValueForScalarKey();
  objc_msgSend(v44, "stringByAppendingString:", CFSTR("loa"));
  ADClientSetValueForScalarKey();
  objc_msgSend(v44, "stringByAppendingString:", CFSTR("ts"));
  objc_msgSend(v4, "timestamp");
  ADClientSetValueForScalarKey();
  objc_msgSend(v44, "stringByAppendingString:", CFSTR("tsd"));
  ADClientSetValueForScalarKey();
  objc_msgSend(v44, "stringByAppendingString:", CFSTR("fa"));
  ADClientSetValueForScalarKey();

  return 0;
}

@end

@implementation SBUILiveActivityMetrics

+ (id)defaultMetrics
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc((Class)getACUISActivityMetricsRequestClass());
  objc_msgSend(a1, "lockScreenNotificationListItemMetricsWithScaleFactor:", 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithLockScreenMetrics:", v4);

  if (SBSIsSystemApertureAvailable())
  {
    objc_msgSend(a1, "_systemApertureMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSystemApertureMetrics:", v6);

  }
  return v5;
}

+ (id)ambientDefaultMetrics
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayCornerRadius");
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nativeBounds");
  v8 = v7;
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nativeScale");
  v13 = v12;

  objc_msgSend(getACUISSizeDimensionRequestClass(), "fixed:", v10 / v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getACUISSizeDimensionRequestClass(), "fixed:", v8 / v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc((Class)getACUISEdgeInsetsClass()), "initWithTop:leading:bottom:trailing:", 0.0, 30.0, 0.0, 34.0);
  v17 = (void *)objc_msgSend(objc_alloc((Class)getACUISActivityItemMetricsRequestClass()), "initWithWidth:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:", v14, v15, v16, v5, 1.0, 1.0);
  v18 = (void *)objc_msgSend(objc_alloc((Class)getACUISActivityMetricsRequestClass()), "initWithLockScreenMetrics:", v17);
  objc_msgSend(v18, "setAmbientMetrics:", v17);

  return v18;
}

+ (id)ambientCompactDefaultMetrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(getACUISSizeDimensionRequestClass(), "fixed:", 40.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getACUISSizeDimensionRequestClass(), "fixed:", 40.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)getACUISActivityItemMetricsRequestClass()), "initWithWidth:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:", v2, v3, 0, 10.0, 1.0, 1.0);
  v5 = (void *)objc_msgSend(objc_alloc((Class)getACUISActivityMetricsRequestClass()), "initWithLockScreenMetrics:", v4);

  return v5;
}

+ (id)ambientWidgetMetrics
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "lockScreenNotificationListItemMetricsWithScaleFactor:", 2.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)getACUISActivityMetricsRequestClass()), "initWithLockScreenMetrics:", v3);
  objc_msgSend(v4, "setAmbientMetrics:", v3);
  objc_msgSend(a1, "_systemApertureMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSystemApertureMetrics:", v5);

  return v4;
}

+ (id)_systemApertureMetrics
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay](SBUISystemApertureLayoutMetrics, "sharedInstanceForEmbeddedDisplay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sensorRegionSize");
  v4 = v3;
  v6 = v5;
  objc_msgSend(v2, "minimumScreenEdgeInsets");
  v8 = v7;
  objc_msgSend(v2, "minimumContinuousCornerRadius");
  v10 = v9;
  objc_msgSend(v2, "maximumLeadingTrailingViewSize");
  v12 = v11;
  v14 = objc_msgSend(objc_alloc((Class)getACUISSizeDimensionRequestClass()), "initWithMinimum:maximum:", 0.0, v13);
  objc_msgSend(getACUISSizeDimensionRequestClass(), "fixed:", v12);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc((Class)getACUISEdgeInsetsClass()), "initWithTop:leading:bottom:trailing:", 7.0, 7.0, 7.0, 7.0);
  v17 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v17, "setTrailing:", 0.0);
  v38 = v17;
  v39 = (void *)objc_msgSend(objc_alloc((Class)getACUISActivityItemMetricsRequestClass()), "initWithWidth:height:cornerRadius:edgeInsets:clipMargin:", v14, v15, v17, v10, 5.0);
  v18 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v18, "setLeading:", 0.0);
  v40 = (void *)v14;
  v37 = (void *)objc_msgSend(objc_alloc((Class)getACUISActivityItemMetricsRequestClass()), "initWithWidth:height:cornerRadius:edgeInsets:clipMargin:", v14, v15, v18, v10, 5.0);
  v19 = objc_alloc((Class)getACUISSizeDimensionRequestClass());
  objc_msgSend(v2, "maximumHorizontalMinimalViewSize");
  v35 = (void *)objc_msgSend(v19, "initWithMinimum:maximum:", 0.0, v20);
  v36 = (void *)v15;
  v21 = (void *)objc_msgSend(objc_alloc((Class)getACUISActivityItemMetricsRequestClass()), "initWithWidth:height:cornerRadius:edgeInsets:clipMargin:", v35, v15, v16, v10, 5.0);
  objc_msgSend(v2, "maximumContinuousCornerRadius");
  v23 = v22;
  objc_msgSend(v2, "minimumExpandedSize");
  v25 = v24;
  objc_msgSend(v2, "maximumExpandedSize");
  objc_msgSend(getACUISSizeDimensionRequestClass(), "fixed:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(objc_alloc((Class)getACUISSizeDimensionRequestClass()), "initWithMinimum:maximum:", v25, 160.0);
  v29 = (void *)objc_msgSend(objc_alloc((Class)getACUISEdgeInsetsClass()), "initWithTop:leading:bottom:trailing:", 18.0, 18.0, 18.0, 18.0);
  v30 = (void *)objc_msgSend(objc_alloc((Class)getACUISActivityItemMetricsRequestClass()), "initWithWidth:height:cornerRadius:edgeInsets:clipMargin:", v27, v28, v29, v23, 13.0);
  v42 = 0;
  v43 = &v42;
  v44 = 0x2050000000;
  v31 = (void *)getACUISSystemApertureMetricsRequestClass_softClass;
  v45 = getACUISSystemApertureMetricsRequestClass_softClass;
  if (!getACUISSystemApertureMetricsRequestClass_softClass)
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __getACUISSystemApertureMetricsRequestClass_block_invoke;
    v41[3] = &unk_1E4C3E458;
    v41[4] = &v42;
    __getACUISSystemApertureMetricsRequestClass_block_invoke((uint64_t)v41);
    v31 = (void *)v43[3];
  }
  v32 = objc_retainAutorelease(v31);
  _Block_object_dispose(&v42, 8);
  v33 = (void *)objc_msgSend([v32 alloc], "initWithObstructionSize:obstructionTopMargin:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:", v30, v39, v37, v21, v4, v6, v8);

  return v33;
}

+ (id)lockScreenNotificationListItemMetricsWithScaleFactor:(double)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double (*v14)(void);
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    +[SBUISearchUtilities idealSearchPlatterWidth](SBUISearchUtilities, "idealSearchPlatterWidth");
    v7 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nativeBounds");
    v10 = v9;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nativeScale");
    v13 = v12;

    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v14 = (double (*)(void))getNCNotificationStructuredListViewControllerInsetMarginHorizontalSymbolLoc_ptr;
    v23 = getNCNotificationStructuredListViewControllerInsetMarginHorizontalSymbolLoc_ptr;
    if (!getNCNotificationStructuredListViewControllerInsetMarginHorizontalSymbolLoc_ptr)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __getNCNotificationStructuredListViewControllerInsetMarginHorizontalSymbolLoc_block_invoke;
      v19[3] = &unk_1E4C3E458;
      v19[4] = &v20;
      __getNCNotificationStructuredListViewControllerInsetMarginHorizontalSymbolLoc_block_invoke((uint64_t)v19);
      v14 = (double (*)(void))v21[3];
    }
    _Block_object_dispose(&v20, 8);
    if (!v14)
      +[SBUILiveActivityMetrics lockScreenNotificationListItemMetricsWithScaleFactor:].cold.1();
    v7 = v10 / v13 + v14() * -2.0;
  }
  objc_msgSend(getACUISSizeDimensionRequestClass(), "fixed:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc((Class)getACUISSizeDimensionRequestClass()), "initWithMinimum:maximum:", 64.0, 160.0);
  v17 = (void *)objc_msgSend(objc_alloc((Class)getACUISActivityItemMetricsRequestClass()), "initWithWidth:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:", v15, v16, 0, 23.5, 1.0, a3);

  return v17;
}

+ (void)lockScreenNotificationListItemMetricsWithScaleFactor:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGFloat soft_NCNotificationStructuredListViewControllerInsetMarginHorizontal(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBUILiveActivityMetrics.m"), 40, CFSTR("%s"), dlerror());

  __break(1u);
}

@end

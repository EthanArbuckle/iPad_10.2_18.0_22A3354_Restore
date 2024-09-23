@implementation PICurvesRGBAutoCalculator

- (id)computeCurvesForImageHistogram:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  _QWORD *v11;
  os_log_t *v12;
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  NSObject *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v37[4];
  _QWORD v38[4];
  uint8_t buf[4];
  double v40;
  __int16 v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "red");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "percentile:", 0.001);
  v6 = v5;

  objc_msgSend(v3, "red");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "percentile:", 0.999);
  v9 = v8;

  +[PICurvesAutoCalculator autoValuesForBlackPoint:whitePoint:](PICurvesAutoCalculator, "autoValuesForBlackPoint:whitePoint:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_97_21895);
  v12 = (os_log_t *)MEMORY[0x1E0D52398];
  v13 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v40 = v6;
    v41 = 2048;
    v42 = v9;
    _os_log_debug_impl(&dword_1A6382000, v13, OS_LOG_TYPE_DEBUG, "red curve: blackPoint = %f, whitePoint = %f", buf, 0x16u);
  }
  objc_msgSend(v3, "green");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "percentile:", 0.001);
  v16 = v15;

  objc_msgSend(v3, "green");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "percentile:", 0.999);
  v19 = v18;

  +[PICurvesAutoCalculator autoValuesForBlackPoint:whitePoint:](PICurvesAutoCalculator, "autoValuesForBlackPoint:whitePoint:", v16, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (*v11 != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_97_21895);
  v21 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v40 = v16;
    v41 = 2048;
    v42 = v19;
    _os_log_debug_impl(&dword_1A6382000, v21, OS_LOG_TYPE_DEBUG, "green curve: blackPoint = %f, whitePoint = %f", buf, 0x16u);
  }
  objc_msgSend(v3, "blue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "percentile:", 0.001);
  v24 = v23;

  objc_msgSend(v3, "blue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "percentile:", 0.999);
  v27 = v26;

  +[PICurvesAutoCalculator autoValuesForBlackPoint:whitePoint:](PICurvesAutoCalculator, "autoValuesForBlackPoint:whitePoint:", v24, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (*v11 != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_97_21895);
  v29 = *v12;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v40 = v24;
    v41 = 2048;
    v42 = v27;
    _os_log_debug_impl(&dword_1A6382000, v29, OS_LOG_TYPE_DEBUG, "blue curve: blackPoint = %f, whitePoint = %f", buf, 0x16u);
  }
  +[PICurvesAutoCalculator _defaultCurveArray](PICurvesAutoCalculator, "_defaultCurveArray");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICurvesAutoCalculator dictionariesFromPoints:](PICurvesAutoCalculator, "dictionariesFromPoints:", v30, CFSTR("RGBCurvePoints"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v31;
  v37[1] = CFSTR("redCurvePoints");
  +[PICurvesAutoCalculator dictionariesFromPoints:](PICurvesAutoCalculator, "dictionariesFromPoints:", v10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v32;
  v37[2] = CFSTR("greenCurvePoints");
  +[PICurvesAutoCalculator dictionariesFromPoints:](PICurvesAutoCalculator, "dictionariesFromPoints:", v20);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v33;
  v37[3] = CFSTR("blueCurvePoints");
  +[PICurvesAutoCalculator dictionariesFromPoints:](PICurvesAutoCalculator, "dictionariesFromPoints:", v28);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v34;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

@end

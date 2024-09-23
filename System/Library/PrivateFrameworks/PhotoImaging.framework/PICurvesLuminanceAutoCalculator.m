@implementation PICurvesLuminanceAutoCalculator

- (id)computeCurvesForImageHistogram:(id)a3
{
  uint64_t v5;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  NSObject *v14;
  __int128 v15;
  uint64_t v16;
  PICurveControlPoint *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  PICurveControlPoint *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  _QWORD v46[4];
  uint8_t buf[4];
  _BYTE v48[14];
  __int16 v49;
  uint64_t v50;
  _BYTE v51[128];
  _QWORD v52[8];
  uint64_t v53;
  double v54;
  uint64_t v55;

  v5 = 0;
  v55 = *MEMORY[0x1E0C80C00];
  v6 = &v53;
  do
  {
    objc_msgSend(a3, "luminance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PICurvesLuminanceAutoCalculator curvePointAtIndex:blackPoint:whitePoint:histogram:](self, "curvePointAtIndex:blackPoint:whitePoint:histogram:", v5, v7, 0.001, 0.999);
    *(v6 - 1) = v8;
    *v6 = v9;

    ++v5;
    v6 += 2;
  }
  while (v5 != 5);
  v10 = v52[0];
  v11 = v54;
  +[PICurvesAutoCalculator autoValuesForBlackPoint:whitePoint:](PICurvesAutoCalculator, "autoValuesForBlackPoint:whitePoint:", *(double *)v52, v54);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_97_21895);
  v14 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v48 = v10;
    _os_log_debug_impl(&dword_1A6382000, v14, OS_LOG_TYPE_DEBUG, "s-curve black: %f", buf, 0xCu);
  }
  v16 = 1;
  *(_QWORD *)&v15 = 67109632;
  v40 = v15;
  do
  {
    v17 = -[PICurveControlPoint initWithX:y:editable:]([PICurveControlPoint alloc], "initWithX:y:editable:", 1, *(double *)&v52[2 * v16], *(double *)&v52[2 * v16 + 1]);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v18 = v13;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (v19)
    {
      v20 = v19;
      v21 = 0;
      v22 = *(_QWORD *)v42;
      while (2)
      {
        v23 = 0;
        v24 = v21 + v20;
        do
        {
          if (*(_QWORD *)v42 != v22)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v23), "x", v40);
          v26 = v25;
          -[PICurveControlPoint x](v17, "x");
          if (v26 > v27)
          {
            v24 = v21 + v23;
            goto LABEL_19;
          }
          ++v23;
        }
        while (v20 != v23);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
        v21 = v24;
        if (v20)
          continue;
        break;
      }
    }
    else
    {
      v24 = 0;
    }
LABEL_19:

    objc_msgSend(v18, "insertObject:atIndex:", v17, v24);
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_97_21895);
    v28 = (void *)*MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
    {
      v29 = v28;
      -[PICurveControlPoint x](v17, "x");
      v31 = v30;
      -[PICurveControlPoint y](v17, "y");
      *(_DWORD *)buf = v40;
      *(_DWORD *)v48 = v16;
      *(_WORD *)&v48[4] = 2048;
      *(_QWORD *)&v48[6] = v31;
      v49 = 2048;
      v50 = v32;
      _os_log_debug_impl(&dword_1A6382000, v29, OS_LOG_TYPE_DEBUG, "s-curve point %d: (%f, %f)", buf, 0x1Cu);

    }
    ++v16;
  }
  while (v16 != 4);
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_97_21895);
  v33 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(double *)v48 = v11;
    _os_log_debug_impl(&dword_1A6382000, v33, OS_LOG_TYPE_DEBUG, "s-curve white: %f", buf, 0xCu);
  }
  v34 = -[PICurveControlPoint initWithX:y:editable:]([PICurveControlPoint alloc], "initWithX:y:editable:", 1, 1.99, 1.99);
  objc_msgSend(v18, "addObject:", v34);

  +[PICurvesAutoCalculator _defaultCurveArray](PICurvesAutoCalculator, "_defaultCurveArray");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICurvesAutoCalculator dictionariesFromPoints:](PICurvesAutoCalculator, "dictionariesFromPoints:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = CFSTR("RGBCurvePoints");
  +[PICurvesAutoCalculator dictionariesFromPoints:](PICurvesAutoCalculator, "dictionariesFromPoints:", v18);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v37;
  v46[1] = v36;
  v45[1] = CFSTR("redCurvePoints");
  v45[2] = CFSTR("greenCurvePoints");
  v45[3] = CFSTR("blueCurvePoints");
  v46[2] = v36;
  v46[3] = v36;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (CGPoint)curvePointAtIndex:(int)a3 blackPoint:(double)a4 whitePoint:(double)a5 histogram:(id)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  double *v31;
  double v32;
  double v33;
  double *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  __int128 v42;
  uint64_t v43;
  double v44;
  __int128 v45;
  __int128 v46;
  double v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  _OWORD v51[5];
  uint64_t v52;
  CGPoint result;

  v52 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = 0;
  v51[2] = xmmword_1A64DDAF0;
  v51[3] = unk_1A64DDB00;
  v51[4] = xmmword_1A64DDB10;
  v51[0] = xmmword_1A64DDAD0;
  v51[1] = unk_1A64DDAE0;
  v47 = 0.0;
  v48 = 0;
  v49 = xmmword_1A64DDF40;
  v50 = xmmword_1A64DDF50;
  v45 = 0u;
  v46 = 0u;
  v41 = a4;
  v42 = xmmword_1A64DDF40;
  v43 = 0x3FE8000000000000;
  v44 = a5;
  do
  {
    objc_msgSend(v9, "percentile:", *(double *)((char *)&v41 + v10));
    *(_QWORD *)((char *)&v45 + v10) = v11;
    v10 += 8;
  }
  while (v10 != 40);
  v12 = 0;
  v39 = 0.0;
  v40 = 0.0;
  do
  {
    objc_msgSend(v9, "percentile:", *(double *)&qword_1A64DDFC0[v12]);
    *(_QWORD *)((char *)&v39 + v12 * 8) = v13;
    ++v12;
  }
  while (v12 != 2);
  v14 = v39;
  if (v39 > 0.01 || (v14 = v40, v40 > 0.01))
  {
    v16 = fmin((v14 + -0.01) / 0.03, 1.0);
    v15 = (1.0 - v16) * *(double *)&v45 + v16 * v14;
  }
  else
  {
    v15 = *(double *)&v45;
  }
  v17 = 0;
  v18 = fmin(v15 + 1.0 - v47, 1.0);
  v19 = v15 * (sqrt(v15) * -0.65 + 1.0) * 0.75;
  v20 = (1.0 - v47) * fmin(fmax((1.0 - v47) * -0.8 + 1.0, 0.6), 1.0) * -0.5 + 1.0;
  v21 = 1.0 / (v20 - v19);
  *(double *)&v45 = v19;
  *((double *)&v45 + 1) = (*((double *)&v45 + 1)
                         + (*(double *)&v46 - v19 + 1.0) * v19
                         + (*(double *)&v46 - v19 + 1.0) * *(double *)&v46)
                        / ((*(double *)&v46 - v19) * 2.0 + 3.0);
  *((double *)&v46 + 1) = (*((double *)&v46 + 1)
                         + (v20 - *(double *)&v46 + 1.0) * v20
                         + (v20 - *(double *)&v46 + 1.0) * *(double *)&v46)
                        / ((v20 - *(double *)&v46) * 2.0 + 3.0);
  v47 = v20;
  v22 = fmax(v18 * -2.0 + 1.0, 0.0);
  v23 = (*(double *)&v46 - v19) * v21;
  v24 = (1.0 - v22) * v21;
  *(double *)&v49 = v24 * (*((double *)&v45 + 1) - v19)
                  + v22 * fmin((v23 + 0.0) * 0.5, v21 * (*((double *)&v45 + 1) - v19));
  *((double *)&v49 + 1) = v23;
  *(double *)&v50 = v24 * (*((double *)&v46 + 1) - v19)
                  + v22 * fmax((v23 + 1.0) * 0.5, v21 * (*((double *)&v46 + 1) - v19));
  v25 = (_QWORD *)v51 + 1;
  do
  {
    v26 = *(uint64_t *)((char *)&v48 + v17);
    *(v25 - 1) = *(_QWORD *)((char *)&v45 + v17);
    *v25 = v26;
    v17 += 8;
    v25 += 2;
  }
  while (v17 != 40);
  v27 = 0;
  v28 = 24;
  do
  {
    v29 = *(double *)&v51[v27];
    v30 = v28;
    do
    {
      v31 = (double *)((char *)v51 + v30);
      v32 = *(double *)((char *)&v50 + v30 + 8);
      if (v29 == v32)
        *(v31 - 3) = v29 + -0.001;
      v33 = *(v31 - 2);
      if (v33 == *v31)
        *(v31 - 2) = v33 + -0.001;
      v30 += 16;
      v29 = v32;
    }
    while (v30 != 88);
    ++v27;
    v28 += 16;
  }
  while (v27 != 4);
  v34 = (double *)&v51[a3 % 5];
  v35 = *v34;
  v36 = v34[1];

  v37 = v35;
  v38 = v36;
  result.y = v38;
  result.x = v37;
  return result;
}

@end

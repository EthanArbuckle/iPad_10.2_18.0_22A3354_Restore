@implementation RTParkingQualityProvider

- (int)indexOfSmallestElement:(double *)a3 size:(int)a4
{
  int result;
  uint64_t i;

  if (a4 < 2)
    return 0;
  result = 0;
  for (i = 1; i != a4; ++i)
  {
    if (a3[i] < a3[result])
      result = i;
  }
  return result;
}

- (RTParkingQualityProvider)init
{
  RTParkingQualityProvider *v2;
  RTParkingQualityProvider *v3;
  uint64_t v4;
  NSMutableArray *movingHistorgram;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RTParkingQualityProvider;
  v2 = -[RTParkingQualityProvider init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_parkingQualityIndicator = 0;
    v4 = objc_opt_new();
    movingHistorgram = v3->_movingHistorgram;
    v3->_movingHistorgram = (NSMutableArray *)v4;

  }
  return v3;
}

- (void)reset
{
  void *v3;

  -[RTParkingQualityProvider movingHistorgram](self, "movingHistorgram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[RTParkingQualityProvider setParkingQualityIndicator:](self, "setParkingQualityIndicator:", 0);
}

- (id)getHistogramFromSamples:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  unint64_t v6;
  void *v7;
  double v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  for (i = 0; i != 17; ++i)
    objc_msgSend(v4, "setObject:atIndexedSubscript:", &unk_1E9329360, i);
  if (objc_msgSend(v3, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = (int)(v8 / 5.0);

      v10 = v9 & ~(v9 >> 31);
      if (v10 >= 0x10)
        v11 = 16;
      else
        v11 = v10;
      v12 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "numberWithInt:", objc_msgSend(v13, "intValue") + 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:atIndexedSubscript:", v14, v11);

      ++v6;
    }
    while (objc_msgSend(v3, "count") > v6);
  }

  return v4;
}

- (id)getCdfFromHistogram:(id)a3 numSamples:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  NSObject *v23;
  uint8_t v25[16];

  v5 = a3;
  v6 = v5;
  if (a4 >= 1.0 && objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_opt_new();
    if (objc_msgSend(v6, "count"))
    {
      v8 = 0;
      do
        objc_msgSend(v7, "setObject:atIndexedSubscript:", &unk_1E9329360, v8++);
      while (objc_msgSend(v6, "count") > v8);
    }
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:atIndexedSubscript:", v9, 0);

    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      v10 = 1;
      do
      {
        v11 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "objectAtIndexedSubscript:", v10 - 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v14 = v13;
        objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        objc_msgSend(v11, "numberWithDouble:", v14 + v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:atIndexedSubscript:", v17, v10);

        ++v10;
      }
      while (objc_msgSend(v7, "count") > v10);
    }
    if (objc_msgSend(v7, "count"))
    {
      v18 = 0;
      do
      {
        v19 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "objectAtIndexedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "doubleValue");
        objc_msgSend(v19, "numberWithDouble:", v21 * 100.0 / a4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:atIndexedSubscript:", v22, v18);

        ++v18;
      }
      while (objc_msgSend(v7, "count") > v18);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "noSamples <1 or histogram is empty", v25, 2u);
    }

    v7 = 0;
  }

  return v7;
}

- (unint64_t)calculateParkingQualityWithLocations:(id)a3 parkingTimestamp:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  unint64_t v19;
  unint64_t v20;

  v6 = a3;
  -[RTParkingQualityProvider reset](self, "reset");
  v7 = (void *)objc_opt_new();
  if (objc_msgSend(v6, "count"))
  {
    v8 = 0;
    v9 = 1;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "horizontalAccuracy");
      if (v11 > 0.0)
      {
        objc_msgSend(v10, "timestamp");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceReferenceDate");
        if (a4 - v13 <= 10.0)
        {
          objc_msgSend(v10, "timestamp");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "timeIntervalSinceReferenceDate");
          v16 = v15 - a4;

          if (v16 > 16.0
            || objc_msgSend(v10, "type") != 1
            && objc_msgSend(v10, "type") != 3
            && objc_msgSend(v10, "type") != 2
            && objc_msgSend(v10, "type") != 10)
          {
            goto LABEL_12;
          }
          v17 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v10, "horizontalAccuracy");
          objc_msgSend(v17, "numberWithDouble:");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v12);
        }

      }
LABEL_12:

      v8 = v9;
    }
    while (objc_msgSend(v6, "count") > (unint64_t)v9++);
  }
  if (objc_msgSend(v7, "count"))
    v19 = -[RTParkingQualityProvider classifySamples:](self, "classifySamples:", v7);
  else
    v19 = 0;
  v20 = -[RTParkingQualityProvider parkingQualityToLocationQuality:](self, "parkingQualityToLocationQuality:", v19);

  return v20;
}

- (unint64_t)classifySamples:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  RTParkingQualityProvider *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t k;
  double v45;
  NSObject *v46;
  unint64_t v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
  uint64_t v58;
  int v59;
  char *v60;
  char *v61;
  char *v62;
  double v63;
  double v64;
  unint64_t parkingQualityIndicator;
  uint64_t v66;
  NSObject *v67;
  void *v69;
  void *v70;
  id v71;
  RTParkingQualityProvider *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t v85[128];
  uint8_t buf[8];
  double v87;
  double v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (objc_msgSend(v4, "count"))
  {
    v6 = 0;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      if (v8 <= 0.0)
        goto LABEL_6;
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10;

      if (v11 < 65000.0)
        break;
LABEL_7:
      if (objc_msgSend(v4, "count") <= (unint64_t)++v6)
        goto LABEL_8;
    }
    objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);
LABEL_6:

    goto LABEL_7;
  }
LABEL_8:
  if (objc_msgSend(v5, "count"))
  {
    -[RTParkingQualityProvider movingHistorgram](self, "movingHistorgram");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 >= 3)
    {
      -[RTParkingQualityProvider movingHistorgram](self, "movingHistorgram");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeLastObject");

      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Window length is larger than the max allowed", buf, 2u);
      }

    }
    -[RTParkingQualityProvider getHistogramFromSamples:](self, "getHistogramFromSamples:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTParkingQualityProvider movingHistorgram](self, "movingHistorgram");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "insertObject:atIndex:", v16, 0);

    -[RTParkingQualityProvider movingHistorgram](self, "movingHistorgram");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      v70 = v5;
      v71 = v4;
      v20 = (void *)objc_opt_new();
      for (i = 0; i != 17; ++i)
        objc_msgSend(v20, "setObject:atIndexedSubscript:", &unk_1E9329360, i);
      -[RTParkingQualityProvider movingHistorgram](self, "movingHistorgram");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

      if (v24)
      {
        v25 = 0;
        v26 = 0;
        do
        {
          v83 = 0u;
          v84 = 0u;
          v81 = 0u;
          v82 = 0u;
          v27 = self;
          -[RTParkingQualityProvider movingHistorgram](self, "movingHistorgram");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
          if (v29)
          {
            v30 = v29;
            LODWORD(v31) = 0;
            v32 = *(_QWORD *)v82;
            do
            {
              for (j = 0; j != v30; ++j)
              {
                if (*(_QWORD *)v82 != v32)
                  objc_enumerationMutation(v28);
                objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * j), "objectAtIndexedSubscript:", v25);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_msgSend(v34, "intValue") + v31;

              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
            }
            while (v30);
          }
          else
          {
            v31 = 0;
          }

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v31);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:atIndexedSubscript:", v35, v25);

          self = v27;
          -[RTParkingQualityProvider movingHistorgram](v27, "movingHistorgram");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "count");

          v25 = ++v26;
        }
        while (v38 > v26);
      }
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v39 = v20;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v78;
        v43 = 0.0;
        v4 = v71;
        do
        {
          for (k = 0; k != v41; ++k)
          {
            if (*(_QWORD *)v78 != v42)
              objc_enumerationMutation(v39);
            objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * k), "doubleValue");
            v43 = v43 + v45;
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
        }
        while (v41);
      }
      else
      {
        v43 = 0.0;
        v4 = v71;
      }

      -[RTParkingQualityProvider getCdfFromHistogram:numSamples:](self, "getCdfFromHistogram:numSamples:", v39, v43);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v48;
      if (!v48)
      {
        -[RTParkingQualityProvider reset](self, "reset");
        v47 = 0;
        v5 = v70;
LABEL_63:

        goto LABEL_64;
      }
      if (objc_msgSend(v48, "count") != 17)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v67 = objc_claimAutoreleasedReturnValue();
        v5 = v70;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v67, OS_LOG_TYPE_ERROR, "unexpected trained cdf data size issue", buf, 2u);
        }

        -[RTParkingQualityProvider reset](self, "reset");
        v47 = 0;
        goto LABEL_63;
      }
      v72 = self;
      *(double *)buf = 0.0;
      v87 = 0.0;
      v88 = 0.0;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v76 = 0u;
      v69 = v49;
      v50 = v49;
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
      if (v51)
      {
        v52 = v51;
        v53 = 0;
        v54 = *(_QWORD *)v74;
        v55 = 0.0;
        v56 = 0.0;
        v57 = 0.0;
        do
        {
          v58 = 0;
          v59 = v53;
          v60 = (char *)&kCDFHigh + 8 * v53;
          v61 = (char *)&kCDFMedium + 8 * v53;
          v62 = (char *)&kCDFLow + 8 * v53;
          do
          {
            if (*(_QWORD *)v74 != v54)
              objc_enumerationMutation(v50);
            objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * v58), "doubleValue");
            v57 = v57 + (v63 - *(double *)&v62[8 * v58]) * (v63 - *(double *)&v62[8 * v58]);
            v56 = v56 + (v63 - *(double *)&v61[8 * v58]) * (v63 - *(double *)&v61[8 * v58]);
            v55 = v55 + (v63 - *(double *)&v60[8 * v58]) * (v63 - *(double *)&v60[8 * v58]);
            v87 = v56;
            v88 = v57;
            *(double *)buf = v55;
            ++v58;
          }
          while (v52 != v58);
          v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
          v53 = v59 + v58;
        }
        while (v52);
      }

      -[RTParkingQualityProvider setParkingQualityIndicator:](v72, "setParkingQualityIndicator:", -[RTParkingQualityProvider indexOfSmallestElement:size:](v72, "indexOfSmallestElement:size:", buf, 3) + 1);
      parkingQualityIndicator = v72->_parkingQualityIndicator;
      if (parkingQualityIndicator == 1)
      {
        v64 = v87 * 0.93;
        v49 = v69;
        v5 = v70;
        if (v87 * 0.93 > *(double *)buf)
        {
LABEL_62:
          v47 = -[RTParkingQualityProvider parkingQualityIndicator](v72, "parkingQualityIndicator", v64);
          goto LABEL_63;
        }
        v66 = 2;
      }
      else
      {
        v49 = v69;
        v5 = v70;
        if (parkingQualityIndicator != 2)
          goto LABEL_62;
        v64 = v88 * 0.98;
        if (v88 * 0.98 > v87)
          goto LABEL_62;
        v66 = 3;
      }
      -[RTParkingQualityProvider setParkingQualityIndicator:](v72, "setParkingQualityIndicator:", v66, v64);
      goto LABEL_62;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_ERROR, " Size of moving histograms was zero", buf, 2u);
    }

  }
  else
  {
    -[RTParkingQualityProvider reset](self, "reset");
  }
  v47 = 0;
LABEL_64:

  return v47;
}

- (unint64_t)parkingQualityToLocationQuality:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  NSObject *v6;
  uint8_t v7[16];
  uint64_t v8;
  uint64_t v9;

  result = a3;
  if (a3 >= 4)
  {
    v8 = v3;
    v9 = v4;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Unrecognized parking quality.", v7, 2u);
    }

    return 0;
  }
  return result;
}

- (NSMutableArray)movingHistorgram
{
  return self->_movingHistorgram;
}

- (void)setMovingHistorgram:(id)a3
{
  objc_storeStrong((id *)&self->_movingHistorgram, a3);
}

- (unint64_t)parkingQualityIndicator
{
  return self->_parkingQualityIndicator;
}

- (void)setParkingQualityIndicator:(unint64_t)a3
{
  self->_parkingQualityIndicator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movingHistorgram, 0);
}

@end

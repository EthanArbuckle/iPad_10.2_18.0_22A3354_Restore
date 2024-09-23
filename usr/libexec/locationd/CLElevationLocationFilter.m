@implementation CLElevationLocationFilter

- (CLElevationLocationFilter)initWithWindowSize:(double)a3
{
  unsigned __int8 v6[8];
  double v7;

  sub_1018BEA14(v6, "ElevationLocationFilterVerticalAccuracyThreshold", &qword_101C2CEA8, 0);
  return -[CLElevationLocationFilter initWithWindowSize:andCadence:andVerticalAccuracyThreshold:](self, "initWithWindowSize:andCadence:andVerticalAccuracyThreshold:", a3, a3 * 0.5, v7);
}

- (CLElevationLocationFilter)initWithWindowSize:(double)a3 andCadence:(double)a4 andVerticalAccuracyThreshold:(double)a5
{
  CLElevationLocationFilter *v8;
  unsigned __int8 v10;
  unsigned __int8 v11[3];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLElevationLocationFilter;
  v8 = -[CLElevationLocationFilter init](&v12, "init");
  if (v8)
  {
    v8->_locationBuffer = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v8->_windowSize = a3;
    v8->_cadence = a4;
    v8->_verticalAccuracyThreshold = a5;
    v8->_firstUnfilteredLocationTime = 1.79769313e308;
    v8->_readyToFilter = 0;
    v10 = 0;
    sub_1018BF25C(v11, "ElevationVerbose", &v10, 0);
    v8->_isVerboseLogging = v11[1];
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_locationBuffer = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLElevationLocationFilter;
  -[CLElevationLocationFilter dealloc](&v3, "dealloc");
}

- (void)reset
{
  -[NSMutableArray removeAllObjects](self->_locationBuffer, "removeAllObjects");
  self->_deltaElevationsInWindow.__end_ = self->_deltaElevationsInWindow.__begin_;
  self->_verticalAccuraciesInWindow.__end_ = self->_verticalAccuraciesInWindow.__begin_;
  self->_firstUnfilteredLocationTime = 1.79769313e308;
  self->_readyToFilter = 0;
}

- (void)append:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  float v10;
  double v11;
  float v12;
  double v13;
  CLLocationFilterEntry *v14;
  double v15;

  objc_msgSend(a3, "latitude");
  v6 = v5;
  objc_msgSend(a3, "longitude");
  v8 = v7;
  objc_msgSend(a3, "horizontalAccuracy");
  v9 = v6;
  v10 = v8;
  v12 = v11;
  if (sub_1013D3788(v9, v10, v12))
  {
    if (self->_firstUnfilteredLocationTime == 1.79769313e308)
    {
      objc_msgSend(a3, "timestamp");
      self->_firstUnfilteredLocationTime = v13;
    }
    v14 = objc_alloc_init(CLLocationFilterEntry);
    objc_msgSend(a3, "timestamp");
    -[CLLocationDBEntry setTimestamp:](v14, "setTimestamp:");
    objc_msgSend(a3, "elevation");
    -[CLLocationDBEntry setElevation:](v14, "setElevation:");
    objc_msgSend(a3, "verticalAccuracy");
    -[CLLocationDBEntry setVerticalAccuracy:](v14, "setVerticalAccuracy:");
    objc_msgSend(a3, "latitude");
    -[CLLocationDBEntry setLatitude:](v14, "setLatitude:");
    objc_msgSend(a3, "longitude");
    -[CLLocationDBEntry setLongitude:](v14, "setLongitude:");
    -[NSMutableArray addObject:](self->_locationBuffer, "addObject:", v14);

    objc_msgSend(a3, "timestamp");
    if (v15 - self->_firstUnfilteredLocationTime > self->_cadence)
      self->_readyToFilter = 1;
  }
}

- (void)fetchFilteredLocations:(id)a3 withElevationArray:(id)a4
{
  double *begin;
  double *end;
  double *v9;
  double v10;
  double v11;
  double *v12;
  double *v13;
  double *v14;
  double v15;
  double v16;
  double v17;
  double *v18;
  double v19;
  double v20;
  double v21;
  double *v22;
  double *v23;
  double *v24;
  double v26;
  double *v27;
  double v28;
  double v29;
  double verticalAccuracyThreshold;
  NSMutableArray *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *j;
  void *v36;
  double v37;
  double v38;
  double v39;
  float v40;
  double v41;
  float v42;
  float v43;
  CLLocationDBEntry *v44;
  NSObject *v45;
  const char *v46;
  uint8_t *v47;
  NSMutableArray *locationBuffer;
  id v49;
  id v50;
  uint64_t v51;
  void *i;
  void *v53;
  double v54;
  void *v55;
  double v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _WORD v65[8];
  _BYTE v66[128];
  uint8_t v67[128];
  uint8_t buf[1640];

  self->_readyToFilter = 0;
  if (objc_msgSend(a4, "count"))
  {
    -[CLElevationLocationFilter _interpolatePressureValuesWithElevationArray:](self, "_interpolatePressureValuesWithElevationArray:", a4);
    if (-[NSMutableArray count](self->_locationBuffer, "count"))
    {
      begin = self->_deltaElevationsInWindow.__begin_;
      end = self->_deltaElevationsInWindow.__end_;
      v9 = begin + 1;
      v10 = *begin;
      if (begin != end && v9 != end)
      {
        v11 = *begin;
        v12 = begin + 1;
        v13 = self->_deltaElevationsInWindow.__begin_;
        v14 = begin + 1;
        do
        {
          v15 = *v14++;
          v16 = v15;
          if (v11 < v15)
          {
            v11 = v16;
            v13 = v12;
          }
          v12 = v14;
        }
        while (v14 != end);
        v17 = *v13;
        v18 = begin + 1;
        do
        {
          v19 = *v18++;
          v20 = v19;
          if (v19 < v10)
          {
            v10 = v20;
            begin = v9;
          }
          v9 = v18;
        }
        while (v18 != end);
        v10 = v17;
      }
      v21 = *begin;
      v22 = self->_verticalAccuraciesInWindow.__begin_;
      v23 = self->_verticalAccuraciesInWindow.__end_;
      v24 = v22 + 1;
      if (v22 != v23 && v24 != v23)
      {
        v26 = *v22;
        v27 = v22 + 1;
        do
        {
          v28 = *v27++;
          v29 = v28;
          if (v28 < v26)
          {
            v26 = v29;
            v22 = v24;
          }
          v24 = v27;
        }
        while (v27 != v23);
      }
      verticalAccuracyThreshold = *v22;
      if (self->_verticalAccuracyThreshold < *v22)
        verticalAccuracyThreshold = self->_verticalAccuracyThreshold;
      if (v10 - v21 >= verticalAccuracyThreshold)
      {
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        locationBuffer = self->_locationBuffer;
        v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](locationBuffer, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
        if (v49)
        {
          v50 = v49;
          v51 = *(_QWORD *)v58;
          while (2)
          {
            for (i = 0; i != v50; i = (char *)i + 1)
            {
              if (*(_QWORD *)v58 != v51)
                objc_enumerationMutation(locationBuffer);
              v53 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
              objc_msgSend(v53, "timestamp");
              if (v54 > self->_firstUnfilteredLocationTime + self->_cadence)
              {
                v55 = v53;
LABEL_58:
                objc_msgSend(v55, "timestamp");
                self->_firstUnfilteredLocationTime = v56;
                return;
              }
            }
            v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](locationBuffer, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
            if (v50)
              continue;
            break;
          }
        }
      }
      else
      {
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v31 = self->_locationBuffer;
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v62;
          while (2)
          {
            for (j = 0; j != v33; j = (char *)j + 1)
            {
              if (*(_QWORD *)v62 != v34)
                objc_enumerationMutation(v31);
              v36 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)j);
              objc_msgSend(v36, "timestamp");
              if (v37 >= self->_firstUnfilteredLocationTime)
              {
                objc_msgSend(v36, "timestamp");
                if (v38 > self->_firstUnfilteredLocationTime + self->_cadence)
                {
                  v55 = v36;
                  goto LABEL_58;
                }
                objc_msgSend(v36, "elevation");
                v40 = v39;
                objc_msgSend(v36, "interpPressure");
                v42 = v41;
                v43 = sub_1013D36B0(v40, v42);
                if (v43 >= 80000.0 && v43 <= 115000.0)
                {
                  v44 = objc_alloc_init(CLLocationDBEntry);
                  objc_msgSend(v36, "timestamp");
                  -[CLLocationDBEntry setTimestamp:](v44, "setTimestamp:");
                  objc_msgSend(v36, "elevation");
                  -[CLLocationDBEntry setElevation:](v44, "setElevation:");
                  objc_msgSend(v36, "verticalAccuracy");
                  -[CLLocationDBEntry setVerticalAccuracy:](v44, "setVerticalAccuracy:");
                  objc_msgSend(v36, "interpPressure");
                  -[CLLocationDBEntry setInterpPressure:](v44, "setInterpPressure:");
                  objc_msgSend(v36, "latitude");
                  -[CLLocationDBEntry setLatitude:](v44, "setLatitude:");
                  objc_msgSend(v36, "longitude");
                  -[CLLocationDBEntry setLongitude:](v44, "setLongitude:");
                  objc_msgSend(a3, "addObject:", v44);

                }
              }
            }
            v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
            if (v33)
              continue;
            break;
          }
        }
      }
    }
  }
  else
  {
    if (qword_10229FD70 != -1)
      dispatch_once(&qword_10229FD70, &stru_102190530);
    v45 = qword_10229FD78;
    if (os_log_type_enabled((os_log_t)qword_10229FD78, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "warning: location filter requires a non-empty elevationArray", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FD70 != -1)
        dispatch_once(&qword_10229FD70, &stru_102190530);
      v65[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD78, 2, "warning: location filter requires a non-empty elevationArray", v65, 2);
      v47 = (uint8_t *)v46;
      sub_100512490("Generic", 1, 0, 2, "-[CLElevationLocationFilter fetchFilteredLocations:withElevationArray:]", "%s\n", v46);
      if (v47 != buf)
        free(v47);
    }
  }
}

- (void)aggregateFilteredLocations:(id)a3 andAddTo:(id)a4
{
  CLLocationDBEntry *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  double v31;
  id v32;
  double v33;
  id v34;
  double v35;
  id v36;
  double v37;
  id v38;
  double v39;
  id v40;
  double v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];

  if (objc_msgSend(a3, "count"))
  {
    v6 = objc_alloc_init(CLLocationDBEntry);
    -[CLLocationDBEntry setTimestamp:](v6, "setTimestamp:", 0.0);
    -[CLLocationDBEntry setElevation:](v6, "setElevation:", 0.0);
    -[CLLocationDBEntry setVerticalAccuracy:](v6, "setVerticalAccuracy:", 0.0);
    -[CLLocationDBEntry setInterpPressure:](v6, "setInterpPressure:", 0.0);
    -[CLLocationDBEntry setLatitude:](v6, "setLatitude:", 0.0);
    -[CLLocationDBEntry setLongitude:](v6, "setLongitude:", 0.0);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v43 != v9)
            objc_enumerationMutation(a3);
          v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "timestamp");
          v13 = v12;
          -[CLLocationDBEntry timestamp](v6, "timestamp");
          -[CLLocationDBEntry setTimestamp:](v6, "setTimestamp:", v13 + v14);
          objc_msgSend(v11, "elevation");
          v16 = v15;
          -[CLLocationDBEntry elevation](v6, "elevation");
          -[CLLocationDBEntry setElevation:](v6, "setElevation:", v16 + v17);
          objc_msgSend(v11, "verticalAccuracy");
          v19 = v18;
          -[CLLocationDBEntry verticalAccuracy](v6, "verticalAccuracy");
          -[CLLocationDBEntry setVerticalAccuracy:](v6, "setVerticalAccuracy:", v19 + v20);
          objc_msgSend(v11, "interpPressure");
          v22 = v21;
          -[CLLocationDBEntry interpPressure](v6, "interpPressure");
          -[CLLocationDBEntry setInterpPressure:](v6, "setInterpPressure:", v22 + v23);
          objc_msgSend(v11, "latitude");
          v25 = v24;
          -[CLLocationDBEntry latitude](v6, "latitude");
          -[CLLocationDBEntry setLatitude:](v6, "setLatitude:", v25 + v26);
          objc_msgSend(v11, "longitude");
          v28 = v27;
          -[CLLocationDBEntry longitude](v6, "longitude");
          -[CLLocationDBEntry setLongitude:](v6, "setLongitude:", v28 + v29);
        }
        v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v8);
    }
    v30 = objc_msgSend(a3, "count");
    -[CLLocationDBEntry timestamp](v6, "timestamp");
    -[CLLocationDBEntry setTimestamp:](v6, "setTimestamp:", v31 / (double)(unint64_t)v30);
    v32 = objc_msgSend(a3, "count");
    -[CLLocationDBEntry elevation](v6, "elevation");
    -[CLLocationDBEntry setElevation:](v6, "setElevation:", v33 / (double)(unint64_t)v32);
    v34 = objc_msgSend(a3, "count");
    -[CLLocationDBEntry verticalAccuracy](v6, "verticalAccuracy");
    -[CLLocationDBEntry setVerticalAccuracy:](v6, "setVerticalAccuracy:", v35 / (double)(unint64_t)v34);
    v36 = objc_msgSend(a3, "count");
    -[CLLocationDBEntry interpPressure](v6, "interpPressure");
    -[CLLocationDBEntry setInterpPressure:](v6, "setInterpPressure:", v37 / (double)(unint64_t)v36);
    v38 = objc_msgSend(a3, "count");
    -[CLLocationDBEntry latitude](v6, "latitude");
    -[CLLocationDBEntry setLatitude:](v6, "setLatitude:", v39 / (double)(unint64_t)v38);
    v40 = objc_msgSend(a3, "count");
    -[CLLocationDBEntry longitude](v6, "longitude");
    -[CLLocationDBEntry setLongitude:](v6, "setLongitude:", v41 / (double)(unint64_t)v40);
    objc_msgSend(a4, "addObject:", v6);

  }
}

- (void)_interpolatePressureValuesWithElevationArray:(id)a3
{
  char *v5;
  double v6;
  float v7;
  double v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double *begin;
  NSMutableArray *locationBuffer;
  id v17;
  double v18;
  double v19;
  uint64_t v20;
  void *i;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double *v29;
  double *v30;
  double *v31;
  double v32;
  unint64_t v33;
  double v34;
  double v35;
  float v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  double *value;
  double *end;
  double *v51;
  double *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char *v57;
  double *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double *v62;
  double *v63;
  double *v64;
  double *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char *v70;
  double *v71;
  uint64_t v72;
  double *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  double *v79;
  uint64_t v80;
  uint64_t v81;
  double *v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  const char *v88;
  uint8_t *v89;
  __compressed_pair<double *, std::allocator<double>> *p_end_cap;
  __compressed_pair<double *, std::allocator<double>> *v91;
  vector<double, std::allocator<double>> *p_verticalAccuraciesInWindow;
  vector<double, std::allocator<double>> *p_deltaElevationsInWindow;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _WORD v98[8];
  uint8_t v99[128];
  uint8_t buf[1632];

  v5 = -[CLElevationLocationFilter _getElevationStartIndex:](self, "_getElevationStartIndex:");
  if (v5 < (char *)objc_msgSend(a3, "count") - 1)
  {
    objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v5), "pressure");
    *(float *)&v6 = v6;
    v7 = sub_10024806C(*(float *)&v6, 101320.0);
    objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v5 + 1), "pressure");
    *(float *)&v8 = v8;
    v9 = sub_10024806C(*(float *)&v8, 101320.0);
    objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v5), "timestamp");
    v11 = v10;
    objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v5 + 1), "timestamp");
    v13 = v12;
    v14 = objc_alloc_init((Class)NSMutableArray);
    begin = self->_verticalAccuraciesInWindow.__begin_;
    p_verticalAccuraciesInWindow = &self->_verticalAccuraciesInWindow;
    p_deltaElevationsInWindow = &self->_deltaElevationsInWindow;
    self->_deltaElevationsInWindow.__end_ = self->_deltaElevationsInWindow.__begin_;
    self->_verticalAccuraciesInWindow.__end_ = begin;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    locationBuffer = self->_locationBuffer;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](locationBuffer, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
    if (!v17)
      goto LABEL_85;
    v18 = v9;
    v19 = v7;
    v20 = *(_QWORD *)v95;
    p_end_cap = &self->_verticalAccuraciesInWindow.__end_cap_;
    v91 = &self->_deltaElevationsInWindow.__end_cap_;
    while (1)
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v95 != v20)
          objc_enumerationMutation(locationBuffer);
        v22 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v22, "timestamp");
        if (v23 >= self->_firstUnfilteredLocationTime)
        {
          objc_msgSend(v22, "timestamp");
          if (v13 < v32)
          {
            v33 = (unint64_t)(v5 + 2);
            if (v5 + 2 >= objc_msgSend(a3, "count"))
            {
              ++v5;
LABEL_20:
              v19 = v18;
              v11 = v13;
            }
            else
            {
              v19 = v18;
              v11 = v13;
              while (1)
              {
                objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v33), "timestamp");
                v13 = v34;
                objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v33), "pressure");
                *(float *)&v35 = v35;
                v36 = sub_10024806C(*(float *)&v35, 101320.0);
                objc_msgSend(v22, "timestamp");
                v18 = v36;
                if (v13 >= v37)
                  break;
                ++v33;
                v19 = v18;
                v11 = v13;
                if (v33 >= (unint64_t)objc_msgSend(a3, "count"))
                {
                  v5 = (char *)(v33 - 1);
                  goto LABEL_20;
                }
              }
              v5 = (char *)(v33 - 1);
            }
          }
          if (v5 >= (char *)objc_msgSend(a3, "count") - 1)
            goto LABEL_85;
          objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v5), "pressure");
          v39 = v38;
          objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v5 + 1), "pressure");
          v41 = v40;
          objc_msgSend(v22, "timestamp");
          -[CLElevationLocationFilter interpolateWithStartTime:andStartValue:andEndTime:andEndValue:atTargetTime:](self, "interpolateWithStartTime:andStartValue:andEndTime:andEndValue:atTargetTime:", v11, v39, v13, v41, v42);
          objc_msgSend(v22, "setInterpPressure:");
          objc_msgSend(v22, "timestamp");
          -[CLElevationLocationFilter interpolateWithStartTime:andStartValue:andEndTime:andEndValue:atTargetTime:](self, "interpolateWithStartTime:andStartValue:andEndTime:andEndValue:atTargetTime:", v11, v19, v13, v18, v43);
          v45 = v44;
          objc_msgSend(v22, "elevation");
          objc_msgSend(v22, "setDeltaElevation:", v46 - v45);
          objc_msgSend(v14, "addObject:", v22);
          objc_msgSend(v22, "deltaElevation");
          v48 = v47;
          end = self->_deltaElevationsInWindow.__end_;
          value = self->_deltaElevationsInWindow.__end_cap_.__value_;
          if (end >= value)
          {
            v52 = p_deltaElevationsInWindow->__begin_;
            v53 = end - p_deltaElevationsInWindow->__begin_;
            v54 = v53 + 1;
            if ((unint64_t)(v53 + 1) >> 61)
              sub_100259694();
            v55 = (char *)value - (char *)v52;
            if (v55 >> 2 > v54)
              v54 = v55 >> 2;
            if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF8)
              v56 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v56 = v54;
            if (v56)
            {
              v57 = (char *)sub_10025E6A0((uint64_t)v91, v56);
              v52 = self->_deltaElevationsInWindow.__begin_;
              end = self->_deltaElevationsInWindow.__end_;
            }
            else
            {
              v57 = 0;
            }
            v58 = (double *)&v57[8 * v53];
            *(_QWORD *)v58 = v48;
            v51 = v58 + 1;
            while (end != v52)
            {
              v59 = *((_QWORD *)end-- - 1);
              *((_QWORD *)v58-- - 1) = v59;
            }
            self->_deltaElevationsInWindow.__begin_ = v58;
            self->_deltaElevationsInWindow.__end_ = v51;
            self->_deltaElevationsInWindow.__end_cap_.__value_ = (double *)&v57[8 * v56];
            if (v52)
              operator delete(v52);
          }
          else
          {
            *(_QWORD *)end = v47;
            v51 = end + 1;
          }
          self->_deltaElevationsInWindow.__end_ = v51;
          objc_msgSend(v22, "verticalAccuracy");
          v61 = v60;
          v63 = self->_verticalAccuraciesInWindow.__end_;
          v62 = self->_verticalAccuraciesInWindow.__end_cap_.__value_;
          if (v63 < v62)
            goto LABEL_40;
          v65 = p_verticalAccuraciesInWindow->__begin_;
          v66 = v63 - p_verticalAccuraciesInWindow->__begin_;
          v67 = v66 + 1;
          if ((unint64_t)(v66 + 1) >> 61)
            sub_100259694();
          v68 = (char *)v62 - (char *)v65;
          if (v68 >> 2 > v67)
            v67 = v68 >> 2;
          if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFF8)
            v69 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v69 = v67;
          if (v69)
          {
            v70 = (char *)sub_10025E6A0((uint64_t)p_end_cap, v69);
            v65 = self->_verticalAccuraciesInWindow.__begin_;
            v63 = self->_verticalAccuraciesInWindow.__end_;
          }
          else
          {
            v70 = 0;
          }
          v71 = (double *)&v70[8 * v66];
          *(_QWORD *)v71 = v61;
          v64 = v71 + 1;
          while (v63 != v65)
          {
            v72 = *((_QWORD *)v63-- - 1);
            *((_QWORD *)v71-- - 1) = v72;
          }
LABEL_80:
          self->_verticalAccuraciesInWindow.__begin_ = v71;
          self->_verticalAccuraciesInWindow.__end_ = v64;
          self->_verticalAccuraciesInWindow.__end_cap_.__value_ = (double *)&v70[8 * v69];
          if (v65)
            operator delete(v65);
LABEL_82:
          self->_verticalAccuraciesInWindow.__end_ = v64;
          continue;
        }
        objc_msgSend(v22, "interpPressure");
        if (v24 != 1.79769313e308)
        {
          objc_msgSend(v22, "deltaElevation");
          if (v25 != 1.79769313e308)
          {
            objc_msgSend(v22, "timestamp");
            if (v26 > self->_firstUnfilteredLocationTime - (self->_windowSize - self->_cadence))
            {
              objc_msgSend(v14, "addObject:", v22);
              objc_msgSend(v22, "deltaElevation");
              v28 = v27;
              v30 = self->_deltaElevationsInWindow.__end_;
              v29 = self->_deltaElevationsInWindow.__end_cap_.__value_;
              if (v30 >= v29)
              {
                v73 = p_deltaElevationsInWindow->__begin_;
                v74 = v30 - p_deltaElevationsInWindow->__begin_;
                v75 = v74 + 1;
                if ((unint64_t)(v74 + 1) >> 61)
                  sub_100259694();
                v76 = (char *)v29 - (char *)v73;
                if (v76 >> 2 > v75)
                  v75 = v76 >> 2;
                if ((unint64_t)v76 >= 0x7FFFFFFFFFFFFFF8)
                  v77 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v77 = v75;
                if (v77)
                {
                  v78 = (char *)sub_10025E6A0((uint64_t)v91, v77);
                  v73 = self->_deltaElevationsInWindow.__begin_;
                  v30 = self->_deltaElevationsInWindow.__end_;
                }
                else
                {
                  v78 = 0;
                }
                v79 = (double *)&v78[8 * v74];
                *(_QWORD *)v79 = v28;
                v31 = v79 + 1;
                while (v30 != v73)
                {
                  v80 = *((_QWORD *)v30-- - 1);
                  *((_QWORD *)v79-- - 1) = v80;
                }
                self->_deltaElevationsInWindow.__begin_ = v79;
                self->_deltaElevationsInWindow.__end_ = v31;
                self->_deltaElevationsInWindow.__end_cap_.__value_ = (double *)&v78[8 * v77];
                if (v73)
                  operator delete(v73);
              }
              else
              {
                *(_QWORD *)v30 = v27;
                v31 = v30 + 1;
              }
              self->_deltaElevationsInWindow.__end_ = v31;
              objc_msgSend(v22, "verticalAccuracy");
              v61 = v81;
              v63 = self->_verticalAccuraciesInWindow.__end_;
              v82 = self->_verticalAccuraciesInWindow.__end_cap_.__value_;
              if (v63 >= v82)
              {
                v65 = p_verticalAccuraciesInWindow->__begin_;
                v83 = v63 - p_verticalAccuraciesInWindow->__begin_;
                v84 = v83 + 1;
                if ((unint64_t)(v83 + 1) >> 61)
                  sub_100259694();
                v85 = (char *)v82 - (char *)v65;
                if (v85 >> 2 > v84)
                  v84 = v85 >> 2;
                if ((unint64_t)v85 >= 0x7FFFFFFFFFFFFFF8)
                  v69 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v69 = v84;
                if (v69)
                {
                  v70 = (char *)sub_10025E6A0((uint64_t)p_end_cap, v69);
                  v65 = self->_verticalAccuraciesInWindow.__begin_;
                  v63 = self->_verticalAccuraciesInWindow.__end_;
                }
                else
                {
                  v70 = 0;
                }
                v71 = (double *)&v70[8 * v83];
                *(_QWORD *)v71 = v61;
                v64 = v71 + 1;
                while (v63 != v65)
                {
                  v86 = *((_QWORD *)v63-- - 1);
                  *((_QWORD *)v71-- - 1) = v86;
                }
                goto LABEL_80;
              }
LABEL_40:
              *(_QWORD *)v63 = v61;
              v64 = v63 + 1;
              goto LABEL_82;
            }
          }
        }
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](locationBuffer, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
      if (!v17)
      {
LABEL_85:
        -[NSMutableArray removeAllObjects](self->_locationBuffer, "removeAllObjects");
        -[NSMutableArray addObjectsFromArray:](self->_locationBuffer, "addObjectsFromArray:", v14);

        return;
      }
    }
  }
  if (qword_10229FD70 != -1)
    dispatch_once(&qword_10229FD70, &stru_102190530);
  v87 = qword_10229FD78;
  if (os_log_type_enabled((os_log_t)qword_10229FD78, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEBUG, "warning: cannot interpolate pressure values in location filter", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD70 != -1)
      dispatch_once(&qword_10229FD70, &stru_102190530);
    v98[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD78, 2, "warning: cannot interpolate pressure values in location filter", v98, 2);
    v89 = (uint8_t *)v88;
    sub_100512490("Generic", 1, 0, 2, "-[CLElevationLocationFilter _interpolatePressureValuesWithElevationArray:]", "%s\n", v88);
    if (v89 != buf)
      free(v89);
  }
}

- (double)interpolateWithStartTime:(double)a3 andStartValue:(double)a4 andEndTime:(double)a5 andEndValue:(double)a6 atTargetTime:(double)a7
{
  NSObject *v8;
  double v9;
  double v10;
  const char *v12;
  uint8_t *v13;
  _WORD v14[8];
  uint8_t buf[1640];

  if (a3 <= a7 && a7 <= a5)
  {
    v9 = a7 - a3;
    if (v9 != 0.0)
    {
      v10 = a5 - a7;
      if (v10 == 0.0)
        return a6;
      else
        return (v10 * a4 + v9 * a6) / (v9 + v10);
    }
  }
  else
  {
    if (qword_10229FD70 != -1)
      dispatch_once(&qword_10229FD70, &stru_102190530);
    v8 = qword_10229FD78;
    if (os_log_type_enabled((os_log_t)qword_10229FD78, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "warning: startTime, targetTime & endTime should be ascending", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FD70 != -1)
        dispatch_once(&qword_10229FD70, &stru_102190530);
      v14[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD78, 0, "warning: startTime, targetTime & endTime should be ascending", v14, 2);
      v13 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 2, "-[CLElevationLocationFilter interpolateWithStartTime:andStartValue:andEndTime:andEndValue:atTargetTime:]", "%s\n", v12);
      if (v13 != buf)
        free(v13);
    }
    return 1.79769313e308;
  }
  return a4;
}

- (unint64_t)_getElevationStartIndex:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double v9;

  v5 = (unint64_t)objc_msgSend(a3, "count");
  v6 = v5 >> 1;
  if (v5 >= 2)
  {
    v7 = v5;
    v8 = 0;
    do
    {
      objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v6), "timestamp");
      if (v9 > self->_firstUnfilteredLocationTime)
        v7 = v6;
      else
        v8 = v6;
      v6 = (v8 + v7) >> 1;
    }
    while (v8 < v6);
  }
  return v6;
}

- (BOOL)readyToFilter
{
  return self->_readyToFilter;
}

- (void)setReadyToFilter:(BOOL)a3
{
  self->_readyToFilter = a3;
}

- (void).cxx_destruct
{
  double *begin;
  double *v4;

  begin = self->_verticalAccuraciesInWindow.__begin_;
  if (begin)
  {
    self->_verticalAccuraciesInWindow.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_deltaElevationsInWindow.__begin_;
  if (v4)
  {
    self->_deltaElevationsInWindow.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end

@implementation NFLookbackReaderRestrictor

- (BOOL)loadCustomDefaults
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  float *v8;
  uint64_t v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  float v14;
  void *v15;
  uint64_t v16;
  void (*v17)(uint64_t, const char *, ...);
  objc_class *v18;
  _BOOL4 v19;
  const char *v20;
  const char *v21;
  float v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  float v31;
  double v32;
  BOOL v33;
  void *specific;
  uint64_t Logger;
  void (*v36)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  objc_class *v45;
  int v46;
  void *v48;
  void (*v49)(uint64_t, const char *, ...);
  void *v50;
  uint64_t v51;
  NSObject *v52;
  double *timeWindows;
  float *maxOnTimesNominal;
  float *maxOnTimesBackOff;
  float *maxOnTimesCritical;
  id v57;
  id v58;
  void *v59;
  uint8_t buf[4];
  _BYTE v62[14];
  __int16 v63;
  const char *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  _BYTE v68[10];
  double v69;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayForKey:", CFSTR("lookBackRestrictorWindows")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayForKey:", CFSTR("lookBackRestrictorValues")));
  v6 = objc_msgSend(v5, "count");
  if (v6 != objc_msgSend(v4, "count"))
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v36 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v57 = objc_msgSend(v5, "count");
      v58 = objc_msgSend(v4, "count");
      v41 = 45;
      if (isMetaClass)
        v41 = 43;
      v36(3, "%c[%{public}s %{public}s]:%i Invalid custom value count. Windows = %d, Values = %d", v41, ClassName, Name, 39, v57, v58);
    }
    v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v43 = NFSharedLogGetLogger(v42);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = object_getClass(self);
      if (class_isMetaClass(v45))
        v46 = 43;
      else
        v46 = 45;
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)v62 = v46;
      *(_WORD *)&v62[4] = 2082;
      *(_QWORD *)&v62[6] = object_getClassName(self);
      v63 = 2082;
      v64 = sel_getName(a2);
      v65 = 1024;
      v66 = 39;
      v67 = 1024;
      *(_DWORD *)v68 = objc_msgSend(v5, "count");
      *(_WORD *)&v68[4] = 1024;
      *(_DWORD *)&v68[6] = objc_msgSend(v4, "count");
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid custom value count. Windows = %d, Values = %d", buf, 0x2Eu);
    }

    goto LABEL_30;
  }
  if (!objc_msgSend(v5, "count"))
  {
LABEL_30:
    v33 = 0;
    goto LABEL_31;
  }
  v7 = objc_msgSend(v5, "count");
  self->_maxTimeWindows = v7;
  self->_timeWindows = (double *)malloc_type_calloc(1uLL, 8 * v7, 0x100004000313F17uLL);
  self->_maxOnTimesNominal = (float *)malloc_type_calloc(1uLL, 4 * self->_maxTimeWindows, 0x100004052888210uLL);
  self->_maxOnTimesBackOff = (float *)malloc_type_calloc(1uLL, 4 * self->_maxTimeWindows, 0x100004052888210uLL);
  v8 = (float *)malloc_type_calloc(1uLL, 4 * self->_maxTimeWindows, 0x100004052888210uLL);
  self->_maxOnTimesCritical = v8;
  if (!self->_timeWindows || !self->_maxOnTimesNominal || !self->_maxOnTimesBackOff || !v8)
  {
    v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v49 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v48);
    if (v49)
      v49(3, "%s:%i Error allocating buffers.", "-[NFLookbackReaderRestrictor loadCustomDefaults]", 52);
    v50 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v51 = NFSharedLogGetLogger(v50);
    v52 = objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)v62 = "-[NFLookbackReaderRestrictor loadCustomDefaults]";
      *(_WORD *)&v62[8] = 1024;
      *(_DWORD *)&v62[10] = 52;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%{public}s:%i Error allocating buffers.", buf, 0x12u);
    }

    timeWindows = self->_timeWindows;
    if (timeWindows)
    {
      free(timeWindows);
      self->_timeWindows = 0;
    }
    maxOnTimesNominal = self->_maxOnTimesNominal;
    if (maxOnTimesNominal)
    {
      free(maxOnTimesNominal);
      self->_maxOnTimesNominal = 0;
    }
    maxOnTimesBackOff = self->_maxOnTimesBackOff;
    if (maxOnTimesBackOff)
    {
      free(maxOnTimesBackOff);
      self->_maxOnTimesBackOff = 0;
    }
    maxOnTimesCritical = self->_maxOnTimesCritical;
    if (maxOnTimesCritical)
    {
      free(maxOnTimesCritical);
      v33 = 0;
      self->_maxOnTimesCritical = 0;
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (self->_maxTimeWindows < 1)
  {
    v33 = 1;
  }
  else
  {
    v59 = v3;
    v9 = 0;
    do
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v9));
      objc_msgSend(v10, "floatValue");
      v12 = v11;

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", v9));
      objc_msgSend(v13, "floatValue");
      self->_timeWindows[v9] = v14;

      self->_maxOnTimesNominal[v9] = v12;
      self->_maxOnTimesBackOff[v9] = v12;
      self->_maxOnTimesCritical[v9] = 0.0;
      v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v16 = NFLogGetLogger(v15);
      if (v16)
      {
        v17 = (void (*)(uint64_t, const char *, ...))v16;
        v18 = object_getClass(self);
        v19 = class_isMetaClass(v18);
        v20 = object_getClassName(self);
        v21 = sel_getName(a2);
        v23 = 45;
        if (v19)
          v23 = 43;
        v22 = self->_timeWindows[v9];
        v17(6, "%c[%{public}s %{public}s]:%i Using window of %f seconds with a max ratio of %f", v23, v20, v21, 78, v22, self->_maxOnTimesNominal[v9]);
      }
      v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v25 = NFSharedLogGetLogger(v24);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = object_getClass(self);
        if (class_isMetaClass(v27))
          v28 = 43;
        else
          v28 = 45;
        v29 = object_getClassName(self);
        v30 = sel_getName(a2);
        v31 = self->_timeWindows[v9];
        v32 = self->_maxOnTimesNominal[v9];
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)v62 = v28;
        *(_WORD *)&v62[4] = 2082;
        *(_QWORD *)&v62[6] = v29;
        v63 = 2082;
        v64 = v30;
        v65 = 1024;
        v66 = 78;
        v67 = 2048;
        *(double *)v68 = v31;
        *(_WORD *)&v68[8] = 2048;
        v69 = v32;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Using window of %f seconds with a max ratio of %f", buf, 0x36u);
      }

      ++v9;
    }
    while (v9 < self->_maxTimeWindows);
    v33 = 1;
    v3 = v59;
  }
LABEL_31:

  return v33;
}

- (BOOL)loadDefaultValues
{
  float *v3;
  double *timeWindows;
  BOOL v5;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  void *v8;
  uint64_t v9;
  NSObject *v10;
  double *v11;
  float *v12;
  float *v13;
  float *maxOnTimesNominal;
  float *maxOnTimesBackOff;
  float *maxOnTimesCritical;
  float *v17;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;

  self->_maxTimeWindows = 3;
  self->_timeWindows = (double *)malloc_type_calloc(1uLL, 0x18uLL, 0x100004000313F17uLL);
  self->_maxOnTimesNominal = (float *)malloc_type_calloc(1uLL, 4 * self->_maxTimeWindows, 0x100004052888210uLL);
  self->_maxOnTimesBackOff = (float *)malloc_type_calloc(1uLL, 4 * self->_maxTimeWindows, 0x100004052888210uLL);
  v3 = (float *)malloc_type_calloc(1uLL, 4 * self->_maxTimeWindows, 0x100004052888210uLL);
  self->_maxOnTimesCritical = v3;
  timeWindows = self->_timeWindows;
  if (timeWindows && self->_maxOnTimesNominal && (self->_maxOnTimesBackOff ? (v5 = v3 == 0) : (v5 = 1), !v5))
  {
    *(_OWORD *)timeWindows = xmmword_10026A8D8;
    timeWindows[2] = 180.0;
    maxOnTimesNominal = self->_maxOnTimesNominal;
    *(_QWORD *)maxOnTimesNominal = 0x3F3333333F4CCCCDLL;
    maxOnTimesNominal[2] = 0.6;
    maxOnTimesBackOff = self->_maxOnTimesBackOff;
    *(_QWORD *)maxOnTimesBackOff = 0x3F3333333F4CCCCDLL;
    maxOnTimesBackOff[2] = 0.6;
    maxOnTimesCritical = self->_maxOnTimesCritical;
    *(_QWORD *)maxOnTimesCritical = 0;
    maxOnTimesCritical[2] = 0.0;
    LOBYTE(v17) = 1;
  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
      Logger(3, "%s:%i Error allocating buffers.", "-[NFLookbackReaderRestrictor loadDefaultValues]", 93);
    v8 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v9 = NFSharedLogGetLogger(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v20 = "-[NFLookbackReaderRestrictor loadDefaultValues]";
      v21 = 1024;
      v22 = 93;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i Error allocating buffers.", buf, 0x12u);
    }

    v11 = self->_timeWindows;
    if (v11)
    {
      free(v11);
      self->_timeWindows = 0;
    }
    v12 = self->_maxOnTimesNominal;
    if (v12)
    {
      free(v12);
      self->_maxOnTimesNominal = 0;
    }
    v13 = self->_maxOnTimesBackOff;
    if (v13)
    {
      free(v13);
      self->_maxOnTimesBackOff = 0;
    }
    v17 = self->_maxOnTimesCritical;
    if (v17)
    {
      free(v17);
      LOBYTE(v17) = 0;
      self->_maxOnTimesCritical = 0;
    }
  }
  return (char)v17;
}

- (NFLookbackReaderRestrictor)initWithThermalMonitor:(id)a3 delegate:(id)a4
{
  NFLookbackReaderRestrictor *v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  NFLookbackReaderRestrictor *v21;
  const char *Name;
  objc_super v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;

  v24.receiver = self;
  v24.super_class = (Class)NFLookbackReaderRestrictor;
  v5 = -[NFReaderRestrictor initWithThermalMonitor:delegate:](&v24, "initWithThermalMonitor:delegate:", a3, a4);
  if (!v5)
    goto LABEL_16;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(v5);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(v5);
    Name = sel_getName(a2);
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i Using lookback mechanism", v12, ClassName, Name, 124);
  }
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(v5);
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    v18 = object_getClassName(v5);
    v19 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v26 = v17;
    v27 = 2082;
    v28 = v18;
    v29 = 2082;
    v30 = v19;
    v31 = 1024;
    v32 = 124;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Using lookback mechanism", buf, 0x22u);
  }

  if (NFIsInternalBuild(v20))
  {
    if (!-[NFLookbackReaderRestrictor loadCustomDefaults](v5, "loadCustomDefaults")
      && !-[NFLookbackReaderRestrictor loadDefaultValues](v5, "loadDefaultValues"))
    {
      goto LABEL_14;
    }
LABEL_16:
    v21 = v5;
    goto LABEL_17;
  }
  if (-[NFLookbackReaderRestrictor loadDefaultValues](v5, "loadDefaultValues"))
    goto LABEL_16;
LABEL_14:
  v21 = 0;
LABEL_17:

  return v21;
}

- (void)dealloc
{
  double *timeWindows;
  float *maxOnTimesNominal;
  float *maxOnTimesBackOff;
  float *maxOnTimesCritical;
  objc_super v7;

  timeWindows = self->_timeWindows;
  if (timeWindows)
  {
    free(timeWindows);
    self->_timeWindows = 0;
  }
  maxOnTimesNominal = self->_maxOnTimesNominal;
  if (maxOnTimesNominal)
  {
    free(maxOnTimesNominal);
    self->_maxOnTimesNominal = 0;
  }
  maxOnTimesBackOff = self->_maxOnTimesBackOff;
  if (maxOnTimesBackOff)
  {
    free(maxOnTimesBackOff);
    self->_maxOnTimesBackOff = 0;
  }
  maxOnTimesCritical = self->_maxOnTimesCritical;
  if (maxOnTimesCritical)
  {
    free(maxOnTimesCritical);
    self->_maxOnTimesCritical = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)NFLookbackReaderRestrictor;
  -[NFLookbackReaderRestrictor dealloc](&v7, "dealloc");
}

- (double)maxOperationTimeSpan
{
  return 350.0;
}

- (double)maxReaderTime
{
  unsigned __int8 v3;
  double result;
  unsigned int v5;

  v3 = -[NFReaderRestrictor thermalPressureNominal](self, "thermalPressureNominal");
  result = 20.0;
  if ((v3 & 1) == 0)
  {
    v5 = -[NFReaderRestrictor thermalPressureBackoff](self, "thermalPressureBackoff", 20.0);
    result = 0.0;
    if (v5)
      return 7.0;
  }
  return result;
}

- (id)_allOperationsSince:(double)a3 referenceTime:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  id v23;
  unsigned int v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NFReaderRestrictor readerOperations](self, "readerOperations"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reverseObjectEnumerator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));

  v10 = objc_opt_new(NSMutableArray);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v15);
        if (v16)
          v17 = *(void **)(v16 + 8);
        else
          v17 = 0;
        v18 = v17;
        objc_msgSend(v6, "timeIntervalSinceDate:", v18, (_QWORD)v26);
        v20 = v19;

        if (v20 > a3)
        {
          if (v16)
            v22 = *(void **)(v16 + 16);
          else
            v22 = 0;
          v23 = v22;
          v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("ReaderStarted"));

          if (v24)
            -[NSMutableArray insertObject:atIndex:](v10, "insertObject:atIndex:", v16, 0);
          goto LABEL_18;
        }
        -[NSMutableArray insertObject:atIndex:](v10, "insertObject:atIndex:", v16, 0);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v21 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v13 = v21;
      if (v21)
        continue;
      break;
    }
  }
LABEL_18:

  return v10;
}

- (void)_getReaderOnTime:(double *)a3 andOff:(double *)a4 since:(double)a5 referenceTime:(id)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  float v17;
  float v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  unsigned int v23;
  void *v24;
  id v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  double v31;
  id v32;
  id v33;
  double v34;
  float v35;
  float v36;
  double *v37;
  double *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NFLookbackReaderRestrictor _allOperationsSince:referenceTime:](self, "_allOperationsSince:referenceTime:", v10, a5));
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v12)
  {
    v13 = v12;
    v37 = a3;
    v38 = a4;
    v39 = v10;
    v14 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v41;
    v17 = 0.0;
    v18 = 0.0;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(v11);
        v20 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v19);
        if (v20)
          v21 = *(void **)(v20 + 16);
        else
          v21 = 0;
        v22 = v21;
        v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("ReaderStarted"));

        if (v23)
        {
          if (v15)
          {
            if (v20)
              v24 = *(void **)(v20 + 8);
            else
              v24 = 0;
            v25 = v24;
            objc_msgSend(v25, "timeIntervalSinceDate:", v15);
            v17 = v26 + v17;

          }
          if (v20)
          {
            v15 = 0;
            v27 = *(void **)(v20 + 8);
            v28 = v14;
            v14 = v27;
          }
          else
          {
            v27 = 0;
            v15 = 0;
            v28 = v14;
            v14 = 0;
          }
        }
        else
        {
          if (v14)
          {
            if (v20)
              v29 = *(void **)(v20 + 8);
            else
              v29 = 0;
            v30 = v29;
            objc_msgSend(v30, "timeIntervalSinceDate:", v14);
            v18 = v31 + v18;

          }
          if (v20)
          {
            v14 = 0;
            v27 = *(void **)(v20 + 8);
            v28 = v15;
            v15 = v27;
          }
          else
          {
            v27 = 0;
            v14 = 0;
            v28 = v15;
            v15 = 0;
          }
        }
        v32 = v27;

        v19 = (char *)v19 + 1;
      }
      while (v13 != v19);
      v33 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      v13 = v33;
    }
    while (v33);
    v10 = v39;
    if (v14)
    {
      objc_msgSend(v39, "timeIntervalSinceDate:", v14);
      v18 = v34 + v18;
    }
    a3 = v37;
    a4 = v38;
  }
  else
  {
    v15 = 0;
    v14 = 0;
    v17 = 0.0;
    v18 = 0.0;
  }
  if ((float)(v17 + v18) >= a5)
  {
    v36 = v17;
  }
  else
  {
    v35 = a5 - v18;
    v36 = v35;
  }
  *a3 = v18;
  *a4 = v36;

}

- (float)getMaxOnTimeAtIndex:(int)a3
{
  uint64_t v3;
  void *specific;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  uint64_t v19;
  const char *Name;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;

  v3 = *(_QWORD *)&a3;
  if (self->_maxTimeWindows <= a3)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i Error : invalid index %d", v13, ClassName, Name, 244, v3);
    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(self);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      *(_DWORD *)buf = 67110146;
      v22 = v18;
      v23 = 2082;
      v24 = object_getClassName(self);
      v25 = 2082;
      v26 = sel_getName(a2);
      v27 = 1024;
      v28 = 244;
      v29 = 1024;
      v30 = v3;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error : invalid index %d", buf, 0x28u);
    }

    return 0.0;
  }
  else if (-[NFReaderRestrictor thermalPressureCritical](self, "thermalPressureCritical"))
  {
    return self->_maxOnTimesCritical[(int)v3];
  }
  else
  {
    if (-[NFReaderRestrictor thermalPressureBackoff](self, "thermalPressureBackoff"))
      v19 = 88;
    else
      v19 = 80;
    return (*(float **)((char *)&self->super.super.isa + v19))[(int)v3];
  }
}

- (double)getCooloffTime
{
  NSDate *v3;
  void *v4;
  NSDate *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  float v11;
  float v12;
  double v13;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  void *v16;
  uint64_t v17;
  NSObject *v18;
  double v20;
  double v21;
  objc_super v22;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  double v29;
  __int16 v30;
  int v31;

  v23.receiver = self;
  v23.super_class = (Class)NFLookbackReaderRestrictor;
  v3 = -[NFReaderRestrictor currentTestTime](&v23, "currentTestTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    v22.receiver = self;
    v22.super_class = (Class)NFLookbackReaderRestrictor;
    v5 = -[NFReaderRestrictor currentTestTime](&v22, "currentTestTime");
    v6 = objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 0.0));
  }
  v7 = (void *)v6;

  if (self->_maxTimeWindows < 1)
  {
    v9 = 0.0;
  }
  else
  {
    v8 = 0;
    v9 = 0.0;
    while (1)
    {
      v10 = self->_timeWindows[v8];
      -[NFLookbackReaderRestrictor getMaxOnTimeAtIndex:](self, "getMaxOnTimeAtIndex:", v8);
      v20 = 0.0;
      v21 = 0.0;
      if (v11 == 0.0)
        break;
      v12 = v11;
      -[NFLookbackReaderRestrictor _getReaderOnTime:andOff:since:referenceTime:](self, "_getReaderOnTime:andOff:since:referenceTime:", &v21, &v20, v7, v10);
      if (v21 != 0.0)
      {
        if (v21 / v12 - (v21 + v20) >= 1.0)
          v13 = v21 / v12 - (v21 + v20);
        else
          v13 = 0.0;
        if (v13 != 0.0)
        {
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
          if (Logger)
            Logger(6, "%s:%i Cooloff of %f required for window %d", "-[NFLookbackReaderRestrictor getCooloffTime]", 291, *(_QWORD *)&v13, v8);
          v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v17 = NFSharedLogGetLogger(v16);
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446978;
            v25 = "-[NFLookbackReaderRestrictor getCooloffTime]";
            v26 = 1024;
            v27 = 291;
            v28 = 2048;
            v29 = v13;
            v30 = 1024;
            v31 = v8;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Cooloff of %f required for window %d", buf, 0x22u);
          }

        }
        if (v13 > v9)
          v9 = v13;
      }
      if (++v8 >= self->_maxTimeWindows)
        goto LABEL_23;
    }
    v9 = 315360000.0;
  }
LABEL_23:

  return v9;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  NSDate *v6;
  void *v7;
  NSDate *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  double v16;
  unsigned __int8 v17;
  int *v18;
  unsigned int v19;
  uint64_t v20;
  float v21;
  void *v22;
  double v24;
  double v25;
  objc_super v26;
  objc_super v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)NFLookbackReaderRestrictor;
  v3 = -[NFReaderRestrictor description](&v28, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v4));

  v27.receiver = self;
  v27.super_class = (Class)NFLookbackReaderRestrictor;
  v6 = -[NFReaderRestrictor currentTestTime](&v27, "currentTestTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    v26.receiver = self;
    v26.super_class = (Class)NFLookbackReaderRestrictor;
    v8 = -[NFReaderRestrictor currentTestTime](&v26, "currentTestTime");
    v9 = objc_claimAutoreleasedReturnValue(v8);
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 0.0));
  }
  v10 = (void *)v9;

  objc_msgSend(v5, "appendFormat:", CFSTR("\n\t Time Windows = {"));
  if (self->_maxTimeWindows >= 1)
  {
    v11 = 0;
    do
      objc_msgSend(v5, "appendFormat:", CFSTR("%f, "), *(_QWORD *)&self->_timeWindows[v11++]);
    while (v11 < self->_maxTimeWindows);
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("}\n"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\t Nominal Windows = {"));
  if (self->_maxTimeWindows >= 1)
  {
    v12 = 0;
    do
      objc_msgSend(v5, "appendFormat:", CFSTR("%f, "), self->_maxOnTimesNominal[v12++]);
    while (v12 < self->_maxTimeWindows);
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("}\n"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\t Backoff Windows = {"));
  if (self->_maxTimeWindows >= 1)
  {
    v13 = 0;
    do
      objc_msgSend(v5, "appendFormat:", CFSTR("%f, "), self->_maxOnTimesBackOff[v13++]);
    while (v13 < self->_maxTimeWindows);
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("}\n"));
  if (-[NFReaderRestrictor thermalPressureCritical](self, "thermalPressureCritical"))
  {
    v14 = CFSTR("\t Current window = Critical\n");
  }
  else if (-[NFReaderRestrictor thermalPressureBackoff](self, "thermalPressureBackoff"))
  {
    v14 = CFSTR("\t Current window = Backoff\n");
  }
  else
  {
    v14 = CFSTR("\t Current window = Nominal\n");
  }
  objc_msgSend(v5, "appendFormat:", v14);
  objc_msgSend(v5, "appendFormat:", CFSTR("\t Current Windows state = {\n"));
  if (self->_maxTimeWindows >= 1)
  {
    v15 = 0;
    do
    {
      v16 = self->_timeWindows[v15];
      v24 = 0.0;
      v25 = 0.0;
      v17 = -[NFReaderRestrictor thermalPressureCritical](self, "thermalPressureCritical");
      v18 = &OBJC_IVAR___NFLookbackReaderRestrictor__maxOnTimesCritical;
      if ((v17 & 1) == 0)
      {
        v19 = -[NFReaderRestrictor thermalPressureBackoff](self, "thermalPressureBackoff");
        v20 = 2;
        if (v19)
          v20 = 3;
        v18 = &OBJC_IVAR___NFLookbackReaderRestrictor__maxTimeWindows[v20];
      }
      if ((*(float **)((char *)&self->super.super.isa + *v18))[v15] == 0.0)
        break;
      -[NFLookbackReaderRestrictor _getReaderOnTime:andOff:since:referenceTime:](self, "_getReaderOnTime:andOff:since:referenceTime:", &v25, &v24, v10, v16);
      if (v25 + v24 != 0.0)
      {
        v21 = v25 / (v25 + v24);
        objc_msgSend(v5, "appendFormat:", CFSTR("\t\t Window Size = %f, ON = %f, off = %f, total = %f, ratio = %f\n"), *(_QWORD *)&v16, *(_QWORD *)&v25, *(_QWORD *)&v24, v25 + v24, v21);
      }
      ++v15;
    }
    while (v15 < self->_maxTimeWindows);
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("}\n"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NFReaderRestrictor readerOperations](self, "readerOperations"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\t Operations = %@"), v22);

  return v5;
}

@end

@implementation SATimestamp

- (BOOL)ge:(id)a3
{
  return -[SATimestamp compare:](self, "compare:", a3) != -1;
}

- (SATimestamp)initWithMachAbsTime:(unint64_t)a3 machAbsTimeSec:(double)a4 machContTime:(unint64_t)a5 machContTimeSec:(double)a6 wallTime:(double)a7
{
  SATimestamp *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SATimestamp;
  result = -[SATimestamp init](&v13, sel_init);
  if (result)
  {
    result->_machAbsTime = a3;
    result->_machAbsTimeSeconds = a4;
    result->_machContTime = a5;
    result->_machContTimeSeconds = a6;
    result->_wallTime = a7;
  }
  return result;
}

- (BOOL)le:(id)a3
{
  return -[SATimestamp compare:](self, "compare:", a3) != 1;
}

- (int64_t)compare:(id)a3
{
  unint64_t machAbsTime;
  unint64_t v4;
  BOOL v5;
  int64_t v6;
  int64_t result;
  double machAbsTimeSeconds;
  double v9;
  int64_t v10;
  int v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  char v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self == a3)
    return 0;
  machAbsTime = self->_machAbsTime;
  if (machAbsTime && (v4 = *((_QWORD *)a3 + 1)) != 0
    || (machAbsTime = self->_machContTime) != 0 && (v4 = *((_QWORD *)a3 + 3)) != 0)
  {
    v5 = machAbsTime > v4;
    if (machAbsTime >= v4)
      v6 = 0;
    else
      v6 = -1;
    if (v5)
      return 1;
    else
      return v6;
  }
  else
  {
    machAbsTimeSeconds = self->_machAbsTimeSeconds;
    if ((machAbsTimeSeconds == 0.0 || (v9 = *((double *)a3 + 2), v9 == 0.0))
      && ((machAbsTimeSeconds = self->_machContTimeSeconds, machAbsTimeSeconds == 0.0)
       || (v9 = *((double *)a3 + 4), v9 == 0.0))
      && ((machAbsTimeSeconds = self->_wallTime, machAbsTimeSeconds == 0.0) || (v9 = *((double *)a3 + 5), v9 == 0.0)))
    {
      v11 = *__error();
      _sa_logt();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[SATimestamp debugDescription](self, "debugDescription");
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = objc_msgSend(v13, "UTF8String");
        objc_msgSend(a3, "debugDescription");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136315394;
        v28 = v14;
        v29 = 2080;
        v30 = objc_msgSend(v15, "UTF8String");
        _os_log_error_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_ERROR, "Incomparable timestamps: %s vs %s", buf, 0x16u);

      }
      *__error() = v11;
      -[SATimestamp debugDescription](self, "debugDescription");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = objc_msgSend(v16, "UTF8String");
      objc_msgSend(a3, "debugDescription");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v18, "UTF8String");
      _SASetCrashLogMessage(173, "Incomparable timestamps: %s vs %s", v19, v20, v21, v22, v23, v24, v17);

      result = _os_crash();
      __break(1u);
    }
    else
    {
      if (machAbsTimeSeconds >= v9)
        v10 = 0;
      else
        v10 = -1;
      if (machAbsTimeSeconds <= v9)
        return v10;
      else
        return 1;
    }
  }
  return result;
}

+ (SATimestamp)timestampWithMachAbsTime:(unint64_t)a3 machContTime:(unint64_t)a4 wallTime:(double)a5 machTimebase:(mach_timebase_info)a6
{
  unint64_t v10;
  double v11;

  v10 = 0;
  v11 = 0.0;
  if (a6.numer && a6.denom)
  {
    if (a6.numer == a6.denom)
    {
      v11 = (double)a3 / 1000000000.0;
      v10 = a4;
    }
    else
    {
      v11 = (double)(unint64_t)__udivti3() / 1000000000.0;
      v10 = __udivti3();
    }
  }
  return (SATimestamp *)objc_msgSend(a1, "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:", a3, a4, v11, (double)v10 / 1000000000.0, a5);
}

- (unint64_t)machContTime
{
  return self->_machContTime;
}

+ (SATimestamp)timestampWithMachAbsTime:(unint64_t)a3 machAbsTimeSec:(double)a4 machContTime:(unint64_t)a5 machContTimeSec:(double)a6 wallTime:(double)a7
{
  return (SATimestamp *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:", a3, a5, a4, a6, a7);
}

+ (id)timestampWithKTraceEvent:(uint64_t)a1 fromSession:(uint64_t)a2
{
  void *v3;
  uint64_t absolute_from_timestamp;
  uint64_t continuous_from_timestamp;
  uint64_t ns_from_timestamp;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  uint64_t v15;
  uint64_t v16;

  v3 = (void *)objc_opt_self();
  absolute_from_timestamp = ktrace_get_absolute_from_timestamp();
  continuous_from_timestamp = ktrace_get_continuous_from_timestamp();
  ns_from_timestamp = ktrace_get_ns_from_timestamp();
  v7 = ktrace_get_ns_from_timestamp();
  v8 = *(_QWORD *)(a2 + 56);
  if (v8)
  {
    v9 = (double)v8;
    v10 = (double)*(int *)(a2 + 64);
    v11 = 1000000.0;
  }
  else
  {
    v15 = 0;
    v16 = 0;
    v13 = ktrace_convert_timestamp_to_walltime();
    v12 = 0.0;
    if (v13)
      goto LABEL_5;
    v9 = (double)0;
    v10 = (double)0;
    v11 = 1000000000.0;
  }
  v12 = v10 / v11 + v9 - *MEMORY[0x1E0C9ADF8];
LABEL_5:
  objc_msgSend(v3, "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:", absolute_from_timestamp, continuous_from_timestamp, (double)(unint64_t)ns_from_timestamp / 1000000000.0, (double)(unint64_t)v7 / 1000000000.0, v12, v15, v16);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)timestampWithMachAbsTime:(uint64_t)a1 fromKtraceSession:(uint64_t)a2
{
  uint64_t ns_from_timestamp;
  uint64_t continuous_from_absolute;
  uint64_t v5;
  int v6;
  double v7;

  objc_opt_self();
  ns_from_timestamp = ktrace_get_ns_from_timestamp();
  continuous_from_absolute = ktrace_get_continuous_from_absolute();
  v5 = ktrace_get_ns_from_timestamp();
  v6 = ktrace_convert_absolute_to_walltime();
  v7 = 0.0;
  if (!v6)
    v7 = (double)0 - *MEMORY[0x1E0C9ADF8] + (double)0 / 1000000000.0;
  +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:](SATimestamp, "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:", a2, continuous_from_absolute, (double)(unint64_t)ns_from_timestamp / 1000000000.0, (double)(unint64_t)v5 / 1000000000.0, v7, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)now
{
  double v3;

  mach_get_times();
  v3 = *MEMORY[0x1E0C9ADF8];
  if (_MergedGlobals_7 != -1)
    dispatch_once(&_MergedGlobals_7, &__block_literal_global_9);
  objc_msgSend(a1, "timestampWithMachAbsTime:machContTime:wallTime:machTimebase:", 0, 0, qword_1ED1DD908, (double)0 - v3 + (double)0 / 1000000000.0, 0, 0, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isComparable:(id)a3
{
  SATimestamp *v4;
  BOOL v5;

  v4 = (SATimestamp *)a3;
  v5 = self == v4
    || self->_machAbsTime && v4->_machAbsTime
    || self->_machContTime && v4->_machContTime
    || self->_machAbsTimeSeconds != 0.0 && v4->_machAbsTimeSeconds != 0.0
    || self->_machContTimeSeconds != 0.0 && v4->_machContTimeSeconds != 0.0
    || self->_wallTime != 0.0 && v4->_wallTime != 0.0;

  return v5;
}

- (double)deltaSecondsTo:(id)a3 timeDomainPriorityList:(id)a4 timeDomainUsed:(unint64_t *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = a4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v35;
    *(_QWORD *)&v11 = 134217984;
    v33 = v11;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "unsignedLongLongValue", v33, (_QWORD)v34);
        switch(v16)
        {
          case 16:
            -[SATimestamp machContTimeSeconds](self, "machContTimeSeconds");
            if (v19 != 0.0)
            {
              objc_msgSend(v8, "machContTimeSeconds");
              if (v20 != 0.0)
              {
                if (a5)
                  *a5 = 16;
                objc_msgSend(v8, "machContTimeSeconds");
                v28 = v30;
                -[SATimestamp machContTimeSeconds](self, "machContTimeSeconds");
                goto LABEL_34;
              }
            }
            break;
          case 4:
            -[SATimestamp machAbsTimeSeconds](self, "machAbsTimeSeconds");
            if (v21 != 0.0)
            {
              objc_msgSend(v8, "machAbsTimeSeconds");
              if (v22 != 0.0)
              {
                if (a5)
                  *a5 = 4;
                objc_msgSend(v8, "machAbsTimeSeconds");
                v28 = v31;
                -[SATimestamp machAbsTimeSeconds](self, "machAbsTimeSeconds");
                goto LABEL_34;
              }
            }
            break;
          case 1:
            -[SATimestamp wallTime](self, "wallTime");
            if (v17 != 0.0)
            {
              objc_msgSend(v8, "wallTime");
              if (v18 != 0.0)
              {
                if (a5)
                  *a5 = 1;
                objc_msgSend(v8, "wallTime");
                v28 = v27;
                -[SATimestamp wallTime](self, "wallTime");
LABEL_34:
                v26 = v28 - v29;

                goto LABEL_35;
              }
            }
            break;
          default:
            v23 = *__error();
            _sa_logt();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
            {
              v25 = objc_msgSend(v15, "unsignedLongLongValue");
              *(_DWORD *)buf = v33;
              v39 = v25;
              _os_log_fault_impl(&dword_1B9BE0000, v24, OS_LOG_TYPE_FAULT, "Invalid time domain 0x%llx", buf, 0xCu);
            }

            *__error() = v23;
            break;
        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      if (v12)
        continue;
      break;
    }
  }

  v26 = 0.0;
  if (a5)
    *a5 = 0;
LABEL_35:

  return v26;
}

- (int64_t)deltaMachTo:(id)a3 timeDomainPriorityList:(id)a4 timeDomainUsed:(unint64_t *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = a4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v26;
    *(_QWORD *)&v11 = 134217984;
    v24 = v11;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "unsignedLongLongValue", v24, (_QWORD)v25);
        if (v16 == 2)
        {
          if (-[SATimestamp machAbsTime](self, "machAbsTime") && objc_msgSend(v8, "machAbsTime"))
          {
            if (a5)
              *a5 = 2;
            v21 = objc_msgSend(v8, "machAbsTime");
            v22 = -[SATimestamp machAbsTime](self, "machAbsTime");
            goto LABEL_27;
          }
        }
        else if (v16 == 8)
        {
          if (-[SATimestamp machContTime](self, "machContTime") && objc_msgSend(v8, "machContTime"))
          {
            if (a5)
              *a5 = 8;
            v21 = objc_msgSend(v8, "machContTime");
            v22 = -[SATimestamp machContTime](self, "machContTime");
LABEL_27:
            v20 = v21 - v22;

            goto LABEL_28;
          }
        }
        else
        {
          v17 = *__error();
          _sa_logt();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            v19 = objc_msgSend(v15, "unsignedLongLongValue");
            *(_DWORD *)buf = v24;
            v30 = v19;
            _os_log_fault_impl(&dword_1B9BE0000, v18, OS_LOG_TYPE_FAULT, "Invalid time domain 0x%llx", buf, 0xCu);
          }

          *__error() = v17;
        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v12)
        continue;
      break;
    }
  }

  v20 = 0;
  if (a5)
    *a5 = 0;
LABEL_28:

  return v20;
}

- (BOOL)lt:(id)a3
{
  return -[SATimestamp compare:](self, "compare:", a3) == -1;
}

- (BOOL)gt:(id)a3
{
  return -[SATimestamp compare:](self, "compare:", a3) == 1;
}

- (BOOL)eq:(id)a3
{
  return -[SATimestamp compare:](self, "compare:", a3) == 0;
}

- (BOOL)ne:(id)a3
{
  return -[SATimestamp compare:](self, "compare:", a3) != 0;
}

- (BOOL)isEqualToTimestamp:(id)a3
{
  SATimestamp *v4;
  BOOL v5;

  v4 = (SATimestamp *)a3;
  v5 = self == v4
    || self->_machAbsTime == v4->_machAbsTime
    && self->_machContTime == v4->_machContTime
    && self->_wallTime == v4->_wallTime;

  return v5;
}

- (void)guessMissingTimesBasedOnTimestamp:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(void);
  id v8;
  void (**v9)(void);
  double *v10;
  void (**v11)(void);
  SATimestamp *v12;
  double machAbsTimeSeconds;
  unint64_t machAbsTime;
  uint64_t v15;
  BOOL v16;
  char v17;
  uint64_t *v18;
  double v19;
  uint64_t v20;
  BOOL v21;
  unint64_t v22;
  double v23;
  double v24;
  unint64_t v25;
  uint64_t v26;
  double machContTimeSeconds;
  unint64_t machContTime;
  unint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t *v32;
  double v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  unint64_t v42;
  int v43;
  NSObject *v44;
  uint64_t v45;
  unint64_t v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  NSObject *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  SATimestamp *v59;
  uint64_t v60;
  unint64_t v61;
  SATimestamp *v62;
  uint64_t v63;
  int v64;
  NSObject *v65;
  unint64_t v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  NSObject *v75;
  unint64_t v76;
  double v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  _QWORD v89[5];
  double *v90;
  uint64_t *v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  _QWORD v101[5];
  id v102;
  uint64_t *v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  char v108;
  uint64_t v109;
  double *v110;
  uint64_t v111;
  uint64_t v112;
  _QWORD v113[4];
  id v114;
  SATimestamp *v115;
  uint64_t *v116;
  uint64_t *v117;
  uint64_t v118;
  double *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  uint8_t buf[4];
  unint64_t v128;
  __int16 v129;
  double v130;
  __int16 v131;
  uint64_t v132;
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_machAbsTime
    || self->_machAbsTimeSeconds == 0.0
    || !self->_machContTime
    || self->_machContTimeSeconds == 0.0
    || self->_wallTime == 0.0)
  {
    v122 = 0;
    v123 = &v122;
    v124 = 0x2810000000;
    v125 = &unk_1B9CEFD9F;
    v126 = 0;
    v118 = 0;
    v119 = (double *)&v118;
    v120 = 0x2020000000;
    v5 = MEMORY[0x1E0C809B0];
    v121 = 0;
    v113[0] = MEMORY[0x1E0C809B0];
    v113[1] = 3221225472;
    v113[2] = __49__SATimestamp_guessMissingTimesBasedOnTimestamp___block_invoke;
    v113[3] = &unk_1E7148CA0;
    v116 = &v118;
    v88 = v4;
    v6 = v4;
    v114 = v6;
    v115 = self;
    v117 = &v122;
    v7 = (void (**)(void))MEMORY[0x1BCCCC450](v113);
    v7[2]();
    v109 = 0;
    v110 = (double *)&v109;
    v111 = 0x2020000000;
    v112 = 0;
    v105 = 0;
    v106 = &v105;
    v107 = 0x2020000000;
    v108 = 0;
    v101[0] = v5;
    v101[1] = 3221225472;
    v101[2] = __49__SATimestamp_guessMissingTimesBasedOnTimestamp___block_invoke_4;
    v101[3] = &unk_1E7148CA0;
    v103 = &v105;
    v101[4] = self;
    v8 = v6;
    v102 = v8;
    v104 = &v109;
    v9 = (void (**)(void))MEMORY[0x1BCCCC450](v101);
    v9[2]();
    v97 = 0;
    v98 = &v97;
    v99 = 0x2020000000;
    v100 = 0;
    v93 = 0;
    v94 = &v93;
    v95 = 0x2020000000;
    v96 = 0;
    v89[0] = v5;
    v89[1] = 3221225472;
    v89[2] = __49__SATimestamp_guessMissingTimesBasedOnTimestamp___block_invoke_2;
    v89[3] = &unk_1E7148CA0;
    v91 = &v93;
    v89[4] = self;
    v10 = (double *)v8;
    v90 = v10;
    v92 = &v97;
    v11 = (void (**)(void))MEMORY[0x1BCCCC450](v89);
    v11[2]();
    v12 = 0;
    while (1)
    {
      if (v119[3] == 0.0)
      {
        v17 = 0;
        goto LABEL_84;
      }
      machAbsTimeSeconds = self->_machAbsTimeSeconds;
      if (!self->_machAbsTime)
      {
        if (machAbsTimeSeconds == 0.0)
        {
LABEL_32:
          v17 = 0;
          goto LABEL_51;
        }
        if (!v12)
          v12 = (SATimestamp *)-[SATimestamp copy](self, "copy");
        v18 = v123;
        if (*((_DWORD *)v123 + 8))
        {
          v19 = self->_machAbsTimeSeconds;
          if (*((_DWORD *)v123 + 9))
          {
            v20 = v123[4];
            if ((_DWORD)v20)
              v21 = HIDWORD(v20) == 0;
            else
              v21 = 1;
            if (v21)
            {
              v22 = 0;
            }
            else
            {
              v22 = (unint64_t)(v19 * 1000000000.0);
              if (HIDWORD(v20) != (_DWORD)v20)
                v22 = __udivti3();
            }
            v25 = 0;
            self->_machAbsTime = v22;
            v26 = v18[4];
            if ((_DWORD)v26)
            {
              v24 = 1000000000.0;
              if (HIDWORD(v26))
              {
                if ((_DWORD)v26 != HIDWORD(v26))
                  v22 = __udivti3();
                v25 = v22;
                goto LABEL_48;
              }
            }
            else
            {
LABEL_48:
              v24 = 1000000000.0;
            }
LABEL_49:
            self->_machAbsTimeSeconds = (double)v25 / v24;
            ((void (*)(void (**)(void)))v7[2])(v7);
            ((void (*)(void (**)(void)))v9[2])(v9);
            ((void (*)(void (**)(void)))v11[2])(v11);
            goto LABEL_50;
          }
        }
        else
        {
          v19 = self->_machAbsTimeSeconds;
        }
        v24 = v119[3];
        v25 = (unint64_t)(v19 * v24);
        self->_machAbsTime = v25;
        goto LABEL_49;
      }
      if (machAbsTimeSeconds != 0.0)
        goto LABEL_32;
      if (!v12)
        v12 = (SATimestamp *)-[SATimestamp copy](self, "copy");
      if (*((_DWORD *)v123 + 8))
      {
        machAbsTime = self->_machAbsTime;
        if (*((_DWORD *)v123 + 9))
        {
          v15 = v123[4];
          if ((_DWORD)v15)
            v16 = HIDWORD(v15) == 0;
          else
            v16 = 1;
          if (v16)
          {
            machAbsTime = 0;
          }
          else if ((_DWORD)v15 != HIDWORD(v15))
          {
            machAbsTime = __udivti3();
          }
          v23 = (double)machAbsTime / 1000000000.0;
          goto LABEL_40;
        }
      }
      else
      {
        machAbsTime = self->_machAbsTime;
      }
      v23 = (double)machAbsTime / v119[3];
LABEL_40:
      self->_machAbsTimeSeconds = v23;
      ((void (*)(void (**)(void)))v7[2])(v7);
      ((void (*)(void (**)(void)))v9[2])(v9);
      ((void (*)(void (**)(void)))v11[2])(v11);
LABEL_50:
      v17 = 1;
LABEL_51:
      machContTimeSeconds = self->_machContTimeSeconds;
      if (!self->_machContTime)
      {
        if (machContTimeSeconds == 0.0)
          goto LABEL_84;
        if (!v12)
          v12 = (SATimestamp *)-[SATimestamp copy](self, "copy");
        v32 = v123;
        if (*((_DWORD *)v123 + 8))
        {
          v33 = self->_machContTimeSeconds;
          if (*((_DWORD *)v123 + 9))
          {
            v34 = 0;
            v35 = v123[4];
            if ((_DWORD)v35)
            {
              if (HIDWORD(v35))
              {
                v34 = (unint64_t)(v33 * 1000000000.0);
                if (HIDWORD(v35) != (_DWORD)v35)
                  v34 = __udivti3();
              }
            }
            v36 = 0;
            self->_machContTime = v34;
            v37 = v32[4];
            if ((_DWORD)v37)
            {
              v38 = 1000000000.0;
              if (HIDWORD(v37))
              {
                if ((_DWORD)v37 != HIDWORD(v37))
                  v34 = __udivti3();
                v36 = v34;
                goto LABEL_76;
              }
            }
            else
            {
LABEL_76:
              v38 = 1000000000.0;
            }
LABEL_82:
            self->_machContTimeSeconds = (double)v36 / v38;
            ((void (*)(void (**)(void)))v7[2])(v7);
            ((void (*)(void (**)(void)))v9[2])(v9);
            ((void (*)(void (**)(void)))v11[2])(v11);
            goto LABEL_83;
          }
        }
        else
        {
          v33 = self->_machContTimeSeconds;
        }
        v38 = v119[3];
        v36 = (unint64_t)(v33 * v38);
        self->_machContTime = v36;
        goto LABEL_82;
      }
      if (machContTimeSeconds != 0.0)
        goto LABEL_84;
      if (!v12)
        v12 = (SATimestamp *)-[SATimestamp copy](self, "copy");
      if (*((_DWORD *)v123 + 8))
      {
        machContTime = self->_machContTime;
        if (*((_DWORD *)v123 + 9))
        {
          v29 = 0;
          v30 = v123[4];
          if ((_DWORD)v30)
          {
            if (HIDWORD(v30))
            {
              v29 = self->_machContTime;
              if ((_DWORD)v30 != HIDWORD(v30))
                v29 = __udivti3();
            }
          }
          v31 = (double)v29 / 1000000000.0;
          goto LABEL_79;
        }
      }
      else
      {
        machContTime = self->_machContTime;
      }
      v31 = (double)machContTime / v119[3];
LABEL_79:
      self->_machContTimeSeconds = v31;
      ((void (*)(void (**)(void)))v7[2])(v7);
      ((void (*)(void (**)(void)))v9[2])(v9);
      ((void (*)(void (**)(void)))v11[2])(v11);
LABEL_83:
      v17 = 1;
LABEL_84:
      if (!*((_BYTE *)v94 + 24))
        goto LABEL_89;
      if (!self->_machAbsTime)
      {
        v41 = *((_QWORD *)v10 + 1);
        if (v41)
        {
          v42 = v98[3] + v41;
          if (v42 > self->_machContTime)
          {
            v43 = *__error();
            _sa_logt();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              v61 = v98[3];
              if (v12)
                v62 = v12;
              else
                v62 = self;
              -[SATimestamp debugDescription](v62, "debugDescription");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "debugDescription");
              v63 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218498;
              v128 = v61;
              v129 = 2114;
              v130 = *(double *)&v87;
              v131 = 2114;
              v132 = v63;
              v85 = (void *)v63;
              _os_log_debug_impl(&dword_1B9BE0000, v44, OS_LOG_TYPE_DEBUG, "guessing missing timestamps: underflowed mach abs time with delta %llu:\n%{public}@ based on\n%{public}@", buf, 0x20u);

            }
            *__error() = v43;
            goto LABEL_86;
          }
          if (!v12)
          {
            v12 = (SATimestamp *)-[SATimestamp copy](self, "copy");
            v42 = v98[3] + *((_QWORD *)v10 + 1);
          }
          self->_machAbsTime = v42;
          v55 = v119[3];
          if (v55 != 0.0)
          {
            if (*((_DWORD *)v123 + 8) && *((_DWORD *)v123 + 9))
            {
              v56 = 0;
              v57 = v123[4];
              if (!(_DWORD)v57)
                goto LABEL_140;
              v55 = 1000000000.0;
              if (HIDWORD(v57))
              {
                if ((_DWORD)v57 == HIDWORD(v57))
                  v56 = v42;
                else
                  v56 = __udivti3();
LABEL_140:
                v55 = 1000000000.0;
              }
            }
            else
            {
              v56 = v42;
            }
            self->_machAbsTimeSeconds = (double)(unint64_t)v56 / v55;
          }
          ((void (*)(void (**)(void)))v7[2])(v7);
          ((void (*)(void (**)(void)))v9[2])(v9);
          ((void (*)(void (**)(void)))v11[2])(v11);
          v17 = 1;
        }
      }
LABEL_86:
      if (self->_machContTime || (v45 = *((_QWORD *)v10 + 3)) == 0)
      {
        if ((v17 & 1) == 0)
        {
          v17 = 0;
          if (!*((_BYTE *)v106 + 24))
            goto LABEL_124;
LABEL_89:
          if (self->_machAbsTimeSeconds == 0.0)
          {
            v39 = v10[2];
            if (v39 != 0.0)
            {
              v40 = v39 + v110[3];
              if (v40 <= 0.0)
              {
                v50 = *__error();
                _sa_logt();
                v51 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                {
                  v58 = *((_QWORD *)v110 + 3);
                  if (v12)
                    v59 = v12;
                  else
                    v59 = self;
                  -[SATimestamp debugDescription](v59, "debugDescription");
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "debugDescription");
                  v60 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 134218498;
                  v128 = v58;
                  v129 = 2114;
                  v130 = *(double *)&v86;
                  v131 = 2114;
                  v132 = v60;
                  v84 = (void *)v60;
                  _os_log_debug_impl(&dword_1B9BE0000, v51, OS_LOG_TYPE_DEBUG, "guessing missing timestamps: underflowed mach abs time seconds with delta %f:\n%{public}@ based on\n%{public}@", buf, 0x20u);

                }
                *__error() = v50;
              }
              else
              {
                if (!v12)
                {
                  v12 = (SATimestamp *)-[SATimestamp copy](self, "copy");
                  v40 = v10[2] + v110[3];
                }
                self->_machAbsTimeSeconds = v40;
                ((void (*)(void (**)(void)))v7[2])(v7);
                ((void (*)(void (**)(void)))v9[2])(v9);
                ((void (*)(void (**)(void)))v11[2])(v11);
                v17 = 1;
              }
            }
          }
          if (self->_machContTimeSeconds == 0.0)
          {
            v52 = v10[4];
            if (v52 != 0.0)
            {
              v53 = v52 + v110[3];
              if (v53 > 0.0)
              {
                if (!v12)
                {
                  v12 = (SATimestamp *)-[SATimestamp copy](self, "copy");
                  v53 = v10[4] + v110[3];
                }
                self->_machContTimeSeconds = v53;
                ((void (*)(void (**)(void)))v7[2])(v7);
                ((void (*)(void (**)(void)))v9[2])(v9);
                ((void (*)(void (**)(void)))v11[2])(v11);
                v17 = 1;
              }
            }
          }
          if (self->_wallTime == 0.0 && (v54 = v10[5], v54 != 0.0))
          {
            if (!v12)
            {
              v12 = (SATimestamp *)-[SATimestamp copy](self, "copy");
              v54 = v10[5];
            }
            self->_wallTime = v54 + v110[3];
            ((void (*)(void (**)(void)))v7[2])(v7);
            ((void (*)(void (**)(void)))v9[2])(v9);
            ((void (*)(void (**)(void)))v11[2])(v11);
          }
          else
          {
LABEL_124:
            if ((v17 & 1) == 0)
            {
              if (self->_machAbsTime || self->_machAbsTimeSeconds == 0.0)
              {
                if (self->_machContTime || self->_machContTimeSeconds == 0.0)
                {

                  _Block_object_dispose(&v93, 8);
                  _Block_object_dispose(&v97, 8);

                  _Block_object_dispose(&v105, 8);
                  _Block_object_dispose(&v109, 8);

                  _Block_object_dispose(&v118, 8);
                  _Block_object_dispose(&v122, 8);

                  v4 = v88;
                  break;
                }
              }
              else
              {
                v64 = *__error();
                _sa_logt();
                v65 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                {
                  v66 = self->_machAbsTime;
                  v67 = self->_machAbsTimeSeconds;
                  *(_DWORD *)buf = 134218240;
                  v128 = v66;
                  v129 = 2048;
                  v130 = v67;
                  _os_log_error_impl(&dword_1B9BE0000, v65, OS_LOG_TYPE_ERROR, "machAbs %llu and machAbsSec %f", buf, 0x16u);
                }

                *__error() = v64;
                _SASetCrashLogMessage(516, "machAbs %llu and machAbsSec %f", v68, v69, v70, v71, v72, v73, self->_machAbsTime);
                _os_crash();
                __break(1u);
              }
              v74 = *__error();
              _sa_logt();
              v75 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
              {
                v76 = self->_machContTime;
                v77 = self->_machContTimeSeconds;
                *(_DWORD *)buf = 134218240;
                v128 = v76;
                v129 = 2048;
                v130 = v77;
                _os_log_error_impl(&dword_1B9BE0000, v75, OS_LOG_TYPE_ERROR, "machCont %llu and machContSec %f", buf, 0x16u);
              }

              *__error() = v74;
              _SASetCrashLogMessage(517, "machCont %llu and machContSec %f", v78, v79, v80, v81, v82, v83, self->_machContTime);
              _os_crash();
              __break(1u);
            }
          }
        }
      }
      else
      {
        if (!v12)
        {
          v12 = (SATimestamp *)-[SATimestamp copy](self, "copy");
          v45 = *((_QWORD *)v10 + 3);
        }
        v46 = v98[3] + v45;
        self->_machContTime = v46;
        v47 = v119[3];
        if (v47 != 0.0)
        {
          if (*((_DWORD *)v123 + 8) && *((_DWORD *)v123 + 9))
          {
            v48 = 0;
            v49 = v123[4];
            if (!(_DWORD)v49)
              goto LABEL_110;
            v47 = 1000000000.0;
            if (HIDWORD(v49))
            {
              v48 = v46;
              v47 = 1000000000.0;
              if ((_DWORD)v49 != HIDWORD(v49))
              {
                v48 = __udivti3();
LABEL_110:
                v47 = 1000000000.0;
              }
            }
          }
          else
          {
            v48 = v46;
          }
          self->_machContTimeSeconds = (double)(unint64_t)v48 / v47;
        }
        ((void (*)(void (**)(void)))v7[2])(v7);
        ((void (*)(void (**)(void)))v9[2])(v9);
        ((void (*)(void (**)(void)))v11[2])(v11);
      }
    }
  }

}

int *__49__SATimestamp_guessMissingTimesBasedOnTimestamp___block_invoke(int *result, double a2, double a3, double a4, double a5)
{
  uint64_t v5;
  double v6;
  int *v7;
  uint64_t v8;
  unint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t *v14;
  double v15;
  char v16;
  uint64_t v17;
  int v18;
  NSObject *v19;
  double v20;
  int v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(*((_QWORD *)result + 6) + 8);
  v6 = *(double *)(v5 + 24);
  if (v6 == 0.0)
  {
    v7 = result;
    v8 = *((_QWORD *)result + 4);
    v9 = *(_QWORD *)(v8 + 8);
    if (v9)
    {
      v10 = *(double *)(v8 + 16);
      if (v10 != 0.0)
        goto LABEL_10;
    }
    if ((v9 = *(_QWORD *)(v8 + 24)) != 0 && (v10 = *(double *)(v8 + 32), v10 != 0.0)
      || (v11 = *((_QWORD *)result + 5), (v9 = *(_QWORD *)(v11 + 8)) != 0) && (v10 = *(double *)(v11 + 16), v10 != 0.0)
      || (v9 = *(_QWORD *)(v11 + 24)) != 0 && (v10 = *(double *)(v11 + 32), v10 != 0.0))
    {
LABEL_10:
      *(double *)(v5 + 24) = (double)v9 / v10;
      v6 = *(double *)(*(_QWORD *)(*((_QWORD *)result + 6) + 8) + 24);
    }
    v12 = 0;
    v13 = 1;
    while (1)
    {
      v14 = &TRIGeneralErrorDomain_block_invoke_knownMachTimebases[v12];
      LODWORD(a5) = *(_DWORD *)v14;
      LODWORD(a4) = *((_DWORD *)v14 + 1);
      v15 = (double)*(unint64_t *)&a4 * 1000000000.0 / (double)*(unint64_t *)&a5;
      a5 = vabdd_f64(v15, v6);
      a4 = a5 / v15;
      if (a4 < 0.0000001)
        break;
      v16 = v13;
      v13 = 0;
      v12 = 1;
      if ((v16 & 1) == 0)
        goto LABEL_16;
    }
    *(_QWORD *)(*(_QWORD *)(*((_QWORD *)result + 7) + 8) + 32) = *v14;
LABEL_16:
    v17 = *(_QWORD *)(*((_QWORD *)result + 7) + 8);
    if (!*(_DWORD *)(v17 + 32) || !*(_DWORD *)(v17 + 36))
    {
      v18 = *__error();
      _sa_logt();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v20 = *(double *)(*(_QWORD *)(*((_QWORD *)v7 + 6) + 8) + 24) / 1000000000.0;
        v21 = 134217984;
        v22 = v20;
        _os_log_fault_impl(&dword_1B9BE0000, v19, OS_LOG_TYPE_FAULT, "Using unknown mach timebase %f", (uint8_t *)&v21, 0xCu);
      }

      result = __error();
      *result = v18;
    }
  }
  return result;
}

double __49__SATimestamp_guessMissingTimesBasedOnTimestamp___block_invoke_4(_QWORD *a1)
{
  uint64_t v1;
  double *v2;
  uint64_t v3;
  double result;

  v1 = *(_QWORD *)(a1[6] + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = (double *)a1[4];
    if (v2[4] == 0.0 || *(double *)(a1[5] + 32) == 0.0)
    {
      if (v2[5] == 0.0 || *(double *)(a1[5] + 40) == 0.0)
      {
        result = v2[2];
        if (result == 0.0)
          return result;
        result = *(double *)(a1[5] + 16);
        if (result == 0.0)
          return result;
        v3 = 16;
      }
      else
      {
        v3 = 40;
      }
    }
    else
    {
      v3 = 32;
    }
    *(_BYTE *)(v1 + 24) = 1;
    result = *(double *)(a1[4] + v3) - *(double *)(a1[5] + v3);
    *(double *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  }
  return result;
}

_QWORD *__49__SATimestamp_guessMissingTimesBasedOnTimestamp___block_invoke_2(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result[6] + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result[4];
    if (*(_QWORD *)(v2 + 8) && *(_QWORD *)(result[5] + 8))
    {
      v3 = 8;
    }
    else
    {
      if (!*(_QWORD *)(v2 + 24) || !*(_QWORD *)(result[5] + 24))
        return result;
      v3 = 24;
    }
    *(_BYTE *)(v1 + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(result[7] + 8) + 24) = *(_QWORD *)(result[4] + v3) - *(_QWORD *)(result[5] + v3);
  }
  return result;
}

- (void)guessMissingTimesBasedOnCurrentTime
{
  id v3;

  +[SATimestamp timestamp](SATimestamp, "timestamp");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SATimestamp guessMissingTimesBasedOnTimestamp:](self, "guessMissingTimesBasedOnTimestamp:", v3);

}

- (NSString)debugDescription
{
  __CFString *v3;
  void *v4;

  v3 = (__CFString *)_CopyStringForTime(3, self->_wallTime);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ machabs:%llu (%fs) machcont:%llu (%fs)"), v3, self->_machAbsTime, *(_QWORD *)&self->_machAbsTimeSeconds, self->_machContTime, *(_QWORD *)&self->_machContTimeSeconds);

  return (NSString *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:", self->_machAbsTime, self->_machContTime, self->_machAbsTimeSeconds, self->_machContTimeSeconds, self->_wallTime);
}

- (id)copyDate
{
  if (self->_wallTime == 0.0)
    return 0;
  else
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", self->_wallTime);
}

- (unint64_t)machAbsTime
{
  return self->_machAbsTime;
}

- (double)machAbsTimeSeconds
{
  return self->_machAbsTimeSeconds;
}

- (double)machContTimeSeconds
{
  return self->_machContTimeSeconds;
}

- (double)wallTime
{
  return self->_wallTime;
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (self->_wallTime == 0.0)
  {
    if (!self->_machAbsTime)
    {
      if (!self->_machContTime)
        goto LABEL_10;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      SAJSONWriteDictionaryFirstEntry(v7, (uint64_t)CFSTR("machContTime"), v6);
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryFirstEntry(v7, (uint64_t)CFSTR("machAbsTime"), v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryFirstEntry(v7, (uint64_t)CFSTR("wallTimeCF"), v4);

    if (!self->_machAbsTime)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v7, CFSTR("machAbsTime"), v5);
  }

LABEL_7:
  if (self->_machContTime)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v7, CFSTR("machContTime"), v6);
LABEL_9:

  }
LABEL_10:

}

+ (id)classDictionaryKey
{
  return CFSTR("SATimestamp");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 26;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v8;
  unint64_t machAbsTime;
  int v11;
  NSObject *v12;
  id v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  unint64_t v24;
  double machAbsTimeSeconds;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  NSObject *v33;
  unint64_t machContTime;
  double machContTimeSeconds;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  unint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[SATimestamp sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v11 = *__error();
    _sa_logt();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[SATimestamp debugDescription](self, "debugDescription");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v43 = objc_msgSend(v13, "UTF8String");
      v44 = 2048;
      v45 = -[SATimestamp sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v46 = 2048;
      v47 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v11;
    -[SATimestamp debugDescription](self, "debugDescription");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "UTF8String");
    -[SATimestamp sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(765, "%s: size %lu != buffer length %lu", v16, v17, v18, v19, v20, v21, v15);

    _os_crash();
    __break(1u);
    goto LABEL_10;
  }
  *(_WORD *)&a3->var0 = 257;
  machAbsTime = self->_machAbsTime;
  if (!machAbsTime && self->_machAbsTimeSeconds != 0.0)
  {
LABEL_10:
    v22 = *__error();
    _sa_logt();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = self->_machAbsTime;
      machAbsTimeSeconds = self->_machAbsTimeSeconds;
      *(_DWORD *)buf = 134218240;
      v43 = v24;
      v44 = 2048;
      v45 = *(_QWORD *)&machAbsTimeSeconds;
      _os_log_error_impl(&dword_1B9BE0000, v23, OS_LOG_TYPE_ERROR, "machAbs %llu and machAbsSec %f", buf, 0x16u);
    }

    *__error() = v22;
    _SASetCrashLogMessage(771, "machAbs %llu and machAbsSec %f", v26, v27, v28, v29, v30, v31, self->_machAbsTime);
    _os_crash();
    __break(1u);
LABEL_13:
    v32 = *__error();
    _sa_logt();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      machContTime = self->_machContTime;
      machContTimeSeconds = self->_machContTimeSeconds;
      *(_DWORD *)buf = 134218240;
      v43 = machContTime;
      v44 = 2048;
      v45 = *(_QWORD *)&machContTimeSeconds;
      _os_log_error_impl(&dword_1B9BE0000, v33, OS_LOG_TYPE_ERROR, "machCont %llu and machContSec %f", buf, 0x16u);
    }

    *__error() = v32;
    _SASetCrashLogMessage(772, "machCont %llu and machContSec %f", v36, v37, v38, v39, v40, v41, self->_machContTime);
    _os_crash();
    __break(1u);
  }
  if (!self->_machContTime && self->_machContTimeSeconds != 0.0)
    goto LABEL_13;
  *(_QWORD *)(&a3->var1 + 1) = machAbsTime;
  *(unint64_t *)((char *)&a3->var2 + 2) = self->_machContTime;
  *(unint64_t *)((char *)&a3->var3 + 2) = *(_QWORD *)&self->_wallTime;

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "classDictionaryKey");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  unint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_7;
  if (a4 <= 0x19)
  {
    v6 = *__error();
    _sa_logt();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v16 = a4;
      v17 = 2048;
      v18 = 26;
      _os_log_error_impl(&dword_1B9BE0000, v7, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATimestamp struct %lu", buf, 0x16u);
    }

    *__error() = v6;
    _SASetCrashLogMessage(790, "bufferLength %lu < serialized SATimestamp struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SATimestamp version"), 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:](SATimestamp, "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:", *(_QWORD *)((char *)a3 + 2), *(_QWORD *)((char *)a3 + 10), 0.0, 0.0, *(double *)((char *)a3 + 18));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)applyMachTimebase:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;

  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 8);
    v5 = *(double *)(result + 16);
    if (v4)
    {
      if (v5 == 0.0)
      {
        result = 0;
        if ((_DWORD)a2)
        {
          if (HIDWORD(a2))
          {
            result = v4;
            if ((_DWORD)a2 != HIDWORD(a2))
              result = __udivti3();
          }
        }
        *(double *)(v3 + 16) = (double)(unint64_t)result / 1000000000.0;
      }
    }
    else if (v5 != 0.0)
    {
      result = 0;
      if ((_DWORD)a2)
      {
        if (HIDWORD(a2))
        {
          result = (unint64_t)(v5 * 1000000000.0);
          if (HIDWORD(a2) != (_DWORD)a2)
            result = __udivti3();
        }
      }
      *(_QWORD *)(v3 + 8) = result;
    }
    v6 = *(double *)(v3 + 32);
    if (*(_QWORD *)(v3 + 24))
    {
      if (v6 == 0.0)
      {
        result = 0;
        if ((_DWORD)a2 && HIDWORD(a2))
        {
          result = *(_QWORD *)(v3 + 24);
          if ((_DWORD)a2 != HIDWORD(a2))
            result = __udivti3();
        }
        *(double *)(v3 + 32) = (double)(unint64_t)result / 1000000000.0;
      }
    }
    else if (v6 != 0.0)
    {
      result = 0;
      if ((_DWORD)a2)
      {
        if (HIDWORD(a2))
        {
          result = (unint64_t)(v6 * 1000000000.0);
          if (HIDWORD(a2) != (_DWORD)a2)
            result = __udivti3();
        }
      }
      *(_QWORD *)(v3 + 24) = result;
    }
  }
  return result;
}

@end

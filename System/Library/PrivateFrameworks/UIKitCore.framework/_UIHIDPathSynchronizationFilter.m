@implementation _UIHIDPathSynchronizationFilter

- (double)initWithPosition:(double)a3 timestamp:(double)a4 configuration:(double)a5
{
  double *v13;
  double *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  NSObject *v19;
  objc_super v20;
  uint8_t buf[4];
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v20.receiver = a1;
  v20.super_class = (Class)_UIHIDPathSynchronizationFilter;
  v13 = (double *)objc_msgSendSuper2(&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    v13[9] = a5;
    v13[10] = a6;
    v13[11] = a7;
    v13[1] = a2;
    v13[2] = a3;
    v13[3] = a4;
    v13[4] = a2;
    v13[5] = a3;
    v13[6] = a4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v14 + 8);
    *((_QWORD *)v14 + 8) = v15;

    v14[12] = 0.0;
    v17 = initWithPosition_timestamp_configuration____s_category;
    if (!initWithPosition_timestamp_configuration____s_category)
    {
      v17 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v17, (unint64_t *)&initWithPosition_timestamp_configuration____s_category);
    }
    if ((*(_BYTE *)v17 & 1) != 0)
    {
      v19 = *(NSObject **)(v17 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134219264;
        v22 = a2;
        v23 = 2048;
        v24 = a3;
        v25 = 2048;
        v26 = a4;
        v27 = 2048;
        v28 = a5;
        v29 = 2048;
        v30 = a6;
        v31 = 2048;
        v32 = a7;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "[FILTER] initialized with position [%f;%f], timestamp: %f. Configuration: (%f, %f, %f)",
          buf,
          0x3Eu);
      }
    }
  }
  return v14;
}

- (double)initWithPosition:(double)a3 timestamp:(double)a4
{
  double *v7;
  double v8;
  double v9;
  double v10;

  if (result)
  {
    v7 = result;
    v8 = _UIHIDPathSynchronizationFilterConfigurationDefault();
    return -[_UIHIDPathSynchronizationFilter initWithPosition:timestamp:configuration:](v7, a2, a3, a4, v8, v9, v10);
  }
  return result;
}

- (uint64_t)addInputEvent:(uint64_t)result
{
  uint64_t v2;
  unint64_t TimeStamp;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (result)
  {
    v2 = result;
    if (*(_QWORD *)(result + 96) == 2)
      return 0;
    TimeStamp = IOHIDEventGetTimeStamp();
    v5 = _UIMediaTimeForMachTime(TimeStamp);
    if (*(double *)(v2 + 48) >= v5)
    {
      return 0;
    }
    else
    {
      *(double *)(v2 + 48) = v5;
      IOHIDEventGetFloatValue();
      v7 = v6;
      IOHIDEventGetFloatValue();
      *(_QWORD *)(v2 + 32) = v7;
      *(_QWORD *)(v2 + 40) = v8;
      objc_msgSend(*(id *)(v2 + 64), "addObject:", a2);
      return 1;
    }
  }
  return result;
}

- (void)computeNextOutputPosition:(uint64_t)a1
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSObject *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t TimeStamp;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  unint64_t v37;
  float64x2_t v38;
  double v39;
  BOOL v40;
  unint64_t v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  os_log_t log;
  NSObject *loga;
  double v48;
  double v49;
  double v50;
  uint8_t buf[4];
  double v53;
  __int16 v54;
  double v55;
  __int16 v56;
  double v57;
  __int16 v58;
  double v59;
  __int16 v60;
  double v61;
  __int16 v62;
  double v63;
  __int16 v64;
  double v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 96);
    if (v3 == 2)
    {
      v6 = qword_1ECD7AFF0;
      if (!qword_1ECD7AFF0)
      {
        v6 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v6, (unint64_t *)&qword_1ECD7AFF0);
      }
      if ((*(_BYTE *)v6 & 1) != 0)
      {
        v7 = *(NSObject **)(v6 + 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v8 = *(double *)(a1 + 96);
          *(_DWORD *)buf = 134217984;
          v53 = v8;
          _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "[FILTER] computeNextOutputPosition: unexpected state '%ld'.", buf, 0xCu);
        }
      }
    }
    else
    {
      if (v3 != 1)
      {
        if (v3)
          return;
        v4 = qword_1ECD7AFE0;
        if (!qword_1ECD7AFE0)
        {
          v4 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v4, (unint64_t *)&qword_1ECD7AFE0);
        }
        if ((*(_BYTE *)v4 & 1) != 0)
        {
          v42 = *(NSObject **)(v4 + 8);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_185066000, v42, OS_LOG_TYPE_ERROR, "[FILTER] computeNextOutputPosition: set initial output position values.", buf, 2u);
          }
        }
        *(_OWORD *)(a1 + 112) = *(_OWORD *)(a1 + 8);
        *(double *)(a1 + 104) = a2;
        *(_QWORD *)(a1 + 56) = *(_QWORD *)(a1 + 24);
        v5 = 1;
        goto LABEL_42;
      }
      v9 = *(double *)(a1 + 112);
      v10 = *(double *)(a1 + 120);
      if (objc_msgSend(*(id *)(a1 + 64), "count"))
      {
        v48 = v10;
        v49 = v9;
        while (1)
        {
          objc_msgSend(*(id *)(a1 + 64), "firstObject", v45);
          v11 = *(double *)(a1 + 56);
          TimeStamp = IOHIDEventGetTimeStamp();
          v13 = _UIMediaTimeForMachTime(TimeStamp);
          v14 = (*(double *)(a1 + 56) - *(double *)(a1 + 24)) / (*(double *)(a1 + 48) - *(double *)(a1 + 24));
          v15 = *(double *)(a1 + 104);
          v16 = *(double *)(a1 + 72);
          v17 = *(double *)(a1 + 80);
          v18 = *(double *)(a1 + 88);
          v19 = v14 < v18;
          v20 = (v14 - v18)
              / (1.0 - v18)
              * ((v14 - v18)
               / (1.0 - v18)
               * ((v14 - v18)
                / (1.0 - v18)
                * ((v14 - v18)
                 / (1.0 - v18))));
          v21 = (v14 / v18 + -1.0) * ((v14 / v18 + -1.0) * ((v14 / v18 + -1.0) * (v14 / v18 + -1.0)));
          if (v19)
            v22 = v21;
          else
            v22 = v20;
          v23 = _MergedGlobals_11_14;
          if (!_MergedGlobals_11_14)
          {
            v23 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v23, (unint64_t *)&_MergedGlobals_11_14);
          }
          v24 = v13 - v11;
          if ((*(_BYTE *)v23 & 1) != 0)
          {
            log = *(os_log_t *)(v23 + 8);
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              v45 = *(void **)(a1 + 64);
              loga = log;
              *(double *)&v26 = COERCE_DOUBLE(objc_msgSend(v45, "count"));
              *(_DWORD *)buf = 134218752;
              v53 = *(double *)&v26;
              v54 = 2048;
              v55 = v14;
              v56 = 2048;
              v57 = v17 * (1.0 - v22) + v16 * (1.0 - (1.0 - v22));
              v58 = 2048;
              v59 = v24;
              _os_log_impl(&dword_185066000, loga, OS_LOG_TYPE_ERROR, "[FILTER] processing next input segment (events remaining: %lu). Current progress: %f. Time scaling factor: %f. Segment duration: %f", buf, 0x2Au);

            }
          }
          v25 = (a2 - v15) * (v17 * (1.0 - v22) + v16 * (1.0 - (1.0 - v22)));
          if (v24 >= v25)
            break;
          objc_msgSend(*(id *)(a1 + 64), "removeObjectAtIndex:", 0);
          if (!objc_msgSend(*(id *)(a1 + 64), "count"))
          {
            v10 = v48;
            v9 = v49;
            goto LABEL_31;
          }
        }
        v28 = *(double *)(a1 + 112);
        v27 = *(double *)(a1 + 120);
        IOHIDEventGetFloatValue();
        v30 = v29;
        IOHIDEventGetFloatValue();
        v32 = v31;
        v33 = v25 / v24;
        v34 = 1.0 - v25 / v24;
        v35 = v34 * v28 + v25 / v24 * v30;
        v50 = v27;
        v36 = v34 * v27 + v25 / v24 * v32;
        v37 = qword_1ECD7AFD8;
        if (!qword_1ECD7AFD8)
        {
          v37 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v37, (unint64_t *)&qword_1ECD7AFD8);
        }
        v9 = round(v35);
        v10 = round(v36);
        if ((*(_BYTE *)v37 & 1) != 0)
        {
          v44 = *(NSObject **)(v37 + 8);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134219520;
            v53 = v33;
            v54 = 2048;
            v55 = v28;
            v56 = 2048;
            v57 = v50;
            v58 = 2048;
            v59 = v30;
            v60 = 2048;
            v61 = v32;
            v62 = 2048;
            v63 = v9;
            v64 = 2048;
            v65 = v10;
            _os_log_impl(&dword_185066000, v44, OS_LOG_TYPE_ERROR, "[FILTER] calculating new output position: (%f, [%f:%f], [%f:%f]) -> [%f:%f].", buf, 0x48u);
          }
        }
        *(double *)(a1 + 56) = v25 + *(double *)(a1 + 56);
      }
LABEL_31:
      if (!objc_msgSend(*(id *)(a1 + 64), "count", v45))
      {
        v9 = *(double *)(a1 + 32);
        v10 = *(double *)(a1 + 40);
      }
      *(double *)(a1 + 112) = v9;
      *(double *)(a1 + 120) = v10;
      *(double *)(a1 + 104) = a2;
      if (!objc_msgSend(*(id *)(a1 + 64), "count")
        || ((v38 = vsubq_f64(*(float64x2_t *)(a1 + 32), *(float64x2_t *)(a1 + 112)),
             v38.f64[0] = vaddvq_f64(vmulq_f64(v38, v38)),
             v39 = fabs(v38.f64[0]),
             v38.f64[0] > 1.0)
          ? (v40 = v39 > 2.22044605e-16)
          : (v40 = 0),
            !v40))
      {
        v41 = qword_1ECD7AFE8;
        if (!qword_1ECD7AFE8)
        {
          v41 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v41, (unint64_t *)&qword_1ECD7AFE8);
        }
        if ((*(_BYTE *)v41 & 1) != 0)
        {
          v43 = *(NSObject **)(v41 + 8);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_185066000, v43, OS_LOG_TYPE_ERROR, "[FILTER] computeNextOutputPosition: reached the target.", buf, 2u);
          }
        }
        v5 = 2;
LABEL_42:
        *(_QWORD *)(a1 + 96) = v5;
      }
    }
  }
}

- (double)outputPosition
{
  if (a1)
    return *(double *)(a1 + 112);
  else
    return 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputEvents, 0);
}

@end

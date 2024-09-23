@implementation _UIUpdateTarget

- (unint64_t)requestPresentaionForMode:(unint64_t)a3@<X2> earliestReferenceDeadlineTime:(unint64_t)a4@<X3> earliestCommitDeadlineTime:(unint64_t *)a5@<X8>
{
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;

  if (result)
  {
    v9 = result;
    if (a3 <= a4)
      v10 = a4;
    else
      v10 = a3;
    v11 = *(_QWORD *)(v9 + 32);
    objc_msgSend(*(id *)(v9 + 16), "commitDeadlineAfterTimestamp:", _UIMediaTimeForMachTime(v10));
    result = _UIMachTimeForMediaTime(v12);
    v13 = result;
    if (!result)
    {
      result = mach_absolute_time();
      v14 = *(_QWORD *)(v9 + 40) + result;
      if (v14 <= a3)
        v14 = a3;
      if (v14 <= a4)
        v13 = a4;
      else
        v13 = v14;
    }
    v15 = v13 - *(_QWORD *)(v9 + 8 * a2 + 64);
    v16 = *(_QWORD *)(v9 + 48 + 8 * a2);
    v17 = v13 - *(_QWORD *)(v9 + 80);
    v18 = v16 - *(_QWORD *)(v9 + 48);
    *a5 = v13;
    a5[1] = v15;
    a5[2] = v17;
    a5[3] = v16 + v13;
    a5[4] = v18;
    a5[5] = v15 + v11;
    if (_UIUpdateCycleDebugTracingCheck)
    {
      result = _UIUpdateCycleDebugTracingCheck();
      if ((_DWORD)result)
        return kdebug_trace();
    }
  }
  else
  {
    *((_OWORD *)a5 + 1) = 0u;
    *((_OWORD *)a5 + 2) = 0u;
    *(_OWORD *)a5 = 0u;
  }
  return result;
}

- (uint64_t)sync
{
  uint64_t v1;
  double v2;
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 8), "heartbeatRate");
    v3 = _UIMachTimeForMediaTime(v2);
    v4 = objc_msgSend(*(id *)(v1 + 8), "minimumFrameDuration");
    if (v3)
    {
      v5 = v4;
    }
    else
    {
      v3 = _UIMachTimeForMediaTime(0.0166666667);
      v5 = 1;
    }
    v6 = v3 * v5;
    if (*(_QWORD *)(v1 + 40) == v6)
    {
      return 0;
    }
    else
    {
      *(_QWORD *)(v1 + 40) = v6;
      v7 = _UIMachDurationForMediaDuration(0.0015);
      v8 = v3 >> 3;
      if (v7 > v3 >> 3)
        v8 = v7;
      *(_QWORD *)(v1 + 32) = v8;
      v9 = _UIDeviceNativeUserInterfaceIdiomIgnoringClassic();
      if (v9 == 4)
      {
        v10 = 1;
      }
      else if (v9)
      {
        v10 = 0;
      }
      else
      {
        v10 = _UIVariableFrameDurationEnabled();
      }
      *(_QWORD *)(v1 + 48) = v6 << v10;
      v11 = _UIMachDurationForMediaDuration(0.004);
      v12 = *(_QWORD *)(v1 + 32);
      *(_QWORD *)(v1 + 72) = v11;
      *(_QWORD *)(v1 + 80) = v6 - v12;
      kdebug_trace();
      return 1;
    }
  }
  return result;
}

- (unint64_t)syncedRequestedMaxFrameDuration
{
  float v1;

  if (result)
  {
    objc_msgSend(*(id *)(result + 8), "highestLocalPreferredFrameRateRequest");
    if (v1 <= 0.0)
      return -1;
    else
      return _UIMachDurationForMediaDuration(1.0 / v1);
  }
  return result;
}

- (uint64_t)start
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    *(_BYTE *)(result + 28) = 1;
    if (_UIUpdateCycleDebugTracingCheck)
    {
      if (_UIUpdateCycleDebugTracingCheck())
        kdebug_trace();
    }
    return objc_msgSend(*(id *)(v1 + 16), "setPaused:", 0);
  }
  return result;
}

- (uint64_t)stop
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    *(_BYTE *)(result + 28) = 0;
    if (_UIUpdateCycleDebugTracingCheck)
    {
      if (_UIUpdateCycleDebugTracingCheck())
        kdebug_trace();
    }
    return objc_msgSend(*(id *)(v1 + 16), "setPaused:", 1);
  }
  return result;
}

+ (_UIUpdateTarget)targetWithCADisplay:(uint64_t)a1
{
  _UIUpdateTarget *v3;
  _UIUpdateTarget *v4;
  uint64_t v5;
  CADynamicFrameRateSource *direct;

  objc_opt_self();
  v3 = [_UIUpdateTarget alloc];
  if (v3)
  {
    v4 = v3;
    objc_storeStrong((id *)&v3->_display.direct, a2);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD2750]), "initWithDisplay:", a2);
    direct = v4->_frameSource.direct;
    v4->_frameSource.direct = (CADynamicFrameRateSource *)v5;

    v3 = -[_UIUpdateTarget init](v4, "init");
  }
  return v3;
}

- (_UIUpdateTarget)init
{
  _UIUpdateTarget *v2;
  _UIUpdateTarget *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIUpdateTarget;
  v2 = -[_UIUpdateTarget init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_displayId = -[CADisplay displayId](v2->_display.direct, "displayId");
    v3->_frameSourceActive = -[CADynamicFrameRateSource isPaused](v3->_frameSource.direct, "isPaused") ^ 1;
    if (_UIUpdateCycleDebugTracingCheck && _UIUpdateCycleDebugTracingCheck())
      kdebug_trace();
    v3->_minFrameDuration = 0;
  }
  return v3;
}

- (void)dealloc
{
  CADynamicFrameRateSource *direct;
  CADisplay *v4;
  objc_super v5;

  direct = self->_frameSource.direct;
  self->_frameSource.direct = 0;

  v4 = self->_display.direct;
  self->_display.direct = 0;

  v5.receiver = self;
  v5.super_class = (Class)_UIUpdateTarget;
  -[_UIUpdateTarget dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{

}

@end

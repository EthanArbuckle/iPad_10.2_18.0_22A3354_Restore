@implementation CLFallMslSink

- (void)_insertSample:(void *)a3
{
  uint64_t v5;
  float v6;
  list<CMMsl::Item *, std::allocator<CMMsl::Item *>> *p_fOrderedSample;
  CLFallMslSink **v8;
  CLFallMslSink *v9;
  unint64_t v10;
  CLFallMslSink *next;
  CLFallMslSink *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  CLFallMslSink *v16;
  int v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  unint64_t v22;

  v5 = *((_QWORD *)a3 + 125);
  if ((*(_BYTE *)(v5 + 128) & 1) == 0)
  {
    v6 = *((double *)a3 + 77);
    p_fOrderedSample = &self->fOrderedSample;
    while (p_fOrderedSample != self->fOrderedSample.__end_.__next_)
    {
      v8 = (CLFallMslSink **)p_fOrderedSample;
      p_fOrderedSample = (list<CMMsl::Item *, std::allocator<CMMsl::Item *>> *)p_fOrderedSample->__end_.__prev_;
      if (*(double *)(p_fOrderedSample->__size_alloc_.__value_ + 616) <= v6)
      {
        v9 = (CLFallMslSink *)operator new(0x18uLL);
        v9->fOrderedSample.__end_.__next_ = a3;
        p_fOrderedSample->__end_.__next_ = v9;
        v9->super.isa = (Class)p_fOrderedSample;
        goto LABEL_20;
      }
    }
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_102180220);
    v14 = qword_10229FD98;
    if (!os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEBUG))
      goto LABEL_19;
    v17 = 68289282;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2050;
    v22 = (unint64_t)v6;
    v15 = "{\"msg%{public}.0s\":\"No previous sample matching ios timestamp, will insert first in queue\", \"iosTimestamp"
          "\":%{public}llu}";
    goto LABEL_18;
  }
  v10 = *(_QWORD *)(v5 + 24);
  v8 = (CLFallMslSink **)&self->fOrderedSample;
  next = (CLFallMslSink *)self->fOrderedSample.__end_.__next_;
  if (&self->fOrderedSample == (list<CMMsl::Item *, std::allocator<CMMsl::Item *>> *)next)
  {
LABEL_10:
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_102180220);
    v14 = qword_10229FD98;
    if (!os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEBUG))
      goto LABEL_19;
    v17 = 68289282;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2050;
    v22 = v10;
    v15 = "{\"msg%{public}.0s\":\"No previous sample matching aop timestamp, will insert first in queue\", \"aopTimestamp"
          "\":%{public}llu}";
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v17, 0x1Cu);
LABEL_19:
    v8 = (CLFallMslSink **)self->fOrderedSample.__end_.__next_;
    v9 = (CLFallMslSink *)operator new(0x18uLL);
    v9->fOrderedSample.__end_.__next_ = a3;
    v16 = *v8;
    v16->fOrderedSample.__end_.__prev_ = v9;
    v9->super.isa = (Class)v16;
    goto LABEL_20;
  }
  while (1)
  {
    v12 = *v8;
    v13 = *((_QWORD *)(*v8)->fOrderedSample.__end_.__next_ + 125);
    if ((*(_BYTE *)(v13 + 128) & 1) != 0 && v10 >= *(_QWORD *)(v13 + 24))
      break;
    v8 = (CLFallMslSink **)*v8;
    if (v12 == next)
      goto LABEL_10;
  }
  v9 = (CLFallMslSink *)operator new(0x18uLL);
  v9->fOrderedSample.__end_.__next_ = a3;
  v12->fOrderedSample.__end_.__prev_ = v9;
  v9->super.isa = (Class)v12;
LABEL_20:
  *v8 = v9;
  v9->fOrderedSample.__end_.__prev_ = v8;
  ++self->fOrderedSample.__size_alloc_.__value_;
}

- (id)initInUniverse:(id)a3
{
  id result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLFallMslSink;
  result = -[CLFallMslSink init](&v4, "init", a3);
  if (result)
    *((_BYTE *)result + 223) = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[CLFallMslSink cleanUp](self, "cleanUp");
  v3.receiver = self;
  v3.super_class = (Class)CLFallMslSink;
  -[CLFallMslSink dealloc](&v3, "dealloc");
}

- (void)logAccel100:(id)a3 startTime:(double)a4 timestamp:(unint64_t)a5
{
  _QWORD v6[2];
  int v7;
  int v8;
  int v9[12];

  sub_1009AE75C((uint64_t)v9, 0);
  sub_1009AE75C((uint64_t)v9, (uint64_t)objc_msgSend(a3, "bytes"));
  v8 = 0;
  if (objc_msgSend(a3, "length"))
  {
    v6[0] = 0;
    v6[1] = 0;
    v7 = 0;
    sub_1009AE600(v9, &v8, (uint64_t)v6);
    operator new();
  }
}

- (void)logAccel800:(const ImpactData *)a3
{
  operator new();
}

- (void)logHgal:(const ImpactData *)a3
{
  operator new();
}

- (void)logGyro100:(id)a3 startTime:(double)a4 timestamp:(unint64_t)a5
{
  id v6;
  float32x4_t v7;
  uint64_t v8;
  int v9;
  int v10[12];

  v6 = objc_msgSend(a3, "bytes", sub_1009AE8BC((uint64_t)v10, 0));
  v9 = 0;
  if (objc_msgSend(a3, "length", sub_1009AE8BC((uint64_t)v10, (uint64_t)v6)))
  {
    v7 = 0uLL;
    v8 = 0;
    sub_1009AE774(v10, &v9, &v7);
    operator new();
  }
}

- (void)logGyro200:(const ImpactData *)a3
{
  operator new();
}

- (void)logDeviceMotion:(const ImpactData *)a3
{
  operator new();
}

- (void)logFilteredPressure:(const FilteredPressure *)a3
{
  operator new();
}

- (void)logPressure:(const Pressure *)a3
{
  operator new();
}

- (void)logHeartRate:(const CLCatherineData *)a3
{
  operator new();
}

- (void)logWristState:(const WristState *)a3
{
  operator new();
}

- (void)logFallState:(const ImpactEvent *)a3
{
  operator new();
}

- (void)logFallStats:(const ImpactEvent *)a3
{
  operator new();
}

- (void)logSuppressionFeartures:(const FalsePositiveSuppressionFeatures *)a3
{
  if (HIBYTE(self->fImpactEvent.fTimestamp))
    operator new();
}

- (void)logOdometer:(const OdometerEntry *)a3
{
  if (HIBYTE(self->fImpactEvent.fTimestamp))
    operator new();
}

- (void)sendData:(id)a3 completion:(id)a4
{
  double v7;
  int v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  unsigned __int8 v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  double v43;
  list<CMMsl::Item *, std::allocator<CMMsl::Item *>> *i;
  _QWORD v45[125];
  uint64_t v46;
  char v47;
  uint64_t (**v48)();
  void *__p;
  void *v50;
  uint64_t v51;
  _QWORD v52[24];

  if (a4 && self->fOrderedSample.__size_alloc_.__value_)
  {
    sub_1015E23E8(v52, a2);
    v48 = off_102180250;
    __p = 0;
    v51 = 0;
    v50 = 0;
    sub_1015E2784(v52, (uint64_t)&v48, 0);
    v7 = *(double *)&self->fImpactEvent.fImpact.fOperatingMode;
    if (v7 == 0.0)
    {
      v8 = 0;
      v7 = *(double *)(*((_QWORD *)self->fOrderedSample.__end_.__next_ + 2) + 616);
    }
    else
    {
      v8 = SBYTE6(self->fImpactEvent.fImpact.fNow);
    }
    sub_1015EB864(v45);
    sub_1016030E8((uint64_t)v45);
    v47 |= 1u;
    *(double *)&v45[77] = v7;
    sub_1015471E4(v46);
    v9 = *(_QWORD *)(v46 + 88);
    v10 = sub_100A10B10();
    *(_DWORD *)(v9 + 72) |= 0x10000u;
    *(_BYTE *)(v9 + 69) = v10;
    v11 = *(_QWORD *)(v46 + 88);
    objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("CMCrownUpDown")), "doubleValue");
    *(_DWORD *)(v11 + 72) |= 1u;
    *(_DWORD *)(v11 + 8) = (int)v12;
    v13 = *(_QWORD *)(v46 + 88);
    objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("CMIsNearFall")), "doubleValue");
    *(_DWORD *)(v13 + 72) |= 0x20000u;
    *(_BYTE *)(v13 + 70) = v14 != 0.0;
    v15 = *(_QWORD *)(v46 + 88);
    *(_DWORD *)(v15 + 72) |= 2u;
    *(_DWORD *)(v15 + 12) = v8;
    v16 = *(_QWORD *)(v46 + 88);
    objc_msgSend(objc_msgSend(a3, "objectForKey:", CMNatalimeterSetUserAgeYr), "doubleValue");
    *(_DWORD *)(v16 + 72) |= 0x2000u;
    *(_DWORD *)(v16 + 60) = (int)v17;
    v18 = *(_QWORD *)(v46 + 88);
    objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("CMWorkoutType")), "doubleValue");
    *(_DWORD *)(v18 + 72) |= 0x4000u;
    *(_DWORD *)(v18 + 64) = (int)v19;
    v20 = *(_QWORD *)(v46 + 88);
    objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("CMMetMinutePercentileActual")), "doubleValue");
    *(float *)&v21 = v21;
    *(_DWORD *)(v20 + 72) |= 0x200u;
    *(_DWORD *)(v20 + 44) = LODWORD(v21);
    v22 = *(_QWORD *)(v46 + 88);
    v23 = objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("isADLImpact")), "BOOLValue");
    *(_DWORD *)(v22 + 72) |= 0x8000u;
    *(_BYTE *)(v22 + 68) = v23;
    if (HIBYTE(self->fImpactEvent.fTimestamp))
    {
      v24 = *(_QWORD *)(v46 + 88);
      objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("CMImpactMaxAccelNormAlertThreshold")), "doubleValue");
      *(float *)&v25 = v25;
      *(_DWORD *)(v24 + 72) |= 4u;
      *(_DWORD *)(v24 + 16) = LODWORD(v25);
      v26 = *(_QWORD *)(v46 + 88);
      objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("CMImpactMaxAccelNormLoggingStatsThreshold")), "doubleValue");
      *(float *)&v27 = v27;
      *(_DWORD *)(v26 + 72) |= 0x20u;
      *(_DWORD *)(v26 + 28) = LODWORD(v27);
      v28 = *(_QWORD *)(v46 + 88);
      objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("CMImpactMaxAccelNormLoggingHeartRateThreshold")), "doubleValue");
      *(float *)&v29 = v29;
      *(_DWORD *)(v28 + 72) |= 8u;
      *(_DWORD *)(v28 + 20) = LODWORD(v29);
      v30 = *(_QWORD *)(v46 + 88);
      objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("CMImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold")), "doubleValue");
      *(float *)&v31 = v31;
      *(_DWORD *)(v30 + 72) |= 0x10u;
      *(_DWORD *)(v30 + 24) = LODWORD(v31);
      v32 = *(_QWORD *)(v46 + 88);
      objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("CMTripFallPosteriorRatioDetectionThreshold")), "doubleValue");
      *(float *)&v33 = v33;
      *(_DWORD *)(v32 + 72) |= 0x1000u;
      *(_DWORD *)(v32 + 56) = LODWORD(v33);
      v34 = *(_QWORD *)(v46 + 88);
      objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("CMSlipFallPosteriorRatioDetectionThreshold")), "doubleValue");
      *(float *)&v35 = v35;
      *(_DWORD *)(v34 + 72) |= 0x800u;
      *(_DWORD *)(v34 + 52) = LODWORD(v35);
      v36 = *(_QWORD *)(v46 + 88);
      objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("CMOtherFallPosteriorRatioDetectionThreshold")), "doubleValue");
      *(float *)&v37 = v37;
      *(_DWORD *)(v36 + 72) |= 0x400u;
      *(_DWORD *)(v36 + 48) = LODWORD(v37);
      v38 = *(_QWORD *)(v46 + 88);
      objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("CMMetMinutePercentile90")), "doubleValue");
      *(float *)&v39 = v39;
      *(_DWORD *)(v38 + 72) |= 0x40u;
      *(_DWORD *)(v38 + 32) = LODWORD(v39);
      v40 = *(_QWORD *)(v46 + 88);
      objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("CMMetMinutePercentile95")), "doubleValue");
      *(float *)&v41 = v41;
      *(_DWORD *)(v40 + 72) |= 0x80u;
      *(_DWORD *)(v40 + 36) = LODWORD(v41);
      v42 = *(_QWORD *)(v46 + 88);
      objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("CMMetMinutePercentile98")), "doubleValue");
      *(float *)&v43 = v43;
      *(_DWORD *)(v42 + 72) |= 0x100u;
      *(_DWORD *)(v42 + 40) = LODWORD(v43);
    }
    sub_1015E27D4((uint64_t)v52, (uint64_t)v45);
    for (i = (list<CMMsl::Item *, std::allocator<CMMsl::Item *>> *)self->fOrderedSample.__end_.__next_;
          i != &self->fOrderedSample;
          i = (list<CMMsl::Item *, std::allocator<CMMsl::Item *>> *)i->__end_.__next_)
    {
      sub_1015E27D4((uint64_t)v52, i->__size_alloc_.__value_);
    }
    sub_1015E2A14((uint64_t)v52);
    (*((void (**)(id, id, void **))a4 + 2))(a4, a3, &__p);
    sub_1015EE304((PB::Base *)v45);
    v48 = off_102180250;
    if (__p)
    {
      v50 = __p;
      operator delete(__p);
    }
    sub_1015E24D8((uint64_t)v52);
  }
  -[CLFallMslSink cleanUp](self, "cleanUp", a3);
}

- (void)cleanUpIncludingDerivedFeatures:(BOOL)a3
{
  list<CMMsl::Item *, std::allocator<CMMsl::Item *>> *p_fOrderedSample;
  list<CMMsl::Item *, std::allocator<CMMsl::Item *>> *i;
  unint64_t value;

  p_fOrderedSample = &self->fOrderedSample;
  for (i = (list<CMMsl::Item *, std::allocator<CMMsl::Item *>> *)self->fOrderedSample.__end_.__next_;
        i != p_fOrderedSample;
        i = (list<CMMsl::Item *, std::allocator<CMMsl::Item *>> *)i->__end_.__next_)
  {
    value = i->__size_alloc_.__value_;
    if (value)
      (*(void (**)(unint64_t, SEL))(*(_QWORD *)value + 8))(value, a2);
  }
  sub_1000F34E0(p_fOrderedSample);
  *(_QWORD *)&self->fImpactEvent.fImpact.fSeq = 0;
  self->fImpactEvent.fImpact.fNow = 0;
  *(_DWORD *)(&self->fImpactEvent.fImpact.fSimulated + 1) = 0;
  *(_QWORD *)&self->fImpactEvent.fImpact.fAge = 0;
  *(_OWORD *)((char *)&self->fImpactEvent.fImpact.fTimestamp + 3) = xmmword_101C03A70;
  *(_QWORD *)((char *)&self->fImpactEvent.fImpact.fHighFrequencyFeatures.fMagnitudeFeatures.fYMin + 3) = 0xFF7FFFFF7F7FFFFFLL;
  *(float *)((char *)&self->fImpactEvent.fImpact.fHighFrequencyFeatures.fMagnitudeFeatures.fZMin + 3) = -3.4028e38;
  *(_QWORD *)((char *)&self->fImpactEvent.fImpact.fHighFrequencyFeatures.fMagnitudeFeatures.fZMax + 3) = 0;
  *(_QWORD *)((char *)&self->fImpactEvent.fImpact.fHighFrequencyFeatures + 31) = 0x7F7FFFFF00000000;
  *(_DWORD *)((char *)&self->fImpactEvent.fImpact.fPeakTimestamp + 7) = 2139095039;
  *(_OWORD *)((char *)&self->fImpactEvent.fImpact.fAccelPathLength + 3) = 0u;
  *(_OWORD *)((char *)&self->fImpactEvent.fImpact.fAngleChangePostImpact + 3) = 0u;
  *(_OWORD *)((char *)&self->fImpactEvent.fImpact.fPosteriorRatio + 3) = 0u;
  *(float *)((char *)&self->fImpactEvent.fImpact.fAccelPathLengthWithPeak + 3) = 0.0;
  *(int32x4_t *)((char *)&self->fImpactEvent.fImpact.fPathLengthHarmonicMean + 3) = vdupq_n_s32(0x7F7FFFFFu);
  *(float *)((char *)&self->fImpactEvent.fImpact.fCrownVariance + 3) = -3.4028e38;
  *(_WORD *)((char *)&self->fImpactEvent.fImpact.fMedianAbsGravityY + 3) = 1;
  BYTE1(self->fImpactEvent.fImpact.fAbruptGravityChangeAngle) = 0;
  *(_DWORD *)((char *)&self->fImpactEvent.fTimestamp + 3) = 0;
  *(_OWORD *)((char *)&self->fImpactEvent.fAbsoluteTimestamp + 4) = 0u;
  *(_OWORD *)&self->fImpactEvent.fImpact.fHasMotionBeforeImpact = 0u;
  HIBYTE(self->fImpactEvent.fTimestamp) = a3;
}

- (void)cleanUp
{
  -[CLFallMslSink cleanUpIncludingDerivedFeatures:](self, "cleanUpIncludingDerivedFeatures:", 0);
}

- (void).cxx_destruct
{
  sub_1000F34E0(&self->fOrderedSample.__end_.__prev_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = (char *)self + 8;
  *((_QWORD *)self + 2) = (char *)self + 8;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_DWORD *)((char *)self + 55) = 0;
  *(_OWORD *)((char *)self + 59) = xmmword_101C03A70;
  *(_QWORD *)((char *)self + 75) = 0xFF7FFFFF7F7FFFFFLL;
  *(_DWORD *)((char *)self + 83) = -8388609;
  *(_QWORD *)((char *)self + 87) = 0;
  *(_QWORD *)((char *)self + 95) = 0x7F7FFFFF00000000;
  *(_DWORD *)((char *)self + 103) = 2139095039;
  *(_OWORD *)((char *)self + 107) = 0u;
  *(_OWORD *)((char *)self + 123) = 0u;
  *(_OWORD *)((char *)self + 139) = 0u;
  *(_DWORD *)((char *)self + 155) = 0;
  *(int32x4_t *)((char *)self + 159) = vdupq_n_s32(0x7F7FFFFFu);
  *(_DWORD *)((char *)self + 175) = -8388609;
  *(_WORD *)((char *)self + 179) = 1;
  *((_BYTE *)self + 181) = 0;
  *(_DWORD *)((char *)self + 219) = 0;
  *(_OWORD *)((char *)self + 204) = 0u;
  *(_OWORD *)((char *)self + 188) = 0u;
  return self;
}

@end

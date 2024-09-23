@implementation CMStrideCalibrationRunningFormBuffer

+ (BOOL)isAvailable
{
  sub_100197040();
  return sub_100195F08();
}

- (void)ageOutFormMetrics
{
  double Current;
  unint64_t value;
  double v5;
  unint64_t start;

  Current = CFAbsoluteTimeGetCurrent();
  value = self->fRunningFormMetrics.__size_.__value_;
  if (value)
  {
    v5 = Current + -600.0;
    do
    {
      start = self->fRunningFormMetrics.__start_;
      if (self->fRunningFormMetrics.__map_.__begin_[start / 0x14][start % 0x14].var8 >= v5)
        break;
      self->fRunningFormMetrics.__start_ = start + 1;
      self->fRunningFormMetrics.__size_.__value_ = value - 1;
      sub_100C1FF7C((uint64_t)&self->fRunningFormMetrics, 1);
      value = self->fRunningFormMetrics.__size_.__value_;
    }
    while (value);
  }
}

- (void)feedRunningFormMetrics:(const FormMetrics *)a3
{
  -[CMStrideCalibrationRunningFormBuffer ageOutFormMetrics](self, "ageOutFormMetrics");
  sub_100C1FCFC(&self->fRunningFormMetrics.__map_.__first_, (uint64_t)a3);
}

- (CMCalibrationTrackRawStrideLength)strideLengthFromStartDate:(id)a3 endDate:(id)a4
{
  int v5;
  double v6;
  const mach_header_64 *v8;
  double v9;
  double v10;
  double v11;
  unint64_t start;
  FormMetrics **begin;
  FormMetrics **end;
  FormMetrics **v15;
  unint64_t v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  double v20;
  unint64_t v22;
  unint64_t v23;
  CMCalibrationTrackRawStrideLength result;

  v5 = 0;
  v6 = 0.0;
  if (a3)
  {
    v8 = 0;
    if (a4)
    {
      objc_msgSend(a3, "timeIntervalSinceReferenceDate");
      v10 = v9;
      objc_msgSend(a4, "timeIntervalSinceReferenceDate");
      start = self->fRunningFormMetrics.__start_;
      begin = self->fRunningFormMetrics.__map_.__begin_;
      end = self->fRunningFormMetrics.__map_.__end_;
      v15 = &begin[start / 0x14];
      if (end == begin)
        v16 = 0;
      else
        v16 = (unint64_t)&(*v15)[start % 0x14];
      v5 = 0;
      v17 = 0.0;
LABEL_8:
      v18 = v16 - 4000;
      while (1)
      {
        v19 = end == begin
            ? 0
            : (unint64_t)&begin[(self->fRunningFormMetrics.__size_.__value_ + start) / 0x14][(self->fRunningFormMetrics.__size_.__value_ + start) % 0x14];
        if (v16 == v19)
          break;
        if ((*(_DWORD *)(v16 + 32) & 0xFFFFFFBF) == 0)
        {
          v20 = *(double *)(v16 + 56);
          if (v20 >= v10 && v20 <= v11)
          {
            v17 = v17 + *(double *)(v16 + 64);
            ++v5;
          }
        }
        v18 += 200;
        v16 += 200;
        if (*v15 == (FormMetrics *)v18)
        {
          v22 = (unint64_t)v15[1];
          ++v15;
          v16 = v22;
          goto LABEL_8;
        }
      }
      if (v5)
      {
        v6 = v17 / (double)v5;
        v8 = &_mh_execute_header;
      }
      else
      {
        v6 = 0.0;
        v8 = 0;
      }
    }
  }
  else
  {
    v8 = 0;
  }
  v23 = (unint64_t)v8 | v5;
  result.var1 = v23;
  result.var2 = BYTE4(v23);
  result.var0 = v6;
  return result;
}

- (void).cxx_destruct
{
  sub_100B90260(&self->fRunningFormMetrics.__map_.__first_);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end

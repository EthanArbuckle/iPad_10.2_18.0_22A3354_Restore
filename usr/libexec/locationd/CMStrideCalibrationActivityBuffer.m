@implementation CMStrideCalibrationActivityBuffer

- (BOOL)isRunningStateInWindow
{
  double *begin;
  double v4;
  int isTypeRunning;
  double *end;

  begin = (double *)self->fActivityWindow.__begin_;
  if (begin == self->fActivityWindow.__end_)
  {
    v4 = 0.0;
  }
  else
  {
    v4 = 0.0;
    do
    {
      isTypeRunning = CLMotionActivity::isTypeRunning(*((unsigned int *)begin + 2), a2);
      end = (double *)self->fActivityWindow.__end_;
      if (isTypeRunning)
      {
        if (begin == end - 2)
        {
          v4 = v4 + CFAbsoluteTimeGetCurrent() - *begin;
          end = (double *)self->fActivityWindow.__end_;
        }
        else
        {
          v4 = v4 + begin[2] - *begin;
        }
      }
      begin += 2;
    }
    while (begin != end);
  }
  return v4 / 60.0 >= 0.9;
}

- (void)ageOutMotionStateArray
{
  double Current;
  double *begin;
  double *end;
  double *v6;
  double *v7;

  Current = CFAbsoluteTimeGetCurrent();
  begin = (double *)self->fActivityWindow.__begin_;
  end = (double *)self->fActivityWindow.__end_;
  if (begin == end)
  {
    end = (double *)self->fActivityWindow.__begin_;
  }
  else
  {
    v6 = (double *)self->fActivityWindow.__begin_;
    do
    {
      if (v6 != end - 2)
      {
        if (Current - *v6 > 60.0 && Current - v6[2] > 60.0)
        {
          v7 = v6 + 2;
          if (v6 + 2 == end)
          {
            end = v6;
          }
          else
          {
            do
            {
              *(v7 - 2) = *v7;
              *((_DWORD *)v7 - 2) = *((_DWORD *)v7 + 2);
              v7 += 2;
            }
            while (v7 != end);
            end = v7 - 2;
          }
          self->fActivityWindow.__end_ = end;
          v6 -= 2;
        }
        if (Current - v6[2] < 60.0 && Current - *v6 > 60.0)
          *v6 = Current + -60.0;
      }
      v6 += 2;
    }
    while (v6 != end);
  }
  if ((char *)end - (char *)begin == 16 && Current - *begin > 60.0)
    *begin = Current + -60.0;
}

- (void)feedMotionStateData:(const NotificationData *)a3
{
  char *begin;
  char *end;
  vector<std::pair<double, CLMotionActivity::Type>, std::allocator<std::pair<double, CLMotionActivity::Type>>> *p_fActivityWindow;
  int v11;
  char *v12;
  void *v13;
  double v14;
  char *value;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _DWORD *v29;
  uint64_t v30;
  char *v31;
  char *v32;

  -[CMStrideCalibrationActivityBuffer ageOutMotionStateArray](self, "ageOutMotionStateArray", a3, a4, *(_QWORD *)&a5.var0, *(_QWORD *)&a5.var1, a6);
  begin = (char *)self->fActivityWindow.__begin_;
  end = (char *)self->fActivityWindow.__end_;
  p_fActivityWindow = &self->fActivityWindow;
  if (begin == end)
  {
    v14 = *((double *)a3 + 10);
    if (v14 <= 0.0)
      return;
    value = (char *)self->fActivityWindow.__end_cap_.__value_;
    if (begin < value)
    {
      *(double *)begin = v14;
      *((_DWORD *)begin + 2) = *(_DWORD *)a3;
      v13 = begin + 16;
      goto LABEL_19;
    }
    v26 = value - begin;
    v27 = v26 >> 3;
    if ((unint64_t)(v26 >> 3) <= 1)
      v27 = 1;
    if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF0)
      v28 = 0xFFFFFFFFFFFFFFFLL;
    else
      v28 = v27;
    v29 = sub_10028E224((uint64_t)&self->fActivityWindow.__end_cap_, v28);
    v31 = (char *)&v29[4 * v30];
    *(_QWORD *)v29 = *((_QWORD *)a3 + 10);
    v29[2] = *(_DWORD *)a3;
    v13 = v29 + 4;
    v32 = (char *)self->fActivityWindow.__begin_;
    v24 = (char *)self->fActivityWindow.__end_;
    if (v24 != v32)
    {
      do
      {
        *((_OWORD *)v29 - 1) = *((_OWORD *)v24 - 1);
        v29 -= 4;
        v24 -= 16;
      }
      while (v24 != v32);
      v24 = (char *)p_fActivityWindow->__begin_;
    }
    self->fActivityWindow.__begin_ = v29;
    self->fActivityWindow.__end_ = v13;
    self->fActivityWindow.__end_cap_.__value_ = v31;
    if (!v24)
      goto LABEL_19;
LABEL_18:
    operator delete(v24);
    goto LABEL_19;
  }
  v11 = *(_DWORD *)a3;
  if (*((_DWORD *)end - 2) == *(_DWORD *)a3)
    return;
  v12 = (char *)self->fActivityWindow.__end_cap_.__value_;
  if (end >= v12)
  {
    v16 = (end - begin) >> 4;
    v17 = v16 + 1;
    if ((unint64_t)(v16 + 1) >> 60)
      sub_100259694();
    v18 = v12 - begin;
    if (v18 >> 3 > v17)
      v17 = v18 >> 3;
    if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF0)
      v19 = 0xFFFFFFFFFFFFFFFLL;
    else
      v19 = v17;
    v20 = (char *)sub_10028E224((uint64_t)&self->fActivityWindow.__end_cap_, v19);
    v21 = &v20[16 * v16];
    v23 = &v20[16 * v22];
    *(_QWORD *)v21 = *((_QWORD *)a3 + 10);
    *((_DWORD *)v21 + 2) = *(_DWORD *)a3;
    v13 = v21 + 16;
    v25 = (char *)self->fActivityWindow.__begin_;
    v24 = (char *)self->fActivityWindow.__end_;
    if (v24 != v25)
    {
      do
      {
        *((_OWORD *)v21 - 1) = *((_OWORD *)v24 - 1);
        v21 -= 16;
        v24 -= 16;
      }
      while (v24 != v25);
      v24 = (char *)p_fActivityWindow->__begin_;
    }
    self->fActivityWindow.__begin_ = v21;
    self->fActivityWindow.__end_ = v13;
    self->fActivityWindow.__end_cap_.__value_ = v23;
    if (!v24)
      goto LABEL_19;
    goto LABEL_18;
  }
  *(_QWORD *)end = *((_QWORD *)a3 + 10);
  *((_DWORD *)end + 2) = v11;
  v13 = end + 16;
LABEL_19:
  self->fActivityWindow.__end_ = v13;
}

- (void).cxx_destruct
{
  void *begin;

  begin = self->fActivityWindow.__begin_;
  if (begin)
  {
    self->fActivityWindow.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end

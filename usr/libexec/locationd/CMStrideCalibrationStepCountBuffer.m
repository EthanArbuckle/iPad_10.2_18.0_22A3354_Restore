@implementation CMStrideCalibrationStepCountBuffer

- (void)feedStepCountUpdate:(const NotificationData *)a3
{
  unint64_t value;

  -[CMStrideCalibrationStepCountBuffer ageOutStepArray](self, "ageOutStepArray");
  value = self->fStepWindow.c.__size_.__value_;
  if (!value
    || (*(_DWORD **)((char *)self->fStepWindow.c.__map_.__begin_
                   + (((value + self->fStepWindow.c.__start_ - 1) >> 5) & 0x7FFFFFFFFFFFFF8)))[4
                                                                                               * (value + LOBYTE(self->fStepWindow.c.__start_) - 1)
                                                                                               + 2] != *((_DWORD *)a3 + 8))
  {
    sub_100210CA8(&self->fStepWindow.c.__map_.__first_, (_QWORD *)a3 + 2, (_DWORD *)a3 + 8);
  }
}

- (void)ageOutStepArray
{
  double Current;
  unint64_t value;
  double v5;
  unint64_t start;

  Current = CFAbsoluteTimeGetCurrent();
  value = self->fStepWindow.c.__size_.__value_;
  if (value)
  {
    v5 = Current;
    do
    {
      start = self->fStepWindow.c.__start_;
      if (v5
         - (*(double **)((char *)self->fStepWindow.c.__map_.__begin_ + ((start >> 5) & 0x7FFFFFFFFFFFFF8)))[2 * start] <= 130.0)
        break;
      self->fStepWindow.c.__start_ = start + 1;
      self->fStepWindow.c.__size_.__value_ = value - 1;
      sub_1004A57E8((uint64_t)&self->fStepWindow, 1);
      value = self->fStepWindow.c.__size_.__value_;
    }
    while (value);
  }
}

- (unsigned)stepsInWindow
{
  unint64_t value;
  unint64_t start;

  value = self->fStepWindow.c.__size_.__value_;
  if (!value)
    return 0;
  start = self->fStepWindow.c.__start_;
  return (*(_DWORD **)((char *)self->fStepWindow.c.__map_.__begin_ + (((value + start - 1) >> 5) & 0x7FFFFFFFFFFFFF8)))[4 * (value + start - 1) + 2]
       - (*(_DWORD **)((char *)self->fStepWindow.c.__map_.__begin_ + ((start >> 5) & 0x7FFFFFFFFFFFFF8)))[4 * start + 2];
}

- (void).cxx_destruct
{
  sub_1004A4854(&self->fStepWindow.c.__map_.__first_);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end

@implementation CLRunningAggregatorAWD

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_1023085A0 != -1)
    dispatch_once(&qword_1023085A0, &stru_102186BC8);
  return (id)qword_102308598;
}

- (CLRunningAggregatorAWD)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLRunningAggregatorAWD;
  return -[CLRunningAggregatorAWD initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLRunningAggregatorAWDServiceProtocol, &OBJC_PROTOCOL___CLRunningAggregatorAWDClientProtocol);
}

+ (BOOL)isSupported
{
  sub_100197040();
  return sub_1000C4240();
}

- (void)beginService
{
  Client *value;

  objc_msgSend(-[CLRunningAggregatorAWD universe](self, "universe"), "silo");
  self->fHasRun = 0;
  self->fInSession = 0;
  value = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  sub_100197040();
  if (sub_10019DF90())
  {
    if (objc_msgSend(objc_msgSend(-[CLRunningAggregatorAWD universe](self, "universe"), "vendor"), "isServiceEnabled:", CFSTR("CLStepCountNotifier")))
    {
      -[CLRunningAggregatorAWD universe](self, "universe");
      sub_10022AF5C();
    }
  }
}

- (void)endService
{
  Client *value;

  objc_msgSend(-[CLRunningAggregatorAWD universe](self, "universe"), "silo");
  value = self->fStepCountClient.__ptr_.__value_;
  if (value)
  {
    self->fStepCountClient.__ptr_.__value_ = 0;
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  }
}

- (BOOL)syncgetCompanionOnlyNoGPSRun
{
  BOOL fHasRun;

  fHasRun = self->fHasRun;
  self->fHasRun = 0;
  return fHasRun;
}

- (id)onStepNotification:(int)a3 data:(uint64_t)a4
{
  id result;

  result = objc_msgSend(objc_msgSend((id)a1, "universe"), "silo");
  if (!a3 && !*(_BYTE *)(a1 + 8))
  {
    if (*(_BYTE *)(a1 + 9) || *(_BYTE *)(a4 + 112))
      objc_msgSend((id)a1, "clearStepArray");
    else
      sub_100DC7F88((_QWORD *)(a1 + 16), (_QWORD *)(a4 + 8), (_QWORD *)(a4 + 80));
    objc_msgSend((id)a1, "ageOutStepArray");
    return _objc_msgSend((id)a1, "checkForRunningThreshold");
  }
  return result;
}

- (void)updateSession:(int64_t)a3
{
  objc_msgSend(-[CLRunningAggregatorAWD universe](self, "universe"), "silo");
  self->fInSession = a3 != 0;
}

- (void)ageOutStepArray
{
  double Current;
  deque<std::pair<double, double>, std::allocator<std::pair<double, double>>> *p_fStepWindow;
  unint64_t value;
  double v6;
  unint64_t start;

  Current = CFAbsoluteTimeGetCurrent();
  p_fStepWindow = &self->fStepWindow;
  value = p_fStepWindow->__size_.__value_;
  if (value)
  {
    v6 = Current;
    do
    {
      start = p_fStepWindow->__start_;
      if (v6
         - (*(double **)((char *)p_fStepWindow->__map_.__begin_ + ((start >> 5) & 0x7FFFFFFFFFFFFF8)))[2 * start] <= 750.0)
        break;
      p_fStepWindow->__start_ = start + 1;
      p_fStepWindow->__size_.__value_ = value - 1;
      sub_1004A57E8((uint64_t)p_fStepWindow, 1);
      value = p_fStepWindow->__size_.__value_;
    }
    while (value);
  }
}

- (void)clearStepArray
{
  deque<std::pair<double, double>, std::allocator<std::pair<double, double>>> *p_fStepWindow;
  void **begin;
  void **end;
  unint64_t v5;
  void **v6;
  uint64_t v7;

  p_fStepWindow = &self->fStepWindow;
  begin = self->fStepWindow.__map_.__begin_;
  end = self->fStepWindow.__map_.__end_;
  self->fStepWindow.__size_.__value_ = 0;
  v5 = (char *)end - (char *)begin;
  if (v5 >= 0x11)
  {
    do
    {
      operator delete(*begin);
      v6 = p_fStepWindow->__map_.__end_;
      begin = p_fStepWindow->__map_.__begin_ + 1;
      p_fStepWindow->__map_.__begin_ = begin;
      v5 = (char *)v6 - (char *)begin;
    }
    while (v5 > 0x10);
  }
  if (v5 >> 3 == 1)
  {
    v7 = 128;
  }
  else
  {
    if (v5 >> 3 != 2)
      return;
    v7 = 256;
  }
  p_fStepWindow->__start_ = v7;
}

- (void)checkForRunningThreshold
{
  deque<std::pair<double, double>, std::allocator<std::pair<double, double>>> *p_fStepWindow;
  unint64_t start;
  void **begin;
  void **end;
  void **v7;
  double *v8;
  double v9;
  unint64_t v10;
  void **v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double *v21;
  double Current;
  double *v23;

  p_fStepWindow = &self->fStepWindow;
  start = self->fStepWindow.__start_;
  begin = self->fStepWindow.__map_.__begin_;
  end = self->fStepWindow.__map_.__end_;
  v7 = &begin[start >> 8];
  if (end == begin)
    v8 = 0;
  else
    v8 = (double *)((char *)*v7 + 16 * start);
  v9 = 0.0;
  while (1)
  {
    v10 = start + p_fStepWindow->__size_.__value_;
    v11 = &begin[v10 >> 8];
    v12 = end == begin ? 0 : (uint64_t)*v11 + 16 * v10;
    if (v8 == (double *)v12)
      break;
    if (v8[1] >= 2.33333333)
    {
      v13 = *v11;
      v14 = (uint64_t)*v11 + 16 * v10;
      if (end == begin)
        v15 = 0;
      else
        v15 = v14;
      v16 = v15 - (_QWORD)v13;
      v17 = (v15 - (uint64_t)v13) >> 4;
      if (v16 < 17)
        v18 = (uint64_t)v11[-((unint64_t)(256 - v17) >> 8)] + 16 * (v17 - 1);
      else
        v18 = *(uint64_t *)((char *)v11 + (((unint64_t)(v17 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
            + 16 * (v17 - 1);
      if (v8 == (double *)v18)
      {
        Current = CFAbsoluteTimeGetCurrent();
      }
      else
      {
        v19 = (char *)v8 - (_BYTE *)*v7;
        v20 = v19 >> 4;
        if (v19 < -15)
          v21 = (double *)((char *)v7[-((unint64_t)(254 - v20) >> 8)] + 16 * ~(-2 - v20));
        else
          v21 = (double *)(*(char **)((char *)v7 + (((unint64_t)(v20 + 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                         + 16 * (v20 + 1));
        Current = *v21;
      }
      v9 = v9 + Current - *v8;
    }
    v8 += 2;
    if ((char *)v8 - (_BYTE *)*v7 == 4096)
    {
      v23 = (double *)v7[1];
      ++v7;
      v8 = v23;
    }
    start = p_fStepWindow->__start_;
    begin = p_fStepWindow->__map_.__begin_;
    end = p_fStepWindow->__map_.__end_;
  }
  if (v9 >= 600.0)
    self->fHasRun = 1;
}

- (void).cxx_destruct
{
  Client *value;

  value = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  sub_1004A4854(&self->fStepWindow.__map_.__first_);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_QWORD *)self + 8) = 0;
  return self;
}

@end

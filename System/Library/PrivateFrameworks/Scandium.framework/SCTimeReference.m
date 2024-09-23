@implementation SCTimeReference

- (SCTimeReference)initWithRTPTicksPerSecond:(unsigned int)a3 onQueue:(id)a4
{
  id v7;
  SCTimeReference *v8;
  SCTimeReference *v9;
  int v10;
  dispatch_source_t v11;
  OS_dispatch_source *timer;
  NSObject *v13;
  dispatch_time_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *queue;
  SCTimeReference *v18;
  _QWORD v20[4];
  id v21;
  _QWORD handler[4];
  id v23;
  id location;
  objc_super v25;

  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)SCTimeReference;
  v8 = -[SCTimeReference init](&v25, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_significantTimeChangeNotificationToken = -1;
    v8->_rtpTicksPerSecond = a3;
    if (a3 == 0x8000)
    {
      v10 = 1;
    }
    else
    {
      if (a3 != 24000000)
        __assert_rtn("-[SCTimeReference initWithRTPTicksPerSecond:onQueue:]", "SCTimeReference.mm", 86, "false");
      v10 = 0;
    }
    v8->_timeReference.rtp_tick_duration.__impl_.__data.__head.__value.__rep_ = 1;
    v8->_timeReference.rtp_tick_duration.__impl_.__index = v10;
    objc_storeStrong((id *)&v8->_queue, a4);
    -[SCTimeReference update](v9, "update");
    v11 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)v9->_queue);
    timer = v9->_timer;
    v9->_timer = (OS_dispatch_source *)v11;

    v13 = v9->_timer;
    v14 = dispatch_time(0, 300000000000);
    dispatch_source_set_timer(v13, v14, 0x34630B8A000uLL, 0x45D964B800uLL);
    objc_initWeak(&location, v9);
    v15 = v9->_timer;
    v16 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __53__SCTimeReference_initWithRTPTicksPerSecond_onQueue___block_invoke;
    handler[3] = &unk_25169CF30;
    objc_copyWeak(&v23, &location);
    dispatch_source_set_event_handler(v15, handler);
    dispatch_activate((dispatch_object_t)v9->_timer);
    queue = v9->_queue;
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __53__SCTimeReference_initWithRTPTicksPerSecond_onQueue___block_invoke_2;
    v20[3] = &unk_25169CF58;
    objc_copyWeak(&v21, &location);
    notify_register_dispatch("SignificantTimeChangeNotification", &v9->_significantTimeChangeNotificationToken, queue, v20);
    v18 = v9;
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __53__SCTimeReference_initWithRTPTicksPerSecond_onQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "update");

}

void __53__SCTimeReference_initWithRTPTicksPerSecond_onQueue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "update");

}

- (void)dealloc
{
  int significantTimeChangeNotificationToken;
  objc_super v4;

  significantTimeChangeNotificationToken = self->_significantTimeChangeNotificationToken;
  if (significantTimeChangeNotificationToken != -1)
    notify_cancel(significantTimeChangeNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)SCTimeReference;
  -[SCTimeReference dealloc](&v4, sel_dealloc);
}

- (double)timeIntervalSinceReferenceDateForRTPTimestamp:(unint64_t)a3
{
  return (self->_timeReference.time_since_reference_date.__rep_ * 1000000000.0
        + (double)(ae::TimeReference::rtp_to_continuous_time_point((ae::TimeReference *)&self->_timeReference, a3)
                 - self->_timeReference.continuous_time_point.__d_.__rep_))
       / 1000000000.0;
}

- (id)dateForRTPTimestamp:(unint64_t)a3
{
  void *v3;

  v3 = (void *)MEMORY[0x24BDBCE60];
  -[SCTimeReference timeIntervalSinceReferenceDateForRTPTimestamp:](self, "timeIntervalSinceReferenceDateForRTPTimestamp:", a3);
  return (id)objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
}

- (unint64_t)currentRTPTimestamp
{
  uint64_t index;
  char v4;
  char *v5;

  index = self->_timeReference.rtp_tick_duration.__impl_.__index;
  if ((_DWORD)index == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v5 = &v4;
  return ((uint64_t (*)(char **, TimeReference *))off_25169CF88[index])(&v5, &self->_timeReference);
}

- (void)update
{
  std::chrono::steady_clock::time_point v3;
  double Current;
  std::chrono::steady_clock::time_point v5;

  do
  {
    v3.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    Current = CFAbsoluteTimeGetCurrent();
    v5.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  }
  while (v5.__d_.__rep_ - v3.__d_.__rep_ > 10000);
  self->_timeReference.continuous_time_point.__d_.__rep_ = v3.__d_.__rep_
                                                         + ((unint64_t)(v5.__d_.__rep_ < v3.__d_.__rep_) << 63)
                                                         + ((unint64_t)(v5.__d_.__rep_ - v3.__d_.__rep_) >> 1)
                                                         + ((v5.__d_.__rep_ - v3.__d_.__rep_) & (v5.__d_.__rep_ < v3.__d_.__rep_));
  self->_timeReference.time_since_reference_date.__rep_ = Current;
}

- (unsigned)rtpTicksPerSecond
{
  return self->_rtpTicksPerSecond;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_DWORD *)self + 4) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end

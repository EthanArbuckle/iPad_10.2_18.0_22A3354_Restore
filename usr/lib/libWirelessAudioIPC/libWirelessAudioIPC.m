uint64_t waipc::SampleTimeline::SampleTimeline(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  waipc::timesync::KalmanEstimator::fixed(a3, 0, 0, 0, a1 + 32, *(double *)(a2 + 16) / *(double *)(a2 + 24));
  *(_QWORD *)(a1 + 144) = 0;
  *(_QWORD *)(a1 + 152) = 0;
  *(_QWORD *)(a1 + 160) = mach_absolute_time();
  return a1;
}

__n128 waipc::SampleTimeline::updateTimesync(uint64_t a1, uint64_t a2, int a3)
{
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;
  __int128 v9;

  if (a3)
  {
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 160) = mach_absolute_time();
  }
  v5 = *(_OWORD *)(a2 + 8);
  v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v6;
  *(_OWORD *)(a1 + 40) = v5;
  result = *(__n128 *)(a2 + 56);
  v8 = *(_OWORD *)(a2 + 72);
  v9 = *(_OWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = v9;
  *(_OWORD *)(a1 + 104) = v8;
  *(__n128 *)(a1 + 88) = result;
  return result;
}

double waipc::SampleTimeline::deviceToSample(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(double *)a1
       * (*(double *)(a1 + 16)
        * (*(double *)&a3 - *(double *)(a1 + 152) + (double)(a2 - *(_QWORD *)(a1 + 144)))
        / 1000000000.0);
}

uint64_t waipc::SampleTimeline::sampleToDevice(waipc::SampleTimeline *this, double a2)
{
  return *((_QWORD *)this + 18);
}

double waipc::SampleTimeline::timestampFromHost@<D0>(waipc::SampleTimeline *this@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  double v7;
  double result;

  v6 = waipc::timesync::KalmanEstimator::hostToDevice((uint64_t)this + 32);
  result = v7;
  *(double *)a3 = *(double *)this
                * (*((double *)this + 2)
                 * (v7 - *((double *)this + 19) + (double)(v6 - *((_QWORD *)this + 18)))
                 / 1000000000.0);
  *(_QWORD *)(a3 + 8) = a2;
  *(_QWORD *)(a3 + 16) = v6 + llround(v7);
  *(_QWORD *)(a3 + 24) = *((_QWORD *)this + 20);
  return result;
}

double waipc::SampleTimeline::timestampFromDevice@<D0>(waipc::SampleTimeline *this@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  double v6;
  uint64_t v7;
  double result;

  waipc::timesync::KalmanEstimator::deviceToHost((uint64_t)this + 32, a2, 0);
  result = *(double *)this
         * (*((double *)this + 2)
          * (0.0 - *((double *)this + 19) + (double)(a2 - *((_QWORD *)this + 18)))
          / 1000000000.0);
  *(double *)a3 = result;
  *(_QWORD *)(a3 + 8) = v7 + llround(v6);
  *(_QWORD *)(a3 + 16) = a2;
  *(_QWORD *)(a3 + 24) = *((_QWORD *)this + 20);
  return result;
}

double waipc::SampleTimeline::timestampFromSample@<D0>(waipc::SampleTimeline *this@<X0>, double a2@<D0>, uint64_t a3@<X8>)
{
  uint64_t v6;
  double v7;
  double v8;
  double result;
  uint64_t v10;

  v6 = *((_QWORD *)this + 18);
  v7 = *((double *)this + 19) + a2 / *(double *)this * 1000000000.0 / *((double *)this + 2);
  waipc::timesync::KalmanEstimator::deviceToHost((uint64_t)this + 32, v6, *(uint64_t *)&v7);
  result = v8;
  *(double *)a3 = a2;
  *(_QWORD *)(a3 + 8) = v10 + llround(v8);
  *(_QWORD *)(a3 + 16) = v6 + llround(v7);
  *(_QWORD *)(a3 + 24) = *((_QWORD *)this + 20);
  return result;
}

double waipc::SampleTimeline::currentTimestamp@<D0>(waipc::SampleTimeline *this@<X0>, uint64_t a2@<X8>)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double result;
  uint64_t v14;

  v4 = (char *)this + 32;
  v5 = waipc::timesync::KalmanEstimator::hostToDevice((uint64_t)this + 32);
  v6 = *((_QWORD *)this + 18);
  v7 = *((double *)this + 19);
  v9 = *((double *)this + 2);
  v10 = floor(*(double *)this* (v9* (v8 - v7 + (double)(v5 - v6))/ 1000000000.0)/ (double)*((unint64_t *)this + 1))* (double)*((unint64_t *)this + 1);
  v11 = v7 + v10 / *(double *)this * 1000000000.0 / v9;
  waipc::timesync::KalmanEstimator::deviceToHost((uint64_t)v4, v6, *(uint64_t *)&v11);
  result = v12;
  *(double *)a2 = v10;
  *(_QWORD *)(a2 + 8) = v14 + llround(v12);
  *(_QWORD *)(a2 + 16) = v6 + llround(v11);
  *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 20);
  return result;
}

uint64_t waipc::SampleTimeline::nextHostTime(waipc::SampleTimeline *this)
{
  char *v2;
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;

  v2 = (char *)this + 32;
  v3 = waipc::timesync::KalmanEstimator::hostToDevice((uint64_t)this + 32);
  waipc::timesync::KalmanEstimator::deviceToHost((uint64_t)v2, *((_QWORD *)this + 18), COERCE__INT64(*((double *)this + 19)+ (floor(*(double *)this* (*((double *)this + 2)* (v4 - *((double *)this + 19) + (double)(v3 - *((_QWORD *)this + 18)))/ 1000000000.0)/ (double)*((unint64_t *)this + 1))+ 1.0)* (double)*((unint64_t *)this + 1)/ *(double *)this* 1000000000.0/ *((double *)this + 2)));
  return v6 + vcvtpd_s64_f64(v5);
}

double waipc::SampleTimeline::nextHostVariance(waipc::SampleTimeline *this)
{
  char *v2;
  uint64_t v3;
  double v4;

  v2 = (char *)this + 32;
  v3 = waipc::timesync::KalmanEstimator::hostToDevice((uint64_t)this + 32);
  return waipc::timesync::KalmanEstimator::deviceToHostVariance((uint64_t)v2, *((_QWORD *)this + 18), COERCE__INT64(*((double *)this + 19)+ (floor(*(double *)this* (*((double *)this + 2)* (v4 - *((double *)this + 19) + (double)(v3 - *((_QWORD *)this + 18)))/ 1000000000.0)/ (double)*((unint64_t *)this + 1))+ 1.0)* (double)*((unint64_t *)this + 1)/ *(double *)this* 1000000000.0/ *((double *)this + 2)));
}

uint64_t waipc::SampleTimeline::dumpState(waipc::SampleTimeline *this)
{
  uint64_t i;
  const void *v3;
  uint64_t v5;
  _QWORD v6[2];
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("Estimator");
  v6[1] = waipc::timesync::KalmanEstimator::dumpState((waipc::SampleTimeline *)((char *)this + 32));
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v7, (uint64_t)CFSTR("Zero Device Time Int"), (uint64_t *)this + 18);
  waipc::util::_kv::_kv<double const&,void>(&v8, (uint64_t)CFSTR("Zero Device Time Frac"), (uint64_t *)this + 19);
  waipc::util::_kv::_kv<unsigned long long const&,void>(v9, (uint64_t)CFSTR("Seed"), (uint64_t *)this + 20);
  waipc::util::createCFDictDropNull<4l>((uint64_t)v6, (applesauce::CF::DictionaryRef *)&v5);
  for (i = 7; i != -1; i -= 2)
  {
    v3 = (const void *)v6[i];
    if (v3)
      CFRelease(v3);
  }
  return v5;
}

void sub_21ABB4880(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<4l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3;
  CFIndex v4;
  void *v5;
  uint64_t v6;
  CFDictionaryRef v7;
  _OWORD v9[2];
  void *keys[2];
  __int128 v11;
  uint64_t v12;

  v3 = 0;
  v4 = 0;
  v12 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)keys = 0u;
  v11 = 0u;
  memset(v9, 0, sizeof(v9));
  do
  {
    v5 = *(void **)(a1 + v3);
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        *((_QWORD *)v9 + v4++) = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 64);
  v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)v9, v4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

void waipc::util::_kv::~_kv(waipc::util::_kv *this)
{
  const void *v1;

  v1 = (const void *)*((_QWORD *)this + 1);
  if (v1)
    CFRelease(v1);
}

void applesauce::CF::TypeRef::~TypeRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

applesauce::CF::DictionaryRef *applesauce::CF::DictionaryRef::DictionaryRef(applesauce::CF::DictionaryRef *this, CFTypeRef cf)
{
  CFTypeID v3;
  void *exception;

  *(_QWORD *)this = cf;
  if (cf)
  {
    v3 = CFGetTypeID(cf);
    if (v3 != CFDictionaryGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x220752F14](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
  }
  return this;
}

void sub_21ABB4AA0(_Unwind_Exception *a1)
{
  CFTypeRef *v1;
  void *v2;

  __cxa_free_exception(v2);
  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(a1);
}

_QWORD *waipc::util::_kv::_kv<unsigned long long const&,void>(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  CFNumberRef v4;
  void *exception;
  uint64_t valuePtr;

  *a1 = a2;
  valuePtr = *a3;
  v4 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x220752F14](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_21ABB4B58(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  const void *v3;

  v3 = *(const void **)(v1 + 8);
  if (v3)
    CFRelease(v3);
  _Unwind_Resume(exception_object);
}

_QWORD *waipc::util::_kv::_kv<double const&,void>(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  CFNumberRef v4;
  void *exception;
  uint64_t valuePtr;

  *a1 = a2;
  valuePtr = *a3;
  v4 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x220752F14](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_21ABB4C0C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  const void *v3;

  v3 = *(const void **)(v1 + 8);
  if (v3)
    CFRelease(v3);
  _Unwind_Resume(exception_object);
}

void waipc::timesync::BasebandProvider::create(waipc::timesync::BasebandProvider *this@<X0>, os_unfair_lock_s **a2@<X8>)
{
  std::__shared_weak_count *v5;
  os_unfair_lock_s *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  _QWORD v9[39];
  os_unfair_lock_s *v10;
  std::__shared_weak_count *v11;
  os_unfair_lock_s *v12;
  std::__shared_weak_count *v13;

  v12 = 0;
  v13 = 0;
  if (TelephonyRadiosGetRadio() == 4)
  {
    waipc::timesync::BasebandProvider::BasebandProvider((waipc::timesync::BasebandProvider *)v9, this);
    v9[0] = &off_24DDBBEF8;
    std::allocate_shared[abi:ne180100]<waipc::timesync::LegacyBasebandProvider,std::allocator<waipc::timesync::LegacyBasebandProvider>,waipc::timesync::LegacyBasebandProvider,void>((const waipc::timesync::BasebandProvider *)v9, &v10);
  }
  else
  {
    waipc::timesync::BasebandProvider::BasebandProvider((waipc::timesync::BasebandProvider *)v9, this);
    v9[0] = &off_24DDBBE58;
    std::allocate_shared[abi:ne180100]<waipc::timesync::ModernBasebandProvider,std::allocator<waipc::timesync::ModernBasebandProvider>,waipc::timesync::ModernBasebandProvider,void>((const waipc::timesync::BasebandProvider *)v9, &v10);
  }
  v6 = v10;
  v5 = v11;
  v10 = 0;
  v11 = 0;
  v12 = v6;
  v13 = v5;
  waipc::timesync::BasebandProvider::~BasebandProvider((os_unfair_lock *)v9);
  if (v6 && waipc::timesync::BasebandProvider::init(v6))
  {
    *a2 = v6;
    a2[1] = (os_unfair_lock_s *)v5;
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
}

void sub_21ABB4D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_unfair_lock a9)
{
  uint64_t v9;

  waipc::timesync::BasebandProvider::~BasebandProvider(&a9);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100](v9 - 56);
  _Unwind_Resume(a1);
}

uint64_t waipc::timesync::BasebandProvider::init(os_unfair_lock_s *this)
{
  NSObject *Logger;
  uint64_t v3;

  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG))
    waipc::timesync::BasebandProvider::init();
  os_unfair_lock_lock(this + 28);
  v3 = waipc::timesync::BasebandProvider::setupTransport((waipc::timesync::BasebandProvider *)this);
  if ((v3 & 1) == 0)
    waipc::timesync::BasebandProvider::stop_nl(this);
  os_unfair_lock_unlock(this + 28);
  return v3;
}

void sub_21ABB4DE0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

waipc::timesync::BasebandProvider *waipc::timesync::BasebandProvider::BasebandProvider(waipc::timesync::BasebandProvider *this, const waipc::timesync::BasebandProvider::config *a2)
{
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = &off_24DDBBC08;
  waipc::timesync::BasebandProvider::config::config((uint64_t)this + 24, (uint64_t)a2);
  *((_DWORD *)this + 28) = 0;
  *((_WORD *)this + 58) = 0;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 212) = 0u;
  *((_QWORD *)this + 30) = 0;
  *((_QWORD *)this + 31) = 0;
  *((_QWORD *)this + 29) = 0;
  *((_DWORD *)this + 64) = 0;
  *(_OWORD *)((char *)this + 264) = 0u;
  *(_OWORD *)((char *)this + 280) = 0u;
  *(_OWORD *)((char *)this + 296) = 0u;
  return this;
}

void sub_21ABB4E68(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  std::__shared_weak_count *v3;

  v3 = *(std::__shared_weak_count **)(v1 + 16);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
  _Unwind_Resume(exception_object);
}

uint64_t waipc::timesync::BasebandProvider::setupTransport(waipc::timesync::BasebandProvider *this)
{
  NSObject *Logger;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_weak_owners;
  unint64_t v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v15;
  _QWORD v17[6];
  _QWORD v18[6];
  uint64_t v19;
  std::__shared_weak_count *v20;
  _QWORD *v21;
  uint64_t v22;
  int v23;
  _QWORD *v24;
  _QWORD v25[6];
  std::__shared_weak_count *v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG))
    waipc::timesync::BasebandProvider::setupTransport();
  os_unfair_lock_assert_owner((const os_unfair_lock *)this + 28);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3802000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v19, (_QWORD *)this + 1);
  v3 = v20;
  v25[5] = v19;
  v26 = v20;
  if (v20)
  {
    p_shared_weak_owners = (unint64_t *)&v20->__shared_weak_owners_;
    do
      v5 = __ldxr(p_shared_weak_owners);
    while (__stxr(v5 + 1, p_shared_weak_owners));
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  TelephonyBasebandPCITransportInitParameters();
  v8 = (std::__shared_weak_count *)*((_QWORD *)this + 3);
  v22 = *((_QWORD *)this + 10);
  v23 |= 4u;
  LODWORD(v19) = 12;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 0x40000000;
  v18[2] = ___ZN5waipc8timesync16BasebandProvider14setupTransportEv_block_invoke;
  v18[3] = &unk_24DDBBC50;
  v18[4] = v25;
  v18[5] = this;
  v20 = v8;
  v21 = v18;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 0x40000000;
  v17[2] = ___ZN5waipc8timesync16BasebandProvider14setupTransportEv_block_invoke_2;
  v17[3] = &unk_24DDBBC78;
  v17[4] = v25;
  v17[5] = this;
  v24 = v17;
  if (((*(uint64_t (**)(waipc::timesync::BasebandProvider *, uint64_t *))(*(_QWORD *)this + 40))(this, &v19) & 1) == 0)
  {
    v11 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v12 = "failed to configure PCI transport";
LABEL_18:
      v13 = v11;
      v14 = 2;
LABEL_21:
      _os_log_impl(&dword_21ABB3000, v13, OS_LOG_TYPE_INFO, v12, buf, v14);
    }
LABEL_22:
    v10 = 0;
    goto LABEL_23;
  }
  if ((TelephonyBasebandPCITransportCreate() & 1) == 0)
  {
    v15 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v28 = 12;
      v12 = "failed to create PCI transport for interface %d";
      v13 = v15;
      v14 = 8;
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (((*(uint64_t (**)(waipc::timesync::BasebandProvider *))(*(_QWORD *)this + 48))(this) & 1) == 0)
  {
    v11 = waipc::logging::getLogger(2u);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v12 = "failed to engage PCI transport";
    goto LABEL_18;
  }
  v9 = (void *)*((_QWORD *)this + 5);
  if (v9)
    dispatch_async(*((dispatch_queue_t *)this + 3), v9);
  v10 = 1;
LABEL_23:
  _Block_object_dispose(v25, 8);
  if (v26)
    std::__shared_weak_count::__release_weak(v26);
  return v10;
}

void sub_21ABB5150(_Unwind_Exception *a1)
{
  uint64_t v1;
  std::__shared_weak_count *v3;

  _Block_object_dispose((const void *)(v1 - 104), 8);
  v3 = *(std::__shared_weak_count **)(v1 - 56);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandProvider::stop_nl(os_unfair_lock *this)
{
  os_unfair_lock_assert_owner(this + 28);
  if (!LOBYTE(this[29]._os_unfair_lock_opaque))
  {
    LOBYTE(this[29]._os_unfair_lock_opaque) = 1;
    waipc::timesync::BasebandProvider::clearTransport((waipc::timesync::BasebandProvider *)this);
  }
}

void waipc::timesync::BasebandProvider::~BasebandProvider(os_unfair_lock *this)
{
  void *v2;
  void *v3;
  void *v4;
  const void *v5;
  std::__shared_weak_count *v6;

  *(_QWORD *)&this->_os_unfair_lock_opaque = &off_24DDBBC08;
  waipc::timesync::BasebandProvider::stop(this);
  v2 = *(void **)&this[72]._os_unfair_lock_opaque;
  if (v2)
  {
    *(_QWORD *)&this[74]._os_unfair_lock_opaque = v2;
    operator delete(v2);
  }
  v3 = *(void **)&this[66]._os_unfair_lock_opaque;
  if (v3)
  {
    *(_QWORD *)&this[68]._os_unfair_lock_opaque = v3;
    operator delete(v3);
  }
  v4 = *(void **)&this[58]._os_unfair_lock_opaque;
  if (v4)
  {
    *(_QWORD *)&this[60]._os_unfair_lock_opaque = v4;
    operator delete(v4);
  }
  v5 = *(const void **)&this[30]._os_unfair_lock_opaque;
  if (v5)
    CFRelease(v5);
  waipc::timesync::BasebandProvider::config::~config((waipc::timesync::BasebandProvider::config *)&this[6]);
  v6 = *(std::__shared_weak_count **)&this[4]._os_unfair_lock_opaque;
  if (v6)
    std::__shared_weak_count::__release_weak(v6);
}

{
  waipc::timesync::BasebandProvider::~BasebandProvider(this);
  JUMPOUT(0x220752F74);
}

void waipc::timesync::BasebandProvider::stop(os_unfair_lock *this)
{
  os_unfair_lock_s *v2;

  v2 = this + 28;
  os_unfair_lock_lock(this + 28);
  waipc::timesync::BasebandProvider::stop_nl(this);
  os_unfair_lock_unlock(v2);
}

void sub_21ABB528C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::StringRef::~StringRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

void waipc::timesync::BasebandProvider::clearTransport(waipc::timesync::BasebandProvider *this)
{
  NSObject *Logger;
  unsigned int (*v3)(char *);
  const void *v4;
  void *v5;
  const void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  void *aBlock;
  CFTypeRef cf;

  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG))
    waipc::timesync::BasebandProvider::clearTransport();
  os_unfair_lock_assert_owner((const os_unfair_lock *)this + 28);
  v3 = (unsigned int (*)(char *))*((_QWORD *)this + 23);
  if (v3)
  {
    if (v3((char *)this + 128))
    {
      TelephonyUtilTransportFree();
      v4 = (const void *)*((_QWORD *)this + 6);
      if (v4)
      {
        v5 = _Block_copy(v4);
        v6 = (const void *)*((_QWORD *)this + 15);
        if (v6)
          CFRetain(*((CFTypeRef *)this + 15));
        v7 = *((_QWORD *)this + 3);
        v9[0] = MEMORY[0x24BDAC760];
        v9[1] = 1174405120;
        v9[2] = ___ZN5waipc8timesync16BasebandProvider14clearTransportEv_block_invoke;
        v9[3] = &__block_descriptor_tmp_4;
        if (v5)
          v8 = _Block_copy(v5);
        else
          v8 = 0;
        aBlock = v8;
        if (v6)
          CFRetain(v6);
        cf = v6;
        dispatch_async(v7, v9);
        if (cf)
          CFRelease(cf);
        if (aBlock)
          _Block_release(aBlock);
        if (v6)
          CFRelease(v6);
        if (v5)
          _Block_release(v5);
      }
    }
  }
}

void waipc::timesync::BasebandProvider::die(os_unfair_lock *this, const __CFString *a2)
{
  const void *v4;
  const void *v5;

  os_unfair_lock_assert_owner(this + 28);
  if (a2)
    CFRetain(a2);
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v5, a2);
  v4 = *(const void **)&this[30]._os_unfair_lock_opaque;
  *(_QWORD *)&this[30]._os_unfair_lock_opaque = v5;
  v5 = v4;
  if (v4)
    CFRelease(v4);
  waipc::timesync::BasebandProvider::stop_nl(this);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void ___ZN5waipc8timesync16BasebandProvider14setupTransportEv_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  os_unfair_lock *v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(std::__shared_weak_count **)(v3 + 48);
  if (v4)
  {
    v6 = *(os_unfair_lock **)(a1 + 40);
    v7 = std::__shared_weak_count::lock(v4);
    if (v7)
    {
      v8 = v7;
      if (*(_QWORD *)(v3 + 40))
      {
        os_unfair_lock_lock(v6 + 28);
        waipc::timesync::BasebandProvider::transportStatus(v6, a2);
        os_unfair_lock_unlock(v6 + 28);
      }
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }
}

void sub_21ABB55A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  os_unfair_lock_s *v9;

  os_unfair_lock_unlock(v9);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandProvider::transportStatus(os_unfair_lock *a1, unsigned int a2)
{
  NSObject *Logger;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(a1 + 28);
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_21ABB3000, Logger, OS_LOG_TYPE_INFO, "got transport status %d", (uint8_t *)v5, 8u);
  }
  if (a2 <= 1)
    waipc::timesync::BasebandProvider::die(a1, CFSTR("timesync failed to open PCI transport"));
}

void ___ZN5waipc8timesync16BasebandProvider14setupTransportEv_block_invoke_2(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  os_unfair_lock *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;

  v6 = *(os_unfair_lock **)(a1 + 40);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(std::__shared_weak_count **)(v7 + 48);
  if (v8)
  {
    v10 = std::__shared_weak_count::lock(v8);
    if (v10 && *(_QWORD *)(v7 + 40))
    {
      os_unfair_lock_lock(v6 + 28);
      waipc::timesync::BasebandProvider::transportReadCompletion(v6, a2, a3, a4);
      os_unfair_lock_unlock(v6 + 28);
LABEL_10:
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
      return;
    }
  }
  else
  {
    v10 = 0;
  }
  if (!a2 && a3)
    free(a3);
  if (v10)
    goto LABEL_10;
}

void sub_21ABB5780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  os_unfair_lock_s *v9;

  os_unfair_lock_unlock(v9);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandProvider::transportReadCompletion(os_unfair_lock *this, int a2, void *a3, uint64_t a4)
{
  NSObject *Logger;

  os_unfair_lock_assert_owner(this + 28);
  if (a2)
  {
    Logger = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG))
      waipc::timesync::BasebandProvider::transportReadCompletion(a2, Logger);
    waipc::timesync::BasebandProvider::die(this, CFSTR("timesync PCI read failed"));
  }
  else
  {
    if (!a3)
      waipc::timesync::BasebandProvider::transportReadCompletion();
    (*(void (**)(os_unfair_lock *, void *, uint64_t))(*(_QWORD *)&this->_os_unfair_lock_opaque + 56))(this, a3, a4);
    free(a3);
  }
}

uint64_t ___ZN5waipc8timesync16BasebandProvider14clearTransportEv_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

const void *__copy_helper_block_e8_32c55_ZTSN10applesauce8dispatch2v15blockIFvPK10__CFStringEEE40c31_ZTSN10applesauce2CF9StringRefE(uint64_t a1, uint64_t a2)
{
  const void *result;
  const void *v5;

  result = *(const void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  v5 = *(const void **)(a2 + 40);
  if (v5)
    result = CFRetain(v5);
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

void __destroy_helper_block_e8_32c55_ZTSN10applesauce8dispatch2v15blockIFvPK10__CFStringEEE40c31_ZTSN10applesauce2CF9StringRefE(uint64_t a1)
{
  const void *v2;
  const void *v3;

  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 32);
  if (v3)
    _Block_release(v3);
}

uint64_t waipc::timesync::BasebandProvider::configureTransport(const os_unfair_lock *a1)
{
  os_unfair_lock_assert_owner(a1 + 28);
  return 1;
}

uint64_t waipc::timesync::BasebandProvider::engageTransport(const os_unfair_lock *this)
{
  os_unfair_lock_assert_owner(this + 28);
  return 1;
}

void waipc::timesync::BasebandProvider::handleTransportRead(const os_unfair_lock *this, void *a2)
{
  os_unfair_lock_assert_owner(this + 28);
}

void waipc::timesync::BasebandProvider::triggerTimesyncMeasurement(const os_unfair_lock *this)
{
  os_unfair_lock_s *v2;

  v2 = (os_unfair_lock_s *)&this[28];
  os_unfair_lock_lock((os_unfair_lock_t)&this[28]);
  LOBYTE(this[56]._os_unfair_lock_opaque) = 1;
  waipc::timesync::BasebandProvider::checkPendingTimesync(this);
  os_unfair_lock_unlock(v2);
}

void sub_21ABB5954(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandProvider::checkPendingTimesync(const os_unfair_lock *this)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_weak_owners;
  unint64_t v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD v14[7];
  _QWORD v15[6];
  _QWORD v16[6];
  mach_timebase_info info;
  std::__shared_weak_count *v18;
  _QWORD v19[6];
  std::__shared_weak_count *v20;

  os_unfair_lock_assert_owner(this + 28);
  if (LOBYTE(this[56]._os_unfair_lock_opaque)
    && !BYTE1(this[56]._os_unfair_lock_opaque)
    && !BYTE2(this[56]._os_unfair_lock_opaque))
  {
    BYTE1(this[56]._os_unfair_lock_opaque) = 1;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3802000000;
    v19[3] = __Block_byref_object_copy_;
    v19[4] = __Block_byref_object_dispose_;
    std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&info, &this[2]._os_unfair_lock_opaque);
    v2 = v18;
    v19[5] = info;
    v20 = v18;
    if (v18)
    {
      p_shared_weak_owners = (unint64_t *)&v18->__shared_weak_owners_;
      do
        v4 = __ldxr(p_shared_weak_owners);
      while (__stxr(v4 + 1, p_shared_weak_owners));
      p_shared_owners = (unint64_t *)&v2->__shared_owners_;
      do
        v6 = __ldaxr(p_shared_owners);
      while (__stlxr(v6 - 1, p_shared_owners));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
        std::__shared_weak_count::__release_weak(v2);
      }
    }
    v7 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 0x40000000;
    v16[2] = ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke;
    v16[3] = &unk_24DDBBCD0;
    v16[4] = v19;
    v16[5] = this;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 0x40000000;
    v15[2] = ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_15;
    v15[3] = &unk_24DDBBCF8;
    v15[4] = v16;
    v15[5] = this;
    v8 = mach_absolute_time();
    mach_timebase_info(&info);
    v9 = *(_QWORD *)&this[54]._os_unfair_lock_opaque;
    if (v9 && (v10 = (v8 - v9) * info.numer / info.denom, v11 = 1000000 * this[23]._os_unfair_lock_opaque, v11 > v10))
    {
      v12 = dispatch_time(0, v11 - v10);
      v13 = *(NSObject **)&this[6]._os_unfair_lock_opaque;
      v14[0] = v7;
      v14[1] = 0x40000000;
      v14[2] = ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_22;
      v14[3] = &unk_24DDBBD20;
      v14[5] = v19;
      v14[6] = this;
      v14[4] = v15;
      dispatch_after(v12, v13, v14);
    }
    else
    {
      ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_15((uint64_t)v15);
    }
    _Block_object_dispose(v19, 8);
    if (v20)
      std::__shared_weak_count::__release_weak(v20);
  }
}

void sub_21ABB5B48(_Unwind_Exception *a1)
{
  uint64_t v1;
  std::__shared_weak_count *v3;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  v3 = *(std::__shared_weak_count **)(v1 - 72);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke(uint64_t a1, int a2, int a3, int *a4)
{
  uint64_t v8;
  NSObject *Logger;
  uint64_t v10;
  std::__shared_weak_count *v11;
  std::__shared_weak_count *v12;
  std::__shared_weak_count *v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = *(_QWORD *)(a1 + 40);
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG))
    ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_cold_1();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(std::__shared_weak_count **)(v10 + 48);
  if (v11)
  {
    v12 = std::__shared_weak_count::lock(v11);
    if (v12)
    {
      v13 = v12;
      if (*(_QWORD *)(v10 + 40))
      {
        os_unfair_lock_lock((os_unfair_lock_t)(v8 + 112));
        if (!*(_BYTE *)(v8 + 226))
          __assert_rtn("checkPendingTimesync_block_invoke", "BasebandProvider.cpp", 303, "fTimesync.running");
        if (a2)
        {
          v14 = waipc::logging::getLogger(2u);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            v19 = a2;
            _os_log_impl(&dword_21ABB3000, v14, OS_LOG_TYPE_INFO, "time sync failed 0x%08x", buf, 8u);
          }
          if (a2 == -536870167 || a2 == -536870184)
          {
            v15 = waipc::logging::getLogger(2u);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21ABB3000, v15, OS_LOG_TYPE_INFO, "AP sleep, ignore time sync failure!", buf, 2u);
            }
          }
          else
          {
            waipc::timesync::BasebandProvider::die((os_unfair_lock *)v8, CFSTR("timesync measurement failed"));
          }
        }
        else if (!*(_BYTE *)(v8 + 227) && !*(_BYTE *)(v8 + 117))
        {
          waipc::timesync::BasebandProvider::handleTimesync<PCITransportTimesyncMeasurement *>(v8, 0, a4, &a4[6 * a3]);
        }
        *(_QWORD *)(v8 + 216) = mach_absolute_time();
        *(_WORD *)(v8 + 226) = 0;
        waipc::timesync::BasebandProvider::checkPendingTimesync((waipc::timesync::BasebandProvider *)v8);
        os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 112));
      }
      p_shared_owners = (unint64_t *)&v13->__shared_owners_;
      do
        v17 = __ldaxr(p_shared_owners);
      while (__stlxr(v17 - 1, p_shared_owners));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }
}

void sub_21ABB5DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  os_unfair_lock_s *v9;

  os_unfair_lock_unlock(v9);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandProvider::handleTimesync<PCITransportTimesyncMeasurement *>(uint64_t a1, int a2, int *a3, int *a4)
{
  uint64_t v8;
  char *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char *v16;
  _BYTE *v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v25;
  const void *v26;
  const void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  _QWORD v31[5];
  void *aBlock;
  __int128 v33;
  __int128 v34;
  void (*v35)(uint64_t);
  void *__p;
  void *v37;
  uint64_t v38;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 112));
  if (*(_DWORD *)(a1 + 256) != a2)
  {
    v8 = *(_QWORD *)(a1 + 232);
    v9 = (char *)v8;
    if (a3 != a4)
    {
      while (v9 != *(char **)(a1 + 240))
      {
        if (*a3 == *(_DWORD *)v9)
        {
          waipc::timesync::BasebandProvider::timesyncMeasurement::complete((uint64_t)v9, (uint64_t)a3);
          if (v9 != (char *)v8)
          {
            v10 = *(_OWORD *)v9;
            v11 = *((_OWORD *)v9 + 1);
            v35 = (void (*)(uint64_t))*((_QWORD *)v9 + 4);
            v33 = v10;
            v34 = v11;
            v12 = *(_OWORD *)v8;
            v13 = *(_OWORD *)(v8 + 16);
            *((_QWORD *)v9 + 4) = *(_QWORD *)(v8 + 32);
            *(_OWORD *)v9 = v12;
            *((_OWORD *)v9 + 1) = v13;
            v14 = v33;
            v15 = v34;
            *(_QWORD *)(v8 + 32) = v35;
            *(_OWORD *)v8 = v14;
            *(_OWORD *)(v8 + 16) = v15;
          }
          v8 += 40;
          v9 += 40;
          a3 += 6;
        }
        else if (*a3 - *(_DWORD *)v9 < 0)
        {
          a3 += 6;
        }
        else
        {
          v9 += 40;
        }
        if (a3 == a4)
        {
          a3 = a4;
          break;
        }
      }
    }
    if (!*(_BYTE *)(a1 + 116))
    {
      if (*(_QWORD *)(a1 + 56))
      {
        v26 = *(const void **)(a1 + 232);
        if ((const void *)v8 != v26)
        {
          *(_QWORD *)&v33 = 0;
          *((_QWORD *)&v33 + 1) = &v33;
          *(_QWORD *)&v34 = 0x4002000000;
          *((_QWORD *)&v34 + 1) = __Block_byref_object_copy__112;
          v35 = __Block_byref_object_dispose__113;
          v37 = 0;
          v38 = 0;
          __p = 0;
          std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__init_with_size[abi:ne180100]<std::__wrap_iter<waipc::timesync::BasebandProvider::timesyncMeasurement*>,std::__wrap_iter<waipc::timesync::BasebandProvider::timesyncMeasurement*>>(&__p, v26, v8, 0xCCCCCCCCCCCCCCCDLL * ((v8 - (uint64_t)v26) >> 3));
          waipc::timesync::BasebandProvider::logMeasurements(a1, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 40), *(char **)(*((_QWORD *)&v33 + 1) + 48));
          v27 = *(const void **)(a1 + 56);
          if (v27)
            v28 = _Block_copy(v27);
          else
            v28 = 0;
          v29 = *(NSObject **)(a1 + 24);
          v31[0] = MEMORY[0x24BDAC760];
          v31[1] = 1174405120;
          v31[2] = ___ZN5waipc8timesync16BasebandProvider14handleTimesyncIP31PCITransportTimesyncMeasurementEEvNS1_16timesyncEndpointET_S6__block_invoke;
          v31[3] = &unk_24DDBBFF8;
          if (v28)
            v30 = _Block_copy(v28);
          else
            v30 = 0;
          v31[4] = &v33;
          aBlock = v30;
          dispatch_async(v29, v31);
          if (aBlock)
            _Block_release(aBlock);
          if (v28)
            _Block_release(v28);
          _Block_object_dispose(&v33, 8);
          if (__p)
          {
            v37 = __p;
            operator delete(__p);
          }
        }
      }
    }
    v16 = *(char **)(a1 + 232);
    if (v16 != v9)
    {
      v17 = *(_BYTE **)(a1 + 240);
      v18 = v17 - v9;
      if (v17 != v9)
        memmove(*(void **)(a1 + 232), v9, v17 - v9);
      *(_QWORD *)(a1 + 240) = &v16[v18];
    }
  }
  if (a3 != a4)
  {
    if (*(_DWORD *)(a1 + 256) == a2)
    {
      v19 = *(char **)(a1 + 240);
    }
    else
    {
      v19 = *(char **)(a1 + 232);
      if (v19 != *(char **)(a1 + 240))
        waipc::timesync::BasebandProvider::handleTimesync<PCITransportTimesyncMeasurement *>();
    }
    *(_DWORD *)(a1 + 256) = a2;
    std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__insert_with_size[abi:ne180100]<PCITransportTimesyncMeasurement *,PCITransportTimesyncMeasurement *>(a1 + 232, v19, a3, a4, 0xAAAAAAAAAAAAAAABLL * (((char *)a4 - (char *)a3) >> 3));
  }
  v20 = (2 * *(_DWORD *)(a1 + 88));
  v22 = *(char **)(a1 + 232);
  v21 = *(char **)(a1 + 240);
  v23 = &v21[-40 * v20];
  if (0xCCCCCCCCCCCCCCCDLL * ((v21 - v22) >> 3) > v20 && v22 != v23)
  {
    v25 = 40 * v20;
    if (v21 != v23)
      memmove(*(void **)(a1 + 232), v23, 40 * v20);
    *(_QWORD *)(a1 + 240) = &v22[v25];
  }
}

void sub_21ABB60D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  _Block_object_dispose(&a15, 8);
  if (__p)
  {
    a21 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_15(uint64_t a1)
{
  uint64_t v1;
  NSObject *Logger;
  uint64_t (*v3)(uint64_t);
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v1 = *(_QWORD *)(a1 + 40);
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG))
    ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_15_cold_4();
  os_unfair_lock_assert_owner((const os_unfair_lock *)(v1 + 112));
  if (!*(_BYTE *)(v1 + 224))
    ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_15_cold_1();
  if (!*(_BYTE *)(v1 + 225))
    ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_15_cold_2();
  if (*(_BYTE *)(v1 + 226))
    ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_15_cold_3();
  *(_WORD *)(v1 + 224) = 0;
  v3 = *(uint64_t (**)(uint64_t))(v1 + 184);
  if (v3 && (v3(v1 + 128) & 1) != 0)
  {
    if ((TelephonyBasebandPCITransportTimesync() & 1) != 0)
    {
      *(_BYTE *)(v1 + 226) = 1;
    }
    else
    {
      v5 = waipc::logging::getLogger(2u);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_21ABB3000, v5, OS_LOG_TYPE_INFO, "transport time sync start failed", v6, 2u);
      }
      waipc::timesync::BasebandProvider::die((os_unfair_lock *)v1, CFSTR("timesync measurement trigger failed"));
    }
  }
  else
  {
    v4 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ABB3000, v4, OS_LOG_TYPE_INFO, "unable to trigger timesync measurement because transport is not valid", buf, 2u);
    }
  }
}

void ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_22(_QWORD *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  os_unfair_lock_s *v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  v2 = *(_QWORD *)(a1[5] + 8);
  v3 = *(std::__shared_weak_count **)(v2 + 48);
  if (v3)
  {
    v4 = (os_unfair_lock_s *)a1[6];
    v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      v6 = v5;
      if (*(_QWORD *)(v2 + 40))
      {
        os_unfair_lock_lock(v4 + 28);
        (*(void (**)(void))(a1[4] + 16))();
        os_unfair_lock_unlock(v4 + 28);
      }
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_21ABB6308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  os_unfair_lock_s *v9;

  os_unfair_lock_unlock(v9);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandProvider::cancelTimesyncMeasurement(os_unfair_lock_s *this)
{
  os_unfair_lock_s *v2;

  v2 = this + 28;
  os_unfair_lock_lock(this + 28);
  if (BYTE2(this[56]._os_unfair_lock_opaque))
    HIBYTE(this[56]._os_unfair_lock_opaque) = 1;
  *(_QWORD *)&this[60]._os_unfair_lock_opaque = *(_QWORD *)&this[58]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(v2);
}

void waipc::timesync::BasebandProvider::subscribe(os_unfair_lock_s *a1)
{
  os_unfair_lock_s *v1;
  NSObject *Logger;
  uint8_t v3[16];

  v1 = a1 + 28;
  os_unfair_lock_lock(a1 + 28);
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21ABB3000, Logger, OS_LOG_TYPE_INFO, "subscribe not supported", v3, 2u);
  }
  os_unfair_lock_unlock(v1);
}

void sub_21ABB63DC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandProvider::mapBuffer(os_unfair_lock_s *a1)
{
  os_unfair_lock_s *v1;
  NSObject *Logger;
  uint8_t v3[16];

  v1 = a1 + 28;
  os_unfair_lock_lock(a1 + 28);
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21ABB3000, Logger, OS_LOG_TYPE_INFO, "buffer map not supported", v3, 2u);
  }
  os_unfair_lock_unlock(v1);
}

void sub_21ABB6464(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandProvider::unmapBuffer(os_unfair_lock_s *a1)
{
  os_unfair_lock_s *v1;
  NSObject *Logger;
  uint8_t v3[16];

  v1 = a1 + 28;
  os_unfair_lock_lock(a1 + 28);
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21ABB3000, Logger, OS_LOG_TYPE_INFO, "buffer unmap not supported", v3, 2u);
  }
  os_unfair_lock_unlock(v1);
}

void sub_21ABB64EC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandProvider::logTimestamp(uint64_t a1, char a2, uint64_t a3, uint64_t a4, double a5)
{
  unint64_t v10;
  char **v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  __int128 v31;
  __int128 v32;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 112));
  v10 = *(_QWORD *)(a1 + 104);
  if (v10)
  {
    v11 = (char **)(a1 + 288);
    v12 = *(_QWORD *)(a1 + 288);
    v13 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(a1 + 296) - v12) >> 3) + 1;
    v14 = v13 >= v10;
    v15 = v13 - v10;
    if (v15 != 0 && v14)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::erase(a1 + 288, v12, v12 + 40 * v15);
    v16 = mach_absolute_time();
    v17 = v16;
    v19 = *(_QWORD *)(a1 + 296);
    v18 = *(_QWORD *)(a1 + 304);
    if (v19 >= v18)
    {
      v21 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v19 - (_QWORD)*v11) >> 3);
      v22 = v21 + 1;
      if (v21 + 1 > 0x666666666666666)
        std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
      v23 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v18 - (_QWORD)*v11) >> 3);
      if (2 * v23 > v22)
        v22 = 2 * v23;
      if (v23 >= 0x333333333333333)
        v24 = 0x666666666666666;
      else
        v24 = v22;
      v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>>(a1 + 304, v24);
      v26 = &v25[40 * v21];
      v28 = &v25[40 * v27];
      *(_QWORD *)v26 = v17;
      v26[8] = a2;
      *((_QWORD *)v26 + 2) = a3;
      *((double *)v26 + 3) = a5;
      *((_QWORD *)v26 + 4) = a4;
      v20 = v26 + 40;
      v30 = *(char **)(a1 + 288);
      v29 = *(char **)(a1 + 296);
      if (v29 != v30)
      {
        do
        {
          v31 = *(_OWORD *)(v29 - 40);
          v32 = *(_OWORD *)(v29 - 24);
          *((_QWORD *)v26 - 1) = *((_QWORD *)v29 - 1);
          *(_OWORD *)(v26 - 24) = v32;
          *(_OWORD *)(v26 - 40) = v31;
          v26 -= 40;
          v29 -= 40;
        }
        while (v29 != v30);
        v29 = *v11;
      }
      *(_QWORD *)(a1 + 288) = v26;
      *(_QWORD *)(a1 + 296) = v20;
      *(_QWORD *)(a1 + 304) = v28;
      if (v29)
        operator delete(v29);
    }
    else
    {
      *(_QWORD *)v19 = v16;
      *(_BYTE *)(v19 + 8) = a2;
      *(_QWORD *)(v19 + 16) = a3;
      *(double *)(v19 + 24) = a5;
      v20 = (char *)(v19 + 40);
      *(_QWORD *)(v19 + 32) = a4;
    }
    *(_QWORD *)(a1 + 296) = v20;
  }
}

uint64_t std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::erase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  if (a2 != a3)
  {
    v3 = *(_QWORD *)(a1 + 8);
    v4 = a2;
    if (a3 != v3)
    {
      v5 = 8 * ((a3 - a2) >> 3);
      v4 = a2;
      do
      {
        *(_QWORD *)v4 = *(_QWORD *)(v4 + v5);
        v6 = *(_OWORD *)(v4 + v5 + 24);
        *(_OWORD *)(v4 + 8) = *(_OWORD *)(v4 + v5 + 8);
        *(_OWORD *)(v4 + 24) = v6;
        v4 += 40;
      }
      while (v4 + v5 != v3);
    }
    *(_QWORD *)(a1 + 8) = v4;
  }
  return a2;
}

char *waipc::timesync::BasebandProvider::logMeasurements(uint64_t a1, uint64_t a2, char *a3)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  size_t v11;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 112));
  v6 = *(_QWORD *)(a1 + 96);
  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&a3[-a2] >> 3) >= v6)
    v7 = *(_QWORD *)(a1 + 96);
  else
    v7 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&a3[-a2] >> 3);
  v9 = *(char **)(a1 + 264);
  v8 = *(_QWORD *)(a1 + 272);
  if (v6 - v7 < 0xCCCCCCCCCCCCCCCDLL * ((v8 - (uint64_t)v9) >> 3))
  {
    v10 = (char *)(v8 - 40 * (v6 - v7));
    if (v9 != v10)
    {
      v11 = 40 * (v6 - v7);
      if ((char *)v8 != v10)
        memmove(*(void **)(a1 + 264), v10, v11);
      v8 = (uint64_t)&v9[v11];
      *(_QWORD *)(a1 + 272) = &v9[v11];
    }
  }
  return std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__insert_with_size[abi:ne180100]<std::__wrap_iter<waipc::timesync::BasebandProvider::timesyncMeasurement const*>,std::__wrap_iter<waipc::timesync::BasebandProvider::timesyncMeasurement const*>>(a1 + 264, v8, &a3[-40 * v7], a3, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(40 * v7) >> 3));
}

CFTypeRef waipc::timesync::BasebandProvider::dumpState(waipc::timesync::BasebandProvider *this)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void **v9;
  void **v10;
  void **v11;
  void **v12;
  void **v13;
  void **v14;
  void **v15;
  void **v16;
  CFArrayRef v17;
  const __CFString *v18;
  uint64_t i;
  void **v20;
  CFTypeRef v21;
  CFTypeRef cf[3];
  char **v24[3];
  char *v25[3];
  CFTypeRef v26;
  CFTypeRef v27;
  void **v28[12];
  _QWORD v29[11];

  v29[10] = *MEMORY[0x24BDAC8D0];
  v2 = (os_unfair_lock_s *)((char *)this + 112);
  os_unfair_lock_lock((os_unfair_lock_t)this + 28);
  memset(v25, 0, sizeof(v25));
  std::vector<applesauce::CF::DictionaryRef>::reserve(v25, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)this + 30) - *((_QWORD *)this + 29)) >> 3));
  v3 = *((_QWORD *)this + 29);
  v4 = *((_QWORD *)this + 30);
  v24[0] = v25;
  while (v3 != v4)
  {
    ___ZNK5waipc8timesync16BasebandProvider9dumpStateEv_block_invoke(v3, (applesauce::CF::DictionaryRef *)cf);
    std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>::operator=[abi:ne180100](v24, cf);
    if (cf[0])
      CFRelease(cf[0]);
    v3 += 40;
  }
  memset(v24, 0, sizeof(v24));
  std::vector<applesauce::CF::DictionaryRef>::reserve((char **)v24, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)this + 34) - *((_QWORD *)this + 33)) >> 3));
  v5 = *((_QWORD *)this + 33);
  v6 = *((_QWORD *)this + 34);
  cf[0] = v24;
  while (v5 != v6)
  {
    ___ZNK5waipc8timesync16BasebandProvider9dumpStateEv_block_invoke(v5, (applesauce::CF::DictionaryRef *)&v27);
    std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>::operator=[abi:ne180100]((char ***)cf, &v27);
    if (v27)
      CFRelease(v27);
    v5 += 40;
  }
  memset(cf, 0, sizeof(cf));
  std::vector<applesauce::CF::DictionaryRef>::reserve((char **)cf, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)this + 37) - *((_QWORD *)this + 36)) >> 3));
  v7 = *((_QWORD *)this + 36);
  v8 = *((_QWORD *)this + 37);
  v27 = cf;
  while (v7 != v8)
  {
    ___ZNK5waipc8timesync16BasebandProvider9dumpStateEv_block_invoke_2(v7, (applesauce::CF::DictionaryRef *)&v26);
    std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>::operator=[abi:ne180100]((char ***)&v27, &v26);
    if (v26)
      CFRelease(v26);
    v7 += 40;
  }
  v9 = (void **)*MEMORY[0x24BDBD270];
  v10 = (void **)*MEMORY[0x24BDBD268];
  if (*((_BYTE *)this + 116))
    v11 = (void **)*MEMORY[0x24BDBD270];
  else
    v11 = (void **)*MEMORY[0x24BDBD268];
  v28[0] = (void **)CFSTR("Stopped");
  v28[1] = v11;
  v28[2] = (void **)CFSTR("Error Reason");
  v12 = (void **)*((_QWORD *)this + 15);
  if (v12)
    CFRetain(*((CFTypeRef *)this + 15));
  v28[3] = v12;
  v28[4] = (void **)CFSTR("Timesync Pending");
  if (*((_BYTE *)this + 224))
    v13 = v9;
  else
    v13 = v10;
  v28[5] = v13;
  v28[6] = (void **)CFSTR("Timesync Triggering");
  if (*((_BYTE *)this + 225))
    v14 = v9;
  else
    v14 = v10;
  v28[7] = v14;
  v28[8] = (void **)CFSTR("Timesync Running");
  if (*((_BYTE *)this + 226))
    v15 = v9;
  else
    v15 = v10;
  v28[9] = v15;
  v28[10] = (void **)CFSTR("Timesync Cancelled");
  if (*((_BYTE *)this + 227))
    v16 = v9;
  else
    v16 = v10;
  v28[11] = v16;
  waipc::util::_kv::_kv<unsigned long long const&,void>(v29, (uint64_t)CFSTR("Last Timesync Trigger"), (uint64_t *)this + 27);
  v29[2] = CFSTR("Partial Measurements");
  v17 = applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>((uint64_t **)v25);
  if (*((_DWORD *)this + 64))
    v18 = CFSTR("device");
  else
    v18 = CFSTR("host");
  v29[3] = v17;
  v29[4] = CFSTR("Partial Endpoint");
  CFRetain(v18);
  v29[5] = v18;
  v29[6] = CFSTR("Measurement Log");
  v29[7] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>((uint64_t **)v24);
  v29[8] = CFSTR("Timestamp Log");
  v29[9] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>((uint64_t **)cf);
  waipc::util::createCFDictDropNull<11l>((uint64_t)v28, (applesauce::CF::DictionaryRef *)&v27);
  for (i = 21; i != -1; i -= 2)
  {
    v20 = v28[i];
    if (v20)
      CFRelease(v20);
  }
  v21 = v27;
  v28[0] = (void **)cf;
  std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](v28);
  v28[0] = (void **)v24;
  std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](v28);
  v28[0] = (void **)v25;
  std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](v28);
  os_unfair_lock_unlock(v2);
  return v21;
}

void sub_21ABB6B44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, char a18, int a19, __int16 a20,char a21,char a22,uint64_t a23)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_21ABB6C1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  applesauce::CF::DictionaryRef::~DictionaryRef(&a9);
  JUMPOUT(0x21ABB6BFCLL);
}

void ___ZNK5waipc8timesync16BasebandProvider9dumpStateEv_block_invoke(uint64_t a1@<X1>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t i;
  const void *v5;
  _QWORD v6[2];
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  waipc::util::_kv::_kv<unsigned int const&,void>(v6, (uint64_t)CFSTR("SEQ"), (int *)a1);
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v7, (uint64_t)CFSTR("Host Begin"), (uint64_t *)(a1 + 8));
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v8, (uint64_t)CFSTR("Host Duration"), (uint64_t *)(a1 + 16));
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v9, (uint64_t)CFSTR("Device Time"), (uint64_t *)(a1 + 24));
  waipc::util::_kv::_kv<double const&,void>(v10, (uint64_t)CFSTR("Device Granularity"), (uint64_t *)(a1 + 32));
  waipc::util::createCFDictDropNull<5l>((uint64_t)v6, a2);
  for (i = 9; i != -1; i -= 2)
  {
    v5 = (const void *)v6[i];
    if (v5)
      CFRelease(v5);
  }
}

void sub_21ABB6D3C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t i;

  for (i = 64; i != -16; i -= 16)
    waipc::util::_kv::~_kv((waipc::util::_kv *)(v1 + i));
  _Unwind_Resume(a1);
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<5l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3;
  CFIndex v4;
  void *v5;
  uint64_t v6;
  CFDictionaryRef v7;
  _OWORD v9[2];
  uint64_t v10;
  void *keys[2];
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v3 = 0;
  v4 = 0;
  v14 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  *(_OWORD *)keys = 0u;
  v12 = 0u;
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  do
  {
    v5 = *(void **)(a1 + v3);
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        *((_QWORD *)v9 + v4++) = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 80);
  v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)v9, v4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

uint64_t std::vector<applesauce::CF::DictionaryRef>::reserve(char **a1, unint64_t a2)
{
  uint64_t result;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int64x2_t v12;
  char *v13;
  uint64_t v14;
  int64x2_t v15;
  char *v16;
  uint64_t v17;

  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v17 = result;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(result, a2);
    v9 = *a1;
    v8 = a1[1];
    if (v8 == *a1)
    {
      v12 = vdupq_n_s64((unint64_t)v8);
      v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
      do
      {
        v11 = *((_QWORD *)v8 - 1);
        v8 -= 8;
        *((_QWORD *)v10 - 1) = v11;
        v10 -= 8;
        *(_QWORD *)v8 = 0;
      }
      while (v8 != v9);
      v12 = *(int64x2_t *)a1;
    }
    *a1 = v10;
    a1[1] = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v15 = v12;
    v13 = a1[2];
    a1[2] = &v6[8 * v7];
    v16 = v13;
    v14 = v12.i64[0];
    return std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)&v14);
  }
  return result;
}

void ___ZNK5waipc8timesync16BasebandProvider9dumpStateEv_block_invoke_2(uint64_t a1@<X1>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t i;
  const void *v5;
  char v6;
  _QWORD v7[2];
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  waipc::util::_kv::_kv<unsigned long long const&,void>(v7, (uint64_t)CFSTR("Mach Time"), (uint64_t *)a1);
  v6 = *(_BYTE *)(a1 + 8);
  waipc::util::_kv::_kv<unsigned char,void>(&v8, (uint64_t)CFSTR("Type"), &v6);
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v9, (uint64_t)CFSTR("Time"), (uint64_t *)(a1 + 16));
  waipc::util::_kv::_kv<double const&,void>(&v10, (uint64_t)CFSTR("Time Granularity"), (uint64_t *)(a1 + 24));
  waipc::util::_kv::_kv<unsigned long long const&,void>(v11, (uint64_t)CFSTR("Interval"), (uint64_t *)(a1 + 32));
  waipc::util::createCFDictDropNull<5l>((uint64_t)v7, a2);
  for (i = 9; i != -1; i -= 2)
  {
    v5 = (const void *)v7[i];
    if (v5)
      CFRelease(v5);
  }
}

void sub_21ABB7038(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t i;

  for (i = 64; i != -16; i -= 16)
    waipc::util::_kv::~_kv((waipc::util::_kv *)(v1 + i));
  _Unwind_Resume(a1);
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<11l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3;
  CFIndex v4;
  void *v5;
  uint64_t v6;
  CFDictionaryRef v7;
  _OWORD v9[5];
  uint64_t v10;
  void *keys[2];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v3 = 0;
  v4 = 0;
  v17 = *MEMORY[0x24BDAC8D0];
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  *(_OWORD *)keys = 0u;
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  do
  {
    v5 = *(void **)(a1 + v3);
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        *((_QWORD *)v9 + v4++) = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 176);
  v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)v9, v4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

void applesauce::CF::DictionaryRef::~DictionaryRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

const __CFString *waipc::timesync::BasebandProvider::getTimestampName(int a1)
{
  if (a1)
    return CFSTR("unknown");
  else
    return CFSTR("Network Uplink Schedule");
}

const __CFString *waipc::timesync::BasebandProvider::getBufferName(int a1)
{
  if (a1)
    return CFSTR("unknown");
  else
    return CFSTR("Disco");
}

void waipc::timesync::ModernBasebandProvider::mapBuffer(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  NSObject *Logger;
  NSObject *v9;
  os_unfair_lock_s *v10;
  uint64_t (*v11)(uint64_t);
  std::__shared_weak_count *v12;
  unint64_t *p_shared_weak_owners;
  unint64_t v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint8_t v19[8];
  std::__shared_weak_count *v20;
  _BYTE buf[32];
  void (*v22)(uint64_t);
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 16777984;
    buf[4] = a2;
    *(_WORD *)&buf[5] = 2048;
    *(_QWORD *)&buf[7] = a3;
    *(_WORD *)&buf[15] = 2048;
    *(_QWORD *)&buf[17] = a4;
    _os_log_debug_impl(&dword_21ABB3000, Logger, OS_LOG_TYPE_DEBUG, "mapping buffer with id %hhu, addr %p, length %zu", buf, 0x19u);
  }
  if (a2)
  {
    v9 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 16777472;
      buf[4] = a2;
      _os_log_impl(&dword_21ABB3000, v9, OS_LOG_TYPE_INFO, "unknown buffer id %hhu", buf, 5u);
    }
  }
  else
  {
    v10 = (os_unfair_lock_s *)(a1 + 112);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    v11 = *(uint64_t (**)(uint64_t))(a1 + 184);
    if (v11 && (v11(a1 + 128) & 1) != 0)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3802000000;
      *(_QWORD *)&buf[24] = __Block_byref_object_copy_;
      v22 = __Block_byref_object_dispose_;
      std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(v19, (_QWORD *)(a1 + 8));
      v12 = v20;
      v23 = *(_QWORD *)v19;
      v24 = v20;
      if (v20)
      {
        p_shared_weak_owners = (unint64_t *)&v20->__shared_weak_owners_;
        do
          v14 = __ldxr(p_shared_weak_owners);
        while (__stxr(v14 + 1, p_shared_weak_owners));
        p_shared_owners = (unint64_t *)&v12->__shared_owners_;
        do
          v16 = __ldaxr(p_shared_owners);
        while (__stlxr(v16 - 1, p_shared_owners));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }
      if ((TelephonyBasebandPCITransportMapRegion() & 1) == 0)
      {
        v17 = waipc::logging::getLogger(2u);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v19 = 16777472;
          v19[4] = 0;
          _os_log_impl(&dword_21ABB3000, v17, OS_LOG_TYPE_INFO, "buffer map for buffer %hhu failed", v19, 5u);
        }
        waipc::timesync::BasebandProvider::die((os_unfair_lock *)a1, CFSTR("buffer map failed"));
      }
      _Block_object_dispose(buf, 8);
      if (v24)
        std::__shared_weak_count::__release_weak(v24);
    }
    else
    {
      v18 = waipc::logging::getLogger(2u);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ABB3000, v18, OS_LOG_TYPE_INFO, "unable to map buffer because transport is not valid", buf, 2u);
      }
    }
    os_unfair_lock_unlock(v10);
  }
}

void sub_21ABB74CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,std::__shared_weak_count *a25)
{
  os_unfair_lock_s *v25;

  _Block_object_dispose(&a19, 8);
  if (a25)
    std::__shared_weak_count::__release_weak(a25);
  os_unfair_lock_unlock(v25);
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync22ModernBasebandProvider9mapBufferENS0_16BasebandProvider8bufferIdEPvm_block_invoke(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *Logger;
  uint64_t v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  os_unfair_lock_s *v10;
  NSObject *v11;
  char v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  const void *v15;
  void *v16;
  const void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  void *aBlock;
  char v22;
  std::__shared_weak_count *v24;
  uint8_t buf[4];
  char v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 40);
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG))
    ___ZN5waipc8timesync22ModernBasebandProvider9mapBufferENS0_16BasebandProvider8bufferIdEPvm_block_invoke_cold_1();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(std::__shared_weak_count **)(v6 + 48);
  if (v7)
  {
    v8 = std::__shared_weak_count::lock(v7);
    v24 = v8;
    if (v8)
    {
      v9 = v8;
      if (*(_QWORD *)(v6 + 40))
      {
        v10 = (os_unfair_lock_s *)(v4 + 112);
        os_unfair_lock_lock((os_unfair_lock_t)(v4 + 112));
        if (!*(_BYTE *)(v4 + 116))
        {
          if (a2)
          {
            v11 = waipc::logging::getLogger(2u);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              v12 = *(_BYTE *)(a1 + 48);
              *(_DWORD *)buf = 16777728;
              v26 = v12;
              v27 = 1024;
              v28 = a2;
              _os_log_impl(&dword_21ABB3000, v11, OS_LOG_TYPE_INFO, "buffer map for buffer %hhu failed 0x%08x", buf, 0xBu);
            }
            waipc::timesync::BasebandProvider::die((os_unfair_lock *)v4, CFSTR("buffer map failed"));
          }
          else
          {
            v15 = *(const void **)(v4 + 72);
            if (v15)
            {
              v16 = _Block_copy(v15);
              v17 = v16;
              v18 = *(NSObject **)(v4 + 24);
              v20[0] = MEMORY[0x24BDAC760];
              v20[1] = 1174405120;
              v20[2] = ___ZN5waipc8timesync22ModernBasebandProvider9mapBufferENS0_16BasebandProvider8bufferIdEPvm_block_invoke_83;
              v20[3] = &__block_descriptor_tmp_84;
              if (v16)
                v19 = _Block_copy(v16);
              else
                v19 = 0;
              aBlock = v19;
              v22 = *(_BYTE *)(a1 + 48);
              dispatch_async(v18, v20);
              if (aBlock)
                _Block_release(aBlock);
              if (v17)
                _Block_release(v17);
            }
          }
        }
        os_unfair_lock_unlock(v10);
      }
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
}

void sub_21ABB7714(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN5waipc8timesync22ModernBasebandProvider9mapBufferENS0_16BasebandProvider8bufferIdEPvm_block_invoke_83(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 1);
}

void *__copy_helper_block_e8_32c86_ZTSN10applesauce8dispatch2v15blockIFvN5waipc8timesync16BasebandProvider8bufferIdEbEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c86_ZTSN10applesauce8dispatch2v15blockIFvN5waipc8timesync16BasebandProvider8bufferIdEbEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

void waipc::timesync::ModernBasebandProvider::unmapBuffer(uint64_t a1, int a2)
{
  NSObject *Logger;
  NSObject *v5;
  os_unfair_lock_s *v6;
  uint64_t (*v7)(uint64_t);
  std::__shared_weak_count *v8;
  unint64_t *p_shared_weak_owners;
  unint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[8];
  std::__shared_weak_count *v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  std::__shared_weak_count *v23;

  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG))
    waipc::timesync::ModernBasebandProvider::unmapBuffer(a2, Logger);
  if (a2)
  {
    v5 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 16777472;
      buf[4] = a2;
      _os_log_impl(&dword_21ABB3000, v5, OS_LOG_TYPE_INFO, "unknown buffer id %hhu", buf, 5u);
    }
  }
  else
  {
    v6 = (os_unfair_lock_s *)(a1 + 112);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    v7 = *(uint64_t (**)(uint64_t))(a1 + 184);
    if (v7 && (v7(a1 + 128) & 1) != 0)
    {
      *(_QWORD *)buf = 0;
      v18 = buf;
      v19 = 0x3802000000;
      v20 = __Block_byref_object_copy_;
      v21 = __Block_byref_object_dispose_;
      std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(v15, (_QWORD *)(a1 + 8));
      v8 = v16;
      v22 = *(_QWORD *)v15;
      v23 = v16;
      if (v16)
      {
        p_shared_weak_owners = (unint64_t *)&v16->__shared_weak_owners_;
        do
          v10 = __ldxr(p_shared_weak_owners);
        while (__stxr(v10 + 1, p_shared_weak_owners));
        p_shared_owners = (unint64_t *)&v8->__shared_owners_;
        do
          v12 = __ldaxr(p_shared_owners);
        while (__stlxr(v12 - 1, p_shared_owners));
        if (!v12)
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
      }
      if ((TelephonyBasebandPCITransportUnmapRegion() & 1) == 0)
      {
        v13 = waipc::logging::getLogger(2u);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v15 = 16777472;
          v15[4] = 0;
          _os_log_impl(&dword_21ABB3000, v13, OS_LOG_TYPE_INFO, "buffer unmap for buffer %hhu failed", v15, 5u);
        }
        waipc::timesync::BasebandProvider::die((os_unfair_lock *)a1, CFSTR("buffer unmap failed"));
      }
      _Block_object_dispose(buf, 8);
      if (v23)
        std::__shared_weak_count::__release_weak(v23);
    }
    else
    {
      v14 = waipc::logging::getLogger(2u);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ABB3000, v14, OS_LOG_TYPE_INFO, "unable to unmap buffer because transport is not valid", buf, 2u);
      }
    }
    os_unfair_lock_unlock(v6);
  }
}

void sub_21ABB7A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,std::__shared_weak_count *a25)
{
  os_unfair_lock_s *v25;

  _Block_object_dispose(&a19, 8);
  if (a25)
    std::__shared_weak_count::__release_weak(a25);
  os_unfair_lock_unlock(v25);
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync22ModernBasebandProvider11unmapBufferENS0_16BasebandProvider8bufferIdE_block_invoke(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *Logger;
  uint64_t v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  os_unfair_lock_s *v10;
  NSObject *v11;
  char v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  const void *v15;
  void *v16;
  const void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  void *aBlock;
  char v22;
  std::__shared_weak_count *v24;
  uint8_t buf[4];
  char v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 40);
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG))
    ___ZN5waipc8timesync22ModernBasebandProvider11unmapBufferENS0_16BasebandProvider8bufferIdE_block_invoke_cold_1();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(std::__shared_weak_count **)(v6 + 48);
  if (v7)
  {
    v8 = std::__shared_weak_count::lock(v7);
    v24 = v8;
    if (v8)
    {
      v9 = v8;
      if (*(_QWORD *)(v6 + 40))
      {
        v10 = (os_unfair_lock_s *)(v4 + 112);
        os_unfair_lock_lock((os_unfair_lock_t)(v4 + 112));
        if (!*(_BYTE *)(v4 + 116))
        {
          if (a2)
          {
            v11 = waipc::logging::getLogger(2u);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              v12 = *(_BYTE *)(a1 + 48);
              *(_DWORD *)buf = 16777728;
              v26 = v12;
              v27 = 1024;
              v28 = a2;
              _os_log_impl(&dword_21ABB3000, v11, OS_LOG_TYPE_INFO, "buffer unmap for buffer %hhu failed 0x%08x", buf, 0xBu);
            }
            waipc::timesync::BasebandProvider::die((os_unfair_lock *)v4, CFSTR("buffer unmap failed"));
          }
          else
          {
            v15 = *(const void **)(v4 + 72);
            if (v15)
            {
              v16 = _Block_copy(v15);
              v17 = v16;
              v18 = *(NSObject **)(v4 + 24);
              v20[0] = MEMORY[0x24BDAC760];
              v20[1] = 1174405120;
              v20[2] = ___ZN5waipc8timesync22ModernBasebandProvider11unmapBufferENS0_16BasebandProvider8bufferIdE_block_invoke_89;
              v20[3] = &__block_descriptor_tmp_90;
              if (v16)
                v19 = _Block_copy(v16);
              else
                v19 = 0;
              aBlock = v19;
              v22 = *(_BYTE *)(a1 + 48);
              dispatch_async(v18, v20);
              if (aBlock)
                _Block_release(aBlock);
              if (v17)
                _Block_release(v17);
            }
          }
        }
        os_unfair_lock_unlock(v10);
      }
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
}

void sub_21ABB7C68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN5waipc8timesync22ModernBasebandProvider11unmapBufferENS0_16BasebandProvider8bufferIdE_block_invoke_89(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

uint64_t waipc::timesync::ModernBasebandProvider::configureTransport(const os_unfair_lock *a1, uint64_t a2)
{
  os_unfair_lock_assert_owner(a1 + 28);
  *(_DWORD *)(a2 + 36) = 0;
  *(_DWORD *)(a2 + 40) = 0;
  return 1;
}

uint64_t waipc::timesync::ModernBasebandProvider::engageTransport(const os_unfair_lock *this)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_weak_owners;
  unint64_t v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  NSObject *Logger;
  const char *v9;
  NSObject *v10;
  uint8_t buf[8];
  std::__shared_weak_count *v13;
  _QWORD v14[6];
  std::__shared_weak_count *v15;

  os_unfair_lock_assert_owner(this + 28);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3802000000;
  v14[3] = __Block_byref_object_copy_;
  v14[4] = __Block_byref_object_dispose_;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(buf, &this[2]._os_unfair_lock_opaque);
  v2 = v13;
  v14[5] = *(_QWORD *)buf;
  v15 = v13;
  if (v13)
  {
    p_shared_weak_owners = (unint64_t *)&v13->__shared_weak_owners_;
    do
      v4 = __ldxr(p_shared_weak_owners);
    while (__stxr(v4 + 1, p_shared_weak_owners));
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v7 = TelephonyBasebandPCITransportRegisterTimeEvent();
  if ((v7 & 1) == 0)
  {
    Logger = waipc::logging::getLogger(2u);
    if (!os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v9 = "register time event failed";
    goto LABEL_18;
  }
  if ((TelephonyBasebandPCITransportRegisterTimeEvent() & 1) != 0)
  {
    BYTE1(this[29]._os_unfair_lock_opaque) = 1;
  }
  else
  {
    v10 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ABB3000, v10, OS_LOG_TYPE_INFO, "register host time event failed", buf, 2u);
    }
  }
  if ((TelephonyBasebandPCITransportRegisterTimeEvent() & 1) == 0)
  {
    Logger = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "register network time event failed";
LABEL_18:
      _os_log_impl(&dword_21ABB3000, Logger, OS_LOG_TYPE_INFO, v9, buf, 2u);
    }
  }
LABEL_19:
  _Block_object_dispose(v14, 8);
  if (v15)
    std::__shared_weak_count::__release_weak(v15);
  return v7;
}

void sub_21ABB7EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,std::__shared_weak_count *a24)
{
  _Block_object_dispose(&a18, 8);
  if (a24)
    std::__shared_weak_count::__release_weak(a24);
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync22ModernBasebandProvider15engageTransportEv_block_invoke(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  os_unfair_lock *v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(std::__shared_weak_count **)(v3 + 48);
  if (v4)
  {
    v6 = *(os_unfair_lock **)(a1 + 40);
    v7 = std::__shared_weak_count::lock(v4);
    if (v7)
    {
      v8 = v7;
      if (*(_QWORD *)(v3 + 40))
      {
        os_unfair_lock_lock(v6 + 28);
        waipc::timesync::ModernBasebandProvider::handleTimeEvent(v6, a2);
        os_unfair_lock_unlock(v6 + 28);
      }
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }
}

void sub_21ABB7FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  os_unfair_lock_s *v9;

  os_unfair_lock_unlock(v9);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void waipc::timesync::ModernBasebandProvider::handleTimeEvent(os_unfair_lock *a1, unsigned __int8 *a2)
{
  unint64_t v4;
  unsigned __int8 *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  NSObject *Logger;
  int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(a1 + 28);
  v5 = a2 + 1;
  v4 = (char)a2[1];
  if (v4 < 8 && ((0x8Fu >> v4) & 1) != 0)
  {
    v8 = qword_21ABCCBF0[v4];
    Logger = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG))
      waipc::timesync::ModernBasebandProvider::handleTimeEvent(a2, a2 + 1, Logger);
    v10 = *a2;
    if (v10 == 3)
    {
      v13 = *((unsigned int *)a2 + 1);
      v12 = *((_QWORD *)a2 + 1);
      v14 = 0;
      v15 = v12;
      waipc::timesync::BasebandProvider::handleTimesync<PCITransportTimesyncMeasurement *>((uint64_t)a1, 0, (int *)&v13, (int *)&v16);
    }
    else if (v10 == 1)
    {
      v11 = *((_DWORD *)a2 + 1);
      v14 = *((_QWORD *)a2 + 1);
      v13 = v11;
      v15 = v8;
      waipc::timesync::BasebandProvider::handleTimesync<waipc::timesync::BasebandProvider::deviceTimesyncMeasurement *>((uint64_t)a1, 1, &v13, (uint64_t)&v16);
    }
  }
  else
  {
    v6 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *v5;
      LODWORD(v13) = 67109120;
      HIDWORD(v13) = v7;
      _os_log_impl(&dword_21ABB3000, v6, OS_LOG_TYPE_INFO, "got invalid timestamp unit (%u)", (uint8_t *)&v13, 8u);
    }
    waipc::timesync::BasebandProvider::die(a1, CFSTR("timesync got invalid timestamp unit"));
  }
}

void waipc::timesync::BasebandProvider::handleTimesync<waipc::timesync::BasebandProvider::deviceTimesyncMeasurement *>(uint64_t a1, int a2, _DWORD *a3, uint64_t a4)
{
  uint64_t v8;
  char *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char *v16;
  _BYTE *v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v25;
  const void *v26;
  const void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  _QWORD v31[5];
  void *aBlock;
  __int128 v33;
  __int128 v34;
  void (*v35)(uint64_t);
  void *__p;
  void *v37;
  uint64_t v38;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 112));
  if (*(_DWORD *)(a1 + 256) != a2)
  {
    v8 = *(_QWORD *)(a1 + 232);
    v9 = (char *)v8;
    if (a3 != (_DWORD *)a4)
    {
      while (v9 != *(char **)(a1 + 240))
      {
        if (*a3 == *(_DWORD *)v9)
        {
          waipc::timesync::BasebandProvider::timesyncMeasurement::complete((uint64_t)v9, (uint64_t)a3);
          if (v9 != (char *)v8)
          {
            v10 = *(_OWORD *)v9;
            v11 = *((_OWORD *)v9 + 1);
            v35 = (void (*)(uint64_t))*((_QWORD *)v9 + 4);
            v33 = v10;
            v34 = v11;
            v12 = *(_OWORD *)v8;
            v13 = *(_OWORD *)(v8 + 16);
            *((_QWORD *)v9 + 4) = *(_QWORD *)(v8 + 32);
            *(_OWORD *)v9 = v12;
            *((_OWORD *)v9 + 1) = v13;
            v14 = v33;
            v15 = v34;
            *(_QWORD *)(v8 + 32) = v35;
            *(_OWORD *)v8 = v14;
            *(_OWORD *)(v8 + 16) = v15;
          }
          v8 += 40;
          v9 += 40;
          a3 += 6;
        }
        else if (*a3 - *(_DWORD *)v9 < 0)
        {
          a3 += 6;
        }
        else
        {
          v9 += 40;
        }
        if (a3 == (_DWORD *)a4)
        {
          a3 = (_DWORD *)a4;
          break;
        }
      }
    }
    if (!*(_BYTE *)(a1 + 116))
    {
      if (*(_QWORD *)(a1 + 56))
      {
        v26 = *(const void **)(a1 + 232);
        if ((const void *)v8 != v26)
        {
          *(_QWORD *)&v33 = 0;
          *((_QWORD *)&v33 + 1) = &v33;
          *(_QWORD *)&v34 = 0x4002000000;
          *((_QWORD *)&v34 + 1) = __Block_byref_object_copy__112;
          v35 = __Block_byref_object_dispose__113;
          v37 = 0;
          v38 = 0;
          __p = 0;
          std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__init_with_size[abi:ne180100]<std::__wrap_iter<waipc::timesync::BasebandProvider::timesyncMeasurement*>,std::__wrap_iter<waipc::timesync::BasebandProvider::timesyncMeasurement*>>(&__p, v26, v8, 0xCCCCCCCCCCCCCCCDLL * ((v8 - (uint64_t)v26) >> 3));
          waipc::timesync::BasebandProvider::logMeasurements(a1, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 40), *(char **)(*((_QWORD *)&v33 + 1) + 48));
          v27 = *(const void **)(a1 + 56);
          if (v27)
            v28 = _Block_copy(v27);
          else
            v28 = 0;
          v29 = *(NSObject **)(a1 + 24);
          v31[0] = MEMORY[0x24BDAC760];
          v31[1] = 1174405120;
          v31[2] = ___ZN5waipc8timesync16BasebandProvider14handleTimesyncIPNS1_25deviceTimesyncMeasurementEEEvNS1_16timesyncEndpointET_S6__block_invoke;
          v31[3] = &unk_24DDBC030;
          if (v28)
            v30 = _Block_copy(v28);
          else
            v30 = 0;
          v31[4] = &v33;
          aBlock = v30;
          dispatch_async(v29, v31);
          if (aBlock)
            _Block_release(aBlock);
          if (v28)
            _Block_release(v28);
          _Block_object_dispose(&v33, 8);
          if (__p)
          {
            v37 = __p;
            operator delete(__p);
          }
        }
      }
    }
    v16 = *(char **)(a1 + 232);
    if (v16 != v9)
    {
      v17 = *(_BYTE **)(a1 + 240);
      v18 = v17 - v9;
      if (v17 != v9)
        memmove(*(void **)(a1 + 232), v9, v17 - v9);
      *(_QWORD *)(a1 + 240) = &v16[v18];
    }
  }
  if (a3 != (_DWORD *)a4)
  {
    if (*(_DWORD *)(a1 + 256) == a2)
    {
      v19 = *(char **)(a1 + 240);
    }
    else
    {
      v19 = *(char **)(a1 + 232);
      if (v19 != *(char **)(a1 + 240))
        waipc::timesync::BasebandProvider::handleTimesync<PCITransportTimesyncMeasurement *>();
    }
    *(_DWORD *)(a1 + 256) = a2;
    std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__insert_with_size[abi:ne180100]<waipc::timesync::BasebandProvider::deviceTimesyncMeasurement *,waipc::timesync::BasebandProvider::deviceTimesyncMeasurement *>(a1 + 232, v19, (uint64_t)a3, a4, 0xAAAAAAAAAAAAAAABLL * ((a4 - (uint64_t)a3) >> 3));
  }
  v20 = (2 * *(_DWORD *)(a1 + 88));
  v22 = *(char **)(a1 + 232);
  v21 = *(char **)(a1 + 240);
  v23 = &v21[-40 * v20];
  if (0xCCCCCCCCCCCCCCCDLL * ((v21 - v22) >> 3) > v20 && v22 != v23)
  {
    v25 = 40 * v20;
    if (v21 != v23)
      memmove(*(void **)(a1 + 232), v23, 40 * v20);
    *(_QWORD *)(a1 + 240) = &v22[v25];
  }
}

void sub_21ABB8490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  _Block_object_dispose(&a15, 8);
  if (__p)
  {
    a21 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void waipc::timesync::LegacyBasebandProvider::subscribe(os_unfair_lock *a1, int a2, unsigned __int8 a3)
{
  os_unfair_lock_s *v6;

  v6 = a1 + 28;
  os_unfair_lock_lock(a1 + 28);
  if (a2)
    __assert_rtn("subscribe", "BasebandProvider.cpp", 870, "type == timestampId::kNetworkUplinkSchedule");
  waipc::timesync::LegacyBasebandProvider::sendSubscribeMessage(a1, a3);
  os_unfair_lock_unlock(v6);
}

void sub_21ABB8528(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::LegacyBasebandProvider::sendSubscribeMessage(os_unfair_lock *this, unsigned __int8 a2)
{
  uint64_t (*v4)(os_unfair_lock *);
  os_unfair_lock *v5;
  NSObject *Logger;
  NSObject *v7;
  __int16 v8;
  int v9;
  _WORD v10[2];
  uint8_t buf[16];

  os_unfair_lock_assert_owner(this + 28);
  v4 = *(uint64_t (**)(os_unfair_lock *))&this[46]._os_unfair_lock_opaque;
  if (v4 && (v5 = this + 32, (v4(this + 32) & 1) != 0))
  {
    v9 = 0;
    v10[0] = 1;
    v10[1] = a2 ^ 1;
    if (!*(_QWORD *)&v5->_os_unfair_lock_opaque
      || ((*(uint64_t (**)(os_unfair_lock *, _WORD *, uint64_t, int *, _QWORD, uint64_t, _QWORD))&v5->_os_unfair_lock_opaque)(this + 32, v10, 4, &v9, 0, 0xFFFFFFFFLL, 0) & 1) == 0)
    {
      Logger = waipc::logging::getLogger(2u);
      if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
      {
        v8 = 0;
        _os_log_impl(&dword_21ABB3000, Logger, OS_LOG_TYPE_INFO, "failed to send subscribe message", (uint8_t *)&v8, 2u);
      }
      waipc::timesync::BasebandProvider::die(this, CFSTR("timesync PCI write failed"));
    }
  }
  else
  {
    v7 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ABB3000, v7, OS_LOG_TYPE_INFO, "unable to send subscribe message because transport is not valid", buf, 2u);
    }
  }
}

uint64_t waipc::timesync::LegacyBasebandProvider::configureTransport(const os_unfair_lock *a1, uint64_t a2)
{
  os_unfair_lock_assert_owner(a1 + 28);
  *(_DWORD *)(a2 + 36) = a1[22]._os_unfair_lock_opaque + 1;
  *(_DWORD *)(a2 + 40) = 64;
  return 1;
}

void waipc::timesync::LegacyBasebandProvider::handleTransportRead(os_unfair_lock *this, char *a2, unsigned int a3)
{
  os_unfair_lock_assert_owner(this + 28);
  waipc::timesync::LegacyBasebandProvider::handleMessage(this, a2, a3);
}

void waipc::timesync::LegacyBasebandProvider::handleMessage(os_unfair_lock *this, char *a2, unint64_t a3)
{
  NSObject *v6;
  const __CFString *v7;
  NSObject *Logger;
  char v9;
  NSObject *v10;
  NSObject *v11;
  char v12;
  int v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(this + 28);
  if (a3 > 1)
  {
    if (*a2)
    {
      Logger = waipc::logging::getLogger(2u);
      if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
      {
        v9 = *a2;
        v13 = 16777472;
        LOBYTE(v14) = v9;
        _os_log_impl(&dword_21ABB3000, Logger, OS_LOG_TYPE_INFO, "got unrecognized message type (%hhu)", (uint8_t *)&v13, 5u);
      }
      v7 = CFSTR("timesync got unrecognized message type");
    }
    else if (a3 > 0xF)
    {
      if (a2[2] == 1)
      {
        waipc::timesync::LegacyBasebandProvider::handleUplinkScheduleUpdate(this, a2, a3);
        return;
      }
      if (!a2[2])
      {
        waipc::timesync::LegacyBasebandProvider::handleDeviceTimesyncMeasurement(this, (uint64_t)a2);
        return;
      }
      v11 = waipc::logging::getLogger(2u);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = a2[2];
        v13 = 16777472;
        LOBYTE(v14) = v12;
        _os_log_impl(&dword_21ABB3000, v11, OS_LOG_TYPE_INFO, "got unrecognized time event type (%hhu)", (uint8_t *)&v13, 5u);
      }
      v7 = CFSTR("timesync got unrecognized time event type");
    }
    else
    {
      v10 = waipc::logging::getLogger(2u);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v13 = 134217984;
        v14 = a3;
        _os_log_impl(&dword_21ABB3000, v10, OS_LOG_TYPE_INFO, "got undersized time event (%zu)", (uint8_t *)&v13, 0xCu);
      }
      v7 = CFSTR("timesync got undersized time event");
    }
  }
  else
  {
    v6 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v13 = 134217984;
      v14 = a3;
      _os_log_impl(&dword_21ABB3000, v6, OS_LOG_TYPE_INFO, "got undersized message header (%zu)", (uint8_t *)&v13, 0xCu);
    }
    v7 = CFSTR("timesync got undersized message header");
  }
  waipc::timesync::BasebandProvider::die(this, v7);
}

void waipc::timesync::LegacyBasebandProvider::handleDeviceTimesyncMeasurement(os_unfair_lock *a1, uint64_t a2)
{
  unint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  NSObject *Logger;
  char v9;
  uint64_t v10;
  unsigned int v11;
  NSObject *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(a1 + 28);
  v4 = *(char *)(a2 + 3);
  if (v4 >= 4)
  {
    Logger = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
    {
      v9 = *(_BYTE *)(a2 + 3);
      LODWORD(v13) = 16777472;
      BYTE4(v13) = v9;
      _os_log_impl(&dword_21ABB3000, Logger, OS_LOG_TYPE_INFO, "got invalid timestamp unit (%hhu)", (uint8_t *)&v13, 5u);
    }
    waipc::timesync::BasebandProvider::die(a1, CFSTR("timesync got invalid timestamp unit"));
  }
  else if ((unint64_t)(*(_QWORD *)(a2 + 8) + 1) > 1)
  {
    v10 = qword_21ABCCC30[v4];
    v11 = *(_DWORD *)(a2 + 4);
    *(_QWORD *)&v14 = *(_QWORD *)(a2 + 8);
    v13 = v11;
    *((_QWORD *)&v14 + 1) = v10;
    v12 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      waipc::timesync::LegacyBasebandProvider::handleDeviceTimesyncMeasurement();
    waipc::timesync::BasebandProvider::handleTimesync<waipc::timesync::BasebandProvider::deviceTimesyncMeasurement *>((uint64_t)a1, 1, &v13, (uint64_t)&v15);
  }
  else
  {
    v5 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_DWORD *)(a2 + 4);
      v7 = *(_QWORD *)(a2 + 8);
      LODWORD(v13) = 67109376;
      HIDWORD(v13) = v6;
      LOWORD(v14) = 2048;
      *(_QWORD *)((char *)&v14 + 2) = v7;
      _os_log_impl(&dword_21ABB3000, v5, OS_LOG_TYPE_INFO, "got invalid timesync measurement seq %u, payload %llu", (uint8_t *)&v13, 0x12u);
    }
  }
}

void waipc::timesync::LegacyBasebandProvider::handleUplinkScheduleUpdate(os_unfair_lock *this, _BYTE *a2, unint64_t a3)
{
  NSObject *Logger;
  NSObject *v7;
  const __CFString *v8;
  unint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  void *v14;
  NSObject *v15;
  char v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  void *aBlock;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint8_t buf[4];
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(this + 28);
  Logger = waipc::logging::getLogger(2u);
  v7 = Logger;
  if (a3 <= 0x17)
  {
    if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v25 = a3;
      _os_log_impl(&dword_21ABB3000, v7, OS_LOG_TYPE_INFO, "got undersized uplink schedule (%zu)", buf, 0xCu);
    }
    v8 = CFSTR("timesync got invalid uplink schedule");
LABEL_15:
    waipc::timesync::BasebandProvider::die(this, v8);
    return;
  }
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG))
    waipc::timesync::LegacyBasebandProvider::handleUplinkScheduleUpdate();
  v9 = (char)a2[3];
  if (v9 >= 4)
  {
    v15 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = a2[3];
      *(_DWORD *)buf = 16777472;
      LOBYTE(v25) = v16;
      _os_log_impl(&dword_21ABB3000, v15, OS_LOG_TYPE_INFO, "got invalid timestamp unit (%hhu)", buf, 5u);
    }
    v8 = CFSTR("timesync got invalid timestamp unit");
    goto LABEL_15;
  }
  if (!LOBYTE(this[29]._os_unfair_lock_opaque) && *(_QWORD *)&this[16]._os_unfair_lock_opaque)
  {
    v10 = *(double *)&qword_21ABCCC30[v9];
    v12 = *((_QWORD *)a2 + 1);
    v11 = *((_QWORD *)a2 + 2);
    waipc::timesync::BasebandProvider::logTimestamp((uint64_t)this, 0, v12, v11, v10);
    v13 = *(const void **)&this[16]._os_unfair_lock_opaque;
    if (v13)
      v14 = _Block_copy(v13);
    else
      v14 = 0;
    v17 = *(NSObject **)&this[6]._os_unfair_lock_opaque;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 1174405120;
    v19[2] = ___ZN5waipc8timesync22LegacyBasebandProvider26handleUplinkScheduleUpdateEPKvm_block_invoke;
    v19[3] = &__block_descriptor_tmp_109;
    if (v14)
      v18 = _Block_copy(v14);
    else
      v18 = 0;
    aBlock = v18;
    v21 = v12;
    v22 = v10;
    v23 = v11;
    dispatch_async(v17, v19);
    if (aBlock)
      _Block_release(aBlock);
    if (v14)
      _Block_release(v14);
  }
}

void sub_21ABB8CF8(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN5waipc8timesync22LegacyBasebandProvider26handleUplinkScheduleUpdateEPKvm_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(double *)(a1 + 48));
}

void *__copy_helper_block_e8_32c92_ZTSN10applesauce8dispatch2v15blockIFvN5waipc8timesync16BasebandProvider11timestampIdEydyEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c92_ZTSN10applesauce8dispatch2v15blockIFvN5waipc8timesync16BasebandProvider11timestampIdEydyEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

void waipc::timesync::ModernBasebandProvider::~ModernBasebandProvider(os_unfair_lock *this)
{
  waipc::timesync::BasebandProvider::~BasebandProvider(this);
  JUMPOUT(0x220752F74);
}

void waipc::timesync::LegacyBasebandProvider::~LegacyBasebandProvider(os_unfair_lock *this)
{
  waipc::timesync::BasebandProvider::~BasebandProvider(this);
  JUMPOUT(0x220752F74);
}

uint64_t waipc::timesync::BasebandProvider::config::config(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;

  v4 = *(NSObject **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  if (v4)
    dispatch_retain(v4);
  v5 = *(NSObject **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v5;
  if (v5)
    dispatch_retain(v5);
  v6 = *(void **)(a2 + 16);
  if (v6)
    v6 = _Block_copy(v6);
  *(_QWORD *)(a1 + 16) = v6;
  v7 = *(void **)(a2 + 24);
  if (v7)
    v7 = _Block_copy(v7);
  *(_QWORD *)(a1 + 24) = v7;
  v8 = *(void **)(a2 + 32);
  if (v8)
    v8 = _Block_copy(v8);
  *(_QWORD *)(a1 + 32) = v8;
  v9 = *(void **)(a2 + 40);
  if (v9)
    v9 = _Block_copy(v9);
  *(_QWORD *)(a1 + 40) = v9;
  v10 = *(void **)(a2 + 48);
  if (v10)
    v10 = _Block_copy(v10);
  *(_QWORD *)(a1 + 48) = v10;
  v11 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = v11;
  return a1;
}

void waipc::timesync::BasebandProvider::config::~config(waipc::timesync::BasebandProvider::config *this)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  NSObject *v7;

  v2 = (const void *)*((_QWORD *)this + 6);
  if (v2)
    _Block_release(v2);
  v3 = (const void *)*((_QWORD *)this + 5);
  if (v3)
    _Block_release(v3);
  v4 = (const void *)*((_QWORD *)this + 4);
  if (v4)
    _Block_release(v4);
  v5 = (const void *)*((_QWORD *)this + 3);
  if (v5)
    _Block_release(v5);
  v6 = (const void *)*((_QWORD *)this + 2);
  if (v6)
    _Block_release(v6);
  v7 = *((_QWORD *)this + 1);
  if (v7)
    dispatch_release(v7);
  if (*(_QWORD *)this)
    dispatch_release(*(dispatch_object_t *)this);
}

applesauce::CF::StringRef *applesauce::CF::StringRef::StringRef(applesauce::CF::StringRef *this, CFTypeRef cf)
{
  CFTypeID v3;
  void *exception;

  *(_QWORD *)this = cf;
  if (cf)
  {
    v3 = CFGetTypeID(cf);
    if (v3 != CFStringGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x220752F14](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
  }
  return this;
}

void sub_21ABB8F8C(_Unwind_Exception *a1)
{
  CFTypeRef *v1;
  void *v2;

  __cxa_free_exception(v2);
  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::construct_error(applesauce::CF *this)
{
  JUMPOUT(0x220752F14);
}

void std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24DDBB940, MEMORY[0x24BEDAAF0]);
}

void sub_21ABB901C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(40 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

char *std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__insert_with_size[abi:ne180100]<std::__wrap_iter<waipc::timesync::BasebandProvider::timesyncMeasurement const*>,std::__wrap_iter<waipc::timesync::BasebandProvider::timesyncMeasurement const*>>(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  char *v5;
  char *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  int64_t v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  __int128 v27;
  __int128 v28;
  char *v29;
  char *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  void *__p;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;

  v5 = (char *)__dst;
  if (a5 < 1)
    return v5;
  v7 = __src;
  v11 = *(_QWORD *)(a1 + 16);
  v9 = a1 + 16;
  v10 = v11;
  v12 = *(_QWORD *)(v9 - 8);
  if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v11 - v12) >> 3)) < a5)
  {
    v13 = *(void **)a1;
    v14 = a5 - 0x3333333333333333 * ((uint64_t)(v12 - *(_QWORD *)a1) >> 3);
    if (v14 > 0x666666666666666)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v15 = 0xCCCCCCCCCCCCCCCDLL * ((__dst - (uint64_t)v13) >> 3);
    v16 = 0xCCCCCCCCCCCCCCCDLL * ((v10 - (uint64_t)v13) >> 3);
    v17 = 2 * v16;
    if (2 * v16 <= v14)
      v17 = v14;
    if (v16 >= 0x333333333333333)
      v18 = 0x666666666666666;
    else
      v18 = v17;
    v39 = v9;
    if (v18)
      v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>>(v9, v18);
    else
      v19 = 0;
    v29 = &v19[40 * v15];
    __p = v19;
    v36 = v29;
    v38 = &v19[40 * v18];
    v30 = &v29[40 * a5];
    v31 = 40 * a5;
    do
    {
      v32 = *(_OWORD *)v7;
      v33 = *((_OWORD *)v7 + 1);
      *((_QWORD *)v29 + 4) = *((_QWORD *)v7 + 4);
      *(_OWORD *)v29 = v32;
      *((_OWORD *)v29 + 1) = v33;
      v29 += 40;
      v7 += 40;
      v31 -= 40;
    }
    while (v31);
    v37 = v30;
    v5 = (char *)std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v5);
    if (v37 != v36)
      v37 = &v36[(v37 - v36 - 40) % 0x28uLL];
    if (__p)
      operator delete(__p);
    return v5;
  }
  v20 = v12 - __dst;
  if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v12 - __dst) >> 3)) >= a5)
  {
    v21 = &__src[40 * a5];
    v23 = *(char **)(v9 - 8);
LABEL_17:
    v24 = &v5[40 * a5];
    v25 = &v23[-40 * a5];
    v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      v26 = v23;
      do
      {
        v27 = *(_OWORD *)v25;
        v28 = *((_OWORD *)v25 + 1);
        *((_QWORD *)v26 + 4) = *((_QWORD *)v25 + 4);
        *(_OWORD *)v26 = v27;
        *((_OWORD *)v26 + 1) = v28;
        v25 += 40;
        v26 += 40;
      }
      while ((unint64_t)v25 < v12);
    }
    *(_QWORD *)(a1 + 8) = v26;
    if (v23 != v24)
      memmove(&v5[40 * a5], v5, v23 - v24);
    if (v21 != v7)
      memmove(v5, v7, v21 - v7);
    return v5;
  }
  v21 = &__src[8 * ((uint64_t)(v12 - __dst) >> 3)];
  v22 = a4 - v21;
  if (a4 != v21)
    memmove(*(void **)(v9 - 8), &__src[8 * ((uint64_t)(v12 - __dst) >> 3)], a4 - v21);
  v23 = (char *)(v12 + v22);
  *(_QWORD *)(a1 + 8) = v12 + v22;
  if (v20 >= 1)
    goto LABEL_17;
  return v5;
}

void sub_21ABB9314(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void *std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  void *v5;
  char *v6;
  void *v7;
  char *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _BYTE *v12;
  uint64_t v13;
  int64_t v14;
  char *v15;
  void *v16;
  void *v17;

  v5 = *(void **)(a2 + 8);
  v6 = (char *)*a1;
  v7 = v5;
  if (*a1 != __src)
  {
    v8 = __src;
    v9 = *(_QWORD *)(a2 + 8);
    do
    {
      v10 = *(_OWORD *)(v8 - 40);
      v11 = *(_OWORD *)(v8 - 24);
      v7 = (void *)(v9 - 40);
      *(_QWORD *)(v9 - 8) = *((_QWORD *)v8 - 1);
      *(_OWORD *)(v9 - 24) = v11;
      *(_OWORD *)(v9 - 40) = v10;
      v8 -= 40;
      v9 -= 40;
    }
    while (v8 != v6);
  }
  *(_QWORD *)(a2 + 8) = v7;
  v12 = a1[1];
  v13 = *(_QWORD *)(a2 + 16);
  v14 = v12 - __src;
  if (v12 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v12 - __src);
    v7 = *(void **)(a2 + 8);
  }
  *(_QWORD *)(a2 + 16) = v13 + v14;
  v15 = (char *)*a1;
  *a1 = v7;
  *(_QWORD *)(a2 + 8) = v15;
  v16 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = v16;
  v17 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(_QWORD *)(a2 + 24) = v17;
  *(_QWORD *)a2 = *(_QWORD *)(a2 + 8);
  return v5;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

void std::__destroy_at[abi:ne180100]<applesauce::CF::DictionaryRef,0>(const void **a1)
{
  const void *v1;

  v1 = *a1;
  if (v1)
    CFRelease(v1);
}

uint64_t std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;
    std::__destroy_at[abi:ne180100]<applesauce::CF::DictionaryRef,0>((const void **)(i - 8));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

char ***std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>::operator=[abi:ne180100](char ***a1, _QWORD *a2)
{
  char **v4;
  char *v5;
  char **v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  _QWORD v24[2];
  char *v25;
  char *v26;
  uint64_t v27;

  v4 = *a1;
  v5 = (*a1)[1];
  v6 = *a1;
  v9 = (unint64_t)v6[2];
  v7 = (uint64_t)(v6 + 2);
  v8 = v9;
  if ((unint64_t)v5 >= v9)
  {
    v11 = *v4;
    v12 = (v5 - *v4) >> 3;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 61)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v14 = v8 - (_QWORD)v11;
    if (v14 >> 2 > v13)
      v13 = v14 >> 2;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8)
      v15 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v15 = v13;
    v27 = v7;
    if (v15)
    {
      v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(v7, v15);
      v11 = *v4;
      v5 = v4[1];
    }
    else
    {
      v16 = 0;
    }
    v17 = &v16[8 * v12];
    v18 = &v16[8 * v15];
    v26 = v18;
    *(_QWORD *)v17 = *a2;
    *a2 = 0;
    v25 = v17 + 8;
    if (v5 == v11)
    {
      v10 = v17 + 8;
    }
    else
    {
      do
      {
        v19 = *((_QWORD *)v5 - 1);
        v5 -= 8;
        *((_QWORD *)v17 - 1) = v19;
        v17 -= 8;
        *(_QWORD *)v5 = 0;
      }
      while (v5 != v11);
      v10 = v25;
      v18 = v26;
    }
    v20 = *v4;
    *v4 = v17;
    v24[0] = v20;
    v24[1] = v20;
    v21 = v4[1];
    v4[1] = v10;
    v25 = v21;
    v22 = v4[2];
    v4[2] = v18;
    v26 = v22;
    std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)v24);
  }
  else
  {
    *(_QWORD *)v5 = *a2;
    v10 = v5 + 8;
    *a2 = 0;
  }
  v4[1] = v10;
  return a1;
}

void std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  const void **v2;
  const void **v4;
  void *v5;

  v1 = *a1;
  v2 = (const void **)**a1;
  if (v2)
  {
    v4 = (const void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
        std::__destroy_at[abi:ne180100]<applesauce::CF::DictionaryRef,0>(--v4);
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

void std::allocate_shared[abi:ne180100]<waipc::timesync::LegacyBasebandProvider,std::allocator<waipc::timesync::LegacyBasebandProvider>,waipc::timesync::LegacyBasebandProvider,void>(const waipc::timesync::BasebandProvider *a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;

  v4 = operator new(0x150uLL);
  std::__shared_ptr_emplace<waipc::timesync::LegacyBasebandProvider>::__shared_ptr_emplace[abi:ne180100]<waipc::timesync::LegacyBasebandProvider,std::allocator<waipc::timesync::LegacyBasebandProvider>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  std::shared_ptr<waipc::timesync::LegacyBasebandProvider>::__enable_weak_this[abi:ne180100]<waipc::timesync::BasebandProvider,waipc::timesync::LegacyBasebandProvider,void>((uint64_t)a2, v4 + 4, (uint64_t)(v4 + 3));
}

void sub_21ABB972C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<waipc::timesync::LegacyBasebandProvider>::__shared_ptr_emplace[abi:ne180100]<waipc::timesync::LegacyBasebandProvider,std::allocator<waipc::timesync::LegacyBasebandProvider>,0>(_QWORD *a1, const waipc::timesync::BasebandProvider *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_24DDBBF60;
  waipc::timesync::BasebandProvider::BasebandProvider((waipc::timesync::BasebandProvider *)(a1 + 3), a2);
  a1[3] = &off_24DDBBEF8;
  return a1;
}

void sub_21ABB9780(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<waipc::timesync::LegacyBasebandProvider>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDBBF60;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<waipc::timesync::LegacyBasebandProvider>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDBBF60;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x220752F74);
}

uint64_t std::__shared_ptr_emplace<waipc::timesync::LegacyBasebandProvider>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

waipc::timesync::BasebandProvider *waipc::timesync::BasebandProvider::BasebandProvider(waipc::timesync::BasebandProvider *this, const waipc::timesync::BasebandProvider *a2)
{
  int v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = &off_24DDBBC08;
  waipc::timesync::BasebandProvider::config::config((uint64_t)this + 24, (uint64_t)a2 + 24);
  v4 = *((_DWORD *)a2 + 28);
  *((_WORD *)this + 58) = *((_WORD *)a2 + 58);
  *((_DWORD *)this + 28) = v4;
  v5 = *((_QWORD *)a2 + 15);
  if (v5)
    CFRetain(*((CFTypeRef *)a2 + 15));
  *((_QWORD *)this + 15) = v5;
  v6 = *((_OWORD *)a2 + 12);
  v7 = *((_OWORD *)a2 + 13);
  v8 = *((_QWORD *)a2 + 28);
  v9 = *((_OWORD *)a2 + 8);
  v10 = *((_OWORD *)a2 + 9);
  v12 = *((_OWORD *)a2 + 10);
  v11 = *((_OWORD *)a2 + 11);
  *((_QWORD *)this + 29) = 0;
  *((_OWORD *)this + 10) = v12;
  *((_OWORD *)this + 9) = v10;
  *((_OWORD *)this + 8) = v9;
  *((_QWORD *)this + 28) = v8;
  *((_OWORD *)this + 13) = v7;
  *((_OWORD *)this + 12) = v6;
  *((_OWORD *)this + 11) = v11;
  *((_QWORD *)this + 30) = 0;
  *((_QWORD *)this + 31) = 0;
  std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__init_with_size[abi:ne180100]<waipc::timesync::BasebandProvider::timesyncMeasurement*,waipc::timesync::BasebandProvider::timesyncMeasurement*>((_QWORD *)this + 29, *((const void **)a2 + 29), *((_QWORD *)a2 + 30), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)a2 + 30) - *((_QWORD *)a2 + 29)) >> 3));
  *((_DWORD *)this + 64) = *((_DWORD *)a2 + 64);
  *((_QWORD *)this + 34) = 0;
  *((_QWORD *)this + 35) = 0;
  *((_QWORD *)this + 33) = 0;
  std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__init_with_size[abi:ne180100]<waipc::timesync::BasebandProvider::timesyncMeasurement*,waipc::timesync::BasebandProvider::timesyncMeasurement*>((_QWORD *)this + 33, *((const void **)a2 + 33), *((_QWORD *)a2 + 34), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)a2 + 34) - *((_QWORD *)a2 + 33)) >> 3));
  *((_QWORD *)this + 36) = 0;
  *((_QWORD *)this + 37) = 0;
  *((_QWORD *)this + 38) = 0;
  std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__init_with_size[abi:ne180100]<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>*,std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>*>((char *)this + 288, *((__int128 **)a2 + 36), *((__int128 **)a2 + 37), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)a2 + 37) - *((_QWORD *)a2 + 36)) >> 3));
  return this;
}

void sub_21ABB990C(_Unwind_Exception *a1)
{
  uint64_t v1;
  waipc::timesync::BasebandProvider::config *v2;
  void **v3;
  void **v4;
  void *v6;
  void *v7;
  std::__shared_weak_count *v8;

  v6 = *v4;
  if (*v4)
  {
    *(_QWORD *)(v1 + 272) = v6;
    operator delete(v6);
  }
  v7 = *v3;
  if (*v3)
  {
    *(_QWORD *)(v1 + 240) = v7;
    operator delete(v7);
  }
  applesauce::CF::StringRef::~StringRef((const void **)(v1 + 120));
  waipc::timesync::BasebandProvider::config::~config(v2);
  v8 = *(std::__shared_weak_count **)(v1 + 16);
  if (v8)
    std::__shared_weak_count::__release_weak(v8);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__init_with_size[abi:ne180100]<waipc::timesync::BasebandProvider::timesyncMeasurement*,waipc::timesync::BasebandProvider::timesyncMeasurement*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21ABB99C8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x666666666666667)
    std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[40 * v4];
  return result;
}

char *std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__init_with_size[abi:ne180100]<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>*,std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>*>(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  if (a4)
  {
    v6 = result;
    result = std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__vallocate[abi:ne180100](result, a4);
    v7 = *((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2;
      v9 = a2[1];
      *(_QWORD *)(v7 + 32) = *((_QWORD *)a2 + 4);
      *(_OWORD *)v7 = v8;
      *(_OWORD *)(v7 + 16) = v9;
      a2 = (__int128 *)((char *)a2 + 40);
      v7 += 40;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_21ABB9A98(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::shared_ptr<waipc::timesync::LegacyBasebandProvider>::__enable_weak_this[abi:ne180100]<waipc::timesync::BasebandProvider,waipc::timesync::LegacyBasebandProvider,void>(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;

  if (a2)
  {
    v4 = (std::__shared_weak_count *)a2[1];
    if (!v4 || v4->__shared_owners_ == -1)
    {
      v5 = *(std::__shared_weak_count **)(a1 + 8);
      if (v5)
      {
        p_shared_owners = (unint64_t *)&v5->__shared_owners_;
        do
          v7 = __ldxr(p_shared_owners);
        while (__stxr(v7 + 1, p_shared_owners));
        p_shared_weak_owners = (unint64_t *)&v5->__shared_weak_owners_;
        do
          v9 = __ldxr(p_shared_weak_owners);
        while (__stxr(v9 + 1, p_shared_weak_owners));
        v4 = (std::__shared_weak_count *)a2[1];
      }
      *a2 = a3;
      a2[1] = v5;
      if (v4)
        std::__shared_weak_count::__release_weak(v4);
      if (v5)
      {
        v10 = (unint64_t *)&v5->__shared_owners_;
        do
          v11 = __ldaxr(v10);
        while (__stlxr(v11 - 1, v10));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
      }
    }
  }
}

void std::allocate_shared[abi:ne180100]<waipc::timesync::ModernBasebandProvider,std::allocator<waipc::timesync::ModernBasebandProvider>,waipc::timesync::ModernBasebandProvider,void>(const waipc::timesync::BasebandProvider *a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;

  v4 = operator new(0x150uLL);
  std::__shared_ptr_emplace<waipc::timesync::ModernBasebandProvider>::__shared_ptr_emplace[abi:ne180100]<waipc::timesync::ModernBasebandProvider,std::allocator<waipc::timesync::ModernBasebandProvider>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  std::shared_ptr<waipc::timesync::LegacyBasebandProvider>::__enable_weak_this[abi:ne180100]<waipc::timesync::BasebandProvider,waipc::timesync::LegacyBasebandProvider,void>((uint64_t)a2, v4 + 4, (uint64_t)(v4 + 3));
}

void sub_21ABB9BB0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<waipc::timesync::ModernBasebandProvider>::__shared_ptr_emplace[abi:ne180100]<waipc::timesync::ModernBasebandProvider,std::allocator<waipc::timesync::ModernBasebandProvider>,0>(_QWORD *a1, const waipc::timesync::BasebandProvider *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_24DDBBFB0;
  waipc::timesync::BasebandProvider::BasebandProvider((waipc::timesync::BasebandProvider *)(a1 + 3), a2);
  a1[3] = &off_24DDBBE58;
  return a1;
}

void sub_21ABB9C04(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<waipc::timesync::ModernBasebandProvider>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDBBFB0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<waipc::timesync::ModernBasebandProvider>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDBBFB0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x220752F74);
}

uint64_t std::__shared_ptr_emplace<waipc::timesync::ModernBasebandProvider>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

_QWORD *std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(_QWORD *a1, _QWORD *a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;

  v3 = (std::__shared_weak_count *)a2[1];
  *a1 = *a2;
  if (!v3)
  {
    a1[1] = 0;
LABEL_5:
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  v4 = std::__shared_weak_count::lock(v3);
  a1[1] = v4;
  if (!v4)
    goto LABEL_5;
  return a1;
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB808] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB6D8], MEMORY[0x24BEDAC00]);
}

uint64_t waipc::timesync::BasebandProvider::timesyncMeasurement::complete(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (*(_DWORD *)result != *(_DWORD *)a2)
    waipc::timesync::BasebandProvider::timesyncMeasurement::complete();
  v2 = *(unsigned int *)(a2 + 4);
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(result + 16) = v2;
  return result;
}

__n128 __Block_byref_object_copy__112(_QWORD *a1, uint64_t a2)
{
  __n128 result;

  a1[5] = 0;
  a1[6] = 0;
  a1[7] = 0;
  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 5) = result;
  a1[7] = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  return result;
}

void __Block_byref_object_dispose__113(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(_QWORD *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

uint64_t ___ZN5waipc8timesync16BasebandProvider14handleTimesyncIP31PCITransportTimesyncMeasurementEEvNS1_16timesyncEndpointET_S6__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void *__copy_helper_block_e8_40c99_ZTSN10applesauce8dispatch2v15blockIFvPN5waipc8timesync16BasebandProvider19timesyncMeasurementEmEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 40);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c99_ZTSN10applesauce8dispatch2v15blockIFvPN5waipc8timesync16BasebandProvider19timesyncMeasurementEmEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 40);
  if (v1)
    _Block_release(v1);
}

_QWORD *std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__init_with_size[abi:ne180100]<std::__wrap_iter<waipc::timesync::BasebandProvider::timesyncMeasurement*>,std::__wrap_iter<waipc::timesync::BasebandProvider::timesyncMeasurement*>>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21ABB9E1C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__insert_with_size[abi:ne180100]<PCITransportTimesyncMeasurement *,PCITransportTimesyncMeasurement *>(uint64_t a1, char *__src, int *a3, int *a4, uint64_t a5)
{
  char *v5;
  int *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  int *v19;
  char *v20;
  int *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  char *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  char *v32;
  char *v33;
  void *__p;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;

  v5 = __src;
  if (a5 < 1)
    return v5;
  v7 = a3;
  v11 = *(_QWORD *)(a1 + 16);
  v9 = a1 + 16;
  v10 = v11;
  v12 = *(_QWORD *)(v9 - 8);
  if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v11 - v12) >> 3)) < a5)
  {
    v13 = *(_BYTE **)a1;
    v14 = a5 - 0x3333333333333333 * ((uint64_t)(v12 - *(_QWORD *)a1) >> 3);
    if (v14 > 0x666666666666666)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v15 = 0xCCCCCCCCCCCCCCCDLL * ((__src - v13) >> 3);
    v16 = 0xCCCCCCCCCCCCCCCDLL * ((v10 - (uint64_t)v13) >> 3);
    if (2 * v16 > v14)
      v14 = 2 * v16;
    if (v16 >= 0x333333333333333)
      v17 = 0x666666666666666;
    else
      v17 = v14;
    v39 = v9;
    if (v17)
      v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>>(v9, v17);
    else
      v18 = 0;
    v32 = &v18[40 * v15];
    __p = v18;
    v36 = v32;
    v38 = &v18[40 * v17];
    v33 = &v32[40 * a5];
    do
    {
      *(_DWORD *)v32 = *v7;
      *((_QWORD *)v32 + 1) = *((_QWORD *)v7 + 2);
      *((_QWORD *)v32 + 2) = v7[1];
      v32 += 40;
      v7 += 6;
    }
    while (v32 != v33);
    v37 = v33;
    v5 = (char *)std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v5);
    if (v37 != v36)
      v37 = &v36[(v37 - v36 - 40) % 0x28uLL];
    if (__p)
      operator delete(__p);
    return v5;
  }
  if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v12 - (_QWORD)__src) >> 3)) >= a5)
  {
    v19 = &a3[6 * a5];
    v20 = *(char **)(v9 - 8);
LABEL_18:
    v23 = &__src[40 * a5];
    v24 = &v20[-40 * a5];
    v25 = v20;
    if ((unint64_t)v24 < v12)
    {
      v25 = v20;
      do
      {
        v26 = *(_OWORD *)v24;
        v27 = *((_OWORD *)v24 + 1);
        *((_QWORD *)v25 + 4) = *((_QWORD *)v24 + 4);
        *(_OWORD *)v25 = v26;
        *((_OWORD *)v25 + 1) = v27;
        v24 += 40;
        v25 += 40;
      }
      while ((unint64_t)v24 < v12);
    }
    *(_QWORD *)(a1 + 8) = v25;
    if (v20 != v23)
      memmove(&__src[40 * a5], __src, v20 - v23);
    if (v19 != v7)
    {
      v28 = v5;
      do
      {
        v29 = *((_QWORD *)v7 + 2);
        v30 = *v7;
        v31 = v7[1];
        v7 += 6;
        *(_DWORD *)v28 = v30;
        *((_QWORD *)v28 + 1) = v29;
        *((_QWORD *)v28 + 2) = v31;
        v28 += 40;
      }
      while (v7 != v19);
    }
    return v5;
  }
  v19 = &a3[0xCCCCCCCCCCCCCCELL * ((uint64_t)(v12 - (_QWORD)__src) >> 3)];
  v20 = *(char **)(v9 - 8);
  if (v19 != a4)
  {
    v21 = &a3[0xCCCCCCCCCCCCCCELL * ((uint64_t)(v12 - (_QWORD)__src) >> 3)];
    v22 = *(_QWORD *)(v9 - 8);
    do
    {
      *(_DWORD *)v22 = *v21;
      *(_QWORD *)(v22 + 8) = *((_QWORD *)v21 + 2);
      *(_QWORD *)(v22 + 16) = v21[1];
      v20 += 40;
      v21 += 6;
      v22 += 40;
    }
    while (v21 != a4);
  }
  *(_QWORD *)(a1 + 8) = v20;
  if ((uint64_t)(v12 - (_QWORD)__src) >= 1)
    goto LABEL_18;
  return v5;
}

void sub_21ABBA0B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *waipc::util::_kv::_kv<unsigned int const&,void>(_QWORD *a1, uint64_t a2, int *a3)
{
  CFNumberRef v4;
  void *exception;
  int valuePtr;

  *a1 = a2;
  valuePtr = *a3;
  v4 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x220752F14](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_21ABBA188(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  const void *v3;

  v3 = *(const void **)(v1 + 8);
  if (v3)
    CFRelease(v3);
  _Unwind_Resume(exception_object);
}

_QWORD *waipc::util::_kv::_kv<unsigned char,void>(_QWORD *a1, uint64_t a2, char *a3)
{
  CFNumberRef v4;
  void *exception;
  char valuePtr;

  *a1 = a2;
  valuePtr = *a3;
  v4 = CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x220752F14](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_21ABBA23C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  const void *v3;

  v3 = *(const void **)(v1 + 8);
  if (v3)
    CFRelease(v3);
  _Unwind_Resume(exception_object);
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>(uint64_t **a1)
{
  uint64_t *v2;
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;
  CFArrayRef CFArray;
  void *__p[3];

  std::vector<void const*>::vector(__p, a1[1] - *a1);
  v2 = *a1;
  v3 = a1[1];
  if (*a1 != v3)
  {
    v4 = __p[0];
    do
    {
      v5 = *v2++;
      *v4++ = v5;
    }
    while (v2 != v3);
  }
  CFArray = applesauce::CF::details::make_CFArrayRef<void const*>((uint64_t)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return CFArray;
}

void sub_21ABBA2E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<void const*>(uint64_t a1)
{
  CFArrayRef result;
  applesauce::CF *exception;

  result = CFArrayCreate(0, *(const void ***)a1, (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3, MEMORY[0x24BDBD690]);
  if (!result)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  return result;
}

void sub_21ABBA348()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_21ABBA360(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<void const*>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<void const*>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_21ABBA3CC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<void const*>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

double waipc::timesync::BasebandProvider::timesyncMeasurement::complete(uint64_t a1, uint64_t a2)
{
  double result;

  if (*(_DWORD *)a1 != *(_DWORD *)a2)
    waipc::timesync::BasebandProvider::timesyncMeasurement::complete();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 8);
  result = *(double *)(a2 + 16);
  *(double *)(a1 + 32) = result;
  return result;
}

uint64_t ___ZN5waipc8timesync16BasebandProvider14handleTimesyncIPNS1_25deviceTimesyncMeasurementEEEvNS1_16timesyncEndpointET_S6__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

char *std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__insert_with_size[abi:ne180100]<waipc::timesync::BasebandProvider::deviceTimesyncMeasurement *,waipc::timesync::BasebandProvider::deviceTimesyncMeasurement *>(uint64_t a1, char *__src, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  void *__p;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;

  v5 = __src;
  if (a5 < 1)
    return v5;
  v7 = a3;
  v11 = *(_QWORD *)(a1 + 16);
  v9 = a1 + 16;
  v10 = v11;
  v12 = *(_QWORD *)(v9 - 8);
  if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v11 - v12) >> 3)) < a5)
  {
    v13 = *(_BYTE **)a1;
    v14 = a5 - 0x3333333333333333 * ((uint64_t)(v12 - *(_QWORD *)a1) >> 3);
    if (v14 > 0x666666666666666)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v15 = 0xCCCCCCCCCCCCCCCDLL * ((__src - v13) >> 3);
    v16 = 0xCCCCCCCCCCCCCCCDLL * ((v10 - (uint64_t)v13) >> 3);
    if (2 * v16 > v14)
      v14 = 2 * v16;
    if (v16 >= 0x333333333333333)
      v17 = 0x666666666666666;
    else
      v17 = v14;
    v38 = v9;
    if (v17)
      v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>>(v9, v17);
    else
      v18 = 0;
    v31 = &v18[40 * v15];
    __p = v18;
    v35 = v31;
    v37 = &v18[40 * v17];
    v32 = &v31[40 * a5];
    do
    {
      *(_DWORD *)v31 = *(_DWORD *)v7;
      *((_QWORD *)v31 + 3) = *(_QWORD *)(v7 + 8);
      *((_QWORD *)v31 + 4) = *(_QWORD *)(v7 + 16);
      v31 += 40;
      v7 += 24;
    }
    while (v31 != v32);
    v36 = v32;
    v5 = (char *)std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v5);
    if (v36 != v35)
      v36 = &v35[(v36 - v35 - 40) % 0x28uLL];
    if (__p)
      operator delete(__p);
    return v5;
  }
  if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v12 - (_QWORD)__src) >> 3)) >= a5)
  {
    v19 = a3 + 24 * a5;
    v20 = *(char **)(v9 - 8);
LABEL_18:
    v23 = &__src[40 * a5];
    v24 = &v20[-40 * a5];
    v25 = v20;
    if ((unint64_t)v24 < v12)
    {
      v25 = v20;
      do
      {
        v26 = *(_OWORD *)v24;
        v27 = *((_OWORD *)v24 + 1);
        *((_QWORD *)v25 + 4) = *((_QWORD *)v24 + 4);
        *(_OWORD *)v25 = v26;
        *((_OWORD *)v25 + 1) = v27;
        v24 += 40;
        v25 += 40;
      }
      while ((unint64_t)v24 < v12);
    }
    *(_QWORD *)(a1 + 8) = v25;
    if (v20 != v23)
      memmove(&__src[40 * a5], __src, v20 - v23);
    if (v19 != v7)
    {
      v28 = v5;
      do
      {
        v29 = *(_QWORD *)(v7 + 8);
        v30 = *(_QWORD *)(v7 + 16);
        *(_DWORD *)v28 = *(_DWORD *)v7;
        *((_QWORD *)v28 + 3) = v29;
        *((_QWORD *)v28 + 4) = v30;
        v7 += 24;
        v28 += 40;
      }
      while (v7 != v19);
    }
    return v5;
  }
  v19 = a3 + 0x3333333333333338 * ((uint64_t)(v12 - (_QWORD)__src) >> 3);
  v20 = *(char **)(v9 - 8);
  if (v19 != a4)
  {
    v21 = a3 + 0x3333333333333338 * ((uint64_t)(v12 - (_QWORD)__src) >> 3);
    v22 = *(_QWORD *)(v9 - 8);
    do
    {
      *(_DWORD *)v22 = *(_DWORD *)v21;
      *(_QWORD *)(v22 + 24) = *(_QWORD *)(v21 + 8);
      *(_QWORD *)(v22 + 32) = *(_QWORD *)(v21 + 16);
      v20 += 40;
      v21 += 24;
      v22 += 40;
    }
    while (v21 != a4);
  }
  *(_QWORD *)(a1 + 8) = v20;
  if ((uint64_t)(v12 - (_QWORD)__src) >= 1)
    goto LABEL_18;
  return v5;
}

void sub_21ABBA70C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0xBu);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x12u);
}

uint64_t waipc::logging::getLogger(unsigned int a1)
{
  if (waipc::logging::getLogger(waipc::logging::LoggerID)::sOnce != -1)
    dispatch_once(&waipc::logging::getLogger(waipc::logging::LoggerID)::sOnce, &__block_literal_global);
  if (a1 > 5)
    return MEMORY[0x24BDACB78];
  else
    return waipc::logging::getLogger(waipc::logging::LoggerID)::sLoggers[a1];
}

os_log_t ___ZN5waipc7logging9getLoggerENS0_8LoggerIDE_block_invoke()
{
  uint64_t i;
  os_log_t result;

  for (i = 0; i != 6; ++i)
  {
    result = os_log_create("com.apple.WirelessIPC.audio", kWAIPCLogCategories[i]);
    waipc::logging::getLogger(waipc::logging::LoggerID)::sLoggers[i] = (uint64_t)result;
  }
  return result;
}

BOOL waipc::logging::EnableCache::init(waipc::logging::EnableCache *this)
{
  uint64_t v2;
  BOOL v3;
  _BOOL8 result;

  v2 = 0;
  v3 = waipc::logging::getLogger(waipc::logging::LoggerID)::sOnce == -1;
  do
  {
    if (!v3)
      dispatch_once(&waipc::logging::getLogger(waipc::logging::LoggerID)::sOnce, &__block_literal_global);
    result = os_signpost_enabled((os_log_t)waipc::logging::getLogger(waipc::logging::LoggerID)::sLoggers[v2]);
    *((_BYTE *)this + v2++) = result;
    v3 = 1;
  }
  while (v2 != 6);
  return result;
}

waipc::FlatCircularBuffer *waipc::FlatCircularBuffer::FlatCircularBuffer(waipc::FlatCircularBuffer *this, size_t a2)
{
  void *v4;

  if (a2)
  {
    v4 = (void *)operator new[]();
    bzero(v4, a2);
  }
  else
  {
    v4 = 0;
  }
  *(_QWORD *)this = v4;
  *((_QWORD *)this + 1) = a2;
  return this;
}

void **waipc::FlatCircularBuffer::write(void **this, char *a2, unint64_t a3, size_t a4)
{
  void **v5;
  size_t v6;
  size_t v8;
  size_t v9;
  size_t v10;

  if (a4)
  {
    v5 = this;
    v6 = (size_t)this[1];
    if (v6 < a4)
      waipc::FlatCircularBuffer::write();
    v8 = a3 % v6;
    v9 = v6 - a3 % v6;
    if (v9 >= a4)
      v10 = a4;
    else
      v10 = v9;
    memcpy((char *)*this + v8, a2, v10);
    return (void **)memcpy(*v5, &a2[v10], a4 - v10);
  }
  return this;
}

const void **waipc::FlatCircularBuffer::read(const void **this, char *__dst, unint64_t a3, size_t a4)
{
  const void **v5;
  size_t v6;
  size_t v8;
  size_t v9;
  size_t v10;

  if (a4)
  {
    v5 = this;
    v6 = (size_t)this[1];
    if (v6 < a4)
      waipc::FlatCircularBuffer::read();
    v8 = a3 % v6;
    v9 = v6 - a3 % v6;
    if (v9 >= a4)
      v10 = a4;
    else
      v10 = v9;
    memcpy(__dst, (char *)*this + v8, v10);
    return (const void **)memcpy(&__dst[v10], *v5, a4 - v10);
  }
  return this;
}

void waipc::FlatCircularBuffer::set(waipc::FlatCircularBuffer *this, char a2, unint64_t a3, size_t a4)
{
  size_t v6;
  size_t v7;
  size_t v8;
  size_t v9;

  if (a4)
  {
    v6 = *((_QWORD *)this + 1);
    if (v6 < a4)
      waipc::FlatCircularBuffer::set();
    v7 = a3 % v6;
    v8 = v6 - a3 % v6;
    if (v8 >= a4)
      v9 = a4;
    else
      v9 = v8;
    bzero((void *)(*(_QWORD *)this + v7), v9);
    bzero(*(void **)this, a4 - v9);
  }
}

uint64_t waipc::PCIeAudioLink::computeBufferLayout@<X0>(uint64_t result@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(unsigned __int16 *)(result + 8) * (unint64_t)*(unsigned __int16 *)(result + 10) + 24;
  v3 = v2 * *(unsigned int *)(result + 12);
  v4 = v2 * *(unsigned int *)(result + 16);
  if (*(_BYTE *)(result + 64))
  {
    v5 = ~*MEMORY[0x24BDB03B8];
    v6 = v5 & (*MEMORY[0x24BDB03B8] + 40);
    v3 = v5 & (*MEMORY[0x24BDB03B8] + v3);
    v4 = v5 & (*MEMORY[0x24BDB03B8] + v4);
  }
  else
  {
    v6 = 40;
  }
  *a2 = v2;
  a2[1] = 0;
  a2[2] = v6;
  a2[3] = v6;
  a2[4] = v3;
  a2[5] = v3 + v6;
  a2[6] = v4;
  a2[7] = v3 + v6 + v4;
  return result;
}

uint64_t waipc::PCIeAudioLink::computeBufferLength(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  waipc::PCIeAudioLink::computeBufferLayout(a1, (unint64_t *)&v16);
  v4 = *MEMORY[0x24BDB03B8];
  v5 = ~*MEMORY[0x24BDB03B8];
  v6 = v5;
  if (!*(_BYTE *)(a1 + 64))
  {
    v14 = 0;
    v12 = 0;
    v11 = 0;
    v13 = 0;
    v10 = 0;
    v9 = 0;
    v7 = 0;
    v8 = v5 & (unint64_t)(v4 + *((_QWORD *)&v19 + 1));
    if (!a2)
      return *((_QWORD *)&v19 + 1);
    goto LABEL_9;
  }
  v7 = *((_QWORD *)&v16 + 1);
  if ((*((_QWORD *)&v16 + 1) & ~(uint64_t)v5) != 0)
    waipc::PCIeAudioLink::computeBufferLength();
  v8 = v17;
  if ((((_QWORD)v17 + v4) & v6) != (_QWORD)v17)
    waipc::PCIeAudioLink::computeBufferLength();
  v9 = *((_QWORD *)&v17 + 1);
  if ((*((_QWORD *)&v17 + 1) & ~v6) != 0)
    waipc::PCIeAudioLink::computeBufferLength();
  v10 = v18;
  if ((((_QWORD)v18 + v4) & v6) != (_QWORD)v18)
    waipc::PCIeAudioLink::computeBufferLength();
  v11 = *((_QWORD *)&v18 + 1);
  if ((*((_QWORD *)&v18 + 1) & ~v6) != 0)
    waipc::PCIeAudioLink::computeBufferLength();
  v12 = v19;
  if ((((_QWORD)v19 + v4) & v6) != (_QWORD)v19)
    waipc::PCIeAudioLink::computeBufferLength();
  v13 = 2;
  v14 = 1;
  if (a2)
  {
LABEL_9:
    *(_QWORD *)a2 = v7;
    *(_QWORD *)(a2 + 8) = v8;
    *(_QWORD *)(a2 + 16) = 3;
    *(_QWORD *)(a2 + 24) = v9;
    *(_QWORD *)(a2 + 32) = v10;
    *(_DWORD *)(a2 + 40) = v13;
    *(_DWORD *)(a2 + 44) = 0;
    *(_QWORD *)(a2 + 48) = v11;
    *(_QWORD *)(a2 + 56) = v12;
    *(_DWORD *)(a2 + 64) = v14;
    *(_DWORD *)(a2 + 68) = 0;
  }
  return *((_QWORD *)&v19 + 1);
}

uint64_t waipc::PCIeAudioLink::PCIeAudioLink(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  os_unfair_lock_s *v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  _OWORD *v13;
  const double *v14;
  float64x2_t v15;
  int8x16_t v16;
  _OWORD *v17;
  NSObject *Logger;
  NSObject *v19;
  os_signpost_id_t v20;
  os_signpost_id_t v21;
  unint64_t v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  size_t v32;
  __int128 v33;
  __int128 v34;
  size_t v35;
  void *v36;
  uint64_t v37;
  size_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t i;
  NSObject *v46;
  NSObject *v47;
  os_signpost_id_t v48;
  os_signpost_id_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  os_signpost_id_t v54;
  os_signpost_id_t v55;
  const char *v57;
  int v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[16];
  __int128 v63;
  __int128 v64;
  __int128 v65;

  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  v6 = *(_OWORD *)(a2 + 32);
  v7 = *(_OWORD *)(a2 + 48);
  v8 = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 64) = v8;
  *(_OWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 96) = *a3;
  *(_DWORD *)(a1 + 88) = 0;
  v9 = (os_unfair_lock_s *)(a1 + 88);
  *(_DWORD *)(a1 + 92) = 0;
  v10 = a3[1];
  *(_QWORD *)(a1 + 104) = v10;
  if (v10)
  {
    v11 = (unint64_t *)(v10 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  *(_OWORD *)(a1 + 144) = 0u;
  v13 = (_OWORD *)(a1 + 144);
  *(_QWORD *)(a1 + 112) = a4;
  v14 = (const double *)(a1 + 72);
  v15 = vld1q_dup_f64(v14);
  v16 = (int8x16_t)vcvtq_u64_f64(vdivq_f64(vmulq_f64(*(float64x2_t *)(a1 + 40), (float64x2_t)vdupq_n_s64(0x41CDCD6500000000uLL)), v15));
  *(int8x16_t *)(a1 + 120) = vextq_s8(v16, v16, 8uLL);
  *(_QWORD *)(a1 + 136) = (unint64_t)(*(double *)(a1 + 56) * 1000000000.0 / *(double *)(a1 + 80));
  *(_OWORD *)(a1 + 192) = 0u;
  v17 = (_OWORD *)(a1 + 192);
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_QWORD *)(a1 + 320) = mach_continuous_time();
  *(_QWORD *)(a1 + 328) = mach_absolute_time();
  *(_OWORD *)(a1 + 336) = *(_OWORD *)(a1 + 312);
  *(_QWORD *)(a1 + 352) = *(_QWORD *)(a1 + 328);
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  *(_OWORD *)(a1 + 420) = 0u;
  *(_WORD *)(a1 + 436) = 257;
  *(_QWORD *)(a1 + 440) = 0;
  *(_QWORD *)(a1 + 448) = 0;
  Logger = waipc::logging::getLogger(5u);
  v19 = waipc::logging::getLogger(5u);
  v20 = os_signpost_id_make_with_pointer(v19, (const void *)a1);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v21 = v20;
    if (os_signpost_enabled(Logger))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ABB3000, Logger, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PCIeAudioLink", (const char *)&unk_21ABD0BD5, buf, 2u);
    }
  }
  os_unfair_lock_lock(v9);
  v22 = *(_QWORD *)(a1 + 112);
  if (v22 < waipc::PCIeAudioLink::computeBufferLength(a1, 0))
  {
    v57 = "fBufferLength >= computeBufferLength( fConfig)";
    v58 = 280;
    goto LABEL_36;
  }
  v23 = *(unsigned __int16 *)(a1 + 8);
  if (*(_DWORD *)(a1 + 28) % v23)
  {
    v57 = "fConfig.zeroTimestampInterval % fConfig.burstInterval == 0";
    v58 = 281;
LABEL_36:
    __assert_rtn("PCIeAudioLink", "PCIeAudioLink.cpp", v58, v57);
  }
  v64 = 0u;
  v65 = 0u;
  *(_OWORD *)buf = 0u;
  v63 = 0u;
  waipc::PCIeAudioLink::computeBufferLayout(a1, (unint64_t *)buf);
  v24 = *(_QWORD *)(a1 + 96);
  v25 = *((_QWORD *)&v63 + 1);
  v26 = v24 + *(_QWORD *)&buf[8];
  v27 = *(double *)a1;
  v28 = *(_WORD *)(a1 + 10);
  v29 = *((_QWORD *)&v64 + 1);
  v30 = v24 + *(_QWORD *)&buf[8] + 32;
  *(_QWORD *)v26 = 0x504349415544494FLL;
  *(_WORD *)(v26 + 12) = v28;
  *(_WORD *)(v26 + 14) = v23;
  v31 = *(_QWORD *)(a1 + 12);
  *(_DWORD *)(v26 + 8) = v27;
  *(_QWORD *)(v26 + 16) = v31;
  *(_DWORD *)(v26 + 24) = v25;
  *(_DWORD *)(v26 + 28) = v29;
  v32 = *(_QWORD *)buf;
  waipc::BlockRing::BlockRing(&v59, v30, v24 + v25, *(_QWORD *)buf, *(unsigned int *)(a1 + 12));
  v33 = v60;
  *v13 = v59;
  *(_OWORD *)(a1 + 160) = v33;
  *(_OWORD *)(a1 + 176) = v61;
  waipc::BlockRing::BlockRing(&v59, v26 + 36, *(_QWORD *)(a1 + 96) + v29, v32, *(unsigned int *)(a1 + 16));
  v34 = v60;
  *v17 = v59;
  *(_OWORD *)(a1 + 208) = v34;
  *(_OWORD *)(a1 + 224) = v61;
  v35 = *(_DWORD *)(a1 + 20) * *(unsigned __int16 *)(a1 + 10);
  if ((_DWORD)v35)
  {
    v36 = (void *)operator new[]();
    bzero(v36, v35);
  }
  else
  {
    v36 = 0;
  }
  v37 = *(_QWORD *)(a1 + 240);
  *(_QWORD *)(a1 + 240) = v36;
  if (v37)
    MEMORY[0x220752F5C](v37, 0x1000C8077774924);
  *(_QWORD *)(a1 + 256) = 0;
  *(_QWORD *)(a1 + 264) = 0;
  *(_QWORD *)(a1 + 248) = v35;
  v38 = *(_DWORD *)(a1 + 24) * *(unsigned __int16 *)(a1 + 10);
  if ((_DWORD)v38)
  {
    v39 = (void *)operator new[]();
    bzero(v39, v38);
  }
  else
  {
    v39 = 0;
  }
  v40 = *(_QWORD *)(a1 + 272);
  *(_QWORD *)(a1 + 272) = v39;
  if (v40)
    MEMORY[0x220752F5C](v40, 0x1000C8077774924);
  *(_QWORD *)(a1 + 288) = 0;
  *(_QWORD *)(a1 + 296) = 0;
  *(_QWORD *)(a1 + 280) = v38;
  v41 = (void *)operator new[]();
  bzero(v41, v32);
  v42 = *(_QWORD *)(a1 + 304);
  *(_QWORD *)(a1 + 304) = v41;
  if (v42)
    MEMORY[0x220752F5C](v42, 0x1000C8077774924);
  if (*(_BYTE *)(a1 + 65))
  {
    v43 = (char *)operator new();
    bzero(v43, 0x3890uLL);
    v44 = v43 + 5784;
    for (i = 1807; i != 1810; ++i)
    {
      *(_QWORD *)&v43[8 * i] = v44;
      v44 += 2888;
    }
    std::unique_ptr<waipc::PCIeAudioLink::stateLogger>::reset[abi:ne180100]((uint64_t *)(a1 + 448), (uint64_t)v43);
  }
  waipc::logging::EnableCache::init((waipc::logging::EnableCache *)(a1 + 456));
  if (*(_BYTE *)(a1 + 461))
  {
    v46 = waipc::logging::getLogger(5u);
    v47 = waipc::logging::getLogger(5u);
    v48 = os_signpost_id_make_with_pointer(v47, (const void *)a1);
    if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v49 = v48;
      if (os_signpost_enabled(v46))
      {
        LOWORD(v59) = 0;
        _os_signpost_emit_with_name_impl(&dword_21ABB3000, v46, OS_SIGNPOST_INTERVAL_END, v49, "PCIeAudioLink_DLStall", (const char *)&unk_21ABD0BD5, (uint8_t *)&v59, 2u);
      }
    }
  }
  v50 = mach_continuous_time();
  waipc::PCIeAudioLink::logDLStallBegin(a1, v50, a1 + 392, *(_QWORD *)(a1 + 416));
  if (*(_BYTE *)(a1 + 461))
  {
    v52 = waipc::logging::getLogger(5u);
    v53 = waipc::logging::getLogger(5u);
    v54 = os_signpost_id_make_with_pointer(v53, (const void *)a1);
    if (v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v55 = v54;
      if (os_signpost_enabled(v52))
      {
        LOWORD(v59) = 0;
        _os_signpost_emit_with_name_impl(&dword_21ABB3000, v52, OS_SIGNPOST_INTERVAL_END, v55, "PCIeAudioLink_DLUnderrun", (const char *)&unk_21ABD0BD5, (uint8_t *)&v59, 2u);
      }
    }
  }
  waipc::PCIeAudioLink::logDLUnderrunBegin(a1, v51, (uint64_t *)(a1 + 392), *(_QWORD *)(a1 + 416));
  waipc::PCIeAudioLink::updateLoggerState((waipc::PCIeAudioLink *)a1);
  os_unfair_lock_unlock(v9);
  return a1;
}

void sub_21ABBB21C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  os_unfair_lock_unlock(v3);
  std::unique_ptr<waipc::PCIeAudioLink::stateLogger>::reset[abi:ne180100](v4, 0);
  v6 = v1[38];
  v1[38] = 0;
  if (v6)
    MEMORY[0x220752F5C](v6, 0x1000C8077774924);
  v7 = v1[34];
  v1[34] = 0;
  if (v7)
    MEMORY[0x220752F5C](v7, 0x1000C8077774924);
  v8 = v1[30];
  v1[30] = 0;
  if (v8)
    MEMORY[0x220752F5C](v8, 0x1000C8077774924);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100](v2);
  _Unwind_Resume(a1);
}

void waipc::PCIeAudioLink::logDLStallBegin(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 88));
  v8 = *(_QWORD *)(a1 + 448);
  if (v8)
  {
    v9 = *(_QWORD *)(v8 + 1872);
    v10 = v8 + 88 * (v9 % 0xA);
    v11 = *(_QWORD *)(a3 + 16);
    *(_OWORD *)(v10 + 992) = *(_OWORD *)a3;
    *(_QWORD *)(v10 + 1008) = a4;
    *(_QWORD *)(v10 + 1016) = v11;
    *(_OWORD *)(v10 + 1024) = 0u;
    *(_OWORD *)(v10 + 1040) = 0u;
    *(_QWORD *)(v10 + 1056) = a2;
    *(_QWORD *)(v10 + 1064) = 0;
    *(_WORD *)(v10 + 1072) = 1;
    v12 = *(_QWORD *)(v8 + 1880);
    if (v12 <= 9)
      *(_QWORD *)(v8 + 1880) = v12 + 1;
    *(_QWORD *)(v8 + 1872) = (v9 + 1) % 0xA;
  }
}

void waipc::PCIeAudioLink::logDLUnderrunBegin(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 88));
  v7 = *(_QWORD *)(a1 + 448);
  if (v7)
  {
    v8 = *a3;
    v9 = a3[1];
    v10 = a3[2];
    v11 = mach_continuous_time();
    v12 = *(_QWORD *)(v7 + 2848);
    v13 = v7 + 96 * (v12 % 0xA);
    *(_QWORD *)(v13 + 1888) = v8;
    *(_QWORD *)(v13 + 1896) = v9;
    *(_QWORD *)(v13 + 1904) = a4;
    *(_QWORD *)(v13 + 1912) = v10;
    *(_OWORD *)(v13 + 1920) = 0u;
    *(_OWORD *)(v13 + 1936) = 0u;
    *(_QWORD *)(v13 + 1952) = v11;
    *(_QWORD *)(v13 + 1968) = 0;
    *(_QWORD *)(v13 + 1960) = 0;
    *(_WORD *)(v13 + 1976) = 1;
    v14 = *(_QWORD *)(v7 + 2856);
    if (v14 <= 9)
      *(_QWORD *)(v7 + 2856) = v14 + 1;
    *(_QWORD *)(v7 + 2848) = (v12 + 1) % 0xA;
  }
}

void waipc::PCIeAudioLink::updateLoggerState(waipc::PCIeAudioLink *this)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  os_unfair_lock_s *v7;

  os_unfair_lock_assert_owner((const os_unfair_lock *)this + 22);
  v2 = *((_QWORD *)this + 56);
  if (v2)
  {
    *(_OWORD *)v2 = *((_OWORD *)this + 16);
    *(_OWORD *)(v2 + 16) = *((_OWORD *)this + 18);
    v3 = *(_OWORD *)((char *)this + 312);
    *(_QWORD *)(v2 + 48) = *((_QWORD *)this + 41);
    *(_OWORD *)(v2 + 32) = v3;
    v4 = *((_OWORD *)this + 21);
    *(_QWORD *)(v2 + 72) = *((_QWORD *)this + 44);
    *(_OWORD *)(v2 + 56) = v4;
    *(_QWORD *)(v2 + 80) = *((_QWORD *)this + 45);
    v5 = *((_OWORD *)this + 23);
    *(_QWORD *)(v2 + 104) = *((_QWORD *)this + 48);
    *(_OWORD *)(v2 + 88) = v5;
    *(_DWORD *)(v2 + 112) = waipc::BlockRing::getCurrentIndex((os_unfair_lock_t)this + 36);
    v6 = *((_QWORD *)this + 51);
    *(_OWORD *)(v2 + 116) = *(_OWORD *)((char *)this + 392);
    *(_QWORD *)(v2 + 132) = v6;
    *(_DWORD *)(v2 + 140) = waipc::BlockRing::getCurrentIndex((os_unfair_lock_t)this + 48);
    *(_OWORD *)(v2 + 144) = *((_OWORD *)this + 26);
    *(_DWORD *)(v2 + 160) = *((_DWORD *)this + 108);
    *(_WORD *)(v2 + 164) = *((_WORD *)this + 218);
    v7 = (os_unfair_lock_s *)*((_QWORD *)this + 56);
    *(_QWORD *)(v2 + 168) = *((_QWORD *)this + 55);
    waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::put(v7 + 1444, v7);
  }
}

void waipc::PCIeAudioLink::~PCIeAudioLink(waipc::PCIeAudioLink *this)
{
  NSObject *Logger;
  NSObject *v3;
  os_signpost_id_t v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 436))
  {
    if (*((_BYTE *)this + 461))
    {
      Logger = waipc::logging::getLogger(5u);
      v3 = waipc::logging::getLogger(5u);
      v4 = os_signpost_id_make_with_pointer(v3, this);
      if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v5 = v4;
        if (os_signpost_enabled(Logger))
        {
          v18 = 67109120;
          v19 = 0;
          _os_signpost_emit_with_name_impl(&dword_21ABB3000, Logger, OS_SIGNPOST_INTERVAL_END, v5, "PCIeAudioLink_DLStall", "anomalous %{BOOL}d", (uint8_t *)&v18, 8u);
        }
      }
    }
  }
  if (*((_BYTE *)this + 437))
  {
    if (*((_BYTE *)this + 461))
    {
      v6 = waipc::logging::getLogger(5u);
      v7 = waipc::logging::getLogger(5u);
      v8 = os_signpost_id_make_with_pointer(v7, this);
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v9 = v8;
        if (os_signpost_enabled(v6))
        {
          v10 = *((_QWORD *)this + 55);
          v18 = 67109376;
          v19 = 0;
          v20 = 2048;
          v21 = v10;
          _os_signpost_emit_with_name_impl(&dword_21ABB3000, v6, OS_SIGNPOST_INTERVAL_END, v9, "PCIeAudioLink_DLUnderrun", "anomalous %{BOOL}d, length %llu", (uint8_t *)&v18, 0x12u);
        }
      }
    }
  }
  v11 = waipc::logging::getLogger(5u);
  v12 = waipc::logging::getLogger(5u);
  v13 = os_signpost_id_make_with_pointer(v12, this);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = v13;
    if (os_signpost_enabled(v11))
    {
      LOWORD(v18) = 0;
      _os_signpost_emit_with_name_impl(&dword_21ABB3000, v11, OS_SIGNPOST_INTERVAL_END, v14, "PCIeAudioLink", (const char *)&unk_21ABD0BD5, (uint8_t *)&v18, 2u);
    }
  }
  std::unique_ptr<waipc::PCIeAudioLink::stateLogger>::reset[abi:ne180100]((uint64_t *)this + 56, 0);
  v15 = *((_QWORD *)this + 38);
  *((_QWORD *)this + 38) = 0;
  if (v15)
    MEMORY[0x220752F5C](v15, 0x1000C8077774924);
  v16 = *((_QWORD *)this + 34);
  *((_QWORD *)this + 34) = 0;
  if (v16)
    MEMORY[0x220752F5C](v16, 0x1000C8077774924);
  v17 = *((_QWORD *)this + 30);
  *((_QWORD *)this + 30) = 0;
  if (v17)
    MEMORY[0x220752F5C](v17, 0x1000C8077774924);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)this + 96);
}

void sub_21ABBB7AC(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void waipc::PCIeAudioLink::sync(uint64_t a1, uint64_t a2, unint64_t a3)
{
  os_unfair_lock_s *v6;
  NSObject *Logger;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = (os_unfair_lock_s *)(a1 + 88);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if (*(_BYTE *)(a1 + 460))
  {
    Logger = waipc::logging::getLogger(4u);
    if (os_signpost_enabled(Logger))
    {
      v8 = 134217984;
      v9 = a3;
      _os_signpost_emit_with_name_impl(&dword_21ABB3000, Logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_Sync", "currentTime: %llu", (uint8_t *)&v8, 0xCu);
    }
  }
  waipc::PCIeAudioLink::checkDownlink(a1, a2, a3);
  waipc::PCIeAudioLink::checkUplink(a1, a2);
  waipc::PCIeAudioLink::updateLoggerState((waipc::PCIeAudioLink *)a1);
  os_unfair_lock_unlock(v6);
}

void sub_21ABBB8C0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::PCIeAudioLink::checkDownlink(uint64_t a1, uint64_t a2, unint64_t a3)
{
  __n128 *v5;
  uint64_t v6;
  double v7;
  unint64_t v8;
  NSObject *Logger;
  int CurrentIndex;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  __n128 v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  BOOL v28;
  unint64_t v29;
  NSObject *v30;
  NSObject *v31;
  os_signpost_id_t v32;
  os_signpost_id_t v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  os_signpost_id_t v37;
  os_signpost_id_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  uint64_t v50;
  double v51;
  NSObject *v52;
  NSObject *v53;
  os_signpost_id_t v54;
  os_signpost_id_t v55;
  uint8_t buf[4];
  _BYTE v58[14];
  __int16 v59;
  unint64_t v60;
  __int16 v61;
  unint64_t v62;
  __int16 v63;
  unint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 88));
  v5 = *(__n128 **)(a1 + 304);
  if (waipc::BlockRing::readNextBlock((waipc::BlockRing *)(a1 + 192), v5))
  {
    while (1)
    {
      v6 = (*(uint64_t (**)(uint64_t, unint64_t, _QWORD))(*(_QWORD *)a2 + 32))(a2, v5->n128_u64[1], 0);
      v8 = v6 + llround(v7);
      if (*(_BYTE *)(a1 + 460))
      {
        Logger = waipc::logging::getLogger(4u);
        if (os_signpost_enabled(Logger))
        {
          CurrentIndex = waipc::BlockRing::getCurrentIndex((os_unfair_lock_t)(a1 + 192));
          v11 = v5->n128_u64[0];
          v12 = v5->n128_u64[1];
          v13 = v5[1].n128_u64[0];
          *(_DWORD *)buf = 67110144;
          *(_DWORD *)v58 = CurrentIndex;
          *(_WORD *)&v58[4] = 2048;
          *(_QWORD *)&v58[6] = v11;
          v59 = 2048;
          v60 = v12;
          v61 = 2048;
          v62 = v13;
          v63 = 2048;
          v64 = v8;
          _os_signpost_emit_with_name_impl(&dword_21ABB3000, Logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_DLBlock", "id %u, sample %llu, deviceTime %llu, schedule %llu, hostTime %llu", buf, 0x30u);
        }
        if (*(_BYTE *)(a1 + 460))
        {
          v14 = waipc::logging::getLogger(4u);
          if (os_signpost_enabled(v14))
          {
            v15 = waipc::BlockRing::getCurrentIndex((os_unfair_lock_t)(a1 + 192));
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)v58 = v8;
            *(_WORD *)&v58[8] = 1024;
            *(_DWORD *)&v58[10] = v15;
            _os_signpost_emit_with_name_impl(&dword_21ABB3000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_DLBlockNominal", "%{signpost.description:event_time}llu id %u", buf, 0x12u);
          }
        }
      }
      v16 = *(unsigned __int16 *)(a1 + 8);
      if (v5->n128_u64[0] != *(_QWORD *)(a1 + 392) + v16)
        break;
      v17 = (double)v16 / *(double *)a1 * 1000000000.0 / *(double *)(a1 + 72);
      v18 = *(_QWORD *)(a1 + 400) + (uint64_t)v17;
      v19 = v5->n128_u64[1];
      if (v18 <= v19)
        v20 = v5->n128_i64[1];
      else
        v20 = *(_QWORD *)(a1 + 400) + (uint64_t)v17;
      if (v19 < v18)
        v18 = v5->n128_u64[1];
      if (v20 - v18 > *(_QWORD *)(a1 + 120))
        break;
      v41 = *(_QWORD *)(a1 + 408) + (uint64_t)v17;
      v42 = v5[1].n128_u64[0];
      if (v41 <= v42)
        v43 = v5[1].n128_i64[0];
      else
        v43 = *(_QWORD *)(a1 + 408) + (uint64_t)v17;
      if (v42 < v41)
        v41 = v5[1].n128_u64[0];
      v44 = v43 - v41;
      v45 = *(_QWORD *)(a1 + 128);
      v21 = v44 > v45;
      if (*(_BYTE *)(a1 + 436) || v44 > v45)
        goto LABEL_16;
      v21 = 0;
LABEL_18:
      v23 = *v5;
      *(_QWORD *)(a1 + 408) = v5[1].n128_u64[0];
      *(__n128 *)(a1 + 392) = v23;
      *(_QWORD *)(a1 + 416) = v8;
      v24 = *(_QWORD *)(a1 + 360);
      v25 = v24 + v5->n128_u64[0];
      if (v25 >= 0)
      {
        waipc::PCIeAudioLink::updateTimeline((waipc::PCIeAudioLink *)a1, v24 + v5->n128_u64[0], v8, v23.n128_f64[0]);
        waipc::FlatCircularBuffer::write((void **)(a1 + 272), &v5[1].n128_i8[8], v25 * *(unsigned __int16 *)(a1 + 10), *(unsigned __int16 *)(a1 + 8) * (unint64_t)*(unsigned __int16 *)(a1 + 10));
        v26 = *(_QWORD *)(a1 + 280) / (unint64_t)*(unsigned __int16 *)(a1 + 10);
        v27 = v25 + *(unsigned __int16 *)(a1 + 8);
        v28 = v27 >= v26;
        v29 = v27 - v26;
        if (!v28)
          v29 = 0;
        if (*(_QWORD *)(a1 + 288) > v29)
          v29 = *(_QWORD *)(a1 + 288);
        *(_QWORD *)(a1 + 288) = v29;
        *(_QWORD *)(a1 + 296) = v27;
      }
      if (*(_BYTE *)(a1 + 436))
      {
        *(_BYTE *)(a1 + 436) = 0;
        if (*(_BYTE *)(a1 + 461))
        {
          v30 = waipc::logging::getLogger(5u);
          v31 = waipc::logging::getLogger(5u);
          v32 = os_signpost_id_make_with_pointer(v31, (const void *)a1);
          if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v33 = v32;
            if (os_signpost_enabled(v30))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v58 = !v21;
              _os_signpost_emit_with_name_impl(&dword_21ABB3000, v30, OS_SIGNPOST_INTERVAL_END, v33, "PCIeAudioLink_DLStall", "anomalous %{BOOL}d", buf, 8u);
            }
          }
        }
        waipc::PCIeAudioLink::logDLStallEnd(a1, !v21, a3, v5, v8);
        if (!v21)
        {
          v34 = *(_QWORD *)(a1 + 448);
          if (v34)
            ++*(_DWORD *)(v34 + 2864);
        }
      }
      if (*(_BYTE *)(a1 + 437))
      {
        *(_BYTE *)(a1 + 437) = 0;
        if (*(_BYTE *)(a1 + 461))
        {
          v35 = waipc::logging::getLogger(5u);
          v36 = waipc::logging::getLogger(5u);
          v37 = os_signpost_id_make_with_pointer(v36, (const void *)a1);
          if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v38 = v37;
            if (os_signpost_enabled(v35))
            {
              v39 = *(_QWORD *)(a1 + 440);
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v58 = !v21;
              *(_WORD *)&v58[4] = 2048;
              *(_QWORD *)&v58[6] = v39;
              _os_signpost_emit_with_name_impl(&dword_21ABB3000, v35, OS_SIGNPOST_INTERVAL_END, v38, "PCIeAudioLink_DLUnderrun", "anomalous %{BOOL}d, length %llu", buf, 0x12u);
            }
          }
        }
        waipc::PCIeAudioLink::logDLUnderrunEnd(a1, !v21, *(_QWORD *)(a1 + 440), v5, v8);
        if (!v21)
        {
          v40 = *(_QWORD *)(a1 + 448);
          if (v40)
          {
            ++*(_DWORD *)(v40 + 2868);
            *(_QWORD *)(v40 + 2872) += *(_QWORD *)(a1 + 440);
          }
        }
      }
      if (!waipc::BlockRing::readNextBlock((waipc::BlockRing *)(a1 + 192), v5))
        goto LABEL_50;
    }
    v21 = 1;
LABEL_16:
    waipc::PCIeAudioLink::reanchorDL((const os_unfair_lock *)a1, v5->n128_u64[0], v8);
    waipc::PCIeAudioLink::realignUL((const os_unfair_lock *)a1, *(_QWORD *)(a1 + 360)+ v5->n128_u64[0]+ (uint64_t)(*(double *)a1* (*(double *)(a1 + 72)* (double)(uint64_t)(v5[1].n128_u64[0] - v5->n128_u64[1])/ 1000000000.0)), *(_QWORD *)(a1 + 360)+ v5->n128_u64[0]+ (uint64_t)(*(double *)a1 * (*(double *)(a1 + 80) * (double)(uint64_t)(a3 - v8) / 1000000000.0)));
    waipc::PCIeAudioLink::logReanchor(a1, (uint64_t *)(a1 + 392), *(_QWORD *)(a1 + 416), (uint64_t *)v5, v8, *(_QWORD *)(a1 + 360));
    v22 = *(_QWORD *)(a1 + 448);
    if (v22)
      ++*(_DWORD *)(v22 + 2880);
    goto LABEL_18;
  }
LABEL_50:
  if (!*(_BYTE *)(a1 + 436))
  {
    v46 = (unint64_t)*(double *)(a1 + 312);
    v47 = *(_QWORD *)(a1 + 320);
    v48 = *(double *)a1;
    v49 = *(double *)(a1 + 80);
    v50 = v47
        + (uint64_t)((double)(uint64_t)(*(_QWORD *)(a1 + 392) + *(unsigned __int16 *)(a1 + 8) + *(_QWORD *)(a1 + 360) - v46)
                  / *(double *)a1
                  * 1000000000.0
                  / v49);
    if (v50 + *(_QWORD *)(a1 + 136) <= a3)
    {
      *(_BYTE *)(a1 + 436) = 1;
      v51 = v48 * (v49 * (double)(uint64_t)(a3 - v47) / 1000000000.0);
      waipc::PCIeAudioLink::updateTimeline((waipc::PCIeAudioLink *)a1, (uint64_t)v51 + v46, a3, v51);
      if (*(_BYTE *)(a1 + 461))
      {
        v52 = waipc::logging::getLogger(5u);
        v53 = waipc::logging::getLogger(5u);
        v54 = os_signpost_id_make_with_pointer(v53, (const void *)a1);
        if (v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v55 = v54;
          if (os_signpost_enabled(v52))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)v58 = v50;
            _os_signpost_emit_with_name_impl(&dword_21ABB3000, v52, OS_SIGNPOST_INTERVAL_BEGIN, v55, "PCIeAudioLink_DLStall", "%{signpost.description:begin_time}llu", buf, 0xCu);
          }
        }
      }
      waipc::PCIeAudioLink::logDLStallBegin(a1, a3, a1 + 392, *(_QWORD *)(a1 + 416));
    }
  }
}

void waipc::PCIeAudioLink::checkUplink(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  NSObject *Logger;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  unint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  __int128 v26;
  char *v27;
  unint64_t v28;
  unint64_t v29;
  NSObject *v30;
  unint64_t v31;
  unint64_t v32;
  NSObject *v33;
  unint64_t v34;
  unint64_t v35;
  NSObject *v36;
  NSObject *v37;
  int CurrentIndex;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  int v46;
  uint8_t buf[4];
  _BYTE v48[24];
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 88));
  v4 = *(_QWORD *)(a1 + 424);
  v5 = *(_QWORD *)(a1 + 256);
  if (v5 >= v4)
  {
    *(_QWORD *)(a1 + 424) = *(unsigned __int16 *)(a1 + 8)
                          + (v5 - v4) / *(unsigned __int16 *)(a1 + 8) * *(unsigned __int16 *)(a1 + 8)
                          + v4;
    if (*(_BYTE *)(a1 + 460))
    {
      Logger = waipc::logging::getLogger(4u);
      if (os_signpost_enabled(Logger))
      {
        v7 = *(_QWORD *)(a1 + 424);
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v48 = v4;
        *(_WORD *)&v48[8] = 2048;
        *(_QWORD *)&v48[10] = v7;
        _os_signpost_emit_with_name_impl(&dword_21ABB3000, Logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_ULSkip", "oldSchedule %llu, newSchedule %llu", buf, 0x16u);
      }
    }
    v8 = *(_QWORD *)(a1 + 448);
    if (v8)
      *(_DWORD *)(v8 + 2884) |= 1u;
  }
  for (i = *(_QWORD *)(a1 + 424); ; *(_QWORD *)(a1 + 424) = i)
  {
    v10 = *(_QWORD *)(a1 + 264);
    v11 = i >= v10;
    v12 = i - v10;
    if (v12 != 0 && v11 && v12 >= *(unsigned int *)(a1 + 432))
      break;
    v13 = *(unsigned __int16 *)(a1 + 8);
    if (i >= v13)
      v14 = i - v13;
    else
      v14 = 0;
    v15 = *(_QWORD *)(a1 + 360);
    v16 = i / v13 * v13;
    v17 = (v15 + *(_QWORD *)(a1 + 392)) % v13;
    if (i % v13 <= v17)
      v13 = 0;
    v18 = v16 + v17 + v13;
    v19 = i - v15;
    v20 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)a2 + 24))(a2, *(_QWORD *)(a1 + 320)+ (uint64_t)((double)(uint64_t)(i - (unint64_t)*(double *)(a1 + 312))/ *(double *)a1* 1000000000.0/ *(double *)(a1 + 80)), 0);
    v22 = v20 + llround(v21);
    v23 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)a2 + 24))(a2, *(_QWORD *)(a1 + 320)+ (uint64_t)((double)(uint64_t)(v18 - (unint64_t)*(double *)(a1 + 312))/ *(double *)a1* 1000000000.0/ *(double *)(a1 + 80)), 0);
    *(_QWORD *)(a1 + 368) = v19;
    *(_QWORD *)(a1 + 376) = v22;
    *(_QWORD *)(a1 + 384) = v23 + llround(v24);
    v25 = waipc::BlockRing::getNextWriteBlock((os_unfair_lock_t)(a1 + 144));
    v26 = *(_OWORD *)(a1 + 368);
    *(_QWORD *)(v25 + 16) = *(_QWORD *)(a1 + 384);
    *(_OWORD *)v25 = v26;
    v27 = (char *)(v25 + 24);
    v28 = *(unsigned __int16 *)(a1 + 8);
    v29 = v28 - (i - v14);
    if (v28 > i - v14)
    {
      if (*(_BYTE *)(a1 + 460))
      {
        v30 = waipc::logging::getLogger(4u);
        if (os_signpost_enabled(v30))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v48 = i;
          *(_WORD *)&v48[8] = 2048;
          *(_QWORD *)&v48[10] = v29;
          _os_signpost_emit_with_name_impl(&dword_21ABB3000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_ULEarlySilence", "requested %llu, length %llu", buf, 0x16u);
        }
      }
      if (v29 >= *(unsigned __int16 *)(a1 + 8))
        waipc::PCIeAudioLink::checkUplink();
      bzero(v27, v29 * *(unsigned __int16 *)(a1 + 10));
      v27 += v29 * *(unsigned __int16 *)(a1 + 10);
    }
    v31 = *(_QWORD *)(a1 + 256);
    v32 = v31 - v14;
    if (v31 > v14)
    {
      if (*(_BYTE *)(a1 + 460))
      {
        v33 = waipc::logging::getLogger(4u);
        if (os_signpost_enabled(v33))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v48 = v14;
          *(_WORD *)&v48[8] = 2048;
          *(_QWORD *)&v48[10] = v31 - v14;
          _os_signpost_emit_with_name_impl(&dword_21ABB3000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_ULPartialBlockFront", "begin %llu, length %llu", buf, 0x16u);
        }
      }
      if (v32 >= *(unsigned __int16 *)(a1 + 8))
        waipc::PCIeAudioLink::checkUplink();
      bzero(v27, v32 * *(unsigned __int16 *)(a1 + 10));
      v27 += v32 * *(unsigned __int16 *)(a1 + 10);
      v14 = v31;
    }
    v34 = *(_QWORD *)(a1 + 264);
    if (v14 < v34)
    {
      if (v34 >= i)
        v35 = i;
      else
        v35 = *(_QWORD *)(a1 + 264);
      waipc::FlatCircularBuffer::read((const void **)(a1 + 240), v27, v14 * *(unsigned __int16 *)(a1 + 10), (v35 - v14) * *(unsigned __int16 *)(a1 + 10));
      v27 += (v35 - v14) * *(unsigned __int16 *)(a1 + 10);
      v14 = v35;
    }
    if (i > v14)
    {
      if (*(_BYTE *)(a1 + 460))
      {
        v36 = waipc::logging::getLogger(4u);
        if (os_signpost_enabled(v36))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v48 = v14;
          *(_WORD *)&v48[8] = 2048;
          *(_QWORD *)&v48[10] = i - v14;
          _os_signpost_emit_with_name_impl(&dword_21ABB3000, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_ULPartialBlockBack", "begin %llu, length %llu", buf, 0x16u);
        }
      }
      bzero(v27, (i - v14) * *(unsigned __int16 *)(a1 + 10));
    }
    waipc::BlockRing::commitWrite((os_unfair_lock_t)(a1 + 144));
    if (*(_BYTE *)(a1 + 460))
    {
      v37 = waipc::logging::getLogger(4u);
      if (os_signpost_enabled(v37))
      {
        CurrentIndex = waipc::BlockRing::getCurrentIndex((os_unfair_lock_t)(a1 + 144));
        v39 = *(_QWORD *)(a1 + 376);
        v40 = *(_QWORD *)(a1 + 384);
        v41 = *(_QWORD *)(a1 + 368);
        v42 = (uint64_t)((double)(uint64_t)(*(_QWORD *)(a1 + 360) + v41 - (unint64_t)*(double *)(a1 + 312))
                      / *(double *)a1
                      * 1000000000.0
                      / *(double *)(a1 + 80));
        v43 = *(_QWORD *)(a1 + 320);
        *(_DWORD *)buf = 67110144;
        *(_DWORD *)v48 = CurrentIndex;
        *(_WORD *)&v48[4] = 2048;
        *(_QWORD *)&v48[6] = v41;
        *(_WORD *)&v48[14] = 2048;
        *(_QWORD *)&v48[16] = v39;
        v49 = 2048;
        v50 = v40;
        v51 = 2048;
        v52 = v43 + v42;
        _os_signpost_emit_with_name_impl(&dword_21ABB3000, v37, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_ULBlock", "id %u, sample %llu, deviceTime %llu, schedule %llu, hostTime %llu", buf, 0x30u);
      }
      if (*(_BYTE *)(a1 + 460))
      {
        v44 = waipc::logging::getLogger(4u);
        if (os_signpost_enabled(v44))
        {
          v45 = *(_QWORD *)(a1 + 320)
              + (uint64_t)((double)(uint64_t)(*(_QWORD *)(a1 + 360)
                                          + *(_QWORD *)(a1 + 368)
                                          - (unint64_t)*(double *)(a1 + 312))
                        / *(double *)a1
                        * 1000000000.0
                        / *(double *)(a1 + 80));
          v46 = waipc::BlockRing::getCurrentIndex((os_unfair_lock_t)(a1 + 144));
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v48 = v45;
          *(_WORD *)&v48[8] = 1024;
          *(_DWORD *)&v48[10] = v46;
          _os_signpost_emit_with_name_impl(&dword_21ABB3000, v44, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_ULBlockNominal", "%{signpost.description:event_time}llu id %u", buf, 0x12u);
        }
      }
    }
    i = *(_QWORD *)(a1 + 424) + *(unsigned __int16 *)(a1 + 8);
  }
}

uint64_t waipc::PCIeAudioLink::deviceTimeFromSample(waipc::PCIeAudioLink *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (uint64_t)((double)(a2 - a3) / *(double *)this * 1000000000.0 / *((double *)this + 9)) + a4;
}

uint64_t waipc::PCIeAudioLink::absoluteDifference(waipc::PCIeAudioLink *this, unint64_t a2)
{
  waipc::PCIeAudioLink *v2;
  waipc::PCIeAudioLink *v3;

  if ((unint64_t)this <= a2)
    v2 = (waipc::PCIeAudioLink *)a2;
  else
    v2 = this;
  if (a2 >= (unint64_t)this)
    v3 = this;
  else
    v3 = (waipc::PCIeAudioLink *)a2;
  return v2 - v3;
}

void waipc::PCIeAudioLink::reanchorDL(const os_unfair_lock *this, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  NSObject *Logger;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t os_unfair_lock_opaque_high;
  unint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(this + 22);
  v6 = *(_QWORD *)&this[90]._os_unfair_lock_opaque;
  v7 = (uint64_t)(*(double *)&this->_os_unfair_lock_opaque
               * (*(double *)&this[20]._os_unfair_lock_opaque
                * (double)(a3 - *(_QWORD *)&this[80]._os_unfair_lock_opaque)
                / 1000000000.0))
     + (unint64_t)*(double *)&this[78]._os_unfair_lock_opaque;
  *(_QWORD *)&this[90]._os_unfair_lock_opaque = v7 - a2;
  if (LOBYTE(this[115]._os_unfair_lock_opaque))
  {
    Logger = waipc::logging::getLogger(4u);
    if (os_signpost_enabled(Logger))
    {
      v9 = *(_QWORD *)&this[90]._os_unfair_lock_opaque;
      v15 = 134218752;
      v16 = a2;
      v17 = 2048;
      v18 = v7;
      v19 = 2048;
      v20 = v6;
      v21 = 2048;
      v22 = v9;
      _os_signpost_emit_with_name_impl(&dword_21ABB3000, Logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_DLReanchor", "sample %llu, prevTimelineSample %lld, oldDeviceOffset %lld, newDeviceOffset %lld", (uint8_t *)&v15, 0x2Au);
    }
  }
  if ((v7 & 0x8000000000000000) != 0)
  {
    *(_QWORD *)&this[72]._os_unfair_lock_opaque = 0;
    *(_QWORD *)&this[74]._os_unfair_lock_opaque = 0;
  }
  else
  {
    v10 = *(_QWORD *)&this[74]._os_unfair_lock_opaque;
    v11 = v7 - v10;
    if (v7 >= v10)
    {
      os_unfair_lock_opaque_high = HIWORD(this[2]._os_unfair_lock_opaque);
      v14 = *(_QWORD *)&this[70]._os_unfair_lock_opaque / os_unfair_lock_opaque_high;
      if (v11 >= v14)
        v11 = *(_QWORD *)&this[70]._os_unfair_lock_opaque / os_unfair_lock_opaque_high;
      waipc::FlatCircularBuffer::set((waipc::FlatCircularBuffer *)&this[68], 0, v10 * os_unfair_lock_opaque_high, v11 * os_unfair_lock_opaque_high);
      v12 = v7 - v14;
      if (v7 < v14)
        v12 = 0;
      if (*(_QWORD *)&this[72]._os_unfair_lock_opaque > v12)
        v12 = *(_QWORD *)&this[72]._os_unfair_lock_opaque;
    }
    else
    {
      v12 = *(_QWORD *)&this[72]._os_unfair_lock_opaque;
      if (v7 < v12)
        v12 = v7;
    }
    *(_QWORD *)&this[72]._os_unfair_lock_opaque = v12;
    *(_QWORD *)&this[74]._os_unfair_lock_opaque = v7;
  }
}

uint64_t waipc::PCIeAudioLink::sampleFromDeviceTime(waipc::PCIeAudioLink *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (uint64_t)(*(double *)this * (*((double *)this + 9) * (double)(a2 - a4) / 1000000000.0)) + a3;
}

uint64_t waipc::PCIeAudioLink::sampleFromHostTime(waipc::PCIeAudioLink *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (uint64_t)(*(double *)this * (*((double *)this + 10) * (double)(a2 - a4) / 1000000000.0)) + a3;
}

void waipc::PCIeAudioLink::realignUL(const os_unfair_lock *this, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t os_unfair_lock_opaque_low;
  unint64_t v9;
  uint64_t v10;
  NSObject *Logger;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(this + 22);
  v6 = *(_QWORD *)&this[106]._os_unfair_lock_opaque;
  *(_QWORD *)&this[106]._os_unfair_lock_opaque = a2;
  v7 = this[8]._os_unfair_lock_opaque + a3;
  if (v7 > a2)
  {
    os_unfair_lock_opaque_low = LOWORD(this[2]._os_unfair_lock_opaque);
    v9 = v7 / os_unfair_lock_opaque_low * os_unfair_lock_opaque_low;
    if (v7 % os_unfair_lock_opaque_low <= a2 % os_unfair_lock_opaque_low)
      v10 = 0;
    else
      v10 = LOWORD(this[2]._os_unfair_lock_opaque);
    *(_QWORD *)&this[106]._os_unfair_lock_opaque = v9 + a2 % os_unfair_lock_opaque_low + v10;
  }
  if (LOBYTE(this[115]._os_unfair_lock_opaque))
  {
    Logger = waipc::logging::getLogger(4u);
    if (os_signpost_enabled(Logger))
    {
      v12 = *(_QWORD *)&this[106]._os_unfair_lock_opaque;
      v13 = 134218240;
      v14 = v6;
      v15 = 2048;
      v16 = v12;
      _os_signpost_emit_with_name_impl(&dword_21ABB3000, Logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_ULRealign", "oldSchedule %llu, newSchedule %llu", (uint8_t *)&v13, 0x16u);
    }
  }
}

void waipc::PCIeAudioLink::logReanchor(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  unint64_t v22;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 88));
  v12 = *(_QWORD *)(a1 + 448);
  if (v12)
  {
    v13 = *a2;
    v14 = a2[1];
    v15 = a2[2];
    v16 = *a4;
    v17 = a4[1];
    v18 = a4[2];
    v19 = mach_continuous_time();
    v20 = *(_QWORD *)(v12 + 976);
    v21 = (_QWORD *)(v12 + 80 * (v20 % 0xA));
    v21[22] = v13;
    v21[23] = v14;
    v21[24] = a3;
    v21[25] = v15;
    v21[26] = v16;
    v21[27] = v17;
    v21[28] = a5;
    v21[29] = v18;
    v21[30] = v19;
    v21[31] = a6;
    v22 = *(_QWORD *)(v12 + 984);
    if (v22 <= 9)
      *(_QWORD *)(v12 + 984) = v22 + 1;
    *(_QWORD *)(v12 + 976) = (v20 + 1) % 0xA;
  }
}

double waipc::PCIeAudioLink::updateTimeline(waipc::PCIeAudioLink *this, unint64_t a2, uint64_t a3, double result)
{
  unint64_t v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;

  if ((a2 & 0x8000000000000000) == 0)
  {
    result = *((double *)this + 42);
    v4 = *((unsigned int *)this + 7);
    if (result + (double)v4 <= (double)a2)
    {
      v5 = *((_QWORD *)this + 43);
      v6 = (double)a2 - result;
      v7 = (double)(uint64_t)(a3 - v5) / v6;
      v8 = (double)((unint64_t)v6 / v4 * v4);
      *((double *)this + 39) = result + v8;
      result = (double)v5 + v8 * v7;
      *((_QWORD *)this + 40) = (unint64_t)result;
    }
  }
  return result;
}

__n128 waipc::PCIeAudioLink::logDLStallEnd(uint64_t a1, char a2, uint64_t a3, __n128 *a4, uint64_t a5)
{
  __n128 result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 88));
  v11 = *(_QWORD *)(a1 + 448);
  if (v11)
  {
    if (!*(_QWORD *)(v11 + 1880))
      waipc::PCIeAudioLink::logDLStallEnd();
    v12 = waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::stallReport,10ul>::back(v11 + 992);
    if (!*(_BYTE *)(v12 + 80))
      waipc::PCIeAudioLink::logDLStallEnd();
    *(_BYTE *)(v12 + 80) = 0;
    *(_QWORD *)(v12 + 72) = a3;
    v13 = a4[1].n128_u64[0];
    result = *a4;
    *(__n128 *)(v12 + 32) = *a4;
    *(_QWORD *)(v12 + 48) = a5;
    *(_QWORD *)(v12 + 56) = v13;
    *(_BYTE *)(v12 + 81) = a2;
  }
  return result;
}

__n128 waipc::PCIeAudioLink::logDLUnderrunEnd(uint64_t a1, unsigned __int8 a2, unint64_t a3, __n128 *a4, unint64_t a5)
{
  __n128 result;
  uint64_t v11;
  uint64_t v12;
  __n128 *v13;
  unint64_t v14;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 88));
  v11 = *(_QWORD *)(a1 + 448);
  if (v11)
  {
    if (!*(_QWORD *)(v11 + 2856))
      waipc::PCIeAudioLink::logDLUnderrunEnd();
    v12 = waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::underrunReport,10ul>::back(v11 + 1888);
    if (!*(_BYTE *)(v12 + 88))
      waipc::PCIeAudioLink::logDLUnderrunEnd();
    v13 = (__n128 *)v12;
    *(_BYTE *)(v12 + 88) = 0;
    *(_QWORD *)(v12 + 72) = mach_continuous_time();
    v14 = a4[1].n128_u64[0];
    result = *a4;
    v13[2] = *a4;
    v13[3].n128_u64[0] = a5;
    v13[3].n128_u64[1] = v14;
    v13[5].n128_u8[9] = a2;
    v13[5].n128_u64[0] = a3;
  }
  return result;
}

uint64_t waipc::PCIeAudioLink::hostTimeFromSample(waipc::PCIeAudioLink *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (uint64_t)((double)(a2 - a3) / *(double *)this * 1000000000.0 / *((double *)this + 10)) + a4;
}

unint64_t waipc::PCIeAudioLink::increaseUntilEqualModulo(unint64_t this, unint64_t a2, unint64_t a3)
{
  unint64_t v3;

  if (this % a3 <= a2 % a3)
    v3 = 0;
  else
    v3 = a3;
  return this / a3 * a3 + a2 % a3 + v3;
}

unint64_t waipc::PCIeAudioLink::roundDown(unint64_t this, unint64_t a2)
{
  return this / a2 * a2;
}

uint64_t waipc::PCIeAudioLink::signedDifference(waipc::PCIeAudioLink *this, uint64_t a2)
{
  return (uint64_t)this - a2;
}

void waipc::PCIeAudioLink::readInput(waipc::PCIeAudioLink *this, unint64_t a2, char *a3, unsigned int a4)
{
  os_unfair_lock_s *v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *Logger;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  NSObject *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  os_signpost_id_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = (os_unfair_lock_s *)((char *)this + 88);
  os_unfair_lock_lock((os_unfair_lock_t)this + 22);
  v10 = a4 / *((unsigned __int16 *)this + 5) + a2;
  if (*((_BYTE *)this + 460))
  {
    Logger = waipc::logging::getLogger(4u);
    if (os_signpost_enabled(Logger))
    {
      v12 = *((_QWORD *)this + 36);
      v13 = *((_QWORD *)this + 37);
      v27 = 134218752;
      v28 = a2;
      v29 = 2048;
      v30 = v10;
      v31 = 2048;
      v32 = v12;
      v33 = 2048;
      v34 = v13;
      _os_signpost_emit_with_name_impl(&dword_21ABB3000, Logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_ReadInput", "range [%llu, %llu), available [%llu, %llu)", (uint8_t *)&v27, 0x2Au);
    }
  }
  v14 = *((_QWORD *)this + 36);
  if (v14 > a2)
  {
    if (v14 >= v10)
      v15 = v10;
    else
      v15 = *((_QWORD *)this + 36);
    v16 = v15 - a2;
    if (*((_BYTE *)this + 460))
    {
      v17 = waipc::logging::getLogger(4u);
      if (os_signpost_enabled(v17))
      {
        v27 = 134218240;
        v28 = a2;
        v29 = 2048;
        v30 = v15 - a2;
        _os_signpost_emit_with_name_impl(&dword_21ABB3000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_DLOverflow", "begin %llu, length %llu", (uint8_t *)&v27, 0x16u);
      }
    }
    v18 = *((_QWORD *)this + 56);
    if (v18)
      *(_DWORD *)(v18 + 2884) |= 2u;
    bzero(a3, v16 * *((unsigned __int16 *)this + 5));
    a3 += v16 * *((unsigned __int16 *)this + 5);
    a2 = v15;
  }
  v19 = *((_QWORD *)this + 37);
  if (a2 < v19)
  {
    if (v19 >= v10)
      v20 = v10;
    else
      v20 = *((_QWORD *)this + 37);
    waipc::FlatCircularBuffer::read((const void **)this + 34, a3, a2 * *((unsigned __int16 *)this + 5), (v20 - a2) * *((unsigned __int16 *)this + 5));
    a3 += (v20 - a2) * *((unsigned __int16 *)this + 5);
    a2 = v20;
  }
  v21 = v10 - a2;
  if (v10 > a2)
  {
    if (!*((_BYTE *)this + 437))
    {
      *((_BYTE *)this + 437) = 1;
      *((_QWORD *)this + 55) = 0;
      if (*((_BYTE *)this + 461))
      {
        v22 = waipc::logging::getLogger(5u);
        v23 = waipc::logging::getLogger(5u);
        v24 = os_signpost_id_make_with_pointer(v23, this);
        if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v25 = v24;
          if (os_signpost_enabled(v22))
          {
            v26 = *((_QWORD *)this + 40)
                + (uint64_t)((double)(uint64_t)(a2 - (unint64_t)*((double *)this + 39))
                          / *(double *)this
                          * 1000000000.0
                          / *((double *)this + 10));
            v27 = 134217984;
            v28 = v26;
            _os_signpost_emit_with_name_impl(&dword_21ABB3000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v25, "PCIeAudioLink_DLUnderrun", "%{signpost.description:begin_time}llu", (uint8_t *)&v27, 0xCu);
          }
        }
      }
      waipc::PCIeAudioLink::logDLUnderrunBegin((uint64_t)this, v9, (uint64_t *)this + 49, *((_QWORD *)this + 52));
    }
    *((_QWORD *)this + 55) += v21;
    bzero(a3, v21 * *((unsigned __int16 *)this + 5));
  }
  waipc::PCIeAudioLink::updateLoggerState(this);
  os_unfair_lock_unlock(v8);
}

void sub_21ABBCED4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::PCIeAudioLink::writeMix(os_unfair_lock_s *this, unint64_t a2, char *a3, unsigned int a4, uint32_t a5)
{
  os_unfair_lock_s *v10;
  unint64_t os_unfair_lock_opaque_high;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  NSObject *Logger;
  uint32_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t os_unfair_lock_opaque_low;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  NSObject *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  os_unfair_lock_s *lock;
  uint8_t buf[4];
  unint64_t v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v10 = this + 22;
  os_unfair_lock_lock(this + 22);
  os_unfair_lock_opaque_high = HIWORD(this[2]._os_unfair_lock_opaque);
  v12 = *(_QWORD *)&this[62]._os_unfair_lock_opaque / os_unfair_lock_opaque_high;
  v13 = a4 / os_unfair_lock_opaque_high;
  v14 = v13 - v12;
  lock = v10;
  if (v13 <= v12)
  {
    v16 = a5;
    v18 = a2;
  }
  else
  {
    if (LOBYTE(this[115]._os_unfair_lock_opaque))
    {
      Logger = waipc::logging::getLogger(4u);
      if (os_signpost_enabled(Logger))
      {
        *(_DWORD *)buf = 134218240;
        v39 = a2;
        v40 = 2048;
        v41 = v13 - v12;
        _os_signpost_emit_with_name_impl(&dword_21ABB3000, Logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_ULOverflow", "begin %llu, length %llu", buf, 0x16u);
      }
    }
    v16 = a5;
    v17 = *(_QWORD *)&this[112]._os_unfair_lock_opaque;
    if (v17)
      *(_DWORD *)(v17 + 2884) |= 4u;
    v18 = v14 + a2;
    os_unfair_lock_opaque_high = HIWORD(this[2]._os_unfair_lock_opaque);
    a3 += v14 * os_unfair_lock_opaque_high;
  }
  v19 = v13 + a2;
  v20 = *(_QWORD *)&this[66]._os_unfair_lock_opaque;
  v21 = v18 - v20;
  if (v18 != v20)
  {
    v22 = *(_QWORD *)&this[106]._os_unfair_lock_opaque;
    if (v18 >= v20)
    {
      if (v19 - v20 < v12 && *(_QWORD *)&this[64]._os_unfair_lock_opaque != v20)
      {
        if (v21 > v12)
          __assert_rtn("writeMix", "PCIeAudioLink.cpp", 776, "skip <= capacity");
        waipc::FlatCircularBuffer::set((waipc::FlatCircularBuffer *)&this[60], 0, v20 * os_unfair_lock_opaque_high, v21 * os_unfair_lock_opaque_high);
        v35 = v18 - v12;
        if (v18 >= v12)
          v36 = v18 - v12;
        else
          v36 = 0;
        if (*(_QWORD *)&this[64]._os_unfair_lock_opaque >= v36)
          v35 = *(_QWORD *)&this[64]._os_unfair_lock_opaque;
        *(_QWORD *)&this[64]._os_unfair_lock_opaque = v35;
        *(_QWORD *)&this[66]._os_unfair_lock_opaque = v18;
        goto LABEL_22;
      }
      *(_QWORD *)&this[64]._os_unfair_lock_opaque = v18;
      *(_QWORD *)&this[66]._os_unfair_lock_opaque = v18;
    }
    else
    {
      v23 = *(_QWORD *)&this[64]._os_unfair_lock_opaque;
      if (v23 >= v18)
        v23 = v18;
      *(_QWORD *)&this[64]._os_unfair_lock_opaque = v23;
      *(_QWORD *)&this[66]._os_unfair_lock_opaque = v18;
      if (v22 <= v18)
        goto LABEL_22;
    }
    os_unfair_lock_opaque_low = LOWORD(this[2]._os_unfair_lock_opaque);
    if ((v18 + 1) % os_unfair_lock_opaque_low <= v22 % os_unfair_lock_opaque_low)
      v25 = 0;
    else
      v25 = LOWORD(this[2]._os_unfair_lock_opaque);
    *(_QWORD *)&this[106]._os_unfair_lock_opaque = (v18 + 1) / os_unfair_lock_opaque_low * os_unfair_lock_opaque_low
                                                 + v22 % os_unfair_lock_opaque_low
                                                 + v25;
LABEL_22:
    if (LOBYTE(this[115]._os_unfair_lock_opaque))
    {
      v26 = waipc::logging::getLogger(4u);
      if (os_signpost_enabled(v26))
      {
        v27 = *(_QWORD *)&this[106]._os_unfair_lock_opaque;
        *(_DWORD *)buf = 134218752;
        v39 = v18;
        v40 = 2048;
        v41 = v20;
        v42 = 2048;
        v43 = v22;
        v44 = 2048;
        v45 = v27;
        _os_signpost_emit_with_name_impl(&dword_21ABB3000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_ULJump", "begin %llu, expected %llu, oldSchedule %llu, newSchedule %llu", buf, 0x2Au);
      }
    }
  }
  waipc::FlatCircularBuffer::write((void **)&this[60], a3, v18 * HIWORD(this[2]._os_unfair_lock_opaque), (v19 - v18) * HIWORD(this[2]._os_unfair_lock_opaque));
  v28 = v19 - v12;
  if (v19 >= v12)
    v29 = v19 - v12;
  else
    v29 = 0;
  if (*(_QWORD *)&this[64]._os_unfair_lock_opaque >= v29)
    v28 = *(_QWORD *)&this[64]._os_unfair_lock_opaque;
  *(_QWORD *)&this[64]._os_unfair_lock_opaque = v28;
  *(_QWORD *)&this[66]._os_unfair_lock_opaque = v19;
  this[108]._os_unfair_lock_opaque = v16;
  if (LOBYTE(this[115]._os_unfair_lock_opaque))
  {
    v30 = waipc::logging::getLogger(4u);
    if (os_signpost_enabled(v30))
    {
      v31 = *(_QWORD *)&this[64]._os_unfair_lock_opaque;
      v32 = *(_QWORD *)&this[66]._os_unfair_lock_opaque;
      v33 = *(_QWORD *)&this[106]._os_unfair_lock_opaque;
      v34 = v33 - LOWORD(this[2]._os_unfair_lock_opaque);
      *(_DWORD *)buf = 134219264;
      v39 = v18;
      v40 = 2048;
      v41 = v19;
      v42 = 2048;
      v43 = v31;
      v44 = 2048;
      v45 = v32;
      v46 = 2048;
      v47 = v34;
      v48 = 2048;
      v49 = v33;
      _os_signpost_emit_with_name_impl(&dword_21ABB3000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_WriteMix", "range [%llu, %llu), available [%llu, %llu), scheduled [%llu, %llu)", buf, 0x3Eu);
    }
  }
  waipc::PCIeAudioLink::updateLoggerState((waipc::PCIeAudioLink *)this);
  os_unfair_lock_unlock(lock);
}

void sub_21ABBD294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void waipc::PCIeAudioLink::getZeroTimestamp(waipc::PCIeAudioLink *this@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  os_unfair_lock_s *v6;
  unint64_t v7;
  double v8;
  unint64_t v9;
  double v10;
  unint64_t v11;
  NSObject *Logger;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = (os_unfair_lock_s *)((char *)this + 88);
  os_unfair_lock_lock((os_unfair_lock_t)this + 22);
  if (*((_BYTE *)this + 436))
  {
    v8 = *((double *)this + 39);
    LODWORD(v7) = *((_DWORD *)this + 7);
    v9 = (unint64_t)(v8 + (double)v7);
    v10 = (double)(uint64_t)(v9 - (unint64_t)v8) / *(double *)this * 1000000000.0 / *((double *)this + 10);
    v11 = *((_QWORD *)this + 40) + (uint64_t)v10;
    if (v11 <= a2)
      waipc::PCIeAudioLink::updateTimeline(this, v9, v11, v10);
  }
  if (*((_QWORD *)this + 40) <= a2)
  {
    *((_QWORD *)this + 44) = *((_QWORD *)this + 41);
    *((_OWORD *)this + 21) = *(_OWORD *)((char *)this + 312);
  }
  if (*((_BYTE *)this + 460))
  {
    Logger = waipc::logging::getLogger(4u);
    if (os_signpost_enabled(Logger))
    {
      v13 = *((_QWORD *)this + 42);
      v14 = *((_QWORD *)this + 43);
      v15 = *((_QWORD *)this + 44);
      v16 = 134218496;
      v17 = v13;
      v18 = 2048;
      v19 = v14;
      v20 = 2048;
      v21 = v15;
      _os_signpost_emit_with_name_impl(&dword_21ABB3000, Logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_GetZeroTimestamp", "sample %lf, host %llu, seed %llu", (uint8_t *)&v16, 0x20u);
    }
  }
  waipc::PCIeAudioLink::updateLoggerState(this);
  *(_OWORD *)a3 = *((_OWORD *)this + 21);
  *(_QWORD *)(a3 + 16) = *((_QWORD *)this + 44);
  os_unfair_lock_unlock(v6);
}

void sub_21ABBD444(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL waipc::PCIeAudioLink::isPeripheralActive(os_unfair_lock_s *this)
{
  os_unfair_lock_s *v2;
  _BOOL8 v3;

  v2 = this + 22;
  os_unfair_lock_lock(this + 22);
  v3 = waipc::BlockRing::getLiveIndex(this + 48) != 0;
  os_unfair_lock_unlock(v2);
  return v3;
}

void sub_21ABBD4A0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::PCIeAudioLink::getDLState(waipc::PCIeAudioLink *this@<X0>, uint64_t a2@<X8>)
{
  os_unfair_lock_s *v4;

  v4 = (os_unfair_lock_s *)((char *)this + 88);
  os_unfair_lock_lock((os_unfair_lock_t)this + 22);
  *(_DWORD *)a2 = waipc::BlockRing::getCurrentIndex((os_unfair_lock_t)this + 48) - 1;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)((char *)this + 392);
  *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 51);
  os_unfair_lock_unlock(v4);
}

void sub_21ABBD510(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::PCIeAudioLink::getULState(os_unfair_lock_s *this@<X0>, uint64_t a2@<X8>)
{
  os_unfair_lock_s *v4;

  v4 = this + 22;
  os_unfair_lock_lock(this + 22);
  *(_DWORD *)a2 = waipc::BlockRing::getCurrentIndex(this + 36) - 1;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)&this[92]._os_unfair_lock_opaque;
  *(_QWORD *)(a2 + 24) = *(_QWORD *)&this[96]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(v4);
}

void sub_21ABBD57C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

double waipc::PCIeAudioLink::getDLAlignmentAnchor(os_unfair_lock_s *this)
{
  os_unfair_lock_s *v2;
  double v3;

  v2 = this + 22;
  os_unfair_lock_lock(this + 22);
  v3 = (double)(unint64_t)(*(_QWORD *)&this[90]._os_unfair_lock_opaque
                                + *(_QWORD *)&this[98]._os_unfair_lock_opaque);
  os_unfair_lock_unlock(v2);
  return v3;
}

double waipc::PCIeAudioLink::getULAlignmentAnchor(os_unfair_lock_s *this)
{
  os_unfair_lock_s *v2;
  double v3;

  v2 = this + 22;
  os_unfair_lock_lock(this + 22);
  v3 = (double)*(unint64_t *)&this[106]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(v2);
  return v3;
}

unint64_t waipc::PCIeAudioLink::roundUp(waipc::PCIeAudioLink *this, unint64_t a2)
{
  return ((unint64_t)this + a2 - 1) / a2 * a2;
}

uint64_t waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::stallReport,10ul>::back(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 888);
  if (!v1)
    waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::stallReport,10ul>::back();
  if (*(_QWORD *)(a1 + 880))
    v1 = *(_QWORD *)(a1 + 880);
  return a1 + 88 * ((v1 - 1) % 0xAuLL);
}

uint64_t waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::underrunReport,10ul>::back(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 968);
  if (!v1)
    waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::stallReport,10ul>::back();
  if (*(_QWORD *)(a1 + 960))
    v1 = *(_QWORD *)(a1 + 960);
  return a1 + 96 * ((v1 - 1) % 0xAuLL);
}

void waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::put(os_unfair_lock_t lock, const void *a2)
{
  void *v4;
  unint64_t *p_os_unfair_lock_opaque;
  unint64_t v6;

  if (lock)
    os_unfair_lock_lock(lock);
  v4 = (void *)waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::takeIdle((uint64_t)lock);
  memcpy(v4, a2, 0xB48uLL);
  p_os_unfair_lock_opaque = (unint64_t *)&lock[2168]._os_unfair_lock_opaque;
  do
    v6 = __ldaxr(p_os_unfair_lock_opaque);
  while (__stlxr((unint64_t)v4, p_os_unfair_lock_opaque));
  if (v6)
    waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::putIdle((uint64_t)lock, v6);
  if (lock)
    os_unfair_lock_unlock(lock);
}

void sub_21ABBD750(_Unwind_Exception *exception_object)
{
  os_unfair_lock_s *v1;

  if (v1)
    os_unfair_lock_unlock(v1);
  _Unwind_Resume(exception_object);
}

uint64_t waipc::PCIeAudioLink::dumpState(waipc::PCIeAudioLink *this)
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CFTypeRef v8;
  CFTypeRef v9;
  CFTypeRef v10;
  CFTypeRef v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void **v17;
  uint64_t v18;
  CFTypeRef v20;
  CFTypeRef v21;
  CFTypeRef v22;
  CFTypeRef cf[3];
  uint64_t v24;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t **v27;
  uint64_t v28;
  __n128 (*v29)(_QWORD *, uint64_t);
  void (*v30)(uint64_t);
  char *v31[3];
  _QWORD v32[6];
  uint64_t v33;
  uint64_t **v34;
  uint64_t v35;
  __n128 (*v36)(_QWORD *, uint64_t);
  void (*v37)(uint64_t);
  char *v38[3];
  _QWORD v39[6];
  uint64_t v40;
  uint64_t **v41;
  uint64_t v42;
  __n128 (*v43)(_QWORD *, uint64_t);
  void (*v44)(uint64_t);
  char *v45[3];
  void **v46[2];
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[6];
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[6];
  _QWORD v59[4];
  _QWORD v60[4];
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[6];
  _QWORD v65[8];
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD v70[4];

  v70[2] = *MEMORY[0x24BDAC8D0];
  v2 = (os_unfair_lock_s *)((char *)this + 92);
  os_unfair_lock_lock((os_unfair_lock_t)this + 23);
  v3 = (os_unfair_lock_s *)*((_QWORD *)this + 56);
  if (v3)
  {
    waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::take(v3 + 1444, &v3[722]);
    v4 = *((_QWORD *)this + 56);
    v40 = 0;
    v41 = (uint64_t **)&v40;
    v42 = 0x4002000000;
    v43 = __Block_byref_object_copy__0;
    v44 = __Block_byref_object_dispose__0;
    memset(v45, 0, sizeof(v45));
    std::vector<applesauce::CF::DictionaryRef>::reserve(v45, *(_QWORD *)(v4 + 3872));
    v5 = MEMORY[0x24BDAC760];
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 0x40000000;
    v39[2] = ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke_36;
    v39[3] = &unk_24DDBC118;
    v39[4] = &__block_literal_global_33;
    v39[5] = &v40;
    waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::reanchorReport,10ul>::for_each<void({block_pointer})(waipc::PCIeAudioLink::reanchorReport const&)>(v4 + 3064, (uint64_t)v39);
    v33 = 0;
    v34 = (uint64_t **)&v33;
    v35 = 0x4002000000;
    v36 = __Block_byref_object_copy__0;
    v37 = __Block_byref_object_dispose__0;
    memset(v38, 0, sizeof(v38));
    std::vector<applesauce::CF::DictionaryRef>::reserve(v38, *(_QWORD *)(v4 + 4768));
    v32[0] = v5;
    v32[1] = 0x40000000;
    v32[2] = ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke_2_47;
    v32[3] = &unk_24DDBC140;
    v32[4] = &__block_literal_global_33;
    v32[5] = &v33;
    waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::stallReport,10ul>::for_each<void({block_pointer})(waipc::PCIeAudioLink::stallReport const&)>(v4 + 3880, (uint64_t)v32);
    v26 = 0;
    v27 = (uint64_t **)&v26;
    v28 = 0x4002000000;
    v29 = __Block_byref_object_copy__0;
    v30 = __Block_byref_object_dispose__0;
    memset(v31, 0, sizeof(v31));
    std::vector<applesauce::CF::DictionaryRef>::reserve(v31, *(_QWORD *)(v4 + 5744));
    v25[0] = v5;
    v25[1] = 0x40000000;
    v25[2] = ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke_3_62;
    v25[3] = &unk_24DDBC168;
    v25[4] = &__block_literal_global_33;
    v25[5] = &v26;
    waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::underrunReport,10ul>::for_each<void({block_pointer})(waipc::PCIeAudioLink::underrunReport const&)>(v4 + 4776, (uint64_t)v25);
    waipc::util::_kv::_kv<double const&,void>(v46, (uint64_t)CFSTR("Sample Rate"), (uint64_t *)this);
    waipc::util::_kv::_kv<unsigned short const&,void>(&v47, (uint64_t)CFSTR("Burst Interval"), (__int16 *)this + 4);
    waipc::util::_kv::_kv<unsigned short const&,void>(&v48, (uint64_t)CFSTR("Sample Width"), (__int16 *)this + 5);
    waipc::util::_kv::_kv<unsigned int const&,void>(&v49, (uint64_t)CFSTR("UL Scratch Size"), (int *)this + 5);
    waipc::util::_kv::_kv<unsigned int const&,void>(&v50, (uint64_t)CFSTR("DL Scratch Size"), (int *)this + 6);
    waipc::util::_kv::_kv<unsigned int const&,void>(&v51, (uint64_t)CFSTR("Timestamp Interval"), (int *)this + 7);
    waipc::util::_kv::_kv<double const&,void>(&v52, (uint64_t)CFSTR("UL Reanchor Threshold"), (uint64_t *)this + 5);
    waipc::util::_kv::_kv<double const&,void>(&v53, (uint64_t)CFSTR("DL Reanchor Threshold"), (uint64_t *)this + 6);
    waipc::util::_kv::_kv<double const&,void>(v54, (uint64_t)CFSTR("DL Stall Detect Threshold"), (uint64_t *)this + 7);
    v6 = waipc::BlockRing::dumpState((waipc::PCIeAudioLink *)((char *)this + 144));
    v54[2] = CFSTR("UL Ring");
    v54[3] = v6;
    cf[2] = 0;
    v7 = waipc::BlockRing::dumpState((waipc::PCIeAudioLink *)((char *)this + 192));
    v54[4] = CFSTR("DL Ring");
    v54[5] = v7;
    cf[1] = 0;
    waipc::util::_kv::_kv<unsigned long long &,void>(&v55, (uint64_t)CFSTR("UL Scratch Head"), (uint64_t *)(v4 + 2888));
    waipc::util::_kv::_kv<unsigned long long &,void>(&v56, (uint64_t)CFSTR("UL Scratch Tail"), (uint64_t *)(v4 + 2896));
    waipc::util::_kv::_kv<unsigned long long &,void>(&v57, (uint64_t)CFSTR("DL Scratch Head"), (uint64_t *)(v4 + 2904));
    waipc::util::_kv::_kv<unsigned long long &,void>(v58, (uint64_t)CFSTR("DL Scratch Tail"), (uint64_t *)(v4 + 2912));
    ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke((uint64_t *)(v4 + 2920), (applesauce::CF::DictionaryRef *)cf);
    v58[2] = CFSTR("Current Timestamp");
    v8 = cf[0];
    if (cf[0])
      CFRetain(cf[0]);
    v58[3] = v8;
    ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke((uint64_t *)(v4 + 2944), (applesauce::CF::DictionaryRef *)&v22);
    v58[4] = CFSTR("Last Timestamp");
    v9 = v22;
    if (v22)
      CFRetain(v22);
    v58[5] = v9;
    waipc::util::_kv::_kv<unsigned long long &,void>(v59, (uint64_t)CFSTR("Device Timeline Offset"), (uint64_t *)(v4 + 2968));
    ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke_2((uint64_t *)(v4 + 2976), (applesauce::CF::DictionaryRef *)&v21);
    v59[2] = CFSTR("UL Last Header");
    v10 = v21;
    if (v21)
      CFRetain(v21);
    v59[3] = v10;
    waipc::util::_kv::_kv<unsigned int &,void>(v60, (uint64_t)CFSTR("UL Last Index"), (int *)(v4 + 3000));
    ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke_2((uint64_t *)(v4 + 3004), (applesauce::CF::DictionaryRef *)&v20);
    v60[2] = CFSTR("DL Last Header");
    v11 = v20;
    if (v20)
      CFRetain(v20);
    v60[3] = v11;
    waipc::util::_kv::_kv<unsigned int &,void>(&v61, (uint64_t)CFSTR("DL Last Index"), (int *)(v4 + 3028));
    waipc::util::_kv::_kv<unsigned long long &,void>(&v62, (uint64_t)CFSTR("DL Last Host Timestamp"), (uint64_t *)(v4 + 3032));
    waipc::util::_kv::_kv<unsigned long long &,void>(&v63, (uint64_t)CFSTR("UL Next Block"), (uint64_t *)(v4 + 3040));
    waipc::util::_kv::_kv<unsigned int &,void>(v64, (uint64_t)CFSTR("UL Tardiness"), (int *)(v4 + 3048));
    v12 = *MEMORY[0x24BDBD270];
    v13 = *MEMORY[0x24BDBD268];
    if (*(_BYTE *)(v4 + 3052))
      v14 = *MEMORY[0x24BDBD270];
    else
      v14 = *MEMORY[0x24BDBD268];
    v64[2] = CFSTR("DL Stalled");
    v64[3] = v14;
    if (*(_BYTE *)(v4 + 3053))
      v15 = v12;
    else
      v15 = v13;
    v64[4] = CFSTR("DL Underrun");
    v64[5] = v15;
    waipc::util::_kv::_kv<unsigned long long &,void>(v65, (uint64_t)CFSTR("DL Underrun Length"), (uint64_t *)(v4 + 3056));
    v65[2] = CFSTR("Reanchor Log");
    v65[3] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>(v41 + 5);
    v65[4] = CFSTR("DL Stall Log");
    v65[5] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>(v34 + 5);
    v65[6] = CFSTR("DL Underrun Log");
    v65[7] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>(v27 + 5);
    waipc::util::_kv::_kv<unsigned int &,void>(&v66, (uint64_t)CFSTR("DL Stall Anomaly Count"), (int *)(v4 + 5752));
    waipc::util::_kv::_kv<unsigned int &,void>(&v67, (uint64_t)CFSTR("DL Underrun Anomalies"), (int *)(v4 + 5756));
    waipc::util::_kv::_kv<unsigned long long &,void>(&v68, (uint64_t)CFSTR("DL Underrun Anomaly Length"), (uint64_t *)(v4 + 5760));
    waipc::util::_kv::_kv<unsigned int &,void>(&v69, (uint64_t)CFSTR("Reanchor Count"), (int *)(v4 + 5768));
    waipc::util::_kv::_kv<unsigned int &,void>(v70, (uint64_t)CFSTR("Exotic Errors"), (int *)(v4 + 5772));
    waipc::util::createCFDictDropNull<36l>((uint64_t)v46, (applesauce::CF::DictionaryRef *)&v24);
    for (i = 71; i != -1; i -= 2)
    {
      v17 = v46[i];
      if (v17)
        CFRelease(v17);
    }
    if (v20)
      CFRelease(v20);
    if (v21)
      CFRelease(v21);
    if (v22)
      CFRelease(v22);
    if (cf[0])
      CFRelease(cf[0]);
    v18 = v24;
    _Block_object_dispose(&v26, 8);
    v46[0] = (void **)v31;
    std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](v46);
    _Block_object_dispose(&v33, 8);
    v46[0] = (void **)v38;
    std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](v46);
    _Block_object_dispose(&v40, 8);
    v46[0] = (void **)v45;
    std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](v46);
  }
  else
  {
    v18 = 0;
  }
  os_unfair_lock_unlock(v2);
  return v18;
}

void sub_21ABBDE60(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

BOOL waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::take(os_unfair_lock_s *a1, void *a2)
{
  os_unfair_lock_s *v4;
  unint64_t *p_os_unfair_lock_opaque;
  const void *v6;

  v4 = a1 + 1;
  os_unfair_lock_lock(a1 + 1);
  p_os_unfair_lock_opaque = (unint64_t *)&a1[2168]._os_unfair_lock_opaque;
  do
    v6 = (const void *)__ldaxr(p_os_unfair_lock_opaque);
  while (__stlxr(0, p_os_unfair_lock_opaque));
  if (v6)
  {
    if (a2)
      memcpy(a2, v6, 0xB48uLL);
    waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::putIdle((uint64_t)a1, (unint64_t)v6);
  }
  os_unfair_lock_unlock(v4);
  return v6 != 0;
}

void sub_21ABBE06C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke(uint64_t *a1@<X1>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t i;
  const void *v5;
  _QWORD v6[2];
  uint64_t v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  waipc::util::_kv::_kv<double const&,void>(v6, (uint64_t)CFSTR("Sample"), a1);
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v7, (uint64_t)CFSTR("Host"), a1 + 1);
  waipc::util::_kv::_kv<unsigned long long const&,void>(v8, (uint64_t)CFSTR("Seed"), a1 + 2);
  waipc::util::createCFDictDropNull<3l>((uint64_t)v6, a2);
  for (i = 5; i != -1; i -= 2)
  {
    v5 = (const void *)v6[i];
    if (v5)
      CFRelease(v5);
  }
}

void sub_21ABBE154(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t i;

  for (i = 32; i != -16; i -= 16)
    waipc::util::_kv::~_kv((waipc::util::_kv *)(v1 + i));
  _Unwind_Resume(a1);
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<3l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3;
  CFIndex v4;
  void *v5;
  void *v6;
  CFDictionaryRef v7;
  void *values[3];
  void *keys[4];

  v3 = 0;
  v4 = 0;
  keys[3] = *(void **)MEMORY[0x24BDAC8D0];
  memset(keys, 0, 24);
  memset(values, 0, sizeof(values));
  do
  {
    v5 = *(void **)(a1 + v3);
    if (v5)
    {
      v6 = *(void **)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        values[v4++] = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 48);
  v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)values, v4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

void ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke_2(uint64_t *a1@<X1>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t i;
  const void *v5;
  _QWORD v6[2];
  uint64_t v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  waipc::util::_kv::_kv<unsigned long long const&,void>(v6, (uint64_t)CFSTR("Sample"), a1);
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v7, (uint64_t)CFSTR("Timestamp"), a1 + 1);
  waipc::util::_kv::_kv<unsigned long long const&,void>(v8, (uint64_t)CFSTR("Schedule"), a1 + 2);
  waipc::util::createCFDictDropNull<3l>((uint64_t)v6, a2);
  for (i = 5; i != -1; i -= 2)
  {
    v5 = (const void *)v6[i];
    if (v5)
      CFRelease(v5);
  }
}

void sub_21ABBE358(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t i;

  for (i = 32; i != -16; i -= 16)
    waipc::util::_kv::~_kv((waipc::util::_kv *)(v1 + i));
  _Unwind_Resume(a1);
}

void ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke_3(uint64_t *a1@<X1>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t i;
  const void *v5;
  _QWORD v6[2];
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  waipc::util::_kv::_kv<unsigned long long const&,void>(v6, (uint64_t)CFSTR("Sample"), a1);
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v7, (uint64_t)CFSTR("Device"), a1 + 1);
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v8, (uint64_t)CFSTR("Host"), a1 + 2);
  waipc::util::_kv::_kv<unsigned long long const&,void>(v9, (uint64_t)CFSTR("Schedule"), a1 + 3);
  waipc::util::createCFDictDropNull<4l>((uint64_t)v6, a2);
  for (i = 7; i != -1; i -= 2)
  {
    v5 = (const void *)v6[i];
    if (v5)
      CFRelease(v5);
  }
}

void sub_21ABBE4A4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t i;

  for (i = 48; i != -16; i -= 16)
    waipc::util::_kv::~_kv((waipc::util::_kv *)(v1 + i));
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__0(_QWORD *a1, uint64_t a2)
{
  __n128 result;

  a1[5] = 0;
  a1[6] = 0;
  a1[7] = 0;
  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 5) = result;
  a1[7] = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  void **v1;

  v1 = (void **)(a1 + 40);
  std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::reanchorReport,10ul>::for_each<void({block_pointer})(waipc::PCIeAudioLink::reanchorReport const&)>(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v9;

  v3 = result;
  v4 = *(_QWORD *)(result + 800);
  v5 = v4 - 10;
  if (v4 != 10 && v4 != *(_QWORD *)(result + 808))
  {
    v7 = result + 80 * v4;
    do
    {
      result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v7);
      v7 += 80;
    }
    while (!__CFADD__(v5++, 1));
  }
  if (v4)
  {
    v9 = 80 * v4;
    do
    {
      result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v3);
      v3 += 80;
      v9 -= 80;
    }
    while (v9);
  }
  return result;
}

void ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke_36(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  CFTypeRef v5;
  CFTypeRef v6;
  unint64_t v7;
  CFTypeRef *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  CFTypeRef *v15;
  char *v16;
  _QWORD *v17;
  const void *v18;
  __int128 v19;
  char *v20;
  CFTypeRef v21;
  uint64_t i;
  const void *v23;
  CFTypeRef v24;
  CFTypeRef cf;
  CFTypeRef v26;
  uint64_t v27;
  __int128 v28;
  char *v29;
  _QWORD *v30;
  _QWORD v31[2];
  _QWORD v32[7];

  v32[6] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  waipc::util::_kv::_kv<unsigned long long const&,void>(v31, (uint64_t)CFSTR("Time"), (uint64_t *)(a2 + 64));
  waipc::util::_kv::_kv<unsigned long long const&,void>(v32, (uint64_t)CFSTR("Offset"), (uint64_t *)(a2 + 72));
  (*(void (**)(CFTypeRef *__return_ptr))(*(_QWORD *)(a1 + 32) + 16))(&cf);
  v32[2] = CFSTR("Before");
  v5 = cf;
  if (cf)
    CFRetain(cf);
  v32[3] = v5;
  (*(void (**)(CFTypeRef *__return_ptr))(*(_QWORD *)(a1 + 32) + 16))(&v24);
  v32[4] = CFSTR("After");
  v6 = v24;
  if (v24)
    CFRetain(v24);
  v32[5] = v6;
  waipc::util::createCFDictDropNull<4l>((uint64_t)v31, (applesauce::CF::DictionaryRef *)&v26);
  v7 = v4[7];
  v8 = (CFTypeRef *)v4[6];
  if ((unint64_t)v8 >= v7)
  {
    v9 = (_QWORD *)v4[5];
    v10 = v8 - (CFTypeRef *)v9;
    if ((unint64_t)(v10 + 1) >> 61)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v11 = v7 - (_QWORD)v9;
    v12 = (uint64_t)(v7 - (_QWORD)v9) >> 2;
    if (v12 <= v10 + 1)
      v12 = v10 + 1;
    if (v11 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    v30 = v4 + 7;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>((uint64_t)(v4 + 7), v13);
      v9 = (_QWORD *)v4[5];
      v8 = (CFTypeRef *)v4[6];
    }
    else
    {
      v14 = 0;
    }
    v15 = (CFTypeRef *)&v14[8 * v10];
    v16 = &v14[8 * v13];
    v29 = v16;
    *v15 = v26;
    v17 = v15 + 1;
    v26 = 0;
    *((_QWORD *)&v28 + 1) = v15 + 1;
    if (v8 != v9)
    {
      do
      {
        v18 = *--v8;
        *--v15 = v18;
        *v8 = 0;
      }
      while (v8 != v9);
      v17 = (_QWORD *)*((_QWORD *)&v28 + 1);
      v16 = v29;
    }
    v19 = *(_OWORD *)(v4 + 5);
    v4[5] = v15;
    v4[6] = v17;
    v28 = v19;
    v20 = (char *)v4[7];
    v4[7] = v16;
    v29 = v20;
    v27 = v19;
    std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)&v27);
    v21 = v26;
    v4[6] = v17;
    if (v21)
      CFRelease(v21);
  }
  else
  {
    *v8 = v26;
    v26 = 0;
    v4[6] = v8 + 1;
  }
  for (i = 7; i != -1; i -= 2)
  {
    v23 = (const void *)v31[i];
    if (v23)
      CFRelease(v23);
  }
  if (v24)
    CFRelease(v24);
  if (cf)
    CFRelease(cf);
}

void sub_21ABBE824(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::stallReport,10ul>::for_each<void({block_pointer})(waipc::PCIeAudioLink::stallReport const&)>(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v9;

  v3 = result;
  v4 = *(_QWORD *)(result + 880);
  v5 = v4 - 10;
  if (v4 != 10 && v4 != *(_QWORD *)(result + 888))
  {
    v7 = result + 88 * v4;
    do
    {
      result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v7);
      v7 += 88;
    }
    while (!__CFADD__(v5++, 1));
  }
  if (v4)
  {
    v9 = 88 * v4;
    do
    {
      result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v3);
      v3 += 88;
      v9 -= 88;
    }
    while (v9);
  }
  return result;
}

void ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke_2_47(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CFTypeRef v9;
  CFTypeRef v10;
  unint64_t v11;
  CFTypeRef *v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  CFTypeRef *v19;
  char *v20;
  _QWORD *v21;
  const void *v22;
  __int128 v23;
  char *v24;
  CFTypeRef v25;
  uint64_t i;
  const void *v27;
  CFTypeRef v28;
  CFTypeRef cf;
  CFTypeRef v30;
  uint64_t v31;
  __int128 v32;
  char *v33;
  _QWORD *v34;
  _QWORD v35[4];
  uint64_t v36;
  _QWORD v37[7];

  v37[6] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *MEMORY[0x24BDBD270];
  v6 = *MEMORY[0x24BDBD268];
  if (*(_BYTE *)(a2 + 80))
    v7 = *MEMORY[0x24BDBD270];
  else
    v7 = *MEMORY[0x24BDBD268];
  v35[0] = CFSTR("Active");
  v35[1] = v7;
  if (*(_BYTE *)(a2 + 81))
    v8 = v5;
  else
    v8 = v6;
  v35[2] = CFSTR("Anomalous");
  v35[3] = v8;
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v36, (uint64_t)CFSTR("Begin Time"), (uint64_t *)(a2 + 64));
  waipc::util::_kv::_kv<unsigned long long const&,void>(v37, (uint64_t)CFSTR("End Time"), (uint64_t *)(a2 + 72));
  (*(void (**)(CFTypeRef *__return_ptr))(*(_QWORD *)(a1 + 32) + 16))(&cf);
  v37[2] = CFSTR("Begin");
  v9 = cf;
  if (cf)
    CFRetain(cf);
  v37[3] = v9;
  (*(void (**)(CFTypeRef *__return_ptr))(*(_QWORD *)(a1 + 32) + 16))(&v28);
  v37[4] = CFSTR("End");
  v10 = v28;
  if (v28)
    CFRetain(v28);
  v37[5] = v10;
  waipc::util::createCFDictDropNull<6l>((uint64_t)v35, (applesauce::CF::DictionaryRef *)&v30);
  v11 = v4[7];
  v12 = (CFTypeRef *)v4[6];
  if ((unint64_t)v12 >= v11)
  {
    v13 = (_QWORD *)v4[5];
    v14 = v12 - (CFTypeRef *)v13;
    if ((unint64_t)(v14 + 1) >> 61)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v15 = v11 - (_QWORD)v13;
    v16 = (uint64_t)(v11 - (_QWORD)v13) >> 2;
    if (v16 <= v14 + 1)
      v16 = v14 + 1;
    if (v15 >= 0x7FFFFFFFFFFFFFF8)
      v17 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v17 = v16;
    v34 = v4 + 7;
    if (v17)
    {
      v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>((uint64_t)(v4 + 7), v17);
      v13 = (_QWORD *)v4[5];
      v12 = (CFTypeRef *)v4[6];
    }
    else
    {
      v18 = 0;
    }
    v19 = (CFTypeRef *)&v18[8 * v14];
    v20 = &v18[8 * v17];
    v33 = v20;
    *v19 = v30;
    v21 = v19 + 1;
    v30 = 0;
    *((_QWORD *)&v32 + 1) = v19 + 1;
    if (v12 != v13)
    {
      do
      {
        v22 = *--v12;
        *--v19 = v22;
        *v12 = 0;
      }
      while (v12 != v13);
      v21 = (_QWORD *)*((_QWORD *)&v32 + 1);
      v20 = v33;
    }
    v23 = *(_OWORD *)(v4 + 5);
    v4[5] = v19;
    v4[6] = v21;
    v32 = v23;
    v24 = (char *)v4[7];
    v4[7] = v20;
    v33 = v24;
    v31 = v23;
    std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)&v31);
    v25 = v30;
    v4[6] = v21;
    if (v25)
      CFRelease(v25);
  }
  else
  {
    *v12 = v30;
    v30 = 0;
    v4[6] = v12 + 1;
  }
  for (i = 11; i != -1; i -= 2)
  {
    v27 = (const void *)v35[i];
    if (v27)
      CFRelease(v27);
  }
  if (v28)
    CFRelease(v28);
  if (cf)
    CFRelease(cf);
}

void sub_21ABBEC18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<6l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3;
  CFIndex v4;
  void *v5;
  uint64_t v6;
  CFDictionaryRef v7;
  _OWORD v9[3];
  void *keys[2];
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v3 = 0;
  v4 = 0;
  v13 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  *(_OWORD *)keys = 0u;
  memset(v9, 0, sizeof(v9));
  do
  {
    v5 = *(void **)(a1 + v3);
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        *((_QWORD *)v9 + v4++) = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 96);
  v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)v9, v4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

uint64_t waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::underrunReport,10ul>::for_each<void({block_pointer})(waipc::PCIeAudioLink::underrunReport const&)>(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v9;

  v3 = result;
  v4 = *(_QWORD *)(result + 960);
  v5 = v4 - 10;
  if (v4 != 10 && v4 != *(_QWORD *)(result + 968))
  {
    v7 = result + 96 * v4;
    do
    {
      result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v7);
      v7 += 96;
    }
    while (!__CFADD__(v5++, 1));
  }
  if (v4)
  {
    v9 = 96 * v4;
    do
    {
      result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v3);
      v3 += 96;
      v9 -= 96;
    }
    while (v9);
  }
  return result;
}

void ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke_3_62(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CFTypeRef v9;
  CFTypeRef v10;
  unint64_t v11;
  CFTypeRef *v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  CFTypeRef *v19;
  char *v20;
  _QWORD *v21;
  const void *v22;
  __int128 v23;
  char *v24;
  CFTypeRef v25;
  uint64_t i;
  const void *v27;
  CFTypeRef v28;
  CFTypeRef cf;
  CFTypeRef v30;
  uint64_t v31;
  __int128 v32;
  char *v33;
  _QWORD *v34;
  _QWORD v35[4];
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[7];

  v38[6] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *MEMORY[0x24BDBD270];
  v6 = *MEMORY[0x24BDBD268];
  if (*(_BYTE *)(a2 + 88))
    v7 = *MEMORY[0x24BDBD270];
  else
    v7 = *MEMORY[0x24BDBD268];
  v35[0] = CFSTR("Active");
  v35[1] = v7;
  if (*(_BYTE *)(a2 + 89))
    v8 = v5;
  else
    v8 = v6;
  v35[2] = CFSTR("Anomalous");
  v35[3] = v8;
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v36, (uint64_t)CFSTR("Length"), (uint64_t *)(a2 + 80));
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v37, (uint64_t)CFSTR("Begin Time"), (uint64_t *)(a2 + 64));
  waipc::util::_kv::_kv<unsigned long long const&,void>(v38, (uint64_t)CFSTR("End Time"), (uint64_t *)(a2 + 72));
  (*(void (**)(CFTypeRef *__return_ptr))(*(_QWORD *)(a1 + 32) + 16))(&cf);
  v38[2] = CFSTR("Begin");
  v9 = cf;
  if (cf)
    CFRetain(cf);
  v38[3] = v9;
  (*(void (**)(CFTypeRef *__return_ptr))(*(_QWORD *)(a1 + 32) + 16))(&v28);
  v38[4] = CFSTR("End");
  v10 = v28;
  if (v28)
    CFRetain(v28);
  v38[5] = v10;
  waipc::util::createCFDictDropNull<7l>((uint64_t)v35, (applesauce::CF::DictionaryRef *)&v30);
  v11 = v4[7];
  v12 = (CFTypeRef *)v4[6];
  if ((unint64_t)v12 >= v11)
  {
    v13 = (_QWORD *)v4[5];
    v14 = v12 - (CFTypeRef *)v13;
    if ((unint64_t)(v14 + 1) >> 61)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v15 = v11 - (_QWORD)v13;
    v16 = (uint64_t)(v11 - (_QWORD)v13) >> 2;
    if (v16 <= v14 + 1)
      v16 = v14 + 1;
    if (v15 >= 0x7FFFFFFFFFFFFFF8)
      v17 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v17 = v16;
    v34 = v4 + 7;
    if (v17)
    {
      v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>((uint64_t)(v4 + 7), v17);
      v13 = (_QWORD *)v4[5];
      v12 = (CFTypeRef *)v4[6];
    }
    else
    {
      v18 = 0;
    }
    v19 = (CFTypeRef *)&v18[8 * v14];
    v20 = &v18[8 * v17];
    v33 = v20;
    *v19 = v30;
    v21 = v19 + 1;
    v30 = 0;
    *((_QWORD *)&v32 + 1) = v19 + 1;
    if (v12 != v13)
    {
      do
      {
        v22 = *--v12;
        *--v19 = v22;
        *v12 = 0;
      }
      while (v12 != v13);
      v21 = (_QWORD *)*((_QWORD *)&v32 + 1);
      v20 = v33;
    }
    v23 = *(_OWORD *)(v4 + 5);
    v4[5] = v19;
    v4[6] = v21;
    v32 = v23;
    v24 = (char *)v4[7];
    v4[7] = v20;
    v33 = v24;
    v31 = v23;
    std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)&v31);
    v25 = v30;
    v4[6] = v21;
    if (v25)
      CFRelease(v25);
  }
  else
  {
    *v12 = v30;
    v30 = 0;
    v4[6] = v12 + 1;
  }
  for (i = 13; i != -1; i -= 2)
  {
    v27 = (const void *)v35[i];
    if (v27)
      CFRelease(v27);
  }
  if (v28)
    CFRelease(v28);
  if (cf)
    CFRelease(cf);
}

void sub_21ABBF0D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<7l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3;
  CFIndex v4;
  void *v5;
  uint64_t v6;
  CFDictionaryRef v7;
  _OWORD v9[3];
  uint64_t v10;
  void *keys[2];
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v3 = 0;
  v4 = 0;
  v15 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  *(_OWORD *)keys = 0u;
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  do
  {
    v5 = *(void **)(a1 + v3);
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        *((_QWORD *)v9 + v4++) = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 112);
  v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)v9, v4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<36l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3;
  CFIndex v4;
  void *v5;
  uint64_t v6;
  CFDictionaryRef v7;
  _OWORD v9[18];
  void *keys[2];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v3 = 0;
  v4 = 0;
  v28 = *MEMORY[0x24BDAC8D0];
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  *(_OWORD *)keys = 0u;
  v11 = 0u;
  memset(v9, 0, sizeof(v9));
  do
  {
    v5 = *(void **)(a1 + v3);
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        *((_QWORD *)v9 + v4++) = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 576);
  v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)v9, v4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

uint64_t *std::unique_ptr<waipc::PCIeAudioLink::stateLogger>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::~StateStash(v2 + 5776);
    JUMPOUT(0x220752F74);
  }
  return result;
}

uint64_t waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::~StateStash(uint64_t a1)
{
  unint64_t *v2;
  unint64_t v3;

  v2 = (unint64_t *)(a1 + 8672);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(0, v2));
  if (v3)
    waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::putIdle(a1, v3);
  return a1;
}

uint64_t waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::putIdle(uint64_t result, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  if (!a2)
    waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::putIdle();
  v2 = a2 - result - 8;
  if (v2 < -2887 || (v3 = 0xF99E237502209ED9 * (v2 >> 3), v3 >= 3))
    waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::putIdle();
  v4 = (unint64_t *)(result + 8 * v3 + 8680);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(a2, v4));
  if (v5)
    waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::putIdle();
  return result;
}

unint64_t waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::takeIdle(uint64_t a1)
{
  unint64_t v1;
  unint64_t *v2;
  unint64_t v3;
  BOOL v4;

  v1 = 0;
  do
  {
    v2 = (unint64_t *)(a1 + 8 * v1 + 8680);
    do
      v3 = __ldaxr(v2);
    while (__stlxr(0, v2));
    if (v3)
      v4 = 1;
    else
      v4 = v1 >= 2;
    ++v1;
  }
  while (!v4);
  if (!v3)
    waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::takeIdle();
  return v3;
}

_QWORD *waipc::util::_kv::_kv<unsigned short const&,void>(_QWORD *a1, uint64_t a2, __int16 *a3)
{
  CFNumberRef v4;
  void *exception;
  __int16 valuePtr;

  *a1 = a2;
  valuePtr = *a3;
  v4 = CFNumberCreate(0, kCFNumberShortType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x220752F14](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_21ABBF530(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  const void *v3;

  v3 = *(const void **)(v1 + 8);
  if (v3)
    CFRelease(v3);
  _Unwind_Resume(exception_object);
}

_QWORD *waipc::util::_kv::_kv<unsigned long long &,void>(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  CFNumberRef v4;
  void *exception;
  uint64_t valuePtr;

  *a1 = a2;
  valuePtr = *a3;
  v4 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x220752F14](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_21ABBF5E4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  const void *v3;

  v3 = *(const void **)(v1 + 8);
  if (v3)
    CFRelease(v3);
  _Unwind_Resume(exception_object);
}

_QWORD *waipc::util::_kv::_kv<unsigned int &,void>(_QWORD *a1, uint64_t a2, int *a3)
{
  CFNumberRef v4;
  void *exception;
  int valuePtr;

  *a1 = a2;
  valuePtr = *a3;
  v4 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x220752F14](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_21ABBF698(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  const void *v3;

  v3 = *(const void **)(v1 + 8);
  if (v3)
    CFRelease(v3);
  _Unwind_Resume(exception_object);
}

double waipc::timesync::BasebandConfig::getDefault@<D0>(uint64_t a1@<X8>)
{
  waipc::util::TimestampConverter *RadioVendor;
  double v4;
  double result;

  RadioVendor = (waipc::util::TimestampConverter *)TelephonyRadiosGetRadioVendor();
  *(_OWORD *)a1 = xmmword_21ABCCC90;
  *(_OWORD *)(a1 + 16) = xmmword_21ABCCCA0;
  v4 = 52.0833333;
  if ((_DWORD)RadioVendor != 1)
    v4 = 1.0;
  *(double *)(a1 + 32) = v4;
  *(double *)(a1 + 40) = waipc::util::TimestampConverter::defaultHostPeriod(RadioVendor);
  *(_QWORD *)&result = 0x200002710;
  *(_OWORD *)(a1 + 48) = xmmword_21ABCCCB0;
  *(_BYTE *)(a1 + 64) = 0;
  return result;
}

uint64_t waipc::timesync::LinearEstimator::LinearEstimator(uint64_t a1, __int128 *a2, _OWORD *a3)
{
  __int128 v5;
  char **v6;
  _OWORD *v7;
  unint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  __int128 v20;

  *(_QWORD *)a1 = &off_24DDBC198;
  v5 = *a2;
  *(_OWORD *)(a1 + 24) = 0u;
  v6 = (char **)(a1 + 24);
  *(_OWORD *)(a1 + 8) = v5;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  std::vector<std::pair<waipc::timesync::Estimator::timestamp,waipc::timesync::Estimator::timestamp>>::reserve((void **)(a1 + 24), *(_QWORD *)(a1 + 8));
  v7 = a3 + 1;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_OWORD **)(a1 + 32);
  if ((unint64_t)v9 >= v8)
  {
    v11 = ((char *)v9 - *v6) >> 5;
    v12 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 59)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v13 = v8 - (_QWORD)*v6;
    if (v13 >> 4 > v12)
      v12 = v13 >> 4;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFE0)
      v14 = 0x7FFFFFFFFFFFFFFLL;
    else
      v14 = v12;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<waipc::timesync::Estimator::timestamp,waipc::timesync::Estimator::timestamp>>>(a1 + 40, v14);
    else
      v15 = 0;
    v16 = &v15[32 * v11];
    v17 = &v15[32 * v14];
    *(_OWORD *)v16 = *a3;
    *((_OWORD *)v16 + 1) = *v7;
    v10 = v16 + 32;
    v19 = *(char **)(a1 + 24);
    v18 = *(char **)(a1 + 32);
    if (v18 != v19)
    {
      do
      {
        v20 = *((_OWORD *)v18 - 1);
        *((_OWORD *)v16 - 2) = *((_OWORD *)v18 - 2);
        *((_OWORD *)v16 - 1) = v20;
        v16 -= 32;
        v18 -= 32;
      }
      while (v18 != v19);
      v18 = *v6;
    }
    *(_QWORD *)(a1 + 24) = v16;
    *(_QWORD *)(a1 + 32) = v10;
    *(_QWORD *)(a1 + 40) = v17;
    if (v18)
      operator delete(v18);
  }
  else
  {
    *v9 = *a3;
    v9[1] = *v7;
    v10 = v9 + 2;
  }
  *(_QWORD *)(a1 + 32) = v10;
  waipc::timesync::LinearEstimator::updateEstimate((waipc::timesync::LinearEstimator *)a1);
  return a1;
}

void sub_21ABBF874(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 32) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<std::pair<waipc::timesync::Estimator::timestamp,waipc::timesync::Estimator::timestamp>>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 5)
  {
    if (a2 >> 59)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<waipc::timesync::Estimator::timestamp,waipc::timesync::Estimator::timestamp>>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFE0];
    v9 = &v6[32 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v12 - 2) = *((_OWORD *)v10 - 2);
        *((_OWORD *)v12 - 1) = v13;
        v12 -= 32;
        v10 -= 32;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

double waipc::timesync::LinearEstimator::updateEstimate(waipc::timesync::LinearEstimator *this)
{
  uint64_t v1;
  uint64_t v2;
  double result;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v2 = *((_QWORD *)this + 3);
  v1 = *((_QWORD *)this + 4);
  result = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = (double)(unint64_t)((v1 - v2) >> 5);
  if (v1 != v2)
  {
    v7 = *((_QWORD *)this + 3);
    do
    {
      v5 = v5 + (double)(*(_QWORD *)v7 + vcvtmd_s64_f64(*(double *)(v7 + 8)));
      v4 = v4 + (double)(*(_QWORD *)(v7 + 16) + vcvtmd_s64_f64(*(double *)(v7 + 24)));
      v7 += 32;
    }
    while (v7 != v1);
  }
  v8 = (unint64_t)(v5 / v6);
  *((_QWORD *)this + 7) = v8;
  *((_QWORD *)this + 8) = 0;
  v9 = (unint64_t)(v4 / v6);
  *((_QWORD *)this + 9) = v9;
  *((_QWORD *)this + 10) = 0;
  v10 = 0.0;
  v11 = 0.0;
  v12 = 0.0;
  if (v2 != v1)
  {
    result = 0.0;
    do
    {
      v13 = *(double *)(v2 + 8) + (double)(uint64_t)(*(_QWORD *)v2 - v8);
      v14 = *(double *)(v2 + 24) + (double)(uint64_t)(*(_QWORD *)(v2 + 16) - v9);
      v12 = v12 + v13;
      result = result + v14;
      v10 = v10 + v14 * v14;
      v11 = v11 + v13 * v14;
      v2 += 32;
    }
    while (v2 != v1);
  }
  v15 = 1.0 / (v6 * v10 - result * result);
  v16 = -(result * v15);
  v17 = v10 * v15 * v12 + 0.0 + v16 * v11;
  v18 = v16 * v12 + 0.0 + v15 * v6 * v11;
  *((double *)this + 11) = v17 + v12 / v6 - v18 * (result / v6);
  *((double *)this + 12) = v18;
  return result;
}

double waipc::timesync::LinearEstimator::update(waipc::timesync::LinearEstimator *this, _OWORD *a2)
{
  uint64_t v4;
  _OWORD *v5;
  void **v6;
  unint64_t v7;
  _OWORD *v8;
  char *v9;
  unint64_t v10;
  _OWORD *v11;
  _OWORD *v12;
  __int128 v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  __int128 v22;

  v4 = *((_QWORD *)this + 3);
  v5 = (_OWORD *)*((_QWORD *)this + 4);
  v6 = (void **)((char *)this + 24);
  v7 = ((uint64_t)v5 - v4) >> 5;
  if (v7 >= *((_QWORD *)this + 1))
  {
    v12 = (_OWORD *)(v4 + 32 * *((_QWORD *)this + 6));
    v13 = a2[1];
    *v12 = *a2;
    v12[1] = v13;
    *((_QWORD *)this + 6) = (*((_QWORD *)this + 6) + 1)
                          % (unint64_t)((uint64_t)(*((_QWORD *)this + 4) - *((_QWORD *)this + 3)) >> 5);
  }
  else
  {
    v8 = a2 + 1;
    v9 = (char *)this + 40;
    v10 = *((_QWORD *)this + 5);
    if ((unint64_t)v5 >= v10)
    {
      v14 = v7 + 1;
      if ((v7 + 1) >> 59)
        std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
      v15 = v10 - v4;
      if (v15 >> 4 > v14)
        v14 = v15 >> 4;
      if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFE0)
        v16 = 0x7FFFFFFFFFFFFFFLL;
      else
        v16 = v14;
      if (v16)
        v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<waipc::timesync::Estimator::timestamp,waipc::timesync::Estimator::timestamp>>>((uint64_t)v9, v16);
      else
        v17 = 0;
      v18 = &v17[32 * v7];
      v19 = &v17[32 * v16];
      *(_OWORD *)v18 = *a2;
      *((_OWORD *)v18 + 1) = *v8;
      v11 = v18 + 32;
      v21 = (char *)*((_QWORD *)this + 3);
      v20 = (char *)*((_QWORD *)this + 4);
      if (v20 != v21)
      {
        do
        {
          v22 = *((_OWORD *)v20 - 1);
          *((_OWORD *)v18 - 2) = *((_OWORD *)v20 - 2);
          *((_OWORD *)v18 - 1) = v22;
          v18 -= 32;
          v20 -= 32;
        }
        while (v20 != v21);
        v20 = (char *)*v6;
      }
      *((_QWORD *)this + 3) = v18;
      *((_QWORD *)this + 4) = v11;
      *((_QWORD *)this + 5) = v19;
      if (v20)
        operator delete(v20);
    }
    else
    {
      *v5 = *a2;
      v5[1] = *v8;
      v11 = v5 + 2;
    }
    *((_QWORD *)this + 4) = v11;
  }
  return waipc::timesync::LinearEstimator::updateEstimate(this);
}

uint64_t waipc::timesync::LinearEstimator::deviceToHost(uint64_t a1)
{
  return *(_QWORD *)(a1 + 56);
}

double waipc::timesync::LinearEstimator::hostToDevice(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(double *)(a1 + 80)
       + (*(double *)&a3 - *(double *)(a1 + 64) + (double)(a2 - *(_QWORD *)(a1 + 56)) - *(double *)(a1 + 88))
       / *(double *)(a1 + 96);
}

char **waipc::timesync::LinearEstimator::dumpState(waipc::timesync::LinearEstimator *this)
{
  uint64_t v2;
  uint64_t i;
  const void *v4;
  char **v5;
  char *v7[3];
  CFTypeRef cf;
  char **v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x24BDAC8D0];
  memset(v7, 0, sizeof(v7));
  v10 = *(_OWORD *)((char *)this + 88);
  std::vector<applesauce::CF::NumberRef>::reserve(v7, 2uLL);
  v2 = 0;
  v9 = v7;
  do
  {
    ___ZNK5waipc8timesync15LinearEstimator9dumpStateEv_block_invoke((CFNumberRef *)&cf, *(double *)((char *)&v10 + v2));
    std::back_insert_iterator<std::vector<applesauce::CF::NumberRef>>::operator=[abi:ne180100](&v9, &cf);
    if (cf)
      CFRelease(cf);
    v2 += 8;
  }
  while (v2 != 16);
  *(_QWORD *)&v10 = CFSTR("Base");
  *((_QWORD *)&v10 + 1) = 0;
  cf = 0;
  waipc::util::_kv::_kv<unsigned long const&,void>(&v11, (uint64_t)CFSTR("Limit"), (uint64_t *)this + 1);
  waipc::util::_kv::_kv<double const&,void>(&v12, (uint64_t)CFSTR("Nominal Rate"), (uint64_t *)this + 2);
  waipc::util::_kv::_kv<unsigned long const&,void>(&v13, (uint64_t)CFSTR("Index"), (uint64_t *)this + 6);
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v14, (uint64_t)CFSTR("Norm Host Int"), (uint64_t *)this + 7);
  waipc::util::_kv::_kv<double const&,void>(&v15, (uint64_t)CFSTR("Norm Host Frac"), (uint64_t *)this + 8);
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v16, (uint64_t)CFSTR("Norm Device Int"), (uint64_t *)this + 9);
  waipc::util::_kv::_kv<double const&,void>(v17, (uint64_t)CFSTR("Norm Device Frac"), (uint64_t *)this + 10);
  v17[2] = CFSTR("Estimate");
  v17[3] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::NumberRef>((uint64_t **)v7);
  waipc::util::createCFDictDropNull<9l>((uint64_t)&v10, (applesauce::CF::DictionaryRef *)&v9);
  for (i = 136; i != -8; i -= 16)
  {
    v4 = *(const void **)((char *)&v10 + i);
    if (v4)
      CFRelease(v4);
  }
  if (cf)
    CFRelease(cf);
  v5 = v9;
  *(_QWORD *)&v10 = v7;
  std::vector<applesauce::CF::NumberRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&v10);
  return v5;
}

void sub_21ABBFE1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

CFNumberRef ___ZNK5waipc8timesync15LinearEstimator9dumpStateEv_block_invoke@<X0>(CFNumberRef *a1@<X8>, double a2@<D0>)
{
  CFNumberRef result;
  void *exception;
  double valuePtr;

  valuePtr = a2;
  result = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  *a1 = result;
  if (!result)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x220752F14](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return result;
}

void sub_21ABBFF20(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::vector<applesauce::CF::NumberRef>::reserve(char **a1, unint64_t a2)
{
  uint64_t result;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int64x2_t v12;
  char *v13;
  uint64_t v14;
  int64x2_t v15;
  char *v16;
  uint64_t v17;

  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v17 = result;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(result, a2);
    v9 = *a1;
    v8 = a1[1];
    if (v8 == *a1)
    {
      v12 = vdupq_n_s64((unint64_t)v8);
      v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
      do
      {
        v11 = *((_QWORD *)v8 - 1);
        v8 -= 8;
        *((_QWORD *)v10 - 1) = v11;
        v10 -= 8;
        *(_QWORD *)v8 = 0;
      }
      while (v8 != v9);
      v12 = *(int64x2_t *)a1;
    }
    *a1 = v10;
    a1[1] = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v15 = v12;
    v13 = a1[2];
    a1[2] = &v6[8 * v7];
    v16 = v13;
    v14 = v12.i64[0];
    return std::__split_buffer<applesauce::CF::NumberRef>::~__split_buffer((uint64_t)&v14);
  }
  return result;
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<9l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3;
  CFIndex v4;
  void *v5;
  uint64_t v6;
  CFDictionaryRef v7;
  _OWORD v9[4];
  uint64_t v10;
  void *keys[2];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v3 = 0;
  v4 = 0;
  v16 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v13 = 0u;
  v14 = 0u;
  *(_OWORD *)keys = 0u;
  v12 = 0u;
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  do
  {
    v5 = *(void **)(a1 + v3);
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        *((_QWORD *)v9 + v4++) = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 144);
  v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)v9, v4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

double waipc::timesync::KalmanEstimator::KalmanEstimator(uint64_t a1, __int128 *a2, uint64_t a3)
{
  __int128 v3;
  double result;
  uint64_t v5;

  *(_QWORD *)a1 = &off_24DDBC1E0;
  v3 = *a2;
  *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)a3;
  *(_QWORD *)&v3 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = v3;
  result = *(double *)(a3 + 32);
  v5 = *((_QWORD *)a2 + 1);
  *(double *)(a1 + 80) = result;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = v5;
  return result;
}

{
  __int128 v3;
  double result;
  uint64_t v5;

  *(_QWORD *)a1 = &off_24DDBC1E0;
  v3 = *a2;
  *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)a3;
  *(_QWORD *)&v3 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = v3;
  result = *(double *)(a3 + 32);
  v5 = *((_QWORD *)a2 + 1);
  *(double *)(a1 + 80) = result;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = v5;
  return result;
}

long double waipc::timesync::KalmanEstimator::computeEstimate@<D0>(waipc::timesync::KalmanEstimator *this@<X0>, long double a2@<D0>, double *a3@<X8>)
{
  long double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  long double v13;
  long double v14;
  double v15;
  double v16;
  long double v17;
  long double v18;
  long double v19;
  double v20;
  double v21;
  long double v22;
  long double result;

  v6 = pow(a2, 3.0);
  v7 = *((double *)this + 8);
  v8 = *((double *)this + 9);
  *a3 = v7 + 0.0 + a2 * v8;
  a3[1] = v8 + v7 * 0.0 + 0.0;
  v9 = *((double *)this + 10);
  v10 = *((double *)this + 11);
  v11 = *((double *)this + 12);
  v12 = *((double *)this + 13);
  v13 = v9 + 0.0 + a2 * v11;
  v14 = v10 + 0.0 + a2 * v12;
  v15 = v11 + v9 * 0.0 + 0.0;
  v16 = v12 + v10 * 0.0 + 0.0;
  v17 = v13 + 0.0 + v14 * a2;
  v18 = v13 * 0.0 + 0.0 + v14;
  v19 = v15 + 0.0 + v16 * a2;
  v20 = v15 * 0.0 + 0.0 + v16;
  v21 = *((double *)this + 3);
  v22 = a2 * a2 * 0.5 * v21;
  a3[2] = v17 + v6 / 3.0 * v21;
  a3[3] = v18 + v22;
  result = v20 + v21 * a2;
  a3[4] = v19 + v22;
  a3[5] = result;
  return result;
}

double waipc::timesync::KalmanEstimator::computeGain@<D0>(double *a1@<X0>, double *a2@<X8>, double a3@<D0>)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double result;

  v3 = a1[1];
  v4 = *a1 + 0.0;
  v5 = a1[2];
  v6 = a1[3];
  v7 = v4 + v5 * 0.0 + 0.0 + (v3 + 0.0 + v6 * 0.0) * 0.0 + a3;
  v8 = (v4 + v3 * 0.0) / v7;
  v9 = (v5 + 0.0 + v6 * 0.0) / v7;
  *a2 = v8;
  a2[1] = v9;
  v10 = 0.0 - (v9 + 0.0);
  a2[2] = 1.0 - (v8 + 0.0);
  a2[3] = 0.0 - (v8 * 0.0 + 0.0);
  result = 1.0 - (v9 * 0.0 + 0.0);
  a2[4] = v10;
  a2[5] = result;
  return result;
}

void waipc::timesync::KalmanEstimator::update(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  _OWORD *v5;
  NSObject *Logger;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;

  v4 = (_OWORD *)(a2 + 16);
  v5 = (_OWORD *)(a1 + 32);
  if (waipc::timesync::operator<(a2 + 16, a1 + 32))
  {
    Logger = waipc::logging::getLogger(0);
    if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_21ABB3000, Logger, OS_LOG_TYPE_INFO, "out-of-order time sync measurement", (uint8_t *)&v28, 2u);
    }
  }
  else
  {
    v7 = *(double *)(a2 + 8) - *(double *)(a1 + 56) + (double)(uint64_t)(*(_QWORD *)a2 - *(_QWORD *)(a1 + 48));
    waipc::timesync::KalmanEstimator::computeEstimate((waipc::timesync::KalmanEstimator *)a1, *(double *)(a2 + 24) - *(double *)(a1 + 40) + (double)(uint64_t)(*(_QWORD *)(a2 + 16) - *(_QWORD *)(a1 + 32)), &v28);
    v8 = *(double *)(a2 + 32);
    v9 = v8 + v30 + 0.0 + v32 * 0.0 + 0.0 + (v31 + 0.0 + v33 * 0.0) * 0.0;
    v10 = (v30 + 0.0 + v31 * 0.0) / v9;
    v11 = (v32 + 0.0 + v33 * 0.0) / v9;
    v12 = 1.0 - (v10 + 0.0);
    v13 = 0.0 - (v10 * 0.0 + 0.0);
    v14 = 0.0 - (v11 + 0.0);
    v15 = 1.0 - (v11 * 0.0 + 0.0);
    v16 = v7 - (v28 + 0.0 + v29 * 0.0);
    v17 = v28 + v10 * v16;
    v18 = v29 + v11 * v16;
    v19 = v12 * v30 + 0.0 + v13 * v32;
    v20 = v12 * v31 + 0.0 + v13 * v33;
    v21 = v14 * v30 + 0.0 + v15 * v32;
    v22 = v14 * v31 + 0.0 + v15 * v33;
    v23 = v19 * v12 + 0.0 + v20 * v13;
    v24 = v21 * v12 + 0.0 + v22 * v13;
    v25 = v21 * v14 + 0.0 + v22 * v15;
    v26 = v8 * v10;
    v27 = v8 * v11;
    *(double *)(a1 + 64) = v17;
    *(double *)(a1 + 72) = v18;
    *(double *)(a1 + 80) = v26 * v10 + 0.0 + v23;
    *(double *)(a1 + 88) = v26 * v11 + 0.0 + v19 * v14 + 0.0 + v20 * v15;
    *(double *)(a1 + 96) = v27 * v10 + 0.0 + v24;
    *(double *)(a1 + 104) = v27 * v11 + 0.0 + v25;
    *v5 = *v4;
    *(_OWORD *)(a1 + 48) = *(_OWORD *)a2;
    *(double *)(a1 + 64) = v17 - v7;
  }
}

BOOL waipc::timesync::operator<(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  unint64_t v4;
  double v5;
  double v6;
  unint64_t v7;
  double v8;
  char v9;
  char v10;

  waipc::timesync::Estimator::timestamp::normalize(a1);
  v4 = v3;
  v6 = v5;
  waipc::timesync::Estimator::timestamp::normalize(a2);
  if (v6 == v8)
    v9 = 0;
  else
    v9 = -127;
  if (v6 > v8)
    v9 = 1;
  if (v6 < v8)
    v9 = -1;
  if (v4 < v7)
    v10 = -1;
  else
    v10 = 1;
  if (v4 != v7)
    v9 = v10;
  return v9 != 129 && v9 < 0;
}

uint64_t waipc::timesync::KalmanEstimator::hostToDevice(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

double waipc::timesync::KalmanEstimator::deviceToHost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(double *)(a1 + 64)
       + *(double *)(a1 + 72) * (*(double *)&a3 - *(double *)(a1 + 40) + (double)(a2 - *(_QWORD *)(a1 + 32)))
       + *(double *)(a1 + 56);
}

double waipc::timesync::KalmanEstimator::deviceToHostVariance(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v4[6];

  waipc::timesync::KalmanEstimator::computeEstimate((waipc::timesync::KalmanEstimator *)a1, *(double *)&a3 - *(double *)(a1 + 40) + (double)(a2 - *(_QWORD *)(a1 + 32)), v4);
  return v4[2];
}

CFTypeRef waipc::timesync::KalmanEstimator::dumpState(waipc::timesync::KalmanEstimator *this)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t i;
  const void *v6;
  CFTypeRef v7;
  _QWORD v9[2];
  void (*v10)(uint64_t@<X0>, uint64_t@<X1>, CFArrayRef *@<X8>);
  void *v11;
  void *v12;
  char **v13[3];
  char *v14[3];
  CFTypeRef v15;
  CFTypeRef cf;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[8];

  v24[7] = *MEMORY[0x24BDAC8D0];
  memset(v14, 0, sizeof(v14));
  v17 = *((_OWORD *)this + 4);
  std::vector<applesauce::CF::NumberRef>::reserve(v14, 2uLL);
  v2 = 0;
  v13[0] = v14;
  do
  {
    ___ZNK5waipc8timesync15KalmanEstimator9dumpStateEv_block_invoke((CFNumberRef *)&cf, *(double *)((char *)&v17 + v2));
    std::back_insert_iterator<std::vector<applesauce::CF::NumberRef>>::operator=[abi:ne180100](v13, &cf);
    if (cf)
      CFRelease(cf);
    v2 += 8;
  }
  while (v2 != 16);
  memset(v13, 0, sizeof(v13));
  v3 = *((_OWORD *)this + 6);
  v17 = *((_OWORD *)this + 5);
  v18 = v3;
  std::vector<applesauce::CF::ArrayRef>::reserve((char **)v13, 2uLL);
  v4 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 0x40000000;
  v10 = ___ZNK5waipc8timesync15KalmanEstimator9dumpStateEv_block_invoke_2;
  v11 = &unk_24DDBC260;
  v12 = &__block_literal_global_19;
  cf = v13;
  do
  {
    ((void (*)(CFTypeRef *__return_ptr, _QWORD *, char *))v10)(&v15, v9, (char *)&v17 + v4);
    std::back_insert_iterator<std::vector<applesauce::CF::ArrayRef>>::operator=[abi:ne180100]((char ***)&cf, &v15);
    if (v15)
      CFRelease(v15);
    v4 += 16;
  }
  while (v4 != 32);
  *(_QWORD *)&v17 = CFSTR("Base");
  *((_QWORD *)&v17 + 1) = 0;
  v15 = 0;
  waipc::util::_kv::_kv<double const&,void>(&v18, (uint64_t)CFSTR("Nominal Rate"), (uint64_t *)this + 1);
  waipc::util::_kv::_kv<double const&,void>(&v19, (uint64_t)CFSTR("Rate Variance"), (uint64_t *)this + 2);
  waipc::util::_kv::_kv<double const&,void>(&v20, (uint64_t)CFSTR("Process Variance"), (uint64_t *)this + 3);
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v21, (uint64_t)CFSTR("Base Host Int"), (uint64_t *)this + 6);
  waipc::util::_kv::_kv<double const&,void>(&v22, (uint64_t)CFSTR("Base Host Frac"), (uint64_t *)this + 7);
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v23, (uint64_t)CFSTR("Base Device Int"), (uint64_t *)this + 4);
  waipc::util::_kv::_kv<double const&,void>(v24, (uint64_t)CFSTR("Base Device Frac"), (uint64_t *)this + 5);
  v24[2] = CFSTR("Estimate State");
  v24[3] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::NumberRef>((uint64_t **)v14);
  v24[4] = CFSTR("Estimate Covariance");
  v24[5] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::ArrayRef>((uint64_t **)v13);
  waipc::util::createCFDictDropNull<10l>((uint64_t)&v17, (applesauce::CF::DictionaryRef *)&cf);
  for (i = 152; i != -8; i -= 16)
  {
    v6 = *(const void **)((char *)&v17 + i);
    if (v6)
      CFRelease(v6);
  }
  if (v15)
    CFRelease(v15);
  v7 = cf;
  *(_QWORD *)&v17 = v13;
  std::vector<applesauce::CF::ArrayRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);
  *(_QWORD *)&v17 = v14;
  std::vector<applesauce::CF::NumberRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);
  return v7;
}

void sub_21ABC0884(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,char a21,int a22,__int16 a23,char a24,char a25,uint64_t a26)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

CFNumberRef ___ZNK5waipc8timesync15KalmanEstimator9dumpStateEv_block_invoke@<X0>(CFNumberRef *a1@<X8>, double a2@<D0>)
{
  CFNumberRef result;
  void *exception;
  double valuePtr;

  valuePtr = a2;
  result = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  *a1 = result;
  if (!result)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x220752F14](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return result;
}

void sub_21ABC09B8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::vector<applesauce::CF::ArrayRef>::reserve(char **a1, unint64_t a2)
{
  uint64_t result;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int64x2_t v12;
  char *v13;
  uint64_t v14;
  int64x2_t v15;
  char *v16;
  uint64_t v17;

  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v17 = result;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(result, a2);
    v9 = *a1;
    v8 = a1[1];
    if (v8 == *a1)
    {
      v12 = vdupq_n_s64((unint64_t)v8);
      v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
      do
      {
        v11 = *((_QWORD *)v8 - 1);
        v8 -= 8;
        *((_QWORD *)v10 - 1) = v11;
        v10 -= 8;
        *(_QWORD *)v8 = 0;
      }
      while (v8 != v9);
      v12 = *(int64x2_t *)a1;
    }
    *a1 = v10;
    a1[1] = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v15 = v12;
    v13 = a1[2];
    a1[2] = &v6[8 * v7];
    v16 = v13;
    v14 = v12.i64[0];
    return std::__split_buffer<applesauce::CF::ArrayRef>::~__split_buffer((uint64_t)&v14);
  }
  return result;
}

void ___ZNK5waipc8timesync15KalmanEstimator9dumpStateEv_block_invoke_2(uint64_t a1@<X0>, uint64_t a2@<X1>, CFArrayRef *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8[3];
  CFTypeRef cf;
  char **v10;
  char **v11;

  memset(v8, 0, sizeof(v8));
  std::vector<applesauce::CF::NumberRef>::reserve(v8, 2uLL);
  v6 = 0;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v8;
  do
  {
    (*(void (**)(CFTypeRef *__return_ptr, uint64_t, double))(v7 + 16))(&cf, v7, *(double *)(a2 + v6));
    std::back_insert_iterator<std::vector<applesauce::CF::NumberRef>>::operator=[abi:ne180100](&v10, &cf);
    if (cf)
      CFRelease(cf);
    v6 += 8;
  }
  while (v6 != 16);
  *a3 = applesauce::CF::details::make_CFArrayRef<applesauce::CF::NumberRef>((uint64_t **)v8);
  v11 = v8;
  std::vector<applesauce::CF::NumberRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&v11);
}

void sub_21ABC0B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void **a14)
{
  a14 = (void **)&a9;
  std::vector<applesauce::CF::NumberRef>::__destroy_vector::operator()[abi:ne180100](&a14);
  _Unwind_Resume(a1);
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<10l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3;
  CFIndex v4;
  void *v5;
  uint64_t v6;
  CFDictionaryRef v7;
  _OWORD v9[5];
  void *keys[2];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v3 = 0;
  v4 = 0;
  v15 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  *(_OWORD *)keys = 0u;
  memset(v9, 0, sizeof(v9));
  do
  {
    v5 = *(void **)(a1 + v3);
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        *((_QWORD *)v9 + v4++) = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 160);
  v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)v9, v4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

double waipc::timesync::KalmanEstimator::fixed@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>)
{
  double result;

  *(_QWORD *)a5 = &off_24DDBC1E0;
  *(double *)(a5 + 8) = a6;
  *(_QWORD *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 24) = 0;
  *(_QWORD *)(a5 + 32) = a3;
  *(_QWORD *)(a5 + 40) = a4;
  *(_QWORD *)(a5 + 48) = a1;
  *(_QWORD *)(a5 + 56) = a2;
  *(_QWORD *)(a5 + 64) = 0;
  *(double *)(a5 + 72) = a6;
  result = 0.0;
  *(_OWORD *)(a5 + 80) = 0u;
  *(_OWORD *)(a5 + 96) = 0u;
  return result;
}

void waipc::timesync::LinearEstimator::~LinearEstimator(waipc::timesync::LinearEstimator *this)
{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 3);
  if (v2)
  {
    *((_QWORD *)this + 4) = v2;
    operator delete(v2);
  }
}

{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 3);
  if (v2)
  {
    *((_QWORD *)this + 4) = v2;
    operator delete(v2);
  }
  JUMPOUT(0x220752F74);
}

uint64_t waipc::timesync::LinearEstimator::baseDeviceTime(waipc::timesync::LinearEstimator *this)
{
  return *((_QWORD *)this + 9);
}

void waipc::timesync::KalmanEstimator::~KalmanEstimator(waipc::timesync::KalmanEstimator *this)
{
  JUMPOUT(0x220752F74);
}

uint64_t waipc::timesync::KalmanEstimator::baseDeviceTime(waipc::timesync::KalmanEstimator *this)
{
  return *((_QWORD *)this + 4);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<waipc::timesync::Estimator::timestamp,waipc::timesync::Estimator::timestamp>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(32 * a2);
}

void std::__destroy_at[abi:ne180100]<applesauce::CF::NumberRef,0>(const void **a1)
{
  const void *v1;

  v1 = *a1;
  if (v1)
    CFRelease(v1);
}

void applesauce::CF::NumberRef::~NumberRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

uint64_t std::__split_buffer<applesauce::CF::NumberRef>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;
    std::__destroy_at[abi:ne180100]<applesauce::CF::NumberRef,0>((const void **)(i - 8));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

char ***std::back_insert_iterator<std::vector<applesauce::CF::NumberRef>>::operator=[abi:ne180100](char ***a1, _QWORD *a2)
{
  char **v4;
  char *v5;
  char **v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  _QWORD v24[2];
  char *v25;
  char *v26;
  uint64_t v27;

  v4 = *a1;
  v5 = (*a1)[1];
  v6 = *a1;
  v9 = (unint64_t)v6[2];
  v7 = (uint64_t)(v6 + 2);
  v8 = v9;
  if ((unint64_t)v5 >= v9)
  {
    v11 = *v4;
    v12 = (v5 - *v4) >> 3;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 61)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v14 = v8 - (_QWORD)v11;
    if (v14 >> 2 > v13)
      v13 = v14 >> 2;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8)
      v15 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v15 = v13;
    v27 = v7;
    if (v15)
    {
      v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(v7, v15);
      v11 = *v4;
      v5 = v4[1];
    }
    else
    {
      v16 = 0;
    }
    v17 = &v16[8 * v12];
    v18 = &v16[8 * v15];
    v26 = v18;
    *(_QWORD *)v17 = *a2;
    *a2 = 0;
    v25 = v17 + 8;
    if (v5 == v11)
    {
      v10 = v17 + 8;
    }
    else
    {
      do
      {
        v19 = *((_QWORD *)v5 - 1);
        v5 -= 8;
        *((_QWORD *)v17 - 1) = v19;
        v17 -= 8;
        *(_QWORD *)v5 = 0;
      }
      while (v5 != v11);
      v10 = v25;
      v18 = v26;
    }
    v20 = *v4;
    *v4 = v17;
    v24[0] = v20;
    v24[1] = v20;
    v21 = v4[1];
    v4[1] = v10;
    v25 = v21;
    v22 = v4[2];
    v4[2] = v18;
    v26 = v22;
    std::__split_buffer<applesauce::CF::NumberRef>::~__split_buffer((uint64_t)v24);
  }
  else
  {
    *(_QWORD *)v5 = *a2;
    v10 = v5 + 8;
    *a2 = 0;
  }
  v4[1] = v10;
  return a1;
}

void std::vector<applesauce::CF::NumberRef>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  const void **v2;
  const void **v4;
  void *v5;

  v1 = *a1;
  v2 = (const void **)**a1;
  if (v2)
  {
    v4 = (const void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
        std::__destroy_at[abi:ne180100]<applesauce::CF::NumberRef,0>(--v4);
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

double waipc::timesync::Estimator::timestamp::normalize(uint64_t a1)
{
  long double v1;
  double v2;
  double v3;
  double __y;

  v1 = *(double *)(a1 + 8);
  __y = 0.0;
  v2 = modf(v1, &__y);
  v3 = 0.0;
  if (v2 < 0.0)
    v3 = 1.0;
  return v2 + v3;
}

void std::__destroy_at[abi:ne180100]<applesauce::CF::ArrayRef,0>(const void **a1)
{
  const void *v1;

  v1 = *a1;
  if (v1)
    CFRelease(v1);
}

void applesauce::CF::ArrayRef::~ArrayRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

uint64_t std::__split_buffer<applesauce::CF::ArrayRef>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;
    std::__destroy_at[abi:ne180100]<applesauce::CF::ArrayRef,0>((const void **)(i - 8));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

char ***std::back_insert_iterator<std::vector<applesauce::CF::ArrayRef>>::operator=[abi:ne180100](char ***a1, _QWORD *a2)
{
  char **v4;
  char *v5;
  char **v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  _QWORD v24[2];
  char *v25;
  char *v26;
  uint64_t v27;

  v4 = *a1;
  v5 = (*a1)[1];
  v6 = *a1;
  v9 = (unint64_t)v6[2];
  v7 = (uint64_t)(v6 + 2);
  v8 = v9;
  if ((unint64_t)v5 >= v9)
  {
    v11 = *v4;
    v12 = (v5 - *v4) >> 3;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 61)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v14 = v8 - (_QWORD)v11;
    if (v14 >> 2 > v13)
      v13 = v14 >> 2;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8)
      v15 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v15 = v13;
    v27 = v7;
    if (v15)
    {
      v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(v7, v15);
      v11 = *v4;
      v5 = v4[1];
    }
    else
    {
      v16 = 0;
    }
    v17 = &v16[8 * v12];
    v18 = &v16[8 * v15];
    v26 = v18;
    *(_QWORD *)v17 = *a2;
    *a2 = 0;
    v25 = v17 + 8;
    if (v5 == v11)
    {
      v10 = v17 + 8;
    }
    else
    {
      do
      {
        v19 = *((_QWORD *)v5 - 1);
        v5 -= 8;
        *((_QWORD *)v17 - 1) = v19;
        v17 -= 8;
        *(_QWORD *)v5 = 0;
      }
      while (v5 != v11);
      v10 = v25;
      v18 = v26;
    }
    v20 = *v4;
    *v4 = v17;
    v24[0] = v20;
    v24[1] = v20;
    v21 = v4[1];
    v4[1] = v10;
    v25 = v21;
    v22 = v4[2];
    v4[2] = v18;
    v26 = v22;
    std::__split_buffer<applesauce::CF::ArrayRef>::~__split_buffer((uint64_t)v24);
  }
  else
  {
    *(_QWORD *)v5 = *a2;
    v10 = v5 + 8;
    *a2 = 0;
  }
  v4[1] = v10;
  return a1;
}

void std::vector<applesauce::CF::ArrayRef>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  const void **v2;
  const void **v4;
  void *v5;

  v1 = *a1;
  v2 = (const void **)**a1;
  if (v2)
  {
    v4 = (const void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
        std::__destroy_at[abi:ne180100]<applesauce::CF::ArrayRef,0>(--v4);
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

_QWORD *waipc::util::_kv::_kv<unsigned long const&,void>(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  CFNumberRef v4;
  void *exception;
  uint64_t valuePtr;

  *a1 = a2;
  valuePtr = *a3;
  v4 = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x220752F14](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_21ABC12B0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  const void *v3;

  v3 = *(const void **)(v1 + 8);
  if (v3)
    CFRelease(v3);
  _Unwind_Resume(exception_object);
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<applesauce::CF::NumberRef>(uint64_t **a1)
{
  uint64_t *v2;
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;
  CFArrayRef CFArray;
  void *__p[3];

  std::vector<void const*>::vector(__p, a1[1] - *a1);
  v2 = *a1;
  v3 = a1[1];
  if (*a1 != v3)
  {
    v4 = __p[0];
    do
    {
      v5 = *v2++;
      *v4++ = v5;
    }
    while (v2 != v3);
  }
  CFArray = applesauce::CF::details::make_CFArrayRef<void const*>((uint64_t)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return CFArray;
}

void sub_21ABC1354(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<applesauce::CF::ArrayRef>(uint64_t **a1)
{
  uint64_t *v2;
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;
  CFArrayRef CFArray;
  void *__p[3];

  std::vector<void const*>::vector(__p, a1[1] - *a1);
  v2 = *a1;
  v3 = a1[1];
  if (*a1 != v3)
  {
    v4 = __p[0];
    do
    {
      v5 = *v2++;
      *v4++ = v5;
    }
    while (v2 != v3);
  }
  CFArray = applesauce::CF::details::make_CFArrayRef<void const*>((uint64_t)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return CFArray;
}

void sub_21ABC13E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double waipc::util::TimestampConverter::defaultHostPeriod(waipc::util::TimestampConverter *this)
{
  if (waipc::util::TimestampConverter::defaultHostPeriod(void)::sOnce != -1)
    dispatch_once(&waipc::util::TimestampConverter::defaultHostPeriod(void)::sOnce, &__block_literal_global_0);
  return *(double *)&waipc::util::TimestampConverter::defaultHostPeriod(void)::result;
}

double ___ZN5waipc4util18TimestampConverter17defaultHostPeriodEv_block_invoke()
{
  unint64_t v0;
  unint64_t v1;
  double result;
  mach_timebase_info info;

  mach_timebase_info(&info);
  LODWORD(v0) = info.numer;
  LODWORD(v1) = info.denom;
  result = (double)v0 / (double)v1;
  waipc::util::TimestampConverter::defaultHostPeriod(void)::result = *(_QWORD *)&result;
  return result;
}

void waipc::util::createSerialQueueWithQosAndTarget(waipc::util *this@<X0>, const char *a2@<X1>, NSObject *a3@<X2>, NSObject **a4@<X8>)
{
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;

  v8 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a2, 0);
  v9 = dispatch_queue_create_with_target_V2((const char *)this, v8, a3);
  v10 = v9;
  if (v9)
    dispatch_retain(v9);
  *a4 = v10;
  dispatch_release(v10);
}

char *waipc::util::createStateData(CFPropertyListRef propertyList, const char *a2, CFErrorRef *error, __CFError **a4)
{
  const __CFAllocator *v6;
  CFDataRef Data;
  CFIndex Length;
  size_t v9;
  __CFError *v10;
  char *v11;
  char *v12;
  const UInt8 *BytePtr;
  CFDataRef theData;

  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x24BDBD240], propertyList, kCFPropertyListBinaryFormat_v1_0, 0, error);
  applesauce::CF::DataRef::DataRef((applesauce::CF::DataRef *)&theData, Data);
  if (!theData)
    return 0;
  Length = CFDataGetLength(theData);
  v9 = Length;
  if (Length <= 0x8000)
  {
    v12 = (char *)malloc_type_malloc(Length + 200, 0xB8BABC0CuLL);
    v11 = v12;
    if (v12)
    {
      *(_DWORD *)v12 = 1;
      *((_DWORD *)v12 + 1) = v9;
      *(_OWORD *)(v12 + 8) = 0u;
      *(_OWORD *)(v12 + 24) = 0u;
      *(_OWORD *)(v12 + 40) = 0u;
      *(_OWORD *)(v12 + 56) = 0u;
      *(_OWORD *)(v12 + 72) = 0u;
      *(_OWORD *)(v12 + 88) = 0u;
      *(_OWORD *)(v12 + 104) = 0u;
      *(_OWORD *)(v12 + 120) = 0u;
      *(_OWORD *)(v12 + 152) = 0u;
      *(_OWORD *)(v12 + 168) = 0u;
      *(_OWORD *)(v12 + 184) = 0u;
      *(_OWORD *)(v12 + 136) = 0u;
      strlcpy(v12 + 136, a2, 0x40uLL);
      BytePtr = CFDataGetBytePtr(theData);
      memcpy(v11 + 200, BytePtr, v9);
      goto LABEL_12;
    }
    if (error)
    {
      v10 = CFErrorCreate(v6, (CFErrorDomain)*MEMORY[0x24BDBD388], -536870211, 0);
      goto LABEL_10;
    }
  }
  else if (error)
  {
    v10 = CFErrorCreate(v6, (CFErrorDomain)*MEMORY[0x24BDBD388], -536870206, 0);
LABEL_10:
    v11 = 0;
    *error = v10;
    goto LABEL_12;
  }
  v11 = 0;
LABEL_12:
  if (theData)
    CFRelease(theData);
  return v11;
}

void sub_21ABC1654(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::DataRef::~DataRef((const void **)va);
  _Unwind_Resume(a1);
}

void applesauce::CF::DataRef::~DataRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

mach_port_context_t waipc::util::NonblockingEventSource::NonblockingEventSource(mach_port_context_t context, NSObject *a2, uint64_t a3, uint64_t a4)
{
  _DWORD *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  const void *v14;
  _QWORD v16[6];
  mach_port_name_t v17;
  _QWORD v18[7];
  mach_port_name_t v19;
  _QWORD handler[6];
  mach_port_name_t v21;
  mach_port_options_t options;
  mach_port_name_t name;

  *(_QWORD *)context = 0;
  *(_QWORD *)(context + 8) = 0;
  name = 0;
  options.8 = 0uLL;
  *(_QWORD *)&options.flags = 0x100000033;
  if (!mach_port_construct(*MEMORY[0x24BDAEC58], &options, context, &name))
  {
    v8 = (_DWORD *)operator new();
    *v8 = 0;
    v9 = dispatch_source_create(MEMORY[0x24BDAC9E0], name, 0, a2);
    v10 = *(NSObject **)context;
    *(_QWORD *)context = v9;
    if (v10)
    {
      dispatch_release(v10);
      v9 = *(NSObject **)context;
    }
    v11 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = ___ZN5waipc4util22NonblockingEventSourceC2EP16dispatch_queue_sU13block_pointerFvjEU13block_pointerFvvE_block_invoke;
    handler[3] = &unk_24DDBC308;
    v21 = name;
    handler[4] = a3;
    handler[5] = v8;
    dispatch_source_set_event_handler(v9, handler);
    v12 = *(NSObject **)context;
    v18[0] = v11;
    v18[1] = 0x40000000;
    v18[2] = ___ZN5waipc4util22NonblockingEventSourceC2EP16dispatch_queue_sU13block_pointerFvjEU13block_pointerFvvE_block_invoke_2;
    v18[3] = &unk_24DDBC330;
    v19 = name;
    v18[5] = v8;
    v18[6] = context;
    v18[4] = a4;
    dispatch_source_set_cancel_handler(v12, v18);
    dispatch_activate(*(dispatch_object_t *)context);
    v16[0] = v11;
    v16[1] = 0x40000000;
    v16[2] = ___ZN5waipc4util22NonblockingEventSourceC2EP16dispatch_queue_sU13block_pointerFvjEU13block_pointerFvvE_block_invoke_3;
    v16[3] = &__block_descriptor_tmp_6;
    v16[4] = context;
    v16[5] = v8;
    v17 = name;
    v13 = _Block_copy(v16);
    v14 = *(const void **)(context + 8);
    *(_QWORD *)(context + 8) = v13;
    if (v14)
      _Block_release(v14);
  }
  return context;
}

void sub_21ABC183C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  const void *v3;

  v3 = *(const void **)(v1 + 8);
  if (v3)
    _Block_release(v3);
  if (*(_QWORD *)v1)
    dispatch_release(*(dispatch_object_t *)v1);
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN5waipc4util22NonblockingEventSourceC2EP16dispatch_queue_sU13block_pointerFvjEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  uint64_t result;
  unsigned int *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[32];

  while (1)
  {
    memset(v6, 0, sizeof(v6));
    result = mach_msg((mach_msg_header_t *)v6, 258, 0, 0x20u, *(_DWORD *)(a1 + 48), 0, 0);
    if ((result & 0xFFFFC1FF) != 0)
      break;
    v3 = *(unsigned int **)(a1 + 40);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(0, v3));
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v4);
  }
  if ((result & 0xFFFFC1FF) != 0x10004003)
    ___ZN5waipc4util22NonblockingEventSourceC2EP16dispatch_queue_sU13block_pointerFvjEU13block_pointerFvvE_block_invoke_cold_1();
  return result;
}

uint64_t ___ZN5waipc4util22NonblockingEventSourceC2EP16dispatch_queue_sU13block_pointerFvjEU13block_pointerFvvE_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  free(*(void **)(a1 + 40));
  mach_port_destruct(*MEMORY[0x24BDAEC58], *(_DWORD *)(a1 + 56), -1, *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

intptr_t ___ZN5waipc4util22NonblockingEventSourceC2EP16dispatch_queue_sU13block_pointerFvjEU13block_pointerFvvE_block_invoke_3(uint64_t a1, int a2)
{
  intptr_t result;
  unsigned int *v5;
  unsigned int v6;
  mach_msg_header_t msg;

  result = dispatch_source_testcancel(**(dispatch_source_t **)(a1 + 32));
  if (!result)
  {
    v5 = *(unsigned int **)(a1 + 40);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 | a2, v5));
    *(_QWORD *)&msg.msgh_voucher_port = 0;
    msg.msgh_remote_port = *(_DWORD *)(a1 + 48);
    msg.msgh_local_port = 0;
    *(_QWORD *)&msg.msgh_bits = 0x1800000013;
    result = mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0);
    if ((result & 0xFFFFC1FF) != 0 && (result & 0xFFFFC1FF) != 0x10000004)
      ___ZN5waipc4util22NonblockingEventSourceC2EP16dispatch_queue_sU13block_pointerFvjEU13block_pointerFvvE_block_invoke_3_cold_1();
  }
  return result;
}

void waipc::util::NonblockingEventSource::~NonblockingEventSource(NSObject **this)
{
  NSObject *v2;
  NSObject *v3;

  v2 = *this;
  if (v2)
    dispatch_source_cancel(v2);
  v3 = this[1];
  if (v3)
    _Block_release(v3);
  if (*this)
    dispatch_release(*this);
}

void waipc::util::NonblockingEventSource::cancel(NSObject **this)
{
  NSObject *v1;

  v1 = *this;
  if (v1)
    dispatch_source_cancel(v1);
}

uint64_t waipc::util::NonblockingEventSource::trigger(waipc::util::NonblockingEventSource *this)
{
  if (!*(_QWORD *)this)
    waipc::util::NonblockingEventSource::trigger();
  return (*(uint64_t (**)(void))(*((_QWORD *)this + 1) + 16))();
}

BOOL waipc::util::NonblockingEventSource::operator BOOL(_QWORD *a1)
{
  return *a1 != 0;
}

BOOL waipc::util::NonblockingEventSource::testcancel(NSObject **this)
{
  NSObject *v1;

  v1 = *this;
  if (!v1)
    waipc::util::NonblockingEventSource::testcancel();
  return dispatch_source_testcancel(v1) != 0;
}

_QWORD *waipc::util::GroupErrorTimer::GroupErrorTimer(_QWORD *a1, dispatch_object_t object, uint64_t a3, NSObject *a4, void *a5)
{
  char *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  const char *v15;
  int v16;
  int v17;
  dispatch_object_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  char v22;
  uint64_t v23;
  __int128 v24;

  *a1 = 0;
  a1[1] = 0;
  if (!object)
  {
    v15 = "queue";
    v16 = 225;
    goto LABEL_13;
  }
  if (!a4)
  {
    v15 = "group";
    v16 = 226;
LABEL_13:
    __assert_rtn("GroupErrorTimer", "Util.cpp", v16, v15);
  }
  v17 = 0;
  dispatch_retain(object);
  v18 = object;
  v19 = a3;
  dispatch_retain(a4);
  *(_QWORD *)&v20 = a4;
  if (a5)
    a5 = _Block_copy(a5);
  v22 = 0;
  v10 = (char *)operator new(0x60uLL);
  *(_OWORD *)(v10 + 8) = 0u;
  *(_QWORD *)v10 = &off_24DDBC3F8;
  *((_DWORD *)v10 + 6) = 0;
  v18 = 0;
  *((_QWORD *)v10 + 4) = object;
  *((_QWORD *)v10 + 5) = a3;
  *((_QWORD *)v10 + 6) = a4;
  *((_QWORD *)v10 + 7) = a5;
  v20 = 0u;
  v21 = 0u;
  *((_OWORD *)v10 + 4) = 0u;
  v10[80] = 0;
  *((_QWORD *)v10 + 11) = 0;
  v23 = 0;
  *(_QWORD *)&v24 = v10 + 24;
  *((_QWORD *)&v24 + 1) = v10;
  std::shared_ptr<waipc::util::GroupErrorTimer::state>::operator=[abi:ne180100]((uint64_t)a1, &v24);
  v11 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
  if (*((_QWORD *)&v24 + 1))
  {
    v12 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  waipc::util::GroupErrorTimer::state::~state((waipc::util::GroupErrorTimer::state *)&v17);
  return a1;
}

void sub_21ABC1C04(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  va_list va;

  va_start(va, a2);
  waipc::util::GroupErrorTimer::state::~state((waipc::util::GroupErrorTimer::state *)va);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100](v2);
  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<waipc::util::GroupErrorTimer::state>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return a1;
}

void waipc::util::GroupErrorTimer::~GroupErrorTimer(os_unfair_lock_t *this)
{
  os_unfair_lock_s *v2;

  v2 = *this;
  if (*this)
  {
    os_unfair_lock_lock(*this);
    waipc::util::GroupErrorTimer::stopTimer((const os_unfair_lock **)this);
    os_unfair_lock_unlock(v2);
  }
  else
  {
    waipc::util::GroupErrorTimer::stopTimer((const os_unfair_lock **)this);
  }
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)this);
}

void waipc::util::GroupErrorTimer::stopTimer(const os_unfair_lock **a1)
{
  NSObject *v2;
  NSObject *v3;

  os_unfair_lock_assert_owner(*a1);
  v2 = *(NSObject **)&(*a1)[10]._os_unfair_lock_opaque;
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(NSObject **)&(*a1)[10]._os_unfair_lock_opaque;
    *(_QWORD *)&(*a1)[10]._os_unfair_lock_opaque = 0;
    if (v3)
      dispatch_release(v3);
  }
}

void waipc::util::GroupErrorTimer::start(os_unfair_lock_t *this, const __CFString *a2)
{
  os_unfair_lock_s *v4;

  v4 = *this;
  if (*this)
    os_unfair_lock_lock(*this);
  waipc::util::GroupErrorTimer::start_nl((uint64_t)this, a2);
  if (v4)
    os_unfair_lock_unlock(v4);
}

void sub_21ABC1D8C(_Unwind_Exception *exception_object)
{
  os_unfair_lock_s *v1;

  if (v1)
    os_unfair_lock_unlock(v1);
  _Unwind_Resume(exception_object);
}

void waipc::util::GroupErrorTimer::start_nl(uint64_t a1, const void *a2)
{
  const os_unfair_lock *v4;
  const void *v5;
  const void *v6;
  const os_unfair_lock *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_weak_owners;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  _QWORD v14[6];
  std::__shared_weak_count *v15;

  os_unfair_lock_assert_owner(*(const os_unfair_lock **)a1);
  v4 = *(const os_unfair_lock **)a1;
  if (*(_QWORD *)(*(_QWORD *)a1 + 40))
  {
    if (!LOBYTE(v4[14]._os_unfair_lock_opaque))
    {
      LOBYTE(v4[14]._os_unfair_lock_opaque) = 1;
      if (a2)
        CFRetain(a2);
      applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)v14, a2);
      v5 = *(const void **)(*(_QWORD *)a1 + 64);
      *(_QWORD *)(*(_QWORD *)a1 + 64) = v14[0];
      v14[0] = v5;
      if (v5)
        CFRelease(v5);
    }
  }
  else
  {
    if (a2)
      CFRetain(a2);
    applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)v14, a2);
    v6 = *(const void **)(*(_QWORD *)a1 + 48);
    *(_QWORD *)(*(_QWORD *)a1 + 48) = v14[0];
    v14[0] = v6;
    if (v6)
      CFRelease(v6);
    waipc::util::GroupErrorTimer::startTimer(a1);
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3802000000;
    v14[3] = __Block_byref_object_copy__1;
    v14[4] = __Block_byref_object_dispose__1;
    v7 = *(const os_unfair_lock **)a1;
    v8 = *(std::__shared_weak_count **)(a1 + 8);
    v14[5] = *(_QWORD *)a1;
    v15 = v8;
    if (v8)
    {
      p_shared_weak_owners = (unint64_t *)&v8->__shared_weak_owners_;
      do
        v10 = __ldxr(p_shared_weak_owners);
      while (__stxr(v10 + 1, p_shared_weak_owners));
      v7 = *(const os_unfair_lock **)a1;
    }
    v11 = *(NSObject **)&v7[6]._os_unfair_lock_opaque;
    v12 = *(NSObject **)&v7[2]._os_unfair_lock_opaque;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 0x40000000;
    v13[2] = ___ZN5waipc4util15GroupErrorTimer8start_nlERKNSt3__110shared_ptrINS1_5stateEEEPK10__CFString_block_invoke;
    v13[3] = &unk_24DDBC378;
    v13[4] = v14;
    dispatch_group_notify(v11, v12, v13);
    _Block_object_dispose(v14, 8);
    if (v15)
      std::__shared_weak_count::__release_weak(v15);
  }
}

void waipc::util::GroupErrorTimer::startTimer(uint64_t a1)
{
  const os_unfair_lock *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_weak_owners;
  unint64_t v5;
  const os_unfair_lock *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD v11[5];
  _QWORD handler[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  dispatch_object_t object;
  _QWORD v19[6];
  std::__shared_weak_count *v20;

  os_unfair_lock_assert_owner(*(const os_unfair_lock **)a1);
  v2 = *(const os_unfair_lock **)a1;
  if (*(_QWORD *)(*(_QWORD *)a1 + 40))
    waipc::util::GroupErrorTimer::startTimer();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3802000000;
  v19[3] = __Block_byref_object_copy__1;
  v19[4] = __Block_byref_object_dispose__1;
  v3 = *(std::__shared_weak_count **)(a1 + 8);
  v19[5] = v2;
  v20 = v3;
  if (v3)
  {
    p_shared_weak_owners = (unint64_t *)&v3->__shared_weak_owners_;
    do
      v5 = __ldxr(p_shared_weak_owners);
    while (__stxr(v5 + 1, p_shared_weak_owners));
    v2 = *(const os_unfair_lock **)a1;
  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x3002000000;
  v16 = __Block_byref_object_copy__13;
  v17 = __Block_byref_object_dispose__14;
  object = dispatch_source_create(MEMORY[0x24BDACA18], 1uLL, 0, *(dispatch_queue_t *)&v2[2]._os_unfair_lock_opaque);
  v11[4] = &v13;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 0x40000000;
  handler[2] = ___ZN5waipc4util15GroupErrorTimer10startTimerERKNSt3__110shared_ptrINS1_5stateEEE_block_invoke;
  handler[3] = &unk_24DDBC3A0;
  handler[4] = v19;
  handler[5] = &v13;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 0x40000000;
  v11[2] = ___ZN5waipc4util15GroupErrorTimer10startTimerERKNSt3__110shared_ptrINS1_5stateEEE_block_invoke_2;
  v11[3] = &unk_24DDBC3C8;
  v6 = *(const os_unfair_lock **)a1;
  v7 = v14[5];
  if (v7)
    dispatch_retain((dispatch_object_t)v14[5]);
  v8 = *(NSObject **)&v6[10]._os_unfair_lock_opaque;
  *(_QWORD *)&v6[10]._os_unfair_lock_opaque = v7;
  if (v8)
    dispatch_release(v8);
  dispatch_source_set_event_handler(*(dispatch_source_t *)(*(_QWORD *)a1 + 40), handler);
  dispatch_source_set_cancel_handler(*(dispatch_source_t *)(*(_QWORD *)a1 + 40), v11);
  v9 = *(NSObject **)(*(_QWORD *)a1 + 40);
  v10 = dispatch_time(0, *(_QWORD *)(*(_QWORD *)a1 + 16));
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, *(_QWORD *)(*(_QWORD *)a1 + 16));
  dispatch_activate(*(dispatch_object_t *)(*(_QWORD *)a1 + 40));
  _Block_object_dispose(&v13, 8);
  if (object)
    dispatch_release(object);
  _Block_object_dispose(v19, 8);
  if (v20)
    std::__shared_weak_count::__release_weak(v20);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void ___ZN5waipc4util15GroupErrorTimer8start_nlERKNSt3__110shared_ptrINS1_5stateEEEPK10__CFString_block_invoke(uint64_t a1)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  const void *v6;
  const void *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  const os_unfair_lock *v10[2];

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(std::__shared_weak_count **)(v1 + 48);
  if (v2)
  {
    v3 = std::__shared_weak_count::lock(v2);
    v10[1] = (const os_unfair_lock *)v3;
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)(v1 + 40);
      v10[0] = (const os_unfair_lock *)v5;
      if (v5)
      {
        os_unfair_lock_lock((os_unfair_lock_t)v5);
        waipc::util::GroupErrorTimer::stopTimer(v10);
        v6 = *(const void **)(v5 + 48);
        *(_QWORD *)(v5 + 48) = 0;
        if (v6)
          CFRelease(v6);
        if (*(_BYTE *)(v5 + 56))
        {
          *(_BYTE *)(v5 + 56) = 0;
          v7 = *(const void **)(v5 + 64);
          *(_QWORD *)(v5 + 64) = 0;
          if (*(_QWORD *)(v5 + 40))
            __assert_rtn("start_nl_block_invoke", "Util.cpp", 288, "!s->source");
          waipc::util::GroupErrorTimer::start_nl(v10, v7);
          if (v7)
            CFRelease(v7);
        }
        os_unfair_lock_unlock((os_unfair_lock_t)v5);
      }
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
}

void sub_21ABC2248(_Unwind_Exception *a1, uint64_t a2, ...)
{
  os_unfair_lock_s *v2;
  const void *v4;
  va_list va;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v4 = va_arg(va1, const void *);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  os_unfair_lock_unlock(v2);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 40);
  if (v1)
    dispatch_release(v1);
}

void ___ZN5waipc4util15GroupErrorTimer10startTimerERKNSt3__110shared_ptrINS1_5stateEEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  const void *v7;
  void (**v8)(void *, const void *);
  const void *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  const os_unfair_lock *v12[2];

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(std::__shared_weak_count **)(v2 + 48);
  if (v3)
  {
    v4 = std::__shared_weak_count::lock(v3);
    v12[1] = (const os_unfair_lock *)v4;
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)(v2 + 40);
      v12[0] = (const os_unfair_lock *)v6;
      if (v6)
      {
        os_unfair_lock_lock((os_unfair_lock_t)v6);
        if (dispatch_source_testcancel(*(dispatch_source_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)))
        {
          os_unfair_lock_unlock((os_unfair_lock_t)v6);
        }
        else
        {
          v7 = *(const void **)(v6 + 32);
          if (v7)
            v8 = (void (**)(void *, const void *))_Block_copy(v7);
          else
            v8 = 0;
          v9 = *(const void **)(v6 + 48);
          if (v9)
            CFRetain(*(CFTypeRef *)(v6 + 48));
          waipc::util::GroupErrorTimer::stopTimer(v12);
          os_unfair_lock_unlock((os_unfair_lock_t)v6);
          if (v8)
            v8[2](v8, v9);
          if (v9)
            CFRelease(v9);
          if (v8)
            _Block_release(v8);
        }
      }
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
}

void sub_21ABC23BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void *v2;
  const void *v4;
  va_list va;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v4 = va_arg(va1, const void *);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  _Block_release(v2);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void ___ZN5waipc4util15GroupErrorTimer10startTimerERKNSt3__110shared_ptrINS1_5stateEEE_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(NSObject **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;
  if (v2)
    dispatch_release(v2);
}

BOOL waipc::util::GroupErrorTimer::isRunning(os_unfair_lock_t *this)
{
  os_unfair_lock_s *v1;
  uint64_t v3;

  v1 = *this;
  if (*this)
  {
    os_unfair_lock_lock(*this);
    v3 = *(_QWORD *)&(*this)[10]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v1);
  }
  else
  {
    v3 = MEMORY[0x28];
  }
  return v3 != 0;
}

CFTypeRef waipc::util::GroupErrorTimer::copyReason(os_unfair_lock_t *this)
{
  os_unfair_lock_s *v2;
  const void *v3;
  CFTypeRef v4;

  v2 = *this;
  os_unfair_lock_lock(*this);
  v3 = *(const void **)&(*this)[12]._os_unfair_lock_opaque;
  if (v3)
    v4 = CFRetain(v3);
  else
    v4 = 0;
  os_unfair_lock_unlock(v2);
  return v4;
}

void sub_21ABC24A8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

applesauce::CF::DataRef *applesauce::CF::DataRef::DataRef(applesauce::CF::DataRef *this, CFTypeRef cf)
{
  CFTypeID v3;
  void *exception;

  *(_QWORD *)this = cf;
  if (cf)
  {
    v3 = CFGetTypeID(cf);
    if (v3 != CFDataGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x220752F14](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
  }
  return this;
}

void sub_21ABC2538(_Unwind_Exception *a1)
{
  CFTypeRef *v1;
  void *v2;

  __cxa_free_exception(v2);
  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(a1);
}

void waipc::util::GroupErrorTimer::state::~state(waipc::util::GroupErrorTimer::state *this)
{
  const void *v2;
  const void *v3;
  NSObject *v4;
  const void *v5;
  NSObject *v6;
  NSObject *v7;

  v2 = (const void *)*((_QWORD *)this + 8);
  if (v2)
    CFRelease(v2);
  v3 = (const void *)*((_QWORD *)this + 6);
  if (v3)
    CFRelease(v3);
  v4 = *((_QWORD *)this + 5);
  if (v4)
    dispatch_release(v4);
  v5 = (const void *)*((_QWORD *)this + 4);
  if (v5)
    _Block_release(v5);
  v6 = *((_QWORD *)this + 3);
  if (v6)
    dispatch_release(v6);
  v7 = *((_QWORD *)this + 1);
  if (v7)
    dispatch_release(v7);
}

void std::__shared_ptr_emplace<waipc::util::GroupErrorTimer::state>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDBC3F8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<waipc::util::GroupErrorTimer::state>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDBC3F8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x220752F74);
}

void std::__shared_ptr_emplace<waipc::util::GroupErrorTimer::state>::__on_zero_shared(uint64_t a1)
{
  waipc::util::GroupErrorTimer::state::~state((waipc::util::GroupErrorTimer::state *)(a1 + 24));
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_impl(a1, a2, OS_LOG_TYPE_DEFAULT, a4, &a9, 8u);
}

uint64_t waipc::BlockRing::BlockRing(uint64_t result, unsigned int *a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  unsigned int v5;
  unsigned int v6;

  *(_DWORD *)result = 0;
  *(_QWORD *)(result + 8) = a2;
  *(_QWORD *)(result + 16) = a3;
  *(_QWORD *)(result + 24) = a4;
  *(_DWORD *)(result + 32) = a5;
  v5 = atomic_load(a2);
  v6 = a5 + a5 * (-a5 / a5) - 1;
  *(_DWORD *)(result + 36) = v5;
  *(_DWORD *)(result + 40) = v6;
  if (!a5)
    waipc::BlockRing::BlockRing();
  if (a5 > v6 >> 1)
    waipc::BlockRing::BlockRing();
  return result;
}

uint64_t waipc::BlockRing::getBlock(const os_unfair_lock *this, unsigned int a2)
{
  os_unfair_lock_assert_owner(this);
  return *(_QWORD *)&this[4]._os_unfair_lock_opaque
       + *(_QWORD *)&this[6]._os_unfair_lock_opaque * (a2 % this[8]._os_unfair_lock_opaque);
}

uint64_t waipc::BlockRing::getNextWriteBlock_nl(const os_unfair_lock *this)
{
  uint32_t os_unfair_lock_opaque;

  os_unfair_lock_assert_owner(this);
  os_unfair_lock_opaque = this[9]._os_unfair_lock_opaque;
  os_unfair_lock_assert_owner(this);
  return *(_QWORD *)&this[4]._os_unfair_lock_opaque
       + *(_QWORD *)&this[6]._os_unfair_lock_opaque * (os_unfair_lock_opaque % this[8]._os_unfair_lock_opaque);
}

uint64_t waipc::BlockRing::getNextWriteBlock(os_unfair_lock_t lock)
{
  uint32_t os_unfair_lock_opaque;
  uint64_t v3;

  if (lock)
    os_unfair_lock_lock(lock);
  os_unfair_lock_assert_owner(lock);
  os_unfair_lock_opaque = lock[9]._os_unfair_lock_opaque;
  os_unfair_lock_assert_owner(lock);
  v3 = *(_QWORD *)&lock[4]._os_unfair_lock_opaque
     + *(_QWORD *)&lock[6]._os_unfair_lock_opaque * (os_unfair_lock_opaque % lock[8]._os_unfair_lock_opaque);
  os_unfair_lock_unlock(lock);
  return v3;
}

void waipc::BlockRing::commitWrite_nl(waipc::BlockRing *this)
{
  unsigned int v2;

  os_unfair_lock_assert_owner((const os_unfair_lock *)this);
  v2 = waipc::BlockRing::addWrapped(this, *((_DWORD *)this + 9), 1u);
  *((_DWORD *)this + 9) = v2;
  atomic_store(v2, *((unsigned int **)this + 1));
}

uint64_t waipc::BlockRing::addWrapped(waipc::BlockRing *this, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;

  v3 = *((_DWORD *)this + 10);
  if (v3 < a2)
    waipc::BlockRing::addWrapped();
  if (v3 < a3)
    waipc::BlockRing::addWrapped();
  if (v3 - a3 + 1 < a2)
    v4 = ~v3;
  else
    v4 = 0;
  return a3 + a2 + v4;
}

void waipc::BlockRing::commitWrite(os_unfair_lock_t lock)
{
  uint32_t v2;

  if (lock)
    os_unfair_lock_lock(lock);
  os_unfair_lock_assert_owner(lock);
  v2 = waipc::BlockRing::addWrapped((waipc::BlockRing *)lock, lock[9]._os_unfair_lock_opaque, 1u);
  lock[9]._os_unfair_lock_opaque = v2;
  atomic_store(v2, *(unsigned int **)&lock[2]._os_unfair_lock_opaque);
  os_unfair_lock_unlock(lock);
}

void sub_21ABC282C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::BlockRing::writeBlock(os_unfair_lock_t lock, void *a2)
{
  uint32_t os_unfair_lock_opaque;
  uint32_t v5;

  if (lock)
    os_unfair_lock_lock(lock);
  os_unfair_lock_assert_owner(lock);
  os_unfair_lock_opaque = lock[9]._os_unfair_lock_opaque;
  os_unfair_lock_assert_owner(lock);
  memcpy((void *)(*(_QWORD *)&lock[4]._os_unfair_lock_opaque+ *(_QWORD *)&lock[6]._os_unfair_lock_opaque * (os_unfair_lock_opaque % lock[8]._os_unfair_lock_opaque)), a2, *(_QWORD *)&lock[6]._os_unfair_lock_opaque);
  os_unfair_lock_assert_owner(lock);
  v5 = waipc::BlockRing::addWrapped((waipc::BlockRing *)lock, lock[9]._os_unfair_lock_opaque, 1u);
  lock[9]._os_unfair_lock_opaque = v5;
  atomic_store(v5, *(unsigned int **)&lock[2]._os_unfair_lock_opaque);
  os_unfair_lock_unlock(lock);
}

void sub_21ABC28CC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL waipc::BlockRing::readNextBlock(waipc::BlockRing *this, void *a2)
{
  unsigned int v4;
  _BOOL4 isWrappedLE;
  unsigned int i;
  unsigned int v7;
  unsigned int v8;

  if (this)
    os_unfair_lock_lock((os_unfair_lock_t)this);
  v4 = atomic_load(*((unsigned int **)this + 1));
  isWrappedLE = waipc::BlockRing::isWrappedLE(this, v4, *((_DWORD *)this + 9));
  if (!isWrappedLE)
  {
    for (i = *((_DWORD *)this + 9); ; *((_DWORD *)this + 9) = i)
    {
      os_unfair_lock_assert_owner((const os_unfair_lock *)this);
      memcpy(a2, (const void *)(*((_QWORD *)this + 2) + *((_QWORD *)this + 3) * (i % *((_DWORD *)this + 8))), *((_QWORD *)this + 3));
      v7 = atomic_load(*((unsigned int **)this + 1));
      v8 = waipc::BlockRing::subWrapped(this, v7, *((_DWORD *)this + 8));
      if (!waipc::BlockRing::isWrappedLE(this, *((_DWORD *)this + 9), v8))
        break;
      i = waipc::BlockRing::addWrapped(this, v8, 1u);
    }
    *((_DWORD *)this + 9) = waipc::BlockRing::addWrapped(this, *((_DWORD *)this + 9), 1u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)this);
  return !isWrappedLE;
}

void sub_21ABC29C4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL waipc::BlockRing::isWrappedLE(waipc::BlockRing *this, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  unsigned int v4;

  v3 = *((_DWORD *)this + 10);
  if (v3 < a2)
    waipc::BlockRing::isWrappedLE();
  if (v3 < a3)
    waipc::BlockRing::isWrappedLE();
  v4 = a3 - a2;
  if (a3 < a2)
    v4 = a3 - a2 + v3 + 1;
  return v4 < v3 >> 1;
}

uint64_t waipc::BlockRing::subWrapped(waipc::BlockRing *this, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  unsigned int v4;

  v3 = *((_DWORD *)this + 10);
  if (v3 < a2)
    waipc::BlockRing::subWrapped();
  if (v3 < a3)
    waipc::BlockRing::subWrapped();
  if (a2 < a3)
    v4 = v3 + 1;
  else
    v4 = 0;
  return a2 - a3 + v4;
}

BOOL waipc::BlockRing::isWrappedGT(waipc::BlockRing *this, unsigned int a2, unsigned int a3)
{
  return !waipc::BlockRing::isWrappedLE(this, a2, a3);
}

BOOL waipc::BlockRing::readLatestBlock(waipc::BlockRing *this, void *a2)
{
  unsigned int v4;
  _BOOL4 isWrappedLE;
  unsigned int v6;
  unsigned int v7;

  if (this)
    os_unfair_lock_lock((os_unfair_lock_t)this);
  v4 = atomic_load(*((unsigned int **)this + 1));
  isWrappedLE = waipc::BlockRing::isWrappedLE(this, v4, *((_DWORD *)this + 9));
  if (!isWrappedLE)
  {
    do
    {
      v6 = waipc::BlockRing::subWrapped(this, v4, 1u);
      *((_DWORD *)this + 9) = v6;
      os_unfair_lock_assert_owner((const os_unfair_lock *)this);
      memcpy(a2, (const void *)(*((_QWORD *)this + 2) + *((_QWORD *)this + 3) * (v6 % *((_DWORD *)this + 8))), *((_QWORD *)this + 3));
      v4 = atomic_load(*((unsigned int **)this + 1));
      v7 = waipc::BlockRing::subWrapped(this, v4, *((_DWORD *)this + 8));
    }
    while (waipc::BlockRing::isWrappedLE(this, *((_DWORD *)this + 9), v7));
    *((_DWORD *)this + 9) = waipc::BlockRing::addWrapped(this, *((_DWORD *)this + 9), 1u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)this);
  return !isWrappedLE;
}

void sub_21ABC2B68(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL waipc::BlockRing::isWrappedGE(waipc::BlockRing *this, unsigned int a2, unsigned int a3)
{
  return waipc::BlockRing::isWrappedLE(this, a3, a2);
}

BOOL waipc::BlockRing::isWrappedLT(waipc::BlockRing *this, unsigned int a2, unsigned int a3)
{
  return !waipc::BlockRing::isWrappedLE(this, a3, a2);
}

uint64_t waipc::BlockRing::getCurrentIndex(os_unfair_lock_t lock)
{
  uint64_t os_unfair_lock_opaque;

  if (lock)
    os_unfair_lock_lock(lock);
  os_unfair_lock_opaque = lock[9]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(lock);
  return os_unfair_lock_opaque;
}

uint64_t waipc::BlockRing::getLiveIndex(os_unfair_lock_t lock)
{
  uint64_t v2;

  if (lock)
    os_unfair_lock_lock(lock);
  v2 = atomic_load(*(unsigned int **)&lock[2]._os_unfair_lock_opaque);
  os_unfair_lock_unlock(lock);
  return v2;
}

uint64_t waipc::BlockRing::dumpState(waipc::BlockRing *this)
{
  unsigned int v2;
  uint64_t i;
  const void *v4;
  unsigned int v6;
  uint64_t v7;
  _QWORD v8[2];
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v2 = atomic_load(*((unsigned int **)this + 1));
  v6 = v2;
  waipc::util::_kv::_kv<unsigned int,void>(v8, (uint64_t)CFSTR("Live Index"), (int *)&v6);
  waipc::util::_kv::_kv<unsigned long const&,void>(&v9, (uint64_t)CFSTR("Block Size"), (uint64_t *)this + 3);
  waipc::util::_kv::_kv<unsigned int const&,void>(&v10, (uint64_t)CFSTR("Block Count"), (int *)this + 8);
  waipc::util::_kv::_kv<unsigned int const&,void>(v11, (uint64_t)CFSTR("Wrap Index"), (int *)this + 10);
  waipc::util::createCFDictDropNull<4l>((uint64_t)v8, (applesauce::CF::DictionaryRef *)&v7);
  for (i = 7; i != -1; i -= 2)
  {
    v4 = (const void *)v8[i];
    if (v4)
      CFRelease(v4);
  }
  return v7;
}

void sub_21ABC2D24(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t i;

  for (i = 48; i != -16; i -= 16)
    waipc::util::_kv::~_kv((waipc::util::_kv *)(v1 + i));
  _Unwind_Resume(a1);
}

_QWORD *waipc::util::_kv::_kv<unsigned int,void>(_QWORD *a1, uint64_t a2, int *a3)
{
  CFNumberRef v4;
  void *exception;
  int valuePtr;

  *a1 = a2;
  valuePtr = *a3;
  v4 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x220752F14](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_21ABC2E0C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  const void *v3;

  v3 = *(const void **)(v1 + 8);
  if (v3)
    CFRelease(v3);
  _Unwind_Resume(exception_object);
}

void NetworkUplinkClock_setTimesyncOverride(uint64_t *a1)
{
  uint64_t *v2;

  os_unfair_lock_lock((os_unfair_lock_t)&sTimesyncOverrideLock);
  v2 = timesyncOverrideStorage();
  std::shared_ptr<waipc::timesync::BasebandService>::operator=[abi:ne180100](v2, a1);
  os_unfair_lock_unlock((os_unfair_lock_t)&sTimesyncOverrideLock);
}

uint64_t *timesyncOverrideStorage(void)
{
  unsigned __int8 v0;

  {
    timesyncOverrideStorage(void)::sInstance = 0;
    unk_255110A70 = 0;
  }
  return &timesyncOverrideStorage(void)::sInstance;
}

{
  unsigned __int8 v0;

  {
    timesyncOverrideStorage(void)::sInstance = 0;
    unk_255110A90 = 0;
  }
  return &timesyncOverrideStorage(void)::sInstance;
}

_QWORD *std::shared_ptr<waipc::timesync::BasebandService>::operator=[abi:ne180100](_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v4 = *a2;
  v3 = a2[1];
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return a1;
}

void NetworkUplinkClock_getTimesyncOverride(uint64_t *a1@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  os_unfair_lock_lock((os_unfair_lock_t)&sTimesyncOverrideLock);
  v2 = timesyncOverrideStorage();
  v3 = v2[1];
  *a1 = *v2;
  a1[1] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sTimesyncOverrideLock);
}

void waipc::timesync::BasebandService::create(uint64_t a1@<X0>, NSObject *a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  waipc::timesync::BasebandService *v11[2];

  v6 = (_QWORD *)operator new();
  v7 = mach_continuous_time();
  waipc::timesync::BasebandService::BasebandService((uint64_t)v6, a1, a2, v7);
  std::shared_ptr<waipc::timesync::BasebandService>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandService,void>(v11, v6);
  if (v11[0])
  {
    waipc::timesync::BasebandService::init((os_unfair_lock *)v11[0]);
    *(_OWORD *)a3 = *(_OWORD *)v11;
  }
  else
  {
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    v8 = (std::__shared_weak_count *)v11[1];
    if (v11[1])
    {
      v9 = (unint64_t *)((char *)v11[1] + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }
}

void sub_21ABC305C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t waipc::timesync::BasebandService::init(os_unfair_lock *this)
{
  os_unfair_lock_s *v2;

  v2 = this + 8;
  os_unfair_lock_lock(this + 8);
  waipc::timesync::BasebandService::setupProvider(this);
  os_unfair_lock_unlock(v2);
  return 1;
}

void sub_21ABC30D0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t waipc::timesync::BasebandService::BasebandService(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  char *v13;
  char *v14;
  char *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  waipc::util::createSerialQueueWithQosAndTarget((waipc::util *)"com.apple.WirelessIPC.timesync.baseband", (const char *)0x15, a3, (NSObject **)(a1 + 16));
  *(_QWORD *)(a1 + 24) = a3;
  if (a3)
    dispatch_retain(a3);
  *(_DWORD *)(a1 + 32) = 0;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)a2;
  v8 = *(_OWORD *)(a2 + 16);
  v9 = *(_OWORD *)(a2 + 32);
  v10 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 88) = v10;
  *(_OWORD *)(a1 + 72) = v9;
  *(_OWORD *)(a1 + 56) = v8;
  v11 = *(_OWORD *)(a2 + 16);
  v12 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 144) = 0;
  *(_OWORD *)(a1 + 112) = v11;
  *(_OWORD *)(a1 + 128) = v12;
  *(_QWORD *)(a1 + 152) = 0;
  waipc::timesync::KalmanEstimator::fixed(a4, 0, 0, 0, a1 + 160, *(double *)(a2 + 32) / *(double *)(a2 + 40));
  *(_BYTE *)(a1 + 272) = 0;
  CFRetain(CFSTR("not started"));
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)(a1 + 280), CFSTR("not started"));
  *(_BYTE *)(a1 + 288) = 1;
  v13 = (char *)operator new(0x60uLL);
  *((_QWORD *)v13 + 1) = 0;
  *((_QWORD *)v13 + 2) = 0;
  *(_QWORD *)v13 = &off_24DDBC7F0;
  *(_OWORD *)(v13 + 40) = 0u;
  *(_OWORD *)(v13 + 56) = 0u;
  *(_OWORD *)(v13 + 72) = 0u;
  *((_QWORD *)v13 + 11) = 0;
  *(_OWORD *)(v13 + 24) = 0u;
  *(_QWORD *)(a1 + 296) = v13 + 24;
  *(_QWORD *)(a1 + 304) = v13;
  std::shared_ptr<waipc::timesync::LegacyBasebandProvider>::__enable_weak_this[abi:ne180100]<waipc::timesync::BasebandProvider,waipc::timesync::LegacyBasebandProvider,void>(a1 + 296, (_QWORD *)v13 + 3, (uint64_t)(v13 + 24));
  v14 = (char *)operator new(0x60uLL);
  *((_QWORD *)v14 + 1) = 0;
  *((_QWORD *)v14 + 2) = 0;
  *(_QWORD *)v14 = &off_24DDBC7A0;
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 56) = 0u;
  *(_OWORD *)(v14 + 72) = 0u;
  *((_QWORD *)v14 + 11) = 0;
  *(_OWORD *)(v14 + 24) = 0u;
  *(_QWORD *)(a1 + 312) = v14 + 24;
  *(_QWORD *)(a1 + 320) = v14;
  std::shared_ptr<waipc::timesync::LegacyBasebandProvider>::__enable_weak_this[abi:ne180100]<waipc::timesync::BasebandProvider,waipc::timesync::LegacyBasebandProvider,void>(a1 + 312, (_QWORD *)v14 + 3, (uint64_t)(v14 + 24));
  v15 = (char *)operator new(0x60uLL);
  *((_QWORD *)v15 + 1) = 0;
  *((_QWORD *)v15 + 2) = 0;
  *(_QWORD *)v15 = &off_24DDBC840;
  *(_OWORD *)(v15 + 40) = 0u;
  *(_OWORD *)(v15 + 56) = 0u;
  *(_OWORD *)(v15 + 72) = 0u;
  *((_QWORD *)v15 + 11) = 0;
  *(_OWORD *)(v15 + 24) = 0u;
  *(_QWORD *)(a1 + 328) = v15 + 24;
  *(_QWORD *)(a1 + 336) = v15;
  std::shared_ptr<waipc::timesync::LegacyBasebandProvider>::__enable_weak_this[abi:ne180100]<waipc::timesync::BasebandProvider,waipc::timesync::LegacyBasebandProvider,void>(a1 + 328, (_QWORD *)v15 + 3, (uint64_t)(v15 + 24));
  *(_QWORD *)(a1 + 344) = a1 + 352;
  *(_QWORD *)(a1 + 352) = 0;
  *(_QWORD *)(a1 + 376) = 0;
  *(_QWORD *)(a1 + 384) = 0;
  *(_QWORD *)(a1 + 360) = 0;
  *(_QWORD *)(a1 + 368) = a1 + 376;
  *(_QWORD *)(a1 + 400) = 0;
  *(_QWORD *)(a1 + 408) = 0;
  *(_QWORD *)(a1 + 392) = 0;
  v16 = dispatch_group_create();
  *(_QWORD *)(a1 + 416) = v16;
  *(_QWORD *)(a1 + 424) = v16;
  if (v16)
  {
    v17 = v16;
    dispatch_retain(v16);
    dispatch_group_enter(v17);
    v18 = *(NSObject **)(a1 + 416);
    *(_QWORD *)(a1 + 432) = v18;
    if (v18)
    {
      dispatch_retain(v18);
      dispatch_group_enter(v18);
    }
  }
  else
  {
    *(_QWORD *)(a1 + 432) = 0;
  }
  *(_DWORD *)(a1 + 440) = 0;
  return a1;
}

void sub_21ABC330C(_Unwind_Exception *a1)
{
  uint64_t v1;
  dispatch_object_t *v2;
  uint64_t v3;
  const void **v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v9;
  std::__shared_weak_count *v10;

  v7 = v6;
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100](v7);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100](v5);
  applesauce::CF::StringRef::~StringRef(v4);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100](v3);
  v9 = *(NSObject **)(v1 + 24);
  if (v9)
    dispatch_release(v9);
  if (*v2)
    dispatch_release(*v2);
  v10 = *(std::__shared_weak_count **)(v1 + 8);
  if (v10)
    std::__shared_weak_count::__release_weak(v10);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandService::~BasebandService(const os_unfair_lock *this)
{
  waipc::timesync::BasebandService *v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t *p_shared_weak_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  NSObject *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  waipc::timesync::BasebandService *v13;
  waipc::timesync::BasebandService *v14;
  BOOL v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  int v21;
  char *v22;
  char *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  const void *v30;
  NSObject *v31;
  NSObject *v32;
  std::__shared_weak_count *v33;

  os_unfair_lock_assert_not_owner(this + 8);
  if (LOBYTE(this[68]._os_unfair_lock_opaque))
  {
    if (!*(_QWORD *)&this[36]._os_unfair_lock_opaque)
      __assert_rtn("~BasebandService", "BasebandService.cpp", 76, "fProvider");
    v2 = *(waipc::timesync::BasebandService **)&this[86]._os_unfair_lock_opaque;
    if (v2 != (waipc::timesync::BasebandService *)&this[88])
    {
      do
      {
        v3 = (std::__shared_weak_count *)*((_QWORD *)v2 + 6);
        if (v3)
        {
          v4 = *((unsigned __int8 *)v2 + 32);
          v5 = *((_QWORD *)v2 + 5);
          p_shared_weak_owners = (unint64_t *)&v3->__shared_weak_owners_;
          do
            v7 = __ldxr(p_shared_weak_owners);
          while (__stxr(v7 + 1, p_shared_weak_owners));
          v8 = std::__shared_weak_count::lock(v3);
          if (v8)
          {
            v9 = v8;
            if (v5)
            {
              (*(void (**)(_QWORD, uint64_t, _QWORD))(**(_QWORD **)&this[36]._os_unfair_lock_opaque + 16))(*(_QWORD *)&this[36]._os_unfair_lock_opaque, v4, 0);
              v10 = *(NSObject **)(v5 + 56);
              *(_QWORD *)(v5 + 56) = 0;
              if (v10)
              {
                dispatch_group_leave(v10);
                dispatch_release(v10);
              }
            }
            p_shared_owners = (unint64_t *)&v9->__shared_owners_;
            do
              v12 = __ldaxr(p_shared_owners);
            while (__stlxr(v12 - 1, p_shared_owners));
            if (!v12)
            {
              ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
              std::__shared_weak_count::__release_weak(v9);
            }
          }
          std::__shared_weak_count::__release_weak(v3);
        }
        v13 = (waipc::timesync::BasebandService *)*((_QWORD *)v2 + 1);
        if (v13)
        {
          do
          {
            v14 = v13;
            v13 = *(waipc::timesync::BasebandService **)v13;
          }
          while (v13);
        }
        else
        {
          do
          {
            v14 = (waipc::timesync::BasebandService *)*((_QWORD *)v2 + 2);
            v15 = *(_QWORD *)v14 == (_QWORD)v2;
            v2 = v14;
          }
          while (!v15);
        }
        v2 = v14;
      }
      while (v14 != (waipc::timesync::BasebandService *)&this[88]);
    }
    v16 = *(char **)&this[92]._os_unfair_lock_opaque;
    v17 = (char *)&this[94];
    if (v16 != (char *)&this[94])
    {
      do
      {
        if (!v16[72])
        {
          v16[72] = 1;
          (*(void (**)(_QWORD, _QWORD))(**(_QWORD **)&this[36]._os_unfair_lock_opaque + 32))(*(_QWORD *)&this[36]._os_unfair_lock_opaque, v16[32]);
        }
        v18 = (char *)*((_QWORD *)v16 + 1);
        v19 = v16;
        if (v18)
        {
          do
          {
            v20 = v18;
            v18 = *(char **)v18;
          }
          while (v18);
        }
        else
        {
          do
          {
            v20 = (char *)*((_QWORD *)v19 + 2);
            v15 = *(_QWORD *)v20 == (_QWORD)v19;
            v19 = v20;
          }
          while (!v15);
        }
        if (v20 == v17)
          break;
        v21 = v16[32];
        v16 = v20;
        while (v16[32] == v21)
        {
          v22 = (char *)*((_QWORD *)v16 + 1);
          if (v22)
          {
            do
            {
              v23 = v22;
              v22 = *(char **)v22;
            }
            while (v22);
          }
          else
          {
            do
            {
              v23 = (char *)*((_QWORD *)v16 + 2);
              v15 = *(_QWORD *)v23 == (_QWORD)v16;
              v16 = v23;
            }
            while (!v15);
          }
          v16 = v23;
          if (v23 == v17)
            goto LABEL_41;
        }
      }
      while (v16 != v17);
    }
  }
LABEL_41:
  v24 = *(NSObject **)&this[108]._os_unfair_lock_opaque;
  if (v24)
  {
    dispatch_group_leave(v24);
    v25 = *(NSObject **)&this[108]._os_unfair_lock_opaque;
    if (v25)
      dispatch_release(v25);
  }
  v26 = *(NSObject **)&this[106]._os_unfair_lock_opaque;
  if (v26)
  {
    dispatch_group_leave(v26);
    v27 = *(NSObject **)&this[106]._os_unfair_lock_opaque;
    if (v27)
      dispatch_release(v27);
  }
  v28 = *(NSObject **)&this[104]._os_unfair_lock_opaque;
  if (v28)
    dispatch_release(v28);
  v29 = *(void **)&this[98]._os_unfair_lock_opaque;
  if (v29)
  {
    *(_QWORD *)&this[100]._os_unfair_lock_opaque = v29;
    operator delete(v29);
  }
  std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::destroy((uint64_t)&this[92], *(_QWORD **)&this[94]._os_unfair_lock_opaque);
  std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::destroy((uint64_t)&this[86], *(_QWORD **)&this[88]._os_unfair_lock_opaque);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)&this[82]);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)&this[78]);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)&this[74]);
  v30 = *(const void **)&this[70]._os_unfair_lock_opaque;
  if (v30)
    CFRelease(v30);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)&this[36]);
  v31 = *(NSObject **)&this[6]._os_unfair_lock_opaque;
  if (v31)
    dispatch_release(v31);
  v32 = *(NSObject **)&this[4]._os_unfair_lock_opaque;
  if (v32)
    dispatch_release(v32);
  v33 = *(std::__shared_weak_count **)&this[2]._os_unfair_lock_opaque;
  if (v33)
    std::__shared_weak_count::__release_weak(v33);
}

void applesauce::dispatch::v1::group_session::~group_session(dispatch_object_t *this)
{
  NSObject *v2;

  v2 = *this;
  if (v2)
  {
    dispatch_group_leave(v2);
    if (*this)
      dispatch_release(*this);
  }
}

uint64_t waipc::timesync::BasebandService::setupProvider(os_unfair_lock *this)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_weak_owners;
  unint64_t v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  NSObject *v7;
  _QWORD v9[11];
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[6];
  _QWORD v14[6];
  uint64_t v15;
  std::__shared_weak_count *v16;
  _QWORD v17[6];
  std::__shared_weak_count *v18;

  os_unfair_lock_assert_owner(this + 8);
  if (*(_QWORD *)&this[36]._os_unfair_lock_opaque)
    waipc::timesync::BasebandService::setupProvider();
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3802000000;
  v17[3] = __Block_byref_object_copy__2;
  v17[4] = __Block_byref_object_dispose__2;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v15, this);
  v2 = v16;
  v17[5] = v15;
  v18 = v16;
  if (v16)
  {
    p_shared_weak_owners = (unint64_t *)&v16->__shared_weak_owners_;
    do
      v4 = __ldxr(p_shared_weak_owners);
    while (__stxr(v4 + 1, p_shared_weak_owners));
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v13[5] = this;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 0x40000000;
  v14[2] = ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke;
  v14[3] = &unk_24DDBC440;
  v14[4] = v17;
  v14[5] = this;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 0x40000000;
  v13[2] = ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke_2;
  v13[3] = &unk_24DDBC468;
  v13[4] = v17;
  v11[5] = this;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 0x40000000;
  v12[2] = ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke_10;
  v12[3] = &unk_24DDBC490;
  v12[4] = v17;
  v12[5] = this;
  v10[5] = this;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 0x40000000;
  v11[2] = ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke_2_15;
  v11[3] = &unk_24DDBC4B8;
  v11[4] = v17;
  v9[10] = this;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 0x40000000;
  v10[2] = ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke_3;
  v10[3] = &unk_24DDBC4E0;
  v10[4] = v17;
  v7 = *(NSObject **)&this[4]._os_unfair_lock_opaque;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 0x40000000;
  v9[2] = ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke_4;
  v9[3] = &unk_24DDBC508;
  v9[4] = v14;
  v9[5] = v13;
  v9[6] = v12;
  v9[7] = v11;
  v9[8] = v10;
  v9[9] = v17;
  dispatch_async(v7, v9);
  _Block_object_dispose(v17, 8);
  if (v18)
    std::__shared_weak_count::__release_weak(v18);
  return 1;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *Logger;
  uint64_t v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  const void *v7;
  _QWORD *v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  unint64_t *p_shared_weak_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  BOOL v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  int v25;
  _QWORD *v26;
  _QWORD *v27;
  std::__shared_weak_count *v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  const char *v31;
  int v32;
  NSObject *group;
  uint8_t buf[8];
  std::__shared_weak_count *v35;

  v2 = *(_QWORD *)(a1 + 40);
  Logger = waipc::logging::getLogger(1u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ABB3000, Logger, OS_LOG_TYPE_INFO, "provider connected", buf, 2u);
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(std::__shared_weak_count **)(v4 + 48);
  if (!v5)
    return;
  v6 = std::__shared_weak_count::lock(v5);
  v35 = v6;
  if (!v6)
    return;
  *(_QWORD *)buf = *(_QWORD *)(v4 + 40);
  if (!*(_QWORD *)buf)
  {
    v28 = v6;
LABEL_57:
    p_shared_owners = (unint64_t *)&v28->__shared_owners_;
    do
      v30 = __ldaxr(p_shared_owners);
    while (__stlxr(v30 - 1, p_shared_owners));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
    return;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 32));
  if (!*(_QWORD *)(v2 + 144))
  {
    v31 = "fProvider";
    v32 = 139;
    goto LABEL_65;
  }
  if (*(_BYTE *)(v2 + 272))
  {
    v31 = "!fConnected";
    v32 = 140;
LABEL_65:
    __assert_rtn("setupProvider_block_invoke", "BasebandService.cpp", v32, v31);
  }
  *(_BYTE *)(v2 + 272) = 1;
  v7 = *(const void **)(v2 + 280);
  *(_QWORD *)(v2 + 280) = 0;
  if (v7)
    CFRelease(v7);
  group = *(NSObject **)(v2 + 424);
  *(_QWORD *)(v2 + 424) = 0;
  v8 = *(_QWORD **)(v2 + 344);
  if (v8 != (_QWORD *)(v2 + 352))
  {
    while (1)
    {
      v9 = *((unsigned __int8 *)v8 + 32);
      v10 = (std::__shared_weak_count *)v8[6];
      if (v10)
      {
        v11 = v8[5];
        p_shared_weak_owners = (unint64_t *)&v10->__shared_weak_owners_;
        do
          v13 = __ldxr(p_shared_weak_owners);
        while (__stxr(v13 + 1, p_shared_weak_owners));
        v14 = std::__shared_weak_count::lock(v10);
        if (!v14)
          v11 = 0;
      }
      else
      {
        v14 = 0;
        v11 = 0;
      }
      (*(void (**)(_QWORD, uint64_t, BOOL))(**(_QWORD **)(v2 + 144) + 16))(*(_QWORD *)(v2 + 144), v9, v11 != 0);
      if (v14)
      {
        v15 = (unint64_t *)&v14->__shared_owners_;
        do
          v16 = __ldaxr(v15);
        while (__stlxr(v16 - 1, v15));
        if (!v16)
          break;
      }
      if (v10)
        goto LABEL_23;
LABEL_24:
      v17 = (_QWORD *)v8[1];
      if (v17)
      {
        do
        {
          v18 = v17;
          v17 = (_QWORD *)*v17;
        }
        while (v17);
      }
      else
      {
        do
        {
          v18 = (_QWORD *)v8[2];
          v19 = *v18 == (_QWORD)v8;
          v8 = v18;
        }
        while (!v19);
      }
      v8 = v18;
      if (v18 == (_QWORD *)(v2 + 352))
        goto LABEL_33;
    }
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
    if (!v10)
      goto LABEL_24;
LABEL_23:
    std::__shared_weak_count::__release_weak(v10);
    goto LABEL_24;
  }
LABEL_33:
  v20 = *(_QWORD **)(v2 + 368);
  v21 = (_QWORD *)(v2 + 376);
  while (v20 != v21)
  {
    if (*((_BYTE *)v20 + 72))
      __assert_rtn("setupProvider_block_invoke", "BasebandService.cpp", 158, "!info.awaitingRemoval");
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(**(_QWORD **)(v2 + 144) + 24))(*(_QWORD *)(v2 + 144), *((unsigned __int8 *)v20 + 32), v20[5], v20[7]);
    v22 = (_QWORD *)v20[1];
    v23 = v20;
    if (v22)
    {
      do
      {
        v24 = v22;
        v22 = (_QWORD *)*v22;
      }
      while (v22);
    }
    else
    {
      do
      {
        v24 = (_QWORD *)v23[2];
        v19 = *v24 == (_QWORD)v23;
        v23 = v24;
      }
      while (!v19);
    }
    if (v24 == v21)
      break;
    v25 = *((unsigned __int8 *)v20 + 32);
    v20 = v24;
    while (*((unsigned __int8 *)v20 + 32) == v25)
    {
      v26 = (_QWORD *)v20[1];
      if (v26)
      {
        do
        {
          v27 = v26;
          v26 = (_QWORD *)*v26;
        }
        while (v26);
      }
      else
      {
        do
        {
          v27 = (_QWORD *)v20[2];
          v19 = *v27 == (_QWORD)v20;
          v20 = v27;
        }
        while (!v19);
      }
      v20 = v27;
      if (v27 == v21)
        goto LABEL_50;
    }
  }
LABEL_50:
  if (waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::hasObservers(*(_QWORD *)(v2 + 328)))
    waipc::timesync::BasebandProvider::triggerTimesyncMeasurement(*(const os_unfair_lock **)(v2 + 144));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));
  waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::broadcast<BOOL,decltype(nullptr)>(*(_QWORD *)(v2 + 312), 1);
  if (group)
  {
    dispatch_group_leave(group);
    dispatch_release(group);
  }
  v28 = v35;
  if (v35)
    goto LABEL_57;
}

void sub_21ABC3C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  dispatch_object_t v5;
  va_list va;
  va_list va1;

  va_start(va1, a4);
  va_start(va, a4);
  v5 = va_arg(va1, dispatch_object_t);
  applesauce::dispatch::v1::group_session::~group_session((dispatch_object_t *)va);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke_2(uint64_t a1, const void *a2)
{
  uint64_t v4;
  NSObject *Logger;
  uint64_t v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  const void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD *v14;
  std::__shared_weak_count *v15;
  uint64_t v16;
  unint64_t *p_shared_weak_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  std::__shared_weak_count *v20;
  NSObject *v21;
  NSObject *v22;
  unint64_t *v23;
  unint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  NSObject *v36;
  NSObject *v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *p_shared_owners;
  unint64_t v43;
  __int128 v44;
  uint8_t buf[8];
  std::__shared_weak_count *v46;

  v4 = *(_QWORD *)(a1 + 40);
  Logger = waipc::logging::getLogger(1u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ABB3000, Logger, OS_LOG_TYPE_INFO, " provider disconnectedBlock", buf, 2u);
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(std::__shared_weak_count **)(v6 + 48);
  if (!v7)
    return;
  v8 = std::__shared_weak_count::lock(v7);
  v46 = v8;
  if (!v8)
    return;
  *(_QWORD *)buf = *(_QWORD *)(v6 + 40);
  if (!*(_QWORD *)buf)
  {
    v41 = v8;
LABEL_74:
    p_shared_owners = (unint64_t *)&v41->__shared_owners_;
    do
      v43 = __ldaxr(p_shared_owners);
    while (__stlxr(v43 - 1, p_shared_owners));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
    return;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 32));
  *(_BYTE *)(v4 + 272) = 0;
  if (a2)
    CFRetain(a2);
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v44, a2);
  v9 = *(const void **)(v4 + 280);
  *(_QWORD *)(v4 + 280) = v44;
  *(_QWORD *)&v44 = v9;
  if (v9)
    CFRelease(v9);
  v10 = *(NSObject **)(v4 + 416);
  if (v10)
  {
    dispatch_retain(*(dispatch_object_t *)(v4 + 416));
    dispatch_group_enter(v10);
  }
  v11 = *(NSObject **)(v4 + 424);
  *(_QWORD *)(v4 + 424) = v10;
  if (v11)
  {
    dispatch_group_leave(v11);
    dispatch_release(v11);
  }
  *(_BYTE *)(v4 + 288) = 1;
  v12 = *(NSObject **)(v4 + 416);
  if (v12)
  {
    dispatch_retain(*(dispatch_object_t *)(v4 + 416));
    dispatch_group_enter(v12);
  }
  v13 = *(NSObject **)(v4 + 432);
  *(_QWORD *)(v4 + 432) = v12;
  if (v13)
  {
    dispatch_group_leave(v13);
    dispatch_release(v13);
  }
  v14 = *(_QWORD **)(v4 + 344);
  if (v14 != (_QWORD *)(v4 + 352))
  {
    while (1)
    {
      v15 = (std::__shared_weak_count *)v14[6];
      if (v15)
        break;
LABEL_34:
      v25 = (_QWORD *)v14[1];
      if (v25)
      {
        do
        {
          v26 = v25;
          v25 = (_QWORD *)*v25;
        }
        while (v25);
      }
      else
      {
        do
        {
          v26 = (_QWORD *)v14[2];
          v27 = *v26 == (_QWORD)v14;
          v14 = v26;
        }
        while (!v27);
      }
      v14 = v26;
      if (v26 == (_QWORD *)(v4 + 352))
        goto LABEL_43;
    }
    v16 = v14[5];
    p_shared_weak_owners = (unint64_t *)&v15->__shared_weak_owners_;
    do
      v18 = __ldxr(p_shared_weak_owners);
    while (__stxr(v18 + 1, p_shared_weak_owners));
    v19 = std::__shared_weak_count::lock(v15);
    if (!v19)
    {
LABEL_33:
      std::__shared_weak_count::__release_weak(v15);
      goto LABEL_34;
    }
    v20 = v19;
    if (v16)
    {
      *(_BYTE *)v16 = 0;
      if (*(_BYTE *)(v16 + 64))
      {
        v21 = *(NSObject **)(v4 + 416);
        if (v21)
        {
          dispatch_retain(*(dispatch_object_t *)(v4 + 416));
          dispatch_group_enter(v21);
        }
        v22 = *(NSObject **)(v16 + 56);
        *(_QWORD *)(v16 + 56) = v21;
        if (!v22)
          goto LABEL_29;
      }
      else
      {
        v22 = *(NSObject **)(v16 + 56);
        *(_QWORD *)(v16 + 56) = 0;
        if (!v22)
          goto LABEL_29;
      }
      dispatch_group_leave(v22);
      dispatch_release(v22);
    }
LABEL_29:
    v23 = (unint64_t *)&v20->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
    goto LABEL_33;
  }
LABEL_43:
  v28 = *(uint64_t **)(v4 + 368);
  v29 = (uint64_t *)(v4 + 376);
  while (v28 != v29)
  {
    v30 = v28;
    v31 = (uint64_t *)v28[1];
    v32 = v28;
    if (v31)
    {
      do
      {
        v33 = v31;
        v31 = (uint64_t *)*v31;
      }
      while (v31);
    }
    else
    {
      do
      {
        v33 = (uint64_t *)v32[2];
        v27 = *v33 == (_QWORD)v32;
        v32 = v33;
      }
      while (!v27);
    }
    v28 = (uint64_t *)(v4 + 376);
    if (v33 != v29)
    {
      while (*((unsigned __int8 *)v33 + 32) == *((unsigned __int8 *)v30 + 32))
      {
        v34 = (uint64_t *)v33[1];
        if (v34)
        {
          do
          {
            v35 = v34;
            v34 = (uint64_t *)*v34;
          }
          while (v34);
        }
        else
        {
          do
          {
            v35 = (uint64_t *)v33[2];
            v27 = *v35 == (_QWORD)v33;
            v33 = v35;
          }
          while (!v27);
        }
        v33 = v35;
        if (v35 == v29)
        {
          v28 = (uint64_t *)(v4 + 376);
          goto LABEL_59;
        }
      }
      v28 = v33;
    }
LABEL_59:
    if (*((_BYTE *)v30 + 72))
    {
      std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__remove_node_pointer((uint64_t **)(v4 + 368), v30);
      std::__destroy_at[abi:ne180100]<std::pair<waipc::timesync::BasebandProvider::bufferId const,waipc::timesync::BasebandService::bufferInfo>,0>((uint64_t)(v30 + 4));
      operator delete(v30);
    }
    else
    {
      v36 = *(NSObject **)(v4 + 416);
      if (v36)
      {
        dispatch_retain(*(dispatch_object_t *)(v4 + 416));
        dispatch_group_enter(v36);
      }
      v37 = v30[8];
      v30[8] = (uint64_t)v36;
      if (v37)
      {
        dispatch_group_leave(v37);
        dispatch_release(v37);
      }
    }
  }
  v44 = 0uLL;
  std::shared_ptr<waipc::util::GroupErrorTimer::state>::operator=[abi:ne180100](v4 + 144, &v44);
  v38 = (std::__shared_weak_count *)*((_QWORD *)&v44 + 1);
  if (*((_QWORD *)&v44 + 1))
  {
    v39 = (unint64_t *)(*((_QWORD *)&v44 + 1) + 8);
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 32));
  waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::broadcast<BOOL,__CFString const*>(*(_QWORD *)(v4 + 312), 0, (uint64_t)a2);
  v41 = v46;
  if (v46)
    goto LABEL_74;
}

void sub_21ABC40AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  uint64_t v9;
  char v10;
  __int128 *v11;
  uint64_t v12;
  NSObject *Logger;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  __int128 v26;
  double v27;
  double v28;
  double v29;
  NSObject *v30;
  NSObject *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  unint64_t *p_shared_owners;
  unint64_t v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  double v49;
  std::__shared_weak_count *v51;
  _BYTE buf[24];
  _BYTE v53[32];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_QWORD *)(v3 + 48))
    return;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(v3 + 48));
  v51 = v7;
  if (!v7)
    return;
  v8 = v7;
  if (!*(_QWORD *)(v3 + 40))
    goto LABEL_24;
  v39 = v7;
  v40 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 32));
  if (!a3)
    __assert_rtn("setupProvider_block_invoke", "BasebandService.cpp", 251, "count > 0");
  v9 = a3;
  v10 = 0;
  v11 = (__int128 *)(v6 + 168);
  v12 = a2;
  v38 = v9;
  do
  {
    *(_QWORD *)&v43 = 0;
    v41 = 0u;
    v42 = 0u;
    waipc::timesync::BasebandService::timesyncMeasurementAdapter::measurementFrom((double *)(v6 + 112), v12, (uint64_t)&v41);
    if (*(_BYTE *)(v6 + 288))
      goto LABEL_12;
    *(_OWORD *)buf = *(_OWORD *)(v6 + 192);
    if (waipc::timesync::operator<((uint64_t)&v42, (uint64_t)buf))
    {
      Logger = waipc::logging::getLogger(1u);
      if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(v6 + 192) + vcvtmd_s64_f64(*(double *)(v6 + 200));
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v42 + vcvtmd_s64_f64(*((double *)&v42 + 1));
        _os_log_impl(&dword_21ABB3000, Logger, OS_LOG_TYPE_DEFAULT, "out-of-order time sync measurement prev=%llu new=%llu", buf, 0x16u);
      }
      *(_BYTE *)(v6 + 288) = 1;
LABEL_12:
      v15 = *(double *)(v6 + 128);
      v16 = v15 / *(double *)(v6 + 136) * (v15 / *(double *)(v6 + 136));
      v17 = *(double *)(v6 + 48);
      v18 = *(double *)(v6 + 40) * v16;
      *(double *)&v48 = v15 / *(double *)(v6 + 136);
      *((double *)&v48 + 1) = v18;
      v49 = v16 * v17 / (1.0 / v15 * 1000000000.0);
      waipc::timesync::KalmanEstimator::KalmanEstimator((uint64_t)buf, &v48, (uint64_t)&v41);
      v19 = v56;
      *(_OWORD *)(v6 + 232) = v55;
      *(_OWORD *)(v6 + 248) = v19;
      *(_QWORD *)(v6 + 264) = v57;
      v20 = *(_OWORD *)v53;
      *v11 = *(_OWORD *)&buf[8];
      *(_OWORD *)(v6 + 184) = v20;
      v21 = v54;
      *(_OWORD *)(v6 + 200) = *(_OWORD *)&v53[16];
      *(_OWORD *)(v6 + 216) = v21;
      waipc::timesync::BasebandService::logEstimator((const os_unfair_lock *)v6, (const waipc::timesync::KalmanEstimator *)(v6 + 160));
      *(_BYTE *)(v6 + 288) = 0;
      v10 = 1;
      goto LABEL_13;
    }
    if (*(_BYTE *)(v6 + 288))
      goto LABEL_12;
    waipc::timesync::KalmanEstimator::deviceToHost(v6 + 160, v42, *((uint64_t *)&v42 + 1));
    v23 = v22;
    v25 = v24;
    v26 = v41;
    v27 = waipc::timesync::KalmanEstimator::deviceToHostVariance(v6 + 160, v42, *((uint64_t *)&v42 + 1));
    v28 = v25;
    v29 = sqrt(v27 + *(double *)&v43) * 3.0;
    if (fabs(v25 - *((double *)&v26 + 1) + (double)(v23 - v26)) >= v29)
    {
      v30 = waipc::logging::getLogger(1u);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218752;
        *(_QWORD *)&buf[4] = v42 + vcvtmd_s64_f64(*((double *)&v42 + 1));
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v41 + vcvtmd_s64_f64(*((double *)&v41 + 1));
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)v53 = v23 + vcvtmd_s64_f64(v28);
        *(_WORD *)&v53[8] = 2048;
        *(double *)&v53[10] = v29;
        _os_log_impl(&dword_21ABB3000, v30, OS_LOG_TYPE_DEFAULT, "rejected outlier time sync measurement device=%llu host=%llu expectedHost=%llu limit=%lf", buf, 0x2Au);
      }
      ++*(_DWORD *)(v6 + 440);
    }
    else
    {
      waipc::timesync::KalmanEstimator::update(v6 + 160, (uint64_t)&v41);
      waipc::timesync::BasebandService::logEstimator((const os_unfair_lock *)v6, (const waipc::timesync::KalmanEstimator *)(v6 + 160));
    }
LABEL_13:
    v12 += 40;
    --v9;
  }
  while (v9);
  if (*(_BYTE *)(v6 + 288))
    __assert_rtn("setupProvider_block_invoke", "BasebandService.cpp", 299, "!fReset");
  v31 = *(NSObject **)(v6 + 432);
  *(_QWORD *)(v6 + 432) = 0;
  v32 = *(_OWORD *)(v6 + 248);
  v45 = *(_OWORD *)(v6 + 232);
  v46 = v32;
  v47 = *(_QWORD *)(v6 + 264);
  *(_QWORD *)&v48 = v31;
  v33 = *(_OWORD *)(v6 + 184);
  v41 = *v11;
  v42 = v33;
  v34 = *(_OWORD *)(v6 + 216);
  v43 = *(_OWORD *)(v6 + 200);
  v44 = v34;
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 32));
  waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context::broadcast<waipc::timesync::BasebandProvider::timesyncMeasurement*,unsigned long>(*(_QWORD *)(v6 + 296), v40, v38);
  v54 = v44;
  v55 = v45;
  v56 = v46;
  *(_OWORD *)&buf[8] = v41;
  *(_OWORD *)v53 = v42;
  *(_OWORD *)&v53[16] = v43;
  v35 = *(_QWORD *)(v6 + 328);
  v57 = v47;
  *(_QWORD *)buf = &off_24DDBC1E0;
  waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::broadcast<waipc::timesync::KalmanEstimator,BOOL>(v35, (uint64_t)buf, v10 & 1);
  if (v31)
  {
    dispatch_group_leave(v31);
    dispatch_release(v31);
  }
  v8 = v39;
LABEL_24:
  p_shared_owners = (unint64_t *)&v8->__shared_owners_;
  do
    v37 = __ldaxr(p_shared_owners);
  while (__stlxr(v37 - 1, p_shared_owners));
  if (!v37)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
}

void sub_21ABC4574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,dispatch_object_t a32,uint64_t a33,uint64_t a34,char a35)
{
  applesauce::dispatch::v1::group_session::~group_session(&a32);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a35);
  _Unwind_Resume(a1);
}

long double waipc::timesync::BasebandService::timesyncMeasurementAdapter::measurementFrom@<D0>(double *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  long double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  long double v16;
  double v17;
  double v18;
  long double v19;
  double v20;
  double v21;
  long double v22;
  long double v23;
  double v24;
  long double v25;
  double v26;
  long double result;
  double __y;

  v6 = *(_QWORD *)(a2 + 8);
  v7 = (double)*(unint64_t *)(a2 + 16);
  v8 = 0.5;
  v9 = v7 * 0.5 + 0.5;
  v10 = a1[1];
  v11 = v10 * pow(v7, (double)2) / (double)4;
  v12 = a1[2];
  v13 = *(double *)(a2 + 32) / v12;
  v14 = (double)1;
  if (v13 == (double)1)
  {
    v15 = *(_QWORD *)(a2 + 24);
  }
  else
  {
    feclearexcept(159);
    v16 = (double)*(unint64_t *)(a2 + 24);
    errIfInexact(v16);
    v18 = (double)0 + v17;
    feclearexcept(159);
    v19 = v16 * v13;
    errIfInexact(v19);
    v21 = (double)0 + v20;
    __y = 0.0;
    v22 = modf(v19, &__y);
    v15 = (unint64_t)__y;
    v8 = v22 + v13 / (double)2;
    v14 = v21 + ((double)1 + v18) * v13;
    v12 = a1[2];
  }
  v23 = pow(v14, (double)2);
  v24 = a1[3];
  v25 = v12 / v24 * (v12 / v24) * (v23 / (double)12);
  v26 = 1.0 / v24 * (1.0 / v24) * *a1 + v11;
  *(_QWORD *)a3 = v6;
  *(double *)(a3 + 8) = v9;
  *(_QWORD *)(a3 + 16) = v15;
  result = v26 + v25;
  *(double *)(a3 + 24) = v8;
  *(long double *)(a3 + 32) = result;
  return result;
}

void waipc::timesync::BasebandService::logEstimator(const os_unfair_lock *this, const waipc::timesync::KalmanEstimator *a2)
{
  const os_unfair_lock *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char *v28;
  char *v29;
  uint64_t v30;
  char *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  os_unfair_lock_assert_owner(this + 8);
  if (LOBYTE(this[26]._os_unfair_lock_opaque))
  {
    v4 = this + 98;
    v5 = *(_QWORD *)&this[98]._os_unfair_lock_opaque;
    if (0xEEEEEEEEEEEEEEEFLL * ((*(_QWORD *)&this[100]._os_unfair_lock_opaque - v5) >> 3) - 20 <= 0xFFFFFFFFFFFFFFEALL)
      std::vector<std::pair<unsigned long long,waipc::timesync::KalmanEstimator>>::erase((uint64_t)&this[98], v5, v5 + 8 * ((*(_QWORD *)&this[100]._os_unfair_lock_opaque - v5) >> 3) - 2280);
    v6 = mach_absolute_time();
    v7 = v6;
    v8 = *(_QWORD *)&this[100]._os_unfair_lock_opaque;
    v9 = *(_QWORD *)&this[102]._os_unfair_lock_opaque;
    if (v8 >= v9)
    {
      v16 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(v8 - *(_QWORD *)&v4->_os_unfair_lock_opaque) >> 3);
      v17 = v16 + 1;
      if (v16 + 1 > 0x222222222222222)
        std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
      v18 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(v9 - *(_QWORD *)&v4->_os_unfair_lock_opaque) >> 3);
      if (2 * v18 > v17)
        v17 = 2 * v18;
      if (v18 >= 0x111111111111111)
        v19 = 0x222222222222222;
      else
        v19 = v17;
      if (v19)
        v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long long,waipc::timesync::KalmanEstimator>>>((uint64_t)&this[102], v19);
      else
        v20 = 0;
      v21 = &v20[120 * v16];
      v22 = &v20[120 * v19];
      *(_QWORD *)v21 = v7;
      *((_QWORD *)v21 + 1) = &off_24DDBC1E0;
      v23 = *(_OWORD *)((char *)a2 + 8);
      v24 = *(_OWORD *)((char *)a2 + 40);
      *((_OWORD *)v21 + 2) = *(_OWORD *)((char *)a2 + 24);
      *((_OWORD *)v21 + 3) = v24;
      *((_OWORD *)v21 + 1) = v23;
      v25 = *(_OWORD *)((char *)a2 + 56);
      v26 = *(_OWORD *)((char *)a2 + 72);
      v27 = *(_OWORD *)((char *)a2 + 88);
      *((_QWORD *)v21 + 14) = *((_QWORD *)a2 + 13);
      *((_OWORD *)v21 + 5) = v26;
      *((_OWORD *)v21 + 6) = v27;
      *((_OWORD *)v21 + 4) = v25;
      v15 = v21 + 120;
      v29 = *(char **)&this[98]._os_unfair_lock_opaque;
      v28 = *(char **)&this[100]._os_unfair_lock_opaque;
      if (v28 != v29)
      {
        v30 = 0;
        do
        {
          v31 = &v21[v30];
          *((_QWORD *)v31 - 15) = *(_QWORD *)&v28[v30 - 120];
          *((_QWORD *)v31 - 14) = &off_24DDBC1E0;
          v32 = *(_OWORD *)&v28[v30 - 104];
          v33 = *(_OWORD *)&v28[v30 - 88];
          *(_OWORD *)(v31 - 72) = *(_OWORD *)&v28[v30 - 72];
          *(_OWORD *)(v31 - 88) = v33;
          *(_OWORD *)(v31 - 104) = v32;
          v34 = *(_OWORD *)&v28[v30 - 56];
          v35 = *(_OWORD *)&v28[v30 - 40];
          v36 = *(_OWORD *)&v28[v30 - 24];
          *((_QWORD *)v31 - 1) = *(_QWORD *)&v28[v30 - 8];
          *(_OWORD *)(v31 - 24) = v36;
          *(_OWORD *)(v31 - 40) = v35;
          *(_OWORD *)(v31 - 56) = v34;
          v30 -= 120;
        }
        while (&v28[v30] != v29);
        v28 = *(char **)&v4->_os_unfair_lock_opaque;
        v21 += v30;
      }
      *(_QWORD *)&this[98]._os_unfair_lock_opaque = v21;
      *(_QWORD *)&this[100]._os_unfair_lock_opaque = v15;
      *(_QWORD *)&this[102]._os_unfair_lock_opaque = v22;
      if (v28)
        operator delete(v28);
    }
    else
    {
      *(_QWORD *)v8 = v6;
      *(_QWORD *)(v8 + 8) = &off_24DDBC1E0;
      v10 = *(_OWORD *)((char *)a2 + 8);
      v11 = *(_OWORD *)((char *)a2 + 40);
      *(_OWORD *)(v8 + 32) = *(_OWORD *)((char *)a2 + 24);
      *(_OWORD *)(v8 + 48) = v11;
      *(_OWORD *)(v8 + 16) = v10;
      v12 = *(_OWORD *)((char *)a2 + 56);
      v13 = *(_OWORD *)((char *)a2 + 72);
      v14 = *(_OWORD *)((char *)a2 + 88);
      *(_QWORD *)(v8 + 112) = *((_QWORD *)a2 + 13);
      *(_OWORD *)(v8 + 80) = v13;
      *(_OWORD *)(v8 + 96) = v14;
      *(_OWORD *)(v8 + 64) = v12;
      v15 = (char *)(v8 + 120);
    }
    *(_QWORD *)&this[100]._os_unfair_lock_opaque = v15;
  }
}

void ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke_2_15(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v6;
  std::__shared_weak_count *v7;
  uint64_t v12;
  std::__shared_weak_count *v13;
  os_unfair_lock_s *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  BOOL v19;
  uint64_t *v20;
  std::__shared_weak_count *v21;
  std::__shared_weak_count *v22;
  std::__shared_weak_count *v23;
  uint64_t v24;
  NSObject *v25;
  std::__shared_weak_count *v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(std::__shared_weak_count **)(v6 + 48);
  if (!v7)
    return;
  v12 = *(_QWORD *)(a1 + 40);
  v13 = std::__shared_weak_count::lock(v7);
  v31 = v13;
  if (!v13)
    return;
  if (!*(_QWORD *)(v6 + 40))
  {
    v26 = v13;
LABEL_24:
    p_shared_owners = (unint64_t *)&v26->__shared_owners_;
    do
      v28 = __ldaxr(p_shared_owners);
    while (__stlxr(v28 - 1, p_shared_owners));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
    return;
  }
  v14 = (os_unfair_lock_s *)(v12 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(v12 + 32));
  v15 = *(_QWORD *)(v12 + 352);
  if (!v15)
    goto LABEL_20;
  v16 = v12 + 352;
  v17 = v12 + 352;
  do
  {
    v18 = *(unsigned __int8 *)(v15 + 32);
    v19 = v18 >= a2;
    if (v18 >= a2)
      v20 = (uint64_t *)v15;
    else
      v20 = (uint64_t *)(v15 + 8);
    if (v19)
      v17 = v15;
    v15 = *v20;
  }
  while (*v20);
  if (v17 != v16
    && *(unsigned __int8 *)(v17 + 32) <= a2
    && (v21 = *(std::__shared_weak_count **)(v17 + 48)) != 0
    && (v22 = std::__shared_weak_count::lock(v21)) != 0)
  {
    v23 = v22;
    v24 = *(_QWORD *)(v17 + 40);
    if (v24)
    {
      *(_BYTE *)v24 = 1;
      *(_QWORD *)(v24 + 8) = a3;
      *(double *)(v24 + 16) = a5;
      *(_QWORD *)(v24 + 24) = a4;
      v25 = *(NSObject **)(v24 + 56);
      *(_QWORD *)(v24 + 56) = 0;
      os_unfair_lock_unlock(v14);
      waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context::broadcast<unsigned long long,double,unsigned long long>(*(_QWORD *)(v24 + 32), a3, a4, a5);
      if (v25)
      {
        dispatch_group_leave(v25);
        dispatch_release(v25);
      }
    }
    else
    {
      os_unfair_lock_unlock(v14);
    }
    v29 = (unint64_t *)&v23->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  else
  {
LABEL_20:
    os_unfair_lock_unlock(v14);
  }
  v26 = v31;
  if (v31)
    goto LABEL_24;
}

void sub_21ABC4B24(_Unwind_Exception *a1, uint64_t a2, ...)
{
  dispatch_object_t v3;
  va_list va;
  uint64_t v5;
  va_list va1;
  uint64_t v7;
  va_list va2;

  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, dispatch_object_t);
  va_copy(va2, va1);
  v5 = va_arg(va2, _QWORD);
  v7 = va_arg(va2, _QWORD);
  applesauce::dispatch::v1::group_session::~group_session((dispatch_object_t *)va);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)va2);
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke_3(uint64_t a1, unsigned __int8 a2, int a3)
{
  uint64_t v3;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  NSObject *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  unsigned __int8 v18;

  v18 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_QWORD *)(v3 + 48))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(v3 + 48));
    if (v6)
    {
      v7 = v6;
      if (!*(_QWORD *)(v3 + 40))
        goto LABEL_18;
      os_unfair_lock_lock((os_unfair_lock_t)(v5 + 32));
      v8 = std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__equal_range_multi<waipc::timesync::BasebandProvider::bufferId>(v5 + 368, &v18);
      v9 = v8;
      v11 = v10;
      if (v8 != v10)
      {
        if (a3)
        {
          v12 = v8[8];
          v8[8] = 0;
          if (!v12)
            goto LABEL_17;
        }
        else
        {
          if (*((_BYTE *)v8 + 72))
          {
            v13 = std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__remove_node_pointer((uint64_t **)(v5 + 368), v8);
            std::__destroy_at[abi:ne180100]<std::pair<waipc::timesync::BasebandProvider::bufferId const,waipc::timesync::BasebandService::bufferInfo>,0>((uint64_t)(v9 + 4));
            operator delete(v9);
            if (v13 != v11 && *(_BYTE *)(v5 + 272))
            {
              v14 = *(_QWORD *)(v5 + 144);
              if (!v14)
                __assert_rtn("setupProvider_block_invoke_3", "BasebandService.cpp", 381, "fProvider");
              (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)v14 + 24))(v14, v18, v13[5], v13[7]);
            }
            goto LABEL_17;
          }
          v15 = *(NSObject **)(v5 + 416);
          if (v15)
          {
            dispatch_retain(*(dispatch_object_t *)(v5 + 416));
            dispatch_group_enter(v15);
          }
          v12 = v9[8];
          v9[8] = (uint64_t)v15;
          if (!v12)
            goto LABEL_17;
        }
        dispatch_group_leave(v12);
        dispatch_release(v12);
      }
LABEL_17:
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 32));
LABEL_18:
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v17 = __ldaxr(p_shared_owners);
      while (__stlxr(v17 - 1, p_shared_owners));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
}

void sub_21ABC4CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  os_unfair_lock_s *v10;

  os_unfair_lock_unlock(v10);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke_4(_QWORD *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  _QWORD v20[7];
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  std::__shared_weak_count *v26;

  v2 = *(_QWORD *)(a1[9] + 8);
  v3 = *(std::__shared_weak_count **)(v2 + 48);
  if (v3)
  {
    v4 = a1[10];
    v5 = std::__shared_weak_count::lock(v3);
    v26 = v5;
    if (v5)
    {
      if (!*(_QWORD *)(v2 + 40))
      {
        v14 = v5;
LABEL_30:
        p_shared_owners = (unint64_t *)&v14->__shared_owners_;
        do
          v19 = __ldaxr(p_shared_owners);
        while (__stlxr(v19 - 1, p_shared_owners));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
        return;
      }
      v6 = *(NSObject **)(v4 + 16);
      v20[0] = v6;
      if (v6)
        dispatch_retain(v6);
      v7 = *(NSObject **)(v4 + 24);
      v20[1] = v7;
      if (v7)
        dispatch_retain(v7);
      v8 = (void *)a1[4];
      if (v8)
        v8 = _Block_copy(v8);
      v20[2] = v8;
      v9 = (void *)a1[5];
      if (v9)
        v9 = _Block_copy(v9);
      v20[3] = v9;
      v10 = (void *)a1[6];
      if (v10)
        v10 = _Block_copy(v10);
      v20[4] = v10;
      v11 = (void *)a1[7];
      if (v11)
        v11 = _Block_copy(v11);
      v20[5] = v11;
      v12 = (void *)a1[8];
      if (v12)
        v12 = _Block_copy(v12);
      v20[6] = v12;
      v21 = *(_OWORD *)(v4 + 88);
      v13 = 20;
      if (!*(_BYTE *)(v4 + 104))
        v13 = 0;
      v22 = v13;
      v23 = v13;
      waipc::timesync::BasebandProvider::create((waipc::timesync::BasebandProvider *)v20, (os_unfair_lock_s **)&v24);
      waipc::timesync::BasebandProvider::config::~config((waipc::timesync::BasebandProvider::config *)v20);
      if ((_QWORD)v24)
      {
        os_unfair_lock_lock((os_unfair_lock_t)(v4 + 32));
        std::shared_ptr<waipc::util::GroupErrorTimer::state>::operator=[abi:ne180100](v4 + 144, &v24);
        os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 32));
      }
      else
      {
        (*(void (**)(void))(a1[5] + 16))();
      }
      v15 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
      if (*((_QWORD *)&v24 + 1))
      {
        v16 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
        do
          v17 = __ldaxr(v16);
        while (__stlxr(v17 - 1, v16));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }
      v14 = v26;
      if (v26)
        goto LABEL_30;
    }
  }
}

void sub_21ABC4EBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100](v1 - 64);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100](v1 - 48);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandService::addMeasurementObserver(uint64_t a1@<X0>, const void *a2@<X1>, void **a3@<X8>)
{
  os_unfair_lock_s *v6;

  v6 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context::addObserver(*(_QWORD *)(a1 + 296), a2, a3);
  os_unfair_lock_unlock(v6);
}

void sub_21ABC4F48(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandService::addConnectionObserver(uint64_t a1@<X0>, uint64_t a2@<X1>, void **a3@<X8>)
{
  os_unfair_lock_s *v6;
  NSObject *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  _QWORD v12[6];
  _QWORD block[8];
  _QWORD v14[3];
  char v15;
  _QWORD v16[5];
  uint64_t v17;
  std::__shared_weak_count *v18;

  v6 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3802000000;
  v16[3] = __Block_byref_object_copy__23;
  v16[4] = __Block_byref_object_dispose__24;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v17, (_QWORD *)a1);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2000000000;
  v15 = 0;
  v7 = *(NSObject **)(a1 + 16);
  v8 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN5waipc8timesync15BasebandService21addConnectionObserverEU13block_pointerFvbPK10__CFStringE_block_invoke;
  block[3] = &unk_24DDBC530;
  block[6] = v14;
  block[7] = a1;
  block[4] = a2;
  block[5] = v16;
  dispatch_async(v7, block);
  v12[0] = v8;
  v12[1] = 0x40000000;
  v12[2] = ___ZN5waipc8timesync15BasebandService21addConnectionObserverEU13block_pointerFvbPK10__CFStringE_block_invoke_2;
  v12[3] = &unk_24DDBC558;
  v12[4] = a2;
  v12[5] = v14;
  waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::addObserver(*(_QWORD *)(a1 + 312), v12, a3);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
  v9 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  os_unfair_lock_unlock(v6);
}

void sub_21ABC50D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  os_unfair_lock_s *v28;
  uint64_t v29;

  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100](v29);
  os_unfair_lock_unlock(v28);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t __Block_byref_object_dispose__24(uint64_t a1)
{
  return std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100](a1 + 40);
}

void ___ZN5waipc8timesync15BasebandService21addConnectionObserverEU13block_pointerFvbPK10__CFStringE_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  os_unfair_lock_s *v3;
  const void *v4;

  v2 = a1[7];
  v3 = (os_unfair_lock_s *)(v2 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 32));
  v4 = *(const void **)(v2 + 280);
  if (v4)
    CFRetain(v4);
  os_unfair_lock_unlock(v3);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  (*(void (**)(void))(a1[4] + 16))();
  if (v4)
    CFRelease(v4);
}

void sub_21ABC51D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ___ZN5waipc8timesync15BasebandService21addConnectionObserverEU13block_pointerFvbPK10__CFStringE_block_invoke_2(uint64_t result)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void waipc::timesync::BasebandService::addTimesyncObserver(uint64_t a1@<X0>, uint64_t a2@<X1>, void **a3@<X8>)
{
  os_unfair_lock_s *v6;
  NSObject *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  _QWORD v12[6];
  _QWORD block[8];
  _QWORD v14[3];
  char v15;
  _QWORD v16[5];
  uint64_t v17;
  std::__shared_weak_count *v18;

  v6 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3802000000;
  v16[3] = __Block_byref_object_copy__23;
  v16[4] = __Block_byref_object_dispose__24;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v17, (_QWORD *)a1);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2000000000;
  v15 = 0;
  v7 = *(NSObject **)(a1 + 16);
  v8 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN5waipc8timesync15BasebandService19addTimesyncObserverEU13block_pointerFvRKNS0_15KalmanEstimatorEbE_block_invoke;
  block[3] = &unk_24DDBC580;
  block[6] = v14;
  block[7] = a1;
  block[4] = a2;
  block[5] = v16;
  dispatch_async(v7, block);
  v12[0] = v8;
  v12[1] = 0x40000000;
  v12[2] = ___ZN5waipc8timesync15BasebandService19addTimesyncObserverEU13block_pointerFvRKNS0_15KalmanEstimatorEbE_block_invoke_2;
  v12[3] = &unk_24DDBC5A8;
  v12[4] = a2;
  v12[5] = v14;
  waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::addObserver(*(_QWORD *)(a1 + 328), v12, a3);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
  v9 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  os_unfair_lock_unlock(v6);
}

void sub_21ABC5384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  os_unfair_lock_s *v28;
  uint64_t v29;

  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100](v29);
  os_unfair_lock_unlock(v28);
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync15BasebandService19addTimesyncObserverEU13block_pointerFvRKNS0_15KalmanEstimatorEbE_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  const os_unfair_lock *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(waipc::timesync::KalmanEstimator *__hidden);
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v2 = a1[7];
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 32));
  v9 = &off_24DDBC1E0;
  v13 = *(_OWORD *)(v2 + 216);
  v14 = *(_OWORD *)(v2 + 232);
  v15 = *(_OWORD *)(v2 + 248);
  v16 = *(_QWORD *)(v2 + 264);
  v10 = *(_OWORD *)(v2 + 168);
  v11 = *(_OWORD *)(v2 + 184);
  v12 = *(_OWORD *)(v2 + 200);
  if (*(_BYTE *)(v2 + 288))
  {
    if (*(_BYTE *)(v2 + 272))
    {
      v3 = *(const os_unfair_lock **)(v2 + 144);
      if (!v3)
        ___ZN5waipc8timesync15BasebandService19addTimesyncObserverEU13block_pointerFvRKNS0_15KalmanEstimatorEbE_block_invoke_cold_1();
      waipc::timesync::BasebandProvider::triggerTimesyncMeasurement(v3);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    (*(void (**)(_QWORD, void (***)(waipc::timesync::KalmanEstimator *__hidden), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1[4] + 16))(a1[4], &v9, 1, v4, v5, v6, v7, v8);
  }
}

uint64_t ___ZN5waipc8timesync15BasebandService19addTimesyncObserverEU13block_pointerFvRKNS0_15KalmanEstimatorEbE_block_invoke_2(uint64_t result)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void waipc::timesync::BasebandService::addTimestampObserver(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X2>, void **a4@<X8>)
{
  os_unfair_lock_s *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  _QWORD v18[7];
  _QWORD block[9];
  _QWORD v20[3];
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  uint64_t (*v26)(uint64_t);
  uint64_t *v27;
  std::__shared_weak_count *v28;
  _QWORD v29[5];
  uint64_t v30;
  std::__shared_weak_count *v31;

  v8 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3802000000;
  v29[3] = __Block_byref_object_copy__23;
  v29[4] = __Block_byref_object_dispose__24;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v30, (_QWORD *)a1);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3802000000;
  v25 = __Block_byref_object_copy__31;
  v26 = __Block_byref_object_dispose__32;
  waipc::timesync::BasebandService::getTimestampSubscription(a1, a2, &v27);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2000000000;
  v21 = 0;
  v9 = *(NSObject **)(a1 + 16);
  v10 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN5waipc8timesync15BasebandService20addTimestampObserverENS0_16BasebandProvider11timestampIdEU13block_pointerFvydyE_block_invoke;
  block[3] = &unk_24DDBC5D0;
  block[7] = v20;
  block[8] = a1;
  block[5] = v29;
  block[6] = &v22;
  block[4] = a3;
  dispatch_async(v9, block);
  v11 = v23[5];
  v18[0] = v10;
  v18[1] = 0x40000000;
  v18[2] = ___ZN5waipc8timesync15BasebandService20addTimestampObserverENS0_16BasebandProvider11timestampIdEU13block_pointerFvydyE_block_invoke_2;
  v18[3] = &unk_24DDBC5F8;
  v18[5] = &v22;
  v18[6] = v20;
  v18[4] = a3;
  waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context::addObserver(*(_QWORD *)(v11 + 32), v18, a4);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);
  v12 = v28;
  if (v28)
  {
    p_shared_owners = (unint64_t *)&v28->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  _Block_object_dispose(v29, 8);
  v15 = v31;
  if (v31)
  {
    v16 = (unint64_t *)&v31->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  os_unfair_lock_unlock(v8);
}

void sub_21ABC56D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  os_unfair_lock_s *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100](v31);
  _Block_object_dispose((const void *)(v32 - 152), 8);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100](v30);
  os_unfair_lock_unlock(v29);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__31(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t __Block_byref_object_dispose__32(uint64_t a1)
{
  return std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100](a1 + 40);
}

void waipc::timesync::BasebandService::getTimestampSubscription(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t **a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  BOOL v9;
  uint64_t *v10;
  std::__shared_weak_count *v11;
  std::__shared_weak_count *v12;
  uint64_t *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  char *v19;
  void *v20;
  NSObject *v21;
  char *v22;
  __int128 v23;
  __int128 v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t **v28;
  uint64_t *v29;
  uint64_t *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  char v39;
  _QWORD aBlock[6];
  unsigned __int8 v41;
  _QWORD v42[5];
  __int128 v43;
  unsigned __int8 v44;

  v44 = a2;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
  v6 = *(_QWORD *)(a1 + 352);
  if (v6)
  {
    v7 = a1 + 352;
    do
    {
      v8 = *(unsigned __int8 *)(v6 + 32);
      v9 = v8 >= a2;
      if (v8 >= a2)
        v10 = (uint64_t *)v6;
      else
        v10 = (uint64_t *)(v6 + 8);
      if (v9)
        v7 = v6;
      v6 = *v10;
    }
    while (*v10);
    if (v7 != a1 + 352 && *(unsigned __int8 *)(v7 + 32) <= a2)
    {
      *a3 = 0;
      a3[1] = 0;
      v11 = *(std::__shared_weak_count **)(v7 + 48);
      if (v11)
      {
        v12 = std::__shared_weak_count::lock(v11);
        a3[1] = (uint64_t *)v12;
        if (v12)
        {
          v13 = *(uint64_t **)(v7 + 40);
          *a3 = v13;
          if (v13)
            return;
        }
        else if (*a3)
        {
          return;
        }
      }
      std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)a3);
    }
  }
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3802000000;
  v42[3] = __Block_byref_object_copy__2;
  v42[4] = __Block_byref_object_dispose__2;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v35, (_QWORD *)a1);
  v14 = (std::__shared_weak_count *)*((_QWORD *)&v35 + 1);
  v43 = v35;
  if (*((_QWORD *)&v35 + 1))
  {
    v15 = (unint64_t *)(*((_QWORD *)&v35 + 1) + 16);
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN5waipc8timesync15BasebandService24getTimestampSubscriptionENS0_16BasebandProvider11timestampIdE_block_invoke;
  aBlock[3] = &unk_24DDBC650;
  aBlock[4] = v42;
  aBlock[5] = a1;
  v41 = v44;
  LOBYTE(v35) = 0;
  v36 = 0uLL;
  *((_QWORD *)&v35 + 1) = 0;
  v19 = (char *)operator new(0x60uLL);
  *((_QWORD *)v19 + 1) = 0;
  *((_QWORD *)v19 + 2) = 0;
  *(_QWORD *)v19 = &off_24DDBC930;
  *(_OWORD *)(v19 + 40) = 0u;
  *(_OWORD *)(v19 + 56) = 0u;
  *(_OWORD *)(v19 + 72) = 0u;
  *((_QWORD *)v19 + 11) = 0;
  *(_OWORD *)(v19 + 24) = 0u;
  *(_QWORD *)&v37 = v19 + 24;
  *((_QWORD *)&v37 + 1) = v19;
  std::shared_ptr<waipc::timesync::LegacyBasebandProvider>::__enable_weak_this[abi:ne180100]<waipc::timesync::BasebandProvider,waipc::timesync::LegacyBasebandProvider,void>((uint64_t)&v37, (_QWORD *)v37, v37);
  v20 = _Block_copy(aBlock);
  v21 = *(NSObject **)(a1 + 416);
  *(_QWORD *)&v38 = v20;
  *((_QWORD *)&v38 + 1) = v21;
  if (v21)
  {
    dispatch_retain(v21);
    dispatch_group_enter(v21);
  }
  v39 = 1;
  v22 = (char *)operator new(0x60uLL);
  v23 = v36;
  *(_OWORD *)(v22 + 24) = v35;
  *(_OWORD *)(v22 + 40) = v23;
  v24 = v38;
  *(_OWORD *)(v22 + 56) = v37;
  *((_QWORD *)v22 + 1) = 0;
  *((_QWORD *)v22 + 2) = 0;
  *(_QWORD *)v22 = &off_24DDBC980;
  v37 = 0uLL;
  *(_OWORD *)(v22 + 72) = v24;
  v38 = 0uLL;
  v22[88] = 1;
  *a3 = (uint64_t *)(v22 + 24);
  a3[1] = (uint64_t *)v22;
  waipc::util::GuardBlock::~GuardBlock((const void **)&v38);
  v25 = (std::__shared_weak_count *)*((_QWORD *)&v37 + 1);
  if (*((_QWORD *)&v37 + 1))
  {
    v26 = (unint64_t *)(*((_QWORD *)&v37 + 1) + 8);
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  *(_QWORD *)&v35 = &v44;
  v28 = std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::__emplace_unique_key_args<waipc::timesync::BasebandProvider::timestampId,std::piecewise_construct_t const&,std::tuple<waipc::timesync::BasebandProvider::timestampId const&>,std::tuple<>>((uint64_t **)(a1 + 344), &v44, (uint64_t)&std::piecewise_construct, (_BYTE **)&v35);
  v30 = *a3;
  v29 = a3[1];
  if (v29)
  {
    v31 = (unint64_t *)(v29 + 2);
    do
      v32 = __ldxr(v31);
    while (__stxr(v32 + 1, v31));
  }
  v33 = (std::__shared_weak_count *)v28[6];
  v28[5] = v30;
  v28[6] = v29;
  if (v33)
    std::__shared_weak_count::__release_weak(v33);
  if (*(_BYTE *)(a1 + 272))
  {
    v34 = *(_QWORD *)(a1 + 144);
    if (!v34)
      __assert_rtn("getTimestampSubscription", "BasebandService.cpp", 625, "fProvider");
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v34 + 16))(v34, v44, 1);
  }
  _Block_object_dispose(v42, 8);
  if (*((_QWORD *)&v43 + 1))
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v43 + 1));
}

void sub_21ABC5A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  std::__shared_weak_count *v11;

  waipc::timesync::BasebandService::timestampSubscription::~timestampSubscription((waipc::timesync::BasebandService::timestampSubscription *)&a9);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  v11 = *(std::__shared_weak_count **)(v9 - 64);
  if (v11)
    std::__shared_weak_count::__release_weak(v11);
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync15BasebandService20addTimestampObserverENS0_16BasebandProvider11timestampIdEU13block_pointerFvydyE_block_invoke(_QWORD *a1)
{
  os_unfair_lock_s *v2;
  double *v3;
  int v4;
  double v5;

  v2 = (os_unfair_lock_s *)(a1[8] + 32);
  os_unfair_lock_lock(v2);
  v3 = *(double **)(*(_QWORD *)(a1[6] + 8) + 40);
  v4 = *(unsigned __int8 *)v3;
  v5 = v3[2];
  os_unfair_lock_unlock(v2);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  if (v4)
    (*(void (**)(double))(a1[4] + 16))(v5);
}

uint64_t ___ZN5waipc8timesync15BasebandService20addTimestampObserverENS0_16BasebandProvider11timestampIdEU13block_pointerFvydyE_block_invoke_2(uint64_t result)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void waipc::timesync::BasebandService::setTimestampRequiredForReady(uint64_t a1, unsigned int a2, int a3)
{
  os_unfair_lock_s *v6;
  uint64_t *v7;
  NSObject *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  NSObject *v12;
  uint64_t *v13;
  std::__shared_weak_count *v14;

  v6 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  waipc::timesync::BasebandService::getTimestampSubscription(a1, a2, &v13);
  v7 = v13;
  *((_BYTE *)v13 + 64) = a3;
  if (a3 && !*(_BYTE *)v7)
  {
    v12 = *(NSObject **)(a1 + 416);
    if (v12)
    {
      dispatch_retain(v12);
      dispatch_group_enter(v12);
      v7 = v13;
    }
    v8 = v7[7];
    v7[7] = (uint64_t)v12;
    if (v8)
      goto LABEL_4;
  }
  else
  {
    v8 = v7[7];
    v7[7] = 0;
    if (v8)
    {
LABEL_4:
      dispatch_group_leave(v8);
      dispatch_release(v8);
    }
  }
  v9 = v14;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  os_unfair_lock_unlock(v6);
}

void sub_21ABC5C98(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync15BasebandService24getTimestampSubscriptionENS0_16BasebandProvider11timestampIdE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  NSObject *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  _QWORD v16[6];
  std::__shared_weak_count *v17;
  char v18;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(std::__shared_weak_count **)(v2 + 48);
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)(v2 + 40);
      if (v7)
      {
        v8 = *(NSObject **)(v4 + 16);
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 1174405120;
        v16[2] = ___ZN5waipc8timesync15BasebandService24getTimestampSubscriptionENS0_16BasebandProvider11timestampIdE_block_invoke_2;
        v16[3] = &__block_descriptor_tmp_36;
        v16[4] = v4;
        v16[5] = v7;
        v17 = v6;
        p_shared_owners = (unint64_t *)&v6->__shared_owners_;
        do
          v10 = __ldxr(p_shared_owners);
        while (__stxr(v10 + 1, p_shared_owners));
        v18 = *(_BYTE *)(a1 + 48);
        dispatch_async(v8, v16);
        v11 = v17;
        if (v17)
        {
          v12 = (unint64_t *)&v17->__shared_owners_;
          do
            v13 = __ldaxr(v12);
          while (__stlxr(v13 - 1, v12));
          if (!v13)
          {
            ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
            std::__shared_weak_count::__release_weak(v11);
          }
        }
      }
      v14 = (unint64_t *)&v6->__shared_owners_;
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void ___ZN5waipc8timesync15BasebandService24getTimestampSubscriptionENS0_16BasebandProvider11timestampIdE_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  unsigned int v6;
  BOOL v7;
  uint64_t *v8;
  std::__shared_weak_count *v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;

  v2 = *(_QWORD *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 32));
  v3 = *(_QWORD *)(v2 + 352);
  if (v3)
  {
    v4 = *(unsigned __int8 *)(a1 + 56);
    v5 = v2 + 352;
    do
    {
      v6 = *(unsigned __int8 *)(v3 + 32);
      v7 = v6 >= v4;
      if (v6 >= v4)
        v8 = (uint64_t *)v3;
      else
        v8 = (uint64_t *)(v3 + 8);
      if (v7)
        v5 = v3;
      v3 = *v8;
    }
    while (*v8);
    if (v5 != v2 + 352 && v4 >= *(unsigned __int8 *)(v5 + 32))
    {
      v9 = *(std::__shared_weak_count **)(v5 + 48);
      if (v9)
      {
        v10 = std::__shared_weak_count::lock(v9);
        if (v10 && *(_QWORD *)(v5 + 40))
        {
LABEL_21:
          p_shared_owners = (unint64_t *)&v10->__shared_owners_;
          do
            v13 = __ldaxr(p_shared_owners);
          while (__stlxr(v13 - 1, p_shared_owners));
          if (!v13)
          {
            ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
            std::__shared_weak_count::__release_weak(v10);
          }
          goto LABEL_25;
        }
      }
      else
      {
        v10 = 0;
      }
      if (*(_BYTE *)(v2 + 272))
      {
        v11 = *(_QWORD *)(v2 + 144);
        if (!v11)
          __assert_rtn("getTimestampSubscription_block_invoke_2", "BasebandService.cpp", 607, "fProvider");
        (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v11 + 16))(v11, *(unsigned __int8 *)(a1 + 56), 0);
      }
      std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::erase((uint64_t **)(v2 + 344), (uint64_t *)v5);
      if (v10)
        goto LABEL_21;
    }
  }
LABEL_25:
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));
}

void sub_21ABC5F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  os_unfair_lock_s *v9;

  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  os_unfair_lock_unlock(v9);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c61_ZTSKNSt3__110shared_ptrIN5waipc8timesync15BasebandServiceEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t __destroy_helper_block_e8_40c61_ZTSKNSt3__110shared_ptrIN5waipc8timesync15BasebandServiceEEE(uint64_t a1)
{
  return std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100](a1 + 40);
}

void waipc::timesync::BasebandService::timestampSubscription::~timestampSubscription(waipc::timesync::BasebandService::timestampSubscription *this)
{
  NSObject *v2;
  NSObject *v3;

  v2 = *((_QWORD *)this + 7);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *((_QWORD *)this + 7);
    if (v3)
      dispatch_release(v3);
  }
  waipc::util::GuardBlock::~GuardBlock((const void **)this + 6);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)this + 32);
}

void waipc::timesync::BasebandService::triggerMeasurement(os_unfair_lock_s *this)
{
  os_unfair_lock_s *v2;
  const os_unfair_lock *v3;

  v2 = this + 8;
  os_unfair_lock_lock(this + 8);
  if (LOBYTE(this[68]._os_unfair_lock_opaque))
  {
    v3 = *(const os_unfair_lock **)&this[36]._os_unfair_lock_opaque;
    if (!v3)
      __assert_rtn("triggerMeasurement", "BasebandService.cpp", 638, "fProvider");
    waipc::timesync::BasebandProvider::triggerTimesyncMeasurement(v3);
  }
  os_unfair_lock_unlock(v2);
}

void sub_21ABC6000(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandService::triggerReset(waipc::timesync::BasebandService *this)
{
  os_unfair_lock_s *v2;
  NSObject *v3;
  NSObject *v4;
  os_unfair_lock_s *v5;
  const os_unfair_lock *v6;

  v2 = (os_unfair_lock_s *)((char *)this + 32);
  os_unfair_lock_lock((os_unfair_lock_t)this + 8);
  *((_BYTE *)this + 288) = 1;
  v3 = *((_QWORD *)this + 52);
  if (v3)
  {
    dispatch_retain(*((dispatch_object_t *)this + 52));
    dispatch_group_enter(v3);
  }
  v4 = *((_QWORD *)this + 54);
  *((_QWORD *)this + 54) = v3;
  if (v4)
  {
    dispatch_group_leave(v4);
    dispatch_release(v4);
  }
  v5 = (os_unfair_lock_s *)*((_QWORD *)this + 18);
  if (v5)
    waipc::timesync::BasebandProvider::cancelTimesyncMeasurement(v5);
  if (*((_BYTE *)this + 272))
  {
    v6 = (const os_unfair_lock *)*((_QWORD *)this + 18);
    if (!v6)
      __assert_rtn("triggerReset", "BasebandService.cpp", 655, "fProvider");
    waipc::timesync::BasebandProvider::triggerTimesyncMeasurement(v6);
  }
  os_unfair_lock_unlock(v2);
}

void sub_21ABC60C8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandService::mapBuffer(uint64_t a1@<X0>, unsigned __int8 a2@<W1>, uint64_t **a3@<X2>, uint64_t (*a4)(uint64_t result, uint64_t a2)@<X3>, void **a5@<X8>)
{
  os_unfair_lock_s *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  NSObject *v16;
  uint64_t *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  NSObject *v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *p_shared_weak_owners;
  unint64_t v28;
  unint64_t *v29;
  unint64_t v30;
  _QWORD aBlock[7];
  unsigned __int8 v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  dispatch_group_t group;
  uint64_t v39;
  std::__shared_weak_count *v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  dispatch_group_t v44;
  char v45;
  unsigned __int8 v46[9];

  v46[0] = a2;
  v8 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  v9 = std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__equal_range_multi<waipc::timesync::BasebandProvider::bufferId>(a1 + 368, v46);
  v11 = v10;
  v12 = *a3;
  v13 = (uint64_t)a3[1];
  if (v13)
  {
    v14 = (unint64_t *)(v13 + 8);
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }
  v43 = a4;
  v16 = *(NSObject **)(a1 + 416);
  if (v16)
  {
    dispatch_retain(*(dispatch_object_t *)(a1 + 416));
    dispatch_group_enter(v16);
  }
  v45 = 0;
  LOBYTE(v34) = v46[0];
  v35 = v12;
  v36 = v13;
  v41 = 0;
  v42 = 0;
  v37 = a4;
  group = v16;
  v44 = 0;
  LOBYTE(v39) = 0;
  v17 = std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__emplace_hint_multi<std::pair<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>((_QWORD *)(a1 + 368), v11, (uint64_t)&v34);
  if (group)
  {
    dispatch_group_leave(group);
    if (group)
      dispatch_release(group);
  }
  v18 = (std::__shared_weak_count *)v36;
  if (v36)
  {
    v19 = (unint64_t *)(v36 + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v21 = v44;
  if (v44)
  {
    dispatch_group_leave(v44);
    dispatch_release(v21);
  }
  v22 = v42;
  if (v42)
  {
    p_shared_owners = (unint64_t *)&v42->__shared_owners_;
    do
      v24 = __ldaxr(p_shared_owners);
    while (__stlxr(v24 - 1, p_shared_owners));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  if (v9 == v11 && *(_BYTE *)(a1 + 272))
  {
    v25 = *(_QWORD *)(a1 + 144);
    if (!v25)
      __assert_rtn("mapBuffer", "BasebandService.cpp", 675, "fProvider");
    (*(void (**)(uint64_t, _QWORD, uint64_t *, uint64_t (*)(uint64_t, uint64_t)))(*(_QWORD *)v25 + 24))(v25, v46[0], *a3, a4);
  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x3802000000;
  v37 = __Block_byref_object_copy__2;
  group = (dispatch_group_t)__Block_byref_object_dispose__2;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v41, (_QWORD *)a1);
  v26 = v42;
  v39 = v41;
  v40 = v42;
  if (v42)
  {
    p_shared_weak_owners = (unint64_t *)&v42->__shared_weak_owners_;
    do
      v28 = __ldxr(p_shared_weak_owners);
    while (__stxr(v28 + 1, p_shared_weak_owners));
    v29 = (unint64_t *)&v26->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN5waipc8timesync15BasebandService9mapBufferENS0_16BasebandProvider8bufferIdERKNSt3__110shared_ptrIvEEm_block_invoke;
  aBlock[3] = &unk_24DDBC678;
  aBlock[4] = &v34;
  aBlock[5] = a1;
  v33 = v46[0];
  aBlock[6] = v17;
  *a5 = _Block_copy(aBlock);
  _Block_object_dispose(&v34, 8);
  if (v40)
    std::__shared_weak_count::__release_weak(v40);
  os_unfair_lock_unlock(v8);
}

void sub_21ABC63AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  os_unfair_lock_s *v26;

  os_unfair_lock_unlock(v26);
  _Unwind_Resume(a1);
}

uint64_t std::pair<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>::~pair(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *(NSObject **)(a1 + 32);
    if (v3)
      dispatch_release(v3);
  }
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100](a1 + 8);
  return a1;
}

void waipc::timesync::BasebandService::bufferInfo::~bufferInfo(waipc::timesync::BasebandService::bufferInfo *this)
{
  NSObject *v2;
  NSObject *v3;

  v2 = *((_QWORD *)this + 3);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *((_QWORD *)this + 3);
    if (v3)
      dispatch_release(v3);
  }
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)this);
}

void ___ZN5waipc8timesync15BasebandService9mapBufferENS0_16BasebandProvider8bufferIdERKNSt3__110shared_ptrIvEEm_block_invoke(uint64_t a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  BOOL v11;
  uint64_t *v12;
  unsigned __int8 *v13;
  uint64_t v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  const char *v17;
  int v18;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(std::__shared_weak_count **)(v2 + 48);
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      v6 = v5;
      if (!*(_QWORD *)(v2 + 40))
        goto LABEL_23;
      os_unfair_lock_lock((os_unfair_lock_t)(v4 + 32));
      v7 = *(_QWORD *)(v4 + 376);
      if (!v7)
        goto LABEL_15;
      v8 = *(unsigned __int8 *)(a1 + 56);
      v9 = (unsigned __int8 *)(v4 + 376);
      do
      {
        v10 = *(unsigned __int8 *)(v7 + 32);
        v11 = v10 >= v8;
        if (v10 >= v8)
          v12 = (uint64_t *)v7;
        else
          v12 = (uint64_t *)(v7 + 8);
        if (v11)
          v9 = (unsigned __int8 *)v7;
        v7 = *v12;
      }
      while (*v12);
      if (v9 == (unsigned __int8 *)(v4 + 376) || v8 < v9[32])
LABEL_15:
        v9 = (unsigned __int8 *)(v4 + 376);
      v13 = *(unsigned __int8 **)(a1 + 48);
      if (v9 == v13 && *(_BYTE *)(v4 + 272))
      {
        if (v9[72])
        {
          v17 = "!it->second.awaitingRemoval";
          v18 = 694;
        }
        else
        {
          v9[72] = 1;
          v14 = *(_QWORD *)(v4 + 144);
          if (v14)
          {
            (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v14 + 32))(v14, *(unsigned __int8 *)(a1 + 56));
            goto LABEL_22;
          }
          v17 = "fProvider";
          v18 = 697;
        }
        __assert_rtn("mapBuffer_block_invoke", "BasebandService.cpp", v18, v17);
      }
      std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__remove_node_pointer((uint64_t **)(v4 + 368), *(uint64_t **)(a1 + 48));
      std::__destroy_at[abi:ne180100]<std::pair<waipc::timesync::BasebandProvider::bufferId const,waipc::timesync::BasebandService::bufferInfo>,0>((uint64_t)(v13 + 32));
      operator delete(v13);
LABEL_22:
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 32));
LABEL_23:
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_21ABC65EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  os_unfair_lock_s *v9;

  os_unfair_lock_unlock(v9);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::pair<unsigned long long,waipc::timesync::KalmanEstimator>>::erase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  if (a2 != a3)
  {
    v3 = *(_QWORD *)(a1 + 8);
    v4 = a2;
    if (a3 != v3)
    {
      v5 = 8 * ((a3 - a2) >> 3);
      v4 = a2;
      do
      {
        *(_QWORD *)v4 = *(_QWORD *)(v4 + v5);
        v7 = *(_OWORD *)(v4 + v5 + 32);
        v6 = *(_OWORD *)(v4 + v5 + 48);
        *(_OWORD *)(v4 + 16) = *(_OWORD *)(v4 + v5 + 16);
        *(_OWORD *)(v4 + 32) = v7;
        *(_OWORD *)(v4 + 48) = v6;
        v9 = *(_OWORD *)(v4 + v5 + 80);
        v8 = *(_OWORD *)(v4 + v5 + 96);
        v10 = *(_OWORD *)(v4 + v5 + 64);
        *(_QWORD *)(v4 + 112) = *(_QWORD *)(v4 + v5 + 112);
        *(_OWORD *)(v4 + 80) = v9;
        *(_OWORD *)(v4 + 96) = v8;
        *(_OWORD *)(v4 + 64) = v10;
        v4 += 120;
      }
      while (v4 + v5 != v3);
    }
    *(_QWORD *)(a1 + 8) = v4;
  }
  return a2;
}

char **waipc::timesync::BasebandService::dumpState(waipc::timesync::BasebandService *this)
{
  os_unfair_lock_s *v2;
  uint64_t *v3;
  uint64_t *v4;
  waipc::timesync::BasebandProvider *v5;
  CFTypeRef v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void **v19;
  char **v20;
  uint64_t v22;
  char *v23[3];
  char *v24[3];
  char *v25[3];
  CFTypeRef cf;
  char **v27;
  void **v28[2];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[28];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v2 = (os_unfair_lock_s *)((char *)this + 32);
  os_unfair_lock_lock((os_unfair_lock_t)this + 8);
  memset(v25, 0, sizeof(v25));
  std::vector<applesauce::CF::DictionaryRef>::reserve(v25, *((_QWORD *)this + 45));
  std::transform[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__tree_node<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,void *> *,long>>,std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>,applesauce::CF::DictionaryRef({block_pointer})(std::pair<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>> const&)>(*((_QWORD **)this + 43), (_QWORD *)this + 44, v25, (uint64_t)&__block_literal_global_1);
  memset(v24, 0, sizeof(v24));
  std::vector<applesauce::CF::DictionaryRef>::reserve(v24, *((_QWORD *)this + 48));
  std::transform[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__tree_node<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,void *> *,long>>,std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>,applesauce::CF::DictionaryRef({block_pointer})(std::pair<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo> const&)>(*((_QWORD **)this + 46), (_QWORD *)this + 47, v24, (uint64_t)&__block_literal_global_57);
  memset(v23, 0, sizeof(v23));
  std::vector<applesauce::CF::DictionaryRef>::reserve(v23, 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(*((_QWORD *)this + 50) - *((_QWORD *)this + 49)) >> 3));
  v3 = (uint64_t *)*((_QWORD *)this + 49);
  v4 = (uint64_t *)*((_QWORD *)this + 50);
  v27 = v23;
  while (v3 != v4)
  {
    ___ZNK5waipc8timesync15BasebandService9dumpStateEv_block_invoke_3(v3, (applesauce::CF::DictionaryRef *)&cf);
    std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>::operator=[abi:ne180100](&v27, &cf);
    if (cf)
      CFRelease(cf);
    v3 += 15;
  }
  waipc::util::_kv::_kv<double const&,void>(v28, (uint64_t)CFSTR("Rate Variance"), (uint64_t *)this + 5);
  waipc::util::_kv::_kv<double const&,void>(&v29, (uint64_t)CFSTR("Process Variance"), (uint64_t *)this + 6);
  waipc::util::_kv::_kv<double const&,void>(&v30, (uint64_t)CFSTR("Extra Sync Variance"), (uint64_t *)this + 7);
  waipc::util::_kv::_kv<double const&,void>(&v31, (uint64_t)CFSTR("Host Variance Weight"), (uint64_t *)this + 8);
  cf = (CFTypeRef)*((_QWORD *)this + 9);
  waipc::util::_kv::_kv<double,void>(&v32, (uint64_t)CFSTR("Nominal Device Tick"), (uint64_t *)&cf);
  v22 = *((_QWORD *)this + 10);
  waipc::util::_kv::_kv<double,void>(&v33, (uint64_t)CFSTR("Nominal Host Tick"), &v22);
  waipc::util::_kv::_kv<unsigned int const&,void>(&v34, (uint64_t)CFSTR("Open Timeout"), (int *)this + 22);
  waipc::util::_kv::_kv<unsigned int const&,void>(&v35, (uint64_t)CFSTR("Open Retry"), (int *)this + 23);
  waipc::util::_kv::_kv<unsigned int const&,void>(&v36, (uint64_t)CFSTR("Measurement Burst"), (int *)this + 24);
  waipc::util::_kv::_kv<unsigned int const&,void>(v37, (uint64_t)CFSTR("Measurement Min Interval"), (int *)this + 25);
  v5 = (waipc::timesync::BasebandProvider *)*((_QWORD *)this + 18);
  if (v5)
    v5 = (waipc::timesync::BasebandProvider *)waipc::timesync::BasebandProvider::dumpState(v5);
  v37[2] = CFSTR("Provider");
  v37[3] = v5;
  v6 = waipc::timesync::KalmanEstimator::dumpState((waipc::timesync::BasebandService *)((char *)this + 160));
  v37[4] = CFSTR("Estimator");
  v37[5] = v6;
  v7 = *MEMORY[0x24BDBD270];
  v8 = *MEMORY[0x24BDBD268];
  if (*((_BYTE *)this + 272))
    v9 = *MEMORY[0x24BDBD270];
  else
    v9 = *MEMORY[0x24BDBD268];
  v37[6] = CFSTR("Connected");
  v37[7] = v9;
  v37[8] = CFSTR("Disconnect Reason");
  v10 = *((_QWORD *)this + 35);
  if (v10)
    CFRetain(*((CFTypeRef *)this + 35));
  v37[9] = v10;
  v37[10] = CFSTR("Reset");
  if (*((_BYTE *)this + 288))
    v11 = v7;
  else
    v11 = v8;
  v37[11] = v11;
  if (waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::hasObservers(*((_QWORD *)this + 37)))
    v12 = v7;
  else
    v12 = v8;
  v37[12] = CFSTR("Measurement Observers Present");
  v37[13] = v12;
  if (waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::hasObservers(*((_QWORD *)this + 39)))
    v13 = v7;
  else
    v13 = v8;
  v37[14] = CFSTR("Connection Observers Present");
  v37[15] = v13;
  if (waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::hasObservers(*((_QWORD *)this + 41)))
    v14 = v7;
  else
    v14 = v8;
  v37[16] = CFSTR("Timesync Observers Present");
  v37[17] = v14;
  v37[18] = CFSTR("Timestamp Contexts");
  v37[19] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>((uint64_t **)v25);
  v37[20] = CFSTR("Mapped Buffers");
  v37[21] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>((uint64_t **)v24);
  v37[22] = CFSTR("Estimator Log");
  v37[23] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>((uint64_t **)v23);
  v37[24] = CFSTR("Connection Ready");
  v15 = *((_QWORD *)this + 54);
  if (*((_QWORD *)this + 53))
    v16 = v8;
  else
    v16 = v7;
  v37[25] = v16;
  v37[26] = CFSTR("Estimator Ready");
  if (v15)
    v17 = v8;
  else
    v17 = v7;
  v37[27] = v17;
  waipc::util::_kv::_kv<unsigned int const&,void>(v38, (uint64_t)CFSTR("Timesync Outlier Count"), (int *)this + 110);
  waipc::util::createCFDictDropNull<24l>((uint64_t)v28, (applesauce::CF::DictionaryRef *)&v27);
  for (i = 47; i != -1; i -= 2)
  {
    v19 = v28[i];
    if (v19)
      CFRelease(v19);
  }
  v20 = v27;
  v28[0] = (void **)v23;
  std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](v28);
  v28[0] = (void **)v24;
  std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](v28);
  v28[0] = (void **)v25;
  std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](v28);
  os_unfair_lock_unlock(v2);
  return v20;
}

void sub_21ABC6AEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

char **std::transform[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__tree_node<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,void *> *,long>>,std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>,applesauce::CF::DictionaryRef({block_pointer})(std::pair<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>> const&)>(_QWORD *a1, _QWORD *a2, char **a3, uint64_t a4)
{
  _QWORD *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  BOOL v12;
  char v14[8];
  uint64_t v15;
  std::__shared_weak_count *v16;
  CFTypeRef cf;
  char **v18;

  v18 = a3;
  if (a1 != a2)
  {
    v6 = a1;
    do
    {
      v14[0] = *((_BYTE *)v6 + 32);
      v7 = (std::__shared_weak_count *)v6[6];
      v15 = v6[5];
      v16 = v7;
      if (v7)
      {
        p_shared_weak_owners = (unint64_t *)&v7->__shared_weak_owners_;
        do
          v9 = __ldxr(p_shared_weak_owners);
        while (__stxr(v9 + 1, p_shared_weak_owners));
      }
      (*(void (**)(CFTypeRef *__return_ptr, uint64_t, char *))(a4 + 16))(&cf, a4, v14);
      std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>::operator=[abi:ne180100](&v18, &cf);
      if (cf)
        CFRelease(cf);
      if (v16)
        std::__shared_weak_count::__release_weak(v16);
      v10 = (_QWORD *)v6[1];
      if (v10)
      {
        do
        {
          v11 = v10;
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          v11 = (_QWORD *)v6[2];
          v12 = *v11 == (_QWORD)v6;
          v6 = v11;
        }
        while (!v12);
      }
      v6 = v11;
    }
    while (v11 != a2);
    return v18;
  }
  return a3;
}

void sub_21ABC6CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, const void *a13)
{
  applesauce::CF::DictionaryRef::~DictionaryRef(&a13);
  if (a12)
    std::__shared_weak_count::__release_weak(a12);
  _Unwind_Resume(a1);
}

void ___ZNK5waipc8timesync15BasebandService9dumpStateEv_block_invoke(unsigned __int8 *a1@<X1>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  _QWORD *v6;
  const __CFString *TimestampName;
  const __CFString *v8;
  _BOOL4 hasObservers;
  const void **v10;
  const void **v11;
  const void **v12;
  const void *v13;
  const void **v14;
  const void *v15;
  CFNumberRef v16;
  CFNumberRef v17;
  CFNumberRef v18;
  CFNumberRef v19;
  CFNumberRef v20;
  CFNumberRef v21;
  const void **v22;
  uint64_t i;
  const void *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  void *exception;
  void *v28;
  void *v29;
  applesauce::CF::DictionaryRef *v30;
  _QWORD *valuePtr;
  _QWORD v32[2];
  const __CFString *v33;
  const void *v34;
  const __CFString *v35;
  const void *v36;
  const __CFString *v37;
  CFNumberRef v38;
  const __CFString *v39;
  CFNumberRef v40;
  const __CFString *v41;
  CFNumberRef v42;
  const __CFString *v43;
  _QWORD *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = (std::__shared_weak_count *)*((_QWORD *)a1 + 2);
  if (v4)
  {
    v5 = std::__shared_weak_count::lock(v4);
    if (v5)
    {
      v6 = (_QWORD *)*((_QWORD *)a1 + 1);
      goto LABEL_6;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = 0;
LABEL_6:
  TimestampName = waipc::timesync::BasebandProvider::getTimestampName(*a1);
  v8 = TimestampName;
  v32[0] = CFSTR("Name");
  if (TimestampName)
    CFRetain(TimestampName);
  v32[1] = v8;
  if (v6)
  {
    v30 = a2;
    hasObservers = waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::hasObservers(v6[4]);
    v10 = (const void **)MEMORY[0x24BDBD270];
    v11 = (const void **)MEMORY[0x24BDBD268];
    if (hasObservers)
      v12 = (const void **)MEMORY[0x24BDBD270];
    else
      v12 = (const void **)MEMORY[0x24BDBD268];
    v13 = *v12;
    v33 = CFSTR("Observers Present");
    if (v13)
      CFRetain(v13);
    v34 = v13;
    if (*(_BYTE *)v6)
      v14 = v10;
    else
      v14 = v11;
    v15 = *v14;
    v35 = CFSTR("Latest Valid");
    if (v15)
      CFRetain(v15);
    v36 = v15;
    valuePtr = (_QWORD *)v6[1];
    v16 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
    v17 = v16;
    if (!v16)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x220752F14](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
    v37 = CFSTR("Latest Timestamp");
    CFRetain(v16);
    v38 = v17;
    valuePtr = (_QWORD *)v6[2];
    v18 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
    v19 = v18;
    if (!v18)
    {
      v28 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x220752F14](v28, "Could not construct");
      __cxa_throw(v28, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
    v39 = CFSTR("Latest Timestamp Granularity");
    CFRetain(v18);
    v40 = v19;
    valuePtr = (_QWORD *)v6[3];
    v20 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
    v21 = v20;
    if (!v20)
    {
      v29 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x220752F14](v29, "Could not construct");
      __cxa_throw(v29, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
    v41 = CFSTR("Latest Interval");
    CFRetain(v20);
    v42 = v21;
    if (v6[7])
      v22 = v11;
    else
      v22 = v10;
    v6 = *v22;
    valuePtr = v6;
    v43 = CFSTR("Ready");
    if (v6)
      CFRetain(v6);
    a2 = v30;
  }
  else
  {
    v21 = 0;
    v17 = 0;
    v13 = 0;
    v15 = 0;
    v19 = 0;
    v33 = CFSTR("Observers Present");
    v34 = 0;
    v35 = CFSTR("Latest Valid");
    v36 = 0;
    v37 = CFSTR("Latest Timestamp");
    v38 = 0;
    v39 = CFSTR("Latest Timestamp Granularity");
    v40 = 0;
    v42 = 0;
    v43 = CFSTR("Ready");
    v41 = CFSTR("Latest Interval");
    valuePtr = 0;
  }
  v44 = v6;
  waipc::util::createCFDictDropNull<7l>((uint64_t)v32, a2);
  for (i = 13; i != -1; i -= 2)
  {
    v24 = (const void *)v32[i];
    if (v24)
      CFRelease(v24);
  }
  if (v6)
    CFRelease(v6);
  if (v21)
    CFRelease(v21);
  if (v19)
    CFRelease(v19);
  if (v17)
    CFRelease(v17);
  if (v15)
    CFRelease(v15);
  if (v13)
    CFRelease(v13);
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v26 = __ldaxr(p_shared_owners);
    while (__stlxr(v26 - 1, p_shared_owners));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void sub_21ABC712C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, const void *a12, const void *a13, const void *a14, const void *a15, char a16, uint64_t a17, uint64_t a18, char a19)
{
  waipc::util::_kv *v19;

  applesauce::CF::NumberRef::~NumberRef(&a12);
  applesauce::CF::NumberRef::~NumberRef(&a13);
  applesauce::CF::BooleanRef::~BooleanRef(&a14);
  applesauce::CF::BooleanRef::~BooleanRef(&a15);
  while (v19 != (waipc::util::_kv *)&a19)
  {
    v19 = (waipc::util::_kv *)((char *)v19 - 16);
    waipc::util::_kv::~_kv(v19);
  }
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void applesauce::CF::BooleanRef::~BooleanRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

char **std::transform[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__tree_node<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,void *> *,long>>,std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>,applesauce::CF::DictionaryRef({block_pointer})(std::pair<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo> const&)>(_QWORD *a1, _QWORD *a2, char **a3, uint64_t a4)
{
  _QWORD *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  BOOL v12;
  _BYTE v14[16];
  std::__shared_weak_count *v15;
  dispatch_group_t group;
  CFTypeRef cf;
  char **v18;

  v18 = a3;
  if (a1 != a2)
  {
    v6 = a1;
    do
    {
      std::pair<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>::pair[abi:ne180100]<waipc::timesync::BasebandProvider::bufferId const,waipc::timesync::BasebandService::bufferInfo,0>((uint64_t)v14, (uint64_t)(v6 + 4));
      (*(void (**)(CFTypeRef *__return_ptr, uint64_t, _BYTE *))(a4 + 16))(&cf, a4, v14);
      std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>::operator=[abi:ne180100](&v18, &cf);
      if (cf)
        CFRelease(cf);
      if (group)
      {
        dispatch_group_leave(group);
        if (group)
          dispatch_release(group);
      }
      v7 = v15;
      if (v15)
      {
        p_shared_owners = (unint64_t *)&v15->__shared_owners_;
        do
          v9 = __ldaxr(p_shared_owners);
        while (__stlxr(v9 - 1, p_shared_owners));
        if (!v9)
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
      }
      v10 = (_QWORD *)v6[1];
      if (v10)
      {
        do
        {
          v11 = v10;
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          v11 = (_QWORD *)v6[2];
          v12 = *v11 == (_QWORD)v6;
          v6 = v11;
        }
        while (!v12);
      }
      v6 = v11;
    }
    while (v11 != a2);
    return v18;
  }
  return a3;
}

void sub_21ABC73B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, const void *a15)
{
  applesauce::CF::DictionaryRef::~DictionaryRef(&a15);
  std::pair<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>::~pair((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void ___ZNK5waipc8timesync15BasebandService9dumpStateEv_block_invoke_2(uint64_t *a1@<X1>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  const __CFString *BufferName;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const void *v11;
  _QWORD v12[2];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x24BDAC8D0];
  BufferName = waipc::timesync::BasebandProvider::getBufferName(*(unsigned __int8 *)a1);
  v5 = BufferName;
  v12[0] = CFSTR("Name");
  if (BufferName)
    CFRetain(BufferName);
  v12[1] = v5;
  waipc::util::_kv::_kv<unsigned long const&,void>(v13, (uint64_t)CFSTR("Length"), a1 + 3);
  v6 = *MEMORY[0x24BDBD270];
  v7 = *MEMORY[0x24BDBD268];
  if (a1[4])
    v8 = *MEMORY[0x24BDBD268];
  else
    v8 = *MEMORY[0x24BDBD270];
  v13[2] = CFSTR("Ready");
  v13[3] = v8;
  if (*((_BYTE *)a1 + 40))
    v9 = v6;
  else
    v9 = v7;
  v13[4] = CFSTR("Awaiting Removal");
  v13[5] = v9;
  waipc::util::createCFDictDropNull<4l>((uint64_t)v12, a2);
  for (i = 7; i != -1; i -= 2)
  {
    v11 = (const void *)v12[i];
    if (v11)
      CFRelease(v11);
  }
}

void sub_21ABC74E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void ___ZNK5waipc8timesync15BasebandService9dumpStateEv_block_invoke_3(uint64_t *a1@<X1>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  CFTypeRef v4;
  uint64_t i;
  const void *v6;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  waipc::util::_kv::_kv<unsigned long long const&,void>(v7, (uint64_t)CFSTR("Mach Time"), a1);
  v4 = waipc::timesync::KalmanEstimator::dumpState((waipc::timesync::KalmanEstimator *)(a1 + 1));
  v7[2] = CFSTR("Estimator");
  v7[3] = v4;
  waipc::util::createCFDictDropNull<2l>((uint64_t)v7, a2);
  for (i = 3; i != -1; i -= 2)
  {
    v6 = (const void *)v7[i];
    if (v6)
      CFRelease(v6);
  }
}

void sub_21ABC75E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  uint64_t v9;
  uint64_t i;

  for (i = 16; i != -16; i -= 16)
    waipc::util::_kv::~_kv((waipc::util::_kv *)(v9 + i));
  applesauce::CF::TypeRef::~TypeRef(&a9);
  _Unwind_Resume(a1);
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<2l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3;
  CFIndex v4;
  void *v5;
  void *v6;
  CFDictionaryRef v7;
  void *values[2];
  void *keys[3];

  v3 = 0;
  v4 = 0;
  keys[2] = *(void **)MEMORY[0x24BDAC8D0];
  keys[0] = 0;
  keys[1] = 0;
  values[0] = 0;
  values[1] = 0;
  do
  {
    v5 = *(void **)(a1 + v3);
    if (v5)
    {
      v6 = *(void **)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        values[v4++] = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 32);
  v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)values, v4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<24l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3;
  CFIndex v4;
  void *v5;
  uint64_t v6;
  CFDictionaryRef v7;
  _OWORD v9[12];
  void *keys[2];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v3 = 0;
  v4 = 0;
  v22 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  *(_OWORD *)keys = 0u;
  v11 = 0u;
  memset(v9, 0, sizeof(v9));
  do
  {
    v5 = *(void **)(a1 + v3);
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        *((_QWORD *)v9 + v4++) = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 384);
  v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)v9, v4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

void errIfInexact(long double a1)
{
  if (fetestexcept(16))
  {
    nextafter(a1, -INFINITY);
    nextafter(a1, INFINITY);
  }
}

void waipc::util::GuardBlock::~GuardBlock(const void **this)
{
  void (**v2)(void);

  v2 = (void (**)(void))*this;
  if (v2)
  {
    v2[2]();
    if (*this)
      _Block_release(*this);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long long,waipc::timesync::KalmanEstimator>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x222222222222223)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(120 * a2);
}

uint64_t std::pair<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>::pair[abi:ne180100]<waipc::timesync::BasebandProvider::bufferId const,waipc::timesync::BasebandService::bufferInfo,0>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = *(NSObject **)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  if (v7)
  {
    dispatch_retain(v7);
    v8 = *(NSObject **)(a1 + 32);
    if (v8)
      dispatch_group_enter(v8);
  }
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

_QWORD *std::shared_ptr<waipc::timesync::BasebandService>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandService,void>(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &off_24DDBC728;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  std::shared_ptr<waipc::timesync::LegacyBasebandProvider>::__enable_weak_this[abi:ne180100]<waipc::timesync::BasebandProvider,waipc::timesync::LegacyBasebandProvider,void>((uint64_t)a1, a2, (uint64_t)a2);
  return a1;
}

void sub_21ABC79CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<waipc::timesync::BasebandService>::reset[abi:ne180100]((const os_unfair_lock **)va, 0);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<waipc::timesync::BasebandService *,std::shared_ptr<waipc::timesync::BasebandService>::__shared_ptr_default_delete<waipc::timesync::BasebandService,waipc::timesync::BasebandService>,std::allocator<waipc::timesync::BasebandService>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x220752F74);
}

const os_unfair_lock *std::__shared_ptr_pointer<waipc::timesync::BasebandService *,std::shared_ptr<waipc::timesync::BasebandService>::__shared_ptr_default_delete<waipc::timesync::BasebandService,waipc::timesync::BasebandService>,std::allocator<waipc::timesync::BasebandService>>::__on_zero_shared(uint64_t a1)
{
  const os_unfair_lock *result;

  result = *(const os_unfair_lock **)(a1 + 24);
  if (result)
  {
    waipc::timesync::BasebandService::~BasebandService(result);
    JUMPOUT(0x220752F74);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<waipc::timesync::BasebandService *,std::shared_ptr<waipc::timesync::BasebandService>::__shared_ptr_default_delete<waipc::timesync::BasebandService,waipc::timesync::BasebandService>,std::allocator<waipc::timesync::BasebandService>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

const os_unfair_lock *std::unique_ptr<waipc::timesync::BasebandService>::reset[abi:ne180100](const os_unfair_lock **a1, const os_unfair_lock *a2)
{
  const os_unfair_lock *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    waipc::timesync::BasebandService::~BasebandService(result);
    JUMPOUT(0x220752F74);
  }
  return result;
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context,std::allocator<waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDBC7A0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context,std::allocator<waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDBC7A0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x220752F74);
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context,std::allocator<waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context>>::__on_zero_shared(uint64_t a1)
{
  std::__destroy_at[abi:ne180100]<waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context,0>(a1 + 24);
}

void std::__destroy_at[abi:ne180100]<waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context,0>(uint64_t a1)
{
  std::__shared_weak_count *v2;
  void **v3;

  v3 = (void **)(a1 + 48);
  std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>>::__destroy_vector::operator()[abi:ne180100](&v3);
  v3 = (void **)(a1 + 24);
  std::vector<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>::__destroy_vector::operator()[abi:ne180100](&v3);
  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
}

void std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 16;
        std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>,0>(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>,0>(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 8);
  if (v1)
    _Block_release(v1);
}

void std::vector<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  const void **v2;
  const void **v4;
  void *v5;

  v1 = *a1;
  v2 = (const void **)**a1;
  if (v2)
  {
    v4 = (const void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
        std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>,0>(--v4);
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>,0>(const void **a1)
{
  const void *v1;

  v1 = *a1;
  if (v1)
    _Block_release(v1);
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context,std::allocator<waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDBC7F0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context,std::allocator<waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDBC7F0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x220752F74);
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context,std::allocator<waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context>>::__on_zero_shared(uint64_t a1)
{
  std::__destroy_at[abi:ne180100]<waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context,0>(a1 + 24);
}

void std::__destroy_at[abi:ne180100]<waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context,0>(uint64_t a1)
{
  std::__shared_weak_count *v2;
  void **v3;

  v3 = (void **)(a1 + 48);
  std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>::__destroy_vector::operator()[abi:ne180100](&v3);
  v3 = (void **)(a1 + 24);
  std::vector<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>::__destroy_vector::operator()[abi:ne180100](&v3);
  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
}

void std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 16;
        std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>,0>(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>,0>(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 8);
  if (v1)
    _Block_release(v1);
}

void std::vector<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  const void **v2;
  const void **v4;
  void *v5;

  v1 = *a1;
  v2 = (const void **)**a1;
  if (v2)
  {
    v4 = (const void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
        std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>,0>(--v4);
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>,0>(const void **a1)
{
  const void *v1;

  v1 = *a1;
  if (v1)
    _Block_release(v1);
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context,std::allocator<waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDBC840;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context,std::allocator<waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDBC840;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x220752F74);
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context,std::allocator<waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context>>::__on_zero_shared(uint64_t a1)
{
  std::__destroy_at[abi:ne180100]<waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context,0>(a1 + 24);
}

void std::__destroy_at[abi:ne180100]<waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context,0>(uint64_t a1)
{
  std::__shared_weak_count *v2;
  void **v3;

  v3 = (void **)(a1 + 48);
  std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>>::__destroy_vector::operator()[abi:ne180100](&v3);
  v3 = (void **)(a1 + 24);
  std::vector<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>::__destroy_vector::operator()[abi:ne180100](&v3);
  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
}

void std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 16;
        std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>,0>(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>,0>(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 8);
  if (v1)
    _Block_release(v1);
}

void std::vector<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  const void **v2;
  const void **v4;
  void *v5;

  v1 = *a1;
  v2 = (const void **)**a1;
  if (v2)
  {
    v4 = (const void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
        std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>,0>(--v4);
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>,0>(const void **a1)
{
  const void *v1;

  v1 = *a1;
  if (v1)
    _Block_release(v1);
}

void std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  std::__shared_weak_count *v4;

  if (a2)
  {
    std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::destroy(a1, a2[1]);
    v4 = (std::__shared_weak_count *)a2[6];
    if (v4)
      std::__shared_weak_count::__release_weak(v4);
    operator delete(a2);
  }
}

void std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<waipc::timesync::BasebandProvider::bufferId const,waipc::timesync::BasebandService::bufferInfo>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

uint64_t std::__destroy_at[abi:ne180100]<std::pair<waipc::timesync::BasebandProvider::bufferId const,waipc::timesync::BasebandService::bufferInfo>,0>(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *(NSObject **)(a1 + 32);
    if (v3)
      dispatch_release(v3);
  }
  return std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100](a1 + 8);
}

BOOL waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::hasObservers(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  unsigned __int8 *i;
  _BOOL8 v6;

  v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  v3 = (uint64_t)(*(_QWORD *)(a1 + 32) - *(_QWORD *)(a1 + 24)) >> 3;
  for (i = *(unsigned __int8 **)(a1 + 48); i != *(unsigned __int8 **)(a1 + 56); i += 16)
  {
    if (*i)
      ++v3;
    else
      --v3;
  }
  v6 = v3 != 0;
  os_unfair_lock_unlock(v2);
  return v6;
}

void waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::broadcast<BOOL,decltype(nullptr)>(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v4;
  _QWORD *v5;
  _QWORD *v6;

  v4 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  v5 = *(_QWORD **)(a1 + 24);
  v6 = *(_QWORD **)(a1 + 32);
  while (v5 != v6)
  {
    if (*v5)
      (*(void (**)(_QWORD, uint64_t, _QWORD))(*v5 + 16))(*v5, a2, 0);
    ++v5;
  }
  os_unfair_lock_unlock(v4);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  os_unfair_lock_lock(v4);
  waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::applyUpdates(a1);
  os_unfair_lock_unlock(v4);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
}

void sub_21ABC8208(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  os_unfair_lock_unlock(v1);
  os_unfair_lock_unlock(v2);
  _Unwind_Resume(a1);
}

void waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::applyUpdates(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void **v6;
  const void **v7;
  const void **v8;
  const void **v9;
  uint64_t i;
  char v11;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 20));
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  if (v4 != v5)
  {
    do
    {
      if (*(_BYTE *)v4)
      {
        v2 = std::vector<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>::push_back[abi:ne180100]((char **)(a1 + 24), (void **)(v4 + 8));
      }
      else
      {
        v7 = *(const void ***)(a1 + 24);
        v6 = *(const void ***)(a1 + 32);
        if (v7 != v6)
        {
          while (*v7 != *(const void **)(v4 + 8))
          {
            if (++v7 == v6)
            {
              v7 = *(const void ***)(a1 + 32);
              break;
            }
          }
        }
        if (v7 == v6)
          waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::applyUpdates(v2, v3, (uint64_t)v6);
        v2 = (uint64_t)std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> *,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> *,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> *>((uint64_t)&v11, v7 + 1, v6, v7);
        v8 = (const void **)v3;
        v9 = *(const void ***)(a1 + 32);
        if (v9 != (const void **)v3)
        {
          do
            std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>,0>(--v9);
          while (v9 != v8);
        }
        *(_QWORD *)(a1 + 32) = v8;
      }
      v4 += 16;
    }
    while (v4 != v5);
    v4 = *(_QWORD *)(a1 + 48);
    for (i = *(_QWORD *)(a1 + 56);
          i != v4;
          std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>,0>(i))
    {
      i -= 16;
    }
  }
  *(_QWORD *)(a1 + 56) = v4;
}

uint64_t std::vector<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>::push_back[abi:ne180100](char **a1, void **a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  _QWORD v24[5];

  v6 = (unint64_t)a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v10 = (uint64_t)(v7 - (_QWORD)*a1) >> 3;
    if ((unint64_t)(v10 + 1) >> 61)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v11 = v5 - (_QWORD)*a1;
    v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1))
      v12 = v10 + 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    v24[4] = v4;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(v4, v13);
      v16 = v15;
    }
    else
    {
      v14 = 0;
      v16 = 0;
    }
    v17 = &v14[8 * v10];
    std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> const&,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>*>(v17, a2);
    v19 = *a1;
    v18 = a1[1];
    if (v18 == *a1)
    {
      v21 = v17;
    }
    else
    {
      v20 = a1[1];
      v21 = v17;
      do
      {
        v22 = *((_QWORD *)v20 - 1);
        v20 -= 8;
        *((_QWORD *)v21 - 1) = v22;
        v21 -= 8;
        *(_QWORD *)v20 = 0;
      }
      while (v20 != v19);
    }
    v9 = v17 + 8;
    *a1 = v21;
    a1[1] = v17 + 8;
    v23 = a1[2];
    a1[2] = &v14[8 * v16];
    v24[2] = v18;
    v24[3] = v23;
    v24[0] = v19;
    v24[1] = v19;
    result = std::__split_buffer<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>::~__split_buffer((uint64_t)v24);
  }
  else
  {
    result = (uint64_t)std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> const&,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>*>(*(_QWORD **)(v4 - 8), a2);
    v9 = (char *)(v7 + 8);
  }
  a1[1] = v9;
  return result;
}

_QWORD *std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> const&,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>*>(_QWORD *a1, void **a2)
{
  void *v3;

  v3 = *a2;
  if (*a2)
    v3 = _Block_copy(v3);
  *a1 = v3;
  return a1;
}

uint64_t std::__split_buffer<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;
    std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>,0>((const void **)(i - 8));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

const void **std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> *,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> *,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> *>(uint64_t a1, const void **a2, const void **a3, const void **a4)
{
  const void **v5;
  const void *v7;
  const void *v8;

  v5 = a2;
  if (a2 != a3)
  {
    do
    {
      v7 = *v5;
      *v5 = 0;
      v8 = *a4;
      *a4 = v7;
      if (v8)
        _Block_release(v8);
      ++v5;
      ++a4;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

uint64_t *std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t *v6;

  v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      v3 = (uint64_t *)v4[2];
      v5 = *v3 == (_QWORD)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2)
    *a1 = v3;
  v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_7;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (v2)
  {
LABEL_7:
    v5 = 0;
    *(_QWORD *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 == v3)
  {
    *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
  }
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v12 = v7[2];
    if (*(uint64_t **)v12 == v7)
      break;
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      v13 = *(uint64_t **)(v12 + 8);
      v14 = *v13;
      *(_QWORD *)(v12 + 8) = *v13;
      if (v14)
        *(_QWORD *)(v14 + 16) = v12;
      v13[2] = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v13;
      *v13 = v12;
      *(_QWORD *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7)
        result = v7;
      v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (_QWORD *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16)
        goto LABEL_56;
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v22 = v15[1];
        *v7 = v22;
        if (v22)
          *(_QWORD *)(v22 + 16) = v7;
        v15[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      v25 = *v24;
      *(_QWORD *)(v23 + 8) = *v24;
      if (v25)
        *(_QWORD *)(v25 + 16) = v23;
      v24[2] = *(_QWORD *)(v23 + 16);
      *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
      *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_55;
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    v18 = v7[1];
    *(_QWORD *)v12 = v18;
    if (v18)
      *(_QWORD *)(v18 + 16) = v12;
    v7[2] = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(_QWORD *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12)
      result = v7;
    v7 = *(uint64_t **)v12;
  }
  v19 = (_QWORD *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24))
    goto LABEL_68;
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
    goto LABEL_49;
  }
  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v26 = *v20;
    v7[1] = *v20;
    if (v26)
      *(_QWORD *)(v26 + 16) = v7;
    v20[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v20;
    *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  v27 = *(_QWORD *)(*(_QWORD *)v23 + 8);
  *(_QWORD *)v23 = v27;
  if (v27)
    *(_QWORD *)(v27 + 16) = v23;
  v24[2] = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

void waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::broadcast<BOOL,__CFString const*>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_unfair_lock_s *v6;
  _QWORD *v7;
  _QWORD *v8;

  v6 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  v7 = *(_QWORD **)(a1 + 24);
  v8 = *(_QWORD **)(a1 + 32);
  while (v7 != v8)
  {
    if (*v7)
      (*(void (**)(_QWORD, uint64_t, uint64_t))(*v7 + 16))(*v7, a2, a3);
    ++v7;
  }
  os_unfair_lock_unlock(v6);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  os_unfair_lock_lock(v6);
  waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::applyUpdates(a1);
  os_unfair_lock_unlock(v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
}

void sub_21ABC89C8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  os_unfair_lock_unlock(v1);
  os_unfair_lock_unlock(v2);
  _Unwind_Resume(a1);
}

void waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context::broadcast<waipc::timesync::BasebandProvider::timesyncMeasurement*,unsigned long>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_unfair_lock_s *v6;
  _QWORD *v7;
  _QWORD *v8;

  v6 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  v7 = *(_QWORD **)(a1 + 24);
  v8 = *(_QWORD **)(a1 + 32);
  while (v7 != v8)
  {
    if (*v7)
      (*(void (**)(_QWORD, uint64_t, uint64_t))(*v7 + 16))(*v7, a2, a3);
    ++v7;
  }
  os_unfair_lock_unlock(v6);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  os_unfair_lock_lock(v6);
  waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context::applyUpdates(a1);
  os_unfair_lock_unlock(v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
}

void sub_21ABC8A80(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  os_unfair_lock_unlock(v1);
  os_unfair_lock_unlock(v2);
  _Unwind_Resume(a1);
}

void waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context::applyUpdates(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void **v6;
  const void **v7;
  const void **v8;
  const void **v9;
  uint64_t i;
  char v11;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 20));
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  if (v4 != v5)
  {
    do
    {
      if (*(_BYTE *)v4)
      {
        v2 = std::vector<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>::push_back[abi:ne180100]((char **)(a1 + 24), (void **)(v4 + 8));
      }
      else
      {
        v7 = *(const void ***)(a1 + 24);
        v6 = *(const void ***)(a1 + 32);
        if (v7 != v6)
        {
          while (*v7 != *(const void **)(v4 + 8))
          {
            if (++v7 == v6)
            {
              v7 = *(const void ***)(a1 + 32);
              break;
            }
          }
        }
        if (v7 == v6)
          waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::applyUpdates(v2, v3, (uint64_t)v6);
        v2 = (uint64_t)std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> *,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> *,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> *>((uint64_t)&v11, v7 + 1, v6, v7);
        v8 = (const void **)v3;
        v9 = *(const void ***)(a1 + 32);
        if (v9 != (const void **)v3)
        {
          do
            std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>,0>(--v9);
          while (v9 != v8);
        }
        *(_QWORD *)(a1 + 32) = v8;
      }
      v4 += 16;
    }
    while (v4 != v5);
    v4 = *(_QWORD *)(a1 + 48);
    for (i = *(_QWORD *)(a1 + 56);
          i != v4;
          std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>,0>(i))
    {
      i -= 16;
    }
  }
  *(_QWORD *)(a1 + 56) = v4;
}

uint64_t std::vector<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>::push_back[abi:ne180100](char **a1, void **a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  _QWORD v24[5];

  v6 = (unint64_t)a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v10 = (uint64_t)(v7 - (_QWORD)*a1) >> 3;
    if ((unint64_t)(v10 + 1) >> 61)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v11 = v5 - (_QWORD)*a1;
    v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1))
      v12 = v10 + 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    v24[4] = v4;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(v4, v13);
      v16 = v15;
    }
    else
    {
      v14 = 0;
      v16 = 0;
    }
    v17 = &v14[8 * v10];
    std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> const&,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>*>(v17, a2);
    v19 = *a1;
    v18 = a1[1];
    if (v18 == *a1)
    {
      v21 = v17;
    }
    else
    {
      v20 = a1[1];
      v21 = v17;
      do
      {
        v22 = *((_QWORD *)v20 - 1);
        v20 -= 8;
        *((_QWORD *)v21 - 1) = v22;
        v21 -= 8;
        *(_QWORD *)v20 = 0;
      }
      while (v20 != v19);
    }
    v9 = v17 + 8;
    *a1 = v21;
    a1[1] = v17 + 8;
    v23 = a1[2];
    a1[2] = &v14[8 * v16];
    v24[2] = v18;
    v24[3] = v23;
    v24[0] = v19;
    v24[1] = v19;
    result = std::__split_buffer<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>::~__split_buffer((uint64_t)v24);
  }
  else
  {
    result = (uint64_t)std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> const&,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>*>(*(_QWORD **)(v4 - 8), a2);
    v9 = (char *)(v7 + 8);
  }
  a1[1] = v9;
  return result;
}

_QWORD *std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> const&,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>*>(_QWORD *a1, void **a2)
{
  void *v3;

  v3 = *a2;
  if (*a2)
    v3 = _Block_copy(v3);
  *a1 = v3;
  return a1;
}

uint64_t std::__split_buffer<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;
    std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>,0>((const void **)(i - 8));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

const void **std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> *,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> *,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> *>(uint64_t a1, const void **a2, const void **a3, const void **a4)
{
  const void **v5;
  const void *v7;
  const void *v8;

  v5 = a2;
  if (a2 != a3)
  {
    do
    {
      v7 = *v5;
      *v5 = 0;
      v8 = *a4;
      *a4 = v7;
      if (v8)
        _Block_release(v8);
      ++v5;
      ++a4;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::broadcast<waipc::timesync::KalmanEstimator,BOOL>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_unfair_lock_s *v6;
  _QWORD *v7;
  _QWORD *v8;

  v6 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  v7 = *(_QWORD **)(a1 + 24);
  v8 = *(_QWORD **)(a1 + 32);
  while (v7 != v8)
  {
    if (*v7)
      (*(void (**)(_QWORD, uint64_t, uint64_t))(*v7 + 16))(*v7, a2, a3);
    ++v7;
  }
  os_unfair_lock_unlock(v6);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  os_unfair_lock_lock(v6);
  waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::applyUpdates(a1);
  os_unfair_lock_unlock(v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
}

void sub_21ABC8E4C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  os_unfair_lock_unlock(v1);
  os_unfair_lock_unlock(v2);
  _Unwind_Resume(a1);
}

void waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::applyUpdates(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void **v6;
  const void **v7;
  const void **v8;
  const void **v9;
  uint64_t i;
  char v11;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 20));
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  if (v4 != v5)
  {
    do
    {
      if (*(_BYTE *)v4)
      {
        v2 = std::vector<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>::push_back[abi:ne180100]((char **)(a1 + 24), (void **)(v4 + 8));
      }
      else
      {
        v7 = *(const void ***)(a1 + 24);
        v6 = *(const void ***)(a1 + 32);
        if (v7 != v6)
        {
          while (*v7 != *(const void **)(v4 + 8))
          {
            if (++v7 == v6)
            {
              v7 = *(const void ***)(a1 + 32);
              break;
            }
          }
        }
        if (v7 == v6)
          waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::applyUpdates(v2, v3, (uint64_t)v6);
        v2 = (uint64_t)std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> *,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> *,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> *>((uint64_t)&v11, v7 + 1, v6, v7);
        v8 = (const void **)v3;
        v9 = *(const void ***)(a1 + 32);
        if (v9 != (const void **)v3)
        {
          do
            std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>,0>(--v9);
          while (v9 != v8);
        }
        *(_QWORD *)(a1 + 32) = v8;
      }
      v4 += 16;
    }
    while (v4 != v5);
    v4 = *(_QWORD *)(a1 + 48);
    for (i = *(_QWORD *)(a1 + 56);
          i != v4;
          std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>,0>(i))
    {
      i -= 16;
    }
  }
  *(_QWORD *)(a1 + 56) = v4;
}

uint64_t std::vector<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>::push_back[abi:ne180100](char **a1, void **a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  _QWORD v24[5];

  v6 = (unint64_t)a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v10 = (uint64_t)(v7 - (_QWORD)*a1) >> 3;
    if ((unint64_t)(v10 + 1) >> 61)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v11 = v5 - (_QWORD)*a1;
    v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1))
      v12 = v10 + 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    v24[4] = v4;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(v4, v13);
      v16 = v15;
    }
    else
    {
      v14 = 0;
      v16 = 0;
    }
    v17 = &v14[8 * v10];
    std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> const&,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>*>(v17, a2);
    v19 = *a1;
    v18 = a1[1];
    if (v18 == *a1)
    {
      v21 = v17;
    }
    else
    {
      v20 = a1[1];
      v21 = v17;
      do
      {
        v22 = *((_QWORD *)v20 - 1);
        v20 -= 8;
        *((_QWORD *)v21 - 1) = v22;
        v21 -= 8;
        *(_QWORD *)v20 = 0;
      }
      while (v20 != v19);
    }
    v9 = v17 + 8;
    *a1 = v21;
    a1[1] = v17 + 8;
    v23 = a1[2];
    a1[2] = &v14[8 * v16];
    v24[2] = v18;
    v24[3] = v23;
    v24[0] = v19;
    v24[1] = v19;
    result = std::__split_buffer<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>::~__split_buffer((uint64_t)v24);
  }
  else
  {
    result = (uint64_t)std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> const&,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>*>(*(_QWORD **)(v4 - 8), a2);
    v9 = (char *)(v7 + 8);
  }
  a1[1] = v9;
  return result;
}

_QWORD *std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> const&,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>*>(_QWORD *a1, void **a2)
{
  void *v3;

  v3 = *a2;
  if (*a2)
    v3 = _Block_copy(v3);
  *a1 = v3;
  return a1;
}

uint64_t std::__split_buffer<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;
    std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>,0>((const void **)(i - 8));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

const void **std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> *,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> *,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> *>(uint64_t a1, const void **a2, const void **a3, const void **a4)
{
  const void **v5;
  const void *v7;
  const void *v8;

  v5 = a2;
  if (a2 != a3)
  {
    do
    {
      v7 = *v5;
      *v5 = 0;
      v8 = *a4;
      *a4 = v7;
      if (v8)
        _Block_release(v8);
      ++v5;
      ++a4;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context::broadcast<unsigned long long,double,unsigned long long>(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  os_unfair_lock_s *v8;
  _QWORD *v9;
  _QWORD *v10;

  v8 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  v9 = *(_QWORD **)(a1 + 24);
  v10 = *(_QWORD **)(a1 + 32);
  while (v9 != v10)
  {
    if (*v9)
      (*(void (**)(_QWORD, uint64_t, uint64_t, double))(*v9 + 16))(*v9, a2, a3, a4);
    ++v9;
  }
  os_unfair_lock_unlock(v8);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  os_unfair_lock_lock(v8);
  waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context::applyUpdates(a1);
  os_unfair_lock_unlock(v8);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
}

void sub_21ABC9228(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  os_unfair_lock_unlock(v1);
  os_unfair_lock_unlock(v2);
  _Unwind_Resume(a1);
}

void waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context::applyUpdates(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void **v6;
  const void **v7;
  const void **v8;
  const void **v9;
  uint64_t i;
  char v11;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 20));
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  if (v4 != v5)
  {
    do
    {
      if (*(_BYTE *)v4)
      {
        v2 = std::vector<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>::push_back[abi:ne180100]((char **)(a1 + 24), (void **)(v4 + 8));
      }
      else
      {
        v7 = *(const void ***)(a1 + 24);
        v6 = *(const void ***)(a1 + 32);
        if (v7 != v6)
        {
          while (*v7 != *(const void **)(v4 + 8))
          {
            if (++v7 == v6)
            {
              v7 = *(const void ***)(a1 + 32);
              break;
            }
          }
        }
        if (v7 == v6)
          waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::applyUpdates(v2, v3, (uint64_t)v6);
        v2 = (uint64_t)std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> *,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> *,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> *>((uint64_t)&v11, v7 + 1, v6, v7);
        v8 = (const void **)v3;
        v9 = *(const void ***)(a1 + 32);
        if (v9 != (const void **)v3)
        {
          do
            std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>,0>(--v9);
          while (v9 != v8);
        }
        *(_QWORD *)(a1 + 32) = v8;
      }
      v4 += 16;
    }
    while (v4 != v5);
    v4 = *(_QWORD *)(a1 + 48);
    for (i = *(_QWORD *)(a1 + 56);
          i != v4;
          std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>,0>(i))
    {
      i -= 16;
    }
  }
  *(_QWORD *)(a1 + 56) = v4;
}

uint64_t std::vector<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>::push_back[abi:ne180100](char **a1, void **a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  _QWORD v24[5];

  v6 = (unint64_t)a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v10 = (uint64_t)(v7 - (_QWORD)*a1) >> 3;
    if ((unint64_t)(v10 + 1) >> 61)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v11 = v5 - (_QWORD)*a1;
    v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1))
      v12 = v10 + 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    v24[4] = v4;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(v4, v13);
      v16 = v15;
    }
    else
    {
      v14 = 0;
      v16 = 0;
    }
    v17 = &v14[8 * v10];
    std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> const&,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>*>(v17, a2);
    v19 = *a1;
    v18 = a1[1];
    if (v18 == *a1)
    {
      v21 = v17;
    }
    else
    {
      v20 = a1[1];
      v21 = v17;
      do
      {
        v22 = *((_QWORD *)v20 - 1);
        v20 -= 8;
        *((_QWORD *)v21 - 1) = v22;
        v21 -= 8;
        *(_QWORD *)v20 = 0;
      }
      while (v20 != v19);
    }
    v9 = v17 + 8;
    *a1 = v21;
    a1[1] = v17 + 8;
    v23 = a1[2];
    a1[2] = &v14[8 * v16];
    v24[2] = v18;
    v24[3] = v23;
    v24[0] = v19;
    v24[1] = v19;
    result = std::__split_buffer<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>::~__split_buffer((uint64_t)v24);
  }
  else
  {
    result = (uint64_t)std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> const&,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>*>(*(_QWORD **)(v4 - 8), a2);
    v9 = (char *)(v7 + 8);
  }
  a1[1] = v9;
  return result;
}

_QWORD *std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> const&,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>*>(_QWORD *a1, void **a2)
{
  void *v3;

  v3 = *a2;
  if (*a2)
    v3 = _Block_copy(v3);
  *a1 = v3;
  return a1;
}

void std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>,0>(const void **a1)
{
  const void *v1;

  v1 = *a1;
  if (v1)
    _Block_release(v1);
}

uint64_t std::__split_buffer<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;
    std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>,0>((const void **)(i - 8));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

const void **std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> *,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> *,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> *>(uint64_t a1, const void **a2, const void **a3, const void **a4)
{
  const void **v5;
  const void *v7;
  const void *v8;

  v5 = a2;
  if (a2 != a3)
  {
    do
    {
      v7 = *v5;
      *v5 = 0;
      v8 = *a4;
      *a4 = v7;
      if (v8)
        _Block_release(v8);
      ++v5;
      ++a4;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>,0>(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 8);
  if (v1)
    _Block_release(v1);
}

uint64_t *std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__equal_range_multi<waipc::timesync::BasebandProvider::bufferId>(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t *result;
  uint64_t **v7;
  unsigned int v8;
  BOOL v9;
  uint64_t **v10;
  uint64_t v11;
  uint64_t *v12;

  v2 = (uint64_t *)(a1 + 8);
  v3 = *(uint64_t **)(a1 + 8);
  if (!v3)
    return v2;
  v4 = *a2;
  while (1)
  {
    v5 = *((unsigned __int8 *)v3 + 32);
    if (v4 >= v5)
      break;
    v2 = v3;
LABEL_7:
    v3 = (uint64_t *)*v3;
    if (!v3)
      return v2;
  }
  if (v5 < v4)
  {
    ++v3;
    goto LABEL_7;
  }
  v7 = (uint64_t **)*v3;
  result = v3;
  if (*v3)
  {
    result = v3;
    do
    {
      v8 = *((unsigned __int8 *)v7 + 32);
      v9 = v8 >= v4;
      if (v8 >= v4)
        v10 = v7;
      else
        v10 = v7 + 1;
      if (v9)
        result = (uint64_t *)v7;
      v7 = (uint64_t **)*v10;
    }
    while (*v10);
  }
  v11 = v3[1];
  if (v11)
  {
    do
    {
      if (v4 >= *(unsigned __int8 *)(v11 + 32))
        v12 = (uint64_t *)(v11 + 8);
      else
        v12 = (uint64_t *)v11;
      v11 = *v12;
    }
    while (*v12);
  }
  return result;
}

void waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context::addObserver(uint64_t a1@<X0>, const void *a2@<X1>, void **a3@<X8>)
{
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  _QWORD aBlock[7];
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *(*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  void *v19;
  _QWORD v20[6];
  std::__shared_weak_count *v21;

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3802000000;
  v20[3] = __Block_byref_object_copy__118;
  v20[4] = __Block_byref_object_dispose__119;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v14, (_QWORD *)a1);
  v6 = (std::__shared_weak_count *)v15;
  v20[5] = v14;
  v21 = (std::__shared_weak_count *)v15;
  if (v15)
  {
    v7 = (unint64_t *)(v15 + 2);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3002000000;
  v17 = __Block_byref_object_copy__120;
  v18 = __Block_byref_object_dispose__121;
  if (a2)
    v11 = _Block_copy(a2);
  else
    v11 = 0;
  v19 = v11;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  v13 = 1;
  std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> const&>((uint64_t *)(a1 + 48), &v13, (void **)v15 + 5);
  if (os_unfair_lock_trylock((os_unfair_lock_t)(a1 + 20)))
  {
    waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context::applyUpdates(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN5waipc4util11BroadcasterIFvPKNS_8timesync16BasebandProvider19timesyncMeasurementEmEE7context11addObserverEU13block_pointerS7__block_invoke;
  aBlock[3] = &unk_24DDBC888;
  aBlock[4] = v20;
  aBlock[5] = &v14;
  aBlock[6] = a1;
  *a3 = _Block_copy(aBlock);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  _Block_object_dispose(&v14, 8);
  if (v19)
    _Block_release(v19);
  _Block_object_dispose(v20, 8);
  if (v21)
    std::__shared_weak_count::__release_weak(v21);
}

void sub_21ABC97F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *aBlock)
{
  os_unfair_lock_s *v23;
  uint64_t v24;
  std::__shared_weak_count *v26;

  os_unfair_lock_unlock(v23);
  _Block_object_dispose(&a18, 8);
  if (aBlock)
    _Block_release(aBlock);
  _Block_object_dispose((const void *)(v24 - 104), 8);
  v26 = *(std::__shared_weak_count **)(v24 - 56);
  if (v26)
    std::__shared_weak_count::__release_weak(v26);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__118(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __Block_byref_object_dispose__119(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void *__Block_byref_object_copy__120(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 40);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__121(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 40);
  if (v1)
    _Block_release(v1);
}

uint64_t std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> const&>(uint64_t *a1, _BYTE *a2, void **a3)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  _QWORD v26[5];

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_QWORD *)(v6 - 8);
  if (v9 >= v8)
  {
    v11 = (uint64_t)(v9 - *a1) >> 4;
    if ((unint64_t)(v11 + 1) >> 60)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v12 = v7 - *a1;
    v13 = v12 >> 3;
    if (v12 >> 3 <= (unint64_t)(v11 + 1))
      v13 = v11 + 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
      v14 = 0xFFFFFFFFFFFFFFFLL;
    else
      v14 = v13;
    v26[4] = v6;
    if (v14)
    {
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>>(v6, v14);
      v17 = v16;
    }
    else
    {
      v15 = 0;
      v17 = 0;
    }
    v18 = std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> const&,0>((uint64_t)&v15[16 * v11], a2, a3);
    v20 = *a1;
    v19 = a1[1];
    if (v19 == *a1)
    {
      v22 = v18;
    }
    else
    {
      v21 = a1[1];
      v22 = v18;
      do
      {
        v23 = *(_BYTE *)(v21 - 16);
        v21 -= 16;
        *(_BYTE *)(v22 - 16) = v23;
        v22 -= 16;
        *(_QWORD *)(v22 + 8) = *(_QWORD *)(v21 + 8);
        *(_QWORD *)(v21 + 8) = 0;
      }
      while (v21 != v20);
    }
    v10 = v18 + 16;
    *a1 = v22;
    a1[1] = v18 + 16;
    v24 = a1[2];
    a1[2] = (uint64_t)&v15[16 * v17];
    v26[2] = v19;
    v26[3] = v24;
    v26[0] = v20;
    v26[1] = v20;
    std::__split_buffer<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>::~__split_buffer((uint64_t)v26);
  }
  else
  {
    std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> const&,0>(*(_QWORD *)(v6 - 8), a2, a3);
    v10 = v9 + 16;
  }
  a1[1] = v10;
  return v10 - 16;
}

void ___ZN5waipc4util11BroadcasterIFvPKNS_8timesync16BasebandProvider19timesyncMeasurementEmEE7context11addObserverEU13block_pointerS7__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  char v9;
  std::__shared_weak_count *v11;

  v2 = *(_QWORD *)(a1[4] + 8);
  v3 = *(std::__shared_weak_count **)(v2 + 48);
  if (v3)
  {
    v4 = a1[6];
    v5 = std::__shared_weak_count::lock(v3);
    v11 = v5;
    if (v5)
    {
      v6 = v5;
      if (*(_QWORD *)(v2 + 40))
      {
        os_unfair_lock_lock((os_unfair_lock_t)(v4 + 16));
        v9 = 0;
        std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> const&>((uint64_t *)(v4 + 48), &v9, (void **)(*(_QWORD *)(a1[5] + 8) + 40));
        if (os_unfair_lock_trylock((os_unfair_lock_t)(v4 + 20)))
        {
          waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context::applyUpdates(v4);
          os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 20));
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 16));
      }
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_21ABC9AE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  os_unfair_lock_s *v11;

  os_unfair_lock_unlock(v11);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

uint64_t std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> const&,0>(uint64_t a1, _BYTE *a2, void **a3)
{
  void *v4;

  *(_BYTE *)a1 = *a2;
  v4 = *a3;
  if (*a3)
    v4 = _Block_copy(v4);
  *(_QWORD *)(a1 + 8) = v4;
  return a1;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

uint64_t std::__split_buffer<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 16;
    std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>,0>(i - 16);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::addObserver(uint64_t a1@<X0>, const void *a2@<X1>, void **a3@<X8>)
{
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  _QWORD aBlock[7];
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *(*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  void *v19;
  _QWORD v20[6];
  std::__shared_weak_count *v21;

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3802000000;
  v20[3] = __Block_byref_object_copy__123;
  v20[4] = __Block_byref_object_dispose__124;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v14, (_QWORD *)a1);
  v6 = (std::__shared_weak_count *)v15;
  v20[5] = v14;
  v21 = (std::__shared_weak_count *)v15;
  if (v15)
  {
    v7 = (unint64_t *)(v15 + 2);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3002000000;
  v17 = __Block_byref_object_copy__125;
  v18 = __Block_byref_object_dispose__126;
  if (a2)
    v11 = _Block_copy(a2);
  else
    v11 = 0;
  v19 = v11;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  v13 = 1;
  std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> const&>((uint64_t *)(a1 + 48), &v13, (void **)v15 + 5);
  if (os_unfair_lock_trylock((os_unfair_lock_t)(a1 + 20)))
  {
    waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::applyUpdates(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN5waipc4util11BroadcasterIFvbPK10__CFStringEE7context11addObserverEU13block_pointerS5__block_invoke;
  aBlock[3] = &unk_24DDBC8B0;
  aBlock[4] = v20;
  aBlock[5] = &v14;
  aBlock[6] = a1;
  *a3 = _Block_copy(aBlock);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  _Block_object_dispose(&v14, 8);
  if (v19)
    _Block_release(v19);
  _Block_object_dispose(v20, 8);
  if (v21)
    std::__shared_weak_count::__release_weak(v21);
}

void sub_21ABC9D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *aBlock)
{
  os_unfair_lock_s *v23;
  uint64_t v24;
  std::__shared_weak_count *v26;

  os_unfair_lock_unlock(v23);
  _Block_object_dispose(&a18, 8);
  if (aBlock)
    _Block_release(aBlock);
  _Block_object_dispose((const void *)(v24 - 104), 8);
  v26 = *(std::__shared_weak_count **)(v24 - 56);
  if (v26)
    std::__shared_weak_count::__release_weak(v26);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__123(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __Block_byref_object_dispose__124(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void *__Block_byref_object_copy__125(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 40);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__126(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 40);
  if (v1)
    _Block_release(v1);
}

uint64_t std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> const&>(uint64_t *a1, _BYTE *a2, void **a3)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  _QWORD v26[5];

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_QWORD *)(v6 - 8);
  if (v9 >= v8)
  {
    v11 = (uint64_t)(v9 - *a1) >> 4;
    if ((unint64_t)(v11 + 1) >> 60)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v12 = v7 - *a1;
    v13 = v12 >> 3;
    if (v12 >> 3 <= (unint64_t)(v11 + 1))
      v13 = v11 + 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
      v14 = 0xFFFFFFFFFFFFFFFLL;
    else
      v14 = v13;
    v26[4] = v6;
    if (v14)
    {
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>>(v6, v14);
      v17 = v16;
    }
    else
    {
      v15 = 0;
      v17 = 0;
    }
    v18 = std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> const&,0>((uint64_t)&v15[16 * v11], a2, a3);
    v20 = *a1;
    v19 = a1[1];
    if (v19 == *a1)
    {
      v22 = v18;
    }
    else
    {
      v21 = a1[1];
      v22 = v18;
      do
      {
        v23 = *(_BYTE *)(v21 - 16);
        v21 -= 16;
        *(_BYTE *)(v22 - 16) = v23;
        v22 -= 16;
        *(_QWORD *)(v22 + 8) = *(_QWORD *)(v21 + 8);
        *(_QWORD *)(v21 + 8) = 0;
      }
      while (v21 != v20);
    }
    v10 = v18 + 16;
    *a1 = v22;
    a1[1] = v18 + 16;
    v24 = a1[2];
    a1[2] = (uint64_t)&v15[16 * v17];
    v26[2] = v19;
    v26[3] = v24;
    v26[0] = v20;
    v26[1] = v20;
    std::__split_buffer<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>>::~__split_buffer((uint64_t)v26);
  }
  else
  {
    std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> const&,0>(*(_QWORD *)(v6 - 8), a2, a3);
    v10 = v9 + 16;
  }
  a1[1] = v10;
  return v10 - 16;
}

void ___ZN5waipc4util11BroadcasterIFvbPK10__CFStringEE7context11addObserverEU13block_pointerS5__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  char v9;
  std::__shared_weak_count *v11;

  v2 = *(_QWORD *)(a1[4] + 8);
  v3 = *(std::__shared_weak_count **)(v2 + 48);
  if (v3)
  {
    v4 = a1[6];
    v5 = std::__shared_weak_count::lock(v3);
    v11 = v5;
    if (v5)
    {
      v6 = v5;
      if (*(_QWORD *)(v2 + 40))
      {
        os_unfair_lock_lock((os_unfair_lock_t)(v4 + 16));
        v9 = 0;
        std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> const&>((uint64_t *)(v4 + 48), &v9, (void **)(*(_QWORD *)(a1[5] + 8) + 40));
        if (os_unfair_lock_trylock((os_unfair_lock_t)(v4 + 20)))
        {
          waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::applyUpdates(v4);
          os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 20));
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 16));
      }
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_21ABCA07C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  os_unfair_lock_s *v11;

  os_unfair_lock_unlock(v11);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

uint64_t std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> const&,0>(uint64_t a1, _BYTE *a2, void **a3)
{
  void *v4;

  *(_BYTE *)a1 = *a2;
  v4 = *a3;
  if (*a3)
    v4 = _Block_copy(v4);
  *(_QWORD *)(a1 + 8) = v4;
  return a1;
}

uint64_t std::__split_buffer<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 16;
    std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>,0>(i - 16);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::addObserver(uint64_t a1@<X0>, const void *a2@<X1>, void **a3@<X8>)
{
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  _QWORD aBlock[7];
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *(*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  void *v19;
  _QWORD v20[6];
  std::__shared_weak_count *v21;

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3802000000;
  v20[3] = __Block_byref_object_copy__128;
  v20[4] = __Block_byref_object_dispose__129;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v14, (_QWORD *)a1);
  v6 = (std::__shared_weak_count *)v15;
  v20[5] = v14;
  v21 = (std::__shared_weak_count *)v15;
  if (v15)
  {
    v7 = (unint64_t *)(v15 + 2);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3002000000;
  v17 = __Block_byref_object_copy__130;
  v18 = __Block_byref_object_dispose__131;
  if (a2)
    v11 = _Block_copy(a2);
  else
    v11 = 0;
  v19 = v11;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  v13 = 1;
  std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> const&>((uint64_t *)(a1 + 48), &v13, (void **)v15 + 5);
  if (os_unfair_lock_trylock((os_unfair_lock_t)(a1 + 20)))
  {
    waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::applyUpdates(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN5waipc4util11BroadcasterIFvRKNS_8timesync15KalmanEstimatorEbEE7context11addObserverEU13block_pointerS6__block_invoke;
  aBlock[3] = &unk_24DDBC8D8;
  aBlock[4] = v20;
  aBlock[5] = &v14;
  aBlock[6] = a1;
  *a3 = _Block_copy(aBlock);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  _Block_object_dispose(&v14, 8);
  if (v19)
    _Block_release(v19);
  _Block_object_dispose(v20, 8);
  if (v21)
    std::__shared_weak_count::__release_weak(v21);
}

void sub_21ABCA2EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *aBlock)
{
  os_unfair_lock_s *v23;
  uint64_t v24;
  std::__shared_weak_count *v26;

  os_unfair_lock_unlock(v23);
  _Block_object_dispose(&a18, 8);
  if (aBlock)
    _Block_release(aBlock);
  _Block_object_dispose((const void *)(v24 - 104), 8);
  v26 = *(std::__shared_weak_count **)(v24 - 56);
  if (v26)
    std::__shared_weak_count::__release_weak(v26);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__128(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __Block_byref_object_dispose__129(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void *__Block_byref_object_copy__130(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 40);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__131(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 40);
  if (v1)
    _Block_release(v1);
}

uint64_t std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> const&>(uint64_t *a1, _BYTE *a2, void **a3)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  _QWORD v26[5];

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_QWORD *)(v6 - 8);
  if (v9 >= v8)
  {
    v11 = (uint64_t)(v9 - *a1) >> 4;
    if ((unint64_t)(v11 + 1) >> 60)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v12 = v7 - *a1;
    v13 = v12 >> 3;
    if (v12 >> 3 <= (unint64_t)(v11 + 1))
      v13 = v11 + 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
      v14 = 0xFFFFFFFFFFFFFFFLL;
    else
      v14 = v13;
    v26[4] = v6;
    if (v14)
    {
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>>(v6, v14);
      v17 = v16;
    }
    else
    {
      v15 = 0;
      v17 = 0;
    }
    v18 = std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> const&,0>((uint64_t)&v15[16 * v11], a2, a3);
    v20 = *a1;
    v19 = a1[1];
    if (v19 == *a1)
    {
      v22 = v18;
    }
    else
    {
      v21 = a1[1];
      v22 = v18;
      do
      {
        v23 = *(_BYTE *)(v21 - 16);
        v21 -= 16;
        *(_BYTE *)(v22 - 16) = v23;
        v22 -= 16;
        *(_QWORD *)(v22 + 8) = *(_QWORD *)(v21 + 8);
        *(_QWORD *)(v21 + 8) = 0;
      }
      while (v21 != v20);
    }
    v10 = v18 + 16;
    *a1 = v22;
    a1[1] = v18 + 16;
    v24 = a1[2];
    a1[2] = (uint64_t)&v15[16 * v17];
    v26[2] = v19;
    v26[3] = v24;
    v26[0] = v20;
    v26[1] = v20;
    std::__split_buffer<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>>::~__split_buffer((uint64_t)v26);
  }
  else
  {
    std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> const&,0>(*(_QWORD *)(v6 - 8), a2, a3);
    v10 = v9 + 16;
  }
  a1[1] = v10;
  return v10 - 16;
}

void ___ZN5waipc4util11BroadcasterIFvRKNS_8timesync15KalmanEstimatorEbEE7context11addObserverEU13block_pointerS6__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  char v9;
  std::__shared_weak_count *v11;

  v2 = *(_QWORD *)(a1[4] + 8);
  v3 = *(std::__shared_weak_count **)(v2 + 48);
  if (v3)
  {
    v4 = a1[6];
    v5 = std::__shared_weak_count::lock(v3);
    v11 = v5;
    if (v5)
    {
      v6 = v5;
      if (*(_QWORD *)(v2 + 40))
      {
        os_unfair_lock_lock((os_unfair_lock_t)(v4 + 16));
        v9 = 0;
        std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> const&>((uint64_t *)(v4 + 48), &v9, (void **)(*(_QWORD *)(a1[5] + 8) + 40));
        if (os_unfair_lock_trylock((os_unfair_lock_t)(v4 + 20)))
        {
          waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::applyUpdates(v4);
          os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 20));
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 16));
      }
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_21ABCA5DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  os_unfair_lock_s *v11;

  os_unfair_lock_unlock(v11);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

uint64_t std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> const&,0>(uint64_t a1, _BYTE *a2, void **a3)
{
  void *v4;

  *(_BYTE *)a1 = *a2;
  v4 = *a3;
  if (*a3)
    v4 = _Block_copy(v4);
  *(_QWORD *)(a1 + 8) = v4;
  return a1;
}

uint64_t std::__split_buffer<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 16;
    std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>,0>(i - 16);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context::addObserver(uint64_t a1@<X0>, const void *a2@<X1>, void **a3@<X8>)
{
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  _QWORD aBlock[7];
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *(*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  void *v19;
  _QWORD v20[6];
  std::__shared_weak_count *v21;

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3802000000;
  v20[3] = __Block_byref_object_copy__133;
  v20[4] = __Block_byref_object_dispose__134;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v14, (_QWORD *)a1);
  v6 = (std::__shared_weak_count *)v15;
  v20[5] = v14;
  v21 = (std::__shared_weak_count *)v15;
  if (v15)
  {
    v7 = (unint64_t *)(v15 + 2);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3002000000;
  v17 = __Block_byref_object_copy__135;
  v18 = __Block_byref_object_dispose__136;
  if (a2)
    v11 = _Block_copy(a2);
  else
    v11 = 0;
  v19 = v11;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  v13 = 1;
  std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> const&>((uint64_t *)(a1 + 48), &v13, (void **)v15 + 5);
  if (os_unfair_lock_trylock((os_unfair_lock_t)(a1 + 20)))
  {
    waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context::applyUpdates(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN5waipc4util11BroadcasterIFvydyEE7context11addObserverEU13block_pointerS2__block_invoke;
  aBlock[3] = &unk_24DDBC900;
  aBlock[4] = v20;
  aBlock[5] = &v14;
  aBlock[6] = a1;
  *a3 = _Block_copy(aBlock);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  _Block_object_dispose(&v14, 8);
  if (v19)
    _Block_release(v19);
  _Block_object_dispose(v20, 8);
  if (v21)
    std::__shared_weak_count::__release_weak(v21);
}

void sub_21ABCA84C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *aBlock)
{
  os_unfair_lock_s *v23;
  uint64_t v24;
  std::__shared_weak_count *v26;

  os_unfair_lock_unlock(v23);
  _Block_object_dispose(&a18, 8);
  if (aBlock)
    _Block_release(aBlock);
  _Block_object_dispose((const void *)(v24 - 104), 8);
  v26 = *(std::__shared_weak_count **)(v24 - 56);
  if (v26)
    std::__shared_weak_count::__release_weak(v26);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__133(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __Block_byref_object_dispose__134(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void *__Block_byref_object_copy__135(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 40);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__136(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 40);
  if (v1)
    _Block_release(v1);
}

uint64_t std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> const&>(uint64_t *a1, _BYTE *a2, void **a3)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  _QWORD v26[5];

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_QWORD *)(v6 - 8);
  if (v9 >= v8)
  {
    v11 = (uint64_t)(v9 - *a1) >> 4;
    if ((unint64_t)(v11 + 1) >> 60)
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    v12 = v7 - *a1;
    v13 = v12 >> 3;
    if (v12 >> 3 <= (unint64_t)(v11 + 1))
      v13 = v11 + 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
      v14 = 0xFFFFFFFFFFFFFFFLL;
    else
      v14 = v13;
    v26[4] = v6;
    if (v14)
    {
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>>(v6, v14);
      v17 = v16;
    }
    else
    {
      v15 = 0;
      v17 = 0;
    }
    v18 = std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> const&,0>((uint64_t)&v15[16 * v11], a2, a3);
    v20 = *a1;
    v19 = a1[1];
    if (v19 == *a1)
    {
      v22 = v18;
    }
    else
    {
      v21 = a1[1];
      v22 = v18;
      do
      {
        v23 = *(_BYTE *)(v21 - 16);
        v21 -= 16;
        *(_BYTE *)(v22 - 16) = v23;
        v22 -= 16;
        *(_QWORD *)(v22 + 8) = *(_QWORD *)(v21 + 8);
        *(_QWORD *)(v21 + 8) = 0;
      }
      while (v21 != v20);
    }
    v10 = v18 + 16;
    *a1 = v22;
    a1[1] = v18 + 16;
    v24 = a1[2];
    a1[2] = (uint64_t)&v15[16 * v17];
    v26[2] = v19;
    v26[3] = v24;
    v26[0] = v20;
    v26[1] = v20;
    std::__split_buffer<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>>::~__split_buffer((uint64_t)v26);
  }
  else
  {
    std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> const&,0>(*(_QWORD *)(v6 - 8), a2, a3);
    v10 = v9 + 16;
  }
  a1[1] = v10;
  return v10 - 16;
}

void ___ZN5waipc4util11BroadcasterIFvydyEE7context11addObserverEU13block_pointerS2__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  char v9;
  std::__shared_weak_count *v11;

  v2 = *(_QWORD *)(a1[4] + 8);
  v3 = *(std::__shared_weak_count **)(v2 + 48);
  if (v3)
  {
    v4 = a1[6];
    v5 = std::__shared_weak_count::lock(v3);
    v11 = v5;
    if (v5)
    {
      v6 = v5;
      if (*(_QWORD *)(v2 + 40))
      {
        os_unfair_lock_lock((os_unfair_lock_t)(v4 + 16));
        v9 = 0;
        std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> const&>((uint64_t *)(v4 + 48), &v9, (void **)(*(_QWORD *)(a1[5] + 8) + 40));
        if (os_unfair_lock_trylock((os_unfair_lock_t)(v4 + 20)))
        {
          waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context::applyUpdates(v4);
          os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 20));
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 16));
      }
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_21ABCAB3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  os_unfair_lock_s *v11;

  os_unfair_lock_unlock(v11);
  std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

uint64_t std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> const&,0>(uint64_t a1, _BYTE *a2, void **a3)
{
  void *v4;

  *(_BYTE *)a1 = *a2;
  v4 = *a3;
  if (*a3)
    v4 = _Block_copy(v4);
  *(_QWORD *)(a1 + 8) = v4;
  return a1;
}

uint64_t std::__split_buffer<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 16;
    std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>,0>(i - 16);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t *std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::erase(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v3;
  std::__shared_weak_count *v4;

  v3 = std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__remove_node_pointer(a1, a2);
  v4 = (std::__shared_weak_count *)a2[6];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(a2);
  return v3;
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context,std::allocator<waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDBC930;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context,std::allocator<waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDBC930;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x220752F74);
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context,std::allocator<waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context>>::__on_zero_shared(uint64_t a1)
{
  std::__destroy_at[abi:ne180100]<waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context,0>(a1 + 24);
}

void std::__destroy_at[abi:ne180100]<waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context,0>(uint64_t a1)
{
  std::__shared_weak_count *v2;
  void **v3;

  v3 = (void **)(a1 + 48);
  std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>>::__destroy_vector::operator()[abi:ne180100](&v3);
  v3 = (void **)(a1 + 24);
  std::vector<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>::__destroy_vector::operator()[abi:ne180100](&v3);
  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
}

void std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 16;
        std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>,0>(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  const void **v2;
  const void **v4;
  void *v5;

  v1 = *a1;
  v2 = (const void **)**a1;
  if (v2)
  {
    v4 = (const void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
        std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>,0>(--v4);
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__shared_ptr_emplace<waipc::timesync::BasebandService::timestampSubscription>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDBC980;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<waipc::timesync::BasebandService::timestampSubscription>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDBC980;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x220752F74);
}

uint64_t std::__shared_ptr_emplace<waipc::timesync::BasebandService::timestampSubscription>::__on_zero_shared(uint64_t a1)
{
  return std::__destroy_at[abi:ne180100]<waipc::timesync::BasebandService::timestampSubscription,0>(a1 + 24);
}

uint64_t std::__destroy_at[abi:ne180100]<waipc::timesync::BasebandService::timestampSubscription,0>(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  v2 = *(NSObject **)(a1 + 56);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *(NSObject **)(a1 + 56);
    if (v3)
      dispatch_release(v3);
  }
  waipc::util::GuardBlock::~GuardBlock((const void **)(a1 + 48));
  return std::shared_ptr<waipc::timesync::BasebandProvider>::~shared_ptr[abi:ne180100](a1 + 32);
}

uint64_t **std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::__emplace_unique_key_args<waipc::timesync::BasebandProvider::timestampId,std::piecewise_construct_t const&,std::tuple<waipc::timesync::BasebandProvider::timestampId const&>,std::tuple<>>(uint64_t **a1, unsigned __int8 *a2, uint64_t a3, _BYTE **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  unsigned int v8;
  uint64_t **v9;
  unsigned int v10;
  _BYTE *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = *((unsigned __int8 *)v6 + 32);
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = operator new(0x38uLL);
    v11[32] = **a4;
    *((_QWORD *)v11 + 5) = 0;
    *((_QWORD *)v11 + 6) = 0;
    std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t *std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__emplace_hint_multi<std::pair<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t *v6;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t **leaf;
  uint64_t *v11;
  uint64_t v13;
  uint64_t *v14[2];
  char v15;

  v6 = a1 + 1;
  v7 = (char *)operator new(0x50uLL);
  v8 = *(_BYTE *)a3;
  *(_OWORD *)(v7 + 40) = *(_OWORD *)(a3 + 8);
  v9 = *(_QWORD *)(a3 + 32);
  *((_QWORD *)v7 + 7) = *(_QWORD *)(a3 + 24);
  *((_QWORD *)v7 + 8) = v9;
  v7[72] = *(_BYTE *)(a3 + 40);
  v7[32] = v8;
  v14[0] = (uint64_t *)v7;
  v14[1] = v6;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 32) = 0;
  v15 = 1;
  leaf = (uint64_t **)std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__find_leaf(a1, a2, &v13, (unsigned __int8 *)v7 + 32);
  std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::__insert_node_at((uint64_t **)a1, v13, leaf, v14[0]);
  v11 = v14[0];
  v14[0] = 0;
  std::unique_ptr<std::__tree_node<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,void *>>>>::reset[abi:ne180100]((uint64_t)v14, 0);
  return v11;
}

void sub_21ABCB184(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__tree_node<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

_QWORD *std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__find_leaf(_QWORD *a1, _QWORD *a2, _QWORD *a3, unsigned __int8 *a4)
{
  _QWORD *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  BOOL v11;
  unsigned int v12;
  uint64_t v13;

  v4 = a1 + 1;
  if (a1 + 1 != a2)
  {
    v5 = *a4;
    if (*((unsigned __int8 *)a2 + 32) < v5)
    {
      while (1)
      {
        v6 = *v4;
        a2 = v4;
        if (!*v4)
          break;
        while (1)
        {
          v4 = (_QWORD *)v6;
          if (*(unsigned __int8 *)(v6 + 32) >= v5)
            break;
          v6 = *(_QWORD *)(v6 + 8);
          if (!v6)
            goto LABEL_19;
        }
      }
LABEL_20:
      *a3 = v4;
      return a2;
    }
  }
  v7 = *a2;
  if ((_QWORD *)*a1 == a2)
  {
    v9 = a2;
  }
  else
  {
    if (v7)
    {
      v8 = (_QWORD *)*a2;
      do
      {
        v9 = v8;
        v8 = (_QWORD *)v8[1];
      }
      while (v8);
    }
    else
    {
      v10 = a2;
      do
      {
        v9 = (_QWORD *)v10[2];
        v11 = *v9 == (_QWORD)v10;
        v10 = v9;
      }
      while (v11);
    }
    v12 = *a4;
    if (v12 < *((unsigned __int8 *)v9 + 32))
    {
      while (1)
      {
        v13 = *v4;
        a2 = v4;
        if (!*v4)
          goto LABEL_20;
        while (1)
        {
          v4 = (_QWORD *)v13;
          if (v12 < *(unsigned __int8 *)(v13 + 32))
            break;
          v13 = *(_QWORD *)(v13 + 8);
          if (!v13)
          {
LABEL_19:
            a2 = v4 + 1;
            goto LABEL_20;
          }
        }
      }
    }
  }
  if (v7)
  {
    *a3 = v9;
    return v9 + 1;
  }
  else
  {
    *a3 = a2;
  }
  return a2;
}

void std::unique_ptr<std::__tree_node<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<waipc::timesync::BasebandProvider::bufferId const,waipc::timesync::BasebandService::bufferInfo>,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

_QWORD *waipc::util::_kv::_kv<double,void>(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  CFNumberRef v4;
  void *exception;
  uint64_t valuePtr;

  *a1 = a2;
  valuePtr = *a3;
  v4 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x220752F14](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_21ABCB350(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  const void *v3;

  v3 = *(const void **)(v1 + 8);
  if (v3)
    CFRelease(v3);
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_0_1(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 246, a4);
}

mach_vm_address_t *waipc::MappableBuffer::MappableBuffer(mach_vm_address_t *this, uint64_t a2)
{
  unint64_t v2;
  _QWORD v4[2];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = ~*MEMORY[0x24BDB03B8] & (unint64_t)(*MEMORY[0x24BDB03B8] + a2);
  v4[0] = 0;
  v4[1] = v2;
  v5 = 0;
  return waipc::MappableBuffer::MappableBuffer(this, a2, (uint64_t)v4, 1);
}

{
  unint64_t v2;
  _QWORD v4[2];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = ~*MEMORY[0x24BDB03B8] & (unint64_t)(*MEMORY[0x24BDB03B8] + a2);
  v4[0] = 0;
  v4[1] = v2;
  v5 = 0;
  return waipc::MappableBuffer::MappableBuffer(this, a2, (uint64_t)v4, 1);
}

mach_vm_address_t *waipc::MappableBuffer::MappableBuffer(mach_vm_address_t *this, uint64_t a2, int a3)
{
  unint64_t v3;
  _QWORD v5[2];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = ~*MEMORY[0x24BDB03B8] & (unint64_t)(*MEMORY[0x24BDB03B8] + a2);
  v5[0] = 0;
  v5[1] = v3;
  v6 = a3;
  return waipc::MappableBuffer::MappableBuffer(this, a2, (uint64_t)v5, 1);
}

{
  unint64_t v3;
  _QWORD v5[2];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = ~*MEMORY[0x24BDB03B8] & (unint64_t)(*MEMORY[0x24BDB03B8] + a2);
  v5[0] = 0;
  v5[1] = v3;
  v6 = a3;
  return waipc::MappableBuffer::MappableBuffer(this, a2, (uint64_t)v5, 1);
}

mach_vm_address_t *waipc::MappableBuffer::MappableBuffer(mach_vm_address_t *address, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v7;
  mach_vm_size_t v8;
  vm_map_t *v9;
  kern_return_t v10;
  kern_return_t v11;
  NSObject *Logger;
  const char *v13;
  mach_vm_address_t v14;
  uint64_t v15;
  vm_prot_t *v16;
  uint64_t v17;
  uint64_t v18;
  mach_vm_size_t v19;
  kern_return_t v20;
  kern_return_t v21;
  kern_return_t v22;
  kern_return_t v23;
  int v25;
  kern_return_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  *address = 0;
  address[1] = 0;
  address[2] = 0;
  v7 = (uint64_t *)MEMORY[0x24BDB03B8];
  v8 = ~*MEMORY[0x24BDB03B8] & (unint64_t)(*MEMORY[0x24BDB03B8] + a2);
  v9 = (vm_map_t *)MEMORY[0x24BDAEC58];
  v10 = mach_vm_allocate(*MEMORY[0x24BDAEC58], address, v8, 1);
  if (v10)
  {
    v11 = v10;
    Logger = waipc::logging::getLogger(3u);
    if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
    {
      v25 = 67109120;
      v26 = v11;
      v13 = "failed to allocate shared memory region 0x%08x";
      goto LABEL_22;
    }
    return address;
  }
  v14 = *address;
  v15 = *v7;
  if ((*address & ~(uint64_t)~*(_DWORD *)v7) != 0)
    waipc::MappableBuffer::MappableBuffer();
  address[1] = v8;
  if (a4)
  {
    v16 = (vm_prot_t *)(a3 + 16);
    while (1)
    {
      v17 = *((_QWORD *)v16 - 2);
      v18 = ~(_DWORD)v15;
      if ((v17 & ~v18) != 0)
        waipc::MappableBuffer::MappableBuffer();
      v19 = *((_QWORD *)v16 - 1);
      if (((v19 + v15) & v18) != v19)
        waipc::MappableBuffer::MappableBuffer();
      if (*v16 >= 8)
        waipc::MappableBuffer::MappableBuffer();
      if (v19 + v17 > v8)
        waipc::MappableBuffer::MappableBuffer();
      if (v19)
      {
        v20 = mach_vm_protect(*v9, *address + v17, v19, 0, *v16);
        if (v20)
        {
          v23 = v20;
          Logger = waipc::logging::getLogger(3u);
          if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
          {
            v25 = 67109120;
            v26 = v23;
            v13 = "failed to set protection attributes for shared memory region 0x%08x";
LABEL_22:
            _os_log_impl(&dword_21ABB3000, Logger, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v25, 8u);
          }
          return address;
        }
        v15 = *v7;
      }
      v16 += 6;
      if (!--a4)
      {
        v14 = *address;
        break;
      }
    }
  }
  v21 = mach_vm_inherit(*v9, v14, v8, 2u);
  if (v21)
  {
    v22 = v21;
    Logger = waipc::logging::getLogger(3u);
    if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
    {
      v25 = 67109120;
      v26 = v22;
      v13 = "failed to set inheritance attributes for shared memory region 0x%08x";
      goto LABEL_22;
    }
  }
  else
  {
    address[2] = *address;
  }
  return address;
}

void waipc::MappableBuffer::~MappableBuffer(mach_vm_address_t *this)
{
  kern_return_t v1;
  NSObject *Logger;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (*this)
  {
    v1 = mach_vm_deallocate(*MEMORY[0x24BDAEC58], *this, this[1]);
    if (v1)
    {
      Logger = waipc::logging::getLogger(3u);
      if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
      {
        v3[0] = 67109120;
        v3[1] = v1;
        _os_log_impl(&dword_21ABB3000, Logger, OS_LOG_TYPE_INFO, "failed to deallocate shared memory region 0x%08x", (uint8_t *)v3, 8u);
      }
    }
  }
}

void sub_21ABCB874(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void BasebandVoice_setTimesyncOverride(uint64_t *a1)
{
  uint64_t *v2;

  os_unfair_lock_lock((os_unfair_lock_t)&sTimesyncOverrideLock);
  v2 = timesyncOverrideStorage();
  std::shared_ptr<waipc::timesync::BasebandService>::operator=[abi:ne180100](v2, a1);
  os_unfair_lock_unlock((os_unfair_lock_t)&sTimesyncOverrideLock);
}

void BasebandVoice_getTimesyncOverride(uint64_t *a1@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  os_unfair_lock_lock((os_unfair_lock_t)&sTimesyncOverrideLock);
  v2 = timesyncOverrideStorage();
  v3 = v2[1];
  *a1 = *v2;
  a1[1] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sTimesyncOverrideLock);
}

void waipc::timesync::BasebandProvider::init()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21ABB3000, v0, v1, "BasebandProvider::init", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void waipc::timesync::BasebandProvider::setupTransport()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21ABB3000, v0, v1, "BasebandProvider::setupTransport", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void waipc::timesync::BasebandProvider::clearTransport()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21ABB3000, v0, v1, "BasebandProvider::clearTransport", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void waipc::timesync::BasebandProvider::transportReadCompletion()
{
  __assert_rtn("transportReadCompletion", "BasebandProvider.cpp", 256, "buffer");
}

void waipc::timesync::BasebandProvider::transportReadCompletion(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_21ABB3000, a2, OS_LOG_TYPE_DEBUG, "read failed 0x%08x", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

void ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21ABB3000, v0, v1, "time sync completion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void waipc::timesync::BasebandProvider::handleTimesync<PCITransportTimesyncMeasurement *>()
{
  __assert_rtn("handleTimesync", "BasebandProvider.cpp", 482, "fTimesyncEndpoint == endpoint || fTimesyncMeasurements.empty()");
}

void ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_15_cold_1()
{
  __assert_rtn("checkPendingTimesync_block_invoke", "BasebandProvider.cpp", 339, "fTimesync.pending");
}

void ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_15_cold_2()
{
  __assert_rtn("checkPendingTimesync_block_invoke", "BasebandProvider.cpp", 340, "fTimesync.triggering");
}

void ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_15_cold_3()
{
  __assert_rtn("checkPendingTimesync_block_invoke", "BasebandProvider.cpp", 341, "!fTimesync.running");
}

void ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_15_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21ABB3000, v0, v1, "time sync start", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ___ZN5waipc8timesync22ModernBasebandProvider9mapBufferENS0_16BasebandProvider8bufferIdEPvm_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_21ABB3000, v0, v1, "mapBuffer callback for id %hhu, status: 0x%08x", v2, v3);
  OUTLINED_FUNCTION_4();
}

void waipc::timesync::ModernBasebandProvider::unmapBuffer(char a1, NSObject *a2)
{
  int v2;
  char v3;

  v2 = 16777472;
  v3 = a1;
  _os_log_debug_impl(&dword_21ABB3000, a2, OS_LOG_TYPE_DEBUG, "unmapBuffer() -  buffer id %hhu", (uint8_t *)&v2, 5u);
  OUTLINED_FUNCTION_1();
}

void ___ZN5waipc8timesync22ModernBasebandProvider11unmapBufferENS0_16BasebandProvider8bufferIdE_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_21ABB3000, v0, v1, "unmapBuffer callback - buffer map for buffer %hhu, status: 0x%08x", v2, v3);
  OUTLINED_FUNCTION_4();
}

float waipc::timesync::ModernBasebandProvider::handleTimeEvent(unsigned __int8 *a1, unsigned __int8 *a2, os_log_t log)
{
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  float result;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *((_DWORD *)a1 + 1);
  v5 = *((_QWORD *)a1 + 1);
  v6 = *a2;
  v8[0] = 67109888;
  v8[1] = v3;
  v9 = 1024;
  v10 = v4;
  v11 = 2048;
  v12 = v5;
  v13 = 1024;
  v14 = v6;
  _os_log_debug_impl(&dword_21ABB3000, log, OS_LOG_TYPE_DEBUG, "got timesync measurement domain %d seq %u, payload %llu, unit %u\n", (uint8_t *)v8, 0x1Eu);
  return result;
}

void waipc::timesync::LegacyBasebandProvider::handleDeviceTimesyncMeasurement()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_21ABB3000, v0, (uint64_t)v0, "got timesync measurement seq %u, payload %llu", v1);
  OUTLINED_FUNCTION_4();
}

void waipc::timesync::LegacyBasebandProvider::handleUplinkScheduleUpdate()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_21ABB3000, v0, v1, "got uplink schedule seq %u, payload %llu", v2);
  OUTLINED_FUNCTION_4();
}

void waipc::timesync::BasebandProvider::timesyncMeasurement::complete()
{
  __assert_rtn("complete", "BasebandProvider.h", 52, "seq == host.seq");
}

{
  __assert_rtn("complete", "BasebandProvider.h", 53, "seq == device.seq");
}

void waipc::FlatCircularBuffer::write()
{
  __assert_rtn("write", "PCIeAudioLink.cpp", 37, "length <= fLength");
}

void waipc::FlatCircularBuffer::read()
{
  __assert_rtn("read", "PCIeAudioLink.cpp", 51, "length <= fLength");
}

void waipc::FlatCircularBuffer::set()
{
  __assert_rtn("set", "PCIeAudioLink.cpp", 65, "length <= fLength");
}

void waipc::PCIeAudioLink::computeBufferLength()
{
  __assert_rtn("computeBufferLength", "PCIeAudioLink.cpp", 223, "mach_vm_round_page( layout.ringLengthDL) == layout.ringLengthDL");
}

{
  __assert_rtn("computeBufferLength", "PCIeAudioLink.cpp", 222, "mach_vm_trunc_page( layout.ringOffsetDL) == layout.ringOffsetDL");
}

{
  __assert_rtn("computeBufferLength", "PCIeAudioLink.cpp", 221, "mach_vm_round_page( layout.ringLengthUL) == layout.ringLengthUL");
}

{
  __assert_rtn("computeBufferLength", "PCIeAudioLink.cpp", 220, "mach_vm_trunc_page( layout.ringOffsetUL) == layout.ringOffsetUL");
}

{
  __assert_rtn("computeBufferLength", "PCIeAudioLink.cpp", 219, "mach_vm_round_page( layout.headerLength) == layout.headerLength");
}

{
  __assert_rtn("computeBufferLength", "PCIeAudioLink.cpp", 218, "mach_vm_trunc_page( layout.headerOffset) == layout.headerOffset");
}

void waipc::PCIeAudioLink::checkUplink()
{
  __assert_rtn("checkUplink", "PCIeAudioLink.cpp", 618, "skip < fConfig.burstInterval");
}

{
  __assert_rtn("checkUplink", "PCIeAudioLink.cpp", 603, "skip < fConfig.burstInterval");
}

void waipc::PCIeAudioLink::logDLStallEnd()
{
  __assert_rtn("logDLStallEnd", "PCIeAudioLink.cpp", 1039, "!fStateLogger->current.dlStallLog.empty()");
}

{
  __assert_rtn("logDLStallEnd", "PCIeAudioLink.cpp", 1041, "entry.active");
}

void waipc::PCIeAudioLink::logDLUnderrunEnd()
{
  __assert_rtn("logDLUnderrunEnd", "PCIeAudioLink.cpp", 1083, "!fStateLogger->current.dlUnderrunLog.empty()");
}

{
  __assert_rtn("logDLUnderrunEnd", "PCIeAudioLink.cpp", 1085, "entry.active");
}

void waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::stallReport,10ul>::back()
{
  __assert_rtn("back", "PCIeAudioLink.cpp", 90, "!empty()");
}

void waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::putIdle()
{
  __assert_rtn("putIdle", "Util.h", 423, "state");
}

{
  __assert_rtn("putIdle", "Util.h", 426, "i >= 0 && i < kStashCount");
}

{
  __assert_rtn("putIdle", "Util.h", 429, "!prev");
}

void waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::takeIdle()
{
  __assert_rtn("takeIdle", "Util.h", 439, "state");
}

void ___ZN5waipc4util22NonblockingEventSourceC2EP16dispatch_queue_sU13block_pointerFvjEU13block_pointerFvvE_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    OUTLINED_FUNCTION_0_0(&dword_21ABB3000, MEMORY[0x24BDACB70], v0, "unexpected error in mach_msg receive: 0x%08x", v1, v2, v3, v4, 0);
  __assert_rtn("NonblockingEventSource_block_invoke", "Util.cpp", 135, "false");
}

void ___ZN5waipc4util22NonblockingEventSourceC2EP16dispatch_queue_sU13block_pointerFvjEU13block_pointerFvvE_block_invoke_3_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    OUTLINED_FUNCTION_0_0(&dword_21ABB3000, MEMORY[0x24BDACB70], v0, "unexpected error in mach_msg send: 0x%08x", v1, v2, v3, v4, 0);
  __assert_rtn("NonblockingEventSource_block_invoke", "Util.cpp", 185, "false");
}

void waipc::util::NonblockingEventSource::trigger()
{
  __assert_rtn("trigger", "Util.cpp", 198, "*this");
}

void waipc::util::NonblockingEventSource::testcancel()
{
  __assert_rtn("testcancel", "Util.cpp", 212, "*this");
}

void waipc::util::GroupErrorTimer::startTimer()
{
  __assert_rtn("startTimer", "Util.cpp", 301, "!s->source");
}

void waipc::BlockRing::BlockRing()
{
  __assert_rtn("BlockRing", "BlockRing.cpp", 27, "fBlockCount > 0");
}

{
  __assert_rtn("BlockRing", "BlockRing.cpp", 28, "fBlockCount <= fWrapIndex / 2");
}

void waipc::BlockRing::addWrapped()
{
  __assert_rtn("addWrapped", "BlockRing.cpp", 132, "lhs <= fWrapIndex");
}

{
  __assert_rtn("addWrapped", "BlockRing.cpp", 133, "rhs <= fWrapIndex");
}

void waipc::BlockRing::isWrappedLE()
{
  __assert_rtn("isWrappedLE", "BlockRing.cpp", 158, "lhs <= fWrapIndex");
}

{
  __assert_rtn("isWrappedLE", "BlockRing.cpp", 159, "rhs <= fWrapIndex");
}

void waipc::BlockRing::subWrapped()
{
  __assert_rtn("subWrapped", "BlockRing.cpp", 145, "lhs <= fWrapIndex");
}

{
  __assert_rtn("subWrapped", "BlockRing.cpp", 146, "rhs <= fWrapIndex");
}

void waipc::timesync::BasebandService::setupProvider()
{
  __assert_rtn("setupProvider", "BasebandService.cpp", 124, "!fProvider");
}

void ___ZN5waipc8timesync15BasebandService19addTimesyncObserverEU13block_pointerFvRKNS0_15KalmanEstimatorEbE_block_invoke_cold_1()
{
  __assert_rtn("addTimesyncObserver_block_invoke", "BasebandService.cpp", 489, "fProvider");
}

void waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::applyUpdates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_1("applyUpdates", "Util.h", a3, "it != fCallbacks.end()");
}

void waipc::MappableBuffer::MappableBuffer()
{
  __assert_rtn("MappableBuffer", "MappableBuffer.cpp", 51, "( protect[i].prot & VM_PROT_ALL) == protect[i].prot");
}

{
  __assert_rtn("MappableBuffer", "MappableBuffer.cpp", 52, "protect[i].offset + protect[i].size <= length");
}

{
  __assert_rtn("MappableBuffer", "MappableBuffer.cpp", 50, "mach_vm_round_page( protect[i].size) == protect[i].size");
}

{
  __assert_rtn("MappableBuffer", "MappableBuffer.cpp", 49, "mach_vm_trunc_page( protect[i].offset) == protect[i].offset");
}

{
  __assert_rtn("MappableBuffer", "MappableBuffer.cpp", 44, "mach_vm_trunc_page( fAddress) == fAddress");
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x24BDBBE88](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

uint64_t TelephonyBasebandPCITransportCreate()
{
  return MEMORY[0x24BED8A38]();
}

uint64_t TelephonyBasebandPCITransportInitParameters()
{
  return MEMORY[0x24BED8A40]();
}

uint64_t TelephonyBasebandPCITransportMapRegion()
{
  return MEMORY[0x24BED8A48]();
}

uint64_t TelephonyBasebandPCITransportRegisterTimeEvent()
{
  return MEMORY[0x24BED8A58]();
}

uint64_t TelephonyBasebandPCITransportTimesync()
{
  return MEMORY[0x24BED8A60]();
}

uint64_t TelephonyBasebandPCITransportUnmapRegion()
{
  return MEMORY[0x24BED8A68]();
}

uint64_t TelephonyRadiosGetRadio()
{
  return MEMORY[0x24BED96E0]();
}

uint64_t TelephonyRadiosGetRadioVendor()
{
  return MEMORY[0x24BED96E8]();
}

uint64_t TelephonyUtilTransportFree()
{
  return MEMORY[0x24BED97A8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x24BEDB188](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24DDBB968();
}

void operator delete(void *__p)
{
  off_24DDBB970(__p);
}

uint64_t operator delete()
{
  return off_24DDBB978();
}

uint64_t operator new[]()
{
  return off_24DDBB980();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24DDBB988(__sz);
}

uint64_t operator new()
{
  return off_24DDBB990();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x24BDADFD8](source);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int feclearexcept(int a1)
{
  return MEMORY[0x24BDAE310](*(_QWORD *)&a1);
}

int fetestexcept(int a1)
{
  return MEMORY[0x24BDAE348](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

kern_return_t mach_port_construct(ipc_space_t task, mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  return MEMORY[0x24BDAEBA8](*(_QWORD *)&task, options, context, name);
}

kern_return_t mach_port_destruct(ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return MEMORY[0x24BDAEBC0](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&srdelta, guard);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x24BDAEC70](*(_QWORD *)&target, address, size, *(_QWORD *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x24BDAEC78](*(_QWORD *)&target, address, size);
}

kern_return_t mach_vm_inherit(vm_map_t target_task, mach_vm_address_t address, mach_vm_size_t size, vm_inherit_t new_inheritance)
{
  return MEMORY[0x24BDAEC80](*(_QWORD *)&target_task, address, size, *(_QWORD *)&new_inheritance);
}

kern_return_t mach_vm_protect(vm_map_t target_task, mach_vm_address_t address, mach_vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return MEMORY[0x24BDAEC98](*(_QWORD *)&target_task, address, size, *(_QWORD *)&set_maximum, *(_QWORD *)&new_protection);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x24BDAEFB0](__y, __x);
  return result;
}

long double nextafter(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF110](__x, __y);
  return result;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF450](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x24BDAF478](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}


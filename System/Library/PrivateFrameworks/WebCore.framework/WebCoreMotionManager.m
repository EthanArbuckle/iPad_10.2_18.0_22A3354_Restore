@implementation WebCoreMotionManager

+ (id)sharedManager
{
  id result;

  if (byte_1ECE81CAA == 1)
    return (id)qword_1ECE81CC0;
  result = objc_alloc_init(WebCoreMotionManager);
  qword_1ECE81CC0 = (uint64_t)result;
  byte_1ECE81CAA = 1;
  return result;
}

- (WebCoreMotionManager)init
{
  WebCoreMotionManager *v2;
  WebCoreMotionManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WebCoreMotionManager;
  v2 = -[WebCoreMotionManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[WebCoreMotionManager performSelectorOnMainThread:withObject:waitUntilDone:](v2, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_initializeOnMainThread, 0, 0);
  return v3;
}

- (void)dealloc
{
  WTF *v3;
  void *m_ptr;
  _QWORD *v5;
  _QWORD *v6;
  objc_super v7;
  _QWORD *v8;

  v3 = (WTF *)objc_opt_class();
  if ((WTF::isMainThread(v3) & 1) != 0)
  {
    if (self->m_headingAvailable)
      objc_msgSend(self->m_locationManager.m_ptr, "stopUpdatingHeading");
    m_ptr = self->m_motionManager.m_ptr;
    if (self->m_gyroAvailable)
      objc_msgSend(m_ptr, "stopDeviceMotionUpdates");
    else
      objc_msgSend(m_ptr, "stopAccelerometerUpdates");
    v7.receiver = self;
    v7.super_class = (Class)WebCoreMotionManager;
    -[WebCoreMotionManager dealloc](&v7, sel_dealloc);
  }
  else
  {
    v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
    *v5 = off_1E3357AF0;
    v5[1] = v3;
    v5[2] = self;
    v8 = v5;
    WTF::callOnMainThread();
    v6 = v8;
    v8 = 0;
    if (v6)
      (*(void (**)(_QWORD *))(*v6 + 8))(v6);
  }
}

- (void)addMotionClient:(void *)a3
{
  _BYTE v4[24];

  WTF::WeakHashSet<WebCore::MotionManagerClient,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1>::add<WebCore::MotionManagerClient>((uint64_t)v4, &self->m_deviceMotionClients, (uint64_t)a3);
  if (self->m_initialized)
    -[WebCoreMotionManager checkClientStatus](self, "checkClientStatus");
}

- (void)removeMotionClient:(void *)a3
{
  WTF::WeakHashSet<WebCore::MotionManagerClient,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1>::remove<WebCore::MotionManagerClient>((unsigned int *)&self->m_deviceMotionClients, a3);
  if (self->m_initialized)
    -[WebCoreMotionManager checkClientStatus](self, "checkClientStatus");
}

- (void)addOrientationClient:(void *)a3
{
  _BYTE v4[24];

  WTF::WeakHashSet<WebCore::MotionManagerClient,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1>::add<WebCore::MotionManagerClient>((uint64_t)v4, &self->m_deviceOrientationClients, (uint64_t)a3);
  if (self->m_initialized)
    -[WebCoreMotionManager checkClientStatus](self, "checkClientStatus");
}

- (void)removeOrientationClient:(void *)a3
{
  WTF::WeakHashSet<WebCore::MotionManagerClient,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1>::remove<WebCore::MotionManagerClient>((unsigned int *)&self->m_deviceOrientationClients, a3);
  if (self->m_initialized)
    -[WebCoreMotionManager checkClientStatus](self, "checkClientStatus");
}

- (BOOL)gyroAvailable
{
  return self->m_gyroAvailable;
}

- (BOOL)headingAvailable
{
  return self->m_headingAvailable;
}

- (void)initializeOnMainThread
{
  void *v3;
  void *m_ptr;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc((Class)off_1ECE7B398()), "init");
  m_ptr = self->m_motionManager.m_ptr;
  self->m_motionManager.m_ptr = v3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v3 = self->m_motionManager.m_ptr;
  }
  v5 = objc_msgSend(v3, "isDeviceMotionAvailable");
  self->m_gyroAvailable = v5;
  v6 = self->m_motionManager.m_ptr;
  if (v5)
    objc_msgSend(v6, "setDeviceMotionUpdateInterval:", 0.0166666675);
  else
    objc_msgSend(v6, "setAccelerometerUpdateInterval:", 0.0166666675);
  v7 = (void *)objc_msgSend(objc_alloc((Class)off_1ECE7B390()), "init");
  v8 = self->m_locationManager.m_ptr;
  self->m_locationManager.m_ptr = v7;
  if (v8)
    CFRelease(v8);
  self->m_headingAvailable = objc_msgSend((id)off_1ECE7B390(), "headingAvailable");
  self->m_initialized = 1;
  -[WebCoreMotionManager checkClientStatus](self, "checkClientStatus");
}

- (void)checkClientStatus
{
  void *v4;
  void *v5;
  void *m_ptr;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (pthread_main_np())
  {
    if (WTF::WeakHashSet<WebCore::MotionManagerClient,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1>::computeSize((uint64_t)&self->m_deviceMotionClients, v4)|| WTF::WeakHashSet<WebCore::MotionManagerClient,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1>::computeSize((uint64_t)&self->m_deviceOrientationClients, v5))
    {
      m_ptr = self->m_motionManager.m_ptr;
      if (self->m_gyroAvailable)
        objc_msgSend(m_ptr, "startDeviceMotionUpdates");
      else
        objc_msgSend(m_ptr, "startAccelerometerUpdates");
      if (self->m_headingAvailable)
        objc_msgSend(self->m_locationManager.m_ptr, "startUpdatingHeading");
      if (!self->m_updateTimer.m_ptr)
      {
        v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_update, 0, 1, 0.0166666675);
        v8 = v7;
        if (v7)
          CFRetain(v7);
        v9 = self->m_updateTimer.m_ptr;
        self->m_updateTimer.m_ptr = v8;
        if (v9)
          CFRelease(v9);
      }
    }
    else
    {
      objc_msgSend(self->m_updateTimer.m_ptr, "invalidate");
      v10 = self->m_updateTimer.m_ptr;
      self->m_updateTimer.m_ptr = 0;
      if (v10)
        CFRelease(v10);
      v11 = self->m_motionManager.m_ptr;
      if (self->m_gyroAvailable)
        objc_msgSend(v11, "stopDeviceMotionUpdates");
      else
        objc_msgSend(v11, "stopAccelerometerUpdates");
      if (self->m_headingAvailable)
        objc_msgSend(self->m_locationManager.m_ptr, "stopUpdatingHeading");
    }
  }
  else
  {
    -[WebCoreMotionManager performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

- (void)update
{
  void *m_ptr;
  uint64_t v4;
  uint64_t v5;

  m_ptr = self->m_motionManager.m_ptr;
  if (m_ptr && self->m_locationManager.m_ptr)
  {
    v4 = objc_msgSend(m_ptr, "deviceMotion");
    if (self->m_gyroAvailable && v4)
    {
      -[WebCoreMotionManager sendMotionData:withHeading:](self, "sendMotionData:withHeading:", v4, objc_msgSend(self->m_locationManager.m_ptr, "heading"));
    }
    else
    {
      v5 = objc_msgSend(self->m_motionManager.m_ptr, "accelerometerData");
      if (v5)
        -[WebCoreMotionManager sendAccelerometerData:](self, "sendAccelerometerData:", v5);
    }
  }
}

- (void)sendAccelerometerData:(id)a3
{
  void (*v3[6])(_QWORD);

  v3[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v3[1] = (void (*)(_QWORD))3221225472;
  v3[2] = (void (*)(_QWORD))__46__WebCoreMotionManager_sendAccelerometerData___block_invoke;
  v3[3] = (void (*)(_QWORD))&unk_1E33557F0;
  v3[4] = (void (*)(_QWORD))a3;
  v3[5] = (void (*)(_QWORD))self;
  WebThreadRun(v3);
}

unsigned int *__46__WebCoreMotionManager_sendAccelerometerData___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _DWORD *v8;
  unsigned int *result;
  void *v10;
  WTF *v11;
  WTF *v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  WTF *v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  WTF *v21;
  uint64_t v22;

  objc_msgSend(*(id *)(a1 + 32), "acceleration");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = (_DWORD *)(*(_QWORD *)(a1 + 40) + 24);
  v21 = 0;
  v22 = 0;
  result = (unsigned int *)WTF::Mapper<WTF::Vector<WTF::WeakPtr<WebCore::MotionManagerClient,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> WTF::copyToVector<WebCore::MotionManagerClient,WTF::DefaultWeakPtrImpl>(WTF::WeakHashSet<WebCore::MotionManagerClient,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1> const&)::{lambda(WebCore::MotionManagerClient&)#1},WTF::Vector<WTF::WeakPtr<WebCore::MotionManagerClient,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::WeakHashSet<WebCore::MotionManagerClient,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1> const&,void>::map((uint64_t)&v21, v8);
  v11 = v21;
  if (HIDWORD(v22))
  {
    v12 = (WTF *)((char *)v21 + 8 * HIDWORD(v22));
    v13 = v3 * 9.80665;
    v14 = v5 * 9.80665;
    v15 = v7 * 9.80665;
    v16 = 8 * HIDWORD(v22);
    v17 = v21;
    do
    {
      if (*(_QWORD *)v17)
      {
        v18 = *(_QWORD *)(*(_QWORD *)v17 + 8);
        if (v18)
          (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double, double, double, double, double, double))(*(_QWORD *)v18 + 24))(v18, 0, 0, 0, 0, 0, 0, 0.0, 0.0, 0.0, v13, v14, v15);
      }
      v17 = (WTF *)((char *)v17 + 8);
      v16 -= 8;
    }
    while (v16);
    do
    {
      result = *(unsigned int **)v11;
      *(_QWORD *)v11 = 0;
      if (result)
      {
        do
        {
          v19 = __ldaxr(result);
          v20 = v19 - 1;
        }
        while (__stlxr(v20, result));
        if (!v20)
        {
          atomic_store(1u, result);
          result = (unsigned int *)WTF::fastFree((WTF *)result, v10);
        }
      }
      v11 = (WTF *)((char *)v11 + 8);
    }
    while (v11 != v12);
    v11 = v21;
  }
  if (v11)
    return (unsigned int *)WTF::fastFree(v11, v10);
  return result;
}

- (void)sendMotionData:(id)a3 withHeading:(id)a4
{
  void (*v4[7])(_QWORD);

  v4[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v4[1] = (void (*)(_QWORD))3221225472;
  v4[2] = __51__WebCoreMotionManager_sendMotionData_withHeading___block_invoke;
  v4[3] = (void (*)(_QWORD))&unk_1E334F240;
  v4[4] = (void (*)(_QWORD))a3;
  v4[5] = (void (*)(_QWORD))self;
  v4[6] = (void (*)(_QWORD))a4;
  WebThreadRun(v4);
}

void __51__WebCoreMotionManager_sendMotionData_withHeading___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
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
  _DWORD *v19;
  WTF *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _DWORD *v35;
  long double v36;
  double v37;
  long double v38;
  double v39;
  long double v40;
  double v41;
  long double v42;
  long double v43;
  double v44;
  long double v45;
  double v46;
  long double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  long double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  void *v66;
  double v67;
  WTF *v68;
  double v69;
  double v70;
  double v71;
  WTF *v72;
  uint64_t v73;
  WTF *v74;
  uint64_t v75;
  unsigned int *v76;
  unsigned int v77;
  unsigned int v78;
  WTF *v79;
  WTF *v80;
  unsigned int *v81;
  unsigned int v82;
  unsigned int v83;
  long double v84;
  double v85;
  WTF *v86;
  uint64_t v87;
  WTF *v88;
  uint64_t v89;

  objc_msgSend(*(id *)(a1 + 32), "userAcceleration");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "gravity");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "rotationRate");
  v15 = v14;
  v17 = v16;
  v85 = v18;
  v19 = (_DWORD *)(*(_QWORD *)(a1 + 40) + 24);
  v88 = 0;
  v89 = 0;
  WTF::Mapper<WTF::Vector<WTF::WeakPtr<WebCore::MotionManagerClient,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> WTF::copyToVector<WebCore::MotionManagerClient,WTF::DefaultWeakPtrImpl>(WTF::WeakHashSet<WebCore::MotionManagerClient,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1> const&)::{lambda(WebCore::MotionManagerClient&)#1},WTF::Vector<WTF::WeakPtr<WebCore::MotionManagerClient,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::WeakHashSet<WebCore::MotionManagerClient,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1> const&,void>::map((uint64_t)&v88, v19);
  v20 = v88;
  if (HIDWORD(v89))
  {
    v21 = 0;
    v22 = v3 + v9;
    v23 = v5 + v11;
    v24 = v7 + v13;
    v25 = v3 * 9.80665;
    v26 = v5 * 9.80665;
    v27 = v7 * 9.80665;
    v28 = v22 * 9.80665;
    v29 = v23 * 9.80665;
    v30 = v24 * 9.80665;
    v31 = 8 * HIDWORD(v89);
    do
    {
      v32 = *(_QWORD *)((char *)v20 + v21);
      if (v32)
      {
        v33 = *(_QWORD *)(v32 + 8);
        if (v33)
          (*(void (**)(uint64_t, double, uint64_t, double, uint64_t, double, uint64_t, double, double, double, double, double, double))(*(_QWORD *)v33 + 24))(v33, v15 * 57.2957795, 1, v17 * 57.2957795, 1, v85 * 57.2957795, 1, v25, v26, v27, v28, v29, v30);
      }
      v21 += 8;
    }
    while (v31 != v21);
  }
  v34 = (void *)objc_msgSend(*(id *)(a1 + 32), "attitude");
  v35 = (_DWORD *)(*(_QWORD *)(a1 + 40) + 40);
  v86 = 0;
  v87 = 0;
  WTF::Mapper<WTF::Vector<WTF::WeakPtr<WebCore::MotionManagerClient,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> WTF::copyToVector<WebCore::MotionManagerClient,WTF::DefaultWeakPtrImpl>(WTF::WeakHashSet<WebCore::MotionManagerClient,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1> const&)::{lambda(WebCore::MotionManagerClient&)#1},WTF::Vector<WTF::WeakPtr<WebCore::MotionManagerClient,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::WeakHashSet<WebCore::MotionManagerClient,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1> const&,void>::map((uint64_t)&v86, v35);
  objc_msgSend(v34, "pitch");
  v37 = cos(v36);
  objc_msgSend(v34, "roll");
  v39 = cos(v38);
  objc_msgSend(v34, "yaw");
  v41 = cos(v40);
  objc_msgSend(v34, "pitch");
  v43 = sin(v42);
  objc_msgSend(v34, "roll");
  v45 = v44;
  objc_msgSend(v34, "yaw");
  v47 = v46;
  v48 = sin(v45);
  v49 = sin(v47);
  v50 = -(v37 * v49);
  v51 = v37 * v41;
  v52 = -(v37 * v48);
  v53 = v37 * v39;
  if (v37 * v39 > 0.0)
  {
    v54 = atan2(-v50, v51);
    v55 = asin(v43);
    v56 = -v52;
    v57 = v53;
LABEL_11:
    v60 = atan2(v56, v57);
    goto LABEL_12;
  }
  if (v37 * v39 < 0.0)
  {
    v54 = atan2(v50, -v51);
    v58 = asin(v43);
    v55 = dbl_1968DE060[v58 <= 0.0] - v58;
    v57 = -v53;
    v56 = v52;
    goto LABEL_11;
  }
  if (v52 <= 0.0)
  {
    if (v52 >= 0.0)
    {
      v54 = atan2(v41 * v43 * v48 + v39 * v49, v48 * -(v49 * v43) + v41 * v39);
      v55 = dbl_1968DE050[v43 > 0.0];
      v60 = 0.0;
      goto LABEL_12;
    }
    v54 = atan2(v50, -v51);
    v84 = asin(v43);
    v55 = dbl_1968DE060[v84 <= 0.0] - v84;
  }
  else
  {
    v54 = atan2(-v50, v51);
    v55 = asin(v43);
  }
  v60 = -1.57079633;
LABEL_12:
  if (v54 <= 0.0)
    v61 = v54 + 6.28318531;
  else
    v61 = v54;
  v62 = -1.0;
  v63 = 0.0;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 65))
  {
    v64 = *(void **)(a1 + 48);
    if (v64)
    {
      objc_msgSend(v64, "magneticHeading");
      v63 = v65;
      if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 65))
      {
        v66 = *(void **)(a1 + 48);
        if (v66)
        {
          objc_msgSend(v66, "headingAccuracy");
          v62 = v67;
        }
      }
    }
  }
  v68 = v86;
  if (HIDWORD(v87))
  {
    v69 = v61 * 57.2957795;
    v70 = v55 * 57.2957795;
    v71 = v60 * 57.2957795;
    v72 = (WTF *)((char *)v86 + 8 * HIDWORD(v87));
    v73 = 8 * HIDWORD(v87);
    v74 = v86;
    do
    {
      if (*(_QWORD *)v74)
      {
        v75 = *(_QWORD *)(*(_QWORD *)v74 + 8);
        if (v75)
          (*(void (**)(uint64_t, double, double, double, double, double))(*(_QWORD *)v75 + 16))(v75, v69, v70, v71, v63, v62);
      }
      v74 = (WTF *)((char *)v74 + 8);
      v73 -= 8;
    }
    while (v73);
    do
    {
      v76 = *(unsigned int **)v68;
      *(_QWORD *)v68 = 0;
      if (v76)
      {
        do
        {
          v77 = __ldaxr(v76);
          v78 = v77 - 1;
        }
        while (__stlxr(v78, v76));
        if (!v78)
        {
          atomic_store(1u, v76);
          WTF::fastFree((WTF *)v76, v59);
        }
      }
      v68 = (WTF *)((char *)v68 + 8);
    }
    while (v68 != v72);
    v68 = v86;
  }
  if (v68)
    WTF::fastFree(v68, v59);
  v79 = v88;
  if (HIDWORD(v89))
  {
    v80 = (WTF *)((char *)v88 + 8 * HIDWORD(v89));
    do
    {
      v81 = *(unsigned int **)v79;
      *(_QWORD *)v79 = 0;
      if (v81)
      {
        do
        {
          v82 = __ldaxr(v81);
          v83 = v82 - 1;
        }
        while (__stlxr(v83, v81));
        if (!v83)
        {
          atomic_store(1u, v81);
          WTF::fastFree((WTF *)v81, v59);
        }
      }
      v79 = (WTF *)((char *)v79 + 8);
    }
    while (v79 != v80);
    v79 = v88;
  }
  if (v79)
    WTF::fastFree(v79, v59);
}

- (void).cxx_destruct
{
  void *m_ptr;
  _QWORD *m_table;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t j;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;

  m_ptr = self->m_updateTimer.m_ptr;
  self->m_updateTimer.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  m_table = self->m_deviceOrientationClients.m_set.m_impl.var0.m_table;
  if (m_table)
  {
    v8 = *((unsigned int *)m_table - 1);
    if ((_DWORD)v8)
    {
      for (i = 0; i != v8; ++i)
      {
        v10 = (unsigned int *)m_table[i];
        if (v10 != (unsigned int *)-1)
        {
          m_table[i] = 0;
          if (v10)
          {
            do
            {
              v11 = __ldaxr(v10);
              v12 = v11 - 1;
            }
            while (__stlxr(v12, v10));
            if (!v12)
            {
              atomic_store(1u, v10);
              v20 = i;
              v22 = m_table;
              v18 = v8;
              WTF::fastFree((WTF *)v10, (void *)a2);
              v8 = v18;
              i = v20;
              m_table = v22;
            }
          }
        }
      }
    }
    WTF::fastFree((WTF *)(m_table - 2), (void *)a2);
  }
  v5 = self->m_deviceMotionClients.m_set.m_impl.var0.m_table;
  if (v5)
  {
    v13 = *((unsigned int *)v5 - 1);
    if ((_DWORD)v13)
    {
      for (j = 0; j != v13; ++j)
      {
        v15 = (unsigned int *)v5[j];
        if (v15 != (unsigned int *)-1)
        {
          v5[j] = 0;
          if (v15)
          {
            do
            {
              v16 = __ldaxr(v15);
              v17 = v16 - 1;
            }
            while (__stlxr(v17, v15));
            if (!v17)
            {
              atomic_store(1u, v15);
              v21 = j;
              v23 = v5;
              v19 = v13;
              WTF::fastFree((WTF *)v15, (void *)a2);
              v13 = v19;
              j = v21;
              v5 = v23;
            }
          }
        }
      }
    }
    WTF::fastFree((WTF *)(v5 - 2), (void *)a2);
  }
  v6 = self->m_locationManager.m_ptr;
  self->m_locationManager.m_ptr = 0;
  if (v6)
    CFRelease(v6);
  v7 = self->m_motionManager.m_ptr;
  self->m_motionManager.m_ptr = 0;
  if (v7)
    CFRelease(v7);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end

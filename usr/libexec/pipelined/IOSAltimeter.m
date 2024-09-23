@implementation IOSAltimeter

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  std::__shared_weak_count *v6;

  if (self->_sensor.m_initialized)
  {
    objc_destroyWeak((id *)&self[3]._queue);
    *(_QWORD *)((char *)&self->_sensor.m_storage.dummy_.aligner_ + 7) = off_1004064E8;
    v3 = *(_QWORD *)&self[2]._sensor.m_initialized;
    if (v3)
    {
      v4 = *(_QWORD *)((char *)&self[2]._sensor.m_storage.dummy_.aligner_ + 7);
      v5 = *(void **)&self[2]._sensor.m_initialized;
      if (v4 != v3)
      {
        do
        {
          v6 = *(std::__shared_weak_count **)(v4 - 8);
          if (v6)
            std::__shared_weak_count::__release_weak(v6);
          v4 -= 16;
        }
        while (v4 != v3);
        v5 = *(void **)&self[2]._sensor.m_initialized;
      }
      *(_QWORD *)((char *)&self[2]._sensor.m_storage.dummy_.aligner_ + 7) = v3;
      operator delete(v5);
    }
    std::mutex::~mutex((std::mutex *)&self[1]);
    self->_sensor.m_initialized = 0;
  }
  objc_storeStrong((id *)&self->_altimeter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)start
{
  CMAltimeter *altimeter;
  NSOperationQueue *queue;
  IOSAltimeter *v4;
  _QWORD v5[4];
  IOSAltimeter *v6;

  queue = self->_queue;
  altimeter = self->_altimeter;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3321888768;
  v5[2] = sub_1002F4814;
  v5[3] = &unk_100404D80;
  v4 = self;
  v6 = v4;
  -[CMAltimeter startRelativeAltitudeUpdatesToQueue:withHandler:](altimeter, "startRelativeAltitudeUpdatesToQueue:withHandler:", queue, v5);

}

- (IOSAltimeter)initWithOperationQueue:(id)a3
{
  id v5;
  IOSAltimeter *v6;
  unsigned __int8 v7;
  IOSAltimeter *v8;
  char *v9;
  char *v10;
  void *v11;
  std::__shared_weak_count *v12;
  objc_super v14;
  void (**v15)();
  std::mutex v16;
  void *__p;
  char *v18;
  id v19;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IOSAltimeter;
  v6 = -[IOSAltimeter init](&v14, "init");
  if (v6)
  {
    v7 = atomic_load((unsigned __int8 *)&qword_10041A370);
    if ((v7 & 1) == 0 && __cxa_guard_acquire(&qword_10041A370))
    {
      qword_10041A368 = (uint64_t)objc_alloc_init((Class)CMAltimeter);
      __cxa_guard_release(&qword_10041A370);
    }
    objc_storeStrong((id *)&v6->_queue, a3);
    objc_storeStrong((id *)&v6->_altimeter, (id)qword_10041A368);
    v8 = v6;
    sub_100018860((uint64_t)&v15);
    v15 = (void (**)())off_100404DC0;
    objc_initWeak(&v19, v8);

    sub_100008310((uint64_t)&v8->_sensor, (uint64_t)&v15);
    objc_destroyWeak(&v19);
    v15 = off_1004064E8;
    v9 = (char *)__p;
    if (__p)
    {
      v10 = v18;
      v11 = __p;
      if (v18 != __p)
      {
        do
        {
          v12 = (std::__shared_weak_count *)*((_QWORD *)v10 - 1);
          if (v12)
            std::__shared_weak_count::__release_weak(v12);
          v10 -= 16;
        }
        while (v10 != v9);
        v11 = __p;
      }
      v18 = v9;
      operator delete(v11);
    }
    std::mutex::~mutex(&v16);
  }

  return v6;
}

- (void)stop
{
  -[CMAltimeter stopRelativeAltitudeUpdates](self->_altimeter, "stopRelativeAltitudeUpdates");
}

- (BOOL)sensorPresent
{
  return +[CMAltimeter isRelativeAltitudeAvailable](CMAltimeter, "isRelativeAltitudeAvailable");
}

- (void)getSensor
{
  return (char *)&self->_sensor.m_storage.dummy_.aligner_ + 7;
}

- (id).cxx_construct
{
  *((_BYTE *)self + 24) = 0;
  return self;
}

- (IOSAltimeter)init
{
  -[IOSAltimeter doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

@end

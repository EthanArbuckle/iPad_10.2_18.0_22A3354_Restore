@implementation IOSNearbyObject

- (IOSNearbyObject)initWithType:(int)a3 reducedRate:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IOSNearbyObject;
  if (-[IOSNearbyObject init](&v5, "init"))
    operator new();
  return 0;
}

- (BOOL)sensorPresent
{
  return +[NISession isSupported](NISession, "isSupported");
}

- (void)getSensor
{
  return self->_sensor.__ptr_.__value_;
}

- (void).cxx_destruct
{
  IOSNearbyObjectSensor *value;

  value = self->_sensor.__ptr_.__value_;
  self->_sensor.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(IOSNearbyObjectSensor *, SEL))(*(_QWORD *)value + 8))(value, a2);
  objc_storeStrong((id *)&self->_session, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (IOSNearbyObject)init
{
  -[IOSNearbyObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)start
{
  NSObject *v3;
  int64_t updateRate;
  const char *v5;
  id v6;
  double v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  NISession *v13;
  NISession *session;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;

  if (qword_100417ED8 == -1)
  {
    v3 = qword_100417EE0;
    if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
    {
LABEL_3:
      updateRate = self->_updateRate;
      if (self->_type == 1)
        v5 = "anchor";
      else
        v5 = "mobile";
      *(_DWORD *)buf = 136380931;
      v17 = v5;
      v18 = 1025;
      v19 = updateRate;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Start ranging as %{private}s, rate %{private}d", buf, 0x12u);
    }
  }
  else
  {
    dispatch_once(&qword_100417ED8, &stru_100405078);
    v3 = qword_100417EE0;
    if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
      goto LABEL_3;
  }
  v6 = objc_alloc((Class)NIRegionPredicate);
  LODWORD(v7) = 1112014848;
  v8 = objc_msgSend(v6, "initWithName:radius:preferredUpdateRate:", CFSTR("LargeRange"), self->_updateRate, v7);
  v9 = objc_alloc((Class)NIHomeDeviceConfiguration);
  v15 = v8;
  v10 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v11 = objc_msgSend(v9, "initWithRegions:", v10);

  objc_msgSend(v11, "setAnchor:", self->_type == 1);
  objc_msgSend(v11, "setAllowedDevices:", 2);
  self->_running = 1;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NISession discoveryToken](self->_session, "discoveryToken"));
  LOBYTE(v10) = v12 == 0;

  if ((v10 & 1) == 0)
    -[NISession invalidate](self->_session, "invalidate");
  v13 = (NISession *)objc_alloc_init((Class)NISession);
  session = self->_session;
  self->_session = v13;

  -[NISession setDelegate:](self->_session, "setDelegate:", self);
  -[NISession runWithConfiguration:](self->_session, "runWithConfiguration:", v11);

}

- (void)stop
{
  NSObject *v3;
  uint8_t v4[16];

  if (qword_100417ED8 != -1)
  {
    dispatch_once(&qword_100417ED8, &stru_100405078);
    v3 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  v3 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Stop ranging", v4, 2u);
  }
LABEL_4:
  self->_running = 0;
  -[NISession invalidate](self->_session, "invalidate");
}

- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4
{
  double v5;
  double v6;
  double Current;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  float v12;
  unsigned __int8 v13;
  int v14;
  void *v15;
  id v16;
  const std::string::value_type *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  float v24;
  uint64_t v25;
  float v26;
  uint64_t v27;
  float v28;
  char *v29;
  IOSNearbyObjectSensor *value;
  _QWORD *v31;
  _BYTE *v32;
  std::__shared_weak_count *v33;
  unint64_t *p_shared_owners;
  unint64_t v35;
  std::string *v36;
  void *v37;
  std::string *v38;
  std::string::size_type *p_size;
  void (**v40)(char *);
  BOOL v41;
  char *v42;
  void *v43;
  char *v44;
  void (***v45)(char *);
  void (**v46)(char *);
  uint64_t v47;
  id v49;
  id v50;
  id obj;
  char *v52;
  std::__shared_weak_count *v53;
  uint64_t v54;
  void *__p;
  std::string *v56;
  id v57;
  __int128 v58;
  uint64_t v59;
  int v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  void *v65;
  char *v66;
  unint64_t v67;
  _BYTE v68[128];

  v49 = a3;
  v50 = a4;
  v5 = sub_10001BA08();
  v47 = sub_10003C888();
  v6 = sub_10001BAC8();
  Current = CFAbsoluteTimeGetCurrent();
  v65 = 0;
  v66 = 0;
  v67 = 0;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v50;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        while (1)
        {
          if (*(_QWORD *)v62 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
          sub_100130030((uint64_t)&v54);
          objc_msgSend(v11, "distance", v47);
          v60 |= 8u;
          *(double *)&v58 = v12;
          if ((objc_msgSend(v11, "relationship") & 2) != 0)
          {
            v60 |= 4u;
            v14 = 2;
          }
          else
          {
            v13 = objc_msgSend(v11, "relationship");
            v60 |= 4u;
            v14 = v13 & 1;
          }
          LODWORD(v59) = v14;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "discoveryToken"));
          v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rawToken")));
          v17 = (const std::string::value_type *)objc_msgSend(v16, "bytes");
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "discoveryToken"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "rawToken"));
          v20 = objc_msgSend(v19, "length");
          v60 |= 1u;
          if (v56 == (std::string *)&wireless_diagnostics::google::protobuf::internal::kEmptyString)
            operator new();
          std::string::assign(v56, v17, (std::string::size_type)v20);

          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "discoveryToken"));
          v22 = objc_msgSend(v21, "hash");
          v60 |= 2u;
          v57 = v22;

          v60 |= 0x10u;
          v23 = *((_QWORD *)&v58 + 1);
          if (!*((_QWORD *)&v58 + 1))
            operator new();
          objc_msgSend(v11, "direction");
          *(_DWORD *)(v23 + 48) |= 2u;
          *(double *)(v23 + 16) = v24;
          v60 |= 0x10u;
          v25 = *((_QWORD *)&v58 + 1);
          if (!*((_QWORD *)&v58 + 1))
            operator new();
          objc_msgSend(v11, "direction");
          *(_DWORD *)(v25 + 48) |= 4u;
          *(double *)(v25 + 24) = v26;
          v60 |= 0x10u;
          v27 = *((_QWORD *)&v58 + 1);
          if (!*((_QWORD *)&v58 + 1))
            operator new();
          objc_msgSend(v11, "direction");
          *(_DWORD *)(v27 + 48) |= 8u;
          *(double *)(v27 + 32) = v28;
          v29 = v66;
          if ((unint64_t)v66 < v67)
            break;
          v66 = (char *)sub_1002F7528(&v65, (uint64_t)&v54);
          sub_100130E40(&v54);
          i = (char *)i + 1;
          if (v8 == i)
            goto LABEL_20;
        }
        sub_100130DA0((uint64_t)v66, (uint64_t)&v54);
        v66 = v29 + 88;
        sub_100130E40(&v54);
      }
LABEL_20:
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    }
    while (v8);
  }

  value = self->_sensor.__ptr_.__value_;
  sub_1003098F4((uint64_t)&v54, v47, (uint64_t *)&v65, v5, v6, Current);
  v31 = operator new(0x108uLL);
  v31[1] = 0;
  v31[2] = 0;
  *v31 = off_1003F0840;
  v32 = __p;
  v31[4] = v54;
  v31[5] = 0;
  v31[6] = 0;
  v31[7] = 0;
  sub_1002F7750((uint64_t)(v31 + 5), (uint64_t)v32, (uint64_t)v56, 0x2E8BA2E8BA2E8BA3 * (((char *)v56 - v32) >> 3));
  *((_OWORD *)v31 + 4) = v58;
  v31[10] = v59;
  *((_DWORD *)v31 + 6) = 16;
  v52 = (char *)(v31 + 3);
  v53 = (std::__shared_weak_count *)v31;
  sub_10005C2A4((uint64_t)value, (uint64_t)&v52);
  v33 = v53;
  if (v53)
  {
    p_shared_owners = (unint64_t *)&v53->__shared_owners_;
    do
      v35 = __ldaxr(p_shared_owners);
    while (__stlxr(v35 - 1, p_shared_owners));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  v36 = (std::string *)__p;
  if (__p)
  {
    v37 = __p;
    if (v56 != __p)
    {
      v38 = (std::string *)((char *)v56 - 88);
      p_size = &v56[-4].__r_.__value_.__l.__size_;
      do
      {
        v40 = (void (**)(char *))*p_size;
        p_size -= 11;
        (*v40)((char *)v38);
        v41 = v38 == v36;
        v38 = (std::string *)p_size;
      }
      while (!v41);
      v37 = __p;
    }
    v56 = v36;
    operator delete(v37);
  }
  v42 = (char *)v65;
  if (v65)
  {
    v43 = v65;
    if (v66 != v65)
    {
      v44 = v66 - 88;
      v45 = (void (***)(char *))(v66 - 88);
      do
      {
        v46 = *v45;
        v45 -= 11;
        (*v46)(v44);
        v41 = v44 == v42;
        v44 = (char *)v45;
      }
      while (!v41);
      v43 = v65;
    }
    v66 = v42;
    operator delete(v43);
  }

}

- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = a4;
  if (qword_100417ED8 != -1)
  {
    dispatch_once(&qword_100417ED8, &stru_100405078);
    v8 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  v8 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Ranging removed objects", v9, 2u);
  }
LABEL_4:

}

- (void)sessionWasSuspended:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  if (qword_100417ED8 != -1)
  {
    dispatch_once(&qword_100417ED8, &stru_100405078);
    v4 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  v4 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Ranging suspended", v5, 2u);
  }
LABEL_4:

}

- (void)sessionSuspensionEnded:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (qword_100417ED8 == -1)
  {
    v5 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417ED8, &stru_100405078);
  v5 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Ranging suspension ended", v6, 2u);
  }
LABEL_4:
  if (self->_running)
    -[IOSNearbyObject start](self, "start");

}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = a4;
  if (qword_100417ED8 == -1)
  {
    v8 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417ED8, &stru_100405078);
  v8 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Ranging invalidated", v9, 2u);
  }
LABEL_4:
  if (self->_running)
    -[IOSNearbyObject start](self, "start");

}

@end

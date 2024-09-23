@implementation CLIndoorBackgroundTasks

- (CLIndoorBackgroundTasks)init
{
  -[CLIndoorBackgroundTasks doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CLIndoorBackgroundTasks)initWithService:(id)a3
{
  id v4;
  CLIndoorBackgroundTasks *v5;
  CLIndoorBackgroundTasks *v6;
  CLIndoorBackgroundTasks *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLIndoorBackgroundTasks;
  v5 = -[CLIndoorBackgroundTasks init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_service, v4);
    -[CLIndoorBackgroundTasks checkIn](v6, "checkIn");
    v7 = v6;
  }

  return v6;
}

- (void)checkIn
{
  NSObject *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id buf[2];
  _QWORD handler[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100406FF8);
    v3 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  v3 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Checking in to activities", (uint8_t *)buf, 2u);
  }
LABEL_4:
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3321888768;
  handler[2] = sub_10032564C;
  handler[3] = &unk_100406F98;
  objc_copyWeak(buf, &location);
  objc_copyWeak(&v9, buf);
  xpc_activity_register("com.apple.indoor.ClearTiles", XPC_ACTIVITY_CHECK_IN, handler);
  objc_destroyWeak(buf);
  objc_initWeak(buf, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3321888768;
  v5[2] = sub_100325800;
  v5[3] = &unk_100406FC8;
  objc_copyWeak(&v4, buf);
  objc_copyWeak(&v6, &v4);
  xpc_activity_register("com.apple.indoor.VacuumDBs", XPC_ACTIVITY_CHECK_IN, v5);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)handleCheckIn:(id)a3 withPolicy:(const void *)a4 andName:(const char *)a5
{
  _xpc_activity_s *v7;
  xpc_object_t v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  std::string *v12;
  NSObject *v13;
  int v14;
  std::string::size_type v15;
  std::string *p_p;
  std::string *v17;
  std::string __p;
  uint8_t v19[4];
  const char *v20;
  __int16 v21;
  std::string *v22;
  __int16 v23;
  std::string *v24;
  std::string v25;
  uint8_t buf[4];
  _BYTE v27[12];
  char v28;
  double v29;
  char v30;
  double v31;
  char *__s1;
  int v33;

  v7 = (_xpc_activity_s *)a3;
  v8 = xpc_activity_copy_criteria(v7);
  if (!v8)
  {
    v8 = xpc_dictionary_create(0, 0, 0);
    sub_100325E3C((uint64_t)a4, v8);
    xpc_activity_set_criteria(v7, v8);
    if (qword_100417EF8 == -1)
    {
      v9 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
        goto LABEL_45;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100406FF8);
      v9 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
        goto LABEL_45;
    }
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)v27 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Registering %{public}s activity for the first time", buf, 0xCu);
    goto LABEL_45;
  }
  sub_100325F70((uint64_t)buf, v8);
  if (buf[0] && *(_BYTE *)a4)
  {
    if (*(double *)&v27[4] != *((double *)a4 + 1))
      goto LABEL_34;
  }
  else if ((buf[0] != 0) == (*(_BYTE *)a4 == 0))
  {
    goto LABEL_34;
  }
  if (v28 && *((_BYTE *)a4 + 16))
  {
    if (v29 != *((double *)a4 + 3))
      goto LABEL_34;
  }
  else if ((v28 != 0) == (*((_BYTE *)a4 + 16) == 0))
  {
    goto LABEL_34;
  }
  if (v30 && *((_BYTE *)a4 + 32))
  {
    if (v31 != *((double *)a4 + 5))
      goto LABEL_34;
  }
  else if ((v30 != 0) == (*((_BYTE *)a4 + 32) == 0))
  {
    goto LABEL_34;
  }
  v10 = (char *)*((_QWORD *)a4 + 6);
  if (__s1 != v10 && (!__s1 || !v10 || strcmp(__s1, v10)) || v33 != *((_DWORD *)a4 + 14))
  {
LABEL_34:
    if (qword_100417EF8 != -1)
      dispatch_once(&qword_100417EF8, &stru_100406FF8);
    v13 = (id)qword_100417F00;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_44;
    sub_100324EB8((uint64_t)buf, &__p);
    v14 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    v15 = __p.__r_.__value_.__r.__words[0];
    sub_100324EB8((uint64_t)a4, &v25);
    p_p = &__p;
    if (v14 < 0)
      p_p = (std::string *)v15;
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v17 = &v25;
    else
      v17 = (std::string *)v25.__r_.__value_.__r.__words[0];
    *(_DWORD *)v19 = 136446722;
    v20 = a5;
    v21 = 2082;
    v22 = p_p;
    v23 = 2082;
    v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s activity registered as %{public}s. Changing to %{public}s", v19, 0x20u);
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v25.__r_.__value_.__l.__data_);
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_44;
    }
    else if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_44:

      sub_100325E3C((uint64_t)a4, v8);
      xpc_activity_set_criteria(v7, v8);
      goto LABEL_45;
    }
    operator delete(__p.__r_.__value_.__l.__data_);
    goto LABEL_44;
  }
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100406FF8);
  v11 = (id)qword_100417F00;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    sub_100325F70((uint64_t)v19, v8);
    sub_100324EB8((uint64_t)v19, &__p);
    v12 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &__p
        : (std::string *)__p.__r_.__value_.__r.__words[0];
    LODWORD(v25.__r_.__value_.__l.__data_) = 136446466;
    *(std::string::size_type *)((char *)v25.__r_.__value_.__r.__words + 4) = (std::string::size_type)a5;
    WORD2(v25.__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&v25.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}s activity already registered: %{public}s", (uint8_t *)&v25, 0x16u);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }

LABEL_45:
}

- (void)handleVacuumDBsCheckIn:(id)a3
{
  -[CLIndoorBackgroundTasks handleCheckIn:withPolicy:andName:](self, "handleCheckIn:withPolicy:andName:", a3, &byte_10041A850, "vacuum dbs");
}

- (void)handleVacuumDBs:(id)a3
{
  id v4;
  id WeakRetained;
  _QWORD *v6;
  NSObject *v7;
  NSObject *v9;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  if (xpc_activity_set_state((xpc_activity_t)v4, 4))
  {
    if (qword_100417EF8 == -1)
    {
      v7 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      {
LABEL_6:
        WeakRetained = objc_loadWeakRetained((id *)&self->_service);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_100326328;
        v11[3] = &unk_1003EE788;
        v12 = v4;
        v6 = objc_retainBlock(v11);
        objc_msgSend(WeakRetained, "fullyVacuumAllDBsWithReply:", v6);

LABEL_7:
        return;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100406FF8);
      v7 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Requesting vacuum of databases", buf, 2u);
    goto LABEL_6;
  }
  if (qword_100417EF8 == -1)
  {
    v9 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&qword_100417EF8, &stru_100406FF8);
    v9 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
  }
  *(_WORD *)buf = 0;
  _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to set tile cleanup to continue state", buf, 2u);

}

- (void)handleTileCleanupCheckIn:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  char v7;
  __int128 buf;

  v4 = a3;
  *(_QWORD *)&buf = sub_10016E1F8();
  *((_QWORD *)&buf + 1) = v5;
  v7 = 0;
  if (!sub_1000AC110((uint64_t)&buf, &v7))
  {
    -[CLIndoorBackgroundTasks handleCheckIn:withPolicy:andName:](self, "handleCheckIn:withPolicy:andName:", v4, &byte_10041A810, "tile cleanup");
    goto LABEL_6;
  }
  -[CLIndoorBackgroundTasks handleCheckIn:withPolicy:andName:](self, "handleCheckIn:withPolicy:andName:", v4, &byte_10041A890, "tile cleanup");
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100406FF8);
    v6 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
      goto LABEL_6;
    goto LABEL_4;
  }
  v6 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
  {
LABEL_4:
    LODWORD(buf) = 134349056;
    *(double *)((char *)&buf + 4) = (double)(int)*(double *)&qword_10041A898 / 3600.0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "@CtsClear, override, %{public}.1f", (uint8_t *)&buf, 0xCu);
  }
LABEL_6:

}

- (void)handleTileCleanup:(id)a3
{
  _xpc_activity_s *v4;
  CLIndoorTileEvictionPolicy *v5;
  uint64_t v6;
  double v7;
  NSObject *v8;
  double v9;
  double v10;
  int v11;
  uint64_t v12;
  double v13;
  double v14;
  id WeakRetained;
  NSObject *v16;
  NSObject *v18;
  char v20;
  __int128 buf;

  v4 = (_xpc_activity_s *)a3;
  if (xpc_activity_set_state(v4, 4))
  {
    if (qword_100417EF8 == -1)
    {
      v16 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_6;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100406FF8);
      v16 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      {
LABEL_6:
        v5 = objc_alloc_init(CLIndoorTileEvictionPolicy);
        -[CLIndoorTileEvictionPolicy setActivity:](v5, "setActivity:", v4);
        *(_QWORD *)&buf = sub_10016E1F8();
        *((_QWORD *)&buf + 1) = v6;
        v20 = 0;
        if (!sub_1000AC110((uint64_t)&buf, &v20))
        {
          v10 = *(double *)&qword_10041A818;
          v11 = byte_10041A820;
          v12 = qword_10041A828;
          -[CLIndoorTileEvictionPolicy maxModifiedAge](v5, "maxModifiedAge");
          v14 = v10 * 0.5;
          if (v11)
            v14 = *(double *)&v12;
          -[CLIndoorTileEvictionPolicy setMaxModifiedAge:](v5, "setMaxModifiedAge:", v13 - (v10 + v14));
          goto LABEL_20;
        }
        v7 = *(double *)&qword_10041A8A8;
        if (!byte_10041A8A0)
          v7 = *(double *)&qword_10041A898 * 0.5;
        -[CLIndoorTileEvictionPolicy setMaxModifiedAge:](v5, "setMaxModifiedAge:", 172800.0 - (*(double *)&qword_10041A898 + v7));
        if (qword_100417EF8 == -1)
        {
          v8 = (id)qword_100417F00;
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
LABEL_12:

LABEL_20:
            WeakRetained = objc_loadWeakRetained((id *)&self->_service);
            objc_msgSend(WeakRetained, "clearTiles:", v5);

            goto LABEL_21;
          }
        }
        else
        {
          dispatch_once(&qword_100417EF8, &stru_100406FF8);
          v8 = (id)qword_100417F00;
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            goto LABEL_12;
        }
        -[CLIndoorTileEvictionPolicy maxModifiedAge](v5, "maxModifiedAge");
        LODWORD(buf) = 134349056;
        *(double *)((char *)&buf + 4) = v9 / 3600.0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "@TileEvict, override, %{public}.1f", (uint8_t *)&buf, 0xCu);
        goto LABEL_12;
      }
    }
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Requesting periodic tile cleanup", (uint8_t *)&buf, 2u);
    goto LABEL_6;
  }
  if (qword_100417EF8 == -1)
  {
    v18 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
LABEL_16:
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "@CtsClear, Failed to set tile cleanup to continue state", (uint8_t *)&buf, 2u);
    goto LABEL_21;
  }
  dispatch_once(&qword_100417EF8, &stru_100406FF8);
  v18 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
    goto LABEL_16;
LABEL_21:

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);
}

@end

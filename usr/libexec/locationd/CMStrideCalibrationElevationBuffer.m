@implementation CMStrideCalibrationElevationBuffer

- (void)ageOutElevationArray
{
  double Current;
  unint64_t value;
  double v5;

  Current = CFAbsoluteTimeGetCurrent();
  value = self->fElevationWindow.__size_.__value_;
  if (value)
  {
    v5 = Current;
    do
    {
      if (v5
         - (*(CLElevationChangeEntry **)((char *)self->fElevationWindow.__map_.__begin_
                                       + ((self->fElevationWindow.__start_ >> 3) & 0x1FFFFFFFFFFFFFF8)))[self->fElevationWindow.__start_ & 0x3F].var1 <= 600.0)
        break;
      ++self->fElevationWindow.__start_;
      self->fElevationWindow.__size_.__value_ = value - 1;
      sub_100555498((uint64_t)&self->fElevationWindow, 1);
      value = self->fElevationWindow.__size_.__value_;
    }
    while (value);
  }
}

- (void)feedElevationData:(const NotificationData *)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  const char *v14;
  uint8_t *v15;
  double v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;

  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_1021AAD40);
  v5 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)a3;
    v7 = *((_QWORD *)a3 + 1);
    v8 = *((_DWORD *)a3 + 4);
    v9 = *((_DWORD *)a3 + 5);
    *(_DWORD *)buf = 134218752;
    v26 = v6;
    v27 = 2048;
    v28 = v7;
    v29 = 1024;
    v30 = v8;
    v31 = 1024;
    v32 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Elevation, %f, %f, %d, %d", buf, 0x22u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_1021AAD40);
    v10 = *(_QWORD *)a3;
    v11 = *((_QWORD *)a3 + 1);
    v12 = *((_DWORD *)a3 + 4);
    v13 = *((_DWORD *)a3 + 5);
    v17 = 134218752;
    v18 = v10;
    v19 = 2048;
    v20 = v11;
    v21 = 1024;
    v22 = v12;
    v23 = 1024;
    v24 = v13;
    LODWORD(v16) = 34;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "Elevation, %f, %f, %d, %d", COERCE_DOUBLE(&v17), v16);
    v15 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrationElevationBuffer feedElevationData:]", "%s\n", v14);
    if (v15 != buf)
      free(v15);
  }
  -[CMStrideCalibrationElevationBuffer ageOutElevationArray](self, "ageOutElevationArray");
  sub_1012566C8(&self->fElevationWindow.__map_.__first_, (__int128 *)a3);
}

- (void)updateGradient:(id)a3
{
  double v5;
  double v6;
  double v7;
  unint64_t start;
  CLElevationChangeEntry **begin;
  CLElevationChangeEntry **end;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  CLElevationChangeEntry **v18;
  unint64_t v19;
  unint64_t v20;
  CLElevationChangeEntry **v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unsigned int v36;
  unsigned int v37;
  double v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  uint8_t *v44;
  int v45;
  const char *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  unsigned int v50;
  __int16 v51;
  unsigned int v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  unsigned int v58;
  __int16 v59;
  unsigned int v60;

  if (objc_msgSend(a3, "gradientValidity") == (id)-1)
  {
    objc_msgSend(objc_msgSend(objc_msgSend(a3, "track"), "start"), "timeIntervalSinceReferenceDate");
    v6 = v5;
    objc_msgSend(objc_msgSend(objc_msgSend(a3, "track"), "stop"), "timeIntervalSinceReferenceDate");
    start = self->fElevationWindow.__start_;
    begin = self->fElevationWindow.__map_.__begin_;
    end = self->fElevationWindow.__map_.__end_;
    v11 = (char *)&begin[start >> 6];
    if (end == begin)
    {
      v12 = 0;
      v15 = 0;
      v13 = self->fElevationWindow.__size_.__value_ + start;
      v14 = (char *)&begin[v13 >> 6];
    }
    else
    {
      v12 = *(_QWORD *)v11 + ((self->fElevationWindow.__start_ & 0x3F) << 6);
      v13 = self->fElevationWindow.__size_.__value_ + start;
      v14 = (char *)&begin[v13 >> 6];
      v15 = *(_QWORD *)v14 + ((v13 & 0x3F) << 6);
    }
    if (v15 != v12)
    {
      v16 = ((uint64_t)(v15 - *(_QWORD *)v14) >> 6) + 8 * (v14 - v11);
      v17 = v16 - ((uint64_t)(v12 - *(_QWORD *)v11) >> 6);
      if (v16 != (uint64_t)(v12 - *(_QWORD *)v11) >> 6)
      {
        v18 = &begin[start >> 6];
        do
        {
          v19 = v17 >> 1;
          if (v17 == 1)
          {
            v20 = v12;
            v21 = v18;
          }
          else
          {
            v22 = v19 + ((uint64_t)(v12 - (_QWORD)*v18) >> 6);
            if (v22 < 1)
            {
              v23 = 63 - v22;
              LOBYTE(v22) = ~(63 - v22);
              v21 = &v18[-(v23 >> 6)];
            }
            else
            {
              v21 = &v18[(unint64_t)v22 >> 6];
            }
            v20 = (unint64_t)&(*v21)[(unint64_t)(v22 & 0x3F)];
          }
          if (*(double *)(v20 + 8) < v6)
          {
            v12 = v20 + 64;
            if (v20 + 64 - (_QWORD)*v21 == 4096)
            {
              v24 = (unint64_t)v21[1];
              ++v21;
              v12 = v24;
            }
            v19 = v17 + ~v19;
            v18 = v21;
          }
          v17 = v19;
        }
        while (v19);
      }
    }
    if (end == begin)
    {
      v25 = 0;
      v26 = 0;
    }
    else
    {
      v25 = *(_QWORD *)v11 + ((self->fElevationWindow.__start_ & 0x3F) << 6);
      v26 = *(_QWORD *)v14 + ((v13 & 0x3F) << 6);
    }
    if (v26 != v25)
    {
      v27 = ((uint64_t)(v26 - *(_QWORD *)v14) >> 6) + 8 * (v14 - v11);
      v28 = v27 - ((uint64_t)(v25 - *(_QWORD *)v11) >> 6);
      if (v27 != (uint64_t)(v25 - *(_QWORD *)v11) >> 6)
      {
        do
        {
          v29 = v28 >> 1;
          if (v28 == 1)
          {
            v30 = v25;
            v31 = v11;
          }
          else
          {
            v32 = v29 + ((uint64_t)(v25 - *(_QWORD *)v11) >> 6);
            if (v32 < 1)
            {
              v33 = 63 - v32;
              LOBYTE(v32) = ~(63 - v32);
              v31 = &v11[-8 * (v33 >> 6)];
            }
            else
            {
              v31 = &v11[8 * ((unint64_t)v32 >> 6)];
            }
            v30 = *(_QWORD *)v31 + ((unint64_t)(v32 & 0x3F) << 6);
          }
          if (*(double *)(v30 + 8) < v7)
          {
            v25 = v30 + 64;
            if (v30 + 64 - *(_QWORD *)v31 == 4096)
            {
              v34 = *((_QWORD *)v31 + 1);
              v31 += 8;
              v25 = v34;
            }
            v29 = v28 + ~v29;
            v11 = v31;
          }
          v28 = v29;
        }
        while (v29);
      }
    }
    if (end == begin)
    {
      if (!v12)
        return;
      v35 = 0;
    }
    else
    {
      v35 = *(_QWORD *)v14 + ((v13 & 0x3F) << 6);
      if (v35 == v12)
        return;
    }
    if (v35 != v25)
    {
      v36 = *(_DWORD *)(v25 + 16) - *(_DWORD *)(v12 + 16);
      v37 = *(_DWORD *)(v25 + 20) - *(_DWORD *)(v12 + 20);
      objc_msgSend(objc_msgSend(a3, "track"), "distanceGps");
      objc_msgSend(a3, "setGradient:", ((double)v36 - (double)v37) / v38);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_1021AAD40);
      v39 = qword_10229FCD8;
      if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
      {
        if (objc_msgSend(a3, "gradientValidity"))
          v40 = "Success";
        else
          v40 = "Fail";
        *(_DWORD *)buf = 136315906;
        v54 = v40;
        v55 = 2080;
        v56 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
        v57 = 1024;
        v58 = v36;
        v59 = 1024;
        v60 = v37;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "TrackCalibration,%s,CalData,%s,ElevationAscended,%d,ElevationDescended,%d", buf, 0x22u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FCD0 != -1)
          dispatch_once(&qword_10229FCD0, &stru_1021AAD40);
        v41 = qword_10229FCD8;
        if (objc_msgSend(a3, "gradientValidity"))
          v42 = "Success";
        else
          v42 = "Fail";
        v45 = 136315906;
        v46 = v42;
        v47 = 2080;
        v48 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
        v49 = 1024;
        v50 = v36;
        v51 = 1024;
        v52 = v37;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v41, 2, "TrackCalibration,%s,CalData,%s,ElevationAscended,%d,ElevationDescended,%d", (const char *)&v45, 34);
        v44 = (uint8_t *)v43;
        sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrationElevationBuffer updateGradient:]", "%s\n", v43);
        if (v44 != buf)
          free(v44);
      }
    }
  }
}

- (void).cxx_destruct
{
  sub_100554930(&self->fElevationWindow.__map_.__first_);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end

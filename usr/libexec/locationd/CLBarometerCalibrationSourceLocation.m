@implementation CLBarometerCalibrationSourceLocation

- (void)onLocationNotification:(int)a3 data:(NotificationData *)a4
{
  unsigned __int8 v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  unsigned __int8 v17;
  double v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  double v28;
  double v29;
  unsigned int v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CLBarometerCalibrationSourceClient *v35;
  double v36;
  BOOL v37;
  NSObject *v38;
  int v39;
  int v40;
  uint64_t v41;
  const char *v42;
  double v43;
  CLBarometerCalibrationSourceClient *delegate;
  unint64_t *v45;
  unint64_t v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  double v53;
  NSObject *v54;
  _BOOL4 currentUnderDEM;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  int v62;
  int v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  int v72;
  uint64_t v73;
  char *v74;
  int v75;
  int v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  _BOOL4 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  double v87;
  const char *v88;
  double v89;
  char *v90;
  double v91;
  uint64_t v92;
  _BYTE v93[688];
  std::__shared_weak_count *v94;
  std::__shared_weak_count *v95;
  void *__p;
  char v97;
  std::__shared_weak_count *v98;
  id v99;
  int v100;
  _BYTE v101[54];
  __int16 v102;
  int v103;
  uint8_t buf[4];
  _BYTE v105[54];
  __int16 v106;
  int v107;

  sub_10011D234((uint64_t)v93, (uint64_t)a4);
  v7 = +[CLBarometerCalibrationSourceAggregator isLocationUsefulForCalibration:](CLBarometerCalibrationSourceAggregator, "isLocationUsefulForCalibration:", v93);

  v8 = v98;
  if (v98)
  {
    p_shared_owners = (unint64_t *)&v98->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (v97 < 0)
    operator delete(__p);
  v11 = v95;
  if (v95)
  {
    v12 = (unint64_t *)&v95->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = v94;
  if (v94)
  {
    v15 = (unint64_t *)&v94->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  if (a3 == 4)
    v17 = v7;
  else
    v17 = 0;
  if ((v17 & 1) != 0)
  {
    sub_1008141FC(&v91);
    v18 = v91;
    **(_QWORD **)&v91 = *(_QWORD *)((char *)a4 + 76);
    *(_OWORD *)(*(_QWORD *)&v18 + 8) = *(_OWORD *)((char *)a4 + 4);
    *(int8x16_t *)(*(_QWORD *)&v18 + 24) = vextq_s8(*(int8x16_t *)((char *)a4 + 20), *(int8x16_t *)((char *)a4 + 20), 8uLL);
    *(_QWORD *)(*(_QWORD *)&v18 + 40) = *(_QWORD *)((char *)a4 + 36);
    *(_DWORD *)(*(_QWORD *)&v18 + 100) = *((_DWORD *)a4 + 24);
    *(_DWORD *)(*(_QWORD *)&v18 + 96) = *((_DWORD *)a4 + 35);
    *(_DWORD *)(*(_QWORD *)&v18 + 104) = *((_DWORD *)a4 + 54);
    *(_OWORD *)(*(_QWORD *)&v18 + 48) = *(_OWORD *)((char *)a4 + 536);
    *(_OWORD *)(*(_QWORD *)&v18 + 64) = *(_OWORD *)((char *)a4 + 520);
    *(_OWORD *)(*(_QWORD *)&v18 + 80) = *(_OWORD *)((char *)a4 + 44);
    *(_OWORD *)(*(_QWORD *)&v18 + 112) = *((_OWORD *)a4 + 44);
    *(_BYTE *)(*(_QWORD *)&v18 + 156) = *((_BYTE *)a4 + 736);
    *(_OWORD *)(*(_QWORD *)&v18 + 136) = *(_OWORD *)((char *)a4 + 744);
    *(_DWORD *)(*(_QWORD *)&v18 + 152) = *((_DWORD *)a4 + 62);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021554C0);
    v19 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      -[CLBarometerCalibrationSourceClient getLastAltitude](self->super._delegate, "getLastAltitude");
      v21 = v20;
      -[CLBarometerCalibrationSourceClient getLastAltitudeTime](self->super._delegate, "getLastAltitudeTime");
      v22 = **(_QWORD **)&v91;
      v24 = *(_QWORD *)(*(_QWORD *)&v91 + 136);
      v23 = *(_QWORD *)(*(_QWORD *)&v91 + 144);
      v25 = *(unsigned __int8 *)(*(_QWORD *)&v91 + 156);
      v26 = *(_DWORD *)(*(_QWORD *)&v91 + 152);
      *(_DWORD *)buf = 134219521;
      *(_QWORD *)v105 = v21;
      *(_WORD *)&v105[8] = 2048;
      *(_QWORD *)&v105[10] = v27;
      *(_WORD *)&v105[18] = 2048;
      *(_QWORD *)&v105[20] = v22;
      *(_WORD *)&v105[28] = 2049;
      *(_QWORD *)&v105[30] = v23;
      *(_WORD *)&v105[38] = 2049;
      *(_QWORD *)&v105[40] = v24;
      *(_WORD *)&v105[48] = 1025;
      *(_DWORD *)&v105[50] = v25;
      v106 = 1025;
      v107 = v26;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "location last altitude %.3lf last time %.3lf last location time %.3lf,indoorConfidence,%{private}.3lf, outdoorConfidence,%{private}.3lf,PositionOutdoorState,%{private}u,mapMatchType,%{private}u", buf, 0x40u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021554C0);
      v65 = qword_10229FE88;
      -[CLBarometerCalibrationSourceClient getLastAltitude](self->super._delegate, "getLastAltitude");
      v67 = v66;
      -[CLBarometerCalibrationSourceClient getLastAltitudeTime](self->super._delegate, "getLastAltitudeTime");
      v68 = **(_QWORD **)&v91;
      v70 = *(_QWORD *)(*(_QWORD *)&v91 + 136);
      v69 = *(_QWORD *)(*(_QWORD *)&v91 + 144);
      v71 = *(unsigned __int8 *)(*(_QWORD *)&v91 + 156);
      v72 = *(_DWORD *)(*(_QWORD *)&v91 + 152);
      v100 = 134219521;
      *(_QWORD *)v101 = v67;
      *(_WORD *)&v101[8] = 2048;
      *(_QWORD *)&v101[10] = v73;
      *(_WORD *)&v101[18] = 2048;
      *(_QWORD *)&v101[20] = v68;
      *(_WORD *)&v101[28] = 2049;
      *(_QWORD *)&v101[30] = v69;
      *(_WORD *)&v101[38] = 2049;
      *(_QWORD *)&v101[40] = v70;
      *(_WORD *)&v101[48] = 1025;
      *(_DWORD *)&v101[50] = v71;
      v102 = 1025;
      v103 = v72;
      v74 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v65, 2, "location last altitude %.3lf last time %.3lf last location time %.3lf,indoorConfidence,%{private}.3lf, outdoorConfidence,%{private}.3lf,PositionOutdoorState,%{private}u,mapMatchType,%{private}u", &v100, 64);
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceLocation onLocationNotification:data:]", "%s\n", v74);
      if (v74 != (char *)buf)
        free(v74);
    }
    if (*(_DWORD *)(*(_QWORD *)&v91 + 100) != 1
      || (v28 = **(double **)&v91,
          -[CLBarometerCalibrationSourceClient getLastAltitudeTime](self->super._delegate, "getLastAltitudeTime"),
          vabdd_f64(v28, v29) >= 5.0))
    {
      self->_currentUnderDEM = 0;
LABEL_38:
      if (self->_currentUnderDEM)
        *(_WORD *)(*(_QWORD *)&v91 + 130) |= 1u;
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021554C0);
      v38 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        v39 = *(unsigned __int16 *)(*(_QWORD *)&v91 + 130);
        v40 = *(_DWORD *)(*(_QWORD *)&v91 + 100);
        v41 = **(_QWORD **)&v91;
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)v105 = "state";
        *(_WORD *)&v105[8] = 1024;
        *(_DWORD *)&v105[10] = v39;
        *(_WORD *)&v105[14] = 2080;
        *(_QWORD *)&v105[16] = "type";
        *(_WORD *)&v105[24] = 1024;
        *(_DWORD *)&v105[26] = v40;
        *(_WORD *)&v105[30] = 2080;
        *(_QWORD *)&v105[32] = "timestamp";
        *(_WORD *)&v105[40] = 2048;
        *(_QWORD *)&v105[42] = v41;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "location altitude information,%s,%u,%s,%d,%s,%f", buf, 0x36u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021554C0);
        v75 = *(unsigned __int16 *)(*(_QWORD *)&v91 + 130);
        v76 = *(_DWORD *)(*(_QWORD *)&v91 + 100);
        v77 = **(_QWORD **)&v91;
        v100 = 136316418;
        *(_QWORD *)v101 = "state";
        *(_WORD *)&v101[8] = 1024;
        *(_DWORD *)&v101[10] = v75;
        *(_WORD *)&v101[14] = 2080;
        *(_QWORD *)&v101[16] = "type";
        *(_WORD *)&v101[24] = 1024;
        *(_DWORD *)&v101[26] = v76;
        *(_WORD *)&v101[30] = 2080;
        *(_QWORD *)&v101[32] = "timestamp";
        *(_WORD *)&v101[40] = 2048;
        *(_QWORD *)&v101[42] = v77;
        v78 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "location altitude information,%s,%u,%s,%d,%s,%f", (const char *)&v100, 54, v88, LODWORD(v89), v90, v91);
        sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceLocation onLocationNotification:data:]", "%s\n", v78);
        if (v78 != (char *)buf)
          free(v78);
      }
      v43 = v91;
      v42 = (const char *)v92;
      *(_BYTE *)(*(_QWORD *)&v91 + 128) = 0;
      delegate = self->super._delegate;
      v89 = v43;
      v90 = (char *)v42;
      if (v42)
      {
        v45 = (unint64_t *)(v42 + 8);
        do
          v46 = __ldxr(v45);
        while (__stxr(v46 + 1, v45));
      }
      -[CLBarometerCalibrationSourceClient didUpdateSource:withData:](delegate, "didUpdateSource:withData:", 0, &v89);
      v47 = (std::__shared_weak_count *)v90;
      if (v90)
      {
        v48 = (unint64_t *)(v90 + 8);
        do
          v49 = __ldaxr(v48);
        while (__stlxr(v49 - 1, v48));
        if (!v49)
        {
          ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
          std::__shared_weak_count::__release_weak(v47);
        }
      }
      v50 = (std::__shared_weak_count *)v92;
      if (v92)
      {
        v51 = (unint64_t *)(v92 + 8);
        do
          v52 = __ldaxr(v51);
        while (__stlxr(v52 - 1, v51));
        if (!v52)
        {
          ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
          std::__shared_weak_count::__release_weak(v50);
        }
      }
      return;
    }
    v30 = -[CLBarometerCalibrationSourceClient isInOutdoorWorkout](self->super._delegate, "isInOutdoorWorkout");
    v31 = v91;
    if (v30)
      *(_WORD *)(*(_QWORD *)&v91 + 130) |= 2u;
    if (*(double *)(*(_QWORD *)&v31 + 56) <= 0.0)
      goto LABEL_38;
    if (*(_DWORD *)(*(_QWORD *)&v31 + 104) == 2)
      *(_WORD *)(*(_QWORD *)&v31 + 130) |= 4u;
    -[CLBarometerCalibrationSourceClient getLastAltitudeAccuracy](self->super._delegate, "getLastAltitudeAccuracy");
    v33 = *(double *)(*(_QWORD *)&v91 + 48);
    v34 = v32 + 20.0 + *(double *)(*(_QWORD *)&v91 + 56);
    v35 = self->super._delegate;
    if (self->_currentUnderDEM)
    {
      -[CLBarometerCalibrationSourceClient getLastAltitude](v35, "getLastAltitude");
      if (v33 - v36 < v34 + -3.0)
      {
        v37 = 0;
LABEL_62:
        self->_currentUnderDEM = v37;
      }
    }
    else
    {
      -[CLBarometerCalibrationSourceClient getLastAltitude](v35, "getLastAltitude");
      if (v33 - v53 > v34)
      {
        v37 = 1;
        goto LABEL_62;
      }
    }
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021554C0);
    v54 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
    {
      currentUnderDEM = self->_currentUnderDEM;
      -[CLBarometerCalibrationSourceClient getLastAltitude](self->super._delegate, "getLastAltitude");
      v57 = v56;
      -[CLBarometerCalibrationSourceClient getLastAltitudeAccuracy](self->super._delegate, "getLastAltitudeAccuracy");
      v59 = *(_QWORD *)(*(_QWORD *)&v91 + 48);
      v58 = *(_QWORD *)(*(_QWORD *)&v91 + 56);
      *(_DWORD *)buf = 67110400;
      *(_DWORD *)v105 = currentUnderDEM;
      *(_WORD *)&v105[4] = 2048;
      *(_QWORD *)&v105[6] = v57;
      *(_WORD *)&v105[14] = 2048;
      *(_QWORD *)&v105[16] = v60;
      *(_WORD *)&v105[24] = 2048;
      *(_QWORD *)&v105[26] = v59;
      *(_WORD *)&v105[34] = 2048;
      *(_QWORD *)&v105[36] = v58;
      *(_WORD *)&v105[44] = 2048;
      *(double *)&v105[46] = v34;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "underDEM, %d, altitude, %f, uncertainty, %f, demAltitude, %f, demUncertainty, %f, threshold, %f", buf, 0x3Au);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021554C0);
      v79 = qword_10229FE88;
      v80 = self->_currentUnderDEM;
      -[CLBarometerCalibrationSourceClient getLastAltitude](self->super._delegate, "getLastAltitude");
      v82 = v81;
      -[CLBarometerCalibrationSourceClient getLastAltitudeAccuracy](self->super._delegate, "getLastAltitudeAccuracy");
      v84 = *(_QWORD *)(*(_QWORD *)&v91 + 48);
      v83 = *(_QWORD *)(*(_QWORD *)&v91 + 56);
      v100 = 67110400;
      *(_DWORD *)v101 = v80;
      *(_WORD *)&v101[4] = 2048;
      *(_QWORD *)&v101[6] = v82;
      *(_WORD *)&v101[14] = 2048;
      *(_QWORD *)&v101[16] = v85;
      *(_WORD *)&v101[24] = 2048;
      *(_QWORD *)&v101[26] = v84;
      *(_WORD *)&v101[34] = 2048;
      *(_QWORD *)&v101[36] = v83;
      *(_WORD *)&v101[44] = 2048;
      *(double *)&v101[46] = v34;
      LODWORD(v87) = 58;
      v86 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v79, 1, "underDEM, %d, altitude, %f, uncertainty, %f, demAltitude, %f, demUncertainty, %f, threshold, %f", &v100, v87, *(double *)&v88, v89, *(double *)&v90, v91);
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceLocation onLocationNotification:data:]", "%s\n", v86);
      if (v86 != (char *)buf)
        free(v86);
    }
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021554C0);
    v61 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      v62 = *(unsigned __int16 *)(*(_QWORD *)&v91 + 130);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v105 = v62;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "good DEM data: location altitude state is %u", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021554C0);
      v63 = *(unsigned __int16 *)(*(_QWORD *)&v91 + 130);
      v100 = 67109120;
      *(_DWORD *)v101 = v63;
      v64 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "good DEM data: location altitude state is %u", &v100);
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceLocation onLocationNotification:data:]", "%s\n", v64);
      if (v64 != (char *)buf)
        free(v64);
    }
    goto LABEL_38;
  }
}

- (CLBarometerCalibrationSourceLocation)initWithUniverse:(id)a3 delegate:(id)a4
{
  CLBarometerCalibrationSourceLocation *v4;
  NSObject *v5;
  objc_super v7;
  uint8_t buf[8];
  __int16 v9;
  const char *v10;

  v7.receiver = self;
  v7.super_class = (Class)CLBarometerCalibrationSourceLocation;
  v4 = -[CLBarometerCalibrationSource initWithUniverse:delegate:](&v7, "initWithUniverse:delegate:", a3, a4);
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021554C0);
  v5 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    v9 = 2082;
    v10 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"initialized location source\"}", buf, 0x12u);
  }
  if (v4)
    sub_1006AA544();
  return 0;
}

- (void)enableSource
{
  if (!self->super._sourceEnabled)
  {
    objc_msgSend(*((id *)self->fLocationControllerClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->fLocationControllerClient.__ptr_.__value_ + 1), 4, 0);
    objc_msgSend(*((id *)self->fLocationControllerClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->fLocationControllerClient.__ptr_.__value_ + 1), 33, 0);
    self->super._sourceEnabled = 1;
  }
}

- (void)disableSource
{
  if (self->super._sourceEnabled)
  {
    objc_msgSend(*((id *)self->fLocationControllerClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->fLocationControllerClient.__ptr_.__value_ + 1), 4);
    objc_msgSend(*((id *)self->fLocationControllerClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->fLocationControllerClient.__ptr_.__value_ + 1), 33);
    self->super._sourceEnabled = 0;
  }
}

- (void).cxx_destruct
{
  Client *value;

  value = self->fLocationControllerClient.__ptr_.__value_;
  self->fLocationControllerClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end

@implementation CLStreamedLocationPrivate

- (CLStreamedLocationPrivate)initWithDaemonLocationPrivate:(const void *)a3
{
  unsigned __int8 v5;
  CLStreamedLocationPrivate *v6;
  CLStreamedLocationPrivate *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  unint64_t v16;
  uint64_t v18;
  const char *v19;
  uint8_t *v20;
  uint64_t v21;
  unsigned int v22;
  const char *v23;
  uint8_t *v24;
  uint64_t v25;
  unint64_t v26;
  const char *v27;
  uint8_t *v28;
  uint64_t v29;
  int v30;
  unint64_t v31;
  uint8_t buf[4];
  unint64_t v33;

  v5 = atomic_load((unsigned __int8 *)&qword_10230C238);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_10230C238))
  {
    sub_10012A33C(&qword_10230BFB8);
    __cxa_atexit((void (*)(void *))sub_100B947D0, &qword_10230BFB8, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_10230C238);
  }
  v6 = -[CLStreamedLocationPrivate init](self, "init");
  v7 = v6;
  if (v6)
  {
    if (*(double *)a3 != *(double *)&qword_10230BFB8)
      -[CLStreamedLocationPrivate setOdometer:](v6, "setOdometer:", *(double *)a3);
    if (*((double *)a3 + 1) != *(double *)&qword_10230BFC0)
      -[CLStreamedLocationPrivate setDeltaDistance:](v7, "setDeltaDistance:");
    if (*((double *)a3 + 2) != *(double *)&qword_10230BFC8)
      -[CLStreamedLocationPrivate setDeltaDistanceAccuracy:](v7, "setDeltaDistanceAccuracy:");
    if (*((double *)a3 + 3) != *(double *)&qword_10230BFD0)
      -[CLStreamedLocationPrivate setTimestampGps:](v7, "setTimestampGps:");
    if (*((double *)a3 + 45) != *(double *)&qword_10230C120)
      -[CLStreamedLocationPrivate setSlope:](v7, "setSlope:");
    if (*((double *)a3 + 46) != *(double *)&qword_10230C128)
      -[CLStreamedLocationPrivate setMaxAbsSlope:](v7, "setMaxAbsSlope:");
    if (*((double *)a3 + 47) != *(double *)&qword_10230C130)
      -[CLStreamedLocationPrivate setGroundAltitude:](v7, "setGroundAltitude:");
    if (*((double *)a3 + 48) != *(double *)&qword_10230C138)
      -[CLStreamedLocationPrivate setGroundAltitudeUncertainty:](v7, "setGroundAltitudeUncertainty:");
    v8 = *((_DWORD *)a3 + 69);
    if (v8 == dword_10230C0CC)
      goto LABEL_30;
    if (v8 == 3)
    {
      v9 = 4;
    }
    else
    {
      if (v8 != 4)
      {
LABEL_25:
        if (qword_1022A01E0 != -1)
          dispatch_once(&qword_1022A01E0, &stru_10219C690);
        v10 = qword_1022A01E8;
        if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67174657;
          LODWORD(v33) = -[CLStreamedLocationPrivate tropicalSavannaProximity](v7, "tropicalSavannaProximity");
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Trackrun,Sending tropicalSavannaProximity,%{private}d", buf, 8u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A01E0 != -1)
            dispatch_once(&qword_1022A01E0, &stru_10219C690);
          v18 = qword_1022A01E8;
          v30 = 67174657;
          LODWORD(v31) = -[CLStreamedLocationPrivate tropicalSavannaProximity](v7, "tropicalSavannaProximity");
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v18, 0, "Trackrun,Sending tropicalSavannaProximity,%{private}d", &v30, 8);
          v20 = (uint8_t *)v19;
          sub_100512490("Generic", 1, 0, 2, "-[CLStreamedLocationPrivate(ConversionSupport) initWithDaemonLocationPrivate:]", "%s\n", v19);
          if (v20 != buf)
            free(v20);
        }
LABEL_30:
        if (-[CLStreamedLocationPrivate hasTropicalSavannaProximity](v7, "hasTropicalSavannaProximity"))
        {
          v11 = *((_DWORD *)a3 + 67);
          if (v11 >= 1 && v11 != dword_10230C0C4)
          {
            -[CLStreamedLocationPrivate setTropicalSavannaBranchCount:](v7, "setTropicalSavannaBranchCount:");
            if (qword_1022A01E0 != -1)
              dispatch_once(&qword_1022A01E0, &stru_10219C690);
            v12 = qword_1022A01E8;
            if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
            {
              v13 = -[CLStreamedLocationPrivate tropicalSavannaBranchCount](v7, "tropicalSavannaBranchCount");
              *(_DWORD *)buf = 67174657;
              LODWORD(v33) = v13;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Trackrun,Sending tropicalSavannaBranchCount,%{private}u", buf, 8u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1022A01E0 != -1)
                dispatch_once(&qword_1022A01E0, &stru_10219C690);
              v21 = qword_1022A01E8;
              v22 = -[CLStreamedLocationPrivate tropicalSavannaBranchCount](v7, "tropicalSavannaBranchCount");
              v30 = 67174657;
              LODWORD(v31) = v22;
              LODWORD(v29) = 8;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v21, 0, "Trackrun,Sending tropicalSavannaBranchCount,%{private}u", &v30, v29);
              v24 = (uint8_t *)v23;
              sub_100512490("Generic", 1, 0, 2, "-[CLStreamedLocationPrivate(ConversionSupport) initWithDaemonLocationPrivate:]", "%s\n", v23);
              if (v24 != buf)
                free(v24);
            }
          }
        }
        if (-[CLStreamedLocationPrivate hasTropicalSavannaProximity](v7, "hasTropicalSavannaProximity"))
        {
          v14 = *((_QWORD *)a3 + 32);
          if (v14)
          {
            if (v14 != qword_10230C0B8)
            {
              -[CLStreamedLocationPrivate setTropicalSavannaTreeId:](v7, "setTropicalSavannaTreeId:");
              if (qword_1022A01E0 != -1)
                dispatch_once(&qword_1022A01E0, &stru_10219C690);
              v15 = qword_1022A01E8;
              if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
              {
                v16 = -[CLStreamedLocationPrivate tropicalSavannaTreeId](v7, "tropicalSavannaTreeId");
                *(_DWORD *)buf = 134283521;
                v33 = v16;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Trackrun,Sending tropicalSavannaTreeId,%{private}llu", buf, 0xCu);
              }
              if (sub_1001BFF7C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1022A01E0 != -1)
                  dispatch_once(&qword_1022A01E0, &stru_10219C690);
                v25 = qword_1022A01E8;
                v26 = -[CLStreamedLocationPrivate tropicalSavannaTreeId](v7, "tropicalSavannaTreeId");
                v30 = 134283521;
                v31 = v26;
                LODWORD(v29) = 12;
                _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v25, 0, "Trackrun,Sending tropicalSavannaTreeId,%{private}llu", &v30, v29);
                v28 = (uint8_t *)v27;
                sub_100512490("Generic", 1, 0, 2, "-[CLStreamedLocationPrivate(ConversionSupport) initWithDaemonLocationPrivate:]", "%s\n", v27);
                if (v28 != buf)
                  free(v28);
              }
            }
          }
        }
        return v7;
      }
      v9 = 5;
    }
    -[CLStreamedLocationPrivate setTropicalSavannaProximity:](v7, "setTropicalSavannaProximity:", v9);
    goto LABEL_25;
  }
  return v7;
}

- (CLDaemonLocationPrivate)daemonLocationPrivate
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  unsigned int v14;
  NSObject *v15;
  unsigned int v16;
  CLDaemonLocationPrivate *result;
  NSObject *v18;
  unint64_t v19;
  uint64_t v20;
  const char *v21;
  uint8_t *v22;
  uint64_t v23;
  unsigned int v24;
  const char *v25;
  uint8_t *v26;
  uint64_t v27;
  unint64_t v28;
  const char *v29;
  uint8_t *v30;
  uint64_t v31;
  int v32;
  unint64_t v33;
  uint8_t buf[4];
  unint64_t v35;

  if (-[CLStreamedLocationPrivate hasOdometer](self, "hasOdometer", sub_10012A33C(retstr).n128_f64[0]))
  {
    -[CLStreamedLocationPrivate odometer](self, "odometer");
    retstr->odometer = v5;
  }
  if (-[CLStreamedLocationPrivate hasDeltaDistance](self, "hasDeltaDistance"))
  {
    -[CLStreamedLocationPrivate deltaDistance](self, "deltaDistance");
    retstr->deltaDistance = v6;
  }
  if (-[CLStreamedLocationPrivate hasDeltaDistanceAccuracy](self, "hasDeltaDistanceAccuracy"))
  {
    -[CLStreamedLocationPrivate deltaDistanceAccuracy](self, "deltaDistanceAccuracy");
    retstr->deltaDistanceAccuracy = v7;
  }
  if (-[CLStreamedLocationPrivate hasTimestampGps](self, "hasTimestampGps"))
  {
    -[CLStreamedLocationPrivate timestampGps](self, "timestampGps");
    retstr->timestampGps = v8;
  }
  if (-[CLStreamedLocationPrivate hasSlope](self, "hasSlope"))
  {
    -[CLStreamedLocationPrivate slope](self, "slope");
    retstr->slope = v9;
  }
  if (-[CLStreamedLocationPrivate hasMaxAbsSlope](self, "hasMaxAbsSlope"))
  {
    -[CLStreamedLocationPrivate maxAbsSlope](self, "maxAbsSlope");
    retstr->maxAbsSlope = v10;
  }
  if (-[CLStreamedLocationPrivate hasGroundAltitude](self, "hasGroundAltitude"))
  {
    -[CLStreamedLocationPrivate groundAltitude](self, "groundAltitude");
    retstr->groundAltitude = v11;
  }
  if (-[CLStreamedLocationPrivate hasGroundAltitudeUncertainty](self, "hasGroundAltitudeUncertainty"))
  {
    -[CLStreamedLocationPrivate groundAltitudeUncertainty](self, "groundAltitudeUncertainty");
    retstr->groundAltitudeUncertainty = v12;
  }
  if (-[CLStreamedLocationPrivate hasTropicalSavannaProximity](self, "hasTropicalSavannaProximity"))
  {
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_10219C690);
    v13 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67174657;
      LODWORD(v35) = -[CLStreamedLocationPrivate tropicalSavannaProximity](self, "tropicalSavannaProximity");
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Trackrun,Received tropicalSavannaProximity,%{private}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_10219C690);
      v20 = qword_1022A01E8;
      v32 = 67174657;
      LODWORD(v33) = -[CLStreamedLocationPrivate tropicalSavannaProximity](self, "tropicalSavannaProximity");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v20, 0, "Trackrun,Received tropicalSavannaProximity,%{private}d", &v32, 8);
      v22 = (uint8_t *)v21;
      sub_100512490("Generic", 1, 0, 2, "-[CLStreamedLocationPrivate(ConversionSupport) daemonLocationPrivate]", "%s\n", v21);
      if (v22 != buf)
        free(v22);
    }
    v14 = -[CLStreamedLocationPrivate tropicalSavannaProximity](self, "tropicalSavannaProximity");
    if (v14 <= 5)
      retstr->trackRunData.trackProximity = dword_101C3C1F4[v14];
  }
  if (-[CLStreamedLocationPrivate hasTropicalSavannaBranchCount](self, "hasTropicalSavannaBranchCount"))
  {
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_10219C690);
    v15 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = -[CLStreamedLocationPrivate tropicalSavannaBranchCount](self, "tropicalSavannaBranchCount");
      *(_DWORD *)buf = 67174657;
      LODWORD(v35) = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Trackrun,Received tropicalSavannaBranchCount,%{private}u", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_10219C690);
      v23 = qword_1022A01E8;
      v24 = -[CLStreamedLocationPrivate tropicalSavannaBranchCount](self, "tropicalSavannaBranchCount");
      v32 = 67174657;
      LODWORD(v33) = v24;
      LODWORD(v31) = 8;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v23, 0, "Trackrun,Received tropicalSavannaBranchCount,%{private}u", &v32, v31);
      v26 = (uint8_t *)v25;
      sub_100512490("Generic", 1, 0, 2, "-[CLStreamedLocationPrivate(ConversionSupport) daemonLocationPrivate]", "%s\n", v25);
      if (v26 != buf)
        free(v26);
    }
    retstr->trackRunData.laneCount = -[CLStreamedLocationPrivate tropicalSavannaBranchCount](self, "tropicalSavannaBranchCount");
  }
  result = (CLDaemonLocationPrivate *)-[CLStreamedLocationPrivate hasTropicalSavannaTreeId](self, "hasTropicalSavannaTreeId");
  if ((_DWORD)result)
  {
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_10219C690);
    v18 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
    {
      v19 = -[CLStreamedLocationPrivate tropicalSavannaTreeId](self, "tropicalSavannaTreeId");
      *(_DWORD *)buf = 134283521;
      v35 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Trackrun,Received tropicalSavannaTreeId,%{private}llu", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_10219C690);
      v27 = qword_1022A01E8;
      v28 = -[CLStreamedLocationPrivate tropicalSavannaTreeId](self, "tropicalSavannaTreeId");
      v32 = 134283521;
      v33 = v28;
      LODWORD(v31) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v27, 0, "Trackrun,Received tropicalSavannaTreeId,%{private}llu", &v32, v31);
      v30 = (uint8_t *)v29;
      sub_100512490("Generic", 1, 0, 2, "-[CLStreamedLocationPrivate(ConversionSupport) daemonLocationPrivate]", "%s\n", v29);
      if (v30 != buf)
        free(v30);
    }
    result = -[CLStreamedLocationPrivate tropicalSavannaTreeId](self, "tropicalSavannaTreeId");
    retstr->trackRunData.trackId = (unint64_t)result;
  }
  return result;
}

- (void)setOdometer:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_odometer = a3;
}

- (void)setHasOdometer:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasOdometer
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setDeltaDistance:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_deltaDistance = a3;
}

- (void)setHasDeltaDistance:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDeltaDistance
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setDeltaDistanceAccuracy:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_deltaDistanceAccuracy = a3;
}

- (void)setHasDeltaDistanceAccuracy:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDeltaDistanceAccuracy
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTimestampGps:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_timestampGps = a3;
}

- (void)setHasTimestampGps:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTimestampGps
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSlope:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_slope = a3;
}

- (void)setHasSlope:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSlope
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setMaxAbsSlope:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_maxAbsSlope = a3;
}

- (void)setHasMaxAbsSlope:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMaxAbsSlope
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setGroundAltitude:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_groundAltitude = a3;
}

- (void)setHasGroundAltitude:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasGroundAltitude
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setGroundAltitudeUncertainty:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_groundAltitudeUncertainty = a3;
}

- (void)setHasGroundAltitudeUncertainty:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasGroundAltitudeUncertainty
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)tropicalSavannaProximity
{
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    return self->_tropicalSavannaProximity;
  else
    return 0;
}

- (void)setTropicalSavannaProximity:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_tropicalSavannaProximity = a3;
}

- (void)setHasTropicalSavannaProximity:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTropicalSavannaProximity
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)tropicalSavannaProximityAsString:(int)a3
{
  if (a3 >= 6)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_10219E818 + a3);
}

- (int)StringAsTropicalSavannaProximity:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("TSP_PROTOBUF_DEFAULT")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("TSP_UNKNOWN")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("TSP_FAR_FROM")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("TSP_NEAR")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("TSP_POSSIBLY_ON")) & 1) != 0)
    return 4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("TSP_ON")))
    return 5;
  return 0;
}

- (void)setTropicalSavannaBranchCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_tropicalSavannaBranchCount = a3;
}

- (void)setHasTropicalSavannaBranchCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTropicalSavannaBranchCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setTropicalSavannaTreeId:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_tropicalSavannaTreeId = a3;
}

- (void)setHasTropicalSavannaTreeId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTropicalSavannaTreeId
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLStreamedLocationPrivate;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[CLStreamedLocationPrivate description](&v3, "description"), -[CLStreamedLocationPrivate dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  __int16 has;
  uint64_t tropicalSavannaProximity;
  NSString *v7;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_odometer), CFSTR("odometer"));
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_deltaDistance), CFSTR("deltaDistance"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_deltaDistanceAccuracy), CFSTR("deltaDistanceAccuracy"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestampGps), CFSTR("timestampGps"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_slope), CFSTR("slope"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_maxAbsSlope), CFSTR("maxAbsSlope"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_groundAltitude), CFSTR("groundAltitude"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_groundAltitudeUncertainty), CFSTR("groundAltitudeUncertainty"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
LABEL_26:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tropicalSavannaBranchCount), CFSTR("tropicalSavannaBranchCount"));
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      return v3;
    goto LABEL_12;
  }
LABEL_22:
  tropicalSavannaProximity = self->_tropicalSavannaProximity;
  if (tropicalSavannaProximity >= 6)
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_tropicalSavannaProximity);
  else
    v7 = (NSString *)*(&off_10219E818 + tropicalSavannaProximity);
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("tropicalSavannaProximity"));
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
    goto LABEL_26;
LABEL_11:
  if ((has & 0x100) != 0)
LABEL_12:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_tropicalSavannaTreeId), CFSTR("tropicalSavannaTreeId"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_101092788((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 1, self->_odometer);
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField(a3, 2, self->_deltaDistance);
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteDoubleField(a3, 3, self->_deltaDistanceAccuracy);
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField(a3, 4, self->_timestampGps);
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteDoubleField(a3, 5, self->_slope);
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteDoubleField(a3, 6, self->_maxAbsSlope);
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteDoubleField(a3, 7, self->_groundAltitude);
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteDoubleField(a3, 8, self->_groundAltitudeUncertainty);
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field(a3, self->_tropicalSavannaProximity, 9);
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      return;
LABEL_23:
    PBDataWriterWriteUint64Field(a3, self->_tropicalSavannaTreeId, 11);
    return;
  }
LABEL_22:
  PBDataWriterWriteUint32Field(a3, self->_tropicalSavannaBranchCount, 10);
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    goto LABEL_23;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_QWORD *)a3 + 6) = *(_QWORD *)&self->_odometer;
    *((_WORD *)a3 + 44) |= 0x20u;
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_deltaDistance;
  *((_WORD *)a3 + 44) |= 1u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_deltaDistanceAccuracy;
  *((_WORD *)a3 + 44) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)a3 + 8) = *(_QWORD *)&self->_timestampGps;
  *((_WORD *)a3 + 44) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)a3 + 7) = *(_QWORD *)&self->_slope;
  *((_WORD *)a3 + 44) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)a3 + 5) = *(_QWORD *)&self->_maxAbsSlope;
  *((_WORD *)a3 + 44) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)a3 + 3) = *(_QWORD *)&self->_groundAltitude;
  *((_WORD *)a3 + 44) |= 4u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)a3 + 4) = *(_QWORD *)&self->_groundAltitudeUncertainty;
  *((_WORD *)a3 + 44) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 21) = self->_tropicalSavannaProximity;
  *((_WORD *)a3 + 44) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      return;
LABEL_23:
    *((_QWORD *)a3 + 9) = self->_tropicalSavannaTreeId;
    *((_WORD *)a3 + 44) |= 0x100u;
    return;
  }
LABEL_22:
  *((_DWORD *)a3 + 20) = self->_tropicalSavannaBranchCount;
  *((_WORD *)a3 + 44) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    goto LABEL_23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_QWORD *)result + 6) = *(_QWORD *)&self->_odometer;
    *((_WORD *)result + 44) |= 0x20u;
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_deltaDistance;
  *((_WORD *)result + 44) |= 1u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_deltaDistanceAccuracy;
  *((_WORD *)result + 44) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)result + 8) = *(_QWORD *)&self->_timestampGps;
  *((_WORD *)result + 44) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)result + 7) = *(_QWORD *)&self->_slope;
  *((_WORD *)result + 44) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_maxAbsSlope;
  *((_WORD *)result + 44) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_groundAltitude;
  *((_WORD *)result + 44) |= 4u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_groundAltitudeUncertainty;
  *((_WORD *)result + 44) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 21) = self->_tropicalSavannaProximity;
  *((_WORD *)result + 44) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      return result;
    goto LABEL_12;
  }
LABEL_23:
  *((_DWORD *)result + 20) = self->_tropicalSavannaBranchCount;
  *((_WORD *)result + 44) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    return result;
LABEL_12:
  *((_QWORD *)result + 9) = self->_tropicalSavannaTreeId;
  *((_WORD *)result + 44) |= 0x100u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  __int16 has;
  __int16 v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 44);
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_odometer != *((double *)a3 + 6))
        goto LABEL_56;
    }
    else if ((v7 & 0x20) != 0)
    {
LABEL_56:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_deltaDistance != *((double *)a3 + 1))
        goto LABEL_56;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_deltaDistanceAccuracy != *((double *)a3 + 2))
        goto LABEL_56;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_timestampGps != *((double *)a3 + 8))
        goto LABEL_56;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_slope != *((double *)a3 + 7))
        goto LABEL_56;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_maxAbsSlope != *((double *)a3 + 5))
        goto LABEL_56;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_groundAltitude != *((double *)a3 + 3))
        goto LABEL_56;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_groundAltitudeUncertainty != *((double *)a3 + 4))
        goto LABEL_56;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_56;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 44) & 0x400) == 0 || self->_tropicalSavannaProximity != *((_DWORD *)a3 + 21))
        goto LABEL_56;
    }
    else if ((*((_WORD *)a3 + 44) & 0x400) != 0)
    {
      goto LABEL_56;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 44) & 0x200) == 0 || self->_tropicalSavannaBranchCount != *((_DWORD *)a3 + 20))
        goto LABEL_56;
    }
    else if ((*((_WORD *)a3 + 44) & 0x200) != 0)
    {
      goto LABEL_56;
    }
    LOBYTE(v5) = (v7 & 0x100) == 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 44) & 0x100) == 0 || self->_tropicalSavannaTreeId != *((_QWORD *)a3 + 9))
        goto LABEL_56;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  double odometer;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double deltaDistance;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double deltaDistanceAccuracy;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double timestampGps;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double slope;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double maxAbsSlope;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  double groundAltitude;
  double v36;
  long double v37;
  double v38;
  unint64_t v39;
  double groundAltitudeUncertainty;
  double v41;
  long double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;

  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    odometer = self->_odometer;
    v6 = -odometer;
    if (odometer >= 0.0)
      v6 = self->_odometer;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 1) != 0)
  {
    deltaDistance = self->_deltaDistance;
    v11 = -deltaDistance;
    if (deltaDistance >= 0.0)
      v11 = self->_deltaDistance;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 2) != 0)
  {
    deltaDistanceAccuracy = self->_deltaDistanceAccuracy;
    v16 = -deltaDistanceAccuracy;
    if (deltaDistanceAccuracy >= 0.0)
      v16 = self->_deltaDistanceAccuracy;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((has & 0x80) != 0)
  {
    timestampGps = self->_timestampGps;
    v21 = -timestampGps;
    if (timestampGps >= 0.0)
      v21 = self->_timestampGps;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((has & 0x40) != 0)
  {
    slope = self->_slope;
    v26 = -slope;
    if (slope >= 0.0)
      v26 = self->_slope;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((has & 0x10) != 0)
  {
    maxAbsSlope = self->_maxAbsSlope;
    v31 = -maxAbsSlope;
    if (maxAbsSlope >= 0.0)
      v31 = self->_maxAbsSlope;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((has & 4) != 0)
  {
    groundAltitude = self->_groundAltitude;
    v36 = -groundAltitude;
    if (groundAltitude >= 0.0)
      v36 = self->_groundAltitude;
    v37 = floor(v36 + 0.5);
    v38 = (v36 - v37) * 1.84467441e19;
    v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  if ((has & 8) != 0)
  {
    groundAltitudeUncertainty = self->_groundAltitudeUncertainty;
    v41 = -groundAltitudeUncertainty;
    if (groundAltitudeUncertainty >= 0.0)
      v41 = self->_groundAltitudeUncertainty;
    v42 = floor(v41 + 0.5);
    v43 = (v41 - v42) * 1.84467441e19;
    v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0)
        v39 += (unint64_t)v43;
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    v39 = 0;
  }
  if ((has & 0x400) == 0)
  {
    v44 = 0;
    if ((has & 0x200) != 0)
      goto LABEL_67;
LABEL_70:
    v45 = 0;
    if ((has & 0x100) != 0)
      goto LABEL_68;
LABEL_71:
    v46 = 0;
    return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v29 ^ v34 ^ v39 ^ v44 ^ v45 ^ v46;
  }
  v44 = 2654435761 * self->_tropicalSavannaProximity;
  if ((has & 0x200) == 0)
    goto LABEL_70;
LABEL_67:
  v45 = 2654435761 * self->_tropicalSavannaBranchCount;
  if ((has & 0x100) == 0)
    goto LABEL_71;
LABEL_68:
  v46 = 2654435761u * self->_tropicalSavannaTreeId;
  return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v29 ^ v34 ^ v39 ^ v44 ^ v45 ^ v46;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 44);
  if ((v3 & 0x20) != 0)
  {
    self->_odometer = *((double *)a3 + 6);
    *(_WORD *)&self->_has |= 0x20u;
    v3 = *((_WORD *)a3 + 44);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((v3 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_deltaDistance = *((double *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v3 = *((_WORD *)a3 + 44);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  self->_deltaDistanceAccuracy = *((double *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  v3 = *((_WORD *)a3 + 44);
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  self->_timestampGps = *((double *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 44);
  if ((v3 & 0x40) == 0)
  {
LABEL_6:
    if ((v3 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  self->_slope = *((double *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v3 = *((_WORD *)a3 + 44);
  if ((v3 & 0x10) == 0)
  {
LABEL_7:
    if ((v3 & 4) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  self->_maxAbsSlope = *((double *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v3 = *((_WORD *)a3 + 44);
  if ((v3 & 4) == 0)
  {
LABEL_8:
    if ((v3 & 8) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  self->_groundAltitude = *((double *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  v3 = *((_WORD *)a3 + 44);
  if ((v3 & 8) == 0)
  {
LABEL_9:
    if ((v3 & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  self->_groundAltitudeUncertainty = *((double *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  v3 = *((_WORD *)a3 + 44);
  if ((v3 & 0x400) == 0)
  {
LABEL_10:
    if ((v3 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  self->_tropicalSavannaProximity = *((_DWORD *)a3 + 21);
  *(_WORD *)&self->_has |= 0x400u;
  v3 = *((_WORD *)a3 + 44);
  if ((v3 & 0x200) == 0)
  {
LABEL_11:
    if ((v3 & 0x100) == 0)
      return;
LABEL_23:
    self->_tropicalSavannaTreeId = *((_QWORD *)a3 + 9);
    *(_WORD *)&self->_has |= 0x100u;
    return;
  }
LABEL_22:
  self->_tropicalSavannaBranchCount = *((_DWORD *)a3 + 20);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 44) & 0x100) != 0)
    goto LABEL_23;
}

- (double)odometer
{
  return self->_odometer;
}

- (double)deltaDistance
{
  return self->_deltaDistance;
}

- (double)deltaDistanceAccuracy
{
  return self->_deltaDistanceAccuracy;
}

- (double)timestampGps
{
  return self->_timestampGps;
}

- (double)slope
{
  return self->_slope;
}

- (double)maxAbsSlope
{
  return self->_maxAbsSlope;
}

- (double)groundAltitude
{
  return self->_groundAltitude;
}

- (double)groundAltitudeUncertainty
{
  return self->_groundAltitudeUncertainty;
}

- (unsigned)tropicalSavannaBranchCount
{
  return self->_tropicalSavannaBranchCount;
}

- (unint64_t)tropicalSavannaTreeId
{
  return self->_tropicalSavannaTreeId;
}

@end

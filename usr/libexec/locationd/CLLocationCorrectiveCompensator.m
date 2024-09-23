@implementation CLLocationCorrectiveCompensator

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
  if (qword_102304FF8 != -1)
    dispatch_once(&qword_102304FF8, &stru_102158F68);
  return (id)qword_102304FF0;
}

- (CLLocationCorrectiveCompensator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLLocationCorrectiveCompensator;
  return -[CLLocationCorrectiveCompensator initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLLocationCorrectiveCompensatorProtocol, &OBJC_PROTOCOL___CLLocationCorrectiveCompensatorClientProtocol);
}

- (void)beginService
{
  self->_coarseLocationProvider = (GEOCoarseLocationProvider *)objc_alloc_init((Class)GEOCoarseLocationProvider);
}

- (void)endService
{

  self->_coarseLocationProvider = 0;
}

- (void)snapLocation:(id)a3 withReply:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  GEOCoarseLocationProvider *coarseLocationProvider;
  id v13;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[2];
  _OWORD v24[10];
  _OWORD v25[6];
  __int128 v26;
  __int128 v27;
  _BYTE v28[28];
  uint8_t buf[48];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _OWORD v35[2];

  if (a3)
  {
    objc_msgSend(a3, "clientLocation");
  }
  else
  {
    v34 = 0u;
    memset(v35, 0, 28);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    memset(buf, 0, sizeof(buf));
  }
  v26 = v33;
  v27 = v34;
  *(_OWORD *)v28 = v35[0];
  *(_OWORD *)&v28[12] = *(_OWORD *)((char *)v35 + 12);
  v25[2] = *(_OWORD *)&buf[32];
  v25[3] = v30;
  v25[4] = v31;
  v25[5] = v32;
  v25[0] = *(_OWORD *)buf;
  v25[1] = *(_OWORD *)&buf[16];
  v6 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithGEOCoordinate:", COERCE_DOUBLE(*(_OWORD *)buf >> 32), *(double *)((char *)v25 + 12));
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setTimestamp:", *(double *)((char *)&v25[4] + 12));
    objc_msgSend(v7, "setAltitude:", (int)*(double *)((char *)&v25[1] + 12));
    objc_msgSend(v7, "setHorizontalAccuracy:", *(double *)((char *)&v25[1] + 4));
    objc_msgSend(v7, "setVerticalAccuracy:", *(double *)((char *)&v25[2] + 4));
    if (*(_DWORD *)&v28[4] == 1)
      v8 = 1;
    else
      v8 = 2 * (*(_DWORD *)&v28[4] == 2);
    objc_msgSend(v7, "setReferenceFrame:", v8);
    if (*(double *)((char *)&v25[2] + 12) > -1.0)
      objc_msgSend(v7, "setSpeed:", *(double *)((char *)&v25[2] + 12));
    if (*(double *)((char *)&v25[3] + 12) < 360.0 && *(double *)((char *)&v25[3] + 12) >= 0.0)
      objc_msgSend(v7, "setCourse:");
  }
  v9 = v7;
  if (v9)
  {
    v10 = v9;
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102158FB0);
    v11 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_QWORD *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 1040;
      *(_DWORD *)&buf[20] = 156;
      *(_WORD *)&buf[24] = 2097;
      *(_QWORD *)&buf[26] = v25;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Location #compensation gonna be Snapping\", \"Input\":%{private, location:CLClientLocation}.*P}", buf, 0x22u);
    }
    coarseLocationProvider = self->_coarseLocationProvider;
    v13 = objc_msgSend(objc_msgSend(-[CLLocationCorrectiveCompensator universe](self, "universe"), "silo"), "queue");
    v14[1] = 3221225472;
    v21 = v26;
    v22 = v27;
    v23[0] = *(_OWORD *)v28;
    *(_OWORD *)((char *)v23 + 12) = *(_OWORD *)&v28[12];
    v17 = v25[2];
    v18 = v25[3];
    v19 = v25[4];
    v20 = v25[5];
    v15 = v25[0];
    v14[0] = _NSConcreteStackBlock;
    v14[2] = sub_100885828;
    v14[3] = &unk_102158F90;
    v16 = v25[1];
    v14[4] = a4;
    -[GEOCoarseLocationProvider fetchCoarseEquivalentForLocation:callbackQueue:callback:](coarseLocationProvider, "fetchCoarseEquivalentForLocation:callbackQueue:callback:", v10, v13, v14);
  }
  else
  {
    v24[6] = xmmword_101C174D8;
    v24[7] = xmmword_101C174E8;
    memset(&v24[8], 0, 28);
    v24[2] = xmmword_101C17498;
    v24[3] = xmmword_101C174A8;
    v24[4] = xmmword_101C174B8;
    v24[5] = xmmword_101C174C8;
    v24[0] = xmmword_101C17478;
    v24[1] = xmmword_101C17488;
    (*((void (**)(id, id, uint64_t, _QWORD))a4 + 2))(a4, objc_msgSend(objc_alloc((Class)CLLocation), "initWithClientLocation:", v24), 1, 0);
  }
}

@end

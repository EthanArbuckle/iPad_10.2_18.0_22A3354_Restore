@implementation CLBackgroundInertialOdometryService

+ (BOOL)isAvailable
{
  uint64_t v2;
  char v3;
  NSObject *v4;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  v2 = sub_100197040();
  v3 = sub_10075E7E4(v2);
  if ((v3 & 1) == 0)
  {
    if (qword_10229FF80 != -1)
      dispatch_once(&qword_10229FF80, &stru_102149BD0);
    v4 = qword_10229FF88;
    if (os_log_type_enabled((os_log_t)qword_10229FF88, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Background InertialOdometry not supported", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF80 != -1)
        dispatch_once(&qword_10229FF80, &stru_102149BD0);
      v8[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF88, 16, "Background InertialOdometry not supported", v8, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 0, "+[CLBackgroundInertialOdometryService isAvailable]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
  return v3;
}

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
  if (qword_102303138 != -1)
    dispatch_once(&qword_102303138, &stru_102149B90);
  return (id)qword_102303130;
}

- (CLBackgroundInertialOdometryService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLBackgroundInertialOdometryService;
  return -[CLBackgroundInertialOdometryService initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLBackgroundInertialOdometryServiceProtocol, &OBJC_PROTOCOL___CLBackgroundInertialOdometryServiceClientProtocol);
}

- (void)dealloc
{
  objc_super v3;

  self->_activeClients = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLBackgroundInertialOdometryService;
  -[CLBackgroundInertialOdometryService dealloc](&v3, "dealloc");
}

- (void)beginService
{
  NSObject *v4;
  double trajectorySampleInterval;
  double v6;
  const char *v7;
  char *v8;
  unsigned __int8 v9[4];
  float v10;
  int v11;
  double v12;
  uint8_t buf[1640];

  objc_msgSend(-[CLBackgroundInertialOdometryService universe](self, "universe"), "silo");
  if (!self->_backgroundBatchDispatcher.__ptr_.__value_)
  {
    objc_msgSend(-[CLBackgroundInertialOdometryService universe](self, "universe"), "silo");
    operator new();
  }
  -[CLBackgroundInertialOdometryService setActiveClients:](self, "setActiveClients:", objc_alloc_init((Class)NSMutableSet));
  -[CLBackgroundInertialOdometryService setAttitude:](self, "setAttitude:", 0);
  if (!self->_geomagneticModelClient.__ptr_.__value_)
  {
    -[CLBackgroundInertialOdometryService universe](self, "universe");
    operator new();
  }
  self->_isStatic = 0;
  self->_rotationArbitraryToTrueNorth = 0.0;
  self->_trajectorySampleInterval = 0.0;
  *(_DWORD *)buf = 0;
  sub_1018C2254(v9, "BackgroundInertialOdometrySampleInterval", buf, 0);
  if (v10 >= 0.1 && v10 <= 10.0)
  {
    self->_trajectorySampleInterval = v10;
    if (qword_10229FF80 != -1)
      dispatch_once(&qword_10229FF80, &stru_102149BD0);
    v4 = qword_10229FF88;
    if (os_log_type_enabled((os_log_t)qword_10229FF88, OS_LOG_TYPE_DEFAULT))
    {
      trajectorySampleInterval = self->_trajectorySampleInterval;
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = trajectorySampleInterval;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Background InertialOdometry interval set to %f [s]", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF80 != -1)
        dispatch_once(&qword_10229FF80, &stru_102149BD0);
      v6 = self->_trajectorySampleInterval;
      v11 = 134217984;
      v12 = v6;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF88, 0, "Background InertialOdometry interval set to %f [s]", COERCE_DOUBLE(&v11));
      v8 = (char *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLBackgroundInertialOdometryService beginService]", "%s\n", v7);
      if (v8 != (char *)buf)
        free(v8);
    }
  }
  -[CLBackgroundInertialOdometryService toggleUpdates](self, "toggleUpdates");
}

- (void)endService
{
  uint64_t v3;
  Dispatcher *value;

  objc_msgSend(-[CLBackgroundInertialOdometryService universe](self, "universe"), "silo");
  if (self->_backgroundBatchDispatcher.__ptr_.__value_)
  {
    v3 = sub_1000A652C(0);
    sub_1000A4A6C(v3, 51, (uint64_t)self->_backgroundBatchDispatcher.__ptr_.__value_);
    value = self->_backgroundBatchDispatcher.__ptr_.__value_;
    self->_backgroundBatchDispatcher.__ptr_.__value_ = 0;
    if (value)
      (*(void (**)(Dispatcher *))(*(_QWORD *)value + 8))(value);
  }
  -[CLBackgroundInertialOdometryService toggleUpdates](self, "toggleUpdates");
}

- (void)isAvailableWithReply:(id)a3
{
  (*((void (**)(id, BOOL))a3 + 2))(a3, +[CLBackgroundInertialOdometryService isAvailable](CLBackgroundInertialOdometryService, "isAvailable"));
}

- (void)startBackgroundInertialOdometryUpdatesForClient:(id)a3 withIdentifier:(id)a4 usingReferenceFrame:(unint64_t)a5
{
  NSObject *v9;
  CLBackgroundInertialOdometryClientSession *v10;
  CMOdometry *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  float rotationArbitraryToTrueNorth;
  double v17;
  double v18;
  CMOdometry *v19;
  CMOdometry *v20;
  const char *v21;
  uint8_t *v22;
  __int16 v23[8];
  uint8_t buf[1640];

  if (+[CLBackgroundInertialOdometryService isAvailable](CLBackgroundInertialOdometryService, "isAvailable"))
  {
    if (-[CLBackgroundInertialOdometryService sessionForClient:](self, "sessionForClient:", a3))
    {
      if (qword_10229FF80 != -1)
        dispatch_once(&qword_10229FF80, &stru_102149BD0);
      v9 = qword_10229FF88;
      if (os_log_type_enabled((os_log_t)qword_10229FF88, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Client has already started background InertialOdometry updates", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FF80 != -1)
          dispatch_once(&qword_10229FF80, &stru_102149BD0);
        v23[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF88, 16, "Client has already started background InertialOdometry updates", v23, 2);
        v22 = (uint8_t *)v21;
        sub_100512490("Generic", 1, 0, 0, "-[CLBackgroundInertialOdometryService startBackgroundInertialOdometryUpdatesForClient:withIdentifier:usingReferenceFrame:]", "%s\n", v21);
        if (v22 != buf)
          free(v22);
      }
    }
    else
    {
      v10 = -[CLBackgroundInertialOdometryClientSession initWithClient:withIdentifier:usingReferenceFrame:atMachContinuousTime:]([CLBackgroundInertialOdometryClientSession alloc], "initWithClient:withIdentifier:usingReferenceFrame:atMachContinuousTime:", a3, a4, a5, sub_1001FCBB4());
      if (self->_isStatic && -[CLBackgroundInertialOdometryService attitude](self, "attitude"))
      {
        v11 = [CMOdometry alloc];
        v12 = -[NSArray objectAtIndexedSubscript:](-[CLBackgroundInertialOdometryService attitude](self, "attitude"), "objectAtIndexedSubscript:", 0);
        v13 = -[NSArray objectAtIndexedSubscript:](-[CLBackgroundInertialOdometryService attitude](self, "attitude"), "objectAtIndexedSubscript:", 1);
        v14 = -[NSArray objectAtIndexedSubscript:](-[CLBackgroundInertialOdometryService attitude](self, "attitude"), "objectAtIndexedSubscript:", 2);
        v15 = -[NSArray objectAtIndexedSubscript:](-[CLBackgroundInertialOdometryService attitude](self, "attitude"), "objectAtIndexedSubscript:", 3);
        rotationArbitraryToTrueNorth = self->_rotationArbitraryToTrueNorth;
        v17 = sub_1001FCBB4();
        v18 = v17;
        *(float *)&v17 = rotationArbitraryToTrueNorth;
        v19 = -[CMOdometry initWithDeltaPositionX:deltaPositionY:deltaPositionZ:deltaVelocityX:deltaVelocityY:deltaVelocityZ:quaternionX:quaternionY:quaternionZ:quaternionW:rotationArbitraryToTrueNorth:staticFlag:timestamp:](v11, "initWithDeltaPositionX:deltaPositionY:deltaPositionZ:deltaVelocityX:deltaVelocityY:deltaVelocityZ:quaternionX:quaternionY:quaternionZ:quaternionW:rotationArbitraryToTrueNorth:staticFlag:timestamp:", &off_102220BE8, &off_102220BE8, &off_102220BE8, &off_102220BE8, &off_102220BE8, &off_102220BE8, v17, v18, v12, v13, v14, v15, 1);
        v20 = v19;
        if (v10->_referenceFrame == 8)
          -[CMOdometry rotateArbitraryToTrueNorth](v19, "rotateArbitraryToTrueNorth");
        -[CLBackgroundInertialOdometryServiceClientProtocol onBackgroundInertialOdometryState:](-[CLBackgroundInertialOdometryClientSession client](v10, "client"), "onBackgroundInertialOdometryState:", v20);

      }
      -[NSMutableSet addObject:](-[CLBackgroundInertialOdometryService activeClients](self, "activeClients"), "addObject:", v10);

      -[CLBackgroundInertialOdometryService toggleUpdates](self, "toggleUpdates");
    }
  }
}

- (void)stopBackgroundInertialOdometryUpdatesForClient:(id)a3
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  _WORD v9[8];
  uint8_t buf[1640];

  if (+[CLBackgroundInertialOdometryService isAvailable](CLBackgroundInertialOdometryService, "isAvailable"))
  {
    v5 = -[CLBackgroundInertialOdometryService sessionForClient:](self, "sessionForClient:", a3);
    if (v5)
    {
      -[NSMutableSet removeObject:](-[CLBackgroundInertialOdometryService activeClients](self, "activeClients"), "removeObject:", v5);
      -[CLBackgroundInertialOdometryService toggleUpdates](self, "toggleUpdates");
    }
    else
    {
      if (qword_10229FF80 != -1)
        dispatch_once(&qword_10229FF80, &stru_102149BD0);
      v6 = qword_10229FF88;
      if (os_log_type_enabled((os_log_t)qword_10229FF88, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Client has not started background InertialOdometry updates", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FF80 != -1)
          dispatch_once(&qword_10229FF80, &stru_102149BD0);
        v9[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF88, 16, "Client has not started background InertialOdometry updates", v9, 2);
        v8 = (uint8_t *)v7;
        sub_100512490("Generic", 1, 0, 0, "-[CLBackgroundInertialOdometryService stopBackgroundInertialOdometryUpdatesForClient:]", "%s\n", v7);
        if (v8 != buf)
          free(v8);
      }
    }
  }
}

- (void)onBackgroundBatchData:(const BackgroundInertialOdometryBatch *)a3
{
  double v4;
  uint64_t v5;
  unsigned __int8 *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  _BOOL4 v10;
  _BOOL4 isStatic;
  BOOL v12;
  uint64_t v13;
  char *v14;
  double v15;
  double v16;
  double v17;
  _BYTE *v18;
  char *v19;
  void *i;
  _QWORD *v21;
  double v22;
  NSNumber *v23;
  double v24;
  NSNumber *v25;
  double v26;
  NSNumber *v27;
  uint64_t v28;
  double v29;
  NSNumber *v30;
  uint64_t v31;
  double v32;
  NSNumber *v33;
  uint64_t v34;
  double v35;
  NSNumber *v36;
  uint64_t v37;
  double v38;
  NSNumber *v39;
  uint64_t v40;
  double v41;
  NSNumber *v42;
  uint64_t v43;
  double v44;
  NSNumber *v45;
  uint64_t v46;
  double v47;
  NSNumber *v48;
  uint64_t v49;
  double v50;
  CMOdometry *v51;
  CMOdometry *v52;
  const char *v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  _DWORD *v57;
  _DWORD *v58;
  _DWORD *v59;
  NSMutableSet *obj;
  _DWORD *v61;
  _DWORD *v62;
  _DWORD *v63;
  uint64_t v64;
  _DWORD *v65;
  _DWORD *v66;
  _DWORD *v67;
  _DWORD *v68;
  uint64_t v69;
  const BackgroundInertialOdometryBatch *v70;
  id v72;
  uint64_t v73;
  uint64_t v74;
  CMOdometry *v75;
  _QWORD *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int16 v81;
  _QWORD v82[2];
  uint64_t (*v83)(uint64_t, uint64_t);
  void *v84;
  char v85;
  _BYTE v86[128];
  _QWORD v87[4];
  uint8_t buf[1632];

  if (-[NSMutableSet count](-[CLBackgroundInertialOdometryService activeClients](self, "activeClients"), "count")
    && a3->var14[1])
  {
    v5 = 0;
    v70 = a3;
    do
    {
      v6 = &a3->var0 + v5;
      v7 = *((unsigned __int8 *)&a3->var12[4] + v5 + 1);
      v82[0] = _NSConcreteStackBlock;
      v82[1] = 3221225472;
      v83 = sub_10065DE5C;
      v84 = &unk_102149BB0;
      v85 = v7;
      if (v7)
      {
        if (qword_10229FF80 != -1)
          dispatch_once(&qword_10229FF80, &stru_102149BD0);
        v8 = qword_10229FF88;
        if (os_log_type_enabled((os_log_t)qword_10229FF88, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DeviceMotion uninitialized", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FF80 != -1)
            dispatch_once(&qword_10229FF80, &stru_102149BD0);
          v81 = 0;
          LODWORD(v55) = 2;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF88, 0, "DeviceMotion uninitialized", &v81, v55);
          v54 = (uint8_t *)v53;
          sub_100512490("Generic", 1, 0, 2, "-[CLBackgroundInertialOdometryService onBackgroundBatchData:]", "%s\n", v53);
          if (v54 != buf)
            free(v54);
        }
      }
      v9 = v6[201];
      v10 = v6[201] == 0;
      if (v6[201])
        isStatic = self->_isStatic;
      else
        isStatic = 1;
      v12 = !self->_isStatic;
      v13 = 2 * v10;
      self->_isStatic = v9;
      if (v12)
        v13 = v9;
      v69 = v13;
      v56 = v5;
      v14 = (char *)a3 + 4 * v5;
      LODWORD(v4) = *(_DWORD *)(v14 + 133);
      v67 = v14 + 133;
      v87[0] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4);
      LODWORD(v15) = *(_DWORD *)(v14 + 149);
      v66 = v14 + 149;
      v87[1] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v15);
      LODWORD(v16) = *(_DWORD *)(v14 + 165);
      v65 = v14 + 165;
      v87[2] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v16);
      LODWORD(v17) = *(_DWORD *)(v14 + 181);
      v68 = v14 + 181;
      v87[3] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v17);
      -[CLBackgroundInertialOdometryService setAttitude:](self, "setAttitude:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v87, 4));
      v4 = *(float *)((char *)&a3->var12[2] + 1) - *((double *)self->_geomagneticModelClient.__ptr_.__value_ + 1);
      *(float *)&v4 = v4;
      self->_rotationArbitraryToTrueNorth = *(float *)&v4;
      if (!isStatic || !self->_isStatic)
      {
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        obj = -[CLBackgroundInertialOdometryService activeClients](self, "activeClients");
        v72 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
        if (v72)
        {
          v64 = *(_QWORD *)v78;
          v18 = (char *)&v70->var4[2] + v56 + 1;
          v19 = (char *)v70 + 4 * v56;
          v59 = v19 + 33;
          v58 = v19 + 49;
          v57 = v19 + 65;
          v63 = v19 + 85;
          v61 = v19 + 117;
          v62 = v19 + 101;
          do
          {
            for (i = 0; i != v72; i = (char *)i + 1)
            {
              if (*(_QWORD *)v78 != v64)
                objc_enumerationMutation(obj);
              v21 = *(_QWORD **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i);
              v75 = [CMOdometry alloc];
              if ((*v18 & 1) != 0)
              {
                LODWORD(v22) = *v59;
                v23 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v22);
              }
              else
              {
                v23 = 0;
              }
              v74 = v83((uint64_t)v82, (uint64_t)v23);
              if ((*v18 & 2) != 0)
              {
                LODWORD(v24) = *v58;
                v25 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v24);
              }
              else
              {
                v25 = 0;
              }
              v76 = v21;
              v73 = v83((uint64_t)v82, (uint64_t)v25);
              if ((*v18 & 4) != 0)
              {
                LODWORD(v26) = *v57;
                v27 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v26);
              }
              else
              {
                v27 = 0;
              }
              v28 = v83((uint64_t)v82, (uint64_t)v27);
              LODWORD(v29) = *v63;
              v30 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v29);
              v31 = v83((uint64_t)v82, (uint64_t)v30);
              LODWORD(v32) = *v62;
              v33 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v32);
              v34 = v83((uint64_t)v82, (uint64_t)v33);
              LODWORD(v35) = *v61;
              v36 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v35);
              v37 = v83((uint64_t)v82, (uint64_t)v36);
              LODWORD(v38) = *v67;
              v39 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v38);
              v40 = v83((uint64_t)v82, (uint64_t)v39);
              LODWORD(v41) = *v66;
              v42 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v41);
              v43 = v83((uint64_t)v82, (uint64_t)v42);
              LODWORD(v44) = *v65;
              v45 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v44);
              v46 = v83((uint64_t)v82, (uint64_t)v45);
              LODWORD(v47) = *v68;
              v48 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v47);
              v49 = v83((uint64_t)v82, (uint64_t)v48);
              v50 = *(float *)((char *)&v70->var12[2] + 1)
                  - *((double *)self->_geomagneticModelClient.__ptr_.__value_ + 1);
              *(float *)&v50 = v50;
              v51 = -[CMOdometry initWithDeltaPositionX:deltaPositionY:deltaPositionZ:deltaVelocityX:deltaVelocityY:deltaVelocityZ:quaternionX:quaternionY:quaternionZ:quaternionW:rotationArbitraryToTrueNorth:staticFlag:timestamp:](v75, "initWithDeltaPositionX:deltaPositionY:deltaPositionZ:deltaVelocityX:deltaVelocityY:deltaVelocityZ:quaternionX:quaternionY:quaternionZ:quaternionW:rotationArbitraryToTrueNorth:staticFlag:timestamp:", v74, v73, v28, v31, v34, v37, v50, (double)*(unint64_t *)(&v70->var0 + 8 * v56 + 1) * 0.000001, v40, v43, v46, v49, v69);
              v52 = v51;
              if (v76[1] == 8)
                -[CMOdometry rotateArbitraryToTrueNorth](v51, "rotateArbitraryToTrueNorth");
              objc_msgSend(objc_msgSend(v76, "client"), "onBackgroundInertialOdometryState:", v52);

              v18 = (char *)&v70->var4[2] + v56 + 1;
            }
            v72 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
          }
          while (v72);
        }
      }
      v5 = v56 + 1;
      a3 = v70;
    }
    while (v56 + 1 < (unint64_t)v70->var14[1]);
  }
}

- (void)toggleUpdates
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  GeomagneticModelClient *value;
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  _DWORD v10[4];
  uint8_t buf[4];
  unsigned int v12;

  v3 = -[NSMutableSet count](-[CLBackgroundInertialOdometryService activeClients](self, "activeClients"), "count");
  if (qword_10229FF80 != -1)
    dispatch_once(&qword_10229FF80, &stru_102149BD0);
  v4 = qword_10229FF88;
  if (os_log_type_enabled((os_log_t)qword_10229FF88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    v12 = -[NSMutableSet count](-[CLBackgroundInertialOdometryService activeClients](self, "activeClients"), "count");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Number of BIO clients: %{public}d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF80 != -1)
      dispatch_once(&qword_10229FF80, &stru_102149BD0);
    v7 = qword_10229FF88;
    v10[0] = 67240192;
    v10[1] = -[NSMutableSet count](-[CLBackgroundInertialOdometryService activeClients](self, "activeClients"), "count");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 0, "Number of BIO clients: %{public}d", v10, 8);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLBackgroundInertialOdometryService toggleUpdates]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  v5 = sub_1000A652C(0);
  sub_1005D3344(v5, v3 != 0, self->_trajectorySampleInterval);
  value = self->_geomagneticModelClient.__ptr_.__value_;
  if (v3)
  {
    sub_100ED4988((uint64_t)value);
  }
  else
  {
    sub_100ED4D78((uint64_t)value);
    self->_isStatic = 0;
    -[CLBackgroundInertialOdometryService setAttitude:](self, "setAttitude:", 0);
    self->_rotationArbitraryToTrueNorth = 0.0;
  }
}

- (id)sessionForClient:(id)a3
{
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[CLBackgroundInertialOdometryService activeClients](self, "activeClients", 0);
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(v9, "client") == a3)
      return v9;
    if (v6 == (id)++v8)
    {
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (NSMutableSet)activeClients
{
  return self->_activeClients;
}

- (void)setActiveClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSArray)attitude
{
  return self->_attitude;
}

- (void)setAttitude:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  Dispatcher *value;

  sub_10065E278((uint64_t *)&self->_geomagneticModelClient, 0);
  value = self->_backgroundBatchDispatcher.__ptr_.__value_;
  self->_backgroundBatchDispatcher.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Dispatcher *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end

@implementation CLSubmersionStateMachine

- (CLSubmersionStateMachine)initWithType:(int64_t)a3
{
  CLSubmersionStateMachine *v4;
  CLSubmersionStateMachine *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSubmersionStateMachine;
  v4 = -[CLSubmersionStateMachine init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    -[CLSubmersionStateMachine initializeThresholds](v4, "initializeThresholds");
  }
  return v5;
}

- (void)initializeThresholds
{
  double v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  int64_t type;
  double maxDepth;
  float v9;
  float v10;
  float v11;
  int64_t v12;
  double v13;
  const char *v14;
  uint8_t *v15;
  const char *v16;
  uint8_t *v17;
  double v18;
  float v19;
  int v20;
  __int16 v21;
  double v22;
  uint8_t buf[4];
  float v24;
  __int16 v25;
  double v26;

  v3 = 6.0;
  if (self->_type != 1)
    goto LABEL_9;
  self->_maxDepth = 40.0;
  v4 = MGGetSInt32Answer(CFSTR("AbsoluteDepthLimit"), 0xFFFFFFFFLL, 6.0);
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102190510);
  v5 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v24 = *(float *)&v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Max depth from gestalt, %d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102190510);
    v19 = 1.5047e-36;
    v20 = v4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "Max depth from gestalt, %d", &v19);
    v17 = (uint8_t *)v16;
    sub_100512490("Generic", 1, 0, 2, "-[CLSubmersionStateMachine initializeThresholds]", "%s\n", v16);
    if (v17 != buf)
      free(v17);
  }
  if (v4 >= 1)
  {
    v3 = (double)v4;
LABEL_9:
    self->_maxDepth = v3;
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102190510);
  v6 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    type = self->_type;
    maxDepth = self->_maxDepth;
    *(_DWORD *)buf = 67109376;
    v24 = *(float *)&type;
    v25 = 2048;
    v26 = maxDepth;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "initializing submersion thresholds,type,%d,maxdepth,%f", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102190510);
    v12 = self->_type;
    v13 = self->_maxDepth;
    v19 = 1.5047e-36;
    v20 = v12;
    v21 = 2048;
    v22 = v13;
    LODWORD(v18) = 18;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "initializing submersion thresholds,type,%d,maxdepth,%f", &v19, v18);
    v15 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLSubmersionStateMachine initializeThresholds]", "%s\n", v14);
    if (v15 != buf)
      free(v15);
  }
  v19 = 1.0;
  sub_1018C2254(buf, "DeepDepthMeters", &v19, 0);
  self->_deepThreshold = v24;
  v9 = self->_maxDepth * 0.875;
  v19 = v9;
  sub_1018C2254(buf, "NearDepthLimitMeters", &v19, 0);
  self->_nearDepthLimitThreshold = v24;
  v10 = self->_maxDepth;
  v19 = v10;
  sub_1018C2254(buf, "PastMaxDepthMeters", &v19, 0);
  self->_pastMaxDepthThreshold = v24;
  v11 = self->_maxDepth * 1.1;
  v19 = v11;
  sub_1018C2254(buf, "SensorErrorDepthMeters", &v19, 0);
  self->_sensorErrorThreshold = v24;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
  -[CLSubmersionStateMachine initializeThresholds](self, "initializeThresholds");
}

- (int64_t)getType
{
  return self->_type;
}

- (int64_t)stateFromDepth:(id)a3 forceSubmersion:(BOOL)a4
{
  NSObject *v7;
  id v8;
  uint64_t v9;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  const char *v18;
  uint8_t *v19;
  double v20;
  int v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  uint64_t v28;

  if ((uint64_t)objc_msgSend(a3, "state") > 199 || a4)
  {
    objc_msgSend(a3, "depth");
    if (v11 <= self->_sensorErrorThreshold)
    {
      objc_msgSend(a3, "depth");
      if (v12 <= self->_pastMaxDepthThreshold)
      {
        objc_msgSend(a3, "depth");
        if (v13 <= self->_nearDepthLimitThreshold)
        {
          objc_msgSend(a3, "depth");
          if (v14 <= self->_deepThreshold)
            return 200;
          else
            return 300;
        }
        else
        {
          return 400;
        }
      }
      else
      {
        return 500;
      }
    }
    else
    {
      return 600;
    }
  }
  else
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102190510);
    v7 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      v8 = objc_msgSend(a3, "state");
      objc_msgSend(a3, "depth");
      *(_DWORD *)buf = 134218240;
      v26 = v8;
      v27 = 2048;
      v28 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "not updating client state because not submerged,state,%ld,depth,%f", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102190510);
      v15 = qword_10229FE88;
      v16 = objc_msgSend(a3, "state");
      objc_msgSend(a3, "depth");
      v21 = 134218240;
      v22 = v16;
      v23 = 2048;
      v24 = v17;
      LODWORD(v20) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v15, 2, "not updating client state because not submerged,state,%ld,depth,%f", &v21, v20);
      v19 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 2, "-[CLSubmersionStateMachine stateFromDepth:forceSubmersion:]", "%s\n", v18);
      if (v19 != buf)
        free(v19);
    }
    return (int64_t)objc_msgSend(a3, "state");
  }
}

- (double)deepThreshold
{
  return self->_deepThreshold;
}

- (double)nearDepthLimitThreshold
{
  return self->_nearDepthLimitThreshold;
}

- (double)pastMaxDepthThreshold
{
  return self->_pastMaxDepthThreshold;
}

- (double)sensorErrorThreshold
{
  return self->_sensorErrorThreshold;
}

- (int64_t)type
{
  return self->_type;
}

@end

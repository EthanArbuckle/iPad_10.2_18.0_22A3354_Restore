@implementation CLElevationThresholdManager

- (CLElevationThresholdManager)init
{
  CLElevationThresholdManager *v2;
  unsigned __int8 v4[4];
  float v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLElevationThresholdManager;
  v2 = -[CLElevationThresholdManager init](&v6, "init");
  if (v2)
  {
    sub_1018C2254(v4, "ElevationThresholdHysteresisBand", dword_101BE7208, 0);
    v2->_hysteresisBand = v5;
  }
  return v2;
}

- (void)thresholdBoundsForElevation:(float)a3 andAccuracy:(float)a4 upperBound:(float *)a5 lowerBound:(float *)a6
{
  CLElevationThresholdManager *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *p_pair1;
  float *v11;
  float v12;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *v14;
  BOOL v15;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *v16;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **v17;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *v18;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **v19;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **v20;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *v21;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **v22;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **v23;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *v24;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **v25;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *v26;
  NSObject *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  const char *v32;
  uint8_t *v33;
  double v34;
  int v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  uint8_t buf[4];
  double v42;
  __int16 v43;
  double v44;
  __int16 v45;
  double v46;

  if (self->_elevationThresholdMap.__tree_.__pair3_.__value_)
  {
    begin_node = (CLElevationThresholdManager *)self->_elevationThresholdMap.__tree_.__begin_node_;
    p_pair1 = &self->_elevationThresholdMap.__tree_.__pair1_;
    if (begin_node != (CLElevationThresholdManager *)&self->_elevationThresholdMap.__tree_.__pair1_)
    {
      v11 = (float *)self->_elevationThresholdMap.__tree_.__begin_node_;
      do
      {
        if (a4 < 100.0)
        {
          v12 = v11[8];
          if (v12 < a3)
          {
            if (*((_BYTE *)v11 + 40))
              *a6 = v12;
          }
        }
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)*((_QWORD *)v11 + 1);
        if (left)
        {
          do
          {
            v14 = left;
            left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)left->__value_.__left_;
          }
          while (left);
        }
        else
        {
          do
          {
            v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)*((_QWORD *)v11 + 2);
            v15 = v14->__value_.__left_ == v11;
            v11 = (float *)v14;
          }
          while (!v15);
        }
        v11 = (float *)v14;
      }
      while (v14 != p_pair1);
      do
      {
        v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)p_pair1->__value_.__left_;
        if (a4 < 100.0)
        {
          v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)p_pair1->__value_.__left_;
          v18 = p_pair1;
          if (v16)
          {
            do
            {
              v19 = v17;
              v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)v17[1];
            }
            while (v17);
          }
          else
          {
            do
            {
              v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)v18[2].__value_.__left_;
              v15 = *v19 == v18;
              v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)v19;
            }
            while (v15);
          }
          if (*((float *)v19 + 8) > a3)
          {
            v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)p_pair1->__value_.__left_;
            v21 = p_pair1;
            if (v16)
            {
              do
              {
                v22 = v20;
                v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)v20[1];
              }
              while (v20);
            }
            else
            {
              do
              {
                v22 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)v21[2].__value_.__left_;
                v15 = *v22 == v21;
                v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)v22;
              }
              while (v15);
            }
            if (*((_BYTE *)v22 + 40))
            {
              v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)p_pair1->__value_.__left_;
              v24 = p_pair1;
              if (v16)
              {
                do
                {
                  v25 = v23;
                  v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)v23[1];
                }
                while (v23);
              }
              else
              {
                do
                {
                  v25 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)v24[2].__value_.__left_;
                  v15 = *v25 == v24;
                  v24 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)v25;
                }
                while (v15);
              }
              *a5 = *((float *)v25 + 8);
            }
          }
        }
        if (v16)
        {
          do
          {
            v26 = v16;
            v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)v16[1].__value_.__left_;
          }
          while (v16);
        }
        else
        {
          do
          {
            v26 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)p_pair1[2].__value_.__left_;
            v15 = v26->__value_.__left_ == p_pair1;
            p_pair1 = v26;
          }
          while (v15);
        }
        p_pair1 = v26;
      }
      while (v26 != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)begin_node);
    }
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10215E6C8);
    v27 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      v28 = *a6;
      v29 = *a5;
      *(_DWORD *)buf = 134218496;
      v42 = a3;
      v43 = 2048;
      v44 = v28;
      v45 = 2048;
      v46 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "currentAltitude,%f,thresholdLowerBound,%f,thresholdUpperBound,%f", buf, 0x20u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10215E6C8);
      v30 = *a6;
      v31 = *a5;
      v35 = 134218496;
      v36 = a3;
      v37 = 2048;
      v38 = v30;
      v39 = 2048;
      v40 = v31;
      LODWORD(v34) = 32;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "currentAltitude,%f,thresholdLowerBound,%f,thresholdUpperBound,%f", COERCE_DOUBLE(&v35), v34);
      v33 = (uint8_t *)v32;
      sub_100512490("Generic", 1, 0, 2, "-[CLElevationThresholdManager thresholdBoundsForElevation:andAccuracy:upperBound:lowerBound:]", "%s\n", v32);
      if (v33 != buf)
        free(v33);
    }
  }
}

- (void)insertClient:(id)a3 withThreshold:(float)a4
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *v7;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *v10;
  unint64_t v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> **v13;
  CFAbsoluteTime Current;
  NSObject *v19;
  const char *v20;
  char *v21;
  double v22;
  int v23;
  id v24;
  __int16 v25;
  double v26;
  _BYTE buf[24];
  unint64_t v28;
  double v29;
  CFAbsoluteTime v30;

  *(float *)buf = a4;
  *(_WORD *)&buf[8] = 0;
  *(_QWORD *)&buf[16] = a3;
  LOBYTE(v28) = 0;
  sub_10090DE94((uint64_t **)&self->_elevationThresholdMap, buf);
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *)self->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_;
  v7 = left;
  if (!left)
    goto LABEL_12;
  v10 = p_pair1;
  do
  {
    v11 = (unint64_t)v7[4].__value_.__left_;
    _CF = v11 >= (unint64_t)a3;
    if (v11 >= (unint64_t)a3)
      v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> **)v7;
    else
      v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> **)&v7[1];
    if (_CF)
      v10 = v7;
    v7 = *v13;
  }
  while (*v13);
  if (v10 == p_pair1 || v10[4].__value_.__left_ > a3)
  {
LABEL_12:
    Current = CFAbsoluteTimeGetCurrent();
    *(_QWORD *)buf = a3;
    __asm { FMOV            V1.2D, #-1.0 }
    *(_OWORD *)&buf[8] = _Q1;
    v28 = 0xBFF0000000000000;
    v29 = a4;
    v30 = Current;
    sub_10090DF28((uint64_t **)&p_pair1[-1], (unint64_t *)buf, buf);
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_10215E6C8);
  v19 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a4;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "threshold client registered,client,%p,threshold,%f", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10215E6C8);
    v23 = 134218240;
    v24 = a3;
    v25 = 2048;
    v26 = a4;
    LODWORD(v22) = 22;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "threshold client registered,client,%p,threshold,%f", &v23, v22);
    v21 = (char *)v20;
    sub_100512490("Generic", 1, 0, 2, "-[CLElevationThresholdManager insertClient:withThreshold:]", "%s\n", v20);
    if (v21 != buf)
      free(v21);
  }
}

- (BOOL)removeClient:(id)a3
{
  uint64_t **p_elevationThresholdMap;
  CLElevationThresholdManager *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *p_pair1;
  int v7;
  uint64_t *v8;
  NSObject *v9;
  CLElevationThresholdManager *isa;
  objc_class *v11;
  const char *v12;
  char *v13;
  int v16;
  id v17;
  _BYTE buf[1632];

  p_elevationThresholdMap = (uint64_t **)&self->_elevationThresholdMap;
  begin_node = (CLElevationThresholdManager *)self->_elevationThresholdMap.__tree_.__begin_node_;
  p_pair1 = &self->_elevationThresholdMap.__tree_.__pair1_;
  if (begin_node == (CLElevationThresholdManager *)&self->_elevationThresholdMap.__tree_.__pair1_)
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    do
    {
      if (objc_msgSend(begin_node->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_.__value_.__left_, "isEqual:", a3))
      {
        v8 = sub_10008A9F0(p_elevationThresholdMap, (uint64_t *)begin_node);
        operator delete(begin_node);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10215E6C8);
        v9 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = a3;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "threshold client removed,client,%p", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_10215E6C8);
          v16 = 134217984;
          v17 = a3;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "threshold client removed,client,%p", &v16);
          v13 = (char *)v12;
          sub_100512490("Generic", 1, 0, 2, "-[CLElevationThresholdManager removeClient:]", "%s\n", v12);
          if (v13 != buf)
            free(v13);
        }
        ++v7;
        begin_node = (CLElevationThresholdManager *)v8;
      }
      else
      {
        isa = (CLElevationThresholdManager *)begin_node->_elevationThresholdMap.__tree_.__begin_node_;
        if (isa)
        {
          do
          {
            begin_node = isa;
            isa = (CLElevationThresholdManager *)isa->super.isa;
          }
          while (isa);
        }
        else
        {
          do
          {
            v11 = (objc_class *)begin_node;
            begin_node = (CLElevationThresholdManager *)begin_node->_elevationThresholdMap.__tree_.__pair1_.__value_.__left_;
          }
          while (begin_node->super.isa != v11);
        }
      }
    }
    while (begin_node != (CLElevationThresholdManager *)p_pair1);
  }
  *(_QWORD *)buf = a3;
  sub_10071E360((uint64_t)&self->_elevationThresholdClientAnalyticsMap, (unint64_t *)buf);
  return v7 > 0;
}

- (multimap<float,)getElevationThresholdProxyMap
{
  return (multimap<float, CLBarometerCalibration_Types::ThresholdClient, std::less<float>, std::allocator<std::pair<const float, CLBarometerCalibration_Types::ThresholdClient>>> *)sub_10090DFE8((uint64_t)retstr, (uint64_t)&self->_elevationThresholdMap);
}

- (void)initializeThresholdsGivenAltitude:(float)a3 andAccuracy:(float)a4
{
  float *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *p_pair1;
  double v8;
  __int128 v9;
  float v10;
  float hysteresisBand;
  BOOL v12;
  NSObject *v13;
  CFAbsoluteTime Current;
  double v15;
  double v16;
  int v17;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *v19;
  BOOL v20;
  uint64_t v21;
  CFAbsoluteTime v22;
  double v23;
  double v24;
  int v25;
  const char *v26;
  uint8_t *v27;
  double v28;
  __int128 v29;
  int v30;
  CFAbsoluteTime v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  int v39;
  uint8_t buf[4];
  CFAbsoluteTime v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  __int16 v48;
  int v49;

  begin_node = (float *)self->_elevationThresholdMap.__tree_.__begin_node_;
  p_pair1 = &self->_elevationThresholdMap.__tree_.__pair1_;
  if (begin_node != (float *)&self->_elevationThresholdMap.__tree_.__pair1_)
  {
    v8 = a3;
    *(_QWORD *)&v9 = 134219008;
    v29 = v9;
    do
    {
      v10 = begin_node[8];
      hysteresisBand = self->_hysteresisBand;
      v12 = v10 <= (float)(hysteresisBand + a3) && v10 >= (float)(a3 - hysteresisBand);
      if (!*((_BYTE *)begin_node + 40) && !v12)
      {
        -[CLElevationThresholdManager thresholdUpdated:initialized:above:](self, "thresholdUpdated:initialized:above:");
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10215E6C8);
        v13 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
        {
          Current = CFAbsoluteTimeGetCurrent();
          v15 = begin_node[8];
          v16 = self->_hysteresisBand;
          v17 = *((unsigned __int8 *)begin_node + 40);
          *(_DWORD *)buf = v29;
          v41 = Current;
          v42 = 2048;
          v43 = v15;
          v44 = 2048;
          v45 = v8;
          v46 = 2048;
          v47 = v16;
          v48 = 1024;
          v49 = v17;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "threshold initialized,timestamp,%f,threshold,%f,altitude,%f,hysteresis,%f,initialized,%d", buf, 0x30u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_10215E6C8);
          v21 = qword_10229FE88;
          v22 = CFAbsoluteTimeGetCurrent();
          v23 = begin_node[8];
          v24 = self->_hysteresisBand;
          v25 = *((unsigned __int8 *)begin_node + 40);
          v30 = v29;
          v31 = v22;
          v32 = 2048;
          v33 = v23;
          v34 = 2048;
          v35 = v8;
          v36 = 2048;
          v37 = v24;
          v38 = 1024;
          v39 = v25;
          LODWORD(v28) = 48;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v21, 0, "threshold initialized,timestamp,%f,threshold,%f,altitude,%f,hysteresis,%f,initialized,%d", COERCE_DOUBLE(&v30), v28, *(double *)&v29, *((double *)&v29 + 1));
          v27 = (uint8_t *)v26;
          sub_100512490("Generic", 1, 0, 2, "-[CLElevationThresholdManager initializeThresholdsGivenAltitude:andAccuracy:]", "%s\n", v26);
          if (v27 != buf)
            free(v27);
        }
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)*((_QWORD *)begin_node + 1);
      if (left)
      {
        do
        {
          v19 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)*((_QWORD *)begin_node + 2);
          v20 = v19->__value_.__left_ == begin_node;
          begin_node = (float *)v19;
        }
        while (!v20);
      }
      begin_node = (float *)v19;
    }
    while (v19 != p_pair1);
  }
}

- (void)thresholdUpdated:(ThresholdClient *)a3 initialized:(BOOL)a4 above:(BOOL)a5
{
  if (a3->var0 != a4 || a3->var1 != a5)
  {
    a3->var0 = a4;
    a3->var1 = a5;
    a3->var3 = 1;
  }
}

- (BOOL)updateWithAltitude:(float)a3 andAccuracy:(float)a4 upperBound:(float *)a5 lowerBound:(float *)a6
{
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  -[CLElevationThresholdManager clearShouldAlert](self, "clearShouldAlert");
  *(float *)&v11 = a3;
  -[CLElevationThresholdManager updateAnalyticsWithAltitude:](self, "updateAnalyticsWithAltitude:", v11);
  *(float *)&v12 = a3;
  -[CLElevationThresholdManager updateInitializedThresholdsWithAltitude:](self, "updateInitializedThresholdsWithAltitude:", v12);
  *(float *)&v13 = a3;
  *(float *)&v14 = a4;
  -[CLElevationThresholdManager initializeThresholdsGivenAltitude:andAccuracy:](self, "initializeThresholdsGivenAltitude:andAccuracy:", v13, v14);
  *(float *)&v15 = a3;
  *(float *)&v16 = a4;
  -[CLElevationThresholdManager thresholdBoundsForElevation:andAccuracy:upperBound:lowerBound:](self, "thresholdBoundsForElevation:andAccuracy:upperBound:lowerBound:", a5, a6, v15, v16);
  if (*a5 == self->_currentElevationThreshold.upper && *a6 == self->_currentElevationThreshold.lower)
    return 0;
  self->_currentElevationThreshold.upper = *a5;
  self->_currentElevationThreshold.lower = *a6;
  return 1;
}

- (void)updateInitializedThresholdsWithAltitude:(float)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *p_pair1;
  map<id, CLBarometerCalibration_Types::ThresholdAnalytics, std::less<id>, std::allocator<std::pair<const id, CLBarometerCalibration_Types::ThresholdAnalytics>>> *p_elevationThresholdClientAnalyticsMap;
  float v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *v10;
  BOOL v11;

  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)self->_elevationThresholdMap.__tree_.__begin_node_;
  p_pair1 = &self->_elevationThresholdMap.__tree_.__pair1_;
  if (begin_node != &self->_elevationThresholdMap.__tree_.__pair1_)
  {
    p_elevationThresholdClientAnalyticsMap = &self->_elevationThresholdClientAnalyticsMap;
    do
    {
      v8 = *(float *)&begin_node[4].__value_.__left_;
      if (BYTE1(begin_node[5].__value_.__left_) != v8 < a3 && LOBYTE(begin_node[5].__value_.__left_))
      {
        -[CLElevationThresholdManager thresholdUpdated:initialized:above:](self, "thresholdUpdated:initialized:above:", &begin_node[5], 0, v8 < a3);
        -[CLElevationThresholdManager sendAnalyticsEventForId:](self, "sendAnalyticsEventForId:", begin_node[6].__value_.__left_);
        sub_10071E360((uint64_t)p_elevationThresholdClientAnalyticsMap, (unint64_t *)&begin_node[6]);
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v10 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)begin_node[2].__value_.__left_;
          v11 = v10->__value_.__left_ == begin_node;
          begin_node = v10;
        }
        while (!v11);
      }
      begin_node = v10;
    }
    while (v10 != p_pair1);
  }
}

- (void)clearShouldAlert
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *begin_node;
  CLElevationThresholdManager *left;
  CLElevationThresholdManager *v4;
  BOOL v5;

  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)self->_elevationThresholdMap.__tree_.__begin_node_;
  if (begin_node != &self->_elevationThresholdMap.__tree_.__pair1_)
  {
    do
    {
      LOBYTE(begin_node[7].__value_.__left_) = 0;
      left = (CLElevationThresholdManager *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v4 = left;
          left = (CLElevationThresholdManager *)left->super.isa;
        }
        while (left);
      }
      else
      {
        do
        {
          v4 = (CLElevationThresholdManager *)begin_node[2].__value_.__left_;
          v5 = v4->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)v4;
        }
        while (!v5);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)v4;
    }
    while (v4 != (CLElevationThresholdManager *)&self->_elevationThresholdMap.__tree_.__pair1_);
  }
}

- (void)updateAnalyticsWithAltitude:(float)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *begin_node;
  double v4;
  double v5;
  CLElevationThresholdManager *left;
  CLElevationThresholdManager *v7;
  BOOL v8;

  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *)self->_elevationThresholdClientAnalyticsMap.__tree_.__begin_node_;
  if (begin_node != &self->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_)
  {
    v4 = a3;
    do
    {
      v5 = vabdd_f64(v4, *(double *)&begin_node[8].__value_.__left_);
      if (*(double *)&begin_node[5].__value_.__left_ < 0.0)
        *(double *)&begin_node[5].__value_.__left_ = v5;
      if (*(double *)&begin_node[7].__value_.__left_ >= v5)
        v5 = *(double *)&begin_node[7].__value_.__left_;
      *(double *)&begin_node[7].__value_.__left_ = v5;
      left = (CLElevationThresholdManager *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v7 = left;
          left = (CLElevationThresholdManager *)left->super.isa;
        }
        while (left);
      }
      else
      {
        do
        {
          v7 = (CLElevationThresholdManager *)begin_node[2].__value_.__left_;
          v8 = v7->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *)v7;
        }
        while (!v8);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *)v7;
    }
    while (v7 != (CLElevationThresholdManager *)&self->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_);
  }
}

- (void)sendAnalyticsEventForId:(id)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *v6;
  unint64_t v7;
  BOOL v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> **v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  CFAbsoluteTime Current;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  CFAbsoluteTime v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  uint8_t *v26;
  double v27;
  void **v28;
  uint64_t v29;
  NSDictionary *(*v30)(char *);
  void *v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41[2];
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46[2];
  uint64_t v47;
  void *__p;
  void *v49;
  uint64_t v50;
  void *v51[2];
  uint64_t v52;
  int v53;
  CFAbsoluteTime v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint8_t buf[4];
  CFAbsoluteTime v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;

  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *)self->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_;
  v4 = left;
  if (left)
  {
    v6 = p_pair1;
    do
    {
      v7 = (unint64_t)v4[4].__value_.__left_;
      v8 = v7 >= (unint64_t)a3;
      if (v7 >= (unint64_t)a3)
        v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> **)v4;
      else
        v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> **)&v4[1];
      if (v8)
        v6 = v4;
      v4 = *v9;
    }
    while (*v9);
    if (v6 != p_pair1 && v6[4].__value_.__left_ <= a3)
    {
      *(CFAbsoluteTime *)&v6[6].__value_.__left_ = CFAbsoluteTimeGetCurrent() - *(double *)&v6[9].__value_.__left_;
      v10 = *(double *)&v6[5].__value_.__left_;
      v49 = 0;
      v50 = 0;
      __p = 0;
      sub_10025EA00(&__p, (const void *)qword_102305790, qword_102305798, (qword_102305798 - qword_102305790) >> 3);
      sub_10090D860((uint64_t)&__p, v51, v10);
      if (__p)
      {
        v49 = __p;
        operator delete(__p);
      }
      v11 = *(double *)&v6[7].__value_.__left_;
      v44 = 0;
      v45 = 0;
      v43 = 0;
      sub_10025EA00(&v43, (const void *)qword_102305790, qword_102305798, (qword_102305798 - qword_102305790) >> 3);
      sub_10090D860((uint64_t)&v43, v46, v11);
      if (v43)
      {
        v44 = v43;
        operator delete(v43);
      }
      v12 = *(double *)&v6[6].__value_.__left_;
      v39 = 0;
      v40 = 0;
      v38 = 0;
      sub_10025EA00(&v38, (const void *)qword_1023057A8, qword_1023057B0, (qword_1023057B0 - qword_1023057A8) >> 3);
      sub_10090D860((uint64_t)&v38, v41, v12);
      if (v38)
      {
        v39 = v38;
        operator delete(v38);
      }
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10215E6C8);
      v13 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        Current = CFAbsoluteTimeGetCurrent();
        v15 = v6[4].__value_.__left_;
        v16 = v6[5].__value_.__left_;
        v18 = v6[6].__value_.__left_;
        v17 = v6[7].__value_.__left_;
        *(_DWORD *)buf = 134219008;
        v64 = Current;
        v65 = 2048;
        v66 = v15;
        v67 = 2048;
        v68 = v16;
        v69 = 2048;
        v70 = v17;
        v71 = 2048;
        v72 = v18;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "threshold crossing analytics,timestamp,%f,client,%p,deltaElevationToThreshold,%f,maxDeltaElevationToCrossing,%f,timeToCrossing,%f", buf, 0x34u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10215E6C8);
        v19 = qword_10229FE88;
        v20 = CFAbsoluteTimeGetCurrent();
        v21 = v6[4].__value_.__left_;
        v22 = v6[5].__value_.__left_;
        v24 = v6[6].__value_.__left_;
        v23 = v6[7].__value_.__left_;
        v53 = 134219008;
        v54 = v20;
        v55 = 2048;
        v56 = v21;
        v57 = 2048;
        v58 = v22;
        v59 = 2048;
        v60 = v23;
        v61 = 2048;
        v62 = v24;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 0, "threshold crossing analytics,timestamp,%f,client,%p,deltaElevationToThreshold,%f,maxDeltaElevationToCrossing,%f,timeToCrossing,%f", COERCE_DOUBLE(&v53), 52, v27, *(double *)&v28, *(double *)&v29);
        v26 = (uint8_t *)v25;
        sub_100512490("Generic", 1, 0, 2, "-[CLElevationThresholdManager sendAnalyticsEventForId:]", "%s\n", v25);
        if (v26 != buf)
          free(v26);
      }
      v28 = _NSConcreteStackBlock;
      v29 = 3321888768;
      v30 = sub_10090DBE8;
      v31 = &unk_10215E698;
      if (SHIBYTE(v52) < 0)
      {
        sub_100115CE4(&v32, v51[0], (unint64_t)v51[1]);
      }
      else
      {
        v32 = *(_OWORD *)v51;
        v33 = v52;
      }
      if (SHIBYTE(v47) < 0)
      {
        sub_100115CE4(&v34, v46[0], (unint64_t)v46[1]);
      }
      else
      {
        v34 = *(_OWORD *)v46;
        v35 = v47;
      }
      if (SHIBYTE(v42) < 0)
      {
        sub_100115CE4(&v36, v41[0], (unint64_t)v41[1]);
      }
      else
      {
        v36 = *(_OWORD *)v41;
        v37 = v42;
      }
      AnalyticsSendEventLazy(CFSTR("com.apple.Motion.Altimeter.ElevationThresholdAlert"), &v28);
      if (SHIBYTE(v37) < 0)
        operator delete((void *)v36);
      if (SHIBYTE(v35) < 0)
        operator delete((void *)v34);
      if (SHIBYTE(v33) < 0)
        operator delete((void *)v32);
      if (SHIBYTE(v42) < 0)
        operator delete(v41[0]);
      if (SHIBYTE(v47) < 0)
        operator delete(v46[0]);
      if (SHIBYTE(v52) < 0)
        operator delete(v51[0]);
    }
  }
}

- (void).cxx_destruct
{
  sub_100008848((uint64_t)&self->_elevationThresholdClientAnalyticsMap, (_QWORD *)self->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_.__value_.__left_);
  sub_100008848((uint64_t)&self->_elevationThresholdMap, (_QWORD *)self->_elevationThresholdMap.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 5) = (char *)self + 48;
  *((_QWORD *)self + 8) = 0xFF7FFFFF7F7FFFFFLL;
  return self;
}

@end

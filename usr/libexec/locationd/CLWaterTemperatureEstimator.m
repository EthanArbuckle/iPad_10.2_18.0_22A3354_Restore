@implementation CLWaterTemperatureEstimator

- (CLWaterTemperatureEstimator)init
{
  CLWaterTemperatureEstimator *v2;
  float *v3;
  unint64_t v4;
  unsigned __int8 v6;
  unsigned __int8 v7[3];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLWaterTemperatureEstimator;
  v2 = -[CLWaterTemperatureEstimator init](&v8, "init");
  if (v2)
  {
    v6 = 0;
    sub_1018BF25C(v7, "LogWatchEnclosureMaterial", &v6, 0);
    v2->_logEnclosureMaterial = v7[1];
    v3 = (float *)qword_10230C250;
    v4 = (unint64_t)(qword_10230C258 - qword_10230C250) >> 2;
    v2->_enclosureMaterial = 0;
    v2->_numTDotBins = v4;
    v2->_binWidth = v3[1] - *v3;
    v2->_numTErrorBins = -1;
    -[CLWaterTemperatureEstimator getEnclosureMaterial](v2, "getEnclosureMaterial");
    -[CLWaterTemperatureEstimator setWaterTempCoefficients](v2, "setWaterTempCoefficients");
  }
  return v2;
}

- (void)updateWithTDot:(const float *)a3 andTempMeasurement:(const float *)a4
{
  double v4;
  double v8;
  double v9;
  unsigned int v10;
  double v11;
  NSObject *v12;
  double v13;
  double v14;
  float v15;
  double v16;
  float v17;
  uint64_t v18;
  double v19;
  double v20;
  float v21;
  double v22;
  float v23;
  const char *v24;
  uint8_t *v25;
  double v26;
  int v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  uint8_t buf[4];
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;

  *(float *)&v4 = *a4;
  -[CLWaterTemperatureEstimator setWaterTempEst:](self, "setWaterTempEst:", v4);
  LODWORD(v8) = 5.0;
  -[CLWaterTemperatureEstimator setWaterTempUncertainty:](self, "setWaterTempUncertainty:", v8);
  if (-[CLWaterTemperatureEstimator coefficientsUpdated](self, "coefficientsUpdated"))
  {
    *(float *)&v9 = *a3;
    if (*a3 >= *(float *)qword_10230C250 && *(float *)&v9 <= *(float *)(qword_10230C250 + 4 * self->_numTDotBins - 4))
    {
      v10 = llroundf((float)(*(float *)&v9 - *(float *)qword_10230C250) / self->_binWidth);
      *(float *)&v9 = *a4 - self->_tempCoefficients.deltaTemp.__begin_[v10];
      -[CLWaterTemperatureEstimator setWaterTempEst:](self, "setWaterTempEst:", v9);
      *(float *)&v11 = self->_tempCoefficients.tempUncertainty.__begin_[v10];
      -[CLWaterTemperatureEstimator setWaterTempUncertainty:](self, "setWaterTempUncertainty:", v11);
    }
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_10219C710);
  v12 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    v13 = *a4;
    v14 = *a3;
    -[CLWaterTemperatureEstimator waterTempEst](self, "waterTempEst");
    v16 = v15;
    -[CLWaterTemperatureEstimator waterTempUncertainty](self, "waterTempUncertainty");
    *(_DWORD *)buf = 134218752;
    v36 = v13;
    v37 = 2048;
    v38 = v14;
    v39 = 2048;
    v40 = v16;
    v41 = 2048;
    v42 = v17;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "tdot estimator, temp, %f, tdot, %f, est temp, %f, est uncertainty, %f", buf, 0x2Au);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10219C710);
    v18 = qword_10229FE88;
    v19 = *a4;
    v20 = *a3;
    -[CLWaterTemperatureEstimator waterTempEst](self, "waterTempEst");
    v22 = v21;
    -[CLWaterTemperatureEstimator waterTempUncertainty](self, "waterTempUncertainty");
    v27 = 134218752;
    v28 = v19;
    v29 = 2048;
    v30 = v20;
    v31 = 2048;
    v32 = v22;
    v33 = 2048;
    v34 = v23;
    LODWORD(v26) = 42;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v18, 2, "tdot estimator, temp, %f, tdot, %f, est temp, %f, est uncertainty, %f", COERCE_DOUBLE(&v27), v26);
    v25 = (uint8_t *)v24;
    sub_100512490("Generic", 1, 0, 2, "-[CLWaterTemperatureEstimator updateWithTDot:andTempMeasurement:]", "%s\n", v24);
    if (v25 != buf)
      free(v25);
  }
}

- (void)getEnclosureMaterial
{
  int v3;
  NSObject *v4;
  CFAbsoluteTime Current;
  uint64_t v6;
  uint64_t enclosureMaterial;
  const char *v8;
  uint8_t *v9;
  uint8_t buf[616];
  CFAbsoluteTime v11;
  uint64_t v12;
  char v13;
  _DWORD v14[2];

  v3 = MGGetSInt32Answer(CFSTR("AtmPEO/j+Pdr8+WKxv4Aaw"), 0);
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_10219C710);
  v4 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "device enclosure material is %u", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10219C710);
    v14[0] = 67109120;
    v14[1] = v3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "device enclosure material is %u", v14);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLWaterTemperatureEstimator getEnclosureMaterial]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  if (v3)
    self->_enclosureMaterial = v3;
  if (self->_logEnclosureMaterial)
  {
    sub_1015EB864(buf);
    sub_10160472C((uint64_t)buf);
    Current = CFAbsoluteTimeGetCurrent();
    v13 |= 1u;
    v11 = Current;
    v6 = v12;
    enclosureMaterial = self->_enclosureMaterial;
    *(_BYTE *)(v12 + 24) |= 1u;
    *(_QWORD *)(v6 + 8) = enclosureMaterial;
    if (qword_1023118A8 != -1)
      dispatch_once(&qword_1023118A8, &stru_10219C730);
    if (qword_1023118B0)
      sub_101888B64(qword_1023118B0, (uint64_t)buf);
    sub_1015EE304((PB::Base *)buf);
  }
}

- (void)setWaterTempCoefficients
{
  int v3;
  uint64_t *v4;
  uint64_t v5;
  NSObject *v6;
  CFAbsoluteTime Current;
  uint64_t v8;
  double v9;
  uint8_t *v10;
  uint8_t *v11;
  NSObject *v12;
  CFAbsoluteTime v13;
  NSObject *v14;
  float *end;
  float *begin;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double binWidth;
  float *v23;
  float *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  const char *v31;
  uint8_t *v32;
  uint64_t v33;
  double v34;
  uint8_t *v35;
  uint64_t v36;
  _BYTE v37[32];
  __int16 v38;
  double v39;
  __int16 v40;
  int v41;
  __int16 v42;
  double v43;
  uint8_t buf[4];
  _BYTE v45[14];
  __int16 v46;
  double v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  __int16 v54;
  int v55;
  __int16 v56;
  double v57;

  v3 = sub_1001AA9A8();
  *(_DWORD *)buf = self->_enclosureMaterial;
  *(_DWORD *)v45 = v3;
  v4 = sub_101068B34(qword_10230C2C8, (int *)buf);
  if (v4)
  {
    v5 = v4[3];
    if (&self->_tempCoefficients != (CLWaterTemperatureCoefficients *)v5)
    {
      sub_1002A3054((char *)&self->_tempCoefficients, *(char **)v5, *(_QWORD *)(v5 + 8), (uint64_t)(*(_QWORD *)(v5 + 8) - *(_QWORD *)v5) >> 2);
      sub_1002A3054((char *)&self->_tempCoefficients.tempUncertainty, *(char **)(v5 + 24), *(_QWORD *)(v5 + 32), (uint64_t)(*(_QWORD *)(v5 + 32) - *(_QWORD *)(v5 + 24)) >> 2);
    }
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10219C710);
    v6 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      Current = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134217984;
      *(CFAbsoluteTime *)v45 = Current;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "temperature coefficients updated,timestamp,%f", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10219C710);
      v8 = qword_10229FE88;
      *(_DWORD *)v37 = 134217984;
      *(_QWORD *)&v37[4] = CFAbsoluteTimeGetCurrent();
      v9 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 0, "temperature coefficients updated,timestamp,%f", COERCE_DOUBLE(v37));
      v11 = v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLWaterTemperatureEstimator setWaterTempCoefficients]", "%s\n", v9);
LABEL_31:
      if (v11 != buf)
        free(v11);
    }
  }
  else
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10219C710);
    v12 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_FAULT))
    {
      v13 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134217984;
      *(CFAbsoluteTime *)v45 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "temperature coefficients not found,using defaults for replay,timestamp,%f", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10219C710);
      v33 = qword_10229FE88;
      *(_DWORD *)v37 = 134217984;
      *(_QWORD *)&v37[4] = CFAbsoluteTimeGetCurrent();
      v34 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v33, 17, "temperature coefficients not found,using defaults for replay,timestamp,%f", COERCE_DOUBLE(v37));
      v11 = v35;
      sub_100512490("Generic", 1, 0, 0, "-[CLWaterTemperatureEstimator setWaterTempCoefficients]", "%s\n", v34);
      goto LABEL_31;
    }
  }
  self->_numTErrorBins = (unint64_t)((char *)self->_tempCoefficients.deltaTemp.__end_
                                          - (char *)self->_tempCoefficients.deltaTemp.__begin_) >> 2;
  if (-[CLWaterTemperatureEstimator coefficientsUpdated](self, "coefficientsUpdated"))
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10219C710);
    v14 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      begin = self->_tempCoefficients.deltaTemp.__begin_;
      end = self->_tempCoefficients.deltaTemp.__end_;
      v17 = end - begin;
      v18 = *begin;
      v19 = *(end - 1);
      v20 = *(float *)qword_10230C250;
      v21 = *(float *)(qword_10230C258 - 4);
      LODWORD(end) = self->_enclosureMaterial;
      LODWORD(begin) = self->_numTDotBins;
      binWidth = self->_binWidth;
      *(_DWORD *)buf = 67110912;
      *(_DWORD *)v45 = (_DWORD)end;
      *(_WORD *)&v45[4] = 2048;
      *(_QWORD *)&v45[6] = v17;
      v46 = 2048;
      v47 = v18;
      v48 = 2048;
      v49 = v19;
      v50 = 2048;
      v51 = v20;
      v52 = 2048;
      v53 = v21;
      v54 = 1024;
      v55 = (int)begin;
      v56 = 2048;
      v57 = binWidth;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "enclosure details,material,%u,deltaTempCount,%zu,firstDeltaTemp,%f,lastDeltaTemp,%f,firstTDot,%f,lastTDot,%f,numBins,%d,binWidth,%f", buf, 0x4Au);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10219C710);
      v24 = self->_tempCoefficients.deltaTemp.__begin_;
      v23 = self->_tempCoefficients.deltaTemp.__end_;
      v25 = v23 - v24;
      v26 = *v24;
      v27 = *(v23 - 1);
      v28 = *(float *)qword_10230C250;
      v29 = *(float *)(qword_10230C258 - 4);
      LODWORD(v23) = self->_enclosureMaterial;
      LODWORD(v24) = self->_numTDotBins;
      v30 = self->_binWidth;
      *(_DWORD *)v37 = 67110912;
      *(_DWORD *)&v37[4] = (_DWORD)v23;
      *(_WORD *)&v37[8] = 2048;
      *(_QWORD *)&v37[10] = v25;
      *(_WORD *)&v37[18] = 2048;
      *(double *)&v37[20] = v26;
      *(_WORD *)&v37[28] = 2048;
      *(_WORD *)&v37[30] = LOWORD(v27);
      v38 = 2048;
      v39 = v29;
      v40 = 1024;
      v41 = (int)v24;
      v42 = 2048;
      v43 = v30;
      LODWORD(v36) = 74;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "enclosure details,material,%u,deltaTempCount,%zu,firstDeltaTemp,%f,lastDeltaTemp,%f,firstTDot,%f,lastTDot,%f,numBins,%d,binWidth,%f", v37, v36, *(double *)v37, *(double *)&v37[8], *(double *)&v37[16], *(double *)&v37[24], *(_QWORD *)&v27 >> 16, v28);
      v32 = (uint8_t *)v31;
      sub_100512490("Generic", 1, 0, 2, "-[CLWaterTemperatureEstimator setWaterTempCoefficients]", "%s\n", v31);
      if (v32 != buf)
        free(v32);
    }
  }
}

- (BOOL)coefficientsUpdated
{
  return self->_numTErrorBins == self->_numTDotBins;
}

- (float)waterTempEst
{
  return self->_waterTempEst;
}

- (void)setWaterTempEst:(float)a3
{
  self->_waterTempEst = a3;
}

- (float)waterTempUncertainty
{
  return self->_waterTempUncertainty;
}

- (void)setWaterTempUncertainty:(float)a3
{
  self->_waterTempUncertainty = a3;
}

- (void).cxx_destruct
{
  float *begin;
  float *v4;

  begin = self->_tempCoefficients.tempUncertainty.__begin_;
  if (begin)
  {
    self->_tempCoefficients.tempUncertainty.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_tempCoefficients.deltaTemp.__begin_;
  if (v4)
  {
    self->_tempCoefficients.deltaTemp.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end

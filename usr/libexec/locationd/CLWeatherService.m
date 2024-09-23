@implementation CLWeatherService

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
  if (qword_102308130 != -1)
    dispatch_once(&qword_102308130, &stru_102183CA0);
  return (id)qword_102308128;
}

- (CLWeatherService)init
{
  CLWeatherService *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLWeatherService;
  v2 = -[CLWeatherService initWithInboundProtocol:outboundProtocol:](&v4, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLWeatherServiceProtocol, &OBJC_PROTOCOL___CLWeatherServiceClientProtocol);
  if (v2)
    -[CLWeatherService setClients:](v2, "setClients:", objc_opt_new(NSMutableSet));
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLWeatherService;
  -[CLWeatherService dealloc](&v3, "dealloc");
}

+ (BOOL)isSupported
{
  return 0;
}

- (void)registerForWeatherUpdates:(id)a3
{
  -[NSMutableSet addObject:](-[CLWeatherService clients](self, "clients"), "addObject:", a3);
}

- (void)unregisterForWeatherUpdates:(id)a3
{
  -[NSMutableSet removeObject:](-[CLWeatherService clients](self, "clients"), "removeObject:", a3);
}

- (void)weatherForecastUpdated:(id)a3 airQualityConditions:(id)a4 hourlyForecasts:(id)a5 dailyForecasts:(id)a6 location:(id)a7
{
  -[CLWeatherService localLocationForecastUpdatedForConditions:](self, "localLocationForecastUpdatedForConditions:", a3, a4, a5, a6, a7);
}

- (void)localLocationForecastUpdatedForConditions:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  float v9;
  float v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t *v13;
  double v14;
  NSObject *v15;
  uint8_t *v16;
  id v17;
  const __CFString *v18;
  id v19;
  id v20;
  int v21;
  int v22;
  id v23;
  int v24;
  int v25;
  CLWeatherServiceData *v26;
  double v27;
  double v28;
  double v29;
  NSMutableSet *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *i;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  float v38;
  double v39;
  NSString *v40;
  float v41;
  double v42;
  float v43;
  uint64_t v44;
  double v45;
  double v46;
  float v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  float v52;
  double v53;
  NSString *v54;
  float v55;
  double v56;
  float v57;
  const char *v58;
  uint8_t *v59;
  double v60;
  uint8_t *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  int v66;
  void *v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  double v71;
  __int16 v72;
  NSString *v73;
  __int16 v74;
  double v75;
  __int16 v76;
  double v77;
  uint8_t v78[128];
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  double v84;
  __int16 v85;
  NSString *v86;
  __int16 v87;
  double v88;
  __int16 v89;
  double v90;

  objc_msgSend(-[CLWeatherService universe](self, "universe"), "silo");
  if (!a3)
  {
    if (qword_10229FC70 != -1)
      dispatch_once(&qword_10229FC70, &stru_102183CC0);
    v12 = qword_10229FC78;
    if (os_log_type_enabled((os_log_t)qword_10229FC78, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "received weather update with nil weather conditions", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FC70 != -1)
      dispatch_once(&qword_10229FC70, &stru_102183CC0);
    LOWORD(v66) = 0;
    v14 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC78, 16, "received weather update with nil weather conditions", &v66, 2);
    goto LABEL_22;
  }
  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CLWeatherDate"));
  if (!v5)
  {
    if (qword_10229FC70 != -1)
      dispatch_once(&qword_10229FC70, &stru_102183CC0);
    v15 = qword_10229FC78;
    if (os_log_type_enabled((os_log_t)qword_10229FC78, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "received weather update with nil date", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FC70 != -1)
      dispatch_once(&qword_10229FC70, &stru_102183CC0);
    LOWORD(v66) = 0;
    v14 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC78, 16, "received weather update with nil date", &v66, 2);
LABEL_22:
    v16 = v13;
    sub_100512490("Generic", 1, 0, 0, "-[CLWeatherService localLocationForecastUpdatedForConditions:]", "%s\n", v14);
LABEL_23:
    if (v16 != buf)
      free(v16);
    return;
  }
  v6 = v5;
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CLWeatherPressurePascal"));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "floatValue");
    v10 = v9;
    if (sub_10009ED0C())
    {
      v11 = sub_10009ED0C();
      sub_10134D7D4(v11, v10);
    }
  }
  else
  {
    v10 = -1.0;
  }
  v17 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CLWeatherPrecipitationType"));
  if (v17)
    v18 = +[NSString stringWithString:](NSString, "stringWithString:", v17);
  else
    v18 = CFSTR("Null");
  v19 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CLWeatherTemperatureCelsius"));
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "floatValue");
    v22 = v21;
  }
  else
  {
    v22 = -8388609;
  }
  v23 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CLWeatherFeelsLikeTemperatureCelsius"));
  if (v23)
  {
    objc_msgSend(v23, "floatValue");
    v25 = v24;
LABEL_34:
    v26 = objc_opt_new(CLWeatherServiceData);
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    -[CLWeatherServiceData setTimestamp:](v26, "setTimestamp:");
    *(float *)&v27 = v10;
    -[CLWeatherServiceData setWeatherPressure:](v26, "setWeatherPressure:", v27);
    -[CLWeatherServiceData setPrecipitationType:](v26, "setPrecipitationType:", +[NSString stringWithString:](NSString, "stringWithString:", v18));
    LODWORD(v28) = v22;
    -[CLWeatherServiceData setTemperature:](v26, "setTemperature:", v28);
    LODWORD(v29) = v25;
    -[CLWeatherServiceData setFeelsLikeTemperature:](v26, "setFeelsLikeTemperature:", v29);
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v30 = -[CLWeatherService clients](self, "clients");
    v31 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v32; i = (char *)i + 1)
        {
          if (*(_QWORD *)v63 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i), "didUpdateWeather:", v26);
        }
        v32 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
      }
      while (v32);
    }
    if (qword_10229FC70 != -1)
      dispatch_once(&qword_10229FC70, &stru_102183CC0);
    v35 = qword_10229FC78;
    if (os_log_type_enabled((os_log_t)qword_10229FC78, OS_LOG_TYPE_INFO))
    {
      -[CLWeatherServiceData timestamp](v26, "timestamp");
      v37 = v36;
      -[CLWeatherServiceData weatherPressure](v26, "weatherPressure");
      v39 = v38;
      v40 = -[CLWeatherServiceData precipitationType](v26, "precipitationType");
      -[CLWeatherServiceData temperature](v26, "temperature");
      v42 = v41;
      -[CLWeatherServiceData feelsLikeTemperature](v26, "feelsLikeTemperature");
      *(_DWORD *)buf = 138544642;
      v80 = v6;
      v81 = 2050;
      v82 = v37;
      v83 = 2048;
      v84 = v39;
      v85 = 2112;
      v86 = v40;
      v87 = 2048;
      v88 = v42;
      v89 = 2048;
      v90 = v43;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Notified weather update for local location, date, %{public}@, timestamp, %{public}f, pressure(Pa), %.8f, precipitationType, %@, temperature(C), %f, feelsLikeTemperature(C), %f", buf, 0x3Eu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FC70 != -1)
        dispatch_once(&qword_10229FC70, &stru_102183CC0);
      v49 = qword_10229FC78;
      -[CLWeatherServiceData timestamp](v26, "timestamp");
      v51 = v50;
      -[CLWeatherServiceData weatherPressure](v26, "weatherPressure");
      v53 = v52;
      v54 = -[CLWeatherServiceData precipitationType](v26, "precipitationType");
      -[CLWeatherServiceData temperature](v26, "temperature");
      v56 = v55;
      -[CLWeatherServiceData feelsLikeTemperature](v26, "feelsLikeTemperature");
      v66 = 138544642;
      v67 = v6;
      v68 = 2050;
      v69 = v51;
      v70 = 2048;
      v71 = v53;
      v72 = 2112;
      v73 = v54;
      v74 = 2048;
      v75 = v56;
      v76 = 2048;
      v77 = v57;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v49, 1, "Notified weather update for local location, date, %{public}@, timestamp, %{public}f, pressure(Pa), %.8f, precipitationType, %@, temperature(C), %f, feelsLikeTemperature(C), %f", &v66, 62);
      v59 = (uint8_t *)v58;
      sub_100512490("Generic", 1, 0, 2, "-[CLWeatherService localLocationForecastUpdatedForConditions:]", "%s\n", v58);
      if (v59 != buf)
        free(v59);
    }
    if (v8)
    {
      if (sub_100B45B9C())
      {
        v44 = sub_100B45B9C();
        -[CLWeatherServiceData timestamp](v26, "timestamp");
        v46 = v45;
        -[CLWeatherServiceData weatherPressure](v26, "weatherPressure");
        sub_100B45E58(v44, v46, v47);
      }
    }
    return;
  }
  v25 = -8388609;
  if (v8 || v17 || v20)
    goto LABEL_34;
  if (qword_10229FC70 != -1)
    dispatch_once(&qword_10229FC70, &stru_102183CC0);
  v48 = qword_10229FC78;
  if (os_log_type_enabled((os_log_t)qword_10229FC78, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "received weather update with all nil fields of interest", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FC70 != -1)
      dispatch_once(&qword_10229FC70, &stru_102183CC0);
    LOWORD(v66) = 0;
    v60 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC78, 1, "received weather update with all nil fields of interest", &v66, 2);
    v16 = v61;
    sub_100512490("Generic", 1, 0, 2, "-[CLWeatherService localLocationForecastUpdatedForConditions:]", "%s\n", v60);
    goto LABEL_23;
  }
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end

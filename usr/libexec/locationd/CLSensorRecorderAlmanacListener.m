@implementation CLSensorRecorderAlmanacListener

- (void)sensorWriterWillStartMonitoring:(id)a3
{
  unsigned int v4;

  if (self->_notifier)
  {
    v4 = 100;
    if (-[CLSensorRecorderAlmanacListener subscriptionType](self, "subscriptionType", a3) == 2)
    {
      if (sub_100762E90())
        v4 = 100;
      else
        v4 = 25;
    }
    sub_101248F0C((uint64_t)self->_notifier, -[CLSensorRecorderAlmanacListener subscriptionType](self, "subscriptionType"), v4);
  }
}

- (id)classNameForSensorIdentifier:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", off_1022FDF98[0]()) & 1) != 0)
    return CFSTR("CMAccelerometerDataArray");
  if ((objc_msgSend(a3, "isEqualToString:", off_1022FDFA0[0]()) & 1) != 0)
    return CFSTR("CMGyroDataArray");
  if (objc_msgSend(a3, "isEqualToString:", off_1022FDFA8[0]()))
    return CFSTR("CMAmbientPressureDataArray");
  return 0;
}

- (void)sensorWriter:(id)a3 didReceiveUpdateToConfigurationRequests:(id)a4
{
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  id v18;
  const char *v19;
  uint8_t *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  int v27;
  id v28;
  uint8_t buf[4];
  id v30;

  if (qword_10229FF20 != -1)
    dispatch_once(&qword_10229FF20, &stru_1021AA7F8);
  v6 = qword_10229FF28;
  if (os_log_type_enabled((os_log_t)qword_10229FF28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Dynamic Config] Update to Configuration Requests: %@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF20 != -1)
      dispatch_once(&qword_10229FF20, &stru_1021AA7F8);
    v27 = 138412290;
    v28 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF28, 0, "[Dynamic Config] Update to Configuration Requests: %@", &v27, 12);
    v20 = (uint8_t *)v19;
    sub_100512490("Generic", 1, 0, 2, "-[CLSensorRecorderAlmanacListener sensorWriter:didReceiveUpdateToConfigurationRequests:]", "%s\n", v19);
    if (v20 != buf)
      free(v20);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(a4);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v10);
        v12 = sub_100EFA98C();
        v13 = sub_100EFC074(v12, v11);
        if (v13 != 100)
        {
          v14 = v13;
          if (qword_10229FF20 != -1)
            dispatch_once(&qword_10229FF20, &stru_1021AA7F8);
          v15 = qword_10229FF28;
          if (os_log_type_enabled((os_log_t)qword_10229FF28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67240192;
            LODWORD(v30) = v14;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Dynamic Config] Error on config insertion: %{public}d", buf, 8u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FF20 != -1)
              dispatch_once(&qword_10229FF20, &stru_1021AA7F8);
            v27 = 67240192;
            LODWORD(v28) = v14;
            LODWORD(v21) = 8;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF28, 0, "[Dynamic Config] Error on config insertion: %{public}d", &v27, v21);
            v17 = (uint8_t *)v16;
            sub_100512490("Generic", 1, 0, 2, "-[CLSensorRecorderAlmanacListener sensorWriter:didReceiveUpdateToConfigurationRequests:]", "%s\n", v16);
            if (v17 != buf)
              free(v17);
          }
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v18 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v8 = v18;
    }
    while (v18);
  }
}

- (void)notifier
{
  return self->_notifier;
}

- (void)setNotifier:(void *)a3
{
  self->_notifier = a3;
}

- (int)subscriptionType
{
  return self->_subscriptionType;
}

- (void)setSubscriptionType:(int)a3
{
  self->_subscriptionType = a3;
}

@end

@implementation CLNanoRegistry

- (BOOL)isWatchPaired
{
  unsigned int v2;
  NSObject *v3;
  const char *v5;
  uint8_t *v6;
  _DWORD v7[4];
  uint8_t buf[4];
  unsigned int v9;

  v2 = -[NRPairedDeviceRegistry isPaired](+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"), "isPaired");
  if (qword_1022A0020 != -1)
    dispatch_once(&qword_1022A0020, &stru_102174950);
  v3 = qword_1022A0028;
  if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67174657;
    v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLNR,isWatchPaired,%{private}d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102174950);
    v7[0] = 67174657;
    v7[1] = v2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 0, "CLNR,isWatchPaired,%{private}d", v7, 8);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLNanoRegistry isWatchPaired]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  return v2;
}

- (BOOL)isAFire6OrOlderWatchPaired
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  char *v12;
  uint64_t v13;
  signed int v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  uint8_t *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  const char *v24;
  uint8_t *v25;
  const char *v26;
  uint8_t *v27;
  const char *v28;
  uint8_t *v29;
  id v30;
  NSObject *v31;
  char v32;
  const char *v34;
  uint8_t *v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  int v42;
  id v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  _BYTE v54[128];

  v2 = -[NRPairedDeviceRegistry getPairedDevices](+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"), "getPairedDevices");
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
  if (!v3)
  {
    HIDWORD(v36) = 0;
    goto LABEL_65;
  }
  v4 = v3;
  HIDWORD(v36) = 0;
  v5 = *(_QWORD *)v39;
  v6 = NRDevicePropertyProductType;
  v37 = v2;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v39 != v5)
        objc_enumerationMutation(v2);
      v8 = objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v7), "valueForProperty:", v6);
      if (qword_1022A0020 != -1)
        dispatch_once(&qword_1022A0020, &stru_102174950);
      v9 = qword_1022A0028;
      if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138477827;
        v49 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "CLNR,pairedDevice,productType,%{private}@", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0020 != -1)
          dispatch_once(&qword_1022A0020, &stru_102174950);
        v42 = 138477827;
        v43 = v8;
        LODWORD(v36) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 1, "CLNR,pairedDevice,productType,%{private}@", &v42, v36);
        v25 = (uint8_t *)v24;
        sub_100512490("Generic", 1, 0, 2, "-[CLNanoRegistry isAFire6OrOlderWatchPaired]", "%s\n", v24);
        if (v25 != buf)
          free(v25);
      }
      v10 = objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(","));
      if ((unint64_t)objc_msgSend(v10, "count") >= 2)
      {
        v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        if (objc_msgSend(v11, "containsString:", CFSTR("Watch")))
        {
          v12 = (char *)objc_msgSend(v11, "rangeOfString:", CFSTR("Watch"));
          if (v13)
          {
            v14 = objc_msgSend(objc_msgSend(v11, "substringFromIndex:", &v12[v13]), "intValue");
            v15 = objc_msgSend(objc_msgSend(v10, "objectAtIndexedSubscript:", 1), "intValue");
            if (qword_1022A0020 != -1)
              dispatch_once(&qword_1022A0020, &stru_102174950);
            v16 = v14;
            v17 = qword_1022A0028;
            if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138478339;
              v49 = v8;
              v50 = 2049;
              v51 = v16;
              v52 = 2049;
              v53 = v15;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "CLNR,pairedDevice,%{private}@,majorVersionInteger,%{private}ld,minorVersionInteger,%{private}ld", buf, 0x20u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1022A0020 != -1)
                dispatch_once(&qword_1022A0020, &stru_102174950);
              v42 = 138478339;
              v43 = v8;
              v44 = 2049;
              v45 = v16;
              v46 = 2049;
              v47 = v15;
              LODWORD(v36) = 32;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 1, "CLNR,pairedDevice,%{private}@,majorVersionInteger,%{private}ld,minorVersionInteger,%{private}ld", &v42, v36);
              v27 = (uint8_t *)v26;
              sub_100512490("Generic", 1, 0, 2, "-[CLNanoRegistry isAFire6OrOlderWatchPaired]", "%s\n", v26);
              if (v27 != buf)
                free(v27);
            }
            if ((int)v16 > 6)
            {
              v2 = v37;
              goto LABEL_48;
            }
            if ((_DWORD)v16 == 6 && v15 >= 10)
            {
              if (qword_1022A0020 != -1)
                dispatch_once(&qword_1022A0020, &stru_102174950);
              v2 = v37;
              v18 = qword_1022A0028;
              if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138477827;
                v49 = v8;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "CLNR,pairedDevice,Fire7OrNewer,%{private}@", buf, 0xCu);
              }
              if (sub_1001BFF7C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1022A0020 != -1)
                  dispatch_once(&qword_1022A0020, &stru_102174950);
                v42 = 138477827;
                v43 = v8;
                LODWORD(v36) = 12;
                _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 1, "CLNR,pairedDevice,Fire7OrNewer,%{private}@", &v42, v36);
                v20 = (uint8_t *)v19;
                sub_100512490("Generic", 1, 0, 2, "-[CLNanoRegistry isAFire6OrOlderWatchPaired]", "%s\n", v19);
LABEL_39:
                if (v20 != buf)
                  free(v20);
              }
            }
            else
            {
              if (qword_1022A0020 != -1)
                dispatch_once(&qword_1022A0020, &stru_102174950);
              v2 = v37;
              v23 = qword_1022A0028;
              if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138477827;
                v49 = v8;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "CLNR,pairedDevice,Fire6OrOlder,%{private}@", buf, 0xCu);
              }
              if (sub_1001BFF7C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1022A0020 != -1)
                  dispatch_once(&qword_1022A0020, &stru_102174950);
                v42 = 138477827;
                v43 = v8;
                LODWORD(v36) = 12;
                _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 1, "CLNR,pairedDevice,Fire6OrOlder,%{private}@", &v42, v36);
                v29 = (uint8_t *)v28;
                sub_100512490("Generic", 1, 0, 2, "-[CLNanoRegistry isAFire6OrOlderWatchPaired]", "%s\n", v28);
                if (v29 != buf)
                  free(v29);
              }
              HIDWORD(v36) = 1;
            }
          }
          else
          {
            if (qword_1022A0020 != -1)
              dispatch_once(&qword_1022A0020, &stru_102174950);
            v21 = qword_1022A0028;
            if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138477827;
              v49 = v11;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "CLNR,could not compute cropped major version component,%{private}@,", buf, 0xCu);
            }
            if (sub_1001BFF7C(115, 0))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1022A0020 != -1)
                dispatch_once(&qword_1022A0020, &stru_102174950);
              v42 = 138477827;
              v43 = v11;
              LODWORD(v36) = 12;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 16, "CLNR,could not compute cropped major version component,%{private}@,", &v42, v36);
              v20 = (uint8_t *)v22;
              sub_100512490("Generic", 1, 0, 0, "-[CLNanoRegistry isAFire6OrOlderWatchPaired]", "%s\n", v22);
              goto LABEL_39;
            }
          }
        }
      }
LABEL_48:
      v7 = (char *)v7 + 1;
    }
    while (v4 != v7);
    v30 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
    v4 = v30;
  }
  while (v30);
LABEL_65:
  if (qword_1022A0020 != -1)
    dispatch_once(&qword_1022A0020, &stru_102174950);
  v31 = qword_1022A0028;
  v32 = BYTE4(v36);
  if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67174657;
    LODWORD(v49) = BYTE4(v36) & 1;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "CLNR,isAFire6OrOlderWatchPaired,%{private}d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102174950);
    v42 = 67174657;
    LODWORD(v43) = BYTE4(v36) & 1;
    LODWORD(v36) = 8;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 0, "CLNR,isAFire6OrOlderWatchPaired,%{private}d", &v42, v36);
    v35 = (uint8_t *)v34;
    sub_100512490("Generic", 1, 0, 2, "-[CLNanoRegistry isAFire6OrOlderWatchPaired]", "%s\n", v34);
    if (v35 != buf)
      free(v35);
  }
  return v32 & 1;
}

@end

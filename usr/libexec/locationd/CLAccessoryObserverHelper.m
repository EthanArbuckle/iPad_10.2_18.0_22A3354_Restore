@implementation CLAccessoryObserverHelper

+ (BOOL)isString:(id)a3 prefixedBy:(id)a4
{
  BOOL result;
  uint64_t v5;
  BOOL v6;

  result = 0;
  if (a3 && a4)
  {
    if (objc_msgSend(a3, "rangeOfString:options:", a4, 9))
      v6 = 1;
    else
      v6 = v5 == 0;
    return !v6;
  }
  return result;
}

+ (BOOL)isDenyListAccessory:(id)a3 name:(id)a4 model:(id)a5 serialNumber:(id)a6 firmware:(id)a7 hardwareRevision:(id)a8
{
  id v13;
  _BOOL4 v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint8_t *v20;
  _QWORD v22[2];
  uint8_t buf[1640];

  v13 = a3;
  if (a3)
    v13 = objc_msgSend(a3, "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  if (a4)
    a4 = objc_msgSend(a4, "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  if (a5)
    a5 = objc_msgSend(a5, "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  if (a6)
    a6 = objc_msgSend(a6, "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  if (a7)
    a7 = objc_msgSend(a7, "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  if (a8)
    a8 = objc_msgSend(a8, "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  if (v13 && a5 && a7)
  {
    if (!objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("HARMAN"))
      && !objc_msgSend(a5, "caseInsensitiveCompare:", CFSTR("MIB2"))
      && (+[CLAccessoryObserverHelper isString:prefixedBy:](CLAccessoryObserverHelper, "isString:prefixedBy:", a7, CFSTR("CLU4_MMX2_VW"))|| +[CLAccessoryObserverHelper isString:prefixedBy:](CLAccessoryObserverHelper, "isString:prefixedBy:", a7, CFSTR("CLU4_MMX2_SK"))|| +[CLAccessoryObserverHelper isString:prefixedBy:](CLAccessoryObserverHelper, "isString:prefixedBy:", a7, CFSTR("CLU4_MMX2_SE"))))
    {
      if (qword_1022A0000 != -1)
        dispatch_once(&qword_1022A0000, &stru_102149B50);
      v18 = qword_1022A0008;
      if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Rejecting accessory on deny list: HARMAN", buf, 2u);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_63;
      bzero(buf, 0x65CuLL);
      if (qword_1022A0000 != -1)
        dispatch_once(&qword_1022A0000, &stru_102149B50);
      LOWORD(v22[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0008, 2, "Rejecting accessory on deny list: HARMAN", v22, 2, v22[0]);
LABEL_79:
      v20 = (uint8_t *)v16;
      sub_100512490("Generic", 1, 0, 2, "+[CLAccessoryObserverHelper isDenyListAccessory:name:model:serialNumber:firmware:hardwareRevision:]", "%s\n", v16);
      if (v20 != buf)
        free(v20);
LABEL_63:
      LOBYTE(v14) = 1;
      return v14;
    }
    if (!objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("VOLKSWAGEN AG"))
      && !objc_msgSend(a5, "caseInsensitiveCompare:", CFSTR("MIB STD"))
      && !objc_msgSend(a7, "caseInsensitiveCompare:", CFSTR("1.0.0"))
      && a6
      && !objc_msgSend(a6, "caseInsensitiveCompare:", CFSTR("EP.2015.1")))
    {
      if (qword_1022A0000 != -1)
        dispatch_once(&qword_1022A0000, &stru_102149B50);
      v19 = qword_1022A0008;
      if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Rejecting accessory on deny list: Volkswagen AG, 1.0.0", buf, 2u);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_63;
      bzero(buf, 0x65CuLL);
      if (qword_1022A0000 != -1)
        dispatch_once(&qword_1022A0000, &stru_102149B50);
      LOWORD(v22[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0008, 2, "Rejecting accessory on deny list: Volkswagen AG, 1.0.0", v22, 2, v22[0]);
      goto LABEL_79;
    }
    if ((!objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("VOLKSWAGEN AG"))
       || !objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("SKODA AUTO a.s."))
       || !objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("SEAT S.A.")))
      && !objc_msgSend(a5, "caseInsensitiveCompare:", CFSTR("MIB STD"))
      && (!objc_msgSend(a7, "caseInsensitiveCompare:", CFSTR("2.0.0"))
       || +[CLAccessoryObserverHelper isString:prefixedBy:](CLAccessoryObserverHelper, "isString:prefixedBy:", a7, CFSTR("035"))|| +[CLAccessoryObserverHelper isString:prefixedBy:](CLAccessoryObserverHelper, "isString:prefixedBy:", a7, CFSTR("X35"))))
    {
      if (qword_1022A0000 != -1)
        dispatch_once(&qword_1022A0000, &stru_102149B50);
      v17 = qword_1022A0008;
      if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Rejecting accessory on deny list: Volkswagen AG, 2.0.0", buf, 2u);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_63;
      bzero(buf, 0x65CuLL);
      if (qword_1022A0000 != -1)
        dispatch_once(&qword_1022A0000, &stru_102149B50);
      LOWORD(v22[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0008, 2, "Rejecting accessory on deny list: Volkswagen AG, 2.0.0", v22, 2, v22[0]);
      goto LABEL_79;
    }
  }
  LOBYTE(v14) = 0;
  if (v13 && a4 && a5 && a7 && a8)
  {
    if (!objc_msgSend(a4, "caseInsensitiveCompare:", CFSTR("BENTLEY"))
      && (!objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("HARMAN"))
       || !objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("AISIN")))
      && !objc_msgSend(a5, "caseInsensitiveCompare:", CFSTR("MIB2")))
    {
      v14 = +[CLAccessoryObserverHelper isString:prefixedBy:](CLAccessoryObserverHelper, "isString:prefixedBy:", a7, CFSTR("CLU5_"));
      if (!v14)
        return v14;
      if (!objc_msgSend(a8, "caseInsensitiveCompare:", CFSTR("1.0.0")))
      {
        if (qword_1022A0000 != -1)
          dispatch_once(&qword_1022A0000, &stru_102149B50);
        v15 = qword_1022A0008;
        if (os_log_type_enabled((os_log_t)qword_1022A0008, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Rejecting accessory on deny list: BENTLEY", buf, 2u);
        }
        if (!sub_1001BFF7C(115, 2))
          goto LABEL_63;
        bzero(buf, 0x65CuLL);
        if (qword_1022A0000 != -1)
          dispatch_once(&qword_1022A0000, &stru_102149B50);
        LOWORD(v22[0]) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0008, 2, "Rejecting accessory on deny list: BENTLEY", v22, 2, v22[0]);
        goto LABEL_79;
      }
    }
    LOBYTE(v14) = 0;
  }
  return v14;
}

@end

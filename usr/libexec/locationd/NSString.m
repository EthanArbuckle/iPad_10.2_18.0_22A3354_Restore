@implementation NSString

+ (char)toHex:(char)a3
{
  char v3;

  if (a3 <= 9)
    v3 = 48;
  else
    v3 = 87;
  return v3 + a3;
}

+ (id)convertToHexString:(int64_t)a3
{
  id v3;
  char *v4;
  char *v5;
  id i;
  char v7;
  NSObject *v8;
  const char *v10;
  uint8_t *v11;
  int64_t v12;
  int v13;
  id v14;
  uint8_t buf[4];
  id v16;

  v12 = a3;
  v3 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v12, 4);
  v4 = (char *)objc_msgSend(v3, "length");
  v5 = (char *)objc_msgSend(v3, "bytes");
  for (i = objc_alloc_init((Class)NSMutableString); v4; --v4)
  {
    objc_msgSend(i, "appendFormat:", CFSTR("%c"), +[NSString toHex:](NSString, "toHex:", *v5 >> 4));
    v7 = *v5++;
    objc_msgSend(i, "appendFormat:", CFSTR("%c"), +[NSString toHex:](NSString, "toHex:", v7 & 0xF));
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = i;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#hawkeye #firmwareUpdate - convertToHexString: %@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v13 = 138412290;
    v14 = i;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0038, 16, "#hawkeye #firmwareUpdate - convertToHexString: %@", &v13, 12);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 0, "+[NSString(IntegerToLowerCaseHexString) convertToHexString:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  return objc_msgSend(objc_alloc((Class)NSString), "initWithString:", i);
}

@end

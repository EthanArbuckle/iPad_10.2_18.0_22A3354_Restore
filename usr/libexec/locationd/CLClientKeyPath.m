@implementation CLClientKeyPath

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;

  v4 = (char *)objc_alloc((Class)objc_opt_class(self, a2, a3));
  strcpy(v4 + 8, self->_buffer);
  return v4;
}

- (Name)clientName
{
  void *v1;
  void *v2;
  int v4;
  id v5;
  unsigned __int8 *v6;
  int v7;
  id v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  Name *result;
  std::string v16;
  std::string v17;
  uint64_t __str;
  __int16 __str_8;
  const char *__str_10;
  __int16 __str_18;
  _BYTE __str_20[12];
  char v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  void *__p;
  char v33;

  v2 = v1;
  *(_DWORD *)((char *)&retstr[2].fUserName.__r_.__value_.var0.var1.__size_ + 7) = 0;
  *(_OWORD *)&retstr[1].fUserName.__r_.var0 = 0u;
  *(_OWORD *)retstr[2].fUserName.__r_.__value_.var0.var0.__data_ = 0u;
  *(_OWORD *)&retstr->fUserName.var0 = 0u;
  *(_OWORD *)&retstr[1].fUserName.__r_.__value_.var0.var1.__size_ = 0u;
  *(_OWORD *)retstr->fUserName.__r_.__value_.var0.var0.__data_ = 0u;
  *((_OWORD *)&retstr->fUserName.__r_.__value_.var0.var1 + 1) = 0u;
  *(_OWORD *)&retstr[2].fUserName.__r_.var0 = 0u;
  *(_OWORD *)retstr[3].fUserName.__r_.__value_.var0.var0.__data_ = 0u;
  *((_OWORD *)&retstr[3].fUserName.__r_.__value_.var0.var1 + 1) = 0u;
  *(_OWORD *)&retstr[3].fUserName.var0 = 0u;
  *(__long *)((char *)&retstr[4].fUserName.__r_.__value_.var0.var1 + 3) = 0u;
  v4 = *(unsigned __int8 *)objc_msgSend(v1, "findComponent:", 1);
  v5 = objc_msgSend(v2, "clientAnchor");
  v6 = (unsigned __int8 *)objc_msgSend(v2, "findComponent:", 2);
  if (!v6)
  {
    if (v5)
      goto LABEL_23;
LABEL_27:
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102195860);
    v10 = qword_1022A01D8;
    if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    __str = 68289282;
    __str_8 = 2082;
    __str_10 = "";
    __str_18 = 2114;
    *(_QWORD *)__str_20 = v2;
    v11 = "{\"msg%{public}.0s\":\"#warning #CLCKP creating Name from ckp with an empty anchor\", \"CKP\":%{public, locati"
          "on:escape_only}@}";
LABEL_38:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&__str, 0x1Cu);
    goto LABEL_65;
  }
  v7 = *v6;
  v8 = objc_msgSend(v2, "subIdentityId");
  if (!v5)
    goto LABEL_27;
  if (v7 == 112)
  {
    if (v8)
    {
      if (v4 == 108)
      {
        sub_1015A2E04(&v17, (char *)objc_msgSend(v8, "UTF8String"));
        sub_1015A2E04(&v16, (char *)objc_msgSend(v5, "UTF8String"));
        sub_10142AE10(&v17, &v16, (std::string *)&__str);
        sub_1001AEF2C((uint64_t)retstr, (__int128 *)&__str);
        if (v33 < 0)
          operator delete(__p);
        if (v31 < 0)
          operator delete(v30);
        if (v29 < 0)
          operator delete(v28);
        if (v27 < 0)
          operator delete(v26);
        if (v25 < 0)
          operator delete(v24);
        if (v23 < 0)
          operator delete(*(void **)&__str_20[4]);
        if ((__str_20[3] & 0x80000000) != 0)
          operator delete((void *)__str);
        if ((SHIBYTE(v16.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_62;
        v9 = (void *)v16.__r_.__value_.__r.__words[0];
LABEL_61:
        operator delete(v9);
LABEL_62:
        if ((SHIBYTE(v17.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_65;
        v12 = (void *)v17.__r_.__value_.__r.__words[0];
        goto LABEL_64;
      }
      sub_1015A2E04(&v17, (char *)objc_msgSend(v8, "UTF8String"));
      sub_1001B8590(&v17, (uint64_t)&__str);
LABEL_47:
      sub_1001AEF2C((uint64_t)retstr, (__int128 *)&__str);
      if (v33 < 0)
        operator delete(__p);
      if (v31 < 0)
        operator delete(v30);
      if (v29 < 0)
        operator delete(v28);
      if (v27 < 0)
        operator delete(v26);
      if (v25 < 0)
        operator delete(v24);
      if (v23 < 0)
        operator delete(*(void **)&__str_20[4]);
      if ((__str_20[3] & 0x80000000) == 0)
        goto LABEL_62;
      v9 = (void *)__str;
      goto LABEL_61;
    }
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102195860);
    v13 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      __str = 68289282;
      __str_8 = 2082;
      __str_10 = "";
      __str_18 = 2114;
      *(_QWORD *)__str_20 = v2;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#CLCKP creating Name from ckp which has SubIdentityTypeNestedBundlePath, but empty subId\", \"CKP\":%{public, location:escape_only}@}", (uint8_t *)&__str, 0x1Cu);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102195860);
    }
    v14 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      __str = 68289282;
      __str_8 = 2082;
      __str_10 = "";
      __str_18 = 2114;
      *(_QWORD *)__str_20 = v2;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLCKP creating Name from ckp which has SubIdentityTypeNestedBundlePath, but empty subId", "{\"msg%{public}.0s\":\"#CLCKP creating Name from ckp which has SubIdentityTypeNestedBundlePath, but empty subId\", \"CKP\":%{public, location:escape_only}@}", (uint8_t *)&__str, 0x1Cu);
    }
    goto LABEL_65;
  }
LABEL_23:
  switch(v4)
  {
    case 'e':
      sub_1015A2E04(&__str, (char *)objc_msgSend(v5, "UTF8String"));
      std::string::operator=((std::string *)&retstr->fUserName.__r_.var0, (const std::string *)&__str);
      if ((__str_20[3] & 0x80000000) == 0)
        goto LABEL_65;
      v12 = (void *)__str;
LABEL_64:
      operator delete(v12);
      goto LABEL_65;
    case 'p':
      sub_1015A2E04(&v17, (char *)objc_msgSend(v5, "UTF8String"));
      sub_1001B8590(&v17, (uint64_t)&__str);
      goto LABEL_47;
    case 'i':
      sub_1015A2E04(&v17, (char *)objc_msgSend(v5, "UTF8String"));
      sub_1001AE67C(&v17, (uint64_t)&__str);
      goto LABEL_47;
  }
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102195860);
  v10 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    __str = 68289282;
    __str_8 = 2082;
    __str_10 = "";
    __str_18 = 2114;
    *(_QWORD *)__str_20 = v2;
    v11 = "{\"msg%{public}.0s\":\"#Warning #CLCKP creating Name from CKP without valid anchor type. The resulting Name wi"
          "ll have the following client key: 'com.apple.locationd.executable-'\", \"CKP\":%{public, location:escape_only}@}";
    goto LABEL_38;
  }
LABEL_65:
  result = (Name *)_os_feature_enabled_impl("CoreLocation", "cl_pula");
  if ((_DWORD)result)
  {
    sub_1015A2E04(&__str, (char *)objc_msgSend(objc_msgSend(v2, "userName"), "UTF8String"));
    result = (Name *)sub_1001AE664((std::string *)retstr, (const std::string *)&__str);
    if ((__str_20[3] & 0x80000000) != 0)
      operator delete((void *)__str);
  }
  return result;
}

- (NSString)legacyClientKey
{
  NSString *v3;
  char *v4;
  int v5;
  NSString *v6;
  char *v7;
  char *v8;
  NSString *v9;
  int v10;
  char **v11;
  char **v12;
  NSString *v13;
  void **v14;
  void *__p[2];
  char v17;

  v3 = -[CLClientKeyPath userName](self, "userName");
  v4 = -[CLClientKeyPath findComponent:](self, "findComponent:", 1);
  v5 = *v4;
  v6 = -[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v4 + 1);
  v7 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2);
  if (v7)
  {
    v8 = v7;
    v9 = -[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v7 + 1);
    v10 = *v8;
    switch(v10)
    {
      case 'e':
        v11 = &off_1021B6758;
        goto LABEL_11;
      case 'i':
        goto LABEL_16;
      case 'p':
        v11 = &off_1021B6760;
LABEL_11:
        v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s%@"), *v11, v9);
LABEL_15:
        v9 = v13;
LABEL_16:
        if (!v3)
          return v9;
        goto LABEL_17;
    }
  }
  switch(v5)
  {
    case '!':
      v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.locationd.executable-");
      goto LABEL_15;
    case 'e':
      v12 = &off_1021B6758;
      goto LABEL_14;
    case 'p':
      v12 = &off_1021B6760;
LABEL_14:
      v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s%@"), *v12, v6);
      goto LABEL_15;
  }
  v9 = v6;
  if (!v3)
    return v9;
LABEL_17:
  sub_1001A83C0(__p);
  if (v17 >= 0)
    v14 = __p;
  else
    v14 = (void **)__p[0];
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%s%@"), v3, v14, v9);
  if (v17 < 0)
    operator delete(__p[0]);
  return v9;
}

- (NSString)userName
{
  if (_os_feature_enabled_impl("CoreLocation", "cl_pula"))
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", -[CLClientKeyPath findComponent:](self, "findComponent:", 0));
  else
    return 0;
}

- (basic_string<char,)cppClientKey
{
  char *v1;
  char *v2;
  _BYTE *v4;
  _BYTE *v5;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;

  v2 = v1;
  v4 = objc_msgSend(v1, "findComponent:", 2);
  if (!v4)
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_1015A2E04(retstr, v2 + 8);
  v5 = v4;
  if (*v4 != 119)
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_1015A2E04(retstr, v2 + 8);
  *v4 = 0;
  result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_1015A2E04(retstr, v2 + 8);
  *v5 = 119;
  return result;
}

- (NSString)bundlePath
{
  char *v3;

  v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 1);
  if (*v3 == 112)
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v3 + 1);
  else
    return 0;
}

- (CLClientKeyPath)anchorKeyPath
{
  char *v3;

  if (-[CLClientKeyPath isAuthLimited](self, "isAuthLimited"))
    return self;
  v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2);
  if (!v3)
    return self;
  else
    return +[CLClientKeyPath clientKeyPathWithClientKey:](CLClientKeyPath, "clientKeyPathWithClientKey:", objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", self->_buffer, v3 - self->_buffer, 4));
}

- (id)extractComponentFromCharPtr:(char *)a3
{
  char *v4;
  size_t v5;

  v4 = strchr(a3, 58);
  if (v4)
  {
    v5 = v4 - a3;
    if (v4 != a3)
      return objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", a3, v5, 4);
  }
  else
  {
    v5 = strlen(a3);
    if (v5)
      return objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", a3, v5, 4);
  }
  return 0;
}

- (NSString)clientAnchor
{
  return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", -[CLClientKeyPath findComponent:](self, "findComponent:", 1) + 1);
}

- (NSString)subIdentityId
{
  NSString *result;

  result = -[CLClientKeyPath findComponent:](self, "findComponent:", 2);
  if (result)
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", (char *)result + 1);
  return result;
}

+ (CLClientKeyPath)clientKeyPathWithClientKey:(id)a3
{
  id v5;
  int v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  signed __int8 v14;
  signed __int8 v15;
  unsigned int v16;
  NSObject *v17;
  const char *v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;

  if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(+[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath"), "clientKey")))return (CLClientKeyPath *)+[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath");
  v5 = objc_msgSend(a3, "componentsSeparatedByString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%c"), 58));
  v6 = _os_feature_enabled_impl("CoreLocation", "cl_pula");
  v7 = objc_msgSend(v5, "count");
  if (!v6)
  {
    if (v7 == (id)2)
    {
      if (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 0), "length"))
        v9 = objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      else
        v9 = 0;
      v11 = 1;
      v8 = 0;
      v12 = 0;
      v13 = 2;
      if (!objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 1), "length"))
      {
LABEL_23:
        if (v9)
          goto LABEL_24;
LABEL_27:
        v14 = 33;
        if (v12)
          goto LABEL_25;
        goto LABEL_28;
      }
LABEL_22:
      v12 = objc_msgSend(v5, "objectAtIndexedSubscript:", v11);
      goto LABEL_23;
    }
    v10 = 2;
LABEL_12:
    if ((id)v10 == objc_msgSend(v5, "count"))
      goto LABEL_41;
LABEL_37:
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102195860);
    v17 = qword_1022A01D8;
    if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      return (CLClientKeyPath *)+[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath");
    *(_DWORD *)buf = 68289282;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2114;
    v24 = a3;
    v18 = "{\"msg%{public}.0s\":\"#Warning creating #CLCKP from clientKey with incorrect number of components. Returning "
          "nullCKP\", \"clientKey\":%{public, location:escape_only}@}";
    goto LABEL_45;
  }
  if (v7 != (id)3)
  {
    v10 = 3;
    goto LABEL_12;
  }
  if (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 0), "length"))
    v8 = objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  else
    v8 = 0;
  if (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 1), "length"))
    v9 = objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  else
    v9 = 0;
  v11 = 2;
  v13 = 3;
  if (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 2), "length"))
    goto LABEL_22;
  v12 = 0;
  if (!v9)
    goto LABEL_27;
LABEL_24:
  v14 = objc_msgSend(v9, "characterAtIndex:", 0);
  v9 = objc_msgSend(v9, "substringFromIndex:", 1);
  if (v12)
  {
LABEL_25:
    v15 = objc_msgSend(v12, "characterAtIndex:", 0);
    v12 = objc_msgSend(v12, "substringFromIndex:", 1);
    goto LABEL_29;
  }
LABEL_28:
  v15 = 33;
LABEL_29:
  if ((id)v13 != objc_msgSend(v5, "count"))
    goto LABEL_37;
  if (!v9)
  {
LABEL_41:
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102195860);
    v17 = qword_1022A01D8;
    if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      return (CLClientKeyPath *)+[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath");
    *(_DWORD *)buf = 68289282;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2114;
    v24 = a3;
    v18 = "{\"msg%{public}.0s\":\"#Warning creating #CLCKP from clientKey with nil anchor. Returning nullCKP\", \"clientK"
          "ey\":%{public, location:escape_only}@}";
    goto LABEL_45;
  }
  v16 = v14 - 101;
  if (v16 > 0xB || ((1 << v16) & 0x891) == 0)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102195860);
    v17 = qword_1022A01D8;
    if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      return (CLClientKeyPath *)+[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath");
    *(_DWORD *)buf = 68289282;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2114;
    v24 = a3;
    v18 = "{\"msg%{public}.0s\":\"#Warning creating #CLCKP from clientKey with invalid anchor type. Returning nullCKP\", "
          "\"clientKey\":%{public, location:escape_only}@}";
    goto LABEL_45;
  }
  if (!v12 || (v15 - 101) <= 0x15 && ((1 << (v15 - 101)) & 0x240811) != 0)
    return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:](CLClientKeyPath, "clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:", v8, v9);
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102195860);
  v17 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2114;
    v24 = a3;
    v18 = "{\"msg%{public}.0s\":\"#Warning creating #CLCKP from clientKey with invalid subIdentity type. Returning nullCK"
          "P\", \"clientKey\":%{public, location:escape_only}@}";
LABEL_45:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0x1Cu);
  }
  return (CLClientKeyPath *)+[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath");
}

- (BOOL)isValidCKP
{
  return +[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath") != self;
}

+ (id)nullClientKeyPath
{
  if (qword_102309240 != -1)
    dispatch_once(&qword_102309240, &stru_102195800);
  return (id)qword_102309238;
}

- (NSString)clientKey
{
  char *v3;
  char *v4;
  NSString *result;

  v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2);
  if (!v3)
    return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", self->_buffer);
  v4 = v3;
  if (*v3 != 119)
    return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", self->_buffer);
  *v3 = 0;
  result = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", self->_buffer);
  *v4 = 119;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v13;
  char *v14;
  char *v15;
  int v16;
  BOOL result;
  _BYTE *v18;
  _BYTE *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if (a3 == self)
    return 1;
  v21 = v7;
  v22 = v5;
  v23 = v4;
  v24 = v3;
  v13 = objc_opt_class(CLClientKeyPath, a2);
  if ((objc_opt_isKindOfClass(a3, v13) & 1) == 0)
    return 0;
  v14 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2);
  v15 = v14;
  if (v14 && *v14 == 119)
  {
    *v14 = 0;
    v16 = 1;
  }
  else
  {
    v16 = 0;
  }
  v18 = objc_msgSend(a3, "findComponent:", 2, v8, v21, v6, v22, v23, v24, v9, v10);
  v19 = v18;
  if (v18 && *v18 == 119)
  {
    *v18 = 0;
    v20 = 1;
  }
  else
  {
    v20 = 0;
  }
  result = strcmp(self->_buffer, (const char *)a3 + 8) == 0;
  if (v16)
    *v15 = 119;
  if (v20)
    *v19 = 119;
  return result;
}

- (char)findComponent:(int)a3
{
  uint64_t *v3;
  int v6;
  char *result;
  BOOL v8;
  int v9;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  CLClientKeyPath *v18;

  if ((_os_feature_enabled_impl("CoreLocation", "cl_pula") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    if (!a3)
    {
      sub_101936674(self);
LABEL_19:
      dispatch_once(&qword_1022A01D0, &stru_102195860);
      goto LABEL_12;
    }
    v6 = 1;
  }
  result = self->_buffer;
  v8 = __OFSUB__(a3, v6);
  v9 = a3 - v6;
  if ((v9 < 0) ^ v8 | (v9 == 0))
  {
LABEL_8:
    if (!*result)
      return 0;
    return result;
  }
  while (1)
  {
    v10 = strchr(result, 58);
    if (!v10)
      break;
    result = v10 + 1;
    if (!--v9)
      goto LABEL_8;
  }
  v3 = &qword_1022A0000;
  if (qword_1022A01D0 != -1)
    goto LABEL_19;
LABEL_12:
  v11 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
  {
    v13 = 68289282;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2114;
    v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#Warning CLCKP with an incorrect number of components\", \"CKP\":%{public, location:escape_only}@}", (uint8_t *)&v13, 0x1Cu);
    if (v3[58] != -1)
      dispatch_once(&qword_1022A01D0, &stru_102195860);
  }
  v12 = qword_1022A01D8;
  if (os_signpost_enabled((os_log_t)qword_1022A01D8))
  {
    v13 = 68289282;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2114;
    v18 = self;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Warning CLCKP with an incorrect number of components", "{\"msg%{public}.0s\":\"#Warning CLCKP with an incorrect number of components\", \"CKP\":%{public, location:escape_only}@}", (uint8_t *)&v13, 0x1Cu);
  }
  return 0;
}

- (BOOL)isAuthLimited
{
  return *-[CLClientKeyPath findComponent:](self, "findComponent:", 1) == 108;
}

- (BOOL)isAuthSharingSubIdentity
{
  char *v3;
  unsigned int v4;

  if (*-[CLClientKeyPath findComponent:](self, "findComponent:", 1) == 108)
    goto LABEL_5;
  v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2);
  if (v3)
  {
    v4 = *v3 - 101;
    if (v4 <= 0xB)
    {
      LODWORD(v3) = (0x811u >> v4) & 1;
      return (char)v3;
    }
LABEL_5:
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

+ (CLClientKeyPath)clientKeyPathWithUserName:(id)a3 clientAnchor:(id)a4 anchorType:(char)a5 subIdentityId:(id)a6 subIdentityType:(char)a7
{
  uint64_t *v7;
  int v8;
  NSObject *v10;
  NSObject *v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  char *v19;
  __objc2_class **v20;
  size_t v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  char *v27;
  __objc2_class **v28;
  __objc2_class **v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  char v49[2];
  char __source[2];
  uint8_t buf[4];
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  NSObject *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  id v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  const char *v68;

  v8 = a7;
  LODWORD(v10) = a5;
  if (!a4)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102195860);
    v34 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68290819;
      v52 = 0;
      v53 = 2082;
      v54 = "";
      v55 = 2114;
      v56 = a3;
      v57 = 2114;
      v58 = 0;
      v59 = 2050;
      v60 = (int)v10;
      v61 = 2114;
      v62 = a6;
      v63 = 2050;
      v64 = v8;
      v65 = 2082;
      v66 = "assert";
      v67 = 2081;
      v68 = "clientAnchor";
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#CLCKP initialization must include anchor\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102195860);
    }
    v35 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      *(_DWORD *)buf = 68290819;
      v52 = 0;
      v53 = 2082;
      v54 = "";
      v55 = 2114;
      v56 = a3;
      v57 = 2114;
      v58 = 0;
      v59 = 2050;
      v60 = (int)v10;
      v61 = 2114;
      v62 = a6;
      v63 = 2050;
      v64 = v8;
      v65 = 2082;
      v66 = "assert";
      v67 = 2081;
      v68 = "clientAnchor";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLCKP initialization must include anchor", "{\"msg%{public}.0s\":\"#CLCKP initialization must include anchor\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102195860);
    }
    v12 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68290819;
      v52 = 0;
      v53 = 2082;
      v54 = "";
      v55 = 2114;
      v56 = a3;
      v57 = 2114;
      v58 = 0;
      v59 = 2050;
      v60 = (int)v10;
      v61 = 2114;
      v62 = a6;
      v63 = 2050;
      v64 = v8;
      v65 = 2082;
      v66 = "assert";
      v67 = 2081;
      v68 = "clientAnchor";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#CLCKP initialization must include anchor\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
    }
    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLClientKeyPath.mm", 213, "+[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]");
    goto LABEL_112;
  }
  v12 = a4;
  if ((a5 - 101) > 0xB || ((1 << (a5 - 101)) & 0x891) == 0)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102195860);
    v7 = &qword_1022A0000;
    v46 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68290819;
      v52 = 0;
      v53 = 2082;
      v54 = "";
      v55 = 2114;
      v56 = a3;
      v57 = 2114;
      v58 = v12;
      v59 = 2050;
      v60 = (int)v10;
      v61 = 2114;
      v62 = a6;
      v63 = 2050;
      v64 = v8;
      v65 = 2082;
      v66 = "assert";
      v67 = 2081;
      v68 = "validateCKPAnchorType(anchorType)";
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#CLCKP anchorType must be valid\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102195860);
    }
    v47 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      *(_DWORD *)buf = 68290819;
      v52 = 0;
      v53 = 2082;
      v54 = "";
      v55 = 2114;
      v56 = a3;
      v57 = 2114;
      v58 = v12;
      v59 = 2050;
      v60 = (int)v10;
      v61 = 2114;
      v62 = a6;
      v63 = 2050;
      v64 = v8;
      v65 = 2082;
      v66 = "assert";
      v67 = 2081;
      v68 = "validateCKPAnchorType(anchorType)";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLCKP anchorType must be valid", "{\"msg%{public}.0s\":\"#CLCKP anchorType must be valid\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102195860);
    }
    v48 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68290819;
      v52 = 0;
      v53 = 2082;
      v54 = "";
      v55 = 2114;
      v56 = a3;
      v57 = 2114;
      v58 = v12;
      v59 = 2050;
      v60 = (int)v10;
      v61 = 2114;
      v62 = a6;
      v63 = 2050;
      v64 = v8;
      v65 = 2082;
      v66 = "assert";
      v67 = 2081;
      v68 = "validateCKPAnchorType(anchorType)";
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#CLCKP anchorType must be valid\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
    }
    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLClientKeyPath.mm", 214, "+[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]");
    goto LABEL_112;
  }
  if (a5 == 108 && a7 != 112)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102195860);
    v39 = qword_1022A01D8;
    v7 = (uint64_t *)"";
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68290819;
      v52 = 0;
      v53 = 2082;
      v54 = "";
      v55 = 2114;
      v56 = a3;
      v57 = 2114;
      v58 = v12;
      v59 = 2050;
      v60 = 108;
      v61 = 2114;
      v62 = a6;
      v63 = 2050;
      v64 = v8;
      v65 = 2082;
      v66 = "assert";
      v67 = 2081;
      v68 = "subIdentityType == kSubIdentityTypeNestedBundlePath";
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#CLCKP LimitingBundleId anchors must have a subIdentity of type kSubIdentityTypeNestedBundlePath\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102195860);
    }
    v40 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      *(_DWORD *)buf = 68290819;
      v52 = 0;
      v53 = 2082;
      v54 = "";
      v55 = 2114;
      v56 = a3;
      v57 = 2114;
      v58 = v12;
      v59 = 2050;
      v60 = 108;
      v61 = 2114;
      v62 = a6;
      v63 = 2050;
      v64 = v8;
      v65 = 2082;
      v66 = "assert";
      v67 = 2081;
      v68 = "subIdentityType == kSubIdentityTypeNestedBundlePath";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLCKP LimitingBundleId anchors must have a subIdentity of type kSubIdentityTypeNestedBundlePath", "{\"msg%{public}.0s\":\"#CLCKP LimitingBundleId anchors must have a subIdentity of type kSubIdentityTypeNestedBundlePath\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102195860);
    }
    v10 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68290819;
      v52 = 0;
      v53 = 2082;
      v54 = "";
      v55 = 2114;
      v56 = a3;
      v57 = 2114;
      v58 = v12;
      v59 = 2050;
      v60 = 108;
      v61 = 2114;
      v62 = a6;
      v63 = 2050;
      v64 = v8;
      v65 = 2082;
      v66 = "assert";
      v67 = 2081;
      v68 = "subIdentityType == kSubIdentityTypeNestedBundlePath";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#CLCKP LimitingBundleId anchors must have a subIdentity of type kSubIdentityTypeNestedBundlePath\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
    }
    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLClientKeyPath.mm", 216, "+[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]");
    goto LABEL_112;
  }
  if (a6 && ((a7 - 101) > 0x15 || ((1 << (a7 - 101)) & 0x240811) == 0))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102195860);
    v7 = &qword_1022A0000;
    v36 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68290819;
      v52 = 0;
      v53 = 2082;
      v54 = "";
      v55 = 2114;
      v56 = a3;
      v57 = 2114;
      v58 = v12;
      v59 = 2050;
      v60 = (int)v10;
      v61 = 2114;
      v62 = a6;
      v63 = 2050;
      v64 = v8;
      v65 = 2082;
      v66 = "assert";
      v67 = 2081;
      v68 = "validateCKPSubIdentityType(subIdentityType)";
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#CLCKP subIdentityType must be valid\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102195860);
    }
    v37 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      *(_DWORD *)buf = 68290819;
      v52 = 0;
      v53 = 2082;
      v54 = "";
      v55 = 2114;
      v56 = a3;
      v57 = 2114;
      v58 = v12;
      v59 = 2050;
      v60 = (int)v10;
      v61 = 2114;
      v62 = a6;
      v63 = 2050;
      v64 = v8;
      v65 = 2082;
      v66 = "assert";
      v67 = 2081;
      v68 = "validateCKPSubIdentityType(subIdentityType)";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLCKP subIdentityType must be valid", "{\"msg%{public}.0s\":\"#CLCKP subIdentityType must be valid\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102195860);
    }
    v38 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68290819;
      v52 = 0;
      v53 = 2082;
      v54 = "";
      v55 = 2114;
      v56 = a3;
      v57 = 2114;
      v58 = v12;
      v59 = 2050;
      v60 = (int)v10;
      v61 = 2114;
      v62 = a6;
      v63 = 2050;
      v64 = v8;
      v65 = 2082;
      v66 = "assert";
      v67 = 2081;
      v68 = "validateCKPSubIdentityType(subIdentityType)";
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#CLCKP subIdentityType must be valid\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
    }
    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLClientKeyPath.mm", 219, "+[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]");
    goto LABEL_112;
  }
  if (_os_feature_enabled_impl("CoreLocation", "cl_pula"))
  {
    if (!a3)
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102195860);
      v41 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68290819;
        v52 = 0;
        v53 = 2082;
        v54 = "";
        v55 = 2114;
        v56 = 0;
        v57 = 2114;
        v58 = v12;
        v59 = 2050;
        v60 = (int)v10;
        v61 = 2114;
        v62 = a6;
        v63 = 2050;
        v64 = v8;
        v65 = 2082;
        v66 = "assert";
        v67 = 2081;
        v68 = "userName";
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#CLCKP initializing on cl_pula enabled devices requires userName\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102195860);
      }
      v42 = qword_1022A01D8;
      if (os_signpost_enabled((os_log_t)qword_1022A01D8))
      {
        *(_DWORD *)buf = 68290819;
        v52 = 0;
        v53 = 2082;
        v54 = "";
        v55 = 2114;
        v56 = 0;
        v57 = 2114;
        v58 = v12;
        v59 = 2050;
        v60 = (int)v10;
        v61 = 2114;
        v62 = a6;
        v63 = 2050;
        v64 = v8;
        v65 = 2082;
        v66 = "assert";
        v67 = 2081;
        v68 = "userName";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLCKP initializing on cl_pula enabled devices requires userName", "{\"msg%{public}.0s\":\"#CLCKP initializing on cl_pula enabled devices requires userName\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102195860);
      }
      a3 = (id)qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68290819;
        v52 = 0;
        v53 = 2082;
        v54 = "";
        v55 = 2114;
        v56 = 0;
        v57 = 2114;
        v58 = v12;
        v59 = 2050;
        v60 = (int)v10;
        v61 = 2114;
        v62 = a6;
        v63 = 2050;
        v64 = v8;
        v65 = 2082;
        v66 = "assert";
        v67 = 2081;
        v68 = "userName";
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)a3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#CLCKP initializing on cl_pula enabled devices requires userName\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
      }
      abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLClientKeyPath.mm", 225, "+[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]");
      goto LABEL_112;
    }
    if ((sub_100F63970((uint64_t)a3) & 1) != 0)
    {
      v13 = (char *)objc_msgSend(a3, "length");
      v14 = 2;
      goto LABEL_20;
    }
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102195860);
    v26 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289794;
      v52 = 0;
      v53 = 2082;
      v54 = "";
      v55 = 2114;
      v56 = a3;
      v57 = 2114;
      v58 = v12;
      v59 = 2114;
      v60 = (uint64_t)a6;
      v23 = "{\"msg%{public}.0s\":\"#warning CLCKP initializing with invalid user UUID. returning nullCKP\", \"userName\"
            ":%{public, location:escape_only}@, \"Anchor\":%{public, location:escape_only}@, \"SubId\":%{public, location:escape_only}@}";
      v24 = v26;
      v25 = 48;
LABEL_35:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
    }
  }
  else
  {
    if (!a3)
      goto LABEL_19;
    v7 = &qword_1022A0000;
    if (qword_1022A01D0 == -1)
      goto LABEL_13;
LABEL_112:
    while (1)
    {
      dispatch_once(&qword_1022A01D0, &stru_102195860);
LABEL_13:
      v15 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68290306;
        v52 = 0;
        v53 = 2082;
        v54 = "";
        v55 = 2114;
        v56 = a3;
        v57 = 2114;
        v58 = v12;
        v59 = 2050;
        v60 = (int)v10;
        v61 = 2114;
        v62 = a6;
        v63 = 2050;
        v64 = v8;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#CLCKP initializing with userName when cl_pula is disabled. Ignoring userName.\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld}", buf, 0x44u);
        if (v7[58] != -1)
          dispatch_once(&qword_1022A01D0, &stru_102195860);
      }
      v16 = qword_1022A01D8;
      if (os_signpost_enabled((os_log_t)qword_1022A01D8))
      {
        *(_DWORD *)buf = 68290306;
        v52 = 0;
        v53 = 2082;
        v54 = "";
        v55 = 2114;
        v56 = a3;
        v57 = 2114;
        v58 = v12;
        v59 = 2050;
        v60 = (int)v10;
        v61 = 2114;
        v62 = a6;
        v63 = 2050;
        v64 = v8;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLCKP initializing with userName when cl_pula is disabled. Ignoring userName.", "{\"msg%{public}.0s\":\"#CLCKP initializing with userName when cl_pula is disabled. Ignoring userName.\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld}", buf, 0x44u);
      }
      a3 = 0;
LABEL_19:
      v13 = 0;
      v14 = 1;
LABEL_20:
      if (!-[NSObject length](v12, "length"))
        break;
      if (a6)
        v17 = 2;
      else
        v17 = 1;
      v18 = -[NSObject length](v12, "length");
      v19 = &v13[v14 + v17 + (unint64_t)objc_msgSend(a6, "length") + (_QWORD)v18];
      if ((unint64_t)v19 < 0x1F8)
      {
        if ((unint64_t)v19 >= 0x18)
        {
          v28 = off_102125D60;
          v29 = off_102125D78;
          if ((unint64_t)v19 < 0xF8)
            v29 = off_102125D68;
          v30 = 504;
          if ((unint64_t)v19 < 0xF8)
            v30 = 248;
          if ((unint64_t)v19 < 0x78)
          {
            v31 = 120;
          }
          else
          {
            v28 = v29;
            v31 = v30;
          }
          v32 = (unint64_t)v19 >= 0x38;
          if ((unint64_t)v19 >= 0x38)
            v20 = v28;
          else
            v20 = &off_102125D80;
          if (v32)
            v21 = v31;
          else
            v21 = 56;
        }
        else
        {
          v20 = off_102125D70;
          v21 = 24;
        }
        v27 = (char *)objc_alloc(*v20);
        strcpy((char *)buf, ":");
        __source[0] = (char)v10;
        __source[1] = 0;
        v49[0] = v8;
        v49[1] = 0;
        if (_os_feature_enabled_impl("CoreLocation", "cl_pula"))
        {
          strlcpy(v27 + 8, (const char *)objc_msgSend(a3, "UTF8String"), v21);
          strlcat(v27 + 8, (const char *)buf, v21);
        }
        strlcat(v27 + 8, __source, v21);
        strlcat(v27 + 8, (const char *)-[NSObject UTF8String](v12, "UTF8String"), v21);
        strlcat(v27 + 8, (const char *)buf, v21);
        if (a6)
        {
          strlcat(v27 + 8, v49, v21);
          strlcat(v27 + 8, (const char *)objc_msgSend(a6, "UTF8String"), v21);
        }
        return (CLClientKeyPath *)v27;
      }
      v7 = &qword_1022A0000;
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102195860);
      v43 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68290819;
        v52 = 0;
        v53 = 2082;
        v54 = "";
        v55 = 2114;
        v56 = a3;
        v57 = 2114;
        v58 = v12;
        v59 = 2050;
        v60 = (int)v10;
        v61 = 2114;
        v62 = a6;
        v63 = 2050;
        v64 = v8;
        v65 = 2082;
        v66 = "assert";
        v67 = 2081;
        v68 = "ckp_length < kClientKeyPathMaxBufferLength";
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#CLCKP cannot init with parameters larger than the maximum 512 bytes\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102195860);
      }
      v44 = qword_1022A01D8;
      if (os_signpost_enabled((os_log_t)qword_1022A01D8))
      {
        *(_DWORD *)buf = 68290819;
        v52 = 0;
        v53 = 2082;
        v54 = "";
        v55 = 2114;
        v56 = a3;
        v57 = 2114;
        v58 = v12;
        v59 = 2050;
        v60 = (int)v10;
        v61 = 2114;
        v62 = a6;
        v63 = 2050;
        v64 = v8;
        v65 = 2082;
        v66 = "assert";
        v67 = 2081;
        v68 = "ckp_length < kClientKeyPathMaxBufferLength";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLCKP cannot init with parameters larger than the maximum 512 bytes", "{\"msg%{public}.0s\":\"#CLCKP cannot init with parameters larger than the maximum 512 bytes\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102195860);
      }
      v45 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68290819;
        v52 = 0;
        v53 = 2082;
        v54 = "";
        v55 = 2114;
        v56 = a3;
        v57 = 2114;
        v58 = v12;
        v59 = 2050;
        v60 = (int)v10;
        v61 = 2114;
        v62 = a6;
        v63 = 2050;
        v64 = v8;
        v65 = 2082;
        v66 = "assert";
        v67 = 2081;
        v68 = "ckp_length < kClientKeyPathMaxBufferLength";
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#CLCKP cannot init with parameters larger than the maximum 512 bytes\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
      }
      abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLClientKeyPath.mm", 266, "+[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]");
    }
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102195860);
    v22 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68290306;
      v52 = 0;
      v53 = 2082;
      v54 = "";
      v55 = 2114;
      v56 = a3;
      v57 = 2114;
      v58 = v12;
      v59 = 2050;
      v60 = (int)v10;
      v61 = 2114;
      v62 = a6;
      v63 = 2050;
      v64 = v8;
      v23 = "{\"msg%{public}.0s\":\"#Warning #CLCKP initialization must include non-empty anchor. Returning nullClientKey"
            "Path\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"
            "anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}"
            "@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld}";
      v24 = v22;
      v25 = 68;
      goto LABEL_35;
    }
  }
  return (CLClientKeyPath *)+[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath");
}

- (NSString)bundleId
{
  char *v3;

  v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 1);
  if (*v3 == 105)
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v3 + 1);
  else
    return 0;
}

- (NSString)website
{
  char *v3;

  v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2);
  if (v3 && *v3 == 119)
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v3 + 1);
  else
    return 0;
}

+ (id)clientKeyPathFromName:(id)a1 subIdentityId:(SEL)a2 subIdentityType:(Name *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSString *v8;
  void **v9;
  void **v10;
  NSString *v11;
  int *p_var0;
  uint64_t v13;
  unint64_t *p_size;
  void *__p[2];
  uint64_t v17;

  v5 = v4;
  v6 = v3;
  if (_os_feature_enabled_impl("CoreLocation", "cl_pula"))
  {
    if (*((char *)&a3->fUserName.__r_.__value_.var0.var1 + 23) < 0)
    {
      sub_100115CE4(__p, a3->fUserName.__r_.__value_.var0.var1.__data_, a3->fUserName.__r_.__value_.var0.var1.__size_);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)a3->fUserName.__r_.__value_.var0.var0.__data_;
      v17 = *((_QWORD *)&a3->fUserName.__r_.__value_.var0.var1 + 2);
    }
    if (v17 >= 0)
      v9 = __p;
    else
      v9 = (void **)__p[0];
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9, __p[0], __p[1], v17);
    if (SHIBYTE(v17) < 0)
      operator delete(__p[0]);
  }
  else
  {
    v8 = 0;
  }
  sub_1001A8BBC((uint64_t)a3, (uint64_t)__p);
  if (v17 >= 0)
    v10 = __p;
  else
    v10 = (void **)__p[0];
  v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v10);
  if (SHIBYTE(v17) < 0)
    operator delete(__p[0]);
  if (-[NSString hasPrefix:](v11, "hasPrefix:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.locationd.executable-")))
  {
    p_var0 = &a3->fUserName.__r_.var0;
    if (a3[1].fUserName.__r_.__value_.var0.var0.__data_[7] < 0)
      p_var0 = *(int **)p_var0;
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_var0);
    v13 = 101;
  }
  else if (-[NSString hasPrefix:](v11, "hasPrefix:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.locationd.bundle-")))
  {
    p_size = &a3[1].fUserName.__r_.__value_.var0.var1.__size_;
    if (*((char *)&a3[1].fUserName.__r_.var1 + 3) < 0)
      p_size = (unint64_t *)*p_size;
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_size);
    v13 = 112;
  }
  else
  {
    v13 = 105;
  }
  return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:](CLClientKeyPath, "clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:", v8, v11, v13, v6, v5);
}

+ (CLClientKeyPath)clientKeyPathWithLegacyClientKey:(id)a3
{
  void **v4;
  id v5;
  int v6;
  id v7;
  id v8;
  id v9;
  NSString *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _Unwind_Exception *v15;
  void *__p[2];
  char v17;

  sub_1001A83C0(__p);
  if (v17 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  v5 = objc_msgSend(a3, "componentsSeparatedByString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4));
  if (v17 < 0)
    operator delete(__p[0]);
  v6 = _os_feature_enabled_impl("CoreLocation", "cl_pula");
  v7 = objc_msgSend(v5, "count");
  if (!v6)
  {
    if (v7 == (id)1)
    {
      if (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 0), "length"))
      {
        v9 = objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v8 = 0;
      }
      else
      {
        v8 = 0;
        v9 = 0;
      }
      goto LABEL_19;
    }
    goto LABEL_27;
  }
  if (v7 != (id)2)
  {
    sub_10193694C(a3);
LABEL_27:
    sub_101936ABC(a3);
LABEL_28:
    v15 = (_Unwind_Exception *)sub_1019367DC(a3);
    if (v17 < 0)
      operator delete(__p[0]);
    _Unwind_Resume(v15);
  }
  if (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 0), "length"))
    v8 = objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  else
    v8 = 0;
  if (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 1), "length"))
    v9 = objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  else
    v9 = 0;
  if ((sub_100F63970((uint64_t)v8) & 1) == 0)
    goto LABEL_28;
LABEL_19:
  if (objc_msgSend(v9, "hasPrefix:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.locationd.bundle-")))
  {
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.locationd.bundle-");
    v11 = 112;
  }
  else
  {
    if (!objc_msgSend(v9, "hasPrefix:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.locationd.executable-")))
    {
      v11 = 105;
      return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:](CLClientKeyPath, "clientKeyPathWithUserName:clientAnchor:anchorType:", v8, v9, v11);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.locationd.executable-");
    v11 = 101;
  }
  v12 = (char *)objc_msgSend(v9, "rangeOfString:", v10);
  v9 = objc_msgSend(v9, "substringFromIndex:", &v12[v13]);
  return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:](CLClientKeyPath, "clientKeyPathWithUserName:clientAnchor:anchorType:", v8, v9, v11);
}

+ (CLClientKeyPath)clientKeyPathWithUserName:(id)a3 clientAnchor:(id)a4 anchorType:(char)a5
{
  return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:](CLClientKeyPath, "clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:", a3, a4, a5, 0, 33);
}

- (NSString)executablePath
{
  char *v3;

  v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 1);
  if (*v3 == 101)
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v3 + 1);
  else
    return 0;
}

- (char)subIdentityType
{
  char *v2;

  v2 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2);
  if (v2)
    return *v2;
  else
    return 33;
}

+ (id)clientKeyPathFromName:(Name *)a3
{
  id v3;
  void *__dst[2];
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *__p;
  char v18;

  sub_1001AF190((char *)__dst, (__int128 *)a3->fUserName.__r_.__value_.var0.var0.__data_);
  v3 = +[CLClientKeyPath clientKeyPathFromName:subIdentityId:subIdentityType:](CLClientKeyPath, "clientKeyPathFromName:subIdentityId:subIdentityType:", __dst, 0, 33);
  if (v18 < 0)
    operator delete(__p);
  if (v16 < 0)
    operator delete(v15);
  if (v14 < 0)
    operator delete(v13);
  if (v12 < 0)
    operator delete(v11);
  if (v10 < 0)
    operator delete(v9);
  if (v8 < 0)
    operator delete(v7);
  if (v6 < 0)
    operator delete(__dst[0]);
  return v3;
}

- (id)description
{
  return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", self->_buffer);
}

+ (CLClientKeyPath)clientKeyPathWithClientAnchor:(id)a3 anchorType:(char)a4
{
  return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:](CLClientKeyPath, "clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:", 0, a3, a4, 0, 33);
}

- (unint64_t)hash
{
  int v2;
  unint64_t result;
  char *v5;
  int v6;
  int v7;
  _BOOL4 v9;
  BOOL v10;

  LOBYTE(v2) = self->_buffer[0];
  if (!(_BYTE)v2)
    return 0;
  result = 0;
  v5 = &self->_buffer[1];
  do
  {
    v6 = v2;
    result = 2 * (result + (char)v2);
    v7 = *v5++;
    v2 = v7;
    v9 = v6 == 58 && v2 == 119;
    if (v2)
      v10 = !v9;
    else
      v10 = 0;
  }
  while (v10);
  return result;
}

+ (CLClientKeyPath)clientKeyPathWithClientAnchor:(id)a3 anchorType:(char)a4 subIdentityId:(id)a5 subIdentityType:(char)a6
{
  return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:](CLClientKeyPath, "clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:", 0, a3, a4, a5, a6);
}

- (CLClientKeyPath)clientKeyPathWithReplacementSubIdentityId:(id)a3 subIdentityType:(char)a4
{
  uint64_t v4;
  char *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  CLClientKeyPath *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;

  v4 = a4;
  if (!objc_msgSend(a3, "length"))
    return self;
  if ((v4 - 101) > 0x15 || ((1 << (v4 - 101)) & 0x240811) == 0)
  {
    if (qword_1022A01D0 != -1)
      goto LABEL_16;
    while (1)
    {
      v9 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68290307;
        v13 = 0;
        v14 = 2082;
        v15 = "";
        v16 = 2114;
        v17 = self;
        v18 = 2114;
        v19 = a3;
        v20 = 1026;
        v21 = v4;
        v22 = 2082;
        v23 = "assert";
        v24 = 2081;
        v25 = "validateCKPSubIdentityType(subIdentityType)";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Attempted to create #CLCKP with invalid replacement subIdentity type.\", \"originalCKP\":%{public, location:escape_only}@, \"subId\":%{public, location:escape_only}@, \"subIdTypeChar\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x40u);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102195860);
      }
      v10 = qword_1022A01D8;
      if (os_signpost_enabled((os_log_t)qword_1022A01D8))
      {
        *(_DWORD *)buf = 68290307;
        v13 = 0;
        v14 = 2082;
        v15 = "";
        v16 = 2114;
        v17 = self;
        v18 = 2114;
        v19 = a3;
        v20 = 1026;
        v21 = v4;
        v22 = 2082;
        v23 = "assert";
        v24 = 2081;
        v25 = "validateCKPSubIdentityType(subIdentityType)";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Attempted to create #CLCKP with invalid replacement subIdentity type.", "{\"msg%{public}.0s\":\"Attempted to create #CLCKP with invalid replacement subIdentity type.\", \"originalCKP\":%{public, location:escape_only}@, \"subId\":%{public, location:escape_only}@, \"subIdTypeChar\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x40u);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102195860);
      }
      v11 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68290307;
        v13 = 0;
        v14 = 2082;
        v15 = "";
        v16 = 2114;
        v17 = self;
        v18 = 2114;
        v19 = a3;
        v20 = 1026;
        v21 = v4;
        v22 = 2082;
        v23 = "assert";
        v24 = 2081;
        v25 = "validateCKPSubIdentityType(subIdentityType)";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Attempted to create #CLCKP with invalid replacement subIdentity type.\", \"originalCKP\":%{public, location:escape_only}@, \"subId\":%{public, location:escape_only}@, \"subIdTypeChar\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x40u);
      }
      abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLClientKeyPath.mm", 501, "-[CLClientKeyPath clientKeyPathWithReplacementSubIdentityId:subIdentityType:]");
LABEL_16:
      dispatch_once(&qword_1022A01D0, &stru_102195860);
    }
  }
  v8 = -[CLClientKeyPath findComponent:](self, "findComponent:", 1);
  return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:](CLClientKeyPath, "clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:", -[CLClientKeyPath userName](self, "userName"), -[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v8 + 1), *v8, a3, v4);
}

- (CLClientKeyPath)clientKeyPathWithReplacementAnchor:(id)a3 anchorType:(char)a4
{
  uint64_t v4;
  char *v8;
  char *v9;
  id v10;
  char v11;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  CLClientKeyPath *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;

  v4 = a4;
  if ((a4 - 101) > 0xB || ((1 << (a4 - 101)) & 0x891) == 0)
  {
    if (qword_1022A01D0 != -1)
      goto LABEL_19;
    while (1)
    {
      v13 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68290307;
        v17 = 0;
        v18 = 2082;
        v19 = "";
        v20 = 2114;
        v21 = self;
        v22 = 2114;
        v23 = a3;
        v24 = 1026;
        v25 = v4;
        v26 = 2082;
        v27 = "assert";
        v28 = 2081;
        v29 = "validateCKPAnchorType(anchorType)";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Attempted to create #CLCKP with either an empty clientAnchor or an invalid replacement anchor type.\", \"originalCKP\":%{public, location:escape_only}@, \"anchor\":%{public, location:escape_only}@, \"anchorTypeChar\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x40u);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102195860);
      }
      v14 = qword_1022A01D8;
      if (os_signpost_enabled((os_log_t)qword_1022A01D8))
      {
        *(_DWORD *)buf = 68290307;
        v17 = 0;
        v18 = 2082;
        v19 = "";
        v20 = 2114;
        v21 = self;
        v22 = 2114;
        v23 = a3;
        v24 = 1026;
        v25 = v4;
        v26 = 2082;
        v27 = "assert";
        v28 = 2081;
        v29 = "validateCKPAnchorType(anchorType)";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Attempted to create #CLCKP with either an empty clientAnchor or an invalid replacement anchor type.", "{\"msg%{public}.0s\":\"Attempted to create #CLCKP with either an empty clientAnchor or an invalid replacement anchor type.\", \"originalCKP\":%{public, location:escape_only}@, \"anchor\":%{public, location:escape_only}@, \"anchorTypeChar\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x40u);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102195860);
      }
      v15 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68290307;
        v17 = 0;
        v18 = 2082;
        v19 = "";
        v20 = 2114;
        v21 = self;
        v22 = 2114;
        v23 = a3;
        v24 = 1026;
        v25 = v4;
        v26 = 2082;
        v27 = "assert";
        v28 = 2081;
        v29 = "validateCKPAnchorType(anchorType)";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Attempted to create #CLCKP with either an empty clientAnchor or an invalid replacement anchor type.\", \"originalCKP\":%{public, location:escape_only}@, \"anchor\":%{public, location:escape_only}@, \"anchorTypeChar\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x40u);
      }
      abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLClientKeyPath.mm", 512, "-[CLClientKeyPath clientKeyPathWithReplacementAnchor:anchorType:]");
LABEL_19:
      dispatch_once(&qword_1022A01D0, &stru_102195860);
    }
  }
  v8 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2);
  if (v8)
  {
    v9 = v8;
    v10 = -[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v8 + 1);
    v11 = *v9;
  }
  else
  {
    v10 = 0;
    v11 = 33;
  }
  return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:](CLClientKeyPath, "clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:", -[CLClientKeyPath userName](self, "userName"), a3, v4, v10, v11);
}

- (CLClientKeyPath)clientKeyPathWithReplacementTypedSubIdentityId:(id)a3
{
  id v6;
  char *v7;
  char v9;
  char *v10;
  CLClientKeyPath *v11;
  SEL v12;
  id v13;

  if (!objc_msgSend(a3, "length"))
    return self;
  v6 = objc_msgSend(a3, "substringFromIndex:", 1);
  v7 = (char *)objc_msgSend(a3, "UTF8String");
  if ((*v7 - 101) > 0x15 || ((1 << (*v7 - 101)) & 0x240811) == 0)
  {
    v11 = (CLClientKeyPath *)sub_101936C2C(a3);
    return -[CLClientKeyPath clientKeyPathWithReplacementTypedAnchor:](v11, v12, v13);
  }
  else
  {
    v9 = *v7;
    v10 = -[CLClientKeyPath findComponent:](self, "findComponent:", 1);
    return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:](CLClientKeyPath, "clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:", -[CLClientKeyPath userName](self, "userName"), -[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v10 + 1), *v10, v6, v9);
  }
}

- (CLClientKeyPath)clientKeyPathWithReplacementTypedAnchor:(id)a3
{
  id v5;
  _BYTE *v6;
  int v7;
  char *v9;
  char *v10;
  id v11;
  char v12;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  CLClientKeyPath *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;

  v5 = objc_msgSend(a3, "substringFromIndex:", 1);
  v6 = objc_msgSend(a3, "UTF8String");
  v7 = (char)*v6;
  if ((v7 - 101) > 0xB || ((1 << (*v6 - 101)) & 0x891) == 0)
  {
    if (qword_1022A01D0 != -1)
      goto LABEL_19;
    while (1)
    {
      v14 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68290051;
        v18 = 0;
        v19 = 2082;
        v20 = "";
        v21 = 2114;
        v22 = self;
        v23 = 2114;
        v24 = a3;
        v25 = 2082;
        v26 = "assert";
        v27 = 2081;
        v28 = "validateCKPAnchorType(anchorType)";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Attempted to create #CLCKP with invalid replacement typed-anchor.\", \"originalCKP\":%{public, location:escape_only}@, \"anchorWithType\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102195860);
      }
      v15 = qword_1022A01D8;
      if (os_signpost_enabled((os_log_t)qword_1022A01D8))
      {
        *(_DWORD *)buf = 68290051;
        v18 = 0;
        v19 = 2082;
        v20 = "";
        v21 = 2114;
        v22 = self;
        v23 = 2114;
        v24 = a3;
        v25 = 2082;
        v26 = "assert";
        v27 = 2081;
        v28 = "validateCKPAnchorType(anchorType)";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Attempted to create #CLCKP with invalid replacement typed-anchor.", "{\"msg%{public}.0s\":\"Attempted to create #CLCKP with invalid replacement typed-anchor.\", \"originalCKP\":%{public, location:escape_only}@, \"anchorWithType\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102195860);
      }
      v16 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68290051;
        v18 = 0;
        v19 = 2082;
        v20 = "";
        v21 = 2114;
        v22 = self;
        v23 = 2114;
        v24 = a3;
        v25 = 2082;
        v26 = "assert";
        v27 = 2081;
        v28 = "validateCKPAnchorType(anchorType)";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Attempted to create #CLCKP with invalid replacement typed-anchor.\", \"originalCKP\":%{public, location:escape_only}@, \"anchorWithType\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
      }
      abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLClientKeyPath.mm", 545, "-[CLClientKeyPath clientKeyPathWithReplacementTypedAnchor:]");
LABEL_19:
      dispatch_once(&qword_1022A01D0, &stru_102195860);
    }
  }
  v9 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2);
  if (v9)
  {
    v10 = v9;
    v11 = -[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v9 + 1);
    v12 = *v10;
  }
  else
  {
    v11 = 0;
    v12 = 33;
  }
  return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:](CLClientKeyPath, "clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:", -[CLClientKeyPath userName](self, "userName"), v5, (char)v7, v11, v12);
}

- (char)anchorType
{
  return *-[CLClientKeyPath findComponent:](self, "findComponent:", 1);
}

- (NSString)clientAnchorWithType
{
  return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", -[CLClientKeyPath findComponent:](self, "findComponent:", 1));
}

- (NSString)subIdentityIdWithType
{
  NSString *result;

  result = -[CLClientKeyPath findComponent:](self, "findComponent:", 2);
  if (result)
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", result);
  return result;
}

- (NSString)zoneId
{
  char *v3;

  v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2);
  if (v3 && *v3 == 122)
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v3 + 1);
  else
    return 0;
}

- (NSString)nestedBundleId
{
  char *v3;

  v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2);
  if (v3 && *v3 == 105)
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v3 + 1);
  else
    return 0;
}

- (NSString)nestedBundlePath
{
  char *v3;

  v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2);
  if (v3 && *v3 == 112)
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v3 + 1);
  else
    return 0;
}

- (NSString)nestedExecutablePath
{
  char *v3;

  v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2);
  if (v3 && *v3 == 101)
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v3 + 1);
  else
    return 0;
}

- (CLClientKeyPath)limitingCKP
{
  char *v3;

  v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 1);
  if (*v3 == 108)
    return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:](CLClientKeyPath, "clientKeyPathWithUserName:clientAnchor:anchorType:", -[CLClientKeyPath userName](self, "userName"), -[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v3 + 1), 105);
  else
    return 0;
}

@end

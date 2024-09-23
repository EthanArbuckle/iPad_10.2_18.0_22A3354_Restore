@implementation CLKeychainItemWrapper

- (CLKeychainItemWrapper)initWithIdentifier:(id)a3 keyType:(__CFString *)a4
{
  CLKeychainItemWrapper *v6;
  NSObject *v7;
  id v8;
  NSMutableDictionary *v9;
  OSStatus v10;
  OSStatus v11;
  NSMutableDictionary *v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  NSObject *v16;
  NSObject *v17;
  CFTypeRef result[2];
  objc_super v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  __CFString *v28;

  v20.receiver = self;
  v20.super_class = (Class)CLKeychainItemWrapper;
  v6 = -[CLKeychainItemWrapper init](&v20, "init");
  if (v6)
  {
    if (a3)
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102142E50);
      v7 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
      {
        v8 = objc_msgSend(a3, "UTF8String");
        *(_DWORD *)buf = 68289539;
        v22 = 0;
        v23 = 2082;
        v24 = "";
        v25 = 2081;
        v26 = v8;
        v27 = 2113;
        v28 = a4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Initializing CLKeychainItemWrapper with identifier and key.\", \"identifier\":%{private, location:escape_only}s, \"key\":%{private, location:escape_only}@}", buf, 0x26u);
      }
      v9 = objc_opt_new(NSMutableDictionary);
      v6->_genericPasswordQuery = v9;
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", kSecClassGenericPassword, kSecClass);
      -[NSMutableDictionary setObject:forKey:](v6->_genericPasswordQuery, "setObject:forKey:", a3, a4);
      -[NSMutableDictionary setObject:forKey:](v6->_genericPasswordQuery, "setObject:forKey:", kSecMatchLimitOne, kSecMatchLimit);
      -[NSMutableDictionary setObject:forKey:](v6->_genericPasswordQuery, "setObject:forKey:", kCFBooleanTrue, kSecReturnAttributes);
      result[0] = 0;
      v10 = SecItemCopyMatching((CFDictionaryRef)v6->_genericPasswordQuery, result);
      if (v10 == -25300)
        goto LABEL_20;
      v11 = v10;
      if (!v10)
      {
        v12 = (NSMutableDictionary *)-[CLKeychainItemWrapper secItemFormatToDictionary:](v6, "secItemFormatToDictionary:", result[0]);
        if (v12)
        {
          v6->_keychainItemData = v12;
LABEL_21:

          return v6;
        }
LABEL_20:
        -[CLKeychainItemWrapper initializeKeychainItemWithIdentifier:keyType:](v6, "initializeKeychainItemWithIdentifier:keyType:", a3, a4);
        goto LABEL_21;
      }
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102142E50);
      v16 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289282;
        v22 = 0;
        v23 = 2082;
        v24 = "";
        v25 = 1026;
        LODWORD(v26) = v11;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Initial query to CLKeychainItemWrapper failed\", \"error\":%{public}d}", buf, 0x18u);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102142E50);
      }
      v17 = qword_1022A01D8;
      if (os_signpost_enabled((os_log_t)qword_1022A01D8))
      {
        *(_DWORD *)buf = 68289282;
        v22 = 0;
        v23 = 2082;
        v24 = "";
        v25 = 1026;
        LODWORD(v26) = v11;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Initial query to CLKeychainItemWrapper failed", "{\"msg%{public}.0s\":\"Initial query to CLKeychainItemWrapper failed\", \"error\":%{public}d}", buf, 0x18u);
      }

    }
    else
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102142E50);
      v13 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "nil identifier given to CLKeychainItemWrapper", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102142E50);
        LOWORD(result[0]) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 17, "nil identifier given to CLKeychainItemWrapper", result, 2);
        v15 = (uint8_t *)v14;
        sub_100512490("Generic", 1, 0, 0, "-[CLKeychainItemWrapper initWithIdentifier:keyType:]", "%s\n", v14);
        if (v15 != buf)
          free(v15);
      }
    }

    return 0;
  }
  return v6;
}

- (CLKeychainItemWrapper)initWithIdentifier:(id)a3
{
  return -[CLKeychainItemWrapper initWithIdentifier:keyType:](self, "initWithIdentifier:keyType:", a3, kSecAttrGeneric);
}

- (void)dealloc
{
  objc_super v3;

  self->_keychainItemData = 0;
  self->_genericPasswordQuery = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLKeychainItemWrapper;
  -[CLKeychainItemWrapper dealloc](&v3, "dealloc");
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    if ((objc_msgSend(-[CLKeychainItemWrapper objectForKey:](self, "objectForKey:", a4), "isEqual:", a3) & 1) == 0)
    {
      -[NSMutableDictionary setObject:forKey:](-[CLKeychainItemWrapper keychainItemData](self, "keychainItemData"), "setObject:forKey:", a3, a4);
      -[CLKeychainItemWrapper writeToKeychain](self, "writeToKeychain");
    }
  }
}

- (id)objectForKey:(id)a3
{
  return -[NSMutableDictionary objectForKey:](-[CLKeychainItemWrapper keychainItemData](self, "keychainItemData"), "objectForKey:", a3);
}

- (void)initializeKeychainItemWithIdentifier:(id)a3 keyType:(__CFString *)a4
{
  -[CLKeychainItemWrapper resetKeychainItem](self, "resetKeychainItem");
  -[NSMutableDictionary setObject:forKey:](self->_keychainItemData, "setObject:forKey:", a3, a4);
}

- (void)resetKeychainItem
{
  if (-[CLKeychainItemWrapper keychainItemData](self, "keychainItemData"))
  {
    SecItemDelete((CFDictionaryRef)-[CLKeychainItemWrapper dictionaryToSecItemFormat:](self, "dictionaryToSecItemFormat:", -[CLKeychainItemWrapper keychainItemData](self, "keychainItemData")));
    -[NSMutableDictionary removeAllObjects](-[CLKeychainItemWrapper keychainItemData](self, "keychainItemData"), "removeAllObjects");
  }
  else
  {
    -[CLKeychainItemWrapper setKeychainItemData:](self, "setKeychainItemData:", objc_opt_new(NSMutableDictionary));
  }
  -[NSMutableDictionary setObject:forKey:](-[CLKeychainItemWrapper keychainItemData](self, "keychainItemData"), "setObject:forKey:", CFSTR("com.apple.locationd"), kSecAttrService);
  -[NSMutableDictionary setObject:forKey:](-[CLKeychainItemWrapper keychainItemData](self, "keychainItemData"), "setObject:forKey:", &stru_1021D8FB8, kSecValueData);
}

- (id)dictionaryToSecItemFormat:(id)a3
{
  NSMutableDictionary *v4;
  id v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint8_t *v10;
  _QWORD v11[2];
  uint8_t buf[1640];

  if (!a3)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102142E50);
    v6 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "nil dictionary passed for converstion", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102142E50);
    LOWORD(v11[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 17, "nil dictionary passed for converstion", v11, 2, v11[0]);
    goto LABEL_22;
  }
  v4 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:");
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", kSecClassGenericPassword, kSecClass);
  v5 = objc_msgSend(a3, "objectForKey:", kSecValueData);
  if (!v5)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102142E50);
    v8 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "Conversion of dictionary without kSecValueData key requested.", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102142E50);
    LOWORD(v11[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 17, "Conversion of dictionary without kSecValueData key requested.", v11, 2, v11[0]);
LABEL_22:
    v10 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 0, "-[CLKeychainItemWrapper dictionaryToSecItemFormat:]", "%s\n", v7);
    if (v10 != buf)
      free(v10);
    return 0;
  }
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", objc_msgSend(v5, "dataUsingEncoding:", 4), kSecValueData);
  return v4;
}

- (id)secItemFormatToDictionary:(id)a3
{
  NSMutableDictionary *v3;
  OSStatus v4;
  OSStatus v5;
  id v6;
  id v7;
  NSObject *v8;
  double v9;
  uint8_t *v10;
  uint8_t *v11;
  NSObject *v12;
  double v13;
  uint8_t *v14;
  NSObject *v15;
  NSObject *v16;
  __int16 v18[8];
  CFTypeRef result[2];
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  OSStatus v25;

  if (!a3)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102142E50);
    v8 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "nil dictionary passed for retrieving keychain item", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102142E50);
    LOWORD(result[0]) = 0;
    v9 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 16, "nil dictionary passed for retrieving keychain item", result, 2);
    v11 = v10;
    sub_100512490("Generic", 1, 0, 0, "-[CLKeychainItemWrapper secItemFormatToDictionary:]", "%s\n", v9);
LABEL_21:
    if (v11 != buf)
      free(v11);
    return 0;
  }
  v3 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:");
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", kCFBooleanTrue, kSecReturnData);
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", kSecClassGenericPassword, kSecClass);
  result[0] = 0;
  v4 = SecItemCopyMatching((CFDictionaryRef)v3, result);
  if (v4 == -25300)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102142E50);
    v12 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Expected keychain item not found.", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 2))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102142E50);
    v18[0] = 0;
    v13 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 1, "Expected keychain item not found.", v18, 2);
    v11 = v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLKeychainItemWrapper secItemFormatToDictionary:]", "%s\n", v13);
    goto LABEL_21;
  }
  v5 = v4;
  if (v4)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102142E50);
    v15 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 1026;
      v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unable to retrieve keychain item\", \"error\":%{public}d}", buf, 0x18u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102142E50);
    }
    v16 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      *(_DWORD *)buf = 68289282;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 1026;
      v25 = v5;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unable to retrieve keychain item", "{\"msg%{public}.0s\":\"Unable to retrieve keychain item\", \"error\":%{public}d}", buf, 0x18u);
    }
    return 0;
  }
  -[NSMutableDictionary removeObjectForKey:](v3, "removeObjectForKey:", kSecReturnData);
  v6 = objc_alloc((Class)NSString);
  v7 = objc_msgSend(v6, "initWithData:encoding:", result[0], 4);
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v7, kSecValueData);

  return v3;
}

- (void)writeToKeychain
{
  OSStatus v3;
  OSStatus v4;
  NSMutableDictionary *v5;
  id v6;
  OSStatus v7;
  OSStatus v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  OSStatus v13;
  OSStatus v14;
  NSObject *v15;
  NSObject *v16;
  CFTypeRef result;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  OSStatus v23;

  result = 0;
  v3 = SecItemCopyMatching((CFDictionaryRef)-[CLKeychainItemWrapper genericPasswordQuery](self, "genericPasswordQuery"), &result);
  if (v3 == -25300)
  {
    v13 = SecItemAdd((CFDictionaryRef)-[CLKeychainItemWrapper dictionaryToSecItemFormat:](self, "dictionaryToSecItemFormat:", -[CLKeychainItemWrapper keychainItemData](self, "keychainItemData")), 0);
    if (v13)
    {
      v14 = v13;
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102142E50);
      v15 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289282;
        v19 = 0;
        v20 = 2082;
        v21 = "";
        v22 = 1026;
        v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Couldn't add the Keychain Item\", \"error\":%{public}d}", buf, 0x18u);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102142E50);
      }
      v10 = qword_1022A01D8;
      if (os_signpost_enabled((os_log_t)qword_1022A01D8))
      {
        *(_DWORD *)buf = 68289282;
        v19 = 0;
        v20 = 2082;
        v21 = "";
        v22 = 1026;
        v23 = v14;
        v11 = "Couldn't add the Keychain Item";
        v12 = "{\"msg%{public}.0s\":\"Couldn't add the Keychain Item\", \"error\":%{public}d}";
        goto LABEL_26;
      }
    }
  }
  else
  {
    v4 = v3;
    if (v3)
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102142E50);
      v16 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289282;
        v19 = 0;
        v20 = 2082;
        v21 = "";
        v22 = 1026;
        v23 = v4;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Couldn't query for the Keychain Item to add\", \"error\":%{public}d}", buf, 0x18u);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102142E50);
      }
      v10 = qword_1022A01D8;
      if (os_signpost_enabled((os_log_t)qword_1022A01D8))
      {
        *(_DWORD *)buf = 68289282;
        v19 = 0;
        v20 = 2082;
        v21 = "";
        v22 = 1026;
        v23 = v4;
        v11 = "Couldn't query for the Keychain Item to add";
        v12 = "{\"msg%{public}.0s\":\"Couldn't query for the Keychain Item to add\", \"error\":%{public}d}";
        goto LABEL_26;
      }
    }
    else
    {
      v5 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", result);
      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", -[NSMutableDictionary objectForKey:](-[CLKeychainItemWrapper genericPasswordQuery](self, "genericPasswordQuery"), "objectForKey:", kSecClass), kSecClass);
      v6 = -[CLKeychainItemWrapper dictionaryToSecItemFormat:](self, "dictionaryToSecItemFormat:", -[CLKeychainItemWrapper keychainItemData](self, "keychainItemData"));
      objc_msgSend(v6, "removeObjectForKey:", kSecClass);
      v7 = SecItemUpdate((CFDictionaryRef)v5, (CFDictionaryRef)v6);
      if (v7)
      {
        v8 = v7;
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102142E50);
        v9 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 68289282;
          v19 = 0;
          v20 = 2082;
          v21 = "";
          v22 = 1026;
          v23 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Couldn't update the Keychain Item\", \"error\":%{public}d}", buf, 0x18u);
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_102142E50);
        }
        v10 = qword_1022A01D8;
        if (os_signpost_enabled((os_log_t)qword_1022A01D8))
        {
          *(_DWORD *)buf = 68289282;
          v19 = 0;
          v20 = 2082;
          v21 = "";
          v22 = 1026;
          v23 = v8;
          v11 = "Couldn't update the Keychain Item";
          v12 = "{\"msg%{public}.0s\":\"Couldn't update the Keychain Item\", \"error\":%{public}d}";
LABEL_26:
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v11, v12, buf, 0x18u);
        }
      }
    }
  }

}

- (NSMutableDictionary)keychainItemData
{
  return self->_keychainItemData;
}

- (void)setKeychainItemData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSMutableDictionary)genericPasswordQuery
{
  return self->_genericPasswordQuery;
}

- (void)setGenericPasswordQuery:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end

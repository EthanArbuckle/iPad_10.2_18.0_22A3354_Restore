@implementation WiFiLocaleManagerUser

- (unsigned)suspendLocaleCheck
{
  NSObject *v3;
  BOOL v4;
  unsigned __int8 v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = sub_100031A60((uint64_t)self->_manager);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (self->_manager)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100030EE0;
    v7[3] = &unk_100232588;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(v3, v7);
    v5 = *((_BYTE *)v9 + 24);
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)getDeviceCountryCode
{
  NSObject *v3;
  id v4;
  void *v6;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = sub_100031A60((uint64_t)self->_manager);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = sub_10002FB18;
  v16 = sub_10002F9F0;
  v17 = (id)0xAAAAAAAAAAAAAAAALL;
  v17 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", &stru_100238178);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (self->_manager && v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100030EA0;
    block[3] = &unk_100233330;
    block[4] = self;
    block[5] = &v8;
    block[6] = &v12;
    dispatch_sync(v3, block);
    if (*((_BYTE *)v9 + 24))
    {
      if (!objc_msgSend((id)v13[5], "caseInsensitiveCompare:", CFSTR("XZ"))
        || !objc_msgSend((id)v13[5], "caseInsensitiveCompare:", CFSTR("X0"))
        || !objc_msgSend((id)v13[5], "caseInsensitiveCompare:", CFSTR("X2"))
        || !objc_msgSend((id)v13[5], "caseInsensitiveCompare:", CFSTR("X3")))
      {
        objc_msgSend((id)v13[5], "setString:", &stru_100238178);
      }
    }
    else
    {
      v6 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Error: Unable to get locale in use");
      objc_autoreleasePoolPop(v6);
    }
  }
  v4 = (id)v13[5];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v4;
}

- (void)update80211dCountryCodes:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = objc_msgSend(a3, "objectForKey:", CFSTR("scanResults"));
  if (objc_msgSend(v4, "count"))
  {
    -[NSCountedSet removeAllObjects](self->_countryCodeList, "removeAllObjects");
    self->_countryCodeIECount = 0;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "objectForKey:", CFSTR("80211D_IE")), "objectForKey:", CFSTR("IE_KEY_80211D_COUNTRY_CODE"));
        if (v9)
        {
          -[NSCountedSet addObject:](self->_countryCodeList, "addObject:", objc_msgSend(v9, "uppercaseString"));
          ++self->_countryCodeIECount;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
}

- (unsigned)setUserDefaultCountryCode:(id)a3
{
  NSObject *v5;
  __WiFiManager *manager;
  BOOL v7;
  _QWORD v9[6];

  v5 = sub_100031A60((uint64_t)self->_manager);
  manager = self->_manager;
  if (manager)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7 && sub_1000302BC((uint64_t)manager))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100008F98;
    v9[3] = &unk_10022EB70;
    v9[4] = a3;
    v9[5] = self;
    dispatch_sync(v5, v9);
  }
  return 1;
}

- (WiFiLocaleManagerUser)initWithContext:(__WiFiManager *)a3
{
  WiFiLocaleManagerUser *v4;
  WiFiLocaleManagerUser *v5;
  id v6;
  NSCountedSet *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WiFiLocaleManagerUser;
  v4 = -[WiFiLocaleManagerUser init](&v9, "init");
  v5 = v4;
  if (v4
    && (v4->_manager = a3,
        v6 = objc_alloc_init((Class)WiFiLocaleManager),
        (v5->_localeManager = (WiFiLocaleManager *)v6) != 0))
  {
    objc_msgSend(v6, "setDelegate:", v5);
    v7 = (NSCountedSet *)objc_msgSend(objc_alloc((Class)NSCountedSet), "initWithCapacity:", 0);
    v5->_countryCodeIECount = 0;
    v5->_peerCountryCode = 0;
    v5->_countryCodeList = v7;
  }
  else
  {

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->_countryCodeList = 0;
  self->_localeManager = 0;
  v3.receiver = self;
  v3.super_class = (Class)WiFiLocaleManagerUser;
  -[WiFiLocaleManagerUser dealloc](&v3, "dealloc");
}

- (void)determineAndSetLocale:(unsigned __int8)a3
{
  -[WiFiLocaleManager determineAndSetLocale:](self->_localeManager, "determineAndSetLocale:", a3);
}

- (int)getLocaleSource
{
  return -[WiFiLocaleManager getLocaleSource](self->_localeManager, "getLocaleSource");
}

- (double)getLocaleLastUpdatedTime
{
  double result;

  -[WiFiLocaleManager getLocaleLastUpdatedTime](self->_localeManager, "getLocaleLastUpdatedTime");
  return result;
}

- (id)getLocaleCountryCode
{
  return -[WiFiLocaleManager getLocaleCountryCode](self->_localeManager, "getLocaleCountryCode");
}

- (BOOL)isDefaultCountryCode:(id)a3
{
  return -[WiFiLocaleManager isDefaultCountryCode:](self->_localeManager, "isDefaultCountryCode:", a3);
}

- (void)updatePeerCountryCode:(id)a3
{
  unsigned int v5;
  BOOL v6;

  self->_peerCountryCode = (NSString *)objc_msgSend(a3, "copy");
  v5 = -[WiFiLocaleManager isDefaultCountryCode:](self->_localeManager, "isDefaultCountryCode:", -[WiFiLocaleManager getLocaleCountryCode](self->_localeManager, "getLocaleCountryCode"));
  if (self->_peerCountryCode)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6)
    -[WiFiLocaleManager determineAndSetLocale:](self->_localeManager, "determineAndSetLocale:", 1);
}

- (void)setLocaleTestParams:(id)a3
{
  -[WiFiLocaleManager setLocaleTestParams:](self->_localeManager, "setLocaleTestParams:", a3);
}

- (unsigned)setDeviceCountryCode:(id)a3
{
  NSObject *v5;
  unsigned __int8 v6;
  BOOL v7;
  unsigned __int8 v8;
  _QWORD v10[7];
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = sub_100031A60((uint64_t)self->_manager);
  v6 = -[WiFiLocaleManager isDefaultCountryCode:](self->_localeManager, "isDefaultCountryCode:", a3);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  if (self->_manager)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100168DFC;
    v10[3] = &unk_100233358;
    v10[5] = a3;
    v10[6] = &v12;
    v10[4] = self;
    v11 = v6 ^ 1;
    dispatch_sync(v5, v10);
    v8 = *((_BYTE *)v13 + 24);
  }
  _Block_object_dispose(&v12, 8);
  return v8;
}

- (id)getCompanionCountryCode
{
  NSObject *v3;
  id v4;
  void *v6;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = sub_100031A60((uint64_t)self->_manager);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = sub_10002FB18;
  v16 = sub_10002F9F0;
  v17 = (id)0xAAAAAAAAAAAAAAAALL;
  v17 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", &stru_100238178);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (self->_manager && v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100169038;
    block[3] = &unk_100233330;
    block[4] = self;
    block[5] = &v8;
    block[6] = &v12;
    dispatch_sync(v3, block);
    if (*((_BYTE *)v9 + 24))
    {
      if (!objc_msgSend((id)v13[5], "caseInsensitiveCompare:", CFSTR("XZ"))
        || !objc_msgSend((id)v13[5], "caseInsensitiveCompare:", CFSTR("X0"))
        || !objc_msgSend((id)v13[5], "caseInsensitiveCompare:", CFSTR("X2"))
        || !objc_msgSend((id)v13[5], "caseInsensitiveCompare:", CFSTR("X3")))
      {
        objc_msgSend((id)v13[5], "setString:", &stru_100238178);
      }
    }
    else
    {
      v6 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Error: Unable to get companion country code");
      objc_autoreleasePoolPop(v6);
    }
  }
  v4 = (id)v13[5];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v4;
}

- (id)get80211dCountryCodes:(unint64_t *)a3
{
  NSObject *v5;
  id v6;
  unint64_t v7;
  id v8;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  unint64_t v20;

  v5 = sub_100031A60((uint64_t)self->_manager);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = sub_10002FB18;
  v19 = sub_10002F9F0;
  v20 = 0xAAAAAAAAAAAAAAAALL;
  v6 = objc_msgSend(objc_alloc((Class)NSCountedSet), "initWithCapacity:", 0);
  v7 = 0;
  v20 = (unint64_t)v6;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (self->_manager && v5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001691C8;
    block[3] = &unk_100233330;
    block[4] = self;
    block[5] = &v15;
    block[6] = &v11;
    dispatch_sync(v5, block);
    v7 = v12[3];
  }
  *a3 = v7;
  v8 = (id)v16[5];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v8;
}

- (id)getPeerCountryCode
{
  return self->_peerCountryCode;
}

- (id)getCountryCodeFromUserDefaults
{
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = sub_100031A60((uint64_t)self->_manager);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = sub_10002FB18;
  v16 = sub_10002F9F0;
  v17 = (id)0xAAAAAAAAAAAAAAAALL;
  v17 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", &stru_100238178);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (self->_manager && v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10016943C;
    block[3] = &unk_100233330;
    block[4] = self;
    block[5] = &v8;
    block[6] = &v12;
    dispatch_sync(v3, block);
    if (*((_BYTE *)v9 + 24))
    {
      if (!objc_msgSend((id)v13[5], "caseInsensitiveCompare:", CFSTR("XZ"))
        || !objc_msgSend((id)v13[5], "caseInsensitiveCompare:", CFSTR("X0"))
        || !objc_msgSend((id)v13[5], "caseInsensitiveCompare:", CFSTR("X2"))
        || !objc_msgSend((id)v13[5], "caseInsensitiveCompare:", CFSTR("X3")))
      {
        objc_msgSend((id)v13[5], "setString:", &stru_100238178);
      }
      v4 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s WiFiCC : country code from user defaults [%@]", "-[WiFiLocaleManagerUser getCountryCodeFromUserDefaults]", v13[5]);
    }
    else
    {
      v4 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Error: Unable to get recently used country code");
    }
    objc_autoreleasePoolPop(v4);
  }
  v5 = (id)v13[5];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

@end

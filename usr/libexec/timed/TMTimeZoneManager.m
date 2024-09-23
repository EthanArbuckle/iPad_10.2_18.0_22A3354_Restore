@implementation TMTimeZoneManager

- (void)setSourceTimeZone:(id)a3
{
  NSObject *v5;
  id *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint8_t buf[4];
  TMTimeZoneManager *v11;
  __int16 v12;
  id v13;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TMTimeZoneManager.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tz"));
  v5 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  v6 = (id *)objc_msgSend(a3, "source");
  v7 = qword_100033720;
  if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(a3, "olsonName");
    *(_DWORD *)buf = 138412546;
    v11 = (TMTimeZoneManager *)v6;
    v12 = 2112;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "TZ,setSourceTimeZone,src,%@,tz,%@", buf, 0x16u);
  }
  if (!-[TMTimeZoneManager isSourceAvailable:](self, "isSourceAvailable:", v6))
  {
    v9 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
      sub_10001BBBC((uint64_t)v6, v9);
    -[NSMutableSet addObject:](self->availableSources, "addObject:", v6);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->inputs, "setObject:forKeyedSubscript:", a3, v6);
  sub_100011880((id *)&self->super.isa, v6);
}

- (void)reset:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  void *v8;

  v5 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);
  }
  v6 = qword_100033720;
  if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TZ,reset,reason,%@", (uint8_t *)&v7, 0xCu);
  }
  -[TMTimeZoneManager setCurrentTimeZone:](self, "setCurrentTimeZone:", 0);
  -[NSMutableDictionary removeAllObjects](self->inputs, "removeAllObjects");
  -[TMTimeZoneManagerDelegate timeZoneManager:didReset:](self->_delegate, "timeZoneManager:didReset:", self, a3);
}

- (void)dealloc
{
  objc_super v3;

  -[TMTimeZoneManager setCurrentTimeZone:](self, "setCurrentTimeZone:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TMTimeZoneManager;
  -[TMTimeZoneManager dealloc](&v3, "dealloc");
}

- (TMTimeZoneManager)initWithRules:(id)a3
{
  return -[TMTimeZoneManager initWithRules:delegate:](self, "initWithRules:delegate:", a3, 0);
}

- (TMTimeZoneManager)initWithRules:(id)a3 delegate:(id)a4
{
  TMTimeZoneManager *v6;
  TMTimeZoneManager *v7;
  id v8;
  id v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[4];
  id v14;

  v12.receiver = self;
  v12.super_class = (Class)TMTimeZoneManager;
  v6 = -[TMTimeZoneManager init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    v6->_delegate = (TMTimeZoneManagerDelegate *)a4;
    v8 = objc_msgSend(objc_msgSend(a3, "allKeys"), "sortedArrayUsingFunction:context:", sub_100011FCC, a3);
    v7->rules = (NSOrderedSet *)objc_msgSend(objc_alloc((Class)NSOrderedSet), "initWithArray:", v8);
    v9 = objc_msgSend(v8, "count");
    v7->availableSources = (NSMutableSet *)objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", v9);
    v7->inputs = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", v9);
    v10 = qword_100033720;
    if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "TZ,init,rules,%lu", buf, 0xCu);
    }
    -[TMTimeZoneManager reset:](v7, "reset:", CFSTR("init"));
  }
  return v7;
}

- (void)setSourceAvailable:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  uint8_t buf[4];
  void *v8;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TMTimeZoneManager.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source"));
  v5 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  v6 = qword_100033720;
  if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TZ,setSourceAvailable,src,%@", buf, 0xCu);
  }
  if ((-[NSMutableSet containsObject:](self->availableSources, "containsObject:", a3) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->availableSources, "addObject:", a3);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->inputs, "setObject:forKeyedSubscript:", 0, a3);
    if (objc_msgSend((id)sub_100011AF0((uint64_t)self), "isEqualToString:", a3))
      sub_100011774((id *)&self->super.isa, (id *)a3);
  }
}

- (void)setSourceUnavailable:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  unsigned int v7;
  id *v8;
  uint8_t buf[4];
  void *v10;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TMTimeZoneManager.m"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source"));
  v5 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  v6 = qword_100033720;
  if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TZ,setSourceUnavailable,src,%@", buf, 0xCu);
  }
  if (-[NSMutableSet containsObject:](self->availableSources, "containsObject:", a3))
  {
    v7 = objc_msgSend(a3, "isEqualToString:", sub_100011AF0((uint64_t)self));
    -[NSMutableSet removeObject:](self->availableSources, "removeObject:", a3);
    if (v7)
    {
      v8 = (id *)sub_100011AF0((uint64_t)self);
      if (v8)
        sub_100011774((id *)&self->super.isa, v8);
    }
  }
}

- (BOOL)isSourceAvailable:(id)a3
{
  unsigned int v5;
  NSObject *v6;
  uint8_t buf[4];
  id v9;
  __int16 v10;
  unsigned int v11;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TMTimeZoneManager.m"), 175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source"));
  v5 = -[NSMutableSet containsObject:](self->availableSources, "containsObject:", a3);
  v6 = qword_100033720;
  if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v9 = a3;
    v10 = 1024;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TZ,isSourceAvailable,src,%@,result,%d", buf, 0x12u);
  }
  return v5;
}

- (id)description
{
  id v3;
  objc_class *v4;
  id v5;
  NSOrderedSet *rules;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p {\n"), NSStringFromClass(v4), self);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  rules = self->rules;
  v7 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](rules, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(rules);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v12 = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->inputs, "objectForKeyedSubscript:", v11), "olsonName");
        v13 = -[NSMutableSet containsObject:](self->availableSources, "containsObject:", v11);
        v14 = objc_msgSend(v11, "UTF8String");
        if (v12)
          v15 = (const char *)objc_msgSend(v12, "UTF8String");
        else
          v15 = "--";
        objc_msgSend(v5, "appendFormat:", CFSTR("%18s %d %s,\n"), v14, v13, v15);
      }
      v8 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](rules, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("} = %@>"), -[TMTimeZoneManager currentTimeZone](self, "currentTimeZone"));
  return v5;
}

- (void)sendStateAnalytics
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  id v10;
  const char *v11;
  NSString *v12;
  const __CFString *v13;
  NSOrderedSet *obj;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->rules;
  v4 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v9 = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->inputs, "objectForKeyedSubscript:", v8), "olsonName");
        v10 = objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
        if (v9)
          v11 = (const char *)objc_msgSend(v9, "UTF8String");
        else
          v11 = "--";
        objc_msgSend(v3, "setValue:forKey:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11), v10);
      }
      v5 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }
  v12 = -[TMTimeZone olsonName](-[TMTimeZoneManager currentTimeZone](self, "currentTimeZone"), "olsonName");
  if (v12)
    v13 = (const __CFString *)v12;
  else
    v13 = CFSTR("--");
  objc_msgSend(v3, "setValue:forKey:", v13, CFSTR("TMComputed"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000129A0;
  v15[3] = &unk_100028F70;
  v15[4] = v3;
  AnalyticsSendEventLazy(CFSTR("com.apple.timed.tzSourceInputsAvailability"), v15);
}

- (TMTimeZone)currentTimeZone
{
  return (TMTimeZone *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentTimeZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (TMTimeZoneManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TMTimeZoneManagerDelegate *)a3;
}

@end

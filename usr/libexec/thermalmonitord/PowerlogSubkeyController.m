@implementation PowerlogSubkeyController

- (id)cacheArray
{
  id result;

  result = (id)qword_1000A1D30;
  if (!qword_1000A1D30)
  {
    result = objc_alloc_init((Class)NSMutableArray);
    qword_1000A1D30 = (uint64_t)result;
  }
  return result;
}

- (id)initForSubkey:(__CFString *)a3
{
  PowerlogSubkeyController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PowerlogSubkeyController;
  v4 = -[PowerlogSubkeyController init](&v6, "init");
  if (v4)
  {
    v4->_state = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v4->_stateLastLogged = 0;
    v4->_subkey = a3;
  }
  return v4;
}

- (void)setIntValue:(int)a3 forKey:(__CFString *)a4
{
  __CFDictionary *state;
  int valuePtr;

  valuePtr = a3;
  if (a4)
  {
    state = self->_state;
    if (state)
      sub_10000536C(state, a4, kCFNumberIntType, &valuePtr);
  }
}

- (void)logToPowerlog:(__CFString *)a3
{
  __CFDictionary *state;
  NSObject *v6;
  __CFString *subkey;
  __CFDictionary *stateLastLogged;
  NSObject *v9;
  __CFString *v10;
  __CFDictionary *v11;
  int v12;
  const char *v13;
  __int16 v14;
  __CFString *v15;
  __int16 v16;
  __CFDictionary *v17;

  if (self->_subkey)
  {
    state = self->_state;
    if (state)
    {
      if (CFDictionaryGetCount(state) >= 1)
      {
        if (self->_stateLastLogged
          && -[__CFDictionary isEqualToDictionary:](self->_state, "isEqualToDictionary:"))
        {
          if (byte_1000A2480)
          {
            v6 = qword_1000A28A0;
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
            {
              subkey = self->_subkey;
              v12 = 136315394;
              v13 = "-[PowerlogSubkeyController logToPowerlog:]";
              v14 = 2112;
              v15 = subkey;
              _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<Notice> %s: no change in subkey %@", (uint8_t *)&v12, 0x16u);
            }
          }
        }
        else if (PLShouldLogRegisteredEvent(18, self->_subkey))
        {
          stateLastLogged = self->_stateLastLogged;
          if (stateLastLogged)
            CFRelease(stateLastLogged);
          self->_stateLastLogged = CFDictionaryCreateCopy(kCFAllocatorDefault, self->_state);
          if (a3)
            CFDictionarySetValue(self->_state, CFSTR("Time"), a3);
          PLLogRegisteredEvent(18, self->_subkey, self->_state, 0);
          if (byte_1000A2480)
          {
            v9 = qword_1000A28A0;
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
            {
              v10 = self->_subkey;
              v11 = self->_state;
              v12 = 136315650;
              v13 = "-[PowerlogSubkeyController logToPowerlog:]";
              v14 = 2112;
              v15 = v10;
              v16 = 2112;
              v17 = v11;
              _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> %s: logged subkey %@, dict %@", (uint8_t *)&v12, 0x20u);
            }
          }
          CFDictionaryRemoveValue(self->_state, CFSTR("Time"));
        }
      }
    }
  }
}

- (void)printPowerLogDictionary
{
  NSObject *v3;
  __CFDictionary *state;
  int v5;
  __CFDictionary *v6;

  if (byte_1000A2480)
  {
    v3 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      state = self->_state;
      v5 = 138412290;
      v6 = state;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "<Notice> %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)logToPowerlogLite
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  __CFString *subkey;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[3];
  _QWORD v16[3];
  uint8_t v17[128];
  uint8_t buf[4];
  __CFString *v19;

  if (PLShouldLogRegisteredEvent(18, self->_subkey))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = -[PowerlogSubkeyController cacheArray](self, "cacheArray", 0);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7);
          if (v8)
          {
            v15[0] = CFSTR("Time");
            v16[0] = objc_msgSend(v8, "objectAtIndex:", 0);
            v15[1] = CFSTR("thermalLevel");
            v16[1] = objc_msgSend(v8, "objectAtIndex:", 1);
            v15[2] = CFSTR("pressureLevel");
            v16[2] = objc_msgSend(v8, "objectAtIndex:", 2);
            PLLogRegisteredEvent(18, self->_subkey, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3), 0);
          }
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
      }
      while (v5);
    }
    objc_msgSend(-[PowerlogSubkeyController cacheArray](self, "cacheArray"), "removeAllObjects");
  }
  else if (byte_1000A2480)
  {
    v9 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      subkey = self->_subkey;
      *(_DWORD *)buf = 138412290;
      v19 = subkey;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> Denied to log to lite mode powerlog %@", buf, 0xCu);
    }
  }
}

- (void)logHIPStatusToPowerlogLite:(id)a3
{
  NSObject *v5;
  uint8_t v6[8];
  _QWORD v7[3];
  _QWORD v8[3];

  if (PLShouldLogRegisteredEvent(18, self->_subkey))
  {
    v7[0] = CFSTR("Time");
    v8[0] = objc_msgSend(a3, "objectAtIndex:", 0);
    v7[1] = CFSTR("status");
    v8[1] = objc_msgSend(a3, "objectAtIndex:", 1);
    v7[2] = CFSTR("client");
    v8[2] = objc_msgSend(a3, "objectAtIndex:", 2);
    PLLogRegisteredEvent(18, self->_subkey, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 3), 0);
  }
  else if (byte_1000A2480)
  {
    v5 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Denied to log to lite mode powerlog", v6, 2u);
    }
  }
}

@end

@implementation HTPrefs

- (NSArray)prefContextPrefixPriorityOrder
{
  if (qword_100080198 != -1)
    dispatch_once(&qword_100080198, &stru_100075B78);
  return (NSArray *)(id)qword_1000801A0;
}

- (id)prefNamed:(__CFString *)a3 domain:(__CFString *)a4 profile:(id)a5 matchingSelector:(SEL)a6 contextPrefixOut:(id *)a7
{
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  __CFString *v14;
  unsigned int v15;
  __CFString *v16;
  __CFString *v17;
  CFPropertyListRef v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  const __CFString *v24;
  id v26;
  NSObject *obj;
  __CFString *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const __CFString *v35;
  __int16 v36;
  __CFString *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];

  v26 = a5;
  v29 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = objc_claimAutoreleasedReturnValue(-[HTPrefs prefContextPrefixPriorityOrder](self, "prefContextPrefixPriorityOrder"));
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(obj);
        v14 = *(__CFString **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v15 = -[__CFString isEqualToString:](v14, "isEqualToString:", &stru_100075D60);
        if (v15)
          v16 = v29;
        else
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v14, v29));
        v17 = v16;
        if (-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("HTProfile")))
          v18 = (CFPropertyListRef)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v17));
        else
          v18 = CFPreferencesCopyValue(v17, a4, CFSTR("mobile"), kCFPreferencesAnyHost);
        v19 = (void *)v18;
        if (v18 && (objc_opt_respondsToSelector(v18, a6) & 1) != 0)
        {
          v21 = sub_10001D38C();
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v24 = CFSTR("<base context>");
            *(_DWORD *)buf = 138412802;
            if (!v15)
              v24 = v14;
            v35 = v24;
            v36 = 2112;
            v37 = v29;
            v38 = 2112;
            v39 = v19;
            _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "HTPrefs: Overriden by %@: %@ = %@", buf, 0x20u);
          }

          if (a7)
            *a7 = objc_retainAutorelease(v14);

          goto LABEL_25;
        }
        if (a7)
          *a7 = 0;

      }
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      if (v11)
        continue;
      break;
    }
  }

  v20 = sub_10001D38C();
  obj = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
    sub_100038760((uint64_t)v29, (uint64_t)a4, obj);
  v19 = 0;
LABEL_25:

  return v19;
}

- (id)getHighestPrioritySettingValue:(id)a3 matchingSelector:(SEL)a4 contextPrefixOut:(id *)a5
{
  return -[HTPrefs prefNamed:domain:profile:matchingSelector:contextPrefixOut:](self, "prefNamed:domain:profile:matchingSelector:contextPrefixOut:", a3, self->__htTaskingDomain, self->__installedHTProfileDict, a4, a5);
}

- (BOOL)BOOLProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4
{
  uint64_t v4;
  unsigned __int8 v5;
  void *v6;

  v4 = 16;
  if (!self->_isInternal)
    v4 = 24;
  v5 = *((_BYTE *)&a3->var0 + v4) != 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HTPrefs prefNamed:domain:profile:matchingSelector:contextPrefixOut:](self, "prefNamed:domain:profile:matchingSelector:contextPrefixOut:", a3->var0, self->__htTaskingDomain, self->__installedHTProfileDict, "BOOLValue", a4));
  if ((objc_opt_respondsToSelector(v6, "BOOLValue") & 1) != 0)
    v5 = objc_msgSend(v6, "BOOLValue");

  return v5;
}

- (int)intProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4
{
  uint64_t v5;
  int v6;
  void *v7;
  unsigned int v8;
  int v9;
  id v10;
  NSObject *v11;
  __CFString *var0;
  unint64_t var4;
  int v15;
  __CFString *v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  int v20;

  v5 = 16;
  if (!self->_isInternal)
    v5 = 24;
  v6 = *(_DWORD *)((char *)&a3->var0 + v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HTPrefs prefNamed:domain:profile:matchingSelector:contextPrefixOut:](self, "prefNamed:domain:profile:matchingSelector:contextPrefixOut:", a3->var0, self->__htTaskingDomain, self->__installedHTProfileDict, "intValue", a4));
  if ((objc_opt_respondsToSelector(v7, "intValue") & 1) == 0)
    goto LABEL_9;
  v8 = objc_msgSend(v7, "intValue");
  v9 = v8;
  if ((a3->var4 & 1) != 0 && !v8)
  {
    v10 = sub_10001D38C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      var0 = a3->var0;
      var4 = a3->var4;
      v15 = 138412802;
      v16 = var0;
      v17 = 2048;
      v18 = var4;
      v19 = 1024;
      v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "HTPrefs: %@ failed policy check (%lu) for value %d", (uint8_t *)&v15, 0x1Cu);
    }

LABEL_9:
    v9 = v6;
  }

  return v9;
}

- (unsigned)unsignedIntProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4
{
  uint64_t v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  __CFString *var0;
  unint64_t var4;
  int v15;
  __CFString *v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  int v20;

  v5 = 16;
  if (!self->_isInternal)
    v5 = 24;
  v6 = *(_DWORD *)((char *)&a3->var0 + v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HTPrefs prefNamed:domain:profile:matchingSelector:contextPrefixOut:](self, "prefNamed:domain:profile:matchingSelector:contextPrefixOut:", a3->var0, self->__htTaskingDomain, self->__installedHTProfileDict, "unsignedIntValue", a4));
  if ((objc_opt_respondsToSelector(v7, "unsignedIntValue") & 1) == 0)
    goto LABEL_9;
  v8 = objc_msgSend(v7, "unsignedIntValue");
  v9 = v8;
  if ((a3->var4 & 1) != 0 && !v8)
  {
    v10 = sub_10001D38C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      var0 = a3->var0;
      var4 = a3->var4;
      v15 = 138412802;
      v16 = var0;
      v17 = 2048;
      v18 = var4;
      v19 = 1024;
      v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "HTPrefs: %@ failed policy check (%lu) for value %u", (uint8_t *)&v15, 0x1Cu);
    }

LABEL_9:
    v9 = v6;
  }

  return v9;
}

- (unint64_t)unsignedLongProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4
{
  uint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;
  unint64_t v9;
  id v10;
  NSObject *v11;
  __CFString *var0;
  unint64_t var4;
  int v15;
  __CFString *v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  uint64_t v20;

  v5 = 16;
  if (!self->_isInternal)
    v5 = 24;
  v6 = *(unint64_t *)((char *)&a3->var0 + v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HTPrefs prefNamed:domain:profile:matchingSelector:contextPrefixOut:](self, "prefNamed:domain:profile:matchingSelector:contextPrefixOut:", a3->var0, self->__htTaskingDomain, self->__installedHTProfileDict, "unsignedLongValue", a4));
  if ((objc_opt_respondsToSelector(v7, "unsignedLongValue") & 1) == 0)
    goto LABEL_9;
  v8 = objc_msgSend(v7, "unsignedLongValue");
  v9 = (unint64_t)v8;
  if ((a3->var4 & 1) != 0 && !v8)
  {
    v10 = sub_10001D38C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      var0 = a3->var0;
      var4 = a3->var4;
      v15 = 138412802;
      v16 = var0;
      v17 = 2048;
      v18 = var4;
      v19 = 2048;
      v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "HTPrefs: %@ failed policy check (%lu) for value %lu", (uint8_t *)&v15, 0x20u);
    }

LABEL_9:
    v9 = v6;
  }

  return v9;
}

- (unint64_t)unsignedLongLongProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4
{
  uint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;
  unint64_t v9;
  id v10;
  NSObject *v11;
  __CFString *var0;
  unint64_t var4;
  int v15;
  __CFString *v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  uint64_t v20;

  v5 = 16;
  if (!self->_isInternal)
    v5 = 24;
  v6 = *(unint64_t *)((char *)&a3->var0 + v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HTPrefs prefNamed:domain:profile:matchingSelector:contextPrefixOut:](self, "prefNamed:domain:profile:matchingSelector:contextPrefixOut:", a3->var0, self->__htTaskingDomain, self->__installedHTProfileDict, "unsignedLongLongValue", a4));
  if ((objc_opt_respondsToSelector(v7, "unsignedLongLongValue") & 1) == 0)
    goto LABEL_9;
  v8 = objc_msgSend(v7, "unsignedLongLongValue");
  v9 = (unint64_t)v8;
  if ((a3->var4 & 1) != 0 && !v8)
  {
    v10 = sub_10001D38C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      var0 = a3->var0;
      var4 = a3->var4;
      v15 = 138412802;
      v16 = var0;
      v17 = 2048;
      v18 = var4;
      v19 = 2048;
      v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "HTPrefs: %@ failed policy check (%lu) for value %llu", (uint8_t *)&v15, 0x20u);
    }

LABEL_9:
    v9 = v6;
  }

  return v9;
}

- (double)doubleProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4
{
  uint64_t v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  NSObject *v11;
  __CFString *var0;
  unint64_t var4;
  int v15;
  __CFString *v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  double v20;

  v5 = 16;
  if (!self->_isInternal)
    v5 = 24;
  v6 = *(double *)((char *)&a3->var0 + v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HTPrefs prefNamed:domain:profile:matchingSelector:contextPrefixOut:](self, "prefNamed:domain:profile:matchingSelector:contextPrefixOut:", a3->var0, self->__htTaskingDomain, self->__installedHTProfileDict, "doubleValue", a4));
  if ((objc_opt_respondsToSelector(v7, "doubleValue") & 1) != 0)
  {
    objc_msgSend(v7, "doubleValue");
    v9 = v8;
    if ((a3->var4 & 2) != 0 && v8 < v6)
    {
      v10 = sub_10001D38C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        var0 = a3->var0;
        var4 = a3->var4;
        v15 = 138412802;
        v16 = var0;
        v17 = 2048;
        v18 = var4;
        v19 = 2048;
        v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "HTPrefs: %@ failed policy check (%lu) for value %f", (uint8_t *)&v15, 0x20u);
      }

    }
    else
    {
      v6 = v8;
    }
  }

  return v6;
}

- (id)stringProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4
{
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v13;
  NSObject *v14;
  __CFString *var0;
  unint64_t var4;
  int v17;
  __CFString *v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  void *v22;

  v7 = 16;
  if (!self->_isInternal)
    v7 = 24;
  v8 = *(id *)((char *)&a3->var0 + v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HTPrefs prefNamed:domain:profile:matchingSelector:contextPrefixOut:](self, "prefNamed:domain:profile:matchingSelector:contextPrefixOut:", a3->var0, self->__htTaskingDomain, self->__installedHTProfileDict, "isEqualToString:", a4));
  v10 = v9;
  if (v9)
  {
    if ((a3->var4 & 4) != 0 && !objc_msgSend(v9, "length"))
    {
      v13 = sub_10001D38C();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        var0 = a3->var0;
        var4 = a3->var4;
        v17 = 138412802;
        v18 = var0;
        v19 = 2048;
        v20 = var4;
        v21 = 2112;
        v22 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "HTPrefs: %@ failed policy check (%lu) for value %@", (uint8_t *)&v17, 0x20u);
      }

    }
    else
    {
      v11 = v10;

      v8 = v11;
    }
  }

  return v8;
}

- (id)objectProperty:(HTPrefInit *)a3 matchingSelector:(SEL)a4 contextPrefixOut:(id *)a5
{
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v9 = 16;
  if (!self->_isInternal)
    v9 = 24;
  v10 = *(id *)((char *)&a3->var0 + v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HTPrefs prefNamed:domain:profile:matchingSelector:contextPrefixOut:](self, "prefNamed:domain:profile:matchingSelector:contextPrefixOut:", a3->var0, self->__htTaskingDomain, self->__installedHTProfileDict, a4, a5));
  v12 = v11;
  if (v11)
  {
    v13 = v11;

    v10 = v13;
  }

  return v10;
}

- (void)initBoolProperty:(HTPrefInit *)a3
{
  int v5;
  unsigned int v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  __CFString *var0;
  int v11;
  __CFString *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  unsigned int v16;

  v5 = *(unsigned __int8 *)a3->var1;
  v6 = -[HTPrefs BOOLProperty:contextPrefixOut:](self, "BOOLProperty:contextPrefixOut:");
  if (v5 != v6)
  {
    v7 = v6;
    v8 = sub_10001D38C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      v11 = 138412802;
      v12 = var0;
      v13 = 1024;
      v14 = v5;
      v15 = 1024;
      v16 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %{BOOL}d -> %{BOOL}d", (uint8_t *)&v11, 0x18u);
    }

    *(_BYTE *)a3->var1 = v7;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1);
  }
}

- (void)initIntProperty:(HTPrefInit *)a3
{
  int v5;
  unsigned int v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  __CFString *var0;
  int v11;
  __CFString *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  unsigned int v16;

  v5 = *(_DWORD *)a3->var1;
  v6 = -[HTPrefs intProperty:contextPrefixOut:](self, "intProperty:contextPrefixOut:");
  if (v5 != v6)
  {
    v7 = v6;
    v8 = sub_10001D38C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      v11 = 138412802;
      v12 = var0;
      v13 = 1024;
      v14 = v5;
      v15 = 1024;
      v16 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %d -> %d", (uint8_t *)&v11, 0x18u);
    }

    *(_DWORD *)a3->var1 = v7;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1);
  }
}

- (void)initUnsignedIntProperty:(HTPrefInit *)a3
{
  int v5;
  unsigned int v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  __CFString *var0;
  int v11;
  __CFString *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  unsigned int v16;

  v5 = *(_DWORD *)a3->var1;
  v6 = -[HTPrefs unsignedIntProperty:contextPrefixOut:](self, "unsignedIntProperty:contextPrefixOut:");
  if (v5 != v6)
  {
    v7 = v6;
    v8 = sub_10001D38C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      v11 = 138412802;
      v12 = var0;
      v13 = 1024;
      v14 = v5;
      v15 = 1024;
      v16 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %u -> %u", (uint8_t *)&v11, 0x18u);
    }

    *(_DWORD *)a3->var1 = v7;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1);
  }
}

- (void)initUnsignedLongProperty:(HTPrefInit *)a3
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *var0;
  int v11;
  __CFString *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  unint64_t v16;

  v5 = *(_QWORD *)a3->var1;
  v6 = -[HTPrefs unsignedLongProperty:contextPrefixOut:](self, "unsignedLongProperty:contextPrefixOut:");
  if (v5 != v6)
  {
    v7 = v6;
    v8 = sub_10001D38C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      v11 = 138412802;
      v12 = var0;
      v13 = 2048;
      v14 = v5;
      v15 = 2048;
      v16 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %lu -> %lu", (uint8_t *)&v11, 0x20u);
    }

    *(_QWORD *)a3->var1 = v7;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1);
  }
}

- (void)initUnsignedLongLongProperty:(HTPrefInit *)a3
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *var0;
  int v11;
  __CFString *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  unint64_t v16;

  v5 = *(_QWORD *)a3->var1;
  v6 = -[HTPrefs unsignedLongProperty:contextPrefixOut:](self, "unsignedLongProperty:contextPrefixOut:");
  if (v5 != v6)
  {
    v7 = v6;
    v8 = sub_10001D38C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      v11 = 138412802;
      v12 = var0;
      v13 = 2048;
      v14 = v5;
      v15 = 2048;
      v16 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %llu -> %llu", (uint8_t *)&v11, 0x20u);
    }

    *(_QWORD *)a3->var1 = v7;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1);
  }
}

- (void)initDoubleProperty:(HTPrefInit *)a3
{
  double v5;
  double v6;
  double v7;
  id v8;
  NSObject *v9;
  __CFString *var0;
  int v11;
  __CFString *v12;
  __int16 v13;
  double v14;
  __int16 v15;
  double v16;

  v5 = *(double *)a3->var1;
  -[HTPrefs doubleProperty:contextPrefixOut:](self, "doubleProperty:contextPrefixOut:");
  if (v5 != v6)
  {
    v7 = v6;
    v8 = sub_10001D38C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      v11 = 138412802;
      v12 = var0;
      v13 = 2048;
      v14 = v5;
      v15 = 2048;
      v16 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %f -> %f", (uint8_t *)&v11, 0x20u);
    }

    *(double *)a3->var1 = v7;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1);
  }
}

- (void)initNSStringProperty:(HTPrefInit *)a3
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void **var1;
  void *v11;
  __CFString *var0;
  int v13;
  __CFString *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;

  v5 = *(id *)a3->var1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HTPrefs stringProperty:contextPrefixOut:](self, "stringProperty:contextPrefixOut:", a3, 0));
  if ((objc_msgSend(v6, "isEqualToString:", v5) & 1) == 0)
  {
    v7 = sub_10001D38C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      v13 = 138412802;
      v14 = var0;
      v15 = 2112;
      v16 = v5;
      v17 = 2112;
      v18 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %@ -> %@", (uint8_t *)&v13, 0x20u);
    }

    v9 = objc_claimAutoreleasedReturnValue(-[HTPrefs stringProperty:contextPrefixOut:](self, "stringProperty:contextPrefixOut:", a3, 0));
    var1 = (void **)a3->var1;
    v11 = *var1;
    *var1 = (void *)v9;

    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1);
  }

}

- (void)initNSObjectProperty:(HTPrefInit *)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void **var1;
  void *v13;
  __CFString *var0;
  int v15;
  __CFString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;

  v5 = *(id *)a3->var1;
  v6 = objc_claimAutoreleasedReturnValue(-[HTPrefs objectProperty:matchingSelector:contextPrefixOut:](self, "objectProperty:matchingSelector:contextPrefixOut:", a3, "isEqual:", 0));
  v7 = (void *)v6;
  if ((v5 == 0) == (v6 != 0)
    || (v5 ? (v8 = v6 == 0) : (v8 = 1), !v8 && (objc_msgSend(v5, "isEqual:", v6) & 1) == 0))
  {
    v9 = sub_10001D38C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      v15 = 138412802;
      v16 = var0;
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %@ -> %@", (uint8_t *)&v15, 0x20u);
    }

    v11 = objc_claimAutoreleasedReturnValue(-[HTPrefs objectProperty:matchingSelector:contextPrefixOut:](self, "objectProperty:matchingSelector:contextPrefixOut:", a3, "isEqual:", 0));
    var1 = (void **)a3->var1;
    v13 = *var1;
    *var1 = (void *)v11;

    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1);
  }

}

- (void)initPropertyMemoryLoggingIntervalSec:(HTPrefInit *)a3
{
  unsigned int memoryLoggingIntervalSec;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *var0;
  int v11;
  __CFString *v12;
  __int16 v13;
  unsigned int v14;
  __int16 v15;
  int v16;

  memoryLoggingIntervalSec = self->_memoryLoggingIntervalSec;
  v6 = -[HTPrefs unsignedIntProperty:contextPrefixOut:](self, "unsignedIntProperty:contextPrefixOut:", a3, 0);
  if (memoryLoggingIntervalSec != (_DWORD)v6)
  {
    v7 = v6;
    v8 = sub_10001D38C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      v11 = 138412802;
      v12 = var0;
      v13 = 1024;
      v14 = memoryLoggingIntervalSec;
      v15 = 1024;
      v16 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %u -> %u", (uint8_t *)&v11, 0x18u);
    }

    -[HTPrefs setMemoryLoggingIntervalSec:](self, "setMemoryLoggingIntervalSec:", v7);
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1);
  }
}

- (void)initPropertyHangtracerDaemonEnabled:(HTPrefInit *)a3
{
  int hangtracerDaemonEnabled;
  unsigned int v6;
  id v7;
  id v8;
  NSString *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  __CFString *var0;
  id v15;
  uint8_t buf[4];
  __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;

  hangtracerDaemonEnabled = self->_hangtracerDaemonEnabled;
  v15 = 0;
  v6 = -[HTPrefs BOOLProperty:contextPrefixOut:](self, "BOOLProperty:contextPrefixOut:", a3, &v15);
  v7 = v15;
  v8 = v15;
  v9 = self->_enablementPrefix;
  if (!-[NSString isEqualToString:](v9, "isEqualToString:", v8))
  {
    objc_storeStrong((id *)&self->_enablementPrefix, v7);
    v10 = sub_10001D38C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1000387E4((uint64_t)v9, &self->_enablementPrefix, v11);

  }
  if (hangtracerDaemonEnabled != v6)
  {
    self->_hangtracerDaemonEnabled = v6;
    v12 = sub_10001D38C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      *(_DWORD *)buf = 138412802;
      v17 = var0;
      v18 = 1024;
      v19 = hangtracerDaemonEnabled;
      v20 = 1024;
      v21 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %{BOOL}d -> %{BOOL}d", buf, 0x18u);
    }

    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1);
  }

}

- (void)initPropertyIsInternal:(HTPrefInit *)a3
{
  int isInternalNoOverride;
  int v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  NSObject *v11;

  isInternalNoOverride = self->__isInternalNoOverride;
  v5 = MGGetBoolAnswer(CFSTR("InternalBuild"), a2, a3);
  if (isInternalNoOverride != v5)
  {
    v6 = v5;
    v7 = sub_10001D38C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_1000388FC();

    self->__isInternalNoOverride = v6;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1);
  }
  v9 = !self->_customerModeEnabled && self->__isInternalNoOverride;
  if (self->_isInternal != v9)
  {
    v10 = sub_10001D38C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_100038868();

    self->_isInternal = v9;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1);
  }
}

- (void)initPropertyShouldSaveAndCompressTailspins:(HTPrefInit *)a3
{
  int shouldSaveTailspins;
  int shouldCompressSavedTailspins;
  NSString *tailspinSaveFormat;
  _BOOL4 isInternal;
  unsigned int keepTailspinsLegacy;
  int v9;
  unint64_t savedTailspinMaxMB;
  unsigned int v11;
  int v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;

  shouldSaveTailspins = self->_shouldSaveTailspins;
  shouldCompressSavedTailspins = self->_shouldCompressSavedTailspins;
  tailspinSaveFormat = self->_tailspinSaveFormat;
  if (tailspinSaveFormat)
  {
    isInternal = self->_isInternal;
    if (-[NSString isEqualToString:](tailspinSaveFormat, "isEqualToString:", CFSTR("compressed")))
    {
      keepTailspinsLegacy = 1;
      v9 = 1;
    }
    else if (-[NSString isEqualToString:](self->_tailspinSaveFormat, "isEqualToString:", CFSTR("uncompressed")))
    {
      v9 = 0;
      keepTailspinsLegacy = 1;
    }
    else
    {
      keepTailspinsLegacy = !-[NSString isEqualToString:](self->_tailspinSaveFormat, "isEqualToString:", CFSTR("none"));
      if (!isInternal)
        keepTailspinsLegacy = 0;
      v9 = keepTailspinsLegacy;
    }
  }
  else
  {
    v9 = 0;
    keepTailspinsLegacy = self->_keepTailspinsLegacy;
  }
  savedTailspinMaxMB = self->_savedTailspinMaxMB;
  if (savedTailspinMaxMB)
    v11 = keepTailspinsLegacy;
  else
    v11 = 0;
  if (savedTailspinMaxMB)
    v12 = v9;
  else
    v12 = 0;
  if (shouldSaveTailspins != v11)
  {
    v13 = sub_10001D38C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      sub_100038A24();

    self->_shouldSaveTailspins = v11;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1);
  }
  if (shouldCompressSavedTailspins != v12)
  {
    v15 = sub_10001D38C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      sub_100038990();

    self->_shouldCompressSavedTailspins = v12;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1);
  }
}

- (void)initPropertyReportPeriod:(HTPrefInit *)a3
{
  double reportPeriodMATU;
  double v6;
  double v7;
  id v8;
  NSObject *v9;
  __CFString *var0;
  int v11;
  __CFString *v12;
  __int16 v13;
  double v14;
  __int16 v15;
  double v16;

  reportPeriodMATU = (double)self->_reportPeriodMATU;
  -[HTPrefs doubleProperty:contextPrefixOut:](self, "doubleProperty:contextPrefixOut:", a3, 0);
  v7 = v6 * 1000.0 / sub_10000644C();
  if (v7 != reportPeriodMATU)
  {
    v8 = sub_10001D38C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      v11 = 138412802;
      v12 = var0;
      v13 = 2048;
      v14 = reportPeriodMATU;
      v15 = 2048;
      v16 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %f -> %f", (uint8_t *)&v11, 0x20u);
    }

    self->_reportPeriodMATU = (unint64_t)v7;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1);
  }
}

- (void)initPropertyHaveInternalSettings:(HTPrefInit *)a3
{
  void *v5;
  int hasInternalSettings;
  int v7;
  id v8;
  NSObject *v9;
  __CFString *var0;
  int v11;
  __CFString *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  _BOOL4 v16;

  v5 = (void *)CFPreferencesCopyValue(CFSTR("HangTracerInternalSettingCreated"), self->__htTaskingDomain, CFSTR("mobile"), kCFPreferencesAnyHost);
  hasInternalSettings = self->_hasInternalSettings;
  v7 = v5 != 0;
  if (hasInternalSettings != v7)
  {
    v8 = sub_10001D38C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      v11 = 138412802;
      v12 = var0;
      v13 = 1024;
      v14 = hasInternalSettings;
      v15 = 1024;
      v16 = v5 != 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %{BOOL}d -> %{BOOL}d", (uint8_t *)&v11, 0x18u);
    }

    self->_hasInternalSettings = v7;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1);
  }

}

- (void)initPropertyThirdPartyDevPreferredLanguages:(HTPrefInit *)a3
{
  NSArray *v5;
  CFPropertyListRef v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  __CFString *var0;
  int v13;
  __CFString *v14;
  __int16 v15;
  NSArray *v16;
  __int16 v17;
  void *v18;

  v5 = self->_thirdPartyDevPreferredLanguages;
  v6 = CFPreferencesCopyValue(CFSTR("AppleLanguages"), kCFPreferencesAnyApplication, CFSTR("mobile"), kCFPreferencesAnyHost);
  v7 = (void *)v6;
  if (v6 && (objc_opt_respondsToSelector(v6, "isEqualToArray:") & 1) != 0)
    v8 = v7;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
  v9 = v8;
  if (!-[NSArray isEqualToArray:](v5, "isEqualToArray:", v8))
  {
    v10 = sub_10001D38C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      v13 = 138412802;
      v14 = var0;
      v15 = 2112;
      v16 = v5;
      v17 = 2112;
      v18 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %@ -> %@", (uint8_t *)&v13, 0x20u);
    }

    objc_storeStrong((id *)&self->_thirdPartyDevPreferredLanguages, v9);
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1);
  }

}

+ (id)sharedPrefs
{
  if (qword_1000801B0 != -1)
    dispatch_once(&qword_1000801B0, &stru_100075B98);
  return (id)qword_1000801A8;
}

- (void)dealloc
{
  HTPrefInit *prefInitList;
  objc_super v4;

  prefInitList = self->_prefInitList;
  if (prefInitList)
    free(prefInitList);
  v4.receiver = self;
  v4.super_class = (Class)HTPrefs;
  -[HTPrefs dealloc](&v4, "dealloc");
}

- (HTPrefInit)prefInitList
{
  HTPrefInit *result;
  id v4;
  NSObject *v5;
  HTPrefDefaultVal v6;
  HTPrefDefaultVal v7;
  HTPrefDefaultVal v8;
  HTPrefDefaultVal v9;
  int64x2_t v10;
  int64x2_t v11;
  int64x2_t v12;
  void *v18;
  void *v19;
  _BYTE v20[7];
  _BYTE v21[7];
  _BYTE v22[7];
  _BYTE v23[7];
  _BYTE v24[7];
  _BYTE v25[7];
  _BYTE v26[7];
  _BYTE v27[7];
  _BYTE v28[7];
  _BYTE v29[7];
  _BYTE v30[7];
  _BYTE v31[7];
  _BYTE v32[7];
  _BYTE v33[7];
  _BYTE v34[7];
  _BYTE v35[7];
  _BYTE v36[7];
  _BYTE v37[7];
  _BYTE v38[7];
  _BYTE v39[7];
  _BYTE v40[7];
  _BYTE v41[7];
  _BYTE v42[7];
  _BYTE v43[7];
  _BYTE v44[7];
  _BYTE v45[7];
  _BYTE v46[7];
  _BYTE v47[7];
  _BYTE v48[7];
  _BYTE v49[7];
  _BYTE v50[7];
  _BYTE v51[7];
  _BYTE v52[7];
  _BYTE v53[7];
  _BYTE v54[7];
  _BYTE v55[7];
  _BYTE v56[7];
  _BYTE v57[7];
  _BYTE v58[7];
  _BYTE v59[7];
  _BYTE v60[7];
  _BYTE v61[7];
  _BYTE v62[7];
  _BYTE v63[7];
  _BYTE v64[7];
  _BYTE v65[7];
  _BYTE v66[7];
  _BYTE v67[7];
  _BYTE v68[7];
  _BYTE v69[7];
  _BYTE v70[7];
  _BYTE v71[7];
  _BYTE v72[7];
  _BYTE v73[7];
  _BYTE v74[7];
  _BYTE v75[7];
  _BYTE v76[7];
  _BYTE v77[7];
  _BYTE v78[7];
  _BYTE v79[7];
  _BYTE v80[7];
  _BYTE v81[7];
  _BYTE v82[7];
  _BYTE v83[7];
  _BYTE v84[7];
  _BYTE v85[7];
  __int128 v86;

  result = self->_prefInitList;
  if (!result)
  {
    v4 = sub_10001D38C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_100038AB8(v5);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    objc_msgSend(v19, "timeIntervalSinceReferenceDate");
    v7 = v6;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    objc_msgSend(v18, "timeIntervalSinceReferenceDate");
    v9 = v8;
    v86 = 0u;
    HIBYTE(v86) = 0;

    result = (HTPrefInit *)malloc_type_malloc(0xF00uLL, 0x3506460CuLL);
    result[61].var0 = CFSTR("PDSEPrefHTThirdPartyPeriodDays");
    result[61].var1 = &self->_pdseHTThirdPartyPeriodDays;
    result[62].var0 = CFSTR("PDSEPrefHTThirdPartyNoLogUploadPeriodDays");
    result[62].var1 = &self->_pdseHTThirdPartyNoLogUploadPeriodDays;
    result[63].var0 = CFSTR("PDSEPrefCATailspinPeriodDays");
    result->var0 = CFSTR("HangTracerEnableTailspin");
    result->var1 = &self->_htTailspinEnabled;
    result[63].var1 = &self->_pdseCATailspinPeriodDays;
    result[64].var0 = CFSTR("PDSEPrefAppLaunchPeriodDays");
    result[64].var1 = &self->_pdseAppLaunchPeriodDays;
    result[65].var0 = CFSTR("PDSEPrefSentryPeriodDays");
    result[1].var0 = CFSTR("HangTracerEnableHUD");
    result[1].var1 = &self->_hudEnabled;
    result[65].var1 = &self->_pdseSentryPeriodDays;
    result[66].var0 = CFSTR("PDSEPrefWorkflowResponsivenessPeriodDays");
    result[66].var1 = &self->_pdseWorkflowResponsivenessPeriodDays;
    result[67].var0 = CFSTR("PDSEPrefHTBadDayKillSwitch");
    result[2].var0 = CFSTR("HangTracerCollectOSSignposts");
    result[2].var1 = &self->_shouldCollectOSSignposts;
    result[67].var1 = &self->_pdseHTBadDayKillSwitch;
    result[68].var0 = CFSTR("PDSEPrefAllowEnableTailspin");
    result[68].var1 = &self->_pdseAllowEnableTailspin;
    result[69].var0 = CFSTR("BadDaySecondsBetweenLastEnablementAndReferenceDate");
    result[3].var0 = CFSTR("HangTracerCollectOSSignpostsDeferred");
    result[3].var1 = &self->_shouldCollectOSSignpostsDeferred;
    result[69].var1 = &self->_badDaySecondsBetweenLastEnablementAndReferenceDate;
    result[70].var0 = CFSTR("BadDayEnablementMinimumBreakDurationDays");
    result[70].var1 = &self->_badDayEnablementMinimumBreakDurationDays;
    result[71].var0 = CFSTR("BadDayEnablementDurationDaysKey");
    result[4].var0 = CFSTR("HangTracerSavedTailspinsMaxMB");
    result[4].var1 = &self->_savedTailspinMaxMB;
    result[5].var0 = CFSTR("HangTracerKeepTailspins");
    result[5].var1 = &self->_keepTailspinsLegacy;
    result[71].var1 = &self->_badDayEnablementDurationDays;
    result[72].var0 = CFSTR("BadDayEnablementForHangDurationMSec");
    result[72].var1 = &self->_badDayEnablementForHangDurationMSec;
    result[73].var0 = CFSTR("BadDayEnablementForLogCount");
    result[73].var1 = &self->_badDayEnablementForLogCount;
    result[74].var0 = CFSTR("BadDayEnablementForPreviousDays");
    result[74].var1 = &self->_badDayEnablementForPreviousDays;
    result[75].var0 = CFSTR("HangTracerTelemetryHaveNonDefaultFeatureFlags");
    result[6].var0 = CFSTR("HangTracerKeepTailspinsWithFormat");
    result[6].var1 = &self->_tailspinSaveFormat;
    result[6].var2.var3 = (unint64_t)CFSTR("compressed");
    result[6].var3.var3 = (unint64_t)CFSTR("none");
    result[75].var1 = &self->_haveNonDefaultFeatureFlags;
    result[76].var0 = CFSTR("HangTracerTelemetrySerialLoggingEnabled");
    result[76].var1 = &self->_haveSerialLoggingEnabled;
    result[77].var0 = CFSTR("HangTracerTelemetryNumOSCryptexFileExtents");
    result[77].var1 = &self->_numOSCryptexFileExtents;
    result[78].var0 = CFSTR("HangTracerTelemetryHaveRootsInstalled");
    result[78].var1 = &self->_haveRootsInstalled;
    result[6].var5 = "initNSStringProperty:";
    result[8].var0 = CFSTR("HangTracerIncludeDiskInfo");
    result[8].var1 = &self->_shouldIncludeDiskInfo;
    result[7].var1 = &self->_shouldSaveTailspins;
    result[7].var5 = "initPropertyShouldSaveAndCompressTailspins:";
    HIDWORD(result[5].var2.var3) = *(_DWORD *)&v83[3];
    *(_DWORD *)(&result[5].var2.var0 + 1) = *(_DWORD *)v83;
    HIDWORD(result[5].var3.var3) = *(_DWORD *)&v82[3];
    *(_DWORD *)(&result[5].var3.var0 + 1) = *(_DWORD *)v82;
    HIDWORD(result[7].var2.var3) = *(_DWORD *)&v81[3];
    *(_DWORD *)(&result[7].var2.var0 + 1) = *(_DWORD *)v81;
    HIDWORD(result[7].var3.var3) = *(_DWORD *)&v80[3];
    *(_DWORD *)(&result[7].var3.var0 + 1) = *(_DWORD *)v80;
    HIDWORD(result[8].var2.var3) = *(_DWORD *)&v79[3];
    *(_DWORD *)(&result[8].var2.var0 + 1) = *(_DWORD *)v79;
    HIDWORD(result[8].var3.var3) = *(_DWORD *)&v78[3];
    *(_DWORD *)(&result[8].var3.var0 + 1) = *(_DWORD *)v78;
    HIDWORD(result[9].var2.var3) = *(_DWORD *)&v77[3];
    *(_DWORD *)(&result[9].var2.var0 + 1) = *(_DWORD *)v77;
    HIDWORD(result[9].var3.var3) = *(_DWORD *)&v76[3];
    *(_DWORD *)(&result[9].var3.var0 + 1) = *(_DWORD *)v76;
    HIDWORD(result[10].var2.var3) = *(_DWORD *)&v75[3];
    *(_DWORD *)(&result[10].var2.var0 + 1) = *(_DWORD *)v75;
    HIDWORD(result[10].var3.var3) = *(_DWORD *)&v74[3];
    *(_DWORD *)(&result[10].var3.var0 + 1) = *(_DWORD *)v74;
    HIDWORD(result[11].var2.var3) = *(_DWORD *)&v73[3];
    *(_DWORD *)(&result[11].var2.var0 + 1) = *(_DWORD *)v73;
    HIDWORD(result[11].var3.var3) = *(_DWORD *)&v72[3];
    *(_DWORD *)(&result[11].var3.var0 + 1) = *(_DWORD *)v72;
    *(_DWORD *)(&result[25].var2.var0 + 1) = *(_DWORD *)v71;
    *(_DWORD *)(&result[25].var3.var0 + 1) = *(_DWORD *)v70;
    *(_DWORD *)(&result[28].var2.var0 + 1) = *(_DWORD *)v69;
    *(_DWORD *)(&result[28].var3.var0 + 1) = *(_DWORD *)v68;
    HIDWORD(result[30].var2.var3) = *(_DWORD *)&v67[3];
    *(_DWORD *)(&result[30].var2.var0 + 1) = *(_DWORD *)v67;
    HIDWORD(result[30].var3.var3) = *(_DWORD *)&v66[3];
    *(_DWORD *)(&result[30].var3.var0 + 1) = *(_DWORD *)v66;
    *(_DWORD *)(&result[33].var2.var0 + 1) = *(_DWORD *)v65;
    *(_DWORD *)(&result[33].var3.var0 + 1) = *(_DWORD *)v64;
    HIDWORD(result[34].var2.var3) = *(_DWORD *)&v63[3];
    *(_DWORD *)(&result[34].var2.var0 + 1) = *(_DWORD *)v63;
    HIDWORD(result[34].var3.var3) = *(_DWORD *)&v62[3];
    *(_DWORD *)(&result[34].var3.var0 + 1) = *(_DWORD *)v62;
    *(_DWORD *)(&result[37].var2.var0 + 1) = *(_DWORD *)v61;
    *(_DWORD *)(&result[37].var3.var0 + 1) = *(_DWORD *)v60;
    HIDWORD(result[39].var2.var3) = *(_DWORD *)&v59[3];
    *(_DWORD *)(&result[39].var2.var0 + 1) = *(_DWORD *)v59;
    HIDWORD(result[39].var3.var3) = *(_DWORD *)&v58[3];
    *(_DWORD *)(&result[39].var3.var0 + 1) = *(_DWORD *)v58;
    *(_DWORD *)(&result[40].var2.var0 + 1) = *(_DWORD *)v57;
    HIDWORD(result[40].var3.var3) = *(_DWORD *)&v56[3];
    *(_DWORD *)(&result[40].var3.var0 + 1) = *(_DWORD *)v56;
    HIDWORD(result[43].var2.var3) = *(_DWORD *)&v55[3];
    *(_DWORD *)(&result[43].var2.var0 + 1) = *(_DWORD *)v55;
    HIDWORD(result[43].var3.var3) = *(_DWORD *)&v54[3];
    *(_DWORD *)(&result[43].var3.var0 + 1) = *(_DWORD *)v54;
    *(_DWORD *)(&result[46].var2.var0 + 1) = *(_DWORD *)v53;
    *(_DWORD *)(&result[46].var3.var0 + 1) = *(_DWORD *)v52;
    HIDWORD(result[47].var2.var3) = *(_DWORD *)&v51[3];
    *(_DWORD *)(&result[47].var2.var0 + 1) = *(_DWORD *)v51;
    HIDWORD(result[47].var3.var3) = *(_DWORD *)&v50[3];
    *(_DWORD *)(&result[47].var3.var0 + 1) = *(_DWORD *)v50;
    HIDWORD(result[49].var2.var3) = *(_DWORD *)&v49[3];
    *(_DWORD *)(&result[49].var2.var0 + 1) = *(_DWORD *)v49;
    HIDWORD(result[49].var3.var3) = *(_DWORD *)&v48[3];
    *(_DWORD *)(&result[49].var3.var0 + 1) = *(_DWORD *)v48;
    HIDWORD(result[50].var2.var3) = *(_DWORD *)&v47[3];
    *(_DWORD *)(&result[50].var2.var0 + 1) = *(_DWORD *)v47;
    HIDWORD(result[50].var3.var3) = *(_DWORD *)&v46[3];
    *(_DWORD *)(&result[50].var3.var0 + 1) = *(_DWORD *)v46;
    HIDWORD(result[51].var2.var3) = *(_DWORD *)&v45[3];
    *(_DWORD *)(&result[51].var2.var0 + 1) = *(_DWORD *)v45;
    HIDWORD(result[51].var3.var3) = *(_DWORD *)&v44[3];
    *(_DWORD *)(&result[51].var3.var0 + 1) = *(_DWORD *)v44;
    HIDWORD(result[52].var2.var3) = *(_DWORD *)&v43[3];
    *(_DWORD *)(&result[52].var2.var0 + 1) = *(_DWORD *)v43;
    HIDWORD(result[52].var3.var3) = *(_DWORD *)&v42[3];
    *(_DWORD *)(&result[52].var3.var0 + 1) = *(_DWORD *)v42;
    *(_DWORD *)(&result[3].var2.var0 + 1) = *(_DWORD *)v85;
    HIDWORD(result[3].var2.var3) = *(_DWORD *)&v85[3];
    *(_DWORD *)(&result[3].var3.var0 + 1) = *(_DWORD *)v84;
    HIDWORD(result[3].var3.var3) = *(_DWORD *)&v84[3];
    result[4].var2.var1 = 50;
    result[9].var0 = CFSTR("HangTracerEnableDisplayData");
    result[9].var1 = &self->_shouldIncludeDisplayData;
    result[10].var0 = CFSTR("HangTracerIncludeNetworkState");
    result[10].var1 = &self->_shouldIncludeNetworkState;
    result[11].var0 = CFSTR("HangTracerThirdPartyRunloopLogsEnabled");
    result[11].var1 = &self->_thirdPartyRunLoopHangLogsEnabled;
    result[12].var0 = CFSTR("HangTracerSamplingPercentForMicroHangs");
    result[12].var1 = &self->_samplingPercentForMicroHangs;
    result[13].var0 = CFSTR("HangTracerPercentFullSpinReports");
    result[13].var1 = &self->_runloopHangPercentHeavyLogs;
    result[14].var0 = CFSTR("HangTracerDailyMicroHangLogLimit");
    result[14].var1 = &self->_runLoopMicroHangDailyLogLimit;
    result[15].var0 = CFSTR("HangTracerDailyLogLimit");
    result[15].var1 = &self->_runLoopHangDailyLogLimit;
    result[16].var0 = CFSTR("HangTracerPerPeriodLogLimit");
    result[16].var1 = &self->_runLoopHangPerPeriodLogLimit;
    result[17].var0 = CFSTR("HangTracerDailyLongLogLimit");
    result[17].var1 = &self->_runLoopLongHangDailyLogLimit;
    result[18].var0 = CFSTR("HangTracerDailyThirdPartyLogLimit");
    result[18].var1 = &self->_runloopHangThirdPartyDailyLogLimit;
    result[19].var0 = CFSTR("HangTracerFenceHangLogLimit");
    result[19].var1 = &self->_fenceHangDailyLogLimit;
    result[20].var0 = CFSTR("HangTracerHangTimeoutDuration");
    result[20].var1 = &self->_runloopHangTimeoutDurationMSec;
    v10 = vdupq_n_s64(0x2328uLL);
    result[21].var0 = CFSTR("HangTracerDuration");
    result[21].var1 = &self->_runloopHangDurationThresholdMSec;
    result[22].var0 = CFSTR("HangTracerLongHangDurationThreshold");
    result[22].var1 = &self->_runloopLongHangDurationThresholdMSec;
    v11 = vdupq_n_s64(0x7D0uLL);
    result[23].var0 = CFSTR("HangTracerThirdPartyHangThreshold");
    result[23].var1 = &self->_runloopHangThirdPartyDurationThresholdMSec;
    result[24].var0 = CFSTR("HangTracerSpringBoardHangIORegGPUDumpTimeout");
    result[24].var1 = &self->_springBoardHangIORegGPUDumpTimeoutMSec;
    result[25].var0 = CFSTR("HangTracerFenceTrackingEnabled");
    result[25].var1 = &self->_fenceTrackingEnabled;
    HIDWORD(result[25].var2.var3) = *(_DWORD *)&v71[3];
    HIDWORD(result[25].var3.var3) = *(_DWORD *)&v70[3];
    result[26].var0 = CFSTR("HangTracerSlowActPerAppMax");
    result[26].var1 = &self->_slowAppActivationPerAppMaxLogLimit;
    result[27].var0 = CFSTR("HangTracerSlowActDailyLogLimit");
    result[27].var1 = &self->_slowAppActivationDailyLogLimit;
    result[28].var0 = CFSTR("HangTracerSlowActTailspinsEnabled");
    result[28].var1 = &self->_slowAppActivationTailspinEnabled;
    HIDWORD(result[28].var2.var3) = *(_DWORD *)&v69[3];
    HIDWORD(result[28].var3.var3) = *(_DWORD *)&v68[3];
    result[29].var0 = CFSTR("HangTracerSlowActLaunchTailspinThreshold");
    result[29].var1 = &self->_slowAppActivationThresholdMSec;
    v12 = vdupq_n_s64(0x1388uLL);
    result[30].var0 = CFSTR("HangTracerEnableSignpostMonitoring");
    result[30].var1 = &self->_signpostMonitoringEnabled;
    result[31].var0 = CFSTR("HangTracerSignpostMonitoringDailyLogLimit");
    result[31].var1 = &self->_signpostMonitoringDailyLogLimit;
    result[32].var0 = CFSTR("HangTracerSignpostMonitoringPerPeriodLogLimit");
    result[32].var1 = &self->_signpostMonitoringPerPeriodLogLimit;
    result[33].var0 = CFSTR("HangTracerEnableAppLaunchMonitoring");
    result[33].var1 = &self->_appLaunchMonitoringEnabled;
    HIDWORD(result[33].var2.var3) = *(_DWORD *)&v65[3];
    HIDWORD(result[33].var3.var3) = *(_DWORD *)&v64[3];
    result[34].var0 = CFSTR("HangTracerEnableWorkflowResponsiveness");
    result[34].var1 = &self->_workflowResponsivenessEnabled;
    result[35].var0 = CFSTR("HangTracerWorkflowResponsivenessDailyLogLimit");
    result[35].var1 = &self->_workflowResponsivenessDailyLogLimit;
    result[36].var0 = CFSTR("HangTracerWorkflowResponsivenessPerPeriodLogLimit");
    result[36].var1 = &self->_workflowResponsivenessPerPeriodLogLimit;
    result[16].var2.var1 = 4;
    result[16].var3.var1 = 4;
    result[32].var2.var1 = 4;
    result[32].var3.var1 = 4;
    result[36].var2.var1 = 4;
    result[36].var3.var1 = 4;
    result[37].var0 = CFSTR("HangTracerEnableMemoryLogging");
    result[37].var1 = &self->_memoryLoggingEnabled;
    HIDWORD(result[37].var2.var3) = *(_DWORD *)&v61[3];
    HIDWORD(result[37].var3.var3) = *(_DWORD *)&v60[3];
    result[38].var0 = CFSTR("HangTracerMemoryLoggingInterval");
    result[38].var1 = &self->_memoryLoggingIntervalSec;
    result[38].var2.var1 = 3600;
    result[38].var3.var1 = 3600;
    result[38].var5 = "initPropertyMemoryLoggingIntervalSec:";
    result[39].var0 = CFSTR("EPLEnabledProfile");
    result[39].var1 = &self->_eplEnabledProfile;
    result[40].var0 = CFSTR("EPLEnabled");
    result[40].var1 = &self->_eplEnabled;
    HIDWORD(result[40].var2.var3) = *(_DWORD *)&v57[3];
    result[41].var0 = CFSTR("EPLTimeoutTimestampSec");
    result[41].var1 = &self->_eplTimeoutTimestampSec;
    result[42].var0 = CFSTR("HangTracerReportPeriod");
    result[42].var1 = &self->_reportPeriodMATU;
    result[42].var5 = "initPropertyReportPeriod:";
    result[43].var0 = CFSTR("HangTracerInternalSettingCreated");
    result[43].var1 = &self->_hasInternalSettings;
    result[43].var5 = "initPropertyHaveInternalSettings:";
    result[44].var0 = CFSTR("HangTracerHUDThresholdMSec");
    result[44].var1 = &self->_hudThresholdMSec;
    result[44].var2.var1 = 500;
    result[44].var3.var1 = 500;
    result[45].var0 = CFSTR("HangTracerForceQuitDetectionThresholdMSec");
    result[45].var1 = &self->_forceQuitDetectionThresholdMSec;
    result[45].var2.var1 = 3000;
    result[45].var3.var1 = 3000;
    result[46].var0 = CFSTR("HangTracerThirdPartyDevHangHUDEnabled");
    result[46].var1 = &self->_thirdPartyDevHangHUDEnabled;
    HIDWORD(result[46].var2.var3) = *(_DWORD *)&v53[3];
    HIDWORD(result[46].var3.var3) = *(_DWORD *)&v52[3];
    result[47].var0 = CFSTR("HangTracerThirdPartyIncludeNonDevelopmentApps");
    result[47].var1 = &self->_thirdPartyIncludeNonDevelopmentApps;
    result[48].var0 = CFSTR("HangTracerHangWaitTimeoutDuration");
    result[48].var1 = &self->_hangWaitTimeoutDurationMSec;
    result[20].var5 = "initUnsignedLongProperty:";
    result[21].var5 = "initUnsignedLongProperty:";
    result[22].var5 = "initUnsignedLongProperty:";
    result[23].var5 = "initUnsignedLongProperty:";
    result[24].var5 = "initUnsignedLongProperty:";
    result[29].var5 = "initUnsignedLongProperty:";
    result[48].var5 = "initUnsignedLongProperty:";
    result[49].var0 = CFSTR("enableLoggingForPoster");
    result[49].var1 = &self->_enableLoggingForPoster;
    result[6].var4 = 0;
    result[7].var0 = 0;
    result[7].var4 = 0;
    __asm { FMOV            V6.2D, #2.0 }
    *(_OWORD *)&result[12].var2.var0 = _Q6;
    *(_OWORD *)&result[13].var2.var0 = xmmword_10003CF60;
    *(int64x2_t *)&result[21].var2.var0 = vdupq_n_s64(0x1F4uLL);
    result[50].var0 = CFSTR("enableLoggingForWidgetRenderer");
    *(int64x2_t *)&result[23].var2.var0 = vdupq_n_s64(0x3E8uLL);
    *(int64x2_t *)&result[20].var2.var0 = v10;
    *(int64x2_t *)&result[24].var2.var0 = v10;
    result[50].var1 = &self->_enableLoggingForWidgetRenderer;
    result->var2.var0 = 1;
    result->var3.var0 = 0;
    result->var4 = 0;
    result->var5 = "initBoolProperty:";
    result[1].var2.var0 = 0;
    result[1].var3.var0 = 0;
    result[1].var4 = 0;
    result[1].var5 = "initBoolProperty:";
    result[2].var2.var0 = 0;
    result[2].var3.var0 = 0;
    result[2].var4 = 0;
    result[2].var5 = "initBoolProperty:";
    result[3].var2.var0 = 1;
    result[3].var3.var0 = 0;
    result[3].var4 = 0;
    result[3].var5 = "initBoolProperty:";
    result[51].var0 = CFSTR("PDSEPrefHangTracerKillSwitch");
    result[4].var3.var1 = 20;
    result[4].var4 = 0;
    result[4].var5 = "initUnsignedIntProperty:";
    result[5].var2.var0 = 0;
    result[5].var3.var0 = 0;
    result[5].var4 = 0;
    result[5].var5 = "initBoolProperty:";
    result[7].var2.var0 = 0;
    result[7].var3.var0 = 0;
    result[8].var2.var0 = 0;
    result[8].var3.var0 = 0;
    result[8].var4 = 0;
    result[8].var5 = "initBoolProperty:";
    result[9].var2.var0 = 1;
    result[9].var3.var0 = 1;
    result[9].var4 = 0;
    result[9].var5 = "initBoolProperty:";
    result[10].var2.var0 = 0;
    result[10].var3.var0 = 0;
    result[10].var4 = 0;
    result[10].var5 = "initBoolProperty:";
    result[11].var2.var0 = 1;
    result[11].var3.var0 = 1;
    result[11].var4 = 0;
    result[11].var5 = "initBoolProperty:";
    result[12].var4 = 0;
    result[12].var5 = "initDoubleProperty:";
    result[13].var4 = 0;
    result[13].var5 = "initDoubleProperty:";
    result[51].var1 = &self->_pdseHangTracerKillSwitch;
    result[14].var2.var1 = 10;
    result[14].var3.var1 = 10;
    result[14].var4 = 0;
    result[14].var5 = "initIntProperty:";
    result[52].var0 = CFSTR("PDSEPrefHTRateOnlyKillSwitch");
    result[15].var2.var1 = 25;
    result[15].var3.var1 = 25;
    result[15].var4 = 0;
    result[15].var5 = "initIntProperty:";
    result[16].var4 = 0;
    result[16].var5 = "initIntProperty:";
    result[17].var2.var1 = 25;
    result[17].var3.var1 = 25;
    result[17].var4 = 0;
    result[17].var5 = "initIntProperty:";
    result[18].var2.var1 = 10;
    result[18].var3.var1 = 10;
    result[18].var4 = 0;
    result[18].var5 = "initIntProperty:";
    result[19].var2.var1 = 25;
    result[19].var3.var1 = 25;
    result[19].var4 = 0;
    result[19].var5 = "initIntProperty:";
    result[20].var4 = 1;
    result[21].var4 = 1;
    *(int64x2_t *)&result[22].var2.var0 = v11;
    result[22].var4 = 1;
    result[23].var4 = 1;
    result[24].var4 = 0;
    result[25].var2.var0 = 1;
    result[25].var3.var0 = 1;
    result[25].var4 = 0;
    result[25].var5 = "initBoolProperty:";
    result[26].var2.var1 = 25;
    result[26].var3.var1 = 25;
    result[26].var4 = 0;
    result[26].var5 = "initIntProperty:";
    result[27].var2.var1 = 25;
    result[27].var3.var1 = 25;
    result[27].var4 = 0;
    result[27].var5 = "initIntProperty:";
    result[28].var2.var0 = 0;
    result[28].var3.var0 = 0;
    result[28].var4 = 0;
    result[28].var5 = "initBoolProperty:";
    result[41].var2 = v7;
    result[41].var3 = v9;
    result[41].var4 = 0;
    result[41].var5 = "initDoubleProperty:";
    *(int64x2_t *)&result[29].var2.var0 = v12;
    result[29].var4 = 1;
    result[30].var2.var0 = 1;
    result[40].var3.var0 = 0;
    result[40].var4 = 0;
    result[40].var5 = "initBoolProperty:";
    result[30].var3.var0 = 0;
    result[30].var4 = 0;
    result[30].var5 = "initBoolProperty:";
    result[39].var4 = 0;
    result[39].var5 = "initBoolProperty:";
    result[40].var2.var0 = 0;
    result[31].var2.var1 = 25;
    result[31].var3.var1 = 25;
    result[31].var4 = 0;
    result[31].var5 = "initIntProperty:";
    result[39].var2.var0 = 0;
    result[39].var3.var0 = 0;
    result[32].var4 = 0;
    result[32].var5 = "initIntProperty:";
    result[33].var2.var0 = 1;
    result[33].var3.var0 = 0;
    result[37].var5 = "initBoolProperty:";
    result[38].var4 = 1;
    result[33].var4 = 0;
    result[33].var5 = "initBoolProperty:";
    result[34].var2.var0 = 1;
    result[37].var2.var0 = 1;
    result[37].var3.var0 = 0;
    result[37].var4 = 0;
    result[34].var3.var0 = 0;
    result[34].var4 = 0;
    result[34].var5 = "initBoolProperty:";
    result[35].var2.var1 = 25;
    result[36].var4 = 0;
    result[36].var5 = "initIntProperty:";
    result[35].var3.var1 = 25;
    result[35].var4 = 0;
    result[35].var5 = "initIntProperty:";
    *(int64x2_t *)&result[42].var2.var0 = vdupq_n_s64(0x40AC200000000000uLL);
    result[42].var4 = 2;
    result[43].var2.var0 = 0;
    result[43].var3.var0 = 0;
    result[43].var4 = 0;
    result[44].var4 = 1;
    result[44].var5 = "initUnsignedIntProperty:";
    result[45].var4 = 1;
    result[45].var5 = "initUnsignedIntProperty:";
    result[46].var2.var0 = 0;
    result[46].var3.var0 = 0;
    result[46].var4 = 0;
    result[46].var5 = "initBoolProperty:";
    result[47].var2.var0 = 0;
    result[47].var3.var0 = 0;
    result[47].var4 = 0;
    result[47].var5 = "initBoolProperty:";
    *(int64x2_t *)&result[48].var2.var0 = v12;
    result[48].var4 = 0;
    result[49].var2.var0 = 0;
    result[49].var3.var0 = 0;
    result[49].var4 = 0;
    result[49].var5 = "initBoolProperty:";
    result[50].var2.var0 = 0;
    result[50].var3.var0 = 0;
    result[50].var4 = 0;
    result[50].var5 = "initBoolProperty:";
    result[51].var2.var0 = 0;
    result[51].var3.var0 = 0;
    result[51].var4 = 0;
    result[51].var5 = "initBoolProperty:";
    result[52].var1 = &self->_pdseHTRateOnlyKillSwitch;
    result[52].var2.var0 = 0;
    result[52].var3.var0 = 0;
    result[52].var4 = 0;
    result[52].var5 = "initBoolProperty:";
    result[53].var0 = CFSTR("PDSEPrefHTThirdPartyKillSwitch");
    result[53].var1 = &self->_pdseHTThirdPartyKillSwitch;
    result[53].var2.var0 = 0;
    HIDWORD(result[53].var2.var3) = *(_DWORD *)&v41[3];
    *(_DWORD *)(&result[53].var2.var0 + 1) = *(_DWORD *)v41;
    result[53].var3.var0 = 0;
    HIDWORD(result[53].var3.var3) = *(_DWORD *)&v40[3];
    *(_DWORD *)(&result[53].var3.var0 + 1) = *(_DWORD *)v40;
    result[53].var4 = 0;
    result[53].var5 = "initBoolProperty:";
    result[54].var0 = CFSTR("PDSEPrefAppLaunchKillSwitch");
    result[54].var1 = &self->_pdseAppLaunchKillSwitch;
    result[54].var2.var0 = 0;
    HIDWORD(result[54].var2.var3) = *(_DWORD *)&v39[3];
    *(_DWORD *)(&result[54].var2.var0 + 1) = *(_DWORD *)v39;
    result[54].var3.var0 = 0;
    HIDWORD(result[54].var3.var3) = *(_DWORD *)&v38[3];
    *(_DWORD *)(&result[54].var3.var0 + 1) = *(_DWORD *)v38;
    result[54].var4 = 0;
    result[54].var5 = "initBoolProperty:";
    result[55].var0 = CFSTR("HangTracerShouldUploadToDiagPipe");
    result[55].var1 = &self->_shouldUploadToDiagPipe;
    result[55].var2.var0 = 1;
    HIDWORD(result[55].var2.var3) = *(_DWORD *)&v37[3];
    *(_DWORD *)(&result[55].var2.var0 + 1) = *(_DWORD *)v37;
    result[55].var3.var0 = 1;
    HIDWORD(result[55].var3.var3) = *(_DWORD *)&v36[3];
    *(_DWORD *)(&result[55].var3.var0 + 1) = *(_DWORD *)v36;
    result[55].var4 = 0;
    result[55].var5 = "initBoolProperty:";
    result[56].var0 = CFSTR("PDSEPrefSentryKillSwitch");
    result[56].var1 = &self->_pdseSentryKillSwitch;
    result[56].var2.var0 = 0;
    HIDWORD(result[56].var2.var3) = *(_DWORD *)&v35[3];
    *(_DWORD *)(&result[56].var2.var0 + 1) = *(_DWORD *)v35;
    result[56].var3.var0 = 1;
    HIDWORD(result[56].var3.var3) = *(_DWORD *)&v34[3];
    *(_DWORD *)(&result[56].var3.var0 + 1) = *(_DWORD *)v34;
    result[56].var4 = 0;
    result[56].var5 = "initBoolProperty:";
    result[57].var0 = CFSTR("PDSEPrefWorkflowResponsivenessKillSwitch");
    result[57].var1 = &self->_pdseWorkflowResponsivenessKillSwitch;
    result[57].var2.var0 = 0;
    HIDWORD(result[57].var2.var3) = *(_DWORD *)&v33[3];
    *(_DWORD *)(&result[57].var2.var0 + 1) = *(_DWORD *)v33;
    result[57].var3.var0 = 1;
    HIDWORD(result[57].var3.var3) = *(_DWORD *)&v32[3];
    *(_DWORD *)(&result[57].var3.var0 + 1) = *(_DWORD *)v32;
    result[57].var4 = 0;
    result[57].var5 = "initBoolProperty:";
    result[58].var0 = CFSTR("PDSEPrefCATailspinKillSwitch");
    result[58].var1 = &self->_pdseCATailspinKillSwitch;
    result[58].var2.var0 = 0;
    HIDWORD(result[58].var2.var3) = *(_DWORD *)&v31[3];
    *(_DWORD *)(&result[58].var2.var0 + 1) = *(_DWORD *)v31;
    result[58].var3.var0 = 1;
    HIDWORD(result[58].var3.var3) = *(_DWORD *)&v30[3];
    *(_DWORD *)(&result[58].var3.var0 + 1) = *(_DWORD *)v30;
    result[58].var4 = 0;
    result[58].var5 = "initBoolProperty:";
    result[59].var0 = CFSTR("HTSEEnablementPeriodDays");
    result[59].var1 = &self->_pdseHTPeriodDays;
    result[59].var2.var1 = 200;
    result[59].var3.var1 = 1000;
    result[59].var4 = 0;
    result[59].var5 = "initIntProperty:";
    result[60].var0 = CFSTR("PDSEPrefHTRateOnlyPeriodDays");
    result[60].var1 = &self->_pdseHTRateOnlyPeriodDays;
    result[60].var2.var1 = 200;
    result[60].var3.var1 = 25;
    result[60].var4 = 0;
    result[60].var5 = "initIntProperty:";
    result[61].var2.var1 = 200;
    result[61].var3.var1 = 200;
    result[61].var4 = 0;
    result[61].var5 = "initIntProperty:";
    result[62].var2.var1 = 200;
    result[62].var3.var1 = 200;
    result[62].var4 = 0;
    result[62].var5 = "initIntProperty:";
    result[63].var2.var1 = 100;
    result[63].var3.var1 = 0x7FFFFFFF;
    result[63].var4 = 0;
    result[63].var5 = "initIntProperty:";
    result[64].var2.var1 = 200;
    result[64].var3.var1 = 400;
    result[64].var4 = 0;
    result[64].var5 = "initIntProperty:";
    result[65].var2.var1 = 10;
    result[65].var3.var1 = 0x7FFFFFFF;
    result[65].var4 = 0;
    result[65].var5 = "initIntProperty:";
    result[66].var2.var1 = 20;
    result[66].var3.var1 = 1000;
    result[66].var4 = 0;
    result[66].var5 = "initIntProperty:";
    result[67].var2.var0 = 0;
    *(_DWORD *)(&result[67].var2.var0 + 1) = *(_DWORD *)v29;
    HIDWORD(result[67].var2.var3) = *(_DWORD *)&v29[3];
    result[67].var3.var0 = 1;
    *(_DWORD *)(&result[67].var3.var0 + 1) = *(_DWORD *)v28;
    HIDWORD(result[67].var3.var3) = *(_DWORD *)&v28[3];
    result[67].var4 = 0;
    result[67].var5 = "initBoolProperty:";
    result[68].var2.var0 = 1;
    HIDWORD(result[68].var2.var3) = *(_DWORD *)&v27[3];
    *(_DWORD *)(&result[68].var2.var0 + 1) = *(_DWORD *)v27;
    result[68].var3.var0 = 1;
    HIDWORD(result[68].var3.var3) = *(_DWORD *)&v26[3];
    *(_DWORD *)(&result[68].var3.var0 + 1) = *(_DWORD *)v26;
    result[68].var4 = 0;
    result[68].var5 = "initBoolProperty:";
    *(_OWORD *)&result[69].var2.var0 = 0u;
    result[69].var4 = 0;
    result[69].var5 = "initDoubleProperty:";
    result[70].var2.var1 = 14;
    result[70].var3.var1 = 14;
    result[70].var4 = 0;
    result[70].var5 = "initUnsignedIntProperty:";
    result[71].var2.var1 = 2;
    result[71].var3.var1 = 2;
    result[71].var4 = 0;
    result[71].var5 = "initUnsignedIntProperty:";
    *(int64x2_t *)&result[72].var2.var0 = v11;
    result[72].var4 = 0;
    result[72].var5 = "initUnsignedIntProperty:";
    result[73].var2.var1 = 8;
    result[73].var3.var1 = 8;
    result[73].var4 = 0;
    result[73].var5 = "initUnsignedIntProperty:";
    result[74].var2.var1 = 1;
    result[74].var3.var1 = 1;
    result[74].var4 = 1;
    result[74].var5 = "initUnsignedIntProperty:";
    result[75].var2.var0 = 0;
    *(_DWORD *)(&result[75].var2.var0 + 1) = *(_DWORD *)v25;
    HIDWORD(result[75].var2.var3) = *(_DWORD *)&v25[3];
    result[75].var3.var0 = 0;
    *(_DWORD *)(&result[75].var3.var0 + 1) = *(_DWORD *)v24;
    HIDWORD(result[75].var3.var3) = *(_DWORD *)&v24[3];
    result[75].var4 = 0;
    result[75].var5 = "initBoolProperty:";
    result[76].var2.var0 = 0;
    HIDWORD(result[76].var2.var3) = *(_DWORD *)&v23[3];
    *(_DWORD *)(&result[76].var2.var0 + 1) = *(_DWORD *)v23;
    result[76].var3.var0 = 0;
    HIDWORD(result[76].var3.var3) = *(_DWORD *)&v22[3];
    *(_DWORD *)(&result[76].var3.var0 + 1) = *(_DWORD *)v22;
    result[76].var4 = 0;
    result[76].var5 = "initBoolProperty:";
    result[77].var2.var1 = 0;
    result[77].var3.var1 = 0;
    result[77].var4 = 0;
    result[77].var5 = "initIntProperty:";
    result[78].var2.var0 = 0;
    HIDWORD(result[78].var2.var3) = *(_DWORD *)&v21[3];
    *(_DWORD *)(&result[78].var2.var0 + 1) = *(_DWORD *)v21;
    result[78].var3.var0 = 0;
    HIDWORD(result[78].var3.var3) = *(_DWORD *)&v20[3];
    *(_DWORD *)(&result[78].var3.var0 + 1) = *(_DWORD *)v20;
    result[78].var4 = 0;
    result[78].var5 = "initBoolProperty:";
    *(_OWORD *)&result[79].var0 = 0u;
    result[79].var2.var0 = 0;
    HIDWORD(result[79].var2.var3) = 0;
    *(_DWORD *)(&result[79].var2.var0 + 1) = 0;
    result[79].var5 = 0;
    *(_OWORD *)(&result[79].var3.var0 + 1) = v86;
    result[79].var3.var0 = 0;
    self->_prefInitList = result;
  }
  return result;
}

- (BOOL)shouldDisplayFenceHangToHUD
{
  return -[HTPrefs hudEnabled](self, "hudEnabled") && -[HTPrefs isInternal](self, "isInternal");
}

- (BOOL)shouldUpdateHangsHUD
{
  if (-[HTPrefs hudEnabled](self, "hudEnabled") && -[HTPrefs isInternal](self, "isInternal"))
    return 1;
  else
    return -[HTPrefs thirdPartyDevHangHUDEnabled](self, "thirdPartyDevHangHUDEnabled");
}

- (void)refreshHTPrefs
{
  id v3;
  NSObject *v4;
  NSDictionary *v5;
  NSDictionary *installedHTProfileDict;
  HTPrefInit *v7;
  const char *i;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[6];
  uint8_t buf[4];
  const __CFString *v14;

  v3 = sub_10001D38C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v12[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "HTPrefs: Refreshing preferences", (uint8_t *)v12, 2u);
  }

  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", self->__profilePath));
  installedHTProfileDict = self->__installedHTProfileDict;
  self->__installedHTProfileDict = v5;

  CFPreferencesAppSynchronize(self->__htTaskingDomain);
  CFPreferencesAppSynchronize(self->__htDomain);
  -[HTPrefs earlyInitNecessaryPrefs](self, "earlyInitNecessaryPrefs");
  v7 = -[HTPrefs prefInitList](self, "prefInitList");
  v12[3] = 0;
  v12[0] = CFSTR("HangTracerEnabled");
  v12[1] = &self->_hangtracerDaemonEnabled;
  v12[2] = 1;
  v12[4] = 0;
  v12[5] = "initPropertyHangtracerDaemonEnabled:";
  -[HTPrefs initPropertyHangtracerDaemonEnabled:](self, "initPropertyHangtracerDaemonEnabled:", v12);
  for (i = v7->var5; i; ++v7)
  {
    objc_msgSend(self, i, v7);
    i = v7[1].var5;
  }
  if (-[HTPrefs shouldPostHTPrefsChangedNotification](self, "shouldPostHTPrefsChangedNotification"))
  {
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 0);
    v9 = sub_10001D38C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = CFSTR("com.apple.hangtracer.htprefs.refreshed");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Posting notification %@", buf, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("com.apple.hangtracer.htprefs.refreshed"), self, 0);

  }
}

- (void)earlyInitNecessaryPrefs
{
  const char *v2;
  _QWORD *v4;
  _QWORD v5[2];
  char v6;
  char v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  BOOL *p_isInternal;
  char v12;
  char v13;
  uint64_t v14;
  const char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v5[0] = CFSTR("HangTracerEnableCustomerMode");
  v5[1] = &self->_customerModeEnabled;
  v6 = 0;
  v7 = 0;
  v2 = "initBoolProperty:";
  v8 = 0;
  v9 = "initBoolProperty:";
  v10 = 0;
  p_isInternal = &self->_isInternal;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = "initPropertyIsInternal:";
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  if ("initBoolProperty:")
  {
    v4 = v5;
    do
    {
      objc_msgSend(self, v2, v4);
      v2 = (const char *)v4[11];
      v4 += 6;
    }
    while (v2);
  }
}

- (void)__createInternalSettings
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  if (!-[HTPrefs isInternal](self, "isInternal"))
    return;
  v3 = (void *)CFPreferencesCopyValue(CFSTR("HangTracerInternalSettingCreated"), self->__htTaskingDomain, CFSTR("mobile"), kCFPreferencesAnyHost);
  v4 = v3;
  if (!v3 || (objc_msgSend(v3, "BOOLValue") & 1) == 0)
  {
    v5 = sub_10001D38C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "checkPreferences: Internal install, force enabled.", v10, 2u);
    }

    CFPreferencesSetValue(CFSTR("HangTracerEnabled"), kCFBooleanTrue, self->__htTaskingDomain, CFSTR("mobile"), kCFPreferencesAnyHost);
    CFPreferencesSetValue(CFSTR("HangTracerInternalSettingCreated"), kCFBooleanTrue, self->__htTaskingDomain, CFSTR("mobile"), kCFPreferencesAnyHost);
  }
  v7 = (void *)CFPreferencesCopyValue(CFSTR("HangTracerInternalSettingsVersion"), self->__htTaskingDomain, CFSTR("mobile"), kCFPreferencesAnyHost);
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "unsignedIntegerValue") == (id)2)
      goto LABEL_12;
  }
  else
  {
    CFPreferencesSetValue(CFSTR("HangTracerDuration"), 0, self->__htTaskingDomain, CFSTR("mobile"), kCFPreferencesAnyHost);
  }
  CFPreferencesSetValue(CFSTR("HangTracerInternalSettingsVersion"), &off_10007A698, self->__htTaskingDomain, CFSTR("mobile"), kCFPreferencesAnyHost);
LABEL_12:
  v9 = (void *)CFPreferencesCopyValue(CFSTR("HangTracerEnableTailspin"), self->__htTaskingDomain, CFSTR("mobile"), kCFPreferencesAnyHost);
  if (!v9)
    CFPreferencesSetValue(CFSTR("HangTracerEnableTailspin"), kCFBooleanTrue, self->__htTaskingDomain, CFSTR("mobile"), kCFPreferencesAnyHost);
  CFPreferencesSetValue(CFSTR("HangTracerEnableMemoryLogging"), kCFBooleanTrue, self->__htTaskingDomain, CFSTR("mobile"), kCFPreferencesAnyHost);

}

- (void)setupPrefsWithQueue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!v4)
    sub_100038AF8();
  v5 = v4;
  -[HTPrefs setupPrefsWithQueue:profilePath:taskingDomainName:hangtracerDomain:setupInternalPrefs:](self, "setupPrefsWithQueue:profilePath:taskingDomainName:hangtracerDomain:setupInternalPrefs:", v4, CFSTR("/Library/Managed Preferences/mobile/.GlobalPreferences.plist"), CFSTR("com.apple.da"), CFSTR("com.apple.hangtracer"), 1);

}

- (void)setupPrefsWithQueue:(id)a3 profilePath:(id)a4 taskingDomainName:(__CFString *)a5 hangtracerDomain:(__CFString *)a6 setupInternalPrefs:(BOOL)a7
{
  _BOOL4 v7;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  dispatch_queue_attr_t v16;
  NSObject *v17;
  OS_dispatch_queue *v18;
  OS_dispatch_queue *prefsQueue;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[5];
  _QWORD v23[10];
  id v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  int v28;
  _QWORD v29[3];
  int v30;
  uint64_t v31;
  int *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int *v40;
  uint64_t v41;
  int v42;
  uint8_t buf[8];
  uint8_t *v44;
  uint64_t v45;
  int v46;
  id location;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = sub_10001D38C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "HTPrefs initialization", buf, 2u);
  }

  objc_storeStrong((id *)&self->__profilePath, a4);
  self->__htTaskingDomain = a5;
  self->__htDomain = a6;
  *(_WORD *)&self->_shouldAllowSentryEnablement = 0;
  -[HTPrefs earlyInitNecessaryPrefs](self, "earlyInitNecessaryPrefs");
  if (v7)
    -[HTPrefs __createInternalSettings](self, "__createInternalSettings");
  v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.hangtracer.preferences", v17, v12);
  prefsQueue = self->__prefsQueue;
  self->__prefsQueue = v18;

  objc_initWeak(&location, self);
  *(_QWORD *)buf = 0;
  v44 = buf;
  v45 = 0x2020000000;
  v46 = 0;
  v39 = 0;
  v40 = (int *)&v39;
  v41 = 0x2020000000;
  v42 = 0;
  v35 = 0;
  v36 = (int *)&v35;
  v37 = 0x2020000000;
  v38 = 0;
  v31 = 0;
  v32 = (int *)&v31;
  v33 = 0x2020000000;
  v34 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  v25 = 0;
  v26 = (int *)&v25;
  v27 = 0x2020000000;
  v28 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001BB14;
  v23[3] = &unk_100075BC0;
  v23[5] = buf;
  v23[6] = &v39;
  v23[7] = &v35;
  v23[8] = &v31;
  v23[9] = v29;
  objc_copyWeak(&v24, &location);
  v23[4] = self;
  v20 = objc_retainBlock(v23);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10001BE64;
  v22[3] = &unk_100075BE8;
  v22[4] = &v25;
  v21 = objc_retainBlock(v22);
  notify_register_dispatch(off_10007FB10[0], v32 + 6, (dispatch_queue_t)self->__prefsQueue, v20);
  notify_register_dispatch(off_10007FAF8[0], (int *)v44 + 6, (dispatch_queue_t)self->__prefsQueue, v20);
  notify_register_dispatch(off_10007FB00[0], v40 + 6, (dispatch_queue_t)self->__prefsQueue, v20);
  notify_register_dispatch(off_10007FB08[0], v36 + 6, (dispatch_queue_t)self->__prefsQueue, v20);
  notify_register_dispatch(off_10007FB18, v26 + 6, (dispatch_queue_t)self->__prefsQueue, v21);
  -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1);
  -[HTPrefs refreshHTPrefs](self, "refreshHTPrefs");

  objc_destroyWeak(&v24);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);

}

- (void)_removeAllPrefs
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  _QWORD v22[48];

  v22[0] = CFSTR("HangTracerInternalSettingCreated");
  v22[1] = CFSTR("HangTracerInternalSettingsVersion");
  v22[2] = CFSTR("HangTracerReportPeriod");
  v22[3] = CFSTR("HangTracerEnableCustomerMode");
  v22[4] = CFSTR("HangTracerEnabled");
  v22[5] = CFSTR("HangTracerThirdPartyRunloopLogsEnabled");
  v22[6] = CFSTR("HangTracerEnableHUD");
  v22[7] = CFSTR("HangTracerEnableForceQuitDetection");
  v22[8] = CFSTR("HangTracerCollectOSSignposts");
  v22[9] = CFSTR("HangTracerCollectOSSignpostsDeferred");
  v22[10] = CFSTR("HangTracerEnableTailspin");
  v22[11] = CFSTR("HangTracerSavedTailspinsMaxMB");
  v22[12] = CFSTR("HangTracerKeepTailspins");
  v22[13] = CFSTR("HangTracerKeepTailspinsWithFormat");
  v22[14] = CFSTR("HangTracerPercentFullSpinReports");
  v22[15] = CFSTR("HangTracerDailyLogLimit");
  v22[16] = CFSTR("HangTracerPerPeriodLogLimit");
  v22[17] = CFSTR("HangTracerDailyLongLogLimit");
  v22[18] = CFSTR("HangTracerDailyThirdPartyLogLimit");
  v22[19] = CFSTR("HangTracerDuration");
  v22[20] = CFSTR("HangTracerLongHangDurationThreshold");
  v22[21] = CFSTR("HangTracerThirdPartyHangThreshold");
  v22[22] = CFSTR("HangTracerHangTimeoutDuration");
  v22[23] = CFSTR("HangTracerSpringBoardHangIORegGPUDumpTimeout");
  v22[24] = CFSTR("HangTracerIncludeDiskInfo");
  v22[25] = CFSTR("HangTracerEnableDisplayData");
  v22[26] = CFSTR("HangTracerIncludeNetworkState");
  v22[27] = CFSTR("HangTracerFenceTrackingEnabled");
  v22[28] = CFSTR("HangTracerSlowActTailspinsEnabled");
  v22[29] = CFSTR("HangTracerSlowActPerAppMax");
  v22[30] = CFSTR("HangTracerSlowActDailyLogLimit");
  v22[31] = CFSTR("HangTracerSlowActLaunchTailspinThreshold");
  v22[32] = CFSTR("HangTracerEnableSignpostMonitoring");
  v22[33] = CFSTR("HangTracerSignpostMonitoringDailyLogLimit");
  v22[34] = CFSTR("HangTracerSignpostMonitoringPerPeriodLogLimit");
  v22[35] = CFSTR("HangTracerEnableAppLaunchMonitoring");
  v22[36] = CFSTR("HangTracerEnableWorkflowResponsiveness");
  v22[37] = CFSTR("HangTracerWorkflowResponsivenessDailyLogLimit");
  v22[38] = CFSTR("HangTracerWorkflowResponsivenessPerPeriodLogLimit");
  v22[39] = CFSTR("HangTracerEnableMemoryLogging");
  v22[40] = CFSTR("HangTracerMemoryLoggingInterval");
  v22[41] = CFSTR("EPLEnabled");
  v22[42] = CFSTR("EPLTimeoutTimestampSec");
  v22[43] = CFSTR("HangTracerHUDThresholdMSec");
  v22[44] = CFSTR("HangTracerForceQuitDetectionThresholdMSec");
  v22[45] = CFSTR("AutomatedDeviceGroup");
  v22[46] = CFSTR("ExperimentGroup");
  v22[47] = CFSTR("HangTracerHangWaitTimeoutDuration");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 48));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        CFPreferencesSetValue(*(CFStringRef *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v7), 0, self->__htTaskingDomain, CFSTR("mobile"), kCFPreferencesAnyHost);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v5);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = objc_msgSend(&__NSArray0__struct, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(&__NSArray0__struct);
        CFPreferencesSetValue(*(CFStringRef *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), 0, self->__htDomain, CFSTR("mobile"), kCFPreferencesAnyHost);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(&__NSArray0__struct, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v9);
  }
  CFPreferencesSynchronize(self->__htTaskingDomain, CFSTR("mobile"), kCFPreferencesAnyHost);
  CFPreferencesSynchronize(self->__htDomain, CFSTR("mobile"), kCFPreferencesAnyHost);

}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (BOOL)customerModeEnabled
{
  return self->_customerModeEnabled;
}

- (BOOL)hangtracerDaemonEnabled
{
  return self->_hangtracerDaemonEnabled;
}

- (BOOL)htTailspinEnabled
{
  return self->_htTailspinEnabled;
}

- (BOOL)hudEnabled
{
  return self->_hudEnabled;
}

- (BOOL)forceQuitDetectionEnabled
{
  return self->_forceQuitDetectionEnabled;
}

- (BOOL)shouldCollectOSSignposts
{
  return self->_shouldCollectOSSignposts;
}

- (BOOL)shouldCollectOSSignpostsDeferred
{
  return self->_shouldCollectOSSignpostsDeferred;
}

- (BOOL)shouldSaveTailspins
{
  return self->_shouldSaveTailspins;
}

- (BOOL)shouldCompressSavedTailspins
{
  return self->_shouldCompressSavedTailspins;
}

- (unint64_t)savedTailspinMaxMB
{
  return self->_savedTailspinMaxMB;
}

- (BOOL)thirdPartyRunLoopHangLogsEnabled
{
  return self->_thirdPartyRunLoopHangLogsEnabled;
}

- (double)runloopHangPercentHeavyLogs
{
  return self->_runloopHangPercentHeavyLogs;
}

- (int)runLoopMicroHangDailyLogLimit
{
  return self->_runLoopMicroHangDailyLogLimit;
}

- (int)runLoopHangDailyLogLimit
{
  return self->_runLoopHangDailyLogLimit;
}

- (int)runLoopHangPerPeriodLogLimit
{
  return self->_runLoopHangPerPeriodLogLimit;
}

- (int)runLoopLongHangDailyLogLimit
{
  return self->_runLoopLongHangDailyLogLimit;
}

- (int)runloopHangThirdPartyDailyLogLimit
{
  return self->_runloopHangThirdPartyDailyLogLimit;
}

- (int)fenceHangDailyLogLimit
{
  return self->_fenceHangDailyLogLimit;
}

- (unint64_t)runloopHangTimeoutDurationMSec
{
  return self->_runloopHangTimeoutDurationMSec;
}

- (unint64_t)runloopHangDurationThresholdMSec
{
  return self->_runloopHangDurationThresholdMSec;
}

- (unint64_t)runloopLongHangDurationThresholdMSec
{
  return self->_runloopLongHangDurationThresholdMSec;
}

- (unint64_t)runloopHangThirdPartyDurationThresholdMSec
{
  return self->_runloopHangThirdPartyDurationThresholdMSec;
}

- (unint64_t)springBoardHangIORegGPUDumpTimeoutMSec
{
  return self->_springBoardHangIORegGPUDumpTimeoutMSec;
}

- (double)samplingPercentForMicroHangs
{
  return self->_samplingPercentForMicroHangs;
}

- (BOOL)shouldIncludeDiskInfo
{
  return self->_shouldIncludeDiskInfo;
}

- (BOOL)shouldIncludeDisplayData
{
  return self->_shouldIncludeDisplayData;
}

- (BOOL)shouldIncludeNetworkState
{
  return self->_shouldIncludeNetworkState;
}

- (BOOL)shouldUploadToDiagPipe
{
  return self->_shouldUploadToDiagPipe;
}

- (BOOL)fenceTrackingEnabled
{
  return self->_fenceTrackingEnabled;
}

- (BOOL)slowAppActivationTailspinEnabled
{
  return self->_slowAppActivationTailspinEnabled;
}

- (unint64_t)slowAppActivationThresholdMSec
{
  return self->_slowAppActivationThresholdMSec;
}

- (int)slowAppActivationPerAppMaxLogLimit
{
  return self->_slowAppActivationPerAppMaxLogLimit;
}

- (int)slowAppActivationDailyLogLimit
{
  return self->_slowAppActivationDailyLogLimit;
}

- (BOOL)signpostMonitoringEnabled
{
  return self->_signpostMonitoringEnabled;
}

- (BOOL)appLaunchMonitoringEnabled
{
  return self->_appLaunchMonitoringEnabled;
}

- (BOOL)workflowResponsivenessEnabled
{
  return self->_workflowResponsivenessEnabled;
}

- (int)signpostMonitoringDailyLogLimit
{
  return self->_signpostMonitoringDailyLogLimit;
}

- (int)signpostMonitoringPerPeriodLogLimit
{
  return self->_signpostMonitoringPerPeriodLogLimit;
}

- (int)workflowResponsivenessDailyLogLimit
{
  return self->_workflowResponsivenessDailyLogLimit;
}

- (int)workflowResponsivenessPerPeriodLogLimit
{
  return self->_workflowResponsivenessPerPeriodLogLimit;
}

- (BOOL)appActivationLoggingEnabled
{
  return self->_appActivationLoggingEnabled;
}

- (double)appActivationLoggingCPUUtilizationThresholdMSec
{
  return self->_appActivationLoggingCPUUtilizationThresholdMSec;
}

- (unsigned)appActivationLoggingMaxActivationLimit
{
  return self->_appActivationLoggingMaxActivationLimit;
}

- (BOOL)enableLoggingForPoster
{
  return self->_enableLoggingForPoster;
}

- (void)setEnableLoggingForPoster:(BOOL)a3
{
  self->_enableLoggingForPoster = a3;
}

- (BOOL)enableLoggingForWidgetRenderer
{
  return self->_enableLoggingForWidgetRenderer;
}

- (void)setEnableLoggingForWidgetRenderer:(BOOL)a3
{
  self->_enableLoggingForWidgetRenderer = a3;
}

- (BOOL)memoryLoggingEnabled
{
  return self->_memoryLoggingEnabled;
}

- (unsigned)memoryLoggingIntervalSec
{
  return self->_memoryLoggingIntervalSec;
}

- (void)setMemoryLoggingIntervalSec:(unsigned int)a3
{
  self->_memoryLoggingIntervalSec = a3;
}

- (BOOL)pdseHangTracerKillSwitch
{
  return self->_pdseHangTracerKillSwitch;
}

- (BOOL)pdseHTBadDayKillSwitch
{
  return self->_pdseHTBadDayKillSwitch;
}

- (BOOL)pdseHTRateOnlyKillSwitch
{
  return self->_pdseHTRateOnlyKillSwitch;
}

- (BOOL)pdseHTThirdPartyKillSwitch
{
  return self->_pdseHTThirdPartyKillSwitch;
}

- (BOOL)pdseSentryKillSwitch
{
  return self->_pdseSentryKillSwitch;
}

- (BOOL)pdseAppLaunchKillSwitch
{
  return self->_pdseAppLaunchKillSwitch;
}

- (BOOL)pdseWorkflowResponsivenessKillSwitch
{
  return self->_pdseWorkflowResponsivenessKillSwitch;
}

- (BOOL)pdseCATailspinKillSwitch
{
  return self->_pdseCATailspinKillSwitch;
}

- (BOOL)pdseAllowEnableTailspin
{
  return self->_pdseAllowEnableTailspin;
}

- (int)pdseHTPeriodDays
{
  return self->_pdseHTPeriodDays;
}

- (int)pdseHTRateOnlyPeriodDays
{
  return self->_pdseHTRateOnlyPeriodDays;
}

- (int)pdseHTThirdPartyPeriodDays
{
  return self->_pdseHTThirdPartyPeriodDays;
}

- (int)pdseHTThirdPartyNoLogUploadPeriodDays
{
  return self->_pdseHTThirdPartyNoLogUploadPeriodDays;
}

- (int)pdseSentryPeriodDays
{
  return self->_pdseSentryPeriodDays;
}

- (int)pdseAppLaunchPeriodDays
{
  return self->_pdseAppLaunchPeriodDays;
}

- (int)pdseWorkflowResponsivenessPeriodDays
{
  return self->_pdseWorkflowResponsivenessPeriodDays;
}

- (int)pdseCATailspinPeriodDays
{
  return self->_pdseCATailspinPeriodDays;
}

- (BOOL)eplEnabledProfile
{
  return self->_eplEnabledProfile;
}

- (BOOL)eplEnabled
{
  return self->_eplEnabled;
}

- (double)eplTimeoutTimestampSec
{
  return self->_eplTimeoutTimestampSec;
}

- (unint64_t)reportPeriodMATU
{
  return self->_reportPeriodMATU;
}

- (BOOL)hasInternalSettings
{
  return self->_hasInternalSettings;
}

- (unsigned)hudThresholdMSec
{
  return self->_hudThresholdMSec;
}

- (unsigned)forceQuitDetectionThresholdMSec
{
  return self->_forceQuitDetectionThresholdMSec;
}

- (BOOL)thirdPartyDevHangHUDEnabled
{
  return self->_thirdPartyDevHangHUDEnabled;
}

- (BOOL)thirdPartyIncludeNonDevelopmentApps
{
  return self->_thirdPartyIncludeNonDevelopmentApps;
}

- (NSArray)thirdPartyDevPreferredLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 280, 1);
}

- (unint64_t)hangWaitTimeoutDurationMSec
{
  return self->_hangWaitTimeoutDurationMSec;
}

- (BOOL)isCarryDevice
{
  return self->_isCarryDevice;
}

- (NSString)enablementPrefix
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (double)badDaySecondsBetweenLastEnablementAndReferenceDate
{
  return self->_badDaySecondsBetweenLastEnablementAndReferenceDate;
}

- (unsigned)badDayEnablementMinimumBreakDurationDays
{
  return self->_badDayEnablementMinimumBreakDurationDays;
}

- (unsigned)badDayEnablementDurationDays
{
  return self->_badDayEnablementDurationDays;
}

- (unint64_t)badDayEnablementForHangDurationMSec
{
  return self->_badDayEnablementForHangDurationMSec;
}

- (unsigned)badDayEnablementForLogCount
{
  return self->_badDayEnablementForLogCount;
}

- (unsigned)badDayEnablementForPreviousDays
{
  return self->_badDayEnablementForPreviousDays;
}

- (BOOL)haveNonDefaultFeatureFlags
{
  return self->_haveNonDefaultFeatureFlags;
}

- (BOOL)haveSerialLoggingEnabled
{
  return self->_haveSerialLoggingEnabled;
}

- (BOOL)haveRootsInstalled
{
  return self->_haveRootsInstalled;
}

- (int)numOSCryptexFileExtents
{
  return self->_numOSCryptexFileExtents;
}

- (OS_dispatch_queue)_prefsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 320, 1);
}

- (void)set_prefsQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (NSString)tailspinSaveFormat
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (void)setTailspinSaveFormat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (NSString)experimentGroup
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setExperimentGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (NSString)automationGroup
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (void)setAutomationGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (BOOL)keepTailspinsLegacy
{
  return self->_keepTailspinsLegacy;
}

- (void)setKeepTailspinsLegacy:(BOOL)a3
{
  self->_keepTailspinsLegacy = a3;
}

- (NSDictionary)_installedHTProfileDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 352, 1);
}

- (void)set_installedHTProfileDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (NSString)_profilePath
{
  return (NSString *)objc_getProperty(self, a2, 360, 1);
}

- (void)set_profilePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (__CFString)_htTaskingDomain
{
  return self->__htTaskingDomain;
}

- (void)set_htTaskingDomain:(__CFString *)a3
{
  self->__htTaskingDomain = a3;
}

- (__CFString)_htDomain
{
  return self->__htDomain;
}

- (void)set_htDomain:(__CFString *)a3
{
  self->__htDomain = a3;
}

- (BOOL)shouldPostHTPrefsChangedNotification
{
  return self->_shouldPostHTPrefsChangedNotification;
}

- (void)setShouldPostHTPrefsChangedNotification:(BOOL)a3
{
  self->_shouldPostHTPrefsChangedNotification = a3;
}

- (BOOL)shouldAllowSentryEnablement
{
  return self->_shouldAllowSentryEnablement;
}

- (void)setShouldAllowSentryEnablement:(BOOL)a3
{
  self->_shouldAllowSentryEnablement = a3;
}

- (BOOL)shouldAllowWorkflowResponsivenessEnablement
{
  return self->_shouldAllowWorkflowResponsivenessEnablement;
}

- (void)setShouldAllowWorkflowResponsivenessEnablement:(BOOL)a3
{
  self->_shouldAllowWorkflowResponsivenessEnablement = a3;
}

- (BOOL)_isInternalNoOverride
{
  return self->__isInternalNoOverride;
}

- (void)set_isInternalNoOverride:(BOOL)a3
{
  self->__isInternalNoOverride = a3;
}

- (NSString)thirdPartyDevBootSessionUUID
{
  return (NSString *)objc_getProperty(self, a2, 384, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdPartyDevBootSessionUUID, 0);
  objc_storeStrong((id *)&self->__profilePath, 0);
  objc_storeStrong((id *)&self->__installedHTProfileDict, 0);
  objc_storeStrong((id *)&self->_automationGroup, 0);
  objc_storeStrong((id *)&self->_experimentGroup, 0);
  objc_storeStrong((id *)&self->_tailspinSaveFormat, 0);
  objc_storeStrong((id *)&self->__prefsQueue, 0);
  objc_storeStrong((id *)&self->_enablementPrefix, 0);
  objc_storeStrong((id *)&self->_thirdPartyDevPreferredLanguages, 0);
}

@end

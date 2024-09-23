@implementation CSPersistentConfiguration

- (CSPersistentConfiguration)init
{
  CSPersistentConfiguration *v2;
  CSPersistentConfiguration *v3;
  NSURLSession *urlSession;
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *configurationUpdateCallbacks;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSPersistentConfiguration;
  v2 = -[CSPersistentConfiguration init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    urlSession = v2->_urlSession;
    v2->_urlSession = 0;

    *(_WORD *)&v3->_configurationDownloadInProgress = 0;
    v3->_recurrentDownloadPeriod = 0;
    v6 = objc_opt_new(NSMutableArray, v5);
    configurationUpdateCallbacks = v3->_configurationUpdateCallbacks;
    v3->_configurationUpdateCallbacks = (NSMutableArray *)v6;

  }
  return v3;
}

+ (id)sharedConfiguration
{
  if (qword_100389498 != -1)
    dispatch_once(&qword_100389498, &stru_100365A30);
  return (id)qword_1003894A0;
}

+ (id)configBaseKey:(const char *)a3 forFeatureMode:(unsigned __int8)a4
{
  int v5;
  __CFString *v6;
  NSObject *v7;
  id v8;
  void *v9;
  _DWORD v11[2];

  if (a4 == 1)
  {
LABEL_8:
    v6 = &stru_100366D80;
    goto LABEL_9;
  }
  v5 = a4;
  if (a4 != 2)
  {
    if (qword_100387310 != -1)
      dispatch_once(&qword_100387310, &stru_100365A78);
    v7 = qword_100387318;
    if (os_log_type_enabled((os_log_t)qword_100387318, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109120;
      v11[1] = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Missing config prefix for %d", (uint8_t *)v11, 8u);
    }
    goto LABEL_8;
  }
  v6 = CFSTR("Marty");
LABEL_9:
  v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", a3, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v8));

  return v9;
}

- (void)stopRecurringDownload
{
  xpc_activity_unregister((const char *)objc_msgSend(CFSTR("com.apple.anomalydetectiond.CSPersistentConfiguration"), "UTF8String"));
  self->_recurrentDownloadEnabled = 0;
  self->_recurrentDownloadPeriod = 0;
}

- (void)onConfigurationUpdate:(id)a3
{
  NSMutableArray *configurationUpdateCallbacks;
  id v4;

  configurationUpdateCallbacks = self->_configurationUpdateCallbacks;
  v4 = objc_retainBlock(a3);
  -[NSMutableArray addObject:](configurationUpdateCallbacks, "addObject:");

}

- (void)runAllConfigurationUpdateCallbacks
{
  NSMutableArray *v2;
  id v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];

  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = self->_configurationUpdateCallbacks;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * (_QWORD)v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * (_QWORD)v5));
        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (id)isKeyInServerDefaultsWithVersion:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSPlatformInfo sharedInstance](CSPlatformInfo, "sharedInstance", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getSystemVersionDescriptionNoBuild"));
  v5 = objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" "), &stru_100366D80, 0, 0, objc_msgSend(v5, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dictionaryForKey:", CFSTR("CLPersistentConfigurationServerDefaults")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ConfigLookup")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("ConfigLookup")));

  if (v9)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeys"));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v22;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v10);
          v14 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v14));
          if (objc_msgSend(v14, "isEqualToString:", v5))
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v15));
            v18 = v17 == 0;

            if (v18)
              v19 = v7;
            else
              v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v15));
            v16 = v19;

            goto LABEL_16;
          }

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
          continue;
        break;
      }
    }

  }
  v16 = v7;
LABEL_16:

  return v16;
}

- (BOOL)isKeyInServerDefaults:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dictionaryForKey:", CFSTR("CLPersistentConfigurationServerDefaults")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v3));
  LOBYTE(v4) = v6 != 0;

  return (char)v4;
}

- (BOOL)isKeyInUserDefaults:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v3));
  v6 = v5 != 0;

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "setObject:forKey:", v8, v6);

  -[CSPersistentConfiguration runAllConfigurationUpdateCallbacks](self, "runAllConfigurationUpdateCallbacks");
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "setInteger:forKey:", a3, v7);

  -[CSPersistentConfiguration runAllConfigurationUpdateCallbacks](self, "runAllConfigurationUpdateCallbacks");
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "setDouble:forKey:", v7, a3);

  -[CSPersistentConfiguration runAllConfigurationUpdateCallbacks](self, "runAllConfigurationUpdateCallbacks");
}

- (void)setFloat:(float)a3 forKey:(id)a4
{
  void *v6;
  double v7;
  id v8;

  v8 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  *(float *)&v7 = a3;
  objc_msgSend(v6, "setFloat:forKey:", v8, v7);

  -[CSPersistentConfiguration runAllConfigurationUpdateCallbacks](self, "runAllConfigurationUpdateCallbacks");
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "setBool:forKey:", v4, v7);

  -[CSPersistentConfiguration runAllConfigurationUpdateCallbacks](self, "runAllConfigurationUpdateCallbacks");
}

- (id)serverConfigurationToUse:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[CSPersistentConfiguration isKeyInServerDefaultsWithVersion:](self, "isKeyInServerDefaultsWithVersion:", a3));
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[CSPersistentConfiguration isKeyInUserDefaults:](self, "isKeyInUserDefaults:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSPersistentConfiguration serverConfigurationToUse:](self, "serverConfigurationToUse:", v4));
    v5 = v7;
    if (!v7)
    {
      v8 = 0;
      goto LABEL_6;
    }
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v4));
  }
  v8 = (void *)v6;
LABEL_6:

  return v8;
}

- (int64_t)integerForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[CSPersistentConfiguration isKeyInUserDefaults:](self, "isKeyInUserDefaults:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v6 = objc_msgSend(v5, "integerForKey:", v4);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSPersistentConfiguration serverConfigurationToUse:](self, "serverConfigurationToUse:", v4));
    v5 = v7;
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v4));
      v6 = objc_msgSend(v8, "integerValue");

    }
    else
    {
      v6 = 0;
    }
  }

  return (int64_t)v6;
}

- (double)doubleForKey:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;

  v4 = a3;
  if (-[CSPersistentConfiguration isKeyInUserDefaults:](self, "isKeyInUserDefaults:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v5, "doubleForKey:", v4);
    v7 = v6;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSPersistentConfiguration serverConfigurationToUse:](self, "serverConfigurationToUse:", v4));
    v5 = v8;
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v4));
      objc_msgSend(v9, "doubleValue");
      v7 = v10;

    }
    else
    {
      v7 = 0.0;
    }
  }

  return v7;
}

- (float)floatForKey:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  void *v9;
  float v10;

  v4 = a3;
  if (-[CSPersistentConfiguration isKeyInUserDefaults:](self, "isKeyInUserDefaults:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v5, "floatForKey:", v4);
    v7 = v6;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSPersistentConfiguration serverConfigurationToUse:](self, "serverConfigurationToUse:", v4));
    v5 = v8;
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v4));
      objc_msgSend(v9, "floatValue");
      v7 = v10;

    }
    else
    {
      v7 = 0.0;
    }
  }

  return v7;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[CSPersistentConfiguration isKeyInUserDefaults:](self, "isKeyInUserDefaults:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v6 = objc_msgSend(v5, "BOOLForKey:", v4);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSPersistentConfiguration serverConfigurationToUse:](self, "serverConfigurationToUse:", v4));
    v5 = v7;
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v4));
      v6 = objc_msgSend(v8, "BOOLValue");

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)dictionaryForKey:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[CSPersistentConfiguration objectForKey:](self, "objectForKey:", a3));
}

- (id)arrayForKey:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[CSPersistentConfiguration objectForKey:](self, "objectForKey:", a3));
}

- (float)algorithmThresholdNumber:(unint64_t)a3 inArrayForKey:(id)a4 withMinValue:(float)a5 maxValue:(float)a6 defaultValue:(float)a7
{
  id v12;
  void *v13;
  float v14;
  float v15;
  float v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  float v22;
  float v23;
  float v24;

  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("%lu"), a3));
  if (-[CSPersistentConfiguration isKeyInUserDefaults:](self, "isKeyInUserDefaults:", v13)
    && (-[CSPersistentConfiguration floatForKey:](self, "floatForKey:", v13), v14 > a5)
    && (-[CSPersistentConfiguration floatForKey:](self, "floatForKey:", v13), v15 < a6))
  {
    -[CSPersistentConfiguration floatForKey:](self, "floatForKey:", v13);
    a7 = v16;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSPersistentConfiguration arrayForKey:](self, "arrayForKey:", v12));
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSPersistentConfiguration arrayForKey:](self, "arrayForKey:", v12));
      v19 = objc_msgSend(v18, "count");

      if ((unint64_t)v19 > a3)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSPersistentConfiguration arrayForKey:](self, "arrayForKey:", v12));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndex:", a3));

        if (v21)
        {
          objc_msgSend(v21, "floatValue");
          if (v22 > a5)
          {
            objc_msgSend(v21, "floatValue");
            if (v23 < a6)
            {
              objc_msgSend(v21, "floatValue");
              a7 = v24;
            }
          }
        }

      }
    }
  }

  return a7;
}

- (int)algorithmIntegerNumber:(unint64_t)a3 inArrayForKey:(id)a4 withMinValue:(int)a5 maxValue:(int)a6 defaultValue:(int)a7
{
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  float v17;
  float v18;
  NSObject *v19;
  float v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  unint64_t v25;

  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("%lu"), a3));
  if (-[CSPersistentConfiguration isKeyInUserDefaults:](self, "isKeyInUserDefaults:", v13)
    && -[CSPersistentConfiguration integerForKey:](self, "integerForKey:", v13) > a5
    && -[CSPersistentConfiguration integerForKey:](self, "integerForKey:", v13) < a6)
  {
    a7 = -[CSPersistentConfiguration integerForKey:](self, "integerForKey:", v13);
  }
  else
  {
    *(float *)&v14 = (float)a5;
    *(float *)&v15 = (float)a6;
    *(float *)&v16 = (float)a7;
    -[CSPersistentConfiguration algorithmThresholdNumber:inArrayForKey:withMinValue:maxValue:defaultValue:](self, "algorithmThresholdNumber:inArrayForKey:withMinValue:maxValue:defaultValue:", a3, v12, v14, v15, v16);
    v18 = v17;
    if (modff(v17, &v21) >= 0.1)
    {
      if (qword_100387430 != -1)
        dispatch_once(&qword_100387430, &stru_100365A98);
      v19 = qword_100387438;
      if (os_log_type_enabled((os_log_t)qword_100387438, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v12;
        v24 = 2048;
        v25 = a3;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@ server configuration key has invalid integer at position %lu", buf, 0x16u);
      }
    }
    else
    {
      a7 = llroundf(v18);
    }
  }

  return a7;
}

- (BOOL)algorithmBoolNumber:(unint64_t)a3 inArrayForKey:(id)a4 defaultValue:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  unsigned __int8 v13;
  float v14;

  v5 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("%lu"), a3));
  if (-[CSPersistentConfiguration isKeyInUserDefaults:](self, "isKeyInUserDefaults:", v9))
  {
    v13 = -[CSPersistentConfiguration BOOLForKey:](self, "BOOLForKey:", v9);
  }
  else
  {
    if (v5)
      *(float *)&v12 = 1.0;
    else
      *(float *)&v12 = 0.0;
    LODWORD(v10) = -1.0;
    LODWORD(v11) = 2.0;
    -[CSPersistentConfiguration algorithmThresholdNumber:inArrayForKey:withMinValue:maxValue:defaultValue:](self, "algorithmThresholdNumber:inArrayForKey:withMinValue:maxValue:defaultValue:", a3, v8, v10, v11, v12);
    v13 = v14 != 0.0;
  }

  return v13;
}

- (optional<int>)getIntegerDefault:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  const mach_header_64 *v9;
  NSObject *v10;
  int v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSPersistentConfiguration objectForKey:](self, "objectForKey:", v4));
  if (v5)
  {
    v6 = -[CSPersistentConfiguration integerForKey:](self, "integerForKey:", v4);
    v7 = v6 & 0xFFFFFF00;
    v8 = v6;
    v9 = &_mh_execute_header;
  }
  else
  {
    if (qword_100387430 != -1)
      dispatch_once(&qword_100387430, &stru_100365A98);
    v10 = qword_100387438;
    if (os_log_type_enabled((os_log_t)qword_100387438, OS_LOG_TYPE_DEBUG))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "default not found for %@", (uint8_t *)&v12, 0xCu);
    }
    v9 = 0;
    v8 = 0;
    v7 = 0;
  }

  return (optional<int>)(v8 | (unint64_t)v9 | v7);
}

- (optional<float>)getFloatDefault:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  const mach_header_64 *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSPersistentConfiguration objectForKey:](self, "objectForKey:", v4));
  if (v5)
  {
    -[CSPersistentConfiguration floatForKey:](self, "floatForKey:", v4);
    v7 = v6 & 0xFFFFFF00;
    v8 = v6;
    v9 = &_mh_execute_header;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v7 = 0;
  }

  return (optional<float>)((unint64_t)v9 | v8 | v7);
}

- (optional<BOOL>)getBooleanDefault:(id)a3
{
  id v4;
  void *v5;
  unsigned __int16 v6;
  __int16 v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSPersistentConfiguration objectForKey:](self, "objectForKey:", v4));
  if (v5)
  {
    v6 = -[CSPersistentConfiguration BOOLForKey:](self, "BOOLForKey:", v4);
    v7 = 1;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }

  return (optional<BOOL>)(v6 | (v7 << 8));
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v6;
  NSURLSession *urlSession;
  NSObject *v8;
  NSURLSession *v9;
  int v10;
  id v11;

  v6 = a5;
  urlSession = self->_urlSession;
  if (v6)
  {
    -[NSURLSession invalidateAndCancel](urlSession, "invalidateAndCancel");
    if (qword_100387430 != -1)
      dispatch_once(&qword_100387430, &stru_100365A98);
    v8 = qword_100387438;
    if (os_log_type_enabled((os_log_t)qword_100387438, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "completed with error %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    -[NSURLSession finishTasksAndInvalidate](urlSession, "finishTasksAndInvalidate");
  }
  v9 = self->_urlSession;
  self->_urlSession = 0;

  self->_configurationDownloadInProgress = 0;
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  NSURLSession *urlSession;
  _QWORD handler[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;

  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v6));
  if (v7)
  {
    v22 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v7, 1, &v22));
    v9 = v22;
    if (v9)
    {
      if (qword_100387430 != -1)
        dispatch_once(&qword_100387430, &stru_100365A98);
      v10 = qword_100387438;
      if (os_log_type_enabled((os_log_t)qword_100387438, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "couldn't decode server configuration: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (qword_100387430 != -1)
        dispatch_once(&qword_100387430, &stru_100365A98);
      v12 = qword_100387438;
      if (os_log_type_enabled((os_log_t)qword_100387438, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "server configuration: %@{public}@", buf, 0xCu);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dictionaryForKey:", CFSTR("CLPersistentConfigurationServerDefaults")));

      if (qword_100387430 != -1)
        dispatch_once(&qword_100387430, &stru_100365A98);
      v15 = qword_100387438;
      if (os_log_type_enabled((os_log_t)qword_100387438, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Updating local configuration", buf, 2u);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v16, "setObject:forKey:", v8, CFSTR("CLPersistentConfigurationServerDefaults"));

      -[CSPersistentConfiguration runAllConfigurationUpdateCallbacks](self, "runAllConfigurationUpdateCallbacks");
      if (self->_recurrentDownloadEnabled)
      {
        objc_initWeak((id *)buf, self);
        v17 = (const char *)objc_msgSend(CFSTR("com.apple.anomalydetectiond.CSPersistentConfiguration"), "UTF8String");
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_1002D18A0;
        handler[3] = &unk_100365A58;
        objc_copyWeak(&v21, (id *)buf);
        v20 = v14;
        xpc_activity_register(v17, XPC_ACTIVITY_CHECK_IN, handler);

        objc_destroyWeak(&v21);
        objc_destroyWeak((id *)buf);
      }

    }
    -[NSURLSession finishTasksAndInvalidate](self->_urlSession, "finishTasksAndInvalidate");
    urlSession = self->_urlSession;
    self->_urlSession = 0;

    self->_configurationDownloadInProgress = 0;
  }
  else
  {
    if (qword_100387430 != -1)
      dispatch_once(&qword_100387430, &stru_100365A98);
    v11 = qword_100387438;
    if (os_log_type_enabled((os_log_t)qword_100387438, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Couldn't get data from downloaded file, check sandbox violations", buf, 2u);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationUpdateCallbacks, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
}

@end

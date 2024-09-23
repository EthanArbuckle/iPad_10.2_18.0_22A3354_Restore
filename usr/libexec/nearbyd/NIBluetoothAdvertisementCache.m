@implementation NIBluetoothAdvertisementCache

- (NIBluetoothAdvertisementCache)init
{
  NIBluetoothAdvertisementCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NIBluetoothAdvertisementCache;
  v2 = -[NIBluetoothAdvertisementCache init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cache = v2->_cache;
    v2->_cache = v3;

    v2->_maximumSampleCount = 8;
    v2->_maximumSampleAge = 1200.0;
  }
  return v2;
}

- (NSArray)allSamples
{
  void *v3;
  NSMutableDictionary *cache;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  cache = self->_cache;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10019F2E8;
  v7[3] = &unk_10080B4A8;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cache, "enumerateKeysAndObjectsUsingBlock:", v7);

  return (NSArray *)v5;
}

- (void)addSample:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *cache;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  if (v5)
  {
    cache = self->_cache;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](cache, "objectForKey:", v7));

    if (!v8)
    {
      v9 = self->_cache;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, v11);

    }
    v12 = self->_cache;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v12, "objectForKey:", v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v20);
          v22 = mach_continuous_time();
          v23 = TMConvertTicksToSeconds(v22);
          objc_msgSend(v21, "machContinuousTimeSeconds", (_QWORD)v26);
          if (v23 - v24 > self->_maximumSampleAge)
            objc_msgSend(v15, "addObject:", v21);
          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v18);
    }

    objc_msgSend(v16, "removeObjectsInArray:", v15);
    if ((unint64_t)objc_msgSend(v16, "count") >= self->_maximumSampleCount)
      objc_msgSend(v16, "removeObjectAtIndex:", 0);
    objc_msgSend(v16, "addObject:", v4, (_QWORD)v26);

  }
  else
  {
    v25 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
      sub_1003D5C08(v25);
  }

}

- (BOOL)isSampleInCache:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  double v19;
  double v20;
  double v21;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothAdvertisementCache allSamples](self, "allSamples", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v4, "machContinuousTimeSeconds");
        v11 = v10;
        objc_msgSend(v9, "machContinuousTimeSeconds");
        v13 = vabdd_f64(v11, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        v16 = objc_msgSend(v14, "isEqualToString:", v15);

        v17 = objc_msgSend(v4, "channel");
        v18 = objc_msgSend(v9, "channel");
        objc_msgSend(v4, "rssi");
        v20 = v19;
        objc_msgSend(v9, "rssi");
        if (v13 < 0.001 && v16 != 0 && v17 == v18 && v20 == v21)
        {
          LOBYTE(v6) = 1;
          goto LABEL_20;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_20:

  return (char)v6;
}

- (id)cachedSamplesForIdentifier:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", a3));
  v4 = objc_msgSend(v3, "copy");

  return v4;
}

- (void)clear
{
  -[NSMutableDictionary removeAllObjects](self->_cache, "removeAllObjects");
}

- (int64_t)maximumSampleCount
{
  return self->_maximumSampleCount;
}

- (void)setMaximumSampleCount:(int64_t)a3
{
  self->_maximumSampleCount = a3;
}

- (double)maximumSampleAge
{
  return self->_maximumSampleAge;
}

- (void)setMaximumSampleAge:(double)a3
{
  self->_maximumSampleAge = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end

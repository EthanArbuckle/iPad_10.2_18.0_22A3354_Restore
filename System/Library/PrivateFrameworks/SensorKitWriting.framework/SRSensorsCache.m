@implementation SRSensorsCache

- (SRSensorDescription)descriptionForSensor:(uint64_t)a1
{
  void *v4;
  char v5;
  SRSensorDescription *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  char v22;
  SRSensorDescription *v24;
  __int128 v25;
  char v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  SRSensorDescription *v32;
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  SRSensorDescription *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v4 = (void *)objc_msgSend(a2, "sr_sensorByDeletingDeletionRecord");
  v5 = objc_msgSend(v4, "isEqualToString:", a2);
  v6 = (SRSensorDescription *)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v4);
  if (!v6)
  {
    v26 = v5;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = *(void **)(a1 + 16);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v29;
      v27 = *MEMORY[0x24BDD0B88];
      *(_QWORD *)&v9 = 138543362;
      v25 = v9;
LABEL_5:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v12);
        v14 = objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("plist"), v25);
        if (!v14)
          break;
        v15 = objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:relativeToURL:", v14, 0, v13);
        v32 = 0;
        v16 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v15, &v32);
        if (v16)
        {
          v6 = -[SRSensorDescription initWithDictionary:]([SRSensorDescription alloc], "initWithDictionary:", v16);
          v17 = -[SRSensorDescription name](v6, "name");
          objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v6, v17);
          if (-[SRSensorDescription legacyName](v6, "legacyName"))
            objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v6, -[SRSensorDescription legacyName](v6, "legacyName"));
          v18 = SRLogSensorsCache;
          if (os_log_type_enabled((os_log_t)SRLogSensorsCache, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v35 = v17;
            v36 = 2114;
            v37 = v6;
            _os_log_impl(&dword_245CD7000, v18, OS_LOG_TYPE_INFO, "Cached description for %{public}@, %{public}@", buf, 0x16u);
          }
          if (v6)
            goto LABEL_27;
        }
        else if (objc_msgSend((id)-[SRSensorDescription domain](v32, "domain"), "isEqualToString:", v27)
               && -[SRSensorDescription code](v32, "code") == 260)
        {
          v19 = SRLogSensorsCache;
          if (os_log_type_enabled((os_log_t)SRLogSensorsCache, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v25;
            v35 = v15;
            _os_log_impl(&dword_245CD7000, v19, OS_LOG_TYPE_INFO, "%{public}@ not found", buf, 0xCu);
          }
        }
        else
        {
          v20 = SRLogSensorsCache;
          if (os_log_type_enabled((os_log_t)SRLogSensorsCache, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v35 = v15;
            v36 = 2114;
            v37 = v32;
            _os_log_error_impl(&dword_245CD7000, v20, OS_LOG_TYPE_ERROR, "Failed to parse %{public}@ because %{public}@", buf, 0x16u);
          }
        }
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
          if (v10)
            goto LABEL_5;
          goto LABEL_24;
        }
      }
    }
    else
    {
LABEL_24:
      v21 = SRLogSensorsCache;
      if (os_log_type_enabled((os_log_t)SRLogSensorsCache, OS_LOG_TYPE_ERROR))
      {
        v24 = *(SRSensorDescription **)(a1 + 16);
        *(_DWORD *)buf = 138543618;
        v35 = (uint64_t)v4;
        v36 = 2114;
        v37 = v24;
        _os_log_error_impl(&dword_245CD7000, v21, OS_LOG_TYPE_ERROR, "Failed to find description for %{public}@ in %{public}@", buf, 0x16u);
      }
    }
    v6 = 0;
LABEL_27:
    v5 = v26;
  }
  if (v6)
    v22 = v5;
  else
    v22 = 1;
  if ((v22 & 1) != 0)
    return v6;
  return (SRSensorDescription *)+[SRSensorDescription sensorDescriptionForDeletionRecordFromDescription:](SRSensorDescription, "sensorDescriptionForDeletionRecordFromDescription:", v6);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    SRLogSensorsCache = (uint64_t)os_log_create("com.apple.SensorKit", "SensorsCache");
}

+ (uint64_t)defaultCache
{
  uint64_t result;

  objc_opt_self();
  result = _MergedGlobals_1;
  if (!_MergedGlobals_1)
  {
    objc_opt_self();
    if (qword_257519FF8 != -1)
      dispatch_once(&qword_257519FF8, &__block_literal_global_0);
    return qword_257519FF0;
  }
  return result;
}

+ (void)setDefaultCache:(id)a3
{
  if ((id)_MergedGlobals_1 != a3)
  {

    _MergedGlobals_1 = (uint64_t)a3;
  }
}

SRSensorsCache *__29__SRSensorsCache_sharedCache__block_invoke()
{
  SRSensorsCache *result;

  result = objc_alloc_init(SRSensorsCache);
  qword_257519FF0 = (uint64_t)result;
  return result;
}

- (SRSensorsCache)init
{
  void *v3;
  Class v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCF48];
  v4 = NSClassFromString(CFSTR("SRSensorReader"));
  if (!v4 || (v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", v4), "bundleURL")) == 0)
  {
    v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", 0), "URLForDirectory:inDomain:appropriateForURL:create:error:", 5, 8, 0, 0, &v16);
    if (!v6)
    {
      v7 = SRLogSensorsCache;
      if (os_log_type_enabled((os_log_t)SRLogSensorsCache, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v16;
        _os_log_fault_impl(&dword_245CD7000, v7, OS_LOG_TYPE_FAULT, "Failed to locate the /System/Library directory because %{public}@", buf, 0xCu);
      }
      v6 = objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/System/Library"));
    }
    v5 = objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:relativeToURL:", objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", &unk_2516F6578), 1, v6);
  }
  v8 = objc_msgSend(v3, "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("SensorDescriptions"), 1, v5);
  v9 = objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", CFSTR("/var/mobile/Library"), 1);
  v10 = objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("SensorKit"), 1, v9);
  if (v10)
  {
    v11 = objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("SensorDescriptions"), 1, v10);
    v18[0] = v8;
    v18[1] = v11;
    v12 = (void *)MEMORY[0x24BDBCE30];
    v13 = v18;
    v14 = 2;
  }
  else
  {
    v17 = v8;
    v12 = (void *)MEMORY[0x24BDBCE30];
    v13 = &v17;
    v14 = 1;
  }
  return -[SRSensorsCache initWithDirectories:](self, "initWithDirectories:", objc_msgSend(v12, "arrayWithObjects:count:", v13, v14));
}

- (SRSensorsCache)initWithDirectories:(id)a3
{
  SRSensorsCache *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRSensorsCache;
  v4 = -[SRSensorsCache init](&v6, sel_init);
  if (v4)
  {
    v4->_sensorsCache = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    v4->_sensorDescriptionsDirs = (NSArray *)a3;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_sensorDescriptionsDirs = 0;
  self->_sensorsCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)SRSensorsCache;
  -[SRSensorsCache dealloc](&v3, sel_dealloc);
}

- (_QWORD)allSensorDescriptions
{
  void *v1;
  SRSensorDescriptionEnumerator *v2;
  _QWORD *v3;
  objc_super v4;

  if (result)
  {
    v1 = result;
    v2 = [SRSensorDescriptionEnumerator alloc];
    if (v2)
    {
      v4.receiver = v2;
      v4.super_class = (Class)SRSensorDescriptionEnumerator;
      v3 = objc_msgSendSuper2(&v4, sel_init);
      if (v3)
        v3[1] = v1;
      return v3;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

@end

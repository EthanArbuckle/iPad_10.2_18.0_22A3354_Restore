@implementation IMPersistentCache

- (IMPersistentCache)initWithPath:(id)a3 maxSize:(unint64_t)a4
{
  id v6;
  IMPersistentCache *v7;
  IMPersistentCache *v8;
  NSMutableSet *v9;
  NSMutableSet *accessedIds;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  IMDatabaseHandle *v19;
  IMDatabaseHandle *db;
  IMAdminTable *v21;
  IMAdminTable *adminTable;
  void *v23;
  void *v24;
  unsigned int v25;
  IMDatabaseHandle *v26;
  void *v27;
  IMDatabaseHandle *v28;
  IMDatabaseHandle *v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  NSMutableSet *v34;
  NSMutableSet *unknownKeys;
  IMAdminTable *v36;
  void *v37;
  id v38;
  void *v39;
  NSTimer *v40;
  NSTimer *scanTimer;
  void *v42;
  IMPersistentCache *v43;
  objc_super v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;

  v6 = a3;
  v45.receiver = self;
  v45.super_class = (Class)IMPersistentCache;
  v7 = -[IMPersistentCache init](&v45, "init");
  v8 = v7;
  if (!v7)
    goto LABEL_18;
  v7->_maxSize = a4;
  v9 = objc_opt_new(NSMutableSet);
  accessedIds = v8->_accessedIds;
  v8->_accessedIds = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v12, CFSTR("RemoveImageCacheFiles")));
  objc_msgSend(v11, "registerDefaults:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "environment"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("RemoveImageCacheFiles")));
  if ((objc_msgSend(v16, "BOOLValue") & 1) != 0)
  {

  }
  else
  {
    v17 = objc_msgSend(v11, "BOOLForKey:", CFSTR("RemoveImageCacheFiles"));

    if ((v17 & 1) == 0)
      goto LABEL_6;
  }
  v18 = objc_alloc_init((Class)NSFileManager);
  objc_msgSend(v18, "removeItemAtPath:error:", v6, 0);
  objc_msgSend(v11, "setBool:forKey:", 0, CFSTR("RemoveImageCacheFiles"));

LABEL_6:
  v19 = -[IMDatabaseHandle initWithPath:]([IMDatabaseHandle alloc], "initWithPath:", v6);
  db = v8->_db;
  v8->_db = v19;

  v21 = -[IMAdminTable initWithDatabaseHandle:]([IMAdminTable alloc], "initWithDatabaseHandle:", v8->_db);
  adminTable = v8->_adminTable;
  v8->_adminTable = v21;

  if (!-[IMAdminTable hasDatabaseVersion](v8->_adminTable, "hasDatabaseVersion"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle tableNames](v8->_db, "tableNames"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForKey:", CFSTR("name")));
    v25 = objc_msgSend(v24, "containsObject:", CFSTR("items"));

    if (v25)
      -[IMAdminTable setDatabaseVersion:](v8->_adminTable, "setDatabaseVersion:", 1);
  }
  if (!-[IMPersistentCache _createStorageForDb:](v8, "_createStorageForDb:", v8->_db))
  {
    v26 = v8->_db;
    v8->_db = 0;

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v27, "removeItemAtPath:error:", v6, 0);

    v28 = -[IMDatabaseHandle initWithPath:]([IMDatabaseHandle alloc], "initWithPath:", v6);
    v29 = v8->_db;
    v8->_db = v28;

    -[IMPersistentCache _createStorageForDb:](v8, "_createStorageForDb:", v8->_db);
    v30 = BCIMLog();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v47 = "-[IMPersistentCache initWithPath:maxSize:]";
      v48 = 2080;
      v49 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Cache/BCPersistentCache.m";
      v50 = 1024;
      v51 = 113;
      _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v32 = BCIMLog();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "@\"Could not create cache structure, reinitialized backing store\", buf, 2u);
    }

  }
  v8->_cacheSize = -[IMPersistentCache _loadCacheSize](v8, "_loadCacheSize");
  v34 = objc_opt_new(NSMutableSet);
  unknownKeys = v8->_unknownKeys;
  v8->_unknownKeys = v34;

  v8->_accessedIdsLock._os_unfair_lock_opaque = 0;
  v8->_unknownKeysLock._os_unfair_lock_opaque = 0;
  v8->_cacheSizeLock._os_unfair_lock_opaque = 0;
  v36 = v8->_adminTable;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[IMAdminTable setLastAccessDate:](v36, "setLastAccessDate:", v37);

  if (a4)
  {
    v38 = objc_alloc((Class)NSTimer);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 2.0));
    v40 = (NSTimer *)objc_msgSend(v38, "initWithFireDate:interval:target:selector:userInfo:repeats:", v39, v8, "_updateCaches:", 0, 1, 300.0);
    scanTimer = v8->_scanTimer;
    v8->_scanTimer = v40;

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v42, "addTimer:forMode:", v8->_scanTimer, NSDefaultRunLoopMode);

  }
  v43 = v8;

LABEL_18:
  return v8;
}

- (void)_createCacheTable:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("create table if not exists items (pk %@, key %@, accessDate %@, width %@, height %@, bpc %@, bpp %@, bpr %@, scale %@, mimeType %@, resourceSize %@, resourceData %@)"), CFSTR("integer primary key"), CFSTR("text"), CFSTR("date"), CFSTR("integer"), CFSTR("integer"), CFSTR("integer"), CFSTR("integer"), CFSTR("integer"), CFSTR("float"), CFSTR("text"), CFSTR("integer"), CFSTR("blob")));
  objc_msgSend(v4, "addObject:", v5);
  objc_msgSend(v4, "addObject:", CFSTR("create index if not exists items_key_index on items (key)"));

  -[IMAdminTable setDatabaseVersion:](self->_adminTable, "setDatabaseVersion:", 2);
}

- (BOOL)_createStorageForDb:(id)a3
{
  id v4;
  NSMutableArray *v5;
  int64_t v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v6 = -[IMAdminTable databaseVersion](self->_adminTable, "databaseVersion");
  if (v6 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("alter table items add column scale %@"), CFSTR("integer")));
    -[NSMutableArray addObject:](v5, "addObject:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v8, "scale");
    v10 = (uint64_t)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("update items set scale = %ld"), v10));
    -[NSMutableArray addObject:](v5, "addObject:", v11);

    -[IMAdminTable setDatabaseVersion:](self->_adminTable, "setDatabaseVersion:", 2);
  }
  else if (!v6)
  {
    -[IMPersistentCache _createCacheTable:](self, "_createCacheTable:", v5);
  }
  objc_msgSend(v4, "runStatement:arguments:", CFSTR("pragma page_size=32768"), 0);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v5;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(v4, "runStatement:arguments:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v15), 0);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

  objc_msgSend(v4, "runStatement:arguments:", CFSTR("pragma journal_mode=WAL"), 0);
  objc_msgSend(v4, "runStatement:arguments:", CFSTR("pragma synchronous=normal"), 0);

  return 1;
}

- (BOOL)enableCaseSensitiveLike
{
  return -[IMDatabaseHandle runStatement:arguments:](self->_db, "runStatement:arguments:", CFSTR("pragma case_sensitive_like=ON"), 0);
}

- (void)insertData:(id)a3 forKey:(id)a4 mimeType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("insert into items (key, accessDate, mimeType, resourceSize, resourceData) values (?,?,?,?,?)")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v8, "length")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v9, v12, v10, v13, v8, 0));

  if (-[IMDatabaseHandle runStatement:arguments:](self->_db, "runStatement:arguments:", v11, v14))
  {
    -[IMPersistentCache _adjustCacheSizeBy:](self, "_adjustCacheSizeBy:", objc_msgSend(v8, "length"));
    -[IMPersistentCache _unknownKeysRemoveObject:](self, "_unknownKeysRemoveObject:", v9);
  }

}

- (BOOL)_insertCGImage:(CGImage *)a3 forKey:(id)a4 mimeType:(id)a5 scale:(double)a6 properties:(id)a7
{
  id v12;
  __CFData *v13;
  __CFString *v14;
  CGImageDestination *v15;
  CGImageDestination *v16;
  NSNumber *v17;
  NSNumber *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  id v28;
  void *v29;
  id v30;

  v30 = a4;
  v12 = a5;
  v28 = a7;
  v13 = (__CFData *)objc_alloc_init((Class)NSMutableData);
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("image/jpeg")))
  {
    v14 = (__CFString *)kUTTypeJPEG;
  }
  else
  {
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePNG, "identifier"));

  }
  v15 = CGImageDestinationCreateWithData(v13, v14, 1uLL, 0);
  if (v15)
  {
    v16 = v15;
    CGImageDestinationAddImage(v15, a3, (CFDictionaryRef)v28);
    CGImageDestinationFinalize(v16);
    CFRelease(v16);
  }
  v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", CGImageGetWidth(a3));
  v29 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v18 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", CGImageGetHeight(a3));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("insert into items (key, accessDate, width, height, scale, mimeType, resourceSize, resourceData) values (?,?,?,?,?,?,?,?)")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  *(float *)&v22 = a6;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v22));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[__CFData length](v13, "length")));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v30, v21, v29, v19, v23, v12, v24, v13, 0));

  if (-[IMDatabaseHandle runStatement:arguments:](self->_db, "runStatement:arguments:", v20, v25))
  {
    -[IMPersistentCache _adjustCacheSizeBy:](self, "_adjustCacheSizeBy:", -[__CFData length](v13, "length"));
    -[IMPersistentCache _unknownKeysRemoveObject:](self, "_unknownKeysRemoveObject:", v30);
    v26 = 1;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (BOOL)insertCGImage:(CGImage *)a3 forKey:(id)a4 mimeType:(id)a5 scale:(double)a6 properties:(id)a7
{
  id v12;
  id v13;
  id v14;
  unsigned __int8 v15;
  BOOL v16;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("image/jpeg")) & 1) != 0
    || objc_msgSend(v13, "isEqualToString:", CFSTR("image/png")))
  {
    v15 = -[IMPersistentCache _insertCGImage:forKey:mimeType:scale:properties:](self, "_insertCGImage:forKey:mimeType:scale:properties:", a3, v12, v13, v14, a6);
  }
  else
  {
    v15 = -[IMPersistentCache _insertCGImage:forKey:](self, "_insertCGImage:forKey:", a3, v12);
  }
  v16 = v15;

  return v16;
}

- (BOOL)insertCGImage:(CGImage *)a3 forKey:(id)a4 mimeType:(id)a5 properties:(id)a6
{
  return -[IMPersistentCache insertCGImage:forKey:mimeType:scale:properties:](self, "insertCGImage:forKey:mimeType:scale:properties:", a3, a4, a5, a6, 1.0);
}

- (BOOL)insertCGImage:(CGImage *)a3 forKey:(id)a4 mimeType:(id)a5
{
  return -[IMPersistentCache insertCGImage:forKey:mimeType:properties:](self, "insertCGImage:forKey:mimeType:properties:", a3, a4, a5, 0);
}

- (BOOL)_insertCGImage:(CGImage *)a3 forKey:(id)a4
{
  id v6;
  CGColorSpace *DeviceRGB;
  unint64_t Width;
  unint64_t Height;
  size_t v10;
  size_t v11;
  void *v12;
  void *v13;
  CGContextRef v14;
  CGContext *v15;
  void *Data;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  BOOL v25;
  id v27;
  IMPersistentCache *v28;
  void *v29;
  id v30;
  id v31;
  CGRect v32;

  v6 = a4;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  v10 = ((14 * (_BYTE)Width) & 0xE) + 2 * Width;
  v11 = v10 * Height;
  v12 = malloc_type_calloc(1uLL, v10 * Height, 0x7D1788F0uLL);
  if (!v12)
    goto LABEL_7;
  v13 = v12;
  v14 = CGBitmapContextCreate(v12, Width, Height, 5uLL, v10, DeviceRGB, 0x1006u);
  if (!v14)
  {
    free(v13);
LABEL_7:
    CGColorSpaceRelease(DeviceRGB);
    v25 = 0;
    goto LABEL_12;
  }
  v15 = v14;
  v31 = v6;
  CGColorSpaceRelease(DeviceRGB);
  v32.origin.x = 0.0;
  v32.origin.y = 0.0;
  v32.size.width = (double)Width;
  v32.size.height = (double)Height;
  CGContextDrawImage(v15, v32, a3);
  Data = CGBitmapContextGetData(v15);
  if (Data)
  {
    v28 = self;
    v30 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", Data, v11);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("insert into items (key, accessDate, width, height, bpc, bpp, bpr, mimeType, resourceSize, resourceData) values (?,?,?,?,?,?,?,?,?,?)")));
    v27 = objc_alloc((Class)NSArray);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", Width));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", Height));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 5));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 2));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11));
    v24 = objc_msgSend(v27, "initWithObjects:", v31, v17, v18, v19, v20, v21, v22, CFSTR("image/argb1555"), v23, v30, 0);

    if (-[IMDatabaseHandle runStatement:arguments:](v28->_db, "runStatement:arguments:", v29, v24))
    {
      -[IMPersistentCache _adjustCacheSizeBy:](v28, "_adjustCacheSizeBy:", objc_msgSend(v30, "length"));
      -[IMPersistentCache _unknownKeysRemoveObject:](v28, "_unknownKeysRemoveObject:", v31);
      v25 = 1;
    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }
  free(v13);
  CGContextRelease(v15);
  v6 = v31;
LABEL_12:

  return v25;
}

- (CGImage)copyCGImageForKey:(id)a3
{
  return -[IMPersistentCache copyCGImageForKey:resourceSize:](self, "copyCGImageForKey:resourceSize:", a3, 0);
}

- (CGImage)_copyCGImageForRow:(id)a3 size:(CGSize *)a4 resourceSize:(int64_t *)a5 scale:(double *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  void *v24;
  void *v25;
  CGImage *v26;
  id v27;
  CGDataProvider *v28;
  CGColorSpace *DeviceRGB;
  size_t v30;
  uint64_t v31;
  double v32;
  void *v33;
  id bitsPerComponent;
  id v36;
  id v37;

  v10 = a3;
  if (objc_msgSend(v10, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", 0));
    -[IMPersistentCache _accessedIdsAddObject:](self, "_accessedIdsAddObject:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", 9));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", 1));
      v36 = objc_msgSend(v13, "integerValue");

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", 2));
      v37 = objc_msgSend(v14, "integerValue");

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", 3));
      bitsPerComponent = objc_msgSend(v15, "integerValue");

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", 4));
      v17 = objc_msgSend(v16, "integerValue");

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", 5));
      v19 = objc_msgSend(v18, "integerValue");

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", 6));
      objc_msgSend(v20, "floatValue");
      v22 = v21;

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", 7));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      if ((objc_msgSend(v23, "isEqual:", v24) & 1) != 0)
        v25 = 0;
      else
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", 7));

      v27 = objc_retainAutorelease(v12);
      v28 = CGDataProviderCreateWithData(v27, objc_msgSend(v27, "bytes"), (size_t)objc_msgSend(v27, "length"), (CGDataProviderReleaseDataCallback)sub_B7A68);
      if (objc_msgSend(v25, "isEqualToString:", CFSTR("image/argb1555")))
      {
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        v30 = 8 * (_QWORD)v17;
        v31 = (uint64_t)v36;
        v26 = CGImageCreate((size_t)v36, (size_t)v37, (size_t)bitsPerComponent, v30, (size_t)v19, DeviceRGB, 0x1006u, v28, 0, 0, kCGRenderingIntentDefault);
        CGColorSpaceRelease(DeviceRGB);
      }
      else if (objc_msgSend(v25, "isEqualToString:", CFSTR("image/jpeg")))
      {
        v26 = CGImageCreateWithJPEGDataProvider(v28, 0, 1, kCGRenderingIntentDefault);
        v31 = (uint64_t)v36;
      }
      else
      {
        v31 = (uint64_t)v36;
        if (objc_msgSend(v25, "isEqualToString:", CFSTR("image/png")))
          v26 = CGImageCreateWithPNGDataProvider(v28, 0, 1, kCGRenderingIntentDefault);
        else
          v26 = 0;
      }
      v32 = v22;
      CGDataProviderRelease(v28);
      if (a4)
      {
        a4->width = (double)v31 / v32;
        a4->height = (double)(uint64_t)v37 / v32;
      }
      if (a6)
        *a6 = v32;
      if (a5)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", 8));
        *a5 = (int64_t)objc_msgSend(v33, "integerValue");

      }
    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (CGImage)copyCGImageForKey:(id)a3 resourceSize:(int64_t *)a4 scale:(double *)a5
{
  id v8;
  void *v9;
  CGImage *v10;
  IMDatabaseHandle *db;
  void *v12;
  void *v13;

  v8 = a3;
  if (v8)
  {
    if (-[IMPersistentCache _unknownKeysContainsObject:](self, "_unknownKeysContainsObject:", v8))
    {
      v9 = 0;
    }
    else
    {
      db = self->_db;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v8));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle arrayForQuery:arguments:rawRows:](db, "arrayForQuery:arguments:rawRows:", CFSTR("select pk, width, height, bpc, bpp, bpr, scale, mimeType, resourceSize, resourcedata from items where key = ? limit 1"), v12, 1));

    }
    if (objc_msgSend(v9, "count"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 0));
      v10 = -[IMPersistentCache _copyCGImageForRow:size:resourceSize:scale:](self, "_copyCGImageForRow:size:resourceSize:scale:", v13, 0, a4, a5);

    }
    else
    {
      -[IMPersistentCache _unknownKeysAddObject:](self, "_unknownKeysAddObject:", v8);
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)insertCGImages:(id)a3 forKey:(id)a4 mimeType:(id)a5 baseSize:(CGSize)a6 properties:(id)a7
{
  double width;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;
  uint64_t v20;
  void *i;
  CGImage *v22;
  size_t v23;
  double v24;
  int v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *j;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];

  width = a6.width;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("image/jpeg")) & 1) != 0
    || objc_msgSend(v14, "isEqualToString:", CFSTR("image/png")))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v16 = v12;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v17)
    {
      v18 = v17;
      v32 = v12;
      v19 = 0;
      v20 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v20)
            objc_enumerationMutation(v16);
          v22 = *(CGImage **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          v23 = CGImageGetWidth(v22);
          if (v23)
          {
            v24 = round((double)v23 / width);
            if (v24 < 1.0)
              v24 = 1.0;
          }
          else
          {
            v24 = 1.0;
          }
          if (-[IMPersistentCache _insertCGImage:forKey:mimeType:scale:properties:](self, "_insertCGImage:forKey:mimeType:scale:properties:", v22, v13, v14, v15, v24))
          {
            v19 = 1;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v18);
      LOBYTE(v25) = v19 & 1;
      v12 = v32;
      goto LABEL_27;
    }
LABEL_26:
    LOBYTE(v25) = 0;
    goto LABEL_27;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v26 = v12;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (!v27)
    goto LABEL_26;
  v28 = v27;
  v25 = 0;
  v29 = *(_QWORD *)v34;
  do
  {
    for (j = 0; j != v28; j = (char *)j + 1)
    {
      if (*(_QWORD *)v34 != v29)
        objc_enumerationMutation(v26);
      v25 |= -[IMPersistentCache _insertCGImage:forKey:](self, "_insertCGImage:forKey:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j), v13);
    }
    v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  }
  while (v28);
LABEL_27:

  return v25 & 1;
}

- (id)CGImagesForKey:(id)a3 size:(CGSize *)a4 resourceSize:(int64_t *)a5
{
  id v6;
  void *v7;
  void *v8;
  IMDatabaseHandle *db;
  void *v10;
  id v11;
  id v12;
  id v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  CGImage *v22;
  CGImage *v23;
  _BOOL4 v24;
  void *v26;
  id v27;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v6 = a3;
  if (v6)
  {
    if (-[IMPersistentCache _unknownKeysContainsObject:](self, "_unknownKeysContainsObject:", v6))
    {
      v7 = 0;
    }
    else
    {
      db = self->_db;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v6));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle arrayForQuery:arguments:rawRows:](db, "arrayForQuery:arguments:rawRows:", CFSTR("select pk, width, height, bpc, bpp, bpr, scale, mimeType, resourceSize, resourcedata from items where key = ?"), v10, 1));

    }
    if (objc_msgSend(v7, "count"))
    {
      v26 = v7;
      v27 = v6;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v11 = v7;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v12)
      {
        v13 = v12;
        v8 = 0;
        v14 = 0;
        v15 = 0;
        v16 = *(_QWORD *)v31;
LABEL_9:
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(v11);
          if ((v14 & v15 & 1) != 0)
            break;
          v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndex:", 6));
          objc_msgSend(v19, "floatValue");
          v21 = v20;

          if ((v14 & (v21 == 1.0)) != 0)
          {
            v14 = 1;
          }
          else if ((v21 != 2.0) | (v15 ^ 1) & 1)
          {
            v22 = -[IMPersistentCache _copyCGImageForRow:size:resourceSize:scale:](self, "_copyCGImageForRow:size:resourceSize:scale:", v18, a4, a5, 0);
            if (v22)
            {
              v23 = v22;
              if (!v8)
                v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
              v24 = v21 != 1.0;
              v14 |= v21 == 1.0;
              if (v21 != 2.0)
                v24 = 0;
              v15 |= v24;
              objc_msgSend(v8, "addObject:", v23, v26, v27);
              CFRelease(v23);
            }
          }
          if (v13 == (id)++v17)
          {
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
            if (v13)
              goto LABEL_9;
            break;
          }
        }
      }
      else
      {
        v8 = 0;
      }

      v7 = v26;
      v6 = v27;
    }
    else
    {
      -[IMPersistentCache _unknownKeysAddObject:](self, "_unknownKeysAddObject:", v6);
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGImage)copyCGImageForKey:(id)a3 resourceSize:(int64_t *)a4
{
  return -[IMPersistentCache copyCGImageForKey:resourceSize:scale:](self, "copyCGImageForKey:resourceSize:scale:", a3, a4, 0);
}

- (id)firstImageKeyWithRootKey:(id)a3
{
  id v4;
  id v5;
  IMDatabaseHandle *db;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%%%@%%"), v4);

  db = self->_db;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle arrayForQuery:arguments:rawRows:](db, "arrayForQuery:arguments:rawRows:", CFSTR("select key from items where key like ? order by width desc limit 1"), v7, 1));

  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)itemsForMimeType:(id)a3
{
  IMDatabaseHandle *db;
  void *v4;
  void *v5;

  db = self->_db;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle arrayForQuery:arguments:rawRows:](db, "arrayForQuery:arguments:rawRows:", CFSTR("select * from items where mimeType = ?"), v4, 0));

  return v5;
}

- (id)deleteItemsForMimeType:(id)a3
{
  void *v4;
  IMDatabaseHandle *db;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByAppendingString:", CFSTR("%%")));
  db = self->_db;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v4));
  -[IMDatabaseHandle runStatement:arguments:](db, "runStatement:arguments:", CFSTR("delete from items where mimeType like ?"), v6);

  -[IMDatabaseHandle runStatement:arguments:](self->_db, "runStatement:arguments:", CFSTR("vacuum"), 0);
  return 0;
}

- (BOOL)hasItemForKey:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  if (-[IMPersistentCache _unknownKeysContainsObject:](self, "_unknownKeysContainsObject:", v4))
  {
    v5 = 0;
  }
  else
  {
    v6 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle arrayForQuery:arguments:rawRows:](self->_db, "arrayForQuery:arguments:rawRows:", CFSTR("select pk from items where key = ? limit 1"), v6, 1));
    v8 = objc_msgSend(v7, "count");
    v5 = v8 != 0;
    if (!v8)
      -[IMPersistentCache _unknownKeysAddObject:](self, "_unknownKeysAddObject:", v4);

  }
  return v5;
}

- (id)dataForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  IMDatabaseHandle *db;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    if (-[IMPersistentCache _unknownKeysContainsObject:](self, "_unknownKeysContainsObject:", v4))
    {
      v5 = 0;
    }
    else
    {
      db = self->_db;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v4));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle arrayForQuery:arguments:rawRows:](db, "arrayForQuery:arguments:rawRows:", CFSTR("select pk, resourcedata from items where key = ? limit 1"), v8, 1));

    }
    if (objc_msgSend(v5, "count"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 0));
      if (objc_msgSend(v9, "count"))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 0));
        -[IMPersistentCache _accessedIdsAddObject:](self, "_accessedIdsAddObject:", v10);

        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 1));
LABEL_12:

        goto LABEL_13;
      }

    }
    else
    {
      -[IMPersistentCache _unknownKeysAddObject:](self, "_unknownKeysAddObject:", v4);
    }
    v6 = 0;
    goto LABEL_12;
  }
  v6 = 0;
LABEL_13:

  return v6;
}

- (void)deleteItemForKey:(id)a3
{
  id v4;
  IMDatabaseHandle *db;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  IMDatabaseHandle *v11;
  void *v12;

  v4 = a3;
  if (-[IMPersistentCache hasItemForKey:](self, "hasItemForKey:", v4))
  {
    db = self->_db;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle arrayForQuery:arguments:rawRows:](db, "arrayForQuery:arguments:rawRows:", CFSTR("select resourceSize from items where key = ?"), v6, 1));

    if (objc_msgSend(v7, "count"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", 0));
      if (objc_msgSend(v8, "count"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 0));
        v10 = (uint64_t)objc_msgSend(v9, "integerValue");

        if (v10 >= 1)
        {
          v11 = self->_db;
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v4));
          LODWORD(v11) = -[IMDatabaseHandle runStatement:arguments:](v11, "runStatement:arguments:", CFSTR("delete from items where key = ?"), v12);

          if ((_DWORD)v11)
            -[IMPersistentCache _adjustCacheSizeBy:](self, "_adjustCacheSizeBy:", -v10);
        }
      }

    }
  }

}

- (void)deleteItemsWithKeyLike:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v5));
    -[IMPersistentCache deleteItemsWithAllKeysContaining:](self, "deleteItemsWithAllKeysContaining:", v4);

  }
}

- (void)deleteItemsWithAllKeysContaining:(id)a3
{
  id v3;
  unint64_t v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  IMDatabaseHandle *db;
  void *v21;
  unsigned int v22;
  unsigned int v23;
  void *v24;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v27 = v3;
    if (objc_msgSend(v3, "count"))
    {
      v4 = 0;
      v5 = &stru_296430;
      do
      {
        if (-[__CFString length](v5, "length"))
        {
          v6 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR(" AND ")));

          v5 = (__CFString *)v6;
        }
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR(" key like ? ")));

        ++v4;
        v5 = v7;
      }
      while (v4 < (unint64_t)objc_msgSend(v27, "count"));
    }
    else
    {
      v7 = &stru_296430;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("select resourceSize, pk from items where "), "stringByAppendingString:", v7));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle arrayForQuery:arguments:rawRows:](self->_db, "arrayForQuery:arguments:rawRows:", v24, v27, 1));
    if (objc_msgSend(v26, "count"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v9 = v26;
      v10 = 0;
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v29 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v14, "count") == (char *)&dword_0 + 2)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", 0));
              v16 = objc_msgSend(v15, "integerValue");

              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", 1));
              objc_msgSend(v8, "addObject:", v17);

              v10 += (uint64_t)v16;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v11);
      }

      if (objc_msgSend(v8, "count"))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMDatabaseHandle questionMarkListForCollection:](IMDatabaseHandle, "questionMarkListForCollection:", v8));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("delete from items where pk in %@"), v18));

        db = self->_db;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
        v22 = -[IMDatabaseHandle runStatement:arguments:](db, "runStatement:arguments:", v19, v21);

        if (v10)
          v23 = v22;
        else
          v23 = 0;
        if (v23 == 1)
          -[IMPersistentCache _adjustCacheSizeBy:](self, "_adjustCacheSizeBy:", -v10);
      }
      else
      {
        v19 = v24;
      }

    }
    else
    {
      v19 = v24;
    }

    v3 = v27;
  }

}

- (void)replaceDataForKey:(id)a3 withData:(id)a4 mimeType:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[IMPersistentCache deleteItemForKey:](self, "deleteItemForKey:", v10);
  -[IMPersistentCache insertData:forKey:mimeType:](self, "insertData:forKey:mimeType:", v9, v10, v8);

}

- (id)dataForKey:(id)a3 mimeType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  IMDatabaseHandle *db;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if (-[IMPersistentCache _unknownKeysContainsObject:](self, "_unknownKeysContainsObject:", v6))
    {
      v8 = 0;
    }
    else
    {
      db = self->_db;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v6, v7, 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle arrayForQuery:arguments:rawRows:](db, "arrayForQuery:arguments:rawRows:", CFSTR("select pk, resourcedata from items where key = ? and mimeType = ? limit 1"), v11, 1));

    }
    if (objc_msgSend(v8, "count"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 0));
      if (objc_msgSend(v12, "count"))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", 0));
        -[IMPersistentCache _accessedIdsAddObject:](self, "_accessedIdsAddObject:", v13);

        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", 1));
LABEL_12:

        goto LABEL_13;
      }

    }
    else
    {
      -[IMPersistentCache _unknownKeysAddObject:](self, "_unknownKeysAddObject:", v6);
    }
    v9 = 0;
    goto LABEL_12;
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (unint64_t)resourceSizeForKey:(id)a3
{
  id v4;
  IMDatabaseHandle *db;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v4 = a3;
  if (v4)
  {
    db = self->_db;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle arrayForQuery:arguments:rawRows:](db, "arrayForQuery:arguments:rawRows:", CFSTR("select resourceSize from items where key = ?"), v6, 1));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
      v9 = v8;
      if (v8)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
        v11 = (unint64_t)objc_msgSend(v10, "unsignedIntegerValue");

      }
      else
      {
        v11 = 0x7FFFFFFFFFFFFFFFLL;
      }

    }
    else
    {
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)allKeys
{
  return -[IMDatabaseHandle stringColumnDataForQuery:withArguments:](self->_db, "stringColumnDataForQuery:withArguments:", CFSTR("select key from items"), 0);
}

- (void)clear
{
  if (-[IMDatabaseHandle runStatement:arguments:](self->_db, "runStatement:arguments:", CFSTR("delete from items"), 0))
  {
    os_unfair_lock_lock(&self->_cacheSizeLock);
    self->_cacheSize = 0;
    os_unfair_lock_unlock(&self->_cacheSizeLock);
    -[IMPersistentCache _saveCacheSize:](self, "_saveCacheSize:", 0);
    -[IMPersistentCache _accessedIdsRemoveAllObjects](self, "_accessedIdsRemoveAllObjects");
  }
}

- (id)metadataForKey:(id)a3
{
  id v4;
  IMDatabaseHandle *db;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  db = self->_db;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle arrayForQuery:arguments:rawRows:](db, "arrayForQuery:arguments:rawRows:", CFSTR("select key, accessDate, width, height, mimeType, scale, resourceSize from items where key = ?"), v6, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  return v8;
}

- (void)_adjustCacheSizeBy:(int64_t)a3
{
  os_unfair_lock_s *p_cacheSizeLock;
  unint64_t v6;

  p_cacheSizeLock = &self->_cacheSizeLock;
  os_unfair_lock_lock(&self->_cacheSizeLock);
  v6 = self->_cacheSize + a3;
  self->_cacheSize = v6;
  os_unfair_lock_unlock(p_cacheSizeLock);
  -[IMPersistentCache _saveCacheSize:](self, "_saveCacheSize:", v6);
}

- (void)_saveCacheSize:(int64_t)a3
{
  IMAdminTable *adminTable;
  id v4;

  adminTable = self->_adminTable;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[IMAdminTable setProperty:forKey:domain:](adminTable, "setProperty:forKey:domain:", v4, CFSTR("cacheSize"), CFSTR("statistics"));

}

- (unint64_t)_loadCacheSize
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMAdminTable numberValueForKey:domain:](self->_adminTable, "numberValueForKey:domain:", CFSTR("cacheSize"), CFSTR("statistics")));
  v3 = objc_msgSend(v2, "integerValue");

  return (unint64_t)v3;
}

- (void)_LRUCleanupForMimeType:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  unint64_t cacheSize;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  IMDatabaseHandle *db;
  void *v20;
  os_unfair_lock_t lock;
  void *context;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -86400.0));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("%%")));

  context = objc_autoreleasePoolPush();
  v6 = CFSTR("select pk, accessDate, resourceSize from items where mimeType like ?");
  if (!v24)
    v6 = CFSTR("select pk, accessDate, resourceSize from items");
  v26 = v6;
  if (v24)
    v7 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v24));
  else
    v7 = 0;
  v23 = (void *)v7;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle arrayForQuery:arguments:rawRows:](self->_db, "arrayForQuery:arguments:rawRows:", v26));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  os_unfair_lock_lock(&self->_cacheSizeLock);
  cacheSize = self->_cacheSize;
  lock = &self->_cacheSizeLock;
  os_unfair_lock_unlock(&self->_cacheSizeLock);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectEnumerator"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextObject"));
  if (v10)
  {
    do
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("accessDate")));
      v12 = objc_msgSend(v11, "compare:", v5);

      if (v12 == (id)-1)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("resourceSize")));
        v14 = objc_msgSend(v13, "integerValue");

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("pk")));
        cacheSize -= (unint64_t)v14;
        objc_msgSend(v27, "addObject:", v15);

        if (cacheSize < self->_maxSize)
          break;
      }
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextObject"));

      v10 = (void *)v16;
    }
    while (v16);
  }
  if (objc_msgSend(v27, "count"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[IMDatabaseHandle questionMarkListForCollection:](IMDatabaseHandle, "questionMarkListForCollection:", v27));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("delete from items where pk in %@"), v17));

    db = self->_db;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "allObjects"));
    LODWORD(db) = -[IMDatabaseHandle runStatement:arguments:](db, "runStatement:arguments:", v18, v20);

    -[IMDatabaseHandle runStatement:arguments:](self->_db, "runStatement:arguments:", CFSTR("vacuum"), 0);
    if ((_DWORD)db)
    {
      os_unfair_lock_lock(lock);
      self->_cacheSize = cacheSize;
      os_unfair_lock_unlock(lock);
      -[IMPersistentCache _saveCacheSize:](self, "_saveCacheSize:", cacheSize);
    }

  }
  objc_autoreleasePoolPop(context);

}

- (void)_updateCaches:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t cacheSize;

  v4 = a3;
  os_unfair_lock_lock(&self->_accessedIdsLock);
  v5 = -[NSMutableSet copy](self->_accessedIds, "copy");
  os_unfair_lock_unlock(&self->_accessedIdsLock);
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMDatabaseHandle questionMarkListForCollection:](IMDatabaseHandle, "questionMarkListForCollection:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("update items set accessDate = ? where pk in %@"), v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
    objc_msgSend(v9, "addObjectsFromArray:", v10);

    if (-[IMDatabaseHandle runStatement:arguments:](self->_db, "runStatement:arguments:", v7, v9))
      -[IMPersistentCache _accessedIdsRemoveAllObjects](self, "_accessedIdsRemoveAllObjects");

  }
  os_unfair_lock_lock(&self->_cacheSizeLock);
  cacheSize = self->_cacheSize;
  os_unfair_lock_unlock(&self->_cacheSizeLock);
  if (cacheSize > self->_maxSize)
    -[IMPersistentCache _LRUCleanupForMimeType:](self, "_LRUCleanupForMimeType:", 0);

}

- (int64_t)version
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMAdminTable numberValueForKey:domain:](self->_adminTable, "numberValueForKey:domain:", CFSTR("version"), CFSTR("database")));
  v3 = objc_msgSend(v2, "integerValue");

  return (int64_t)v3;
}

- (BOOL)_unknownKeysContainsObject:(id)a3
{
  IMPersistentCache *v3;
  os_unfair_lock_s *p_unknownKeysLock;
  id v5;

  v3 = self;
  p_unknownKeysLock = &self->_unknownKeysLock;
  v5 = a3;
  os_unfair_lock_lock(p_unknownKeysLock);
  LOBYTE(v3) = -[NSMutableSet containsObject:](v3->_unknownKeys, "containsObject:", v5);

  os_unfair_lock_unlock(p_unknownKeysLock);
  return (char)v3;
}

- (void)_unknownKeysRemoveObject:(id)a3
{
  os_unfair_lock_s *p_unknownKeysLock;
  id v5;

  p_unknownKeysLock = &self->_unknownKeysLock;
  v5 = a3;
  os_unfair_lock_lock(p_unknownKeysLock);
  -[NSMutableSet removeObject:](self->_unknownKeys, "removeObject:", v5);

  os_unfair_lock_unlock(p_unknownKeysLock);
}

- (void)_unknownKeysAddObject:(id)a3
{
  os_unfair_lock_s *p_unknownKeysLock;
  id v5;

  p_unknownKeysLock = &self->_unknownKeysLock;
  v5 = a3;
  os_unfair_lock_lock(p_unknownKeysLock);
  -[NSMutableSet addObject:](self->_unknownKeys, "addObject:", v5);

  os_unfair_lock_unlock(p_unknownKeysLock);
}

- (void)_accessedIdsRemoveAllObjects
{
  os_unfair_lock_s *p_accessedIdsLock;

  p_accessedIdsLock = &self->_accessedIdsLock;
  os_unfair_lock_lock(&self->_accessedIdsLock);
  -[NSMutableSet removeAllObjects](self->_accessedIds, "removeAllObjects");
  os_unfair_lock_unlock(p_accessedIdsLock);
}

- (void)_accessedIdsAddObject:(id)a3
{
  os_unfair_lock_s *p_accessedIdsLock;
  id v5;

  p_accessedIdsLock = &self->_accessedIdsLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessedIdsLock);
  -[NSMutableSet addObject:](self->_accessedIds, "addObject:", v5);

  os_unfair_lock_unlock(p_accessedIdsLock);
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_scanTimer, 0);
  objc_storeStrong((id *)&self->_unknownKeys, 0);
  objc_storeStrong((id *)&self->_accessedIds, 0);
  objc_storeStrong((id *)&self->_adminTable, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end

@implementation THReflowablePaginationCache

+ (id)loadFromArchiveWithAssetID:(id)a3 bookVersionString:(id)a4 modificationDate:(id)a5
{
  id v9;
  NSData *v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  id v22;
  NSObject *global_queue;
  _QWORD block[5];
  uint64_t v25;

  if (-[NSUserDefaults BOOLForKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "BOOLForKey:", CFSTR("BKEpubPaginationCache_DisableCacheLoading"))|| !objc_msgSend(a3, "length"))
  {
    return 0;
  }
  v9 = objc_msgSend(a1, "archiveStorageURLForAssetID:", a3);
  v25 = 0;
  if (!v9
    || (v10 = +[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v9, 0, &v25)) == 0)
  {
    v13 = THLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_2715B4();
    return 0;
  }
  v11 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v10, &v25);
  if (v11)
  {
    v12 = objc_msgSend(v11, "decodeObjectOfClasses:forKey:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(THReflowablePaginationCache), 0), CFSTR("root"));
  }
  else
  {
    v15 = THLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_271628();
    v12 = 0;
  }

  if (a4
    && (v16 = objc_opt_class(NSString),
        *(_QWORD *)&v17 = TSUDynamicCast(v16, objc_msgSend(v12, "bookVersionString")).n128_u64[0],
        !objc_msgSend(a4, "isEqualToString:", v18, v17))
    || a5
    && (v19 = objc_opt_class(NSDate),
        *(_QWORD *)&v20 = TSUDynamicCast(v19, objc_msgSend(v12, "bookModificationDate")).n128_u64[0],
        !objc_msgSend(a5, "isEqual:", v21, v20)))
  {
    v12 = 0;
  }
  v22 = objc_msgSend(v9, "URLByDeletingLastPathComponent");
  global_queue = dispatch_get_global_queue(-2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10B204;
  block[3] = &unk_426DD0;
  block[4] = v22;
  dispatch_async(global_queue, block);
  return v12;
}

+ (id)archiveStorageURLForAssetID:(id)a3
{
  NSFileManager *v4;
  NSArray *v5;
  id result;
  id v7;
  unsigned int v8;
  uint64_t v9;

  v4 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v5 = -[NSFileManager URLsForDirectory:inDomains:](v4, "URLsForDirectory:inDomains:", 13, 1);
  result = -[NSArray count](v5, "count");
  if (result)
  {
    v7 = objc_msgSend(-[NSArray objectAtIndex:](v5, "objectAtIndex:", 0), "URLByAppendingPathComponent:", CFSTR("PaginationCache"));
    v9 = 0;
    v8 = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v9);
    result = 0;
    if (v8)
      return objc_msgSend(v7, "URLByAppendingPathComponent:", a3);
  }
  return result;
}

- (THReflowablePaginationCache)initWithAssetID:(id)a3 bookVersionString:(id)a4 modificationDate:(id)a5
{
  THReflowablePaginationCache *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THReflowablePaginationCache;
  v8 = -[THReflowablePaginationCache init](&v10, "init");
  if (v8)
  {
    v8->_assetID = (NSString *)objc_msgSend(a3, "copy");
    v8->_bookVersionString = (NSString *)objc_msgSend(a4, "copy");
    v8->_bookModificationDate = (NSDate *)a5;
    v8->_mutableResults = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THReflowablePaginationCache;
  -[THReflowablePaginationCache dealloc](&v3, "dealloc");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (THReflowablePaginationCache)initWithCoder:(id)a3
{
  THReflowablePaginationCache *v4;
  uint64_t v5;
  uint64_t v6;
  Class v7;

  v4 = -[THReflowablePaginationCache init](self, "init");
  if (v4)
  {
    if (objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("encodingVersion")) == (char *)&dword_18 + 3)
    {
      v5 = objc_opt_class(NSDictionary);
      v6 = objc_opt_class(THModelContentNodeReflowablePaginationResults);
      v7 = NSClassFromString(CFSTR("THPaginationResultsKey"));
      v4->_mutableResults = (NSMutableDictionary *)objc_msgSend(objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, v7, objc_opt_class(THPresentationType), 0), CFSTR("cachedResults")), "mutableCopy");
      v4->_assetID = (NSString *)objc_msgSend(objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("assetID")), "copy");
      v4->_bookVersionString = (NSString *)objc_msgSend(objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("bookVersionString")), "copy");
      v4->_bookModificationDate = (NSDate *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("modificationDate"));
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;

  objc_msgSend(a3, "encodeInteger:forKey:", 27, CFSTR("encodingVersion"));
  objc_msgSend(a3, "encodeObject:forKey:", -[THReflowablePaginationCache assetID](self, "assetID"), CFSTR("assetID"));
  objc_msgSend(a3, "encodeObject:forKey:", -[THReflowablePaginationCache bookVersionString](self, "bookVersionString"), CFSTR("bookVersionString"));
  objc_msgSend(a3, "encodeObject:forKey:", -[THReflowablePaginationCache bookModificationDate](self, "bookModificationDate"), CFSTR("modificationDate"));
  v5 = -[NSMutableDictionary copy](self->_mutableResults, "copy");
  objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("cachedResults"));

}

- (void)cacheResult:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_mutableResults, "setObject:forKey:", a3, a4);
}

- (id)cachedResultsForKey:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_mutableResults, "objectForKey:", a3);
}

- (id)keyEnumerator
{
  return -[NSMutableDictionary keyEnumerator](self->_mutableResults, "keyEnumerator");
}

- (void)archive
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;

  if (-[NSString length](-[THReflowablePaginationCache assetID](self, "assetID"), "length"))
  {
    v3 = objc_msgSend((id)objc_opt_class(self), "archiveStorageURLForAssetID:", -[THReflowablePaginationCache assetID](self, "assetID"));
    v4 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
    objc_msgSend(v4, "encodeObject:forKey:", self, CFSTR("root"));
    objc_msgSend(v4, "finishEncoding");
    v6 = 0;
    if ((objc_msgSend(objc_msgSend(v4, "encodedData"), "writeToURL:options:error:", v3, 1, &v6) & 1) == 0)
    {
      v5 = THLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_2716D4();
    }

  }
}

+ (void)_evictOlderCacheFiles:(id)a3
{
  NSDirectoryEnumerator *v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  unint64_t v14;
  BOOL v15;
  NSFileManager *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];

  v20[0] = NSURLFileSizeKey;
  v20[1] = NSURLContentModificationDateKey;
  v16 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v4 = -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](v16, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", a3, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2), 1, 0);
  v5 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v6 = -[NSDirectoryEnumerator nextObject](v4, "nextObject");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    do
    {
      v19[0] = NSURLFileSizeKey;
      v19[1] = NSURLContentModificationDateKey;
      v9 = objc_msgSend(v7, "resourceValuesForKeys:error:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2), 0);
      v10 = objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", NSURLFileSizeKey), "unsignedLongLongValue");
      v17[1] = NSURLFileSizeKey;
      v18[0] = v7;
      v8 += (unint64_t)v10;
      v17[0] = CFSTR("url");
      v18[1] = objc_msgSend(v9, "objectForKeyedSubscript:", NSURLFileSizeKey);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2), objc_msgSend(v9, "objectForKeyedSubscript:", NSURLContentModificationDateKey));
      v7 = -[NSDirectoryEnumerator nextObject](v4, "nextObject");
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  v11 = objc_msgSend(objc_msgSend(objc_msgSend(v5, "allKeys"), "sortedArrayUsingSelector:", "compare:"), "mutableCopy");
  if (v8 > 0x4C4B40)
  {
    v12 = v11;
    do
    {
      if (!objc_msgSend(v12, "count"))
        break;
      v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      -[NSFileManager removeItemAtURL:error:](v16, "removeItemAtURL:error:", objc_msgSend(objc_msgSend(v5, "objectForKeyedSubscript:", v13), "objectForKeyedSubscript:", CFSTR("url")), 0);
      v14 = (unint64_t)objc_msgSend(objc_msgSend(objc_msgSend(v5, "objectForKeyedSubscript:", v13), "objectForKeyedSubscript:", NSURLFileSizeKey), "unsignedLongLongValue");
      v15 = v8 >= v14;
      v8 -= v14;
      if (!v15)
        break;
      objc_msgSend(v5, "removeObjectForKey:", v13);
      objc_msgSend(v12, "removeObjectAtIndex:", 0);
    }
    while (v8 > 0x4C4B40);
  }
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)bookVersionString
{
  return self->_bookVersionString;
}

- (void)setBookVersionString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)bookModificationDate
{
  return self->_bookModificationDate;
}

- (void)setBookModificationDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSMutableDictionary)mutableResults
{
  return self->_mutableResults;
}

- (void)setMutableResults:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end

@implementation BKTextIndex

+ (id)_cachedIndexFileNameForName:(id)a3 createIndicesDirectoryIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  id v13;
  char v14;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication applicationCacheDirectory](UIApplication, "applicationCacheDirectory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("searchIndices")));

  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v14 = 0;
    if ((objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v7, &v14) & 1) != 0)
    {
      if (!v14)
        +[NSException raise:format:](NSException, "raise:format:", CFSTR("BTTextIndexException"), CFSTR("'%@' is not a directory."), v7);
    }
    else
    {
      v13 = 0;
      v9 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v13);
      v10 = v13;
      if ((v9 & 1) == 0)
        +[NSException raise:format:](NSException, "raise:format:", CFSTR("BTTextIndexException"), CFSTR("Directory '%@' could not be created (%@)."), v7, v10);

    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@.index"), v7, v5));

  return v11;
}

+ (id)_cachedIndexFileNameForName:(id)a3
{
  return objc_msgSend(a1, "_cachedIndexFileNameForName:createIndicesDirectoryIfNeeded:", a3, 1);
}

+ (id)bookIndexWithName:(id)a3
{
  id v4;
  id v5;
  BKTextIndex *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  uint64_t v11;
  BKTextIndex *v12;
  BKTextIndex *v13;

  v4 = a3;
  if (v4)
  {
    v5 = a1;
    objc_sync_enter(v5);
    v6 = (BKTextIndex *)objc_claimAutoreleasedReturnValue(+[IMTextIndex textIndexWithName:](IMTextIndex, "textIndexWithName:", v4));
    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_cachedIndexFileNameForName:", v4));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v7));
      v9 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v8, 0);
      *(_QWORD *)&v10 = objc_opt_class(BKTextIndex).n128_u64[0];
      v12 = (BKTextIndex *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "decodeObjectOfClass:forKey:", v11, NSKeyedArchiveRootObjectKey, v10));
      v6 = v12;
      if (v12 && (char *)-[BKTextIndex version](v12, "version") == (char *)&dword_4 + 1
        || (v13 = -[BKTextIndex initWithName:]([BKTextIndex alloc], "initWithName:", v4),
            v6,
            (v6 = v13) != 0))
      {
        +[IMTextIndex addTextIndex:withName:](IMTextIndex, "addTextIndex:withName:", v6, v4);
      }

    }
    objc_sync_exit(v5);

  }
  else
  {
    NSLog(CFSTR("Warning : Missing index name in %s"), "+[BKTextIndex bookIndexWithName:]");
    v6 = 0;
  }

  return v6;
}

+ (void)invalidateBookIndicesWithNames:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v15 = v5;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9);
          v11 = a1;
          objc_sync_enter(v11);
          +[IMTextIndex removeTextIndexWithName:](IMTextIndex, "removeTextIndexWithName:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_cachedIndexFileNameForName:createIndicesDirectoryIfNeeded:", v10, 0));
          v13 = v12;
          if (v12 && objc_msgSend(v12, "length"))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
            objc_msgSend(v14, "removeItemAtPath:error:", v13, 0);

          }
          objc_sync_exit(v11);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v5 = v15;
  }

}

+ (BOOL)doesBookIndexWithNameExist:(id)a3 isLoaded:(BOOL *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  BOOL v13;

  v6 = a3;
  v7 = a1;
  objc_sync_enter(v7);
  v8 = objc_claimAutoreleasedReturnValue(+[IMTextIndex textIndexWithName:](IMTextIndex, "textIndexWithName:", v6));
  v9 = (void *)v8;
  if (a4)
    *a4 = v8 != 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_cachedIndexFileNameForName:", v6));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v12 = objc_msgSend(v11, "fileExistsAtPath:", v10);

  if (v9)
    v13 = 1;
  else
    v13 = v12;

  objc_sync_exit(v7);
  return v13;
}

- (void)save
{
  BKTextIndex *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[BKTextIndex closeIndex](self, "closeIndex");
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_isDirty)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTextIndex name](v3, "name"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKTextIndex _cachedIndexFileNameForName:](BKTextIndex, "_cachedIndexFileNameForName:", v4));

    v8 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v8));
    v7 = v8;
    if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_11D77C((uint64_t)v7);
    objc_msgSend(v6, "writeToFile:atomically:", v5, 1);
    v3->_isDirty = 0;

  }
  objc_sync_exit(v3);

}

- (unint64_t)version
{
  return self->_version;
}

- (BKTextIndex)initWithName:(id)a3
{
  id v5;
  BKTextIndex *v6;
  BKTextIndex *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKTextIndex;
  v6 = -[BKTextIndex initWithCaseRule:](&v9, "initWithCaseRule:", 1);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v7->_version = 5;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  NSString *name;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  name = self->_name;
  self->_name = 0;

  v5.receiver = self;
  v5.super_class = (Class)BKTextIndex;
  -[BKTextIndex dealloc](&v5, "dealloc");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  BKTextIndex *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v7.receiver = v5;
  v7.super_class = (Class)BKTextIndex;
  -[BKTextIndex encodeWithCoder:](&v7, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", v5->_name, CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v5->_version));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("version"));

  objc_sync_exit(v5);
}

- (BKTextIndex)initWithCoder:(id)a3
{
  id v4;
  BKTextIndex *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  NSString *name;
  double v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BKTextIndex;
  v5 = -[BKTextIndex initWithCoder:](&v14, "initWithCoder:", v4);
  if (v5)
  {
    *(_QWORD *)&v6 = objc_opt_class(NSString).n128_u64[0];
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("name"), v6));
    name = v5->_name;
    v5->_name = (NSString *)v8;

    *(_QWORD *)&v10 = objc_opt_class(NSNumber).n128_u64[0];
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, CFSTR("version"), v10));
    v5->_version = (unint64_t)objc_msgSend(v12, "unsignedIntegerValue");

  }
  return v5;
}

- (id)name
{
  return self->_name;
}

- (void)indexTextUnit:(id)a3 withOrdinal:(unint64_t)a4 indexSynchronously:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), a4));
  -[BKTextIndex indexTextUnit:withIdentifier:indexSynchronously:](self, "indexTextUnit:withIdentifier:indexSynchronously:", v8, v9, v5);

  self->_isDirty = 1;
}

- (void)indexTextUnit:(id)a3 withOrdinal:(unint64_t)a4
{
  -[BKTextIndex indexTextUnit:withOrdinal:indexSynchronously:](self, "indexTextUnit:withOrdinal:indexSynchronously:", a3, a4, 0);
}

- (BOOL)containsTextUnitWithOrdinal:(unint64_t)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), a3));
  LOBYTE(self) = -[BKTextIndex containsTextUnitWithIdentifier:](self, "containsTextUnitWithIdentifier:", v4);

  return (char)self;
}

- (id)queryForString:(id)a3 maxOrdinal:(unint64_t)a4
{
  id v6;
  BKTextIndex *v7;
  void *v8;
  void *v9;
  id v10;
  BKTextIndexQueryResult *v11;
  BKTextIndexQueryResult *v12;
  id v13;
  void *v14;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKTextIndex candidateIdentifiersForStringQuery:](v7, "candidateIdentifiersForStringQuery:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKTextIndex allIdentifiers](v7, "allIdentifiers"));
  v10 = objc_msgSend(v8, "count");
  if (a4 == -1 || v10 || objc_msgSend(v9, "count") != (id)a4)
  {
    v12 = [BKTextIndexQueryResult alloc];
    v13 = objc_msgSend(v9, "count");
    if (v13 == (id)a4)
      v14 = 0;
    else
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));
    v11 = -[BKTextIndexQueryResult initWithOrdinals:allOrdinals:](v12, "initWithOrdinals:allOrdinals:", v8, v14);
    if (v13 != (id)a4)

  }
  else
  {
    v11 = 0;
  }

  objc_sync_exit(v7);
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end

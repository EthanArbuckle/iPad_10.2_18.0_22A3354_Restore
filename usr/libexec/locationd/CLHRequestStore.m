@implementation CLHRequestStore

- (CLHRequestStore)initWithRootDirectory:(id)a3 classifier:(id)a4
{
  CLHRequestStore *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLHRequestStore;
  v6 = -[CLHRequestStore init](&v8, "init");
  if (v6)
  {
    v6->_rootDir = (NSURL *)a3;
    v6->_classifier = (CLHLocationClassifier *)a4;
  }
  return v6;
}

- (id)archiveWithIdentifier:(id)a3
{
  return -[CLHRequestArchive initWithDirectory:]([CLHRequestArchive alloc], "initWithDirectory:", -[NSString stringByAppendingPathComponent:](-[NSURL path](self->_rootDir, "path"), "stringByAppendingPathComponent:", a3));
}

- (id)archiveForHarvester:(int)a3
{
  uint64_t v5;

  v5 = sub_100B6ADA4(a3);
  return -[CLHRequestArchive initWithDirectory:requestCode:]([CLHRequestArchive alloc], "initWithDirectory:requestCode:", -[NSString stringByAppendingPathComponent:](-[NSURL path](self->_rootDir, "path"), "stringByAppendingPathComponent:", sub_100B6ADC4(a3)), v5);
}

- (id)archiveForHarvester:(int)a3 withSuffix:(id)a4
{
  uint64_t v7;

  v7 = sub_100B6ADA4(a3);
  return -[CLHRequestArchive initWithDirectory:requestCode:]([CLHRequestArchive alloc], "initWithDirectory:requestCode:", -[NSString stringByAppendingPathComponent:](-[NSURL path](self->_rootDir, "path"), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), sub_100B6ADC4(a3), a4)), v7);
}

- (id)classifyingStoreForHarvester:(int)a3 enableSubArchiving:(BOOL)a4 itemCountThresholdForAutoCleanUp:(int)a5
{
  uint64_t v5;
  _BOOL4 v6;
  const __CFString *v9;
  CLHLocationAwareRequestArchive *v10;
  CLHLocationAwareRequestArchive *v11;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v9 = sub_100B6ADC4(a3);
  v10 = -[CLHLocationAwareRequestArchive initWithClassifier:rootDirectory:basename:requestCode:itemCountThresholdForAutoCleanUp:]([CLHLocationAwareRequestArchive alloc], "initWithClassifier:rootDirectory:basename:requestCode:itemCountThresholdForAutoCleanUp:", self->_classifier, self->_rootDir, v9, sub_100B6ADA4(a3), v5);
  v11 = v10;
  if (v6)
  {
    -[CLHRequestArchive generateNewSubArchive](-[CLHLocationAwareRequestArchive homeArchive](v10, "homeArchive"), "generateNewSubArchive");
    -[CLHRequestArchive generateNewSubArchive](-[CLHLocationAwareRequestArchive workArchive](v11, "workArchive"), "generateNewSubArchive");
    -[CLHRequestArchive generateNewSubArchive](-[CLHLocationAwareRequestArchive mainArchive](v11, "mainArchive"), "generateNewSubArchive");
  }
  return v11;
}

- (id)classifyingStoreForHarvester:(int)a3
{
  return -[CLHRequestStore classifyingStoreForHarvester:enableSubArchiving:itemCountThresholdForAutoCleanUp:](self, "classifyingStoreForHarvester:enableSubArchiving:itemCountThresholdForAutoCleanUp:", *(_QWORD *)&a3, 0, 0xFFFFFFFFLL);
}

- (id)classifyingStoreForHarvesterWithSubArchiving:(int)a3 itemCountThresholdForAutoCleanUp:(int)a4
{
  return -[CLHRequestStore classifyingStoreForHarvester:enableSubArchiving:itemCountThresholdForAutoCleanUp:](self, "classifyingStoreForHarvester:enableSubArchiving:itemCountThresholdForAutoCleanUp:", *(_QWORD *)&a3, 1, *(_QWORD *)&a4);
}

- (void)clearDataForHarvester:(int)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v3 = -[CLHRequestStore requestArchivesForHarvester:](self, "requestArchivesForHarvester:", *(_QWORD *)&a3);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "eraseAllData");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)pruneSecondaryDataOlderThan:(double)a3 forHarvester:(int)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v5 = -[CLHRequestStore requestArchivesForHarvester:](self, "requestArchivesForHarvester:", *(_QWORD *)&a4);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "pruneSecondaryDataOlderThan:", a3);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (unint64_t)pointCountForHarvester:(int)a3
{
  id v3;
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = -[CLHRequestStore requestArchivesForHarvester:](self, "requestArchivesForHarvester:", *(_QWORD *)&a3);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(v3);
      v6 += (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "count");
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v5);
  return v6;
}

- (id)requestArchivesForHarvester:(int)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  CLHRequestArchive *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_msgSend(-[CLHRequestStore allArchiveURLs](self, "allArchiveURLs"), "filteredArrayUsingPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self.lastPathComponent BEGINSWITH %@"), sub_100B6ADC4(a3)));
  v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = -[CLHRequestArchive initWithDirectory:]([CLHRequestArchive alloc], "initWithDirectory:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "path"));
        objc_msgSend(v4, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v4;
}

- (id)allArchiveURLs
{
  NSArray *v3;
  NSObject *v4;
  NSURL *rootDir;
  NSObject *v6;
  NSURL *v7;
  NSObject *v8;
  NSURL *v9;
  NSUInteger v10;
  NSUInteger v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  NSURL *v18;
  __int16 v19;
  NSUInteger v20;

  v12 = 0;
  v3 = -[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", self->_rootDir, 0, 0, &v12);
  if (v12)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    v4 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_FAULT))
    {
      rootDir = self->_rootDir;
      *(_DWORD *)buf = 68289539;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2113;
      v18 = rootDir;
      v19 = 2113;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"failed to find contents of rootDir\", \"url\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    }
    v6 = qword_1022A0208;
    if (os_signpost_enabled((os_log_t)qword_1022A0208))
    {
      v7 = self->_rootDir;
      *(_DWORD *)buf = 68289539;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2113;
      v18 = v7;
      v19 = 2113;
      v20 = v12;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "failed to find contents of rootDir", "{\"msg%{public}.0s\":\"failed to find contents of rootDir\", \"url\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
    }
  }
  else
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    v8 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
    {
      v9 = self->_rootDir;
      v10 = -[NSArray count](v3, "count");
      *(_DWORD *)buf = 68289539;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2113;
      v18 = v9;
      v19 = 2049;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"found contents of rootDir\", \"url\":%{private, location:escape_only}@, \"count\":%{private}lu}", buf, 0x26u);
    }
  }
  return v3;
}

- (id)jsonObject
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  CLHRequestArchive *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[CLHRequestStore allArchiveURLs](self, "allArchiveURLs", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = -[CLHRequestArchive initWithDirectory:]([CLHRequestArchive alloc], "initWithDirectory:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "path"));
        objc_msgSend(v3, "addObject:", -[CLHRequestArchive jsonObject](v9, "jsonObject"));

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v3;
}

@end

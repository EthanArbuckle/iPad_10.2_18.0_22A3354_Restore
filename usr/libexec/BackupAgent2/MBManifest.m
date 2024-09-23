@implementation MBManifest

+ (MBManifest)manifestWithProperties:(id)a3 database:(id)a4 databaseIndex:(id)a5
{
  return -[MBManifest initWithProperties:database:databaseIndex:]([MBManifest alloc], "initWithProperties:database:databaseIndex:", a3, a4, a5);
}

- (MBManifest)initWithProperties:(id)a3 database:(id)a4 databaseIndex:(id)a5
{
  MBManifest *v10;
  objc_super v12;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBManifest.m"), 25, CFSTR("Null manifest properties"));
    if (a4)
      goto LABEL_3;
  }
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBManifest.m"), 26, CFSTR("Null manifest database"));
LABEL_3:
  v12.receiver = self;
  v12.super_class = (Class)MBManifest;
  v10 = -[MBManifest init](&v12, "init");
  if (v10)
  {
    v10->_properties = (MBProperties *)a3;
    v10->_database = (MBDatabase *)a4;
    v10->_databaseIndex = (MBDatabaseIndex *)a5;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBManifest;
  -[MBManifest dealloc](&v3, "dealloc");
}

- (BOOL)closeWithError:(id *)a3
{
  return 1;
}

- (MBDatabaseIndex)databaseIndex
{
  MBDatabaseIndex *result;

  result = self->_databaseIndex;
  if (!result)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBManifest.m"), 47, CFSTR("Database index not set"));
    return self->_databaseIndex;
  }
  return result;
}

- (BOOL)containsFileWithID:(id)a3
{
  return -[MBDatabaseIndex containsFileID:](self->_databaseIndex, "containsFileID:", a3);
}

- (id)fileWithID:(id)a3
{
  MBDatabaseIndex *databaseIndex;
  int64_t v6;
  id v7;

  databaseIndex = self->_databaseIndex;
  if (!databaseIndex)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBManifest.m"), 56, CFSTR("Database index not set"));
    databaseIndex = self->_databaseIndex;
  }
  v6 = -[MBDatabaseIndex offsetForFileID:](databaseIndex, "offsetForFileID:", a3);
  if (v6 < 0)
    return 0;
  v7 = -[MBDatabase fileAtOffset:](self->_database, "fileAtOffset:", v6);
  if ((objc_msgSend(objc_msgSend(v7, "fileID"), "isEqualToFileID:", a3) & 1) == 0)
    objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 11, CFSTR("File ID doesn't match index: %@-%@ (%@ vs %@)"), objc_msgSend(objc_msgSend(v7, "domain"), "name"), objc_msgSend(v7, "relativePath"), objc_msgSend(v7, "fileID"), a3));
  return v7;
}

- (id)fetchFileWithID:(id)a3 error:(id *)a4
{
  return -[MBManifest fileWithID:](self, "fileWithID:", a3, a4);
}

- (id)fileEnumerator
{
  return -[MBDatabase fileEnumerator](self->_database, "fileEnumerator");
}

- (id)enumerateFiles:(id)a3
{
  return -[MBManifest enumerateFiles:includeUninstalled:](self, "enumerateFiles:includeUninstalled:", a3, 0);
}

- (id)enumerateFiles:(id)a3 includeUninstalled:(BOOL)a4
{
  return -[MBDatabase enumerateFiles:](self->_database, "enumerateFiles:", a3, a4);
}

- (void)buildIndexFromDatabaseIfNeeded
{
  NSObject *v3;
  uint8_t v4[16];

  if (!self->_databaseIndex)
  {
    v3 = MBGetDefaultLog(self, a2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Building index from database", v4, 2u);
      _MBLog(CFSTR("INFO"), "Building index from database");
    }
    self->_databaseIndex = (MBDatabaseIndex *)-[MBDatabase indexFromDatabaseIgnoringTruncation:](self->_database, "indexFromDatabaseIgnoringTruncation:", 0);
  }
}

- (BOOL)setupEncryptionWithPassword:(id)a3 withError:(id *)a4
{
  return 1;
}

- (MBProperties)properties
{
  return self->_properties;
}

- (MBDatabase)database
{
  return self->_database;
}

@end

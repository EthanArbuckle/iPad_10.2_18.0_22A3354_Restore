@implementation QLCacheIndexDatabaseFileInfoEnumerator

- (QLCacheIndexDatabaseFileInfoEnumerator)initWithSqliteDatabase:(id)a3 toEnumerateUbiquitousFiles:(BOOL)a4 extraInfo:(BOOL)a5
{
  QLCacheIndexDatabaseFileInfoEnumerator *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)QLCacheIndexDatabaseFileInfoEnumerator;
  result = -[QLCacheIndexDatabaseGenericEnumerator initWithSqliteDatabase:](&v8, sel_initWithSqliteDatabase_, a3);
  if (result)
  {
    result->_extraInfo = a5;
    result->_ubiquitous = a4;
  }
  return result;
}

- (BOOL)nextFileWithCacheId:(unint64_t *)a3 versionedFileIdentifier:(id *)a4 thumbnailCount:(unsigned int *)a5 minSize:(float *)a6 maxSize:(float *)a7 totalDataLength:(unint64_t *)a8
{
  sqlite3_stmt **p_stmt;
  _BOOL4 extraInfo;
  const char *v17;
  QLSqliteDatabase *sqliteDatabase;
  const char *v19;
  const char *v20;
  QLCacheVersionedFileIdentifier *fileIdentifier;
  sqlite3_stmt *stmt;
  BOOL v23;
  BOOL v24;
  unint64_t v25;
  _BOOL4 ubiquitous;
  Class *v27;
  QLCacheVersionedFileIdentifier *v28;
  QLCacheVersionedFileIdentifier *v29;
  int v30;
  int v31;
  float v32;
  char v34;

  p_stmt = &self->super._stmt;
  if (!self->super._stmt)
  {
    extraInfo = self->_extraInfo;
    v17 = "SELECT files.rowid, files.fileProviderId, files.itemId, files.version, count(thumbnails.file_id), min(thumbnai"
          "ls.size), max(thumbnails.size), sum(thumbnails.bitmapdata_length + thumbnails.plistbuffer_length) FROM provide"
          "r_files AS files, thumbnails WHERE files.rowid = thumbnails.file_id GROUP BY thumbnails.file_id";
    sqliteDatabase = self->super._sqliteDatabase;
    v19 = "SELECT rowid, fileProviderId, itemId, version FROM provider_files";
    if (!self->_ubiquitous)
    {
      v17 = "SELECT files.rowid, files.fileId, files.fsid, files.version, count(thumbnails.file_id), min(thumbnails.size)"
            ", max(thumbnails.size), sum(thumbnails.bitmapdata_length + thumbnails.plistbuffer_length) FROM basic_files A"
            "S files, thumbnails WHERE (files.rowid | (1<<63)) = thumbnails.file_id GROUP BY thumbnails.file_id";
      v19 = "SELECT rowid, fileId, fsid, version FROM basic_files";
    }
    if (extraInfo)
      v20 = v17;
    else
      v20 = v19;
    self->super._stmt = -[QLSqliteDatabase prepareStatement:](sqliteDatabase, "prepareStatement:", v20);
  }
  fileIdentifier = self->_fileIdentifier;
  self->_fileIdentifier = 0;

  v34 = 0;
  stmt = self->super._stmt;
  if (!stmt)
    goto LABEL_16;
  if (-[QLSqliteDatabase stepStatement:didReturnData:](self->super._sqliteDatabase, "stepStatement:didReturnData:", stmt, &v34))
  {
    v23 = v34 == 0;
  }
  else
  {
    v23 = 1;
  }
  if (v23)
  {
    if (*p_stmt)
      -[QLSqliteDatabase finalizeStatement:](self->super._sqliteDatabase, "finalizeStatement:", p_stmt);
LABEL_16:
    v24 = 0;
    goto LABEL_23;
  }
  v25 = -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->super._sqliteDatabase, "unsignedLongLongFromColumn:inStatement:", 0, self->super._stmt);
  ubiquitous = self->_ubiquitous;
  *a3 = v25;
  if (ubiquitous)
    v27 = (Class *)0x1E0CD3288;
  else
    v27 = (Class *)0x1E0CD3278;
  v28 = (QLCacheVersionedFileIdentifier *)objc_msgSend(objc_alloc(*v27), "initWithSteppedStatement:database:", self->super._stmt, self->super._sqliteDatabase);
  v29 = self->_fileIdentifier;
  self->_fileIdentifier = v28;

  if (self->_extraInfo)
  {
    *a5 = -[QLSqliteDatabase intFromColumn:inStatement:](self->super._sqliteDatabase, "intFromColumn:inStatement:", 4, self->super._stmt);
    -[QLSqliteDatabase floatFromColumn:inStatement:](self->super._sqliteDatabase, "floatFromColumn:inStatement:", 5, self->super._stmt);
    *(_DWORD *)a6 = v30;
    -[QLSqliteDatabase floatFromColumn:inStatement:](self->super._sqliteDatabase, "floatFromColumn:inStatement:", 6, self->super._stmt);
    *(_DWORD *)a7 = v31;
    -[QLSqliteDatabase floatFromColumn:inStatement:](self->super._sqliteDatabase, "floatFromColumn:inStatement:", 7, self->super._stmt);
    *a8 = (unint64_t)v32;
  }
  v24 = 1;
LABEL_23:
  *a4 = objc_retainAutorelease(self->_fileIdentifier);
  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileIdentifier, 0);
}

@end

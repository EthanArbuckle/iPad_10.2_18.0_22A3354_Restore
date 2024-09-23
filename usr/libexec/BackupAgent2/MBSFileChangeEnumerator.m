@implementation MBSFileChangeEnumerator

+ (id)enumeratorWithCache:(id)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCache:", a3);
}

- (MBSFileChangeEnumerator)initWithCache:(id)a3
{
  MBSFileChangeEnumerator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBSFileChangeEnumerator;
  v4 = -[MBSFileChangeEnumerator init](&v6, "init");
  if (v4)
    v4->_stmt = (MBSCacheStmt *)objc_msgSend(a3, "_prepare:", CFSTR("select *,rowid from FileChanges where rowid > ? order by rowid"));
  return v4;
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  if (self->_count >= 1)
  {
    v3 = 0;
    do

    while (v3 < self->_count);
  }

  v4.receiver = self;
  v4.super_class = (Class)MBSFileChangeEnumerator;
  -[MBSFileChangeEnumerator dealloc](&v4, "dealloc");
}

- (id)nextObject
{
  int count;
  uint64_t next;

  count = self->_count;
  if (self->_next >= count)
  {
    -[MBSFileChangeEnumerator _fetch](self, "_fetch");
    count = self->_count;
  }
  if (!count)
    return 0;
  next = self->_next;
  self->_next = next + 1;
  return self->_objects[next];
}

- (id)_fileChangeFromStmt:(id)a3
{
  MBFileID *v6;
  id v7;
  id v8;
  id v9;
  MBSFileReference *v10;
  id v11;

  v6 = +[MBFileID fileIDWithString:](MBFileID, "fileIDWithString:", objc_msgSend(a3, "textColumn:", 0));
  if (!v6)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBSFileChangeEnumerator.m"), 68, CFSTR("Failed to convert file change ID"));
  v7 = objc_msgSend(a3, "blobColumn:", 4);
  v8 = objc_msgSend(a3, "intColumn:", 5);
  if (v7)
  {
    v9 = v8;
    v10 = objc_alloc_init(MBSFileReference);
    -[MBSFileReference setFileID:](v10, "setFileID:", v7);
    -[MBSFileReference setSnapshotID:](v10, "setSnapshotID:", v9);
  }
  else
  {
    v10 = 0;
  }
  v11 = +[MBServiceFileChange fileChange](MBServiceFileChange, "fileChange");
  objc_msgSend(v11, "setFileID:", v6);
  objc_msgSend(v11, "setType:", objc_msgSend(a3, "intColumn:", 1));
  objc_msgSend(v11, "setDomainName:", objc_msgSend(a3, "textColumn:", 2));
  objc_msgSend(v11, "setRelativePath:", objc_msgSend(a3, "textColumn:", 3));
  objc_msgSend(v11, "setDuplicateFileReference:", v10);
  objc_msgSend(v11, "setSize:", objc_msgSend(a3, "int64Column:", 6));
  objc_msgSend(v11, "setResult:", objc_msgSend(a3, "intColumn:", 7));
  return v11;
}

- (void)_fetch
{
  uint64_t v3;
  int count;
  id v5;
  uint64_t v6;

  if (self->_count >= 1)
  {
    v3 = 0;
    do

    while (v3 < self->_count);
  }
  self->_next = 0;
  self->_count = 0;
  if (!self->_done)
  {
    -[MBSCacheStmt bindInt64:atIndex:](self->_stmt, "bindInt64:atIndex:", self->_lastRowID, 1);
    count = self->_count;
    if (count <= 63)
    {
      while (-[MBSCacheStmt step](self->_stmt, "step"))
      {
        v5 = -[MBSFileChangeEnumerator _fileChangeFromStmt:](self, "_fileChangeFromStmt:", self->_stmt);
        v6 = self->_count;
        self->_count = v6 + 1;
        self->_objects[v6] = v5;
        self->_lastRowID = -[MBSCacheStmt int64Column:](self->_stmt, "int64Column:", 8);
        count = self->_count;
        if (count >= 64)
          goto LABEL_10;
      }
      count = self->_count;
    }
LABEL_10:
    self->_done = count < 64;
    -[MBSCacheStmt reset](self->_stmt, "reset");
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  int next;
  int count;
  unint64_t *stmt;

  next = self->_next;
  count = self->_count;
  if (next >= count)
  {
    -[MBSFileChangeEnumerator _fetch](self, "_fetch", a3, a4, a5);
    next = self->_next;
    count = self->_count;
  }
  stmt = (unint64_t *)self->_stmt;
  a3->var1 = &self->_objects[next];
  a3->var2 = stmt;
  self->_next = count;
  return count - next;
}

@end

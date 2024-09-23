@implementation MBDriveScript

- (MBDriveScript)initWithProgress:(id)a3
{
  MBDriveScript *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBDriveScript;
  v4 = -[MBDriveScript init](&v6, "init");
  if (v4)
  {
    v4->_operations = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
    v4->_progress = (MBProgress *)a3;
    v4->_state = 0;
    v4->_index = 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBDriveScript;
  -[MBDriveScript dealloc](&v3, "dealloc");
}

- (unint64_t)operationCount
{
  return (unint64_t)-[NSMutableArray count](self->_operations, "count");
}

- (id)operationAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndexedSubscript:](self->_operations, "objectAtIndexedSubscript:", a3);
}

- (void)addOperation:(id)a3
{
  MBProgress *progress;

  if (self->_state)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveScript.m"), 44, CFSTR("Invalid state"));
  -[NSMutableArray addObject:](self->_operations, "addObject:", a3);
  progress = self->_progress;
  objc_msgSend(a3, "duration");
  -[MBProgress addDuration:](progress, "addDuration:");
}

- (void)addOperations:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(a3);
        -[MBDriveScript addOperation:](self, "addOperation:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)insertOperation:(id)a3 atIndex:(unint64_t)a4
{
  MBProgress *progress;

  -[NSMutableArray insertObject:atIndex:](self->_operations, "insertObject:atIndex:", a3, a4);
  progress = self->_progress;
  objc_msgSend(a3, "duration");
  -[MBProgress addDuration:](progress, "addDuration:");
}

- (void)beginPerforming
{
  if (self->_state || self->_index)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveScript.m"), 62, CFSTR("Invalid state"));
  self->_state = 1;
}

- (void)performingOperation:(id)a3
{
  int state;
  id v7;
  unsigned int v8;
  MBProgress *progress;
  double v10;

  state = self->_state;
  if (state)
  {
    if (state != 1)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveScript.m"), 71, CFSTR("Invalid state"));
    v7 = -[NSMutableArray objectAtIndexedSubscript:](self->_operations, "objectAtIndexedSubscript:", self->_index);
    v8 = objc_msgSend(a3, "type");
    if (v8 != objc_msgSend(v7, "type"))
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveScript.m"), 74, CFSTR("Deviating from script (expecting %@, got %@)"), +[MBDriveOperation stringForType:](MBDriveOperation, "stringForType:", objc_msgSend(v7, "type")), +[MBDriveOperation stringForType:](MBDriveOperation, "stringForType:", objc_msgSend(a3, "type")));
    progress = self->_progress;
    objc_msgSend(v7, "duration");
    -[MBProgress updateWithDuration:size:](progress, "updateWithDuration:size:", objc_msgSend(v7, "size"), v10);
    ++self->_index;
  }
}

- (void)finishedPerforming
{
  unint64_t index;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  unint64_t v9;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  id v17;

  index = self->_index;
  v5 = -[NSMutableArray count](self->_operations, "count");
  if ((id)index != v5)
  {
    v7 = MBGetDefaultLog(v5, v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = -[NSMutableArray count](self->_operations, "count");
      v9 = self->_index;
      v10 = -[NSMutableArray debugDescription](self->_operations, "debugDescription");
      *(_DWORD *)buf = 134218498;
      v13 = v8;
      v14 = 2048;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "MBDriveScript had (%ld) operations, and performed (%ld):\n%@", buf, 0x20u);
      _MBLog(CFSTR("ERROR"), "MBDriveScript had (%ld) operations, and performed (%ld):\n%@", -[NSMutableArray count](self->_operations, "count"), self->_index, -[NSMutableArray debugDescription](self->_operations, "debugDescription"));
    }
  }
  if (self->_state != 1)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveScript.m"), 87, CFSTR("Invalid state"));
  v11 = (id)self->_index;
  if (v11 != -[NSMutableArray count](self->_operations, "count"))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveScript.m"), 88, CFSTR("Script not finished (performed: %ld != contained: %ld)"), self->_index, -[NSMutableArray count](self->_operations, "count"));
  if (!-[MBProgress isFinished](self->_progress, "isFinished"))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveScript.m"), 89, CFSTR("Progress not finished"));
  self->_state = 2;
}

- (unint64_t)index
{
  return self->_index;
}

@end

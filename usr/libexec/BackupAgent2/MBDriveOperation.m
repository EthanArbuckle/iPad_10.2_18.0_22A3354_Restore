@implementation MBDriveOperation

+ (id)stringForType:(int)a3
{
  if (a3 > 6)
    return 0;
  else
    return off_1000D9D88[a3];
}

+ (id)operationToCreateDirectory
{
  return +[MBDriveOperation operationWithType:duration:](MBDriveOperation, "operationWithType:duration:", 0, 0.01);
}

+ (id)operationForContentsOfDirectory
{
  return +[MBDriveOperation operationWithType:duration:](MBDriveOperation, "operationWithType:duration:", 1, 0.01);
}

+ (id)operationToUploadFileWithSize:(int64_t)a3
{
  return +[MBDriveOperation operationToUploadFilesWithCount:size:](MBDriveOperation, "operationToUploadFilesWithCount:size:", 1, a3);
}

+ (id)operationToUploadFilesWithCount:(int64_t)a3 size:(int64_t)a4
{
  return +[MBDriveOperation operationWithType:count:size:duration:](MBDriveOperation, "operationWithType:count:size:duration:", 2, a3, (double)a3 * 0.004 + 0.01 + (double)a4 / 10485760.0);
}

+ (id)operationToDownloadFileWithSize:(int64_t)a3
{
  return +[MBDriveOperation operationToDownloadFilesWithCount:size:](MBDriveOperation, "operationToDownloadFilesWithCount:size:", 1, a3);
}

+ (id)operationToDownloadFilesWithCount:(int64_t)a3 size:(int64_t)a4
{
  return +[MBDriveOperation operationWithType:count:size:duration:](MBDriveOperation, "operationWithType:count:size:duration:", 3, a3, (double)a3 * 0.004 + 0.01 + (double)a4 / 10485760.0);
}

+ (id)operationToMoveItem
{
  return +[MBDriveOperation operationToMoveItemsWithCount:](MBDriveOperation, "operationToMoveItemsWithCount:", 1);
}

+ (id)operationToMoveItemsWithCount:(int64_t)a3
{
  return +[MBDriveOperation operationWithType:count:duration:](MBDriveOperation, "operationWithType:count:duration:", 4, a3, (double)a3 * 0.0015 + 0.01);
}

+ (id)operationToRemoveItem
{
  return +[MBDriveOperation operationToRemoveItemsWithCount:](MBDriveOperation, "operationToRemoveItemsWithCount:", 1);
}

+ (id)operationToRemoveItemsWithCount:(int64_t)a3
{
  return +[MBDriveOperation operationWithType:count:duration:](MBDriveOperation, "operationWithType:count:duration:", 5, a3, (double)a3 * 0.0005 + 0.01);
}

+ (id)operationToC0pyItemWithCount:(int64_t)a3 size:(int64_t)a4
{
  return +[MBDriveOperation operationWithType:count:size:duration:](MBDriveOperation, "operationWithType:count:size:duration:", 6, a3, (double)a3 * 0.003 + 0.01 + (double)a4 / 12582912.0);
}

+ (id)operationWithType:(int)a3 duration:(double)a4
{
  return -[MBDriveOperation initWithType:count:size:duration:]([MBDriveOperation alloc], "initWithType:count:size:duration:", *(_QWORD *)&a3, 1, -1, a4);
}

+ (id)operationWithType:(int)a3 count:(int64_t)a4 duration:(double)a5
{
  return -[MBDriveOperation initWithType:count:size:duration:]([MBDriveOperation alloc], "initWithType:count:size:duration:", *(_QWORD *)&a3, a4, -1, a5);
}

+ (id)operationWithType:(int)a3 count:(int64_t)a4 size:(int64_t)a5 duration:(double)a6
{
  return -[MBDriveOperation initWithType:count:size:duration:]([MBDriveOperation alloc], "initWithType:count:size:duration:", *(_QWORD *)&a3, a4, a5, a6);
}

- (MBDriveOperation)initWithType:(int)a3 count:(int64_t)a4 size:(int64_t)a5 duration:(double)a6
{
  int v8;
  MBDriveOperation *result;
  uint64_t v13;
  objc_super v14;

  v8 = a4;
  if (a4 < -1)
  {
    v13 = 115;
  }
  else
  {
    if (a4 < 0x80000000)
      goto LABEL_3;
    v13 = 116;
  }
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveOperation.m"), v13, CFSTR("Invalid count"));
LABEL_3:
  if (a5 <= -2)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveOperation.m"), 117, CFSTR("Invalid size"));
  if (a6 < 0.0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDriveOperation.m"), 118, CFSTR("Negative duration"));
  v14.receiver = self;
  v14.super_class = (Class)MBDriveOperation;
  result = -[MBDriveOperation init](&v14, "init");
  if (result)
  {
    result->_type = a3;
    result->_count = v8;
    result->_size = a5;
    result->_duration = a6;
  }
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[MBDriveOperation type=%@ count=%ld size=%lld duration=%0.3f]"), +[MBDriveOperation stringForType:](MBDriveOperation, "stringForType:", self->_type), self->_count, self->_size, *(_QWORD *)&self->_duration);
}

- (int)type
{
  return self->_type;
}

- (int)count
{
  return self->_count;
}

- (int64_t)size
{
  return self->_size;
}

- (double)duration
{
  return self->_duration;
}

@end

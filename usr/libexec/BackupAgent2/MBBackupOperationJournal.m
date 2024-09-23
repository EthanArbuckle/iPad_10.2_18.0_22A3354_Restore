@implementation MBBackupOperationJournal

+ (id)driveOperationWithBackupOperationType:(int)a3 count:(unint64_t)a4 size:(unint64_t)a5
{
  uint64_t v5;
  void *v6;
  void *v9;

  v5 = *(_QWORD *)&a3;
  switch(a3)
  {
    case 0:
    case 3:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToMoveItemsWithCount:](MBDriveOperation, "operationToMoveItemsWithCount:", a4));
      break;
    case 1:
    case 4:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToRemoveItemsWithCount:](MBDriveOperation, "operationToRemoveItemsWithCount:", a4));
      break;
    case 2:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToUploadFilesWithCount:size:](MBDriveOperation, "operationToUploadFilesWithCount:size:", a4, a5));
      break;
    default:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MBBackupOperationJournal.m"), 53, CFSTR("Invalid backup operation type: %u"), v5);

      v6 = 0;
      break;
  }
  return v6;
}

+ (MBBackupOperationJournal)backupOperationJournalWithBatchSize:(unint64_t)a3
{
  return -[MBBackupOperationJournal initWithBatchSize:]([MBBackupOperationJournal alloc], "initWithBatchSize:", a3);
}

- (MBBackupOperationJournal)initWithBatchSize:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  MBBackupOperationJournal *v9;
  MBBackupOperationJournal *v10;
  uint64_t v11;
  NSMutableArray **driveOperationsByType;
  NSMutableArray *v13;
  NSMutableArray *v14;
  objc_super v16;

  v5 = MBTemporaryPath(self, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MBEncoder encoderToFile:error:](MBEncoder, "encoderToFile:error:", v6, 0));
  if (!v7)
    objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 100, CFSTR("Error opening backup operation journal")));
  v8 = v7;
  objc_msgSend(v7, "encodeInt32:", 1835166318);
  objc_msgSend(v8, "encodeVersion:", 2.0);
  v16.receiver = self;
  v16.super_class = (Class)MBBackupOperationJournal;
  v9 = -[MBBackupOperationJournal init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_path, v6);
    objc_storeStrong((id *)&v10->_encoder, v8);
    v11 = 0;
    v10->_batchSize = a3;
    driveOperationsByType = v10->_driveOperationsByType;
    do
    {
      v13 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
      v14 = driveOperationsByType[v11];
      driveOperationsByType[v11] = v13;

      ++v11;
    }
    while (v11 != 5);
  }

  return v10;
}

- (unint64_t)size
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributesOfItemAtPath:error:", self->_path, 0));
  v5 = objc_msgSend(v4, "fileSize");

  return (unint64_t)v5;
}

- (id)operationEnumeratorWithDomainManager:(id)a3
{
  id v4;
  MBBackupOperationJournalEnumerator *v5;

  v4 = a3;
  v5 = -[MBBackupOperationJournalEnumerator initWithFile:domainManager:]([MBBackupOperationJournalEnumerator alloc], "initWithFile:domainManager:", self->_path, v4);

  return v5;
}

- (unint64_t)countForType:(int)a3
{
  return self->_countByType[a3];
}

- (unint64_t)sizeForType:(int)a3
{
  return self->_sizeByType[a3];
}

- (unint64_t)sizeExcludingHardlinksAndClonesForType:(int)a3
{
  return self->_sizeExcludingHardlinksAndClonesForType[a3];
}

- (id)driveOperationsForType:(int)a3
{
  return self->_driveOperationsByType[a3];
}

- (void)addOperation:(id)a3
{
  unsigned int v4;
  uint64_t v5;
  Class *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "type");
  objc_msgSend(v8, "encode:", self->_encoder);
  v5 = v4;
  v6 = &self->super.isa + v4;
  v6[3] = (Class)((char *)v6[3] + 1);
  v6[8] = (Class)((char *)objc_msgSend(v8, "size") + (_QWORD)v6[8]);
  if ((objc_msgSend(v8, "flags") & 3) == 0)
    self->_sizeExcludingHardlinksAndClonesForType[v5] += (unint64_t)objc_msgSend(v8, "size");
  ++self->_batchCountByType[v5];
  self->_batchSizeByType[v5] += (unint64_t)objc_msgSend(v8, "size");
  if (self->_batchCountByType[v5] == self->_batchSize)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MBBackupOperationJournal driveOperationWithBackupOperationType:count:size:](MBBackupOperationJournal, "driveOperationWithBackupOperationType:count:size:", v5));
    -[NSMutableArray addObject:](self->_driveOperationsByType[v5], "addObject:", v7);
    self->_batchCountByType[v5] = 0;
    self->_batchSizeByType[v5] = 0;

  }
}

- (void)commit
{
  uint64_t i;
  Class *v4;
  Class v5;
  void *v6;

  -[MBEncoder close](self->_encoder, "close");
  for (i = 0; i != 5; ++i)
  {
    v4 = &self->super.isa + i;
    v5 = v4[23];
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MBBackupOperationJournal driveOperationWithBackupOperationType:count:size:](MBBackupOperationJournal, "driveOperationWithBackupOperationType:count:size:", i, v5, v4[28]));
      -[objc_class addObject:](v4[18], "addObject:", v6);

    }
  }
}

- (void)close
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v3, "removeItemAtPath:error:", self->_path, 0);

}

- (void).cxx_destruct
{
  uint64_t v3;
  NSMutableArray **v4;

  v3 = 0;
  v4 = &self->_driveOperationsByType[4];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -5);
  objc_storeStrong((id *)&self->_encoder, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end

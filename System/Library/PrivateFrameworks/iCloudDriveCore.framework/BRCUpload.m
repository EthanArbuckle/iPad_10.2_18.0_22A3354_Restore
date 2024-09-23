@implementation BRCUpload

- (CKRecordID)recordID
{
  return -[CKRecord recordID](self->_record, "recordID");
}

- (CKRecordID)secondaryRecordID
{
  return 0;
}

- (CKRecord)secondaryRecord
{
  return 0;
}

- (NSString)etag
{
  return 0;
}

- (NSNumber)transferID
{
  return (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_throttleID);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<upload[%lld] %@>"), self->_throttleID, self->_itemID);
}

- (BRCUpload)initWithDocument:(id)a3 stageID:(id)a4 transferSize:(unint64_t)a5
{
  id v8;
  id v9;
  BRCUpload *v10;
  uint64_t v11;
  BRCItemID *itemID;
  void *v13;
  void *v14;
  uint64_t v15;
  BRCProgress *progress;
  objc_super v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BRCUpload;
  v10 = -[BRCUpload init](&v18, sel_init);
  if (v10)
  {
    objc_msgSend(v8, "itemID");
    v11 = objc_claimAutoreleasedReturnValue();
    itemID = v10->_itemID;
    v10->_itemID = (BRCItemID *)v11;

    v10->_throttleID = objc_msgSend(v8, "dbRowID");
    v10->_totalSize = a5;
    objc_storeStrong((id *)&v10->_stageID, a4);
    v19 = CFSTR("BRCSizeInfoTotalUnitCountKey");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[BRCProgress uploadProgressForDocument:sizeInfo:](BRCProgress, "uploadProgressForDocument:sizeInfo:", v8, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    progress = v10->_progress;
    v10->_progress = (BRCProgress *)v15;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  if (-[BRCUpload progressPublished](self, "progressPublished"))
    -[BRCProgress brc_unpublish](self->_progress, "brc_unpublish");
  v3.receiver = self;
  v3.super_class = (Class)BRCUpload;
  -[BRCUpload dealloc](&v3, sel_dealloc);
}

- (BRCItemID)itemID
{
  return self->_itemID;
}

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
  objc_storeStrong((id *)&self->_record, a3);
}

- (unint64_t)totalSize
{
  return self->_totalSize;
}

- (unint64_t)doneSize
{
  return self->_doneSize;
}

- (void)setDoneSize:(unint64_t)a3
{
  self->_doneSize = a3;
}

- (BRCProgress)progress
{
  return self->_progress;
}

- (BOOL)progressPublished
{
  return self->_progressPublished;
}

- (void)setProgressPublished:(BOOL)a3
{
  self->_progressPublished = a3;
}

- (int64_t)throttleID
{
  return self->_throttleID;
}

- (NSString)stageID
{
  return self->_stageID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_stageID, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
}

@end

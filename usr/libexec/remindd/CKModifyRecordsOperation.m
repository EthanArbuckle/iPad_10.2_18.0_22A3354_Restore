@implementation CKModifyRecordsOperation

- (void)ic_removeAllCKCompletionBlocksButNotTheNSOperationCompletionBlock_50200031
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKModifyRecordsOperation;
  -[CKModifyRecordsOperation ic_removeAllCKCompletionBlocksButNotTheNSOperationCompletionBlock_50200031](&v3, "ic_removeAllCKCompletionBlocksButNotTheNSOperationCompletionBlock_50200031");
  -[CKModifyRecordsOperation setPerRecordSaveBlock:](self, "setPerRecordSaveBlock:", 0);
  -[CKModifyRecordsOperation setPerRecordProgressBlock:](self, "setPerRecordProgressBlock:", 0);
  -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](self, "setModifyRecordsCompletionBlock:", 0);
}

- (id)ic_shortLoggingOperationName
{
  return ICCKOperationShortClassNameCKModifyRecordsOperation;
}

@end

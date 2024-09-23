@implementation CKFetchRecordsOperation

- (void)ic_removeAllCKCompletionBlocksButNotTheNSOperationCompletionBlock_50200031
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKFetchRecordsOperation;
  -[CKFetchRecordsOperation ic_removeAllCKCompletionBlocksButNotTheNSOperationCompletionBlock_50200031](&v3, "ic_removeAllCKCompletionBlocksButNotTheNSOperationCompletionBlock_50200031");
  -[CKFetchRecordsOperation setPerRecordCompletionBlock:](self, "setPerRecordCompletionBlock:", 0);
  -[CKFetchRecordsOperation setPerRecordProgressBlock:](self, "setPerRecordProgressBlock:", 0);
  -[CKFetchRecordsOperation setFetchRecordsCompletionBlock:](self, "setFetchRecordsCompletionBlock:", 0);
}

- (id)ic_shortLoggingOperationName
{
  return ICCKOperationShortClassNameCKFetchRecordsOperation;
}

@end

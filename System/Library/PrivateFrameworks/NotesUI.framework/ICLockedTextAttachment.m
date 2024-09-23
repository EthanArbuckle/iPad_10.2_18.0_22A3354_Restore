@implementation ICLockedTextAttachment

- (int64_t)lockedAttachmentViewLayout
{
  void *v3;
  void *v4;
  int v5;

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isURL"))
  {

    return 0;
  }
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isScannedDocument");

  return !v5;
}

@end

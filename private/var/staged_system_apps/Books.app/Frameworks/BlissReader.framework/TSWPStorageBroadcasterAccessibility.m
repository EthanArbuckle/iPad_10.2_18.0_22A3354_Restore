@implementation TSWPStorageBroadcasterAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPStorageBroadcaster");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)broadcastStorage:(id)a3 didChangeRange:(_NSRange)a4 delta:(int64_t)a5 broadcastKind:(int)a6
{
  uint64_t v6;
  NSUInteger length;
  NSUInteger location;
  void *v12;
  Class v13;
  Class v14;
  objc_super v15;
  char v16;

  v6 = *(_QWORD *)&a6;
  length = a4.length;
  location = a4.location;
  v16 = 0;
  v12 = (void *)objc_opt_class(TSWPStorageAccessibility);
  v13 = __TSAccessibilityCastAsSafeCategory(v12, (uint64_t)a3, 1, &v16);
  if (v16)
    abort();
  v14 = v13;
  -[objc_class tsaxEnumerateAttachmentsUsingBlock:](v13, "tsaxEnumerateAttachmentsUsingBlock:", &stru_43BF80);
  -[objc_class tsaxEnumerateFootnoteReferenceAttachmentsUsingBlock:](v14, "tsaxEnumerateFootnoteReferenceAttachmentsUsingBlock:", &stru_43BFC0);
  v15.receiver = self;
  v15.super_class = (Class)TSWPStorageBroadcasterAccessibility;
  -[TSWPStorageBroadcasterAccessibility broadcastStorage:didChangeRange:delta:broadcastKind:](&v15, "broadcastStorage:didChangeRange:delta:broadcastKind:", a3, location, length, a5, v6);
}

@end

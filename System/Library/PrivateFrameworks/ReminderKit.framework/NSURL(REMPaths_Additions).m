@implementation NSURL(REMPaths_Additions)

- (uint64_t)rem_URLByAppendingReminderDataContainerPathComponent
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:", CFSTR("Container_v1/"));
}

@end

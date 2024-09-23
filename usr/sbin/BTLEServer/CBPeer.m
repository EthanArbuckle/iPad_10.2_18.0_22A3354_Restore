@implementation CBPeer

- (id)msgIdentifier
{
  void *v2;
  __CFString *v3;
  CFUUIDRef v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CBPeer identifier](self, "identifier"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUIDString"));
  v4 = CFUUIDCreateFromString(kCFAllocatorDefault, v3);

  return (id)CFAutorelease(v4);
}

@end

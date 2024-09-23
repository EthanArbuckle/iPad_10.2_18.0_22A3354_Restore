@implementation NSURL

- (BOOL)th_shouldSharedAppDelegateHandleURL
{
  NSString *v3;
  unsigned __int8 v4;
  unsigned __int8 v6;

  v3 = -[NSString lowercaseString](-[NSURL scheme](self, "scheme"), "lowercaseString");
  v4 = -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("ibooks"));
  if (objc_msgSend(+[NSURL assetIDFromURL:](NSURL, "assetIDFromURL:", self), "length") && (v4 & 1) != 0)
    return 1;
  if (-[NSURL host](self, "host"))
    v6 = 0;
  else
    v6 = v4;
  if ((v6 & 1) != 0)
    return 0;
  else
    return objc_msgSend(objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "validURLSchemes"), "containsObject:", v3);
}

@end

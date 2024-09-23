@implementation NSURL(WebKitUtilities)

- (void)_web_setTitle:()WebKitUtilities
{
  void *v5;

  v5 = (void *)objc_msgSend(objc_alloc((Class)PAL::getLPLinkMetadataClass[0](a1)), "init");
  objc_msgSend(v5, "setURL:", a1);
  objc_msgSend(v5, "setTitle:", a3);
  if (v5)
    CFRelease(v5);
}

- (uint64_t)_web_title
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(objc_alloc((Class)PAL::getLPLinkMetadataClass[0](a1)), "init");
  objc_msgSend(v2, "setURL:", a1);
  v3 = objc_msgSend(v2, "title");
  if (v2)
    CFRelease(v2);
  return v3;
}

@end

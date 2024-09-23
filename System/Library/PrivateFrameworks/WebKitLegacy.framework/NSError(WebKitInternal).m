@implementation NSError(WebKitInternal)

- (uint64_t)_webkit_initWithDomain:()WebKitInternal code:URL:
{
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v9 = (void *)objc_msgSend((id)descriptions, "objectForKey:");
  v10 = objc_msgSend(v9, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a4));
  v11 = (void *)MEMORY[0x1E0C99D80];
  v12 = objc_msgSend(a5, "absoluteString");
  return objc_msgSend(a1, "initWithDomain:code:userInfo:", a3, (int)a4, objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", a5, CFSTR("NSErrorFailingURLKey"), v12, *MEMORY[0x1E0CB3300], v10, *MEMORY[0x1E0CB2D50], 0));
}

@end

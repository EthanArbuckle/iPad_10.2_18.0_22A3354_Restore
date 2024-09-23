@implementation _UIWebImageUploadItem

- (id)displayImage
{
  return iconForImageFile((const __CFURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", -[_UIWebFileUploadItem filePath](self, "filePath")));
}

- (BOOL)isVideo
{
  return 0;
}

@end

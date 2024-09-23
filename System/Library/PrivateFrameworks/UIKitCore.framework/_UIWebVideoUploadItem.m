@implementation _UIWebVideoUploadItem

- (id)displayImage
{
  return iconForVideoFile((void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", -[_UIWebFileUploadItem filePath](self, "filePath")));
}

- (BOOL)isVideo
{
  return 1;
}

@end

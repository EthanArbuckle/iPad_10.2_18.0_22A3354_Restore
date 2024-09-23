@implementation SAUIImageResource

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("ImageResource");
}

+ (id)imageResource
{
  return objc_alloc_init((Class)a1);
}

- (NSData)imageData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("imageData"));
}

- (void)setImageData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("imageData"), a3);
}

- (double)pixelHeight
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("pixelHeight"));
}

- (void)setPixelHeight:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("pixelHeight"), a3);
}

- (double)pixelWidth
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("pixelWidth"));
}

- (void)setPixelWidth:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("pixelWidth"), a3);
}

- (double)pointHeight
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("pointHeight"));
}

- (void)setPointHeight:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("pointHeight"), a3);
}

- (double)pointWidth
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("pointWidth"));
}

- (void)setPointWidth:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("pointWidth"), a3);
}

- (NSURL)resourceUrl
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("resourceUrl"));
}

- (void)setResourceUrl:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("resourceUrl"), a3);
}

- (double)scaleFactor
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("scaleFactor"));
}

- (void)setScaleFactor:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("scaleFactor"), a3);
}

- (NSString)urlFormatString
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("urlFormatString"));
}

- (void)setUrlFormatString:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("urlFormatString"), a3);
}

- (NSString)userAgent
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("userAgent"));
}

- (void)setUserAgent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("userAgent"), a3);
}

@end

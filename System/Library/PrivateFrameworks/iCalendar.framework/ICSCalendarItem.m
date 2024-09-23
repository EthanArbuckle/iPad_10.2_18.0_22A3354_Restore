@implementation ICSCalendarItem

- (void)setX_apple_structuredData:(id)a3
{
  -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", a3, 5026, CFSTR("X-APPLE-STRUCTURED-DATA"));
}

- (NSData)x_apple_structuredData
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-STRUCTURED-DATA"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

@end

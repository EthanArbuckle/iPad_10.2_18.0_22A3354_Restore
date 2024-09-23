@implementation PUCurationImportSourceBrowserDebugViewCell

- (NSString)importSourceName
{
  return (NSString *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setImportSourceName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importSourceName, 0);
}

@end

@implementation PUAudioClassificationBrowserDebugViewCell

- (NSString)audioClassificationName
{
  return (NSString *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setAudioClassificationName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioClassificationName, 0);
}

@end

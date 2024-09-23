@implementation AEAudiobookPlatformConfiguration

+ (void)configureForPlatform
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___AEAudiobookPlatformConfiguration;
  objc_msgSendSuper2(&v2, "configureForPlatform");
  if (qword_20F598 != -1)
    dispatch_once(&qword_20F598, &stru_1C0F10);
}

@end

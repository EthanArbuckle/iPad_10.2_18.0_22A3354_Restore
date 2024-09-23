@implementation BKAudiobookPlatformConfiguration

+ (void)configureForPlatform
{
  if (qword_44EE8 != -1)
    dispatch_once(&qword_44EE8, &stru_39308);
}

@end

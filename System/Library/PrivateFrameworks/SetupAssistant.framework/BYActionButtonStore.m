@implementation BYActionButtonStore

+ (id)currentData
{
  return (id)(id)CFPreferencesCopyValue(CFSTR("SBSystemActionConfiguredActionArchive"), CFSTR("com.apple.springboard"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
}

+ (void)setCurrentData:(id)a3
{
  CFPreferencesSetValue(CFSTR("SBSystemActionConfiguredActionArchive"), a3, CFSTR("com.apple.springboard"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
}

@end

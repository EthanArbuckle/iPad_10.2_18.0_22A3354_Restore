@implementation UniqueEntityHelper

+ (void)postPreferenceEntityDidUpdateNotification
{
  int BOOL;

  BOOL = GEOConfigGetBOOL(MapsConfig_PreferencesUniqueEntityDidUpdate, off_1014B5518);
  GEOConfigSetBOOL(MapsConfig_PreferencesUniqueEntityDidUpdate, off_1014B5518, BOOL ^ 1u);
}

- (_TtC4Maps18UniqueEntityHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UniqueEntityHelper();
  return -[UniqueEntityHelper init](&v3, "init");
}

@end

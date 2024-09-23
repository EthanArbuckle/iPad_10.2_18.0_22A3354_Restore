@implementation FTPreferences

- (NSString)domain
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (_TtC8FaceTime13FTPreferences)init
{
  objc_super v3;

  *((_BYTE *)&self->super.super.isa
  + OBJC_IVAR____TtC8FaceTime13FTPreferences____lazy_storage___enableInterstitialLinkSharingFlow) = 2;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FTPreferences();
  return -[FTPreferences init](&v3, "init");
}

@end

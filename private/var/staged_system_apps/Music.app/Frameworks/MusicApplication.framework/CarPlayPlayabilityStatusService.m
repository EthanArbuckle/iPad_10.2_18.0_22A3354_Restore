@implementation CarPlayPlayabilityStatusService

+ (BOOL)isModelObjectPlayable:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = a3;
  LOBYTE(v3) = sub_AD4648(v3);

  return v3 & 1;
}

- (_TtC16MusicApplication31CarPlayPlayabilityStatusService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CarPlayPlayabilityStatusService();
  return -[CarPlayPlayabilityStatusService init](&v3, "init");
}

@end

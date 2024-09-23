@implementation MTMusicSubscriptionInfoLoader

+ (id)loadIfNeededAndReturnError:(id *)a3
{
  void *v3;

  swift_getObjCClassMetadata();
  static MusicSubscriptionInfoLoader.loadIfNeeded()();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AA120);
  v3 = (void *)sub_1A93F82F8();
  swift_bridgeObjectRelease();
  return v3;
}

- (MTMusicSubscriptionInfoLoader)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MusicSubscriptionInfoLoader();
  return -[MTMusicSubscriptionInfoLoader init](&v3, sel_init);
}

@end

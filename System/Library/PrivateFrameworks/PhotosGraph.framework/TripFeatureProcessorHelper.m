@implementation TripFeatureProcessorHelper

- (_TtC11PhotosGraph26TripFeatureProcessorHelper)init
{
  objc_class *v2;
  objc_super v4;

  v2 = (objc_class *)MEMORY[0x1E0DEE9E0];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph26TripFeatureProcessorHelper_locationDictionaryCache) = (Class)MEMORY[0x1E0DEE9E0];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph26TripFeatureProcessorHelper_areaCache) = v2;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC11PhotosGraph26TripFeatureProcessorHelper_numberOfMomentsAfterFilter) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TripFeatureProcessorHelper();
  return -[TripFeatureProcessorHelper init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

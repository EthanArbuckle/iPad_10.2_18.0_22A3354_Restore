@implementation CHEffortSampleCollection

- (WOEffortSampleCollection)collection
{
  return (WOEffortSampleCollection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                             + OBJC_IVAR___CHEffortSampleCollection_collection));
}

- (CHEffortSampleCollection)initWithEffortSample:(id)a3 estimatedEffortSample:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  CHEffortSampleCollection *v11;
  CHEffortSampleCollection *v12;
  objc_super v14;

  objc_allocWithZone((Class)type metadata accessor for EffortSampleCollection(0, a2));
  v7 = a3;
  v8 = a4;
  v9 = v7;
  v10 = v8;
  v11 = self;
  *(Class *)((char *)&v11->super.isa + OBJC_IVAR___CHEffortSampleCollection_collection) = (Class)EffortSampleCollection.init(effortSample:estimatedEffortSample:)(a3, a4);

  v14.receiver = v11;
  v14.super_class = (Class)type metadata accessor for CHEffortSampleCollection();
  v12 = -[CHEffortSampleCollection init](&v14, "init");

  return v12;
}

- (CHEffortSampleCollection)initWithQuantitySamples:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CHEffortSampleCollection *v8;
  uint64_t v9;
  objc_super v11;

  v5 = sub_10001E724(0, (unint64_t *)&qword_100823F18, HKQuantitySample_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  type metadata accessor for EffortUtilities(0, v7);
  v8 = self;
  v9 = static EffortUtilities.effortSampleCollection(for:)(v6);
  swift_bridgeObjectRelease(v6);
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR___CHEffortSampleCollection_collection) = (Class)v9;

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for CHEffortSampleCollection();
  return -[CHEffortSampleCollection init](&v11, "init");
}

- (CHEffortSampleCollection)initWithSamples:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  CHEffortSampleCollection *result;

  v4 = sub_10001E724(0, &qword_100823568, HKSample_ptr);
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v4);
  sub_10019AE00(v5);
  return result;
}

- (HKQuantitySample)preferredSample
{
  CHEffortSampleCollection *v2;
  void *v3;

  v2 = self;
  v3 = (void *)dispatch thunk of EffortSampleCollection.preferredSample.getter();

  return (HKQuantitySample *)v3;
}

- (HKQuantity)preferredQuantity
{
  CHEffortSampleCollection *v2;
  void *v3;

  v2 = self;
  v3 = (void *)dispatch thunk of EffortSampleCollection.preferredQuantity.getter();

  return (HKQuantity *)v3;
}

- (CHEffortSampleCollection)init
{
  CHEffortSampleCollection *result;

  result = (CHEffortSampleCollection *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.CHEffortSampleCollection", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end

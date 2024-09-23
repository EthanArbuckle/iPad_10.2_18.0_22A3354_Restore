@implementation PGTripTitleGenerator

+ (id)titleForTripNodeAsCollection:(id)a3 locationHelper:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  swift_getObjCClassMetadata();
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, sel_tripFeatureNodes);
  v10 = objc_msgSend(v7, sel_momentNodes);
  static TripTitleGenerator.title(for:momentNodes:locationHelper:)(v9, v10, v8);

  v11 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return v11;
}

+ (id)titleForFeaturedLocationNodes:(id)a3 momentNodes:(id)a4 locationHelper:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;

  swift_getObjCClassMetadata();
  v9 = a3;
  v10 = a4;
  v11 = a5;
  static TripTitleGenerator.title(for:momentNodes:locationHelper:)(v9, v10, v11);

  v12 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return v12;
}

+ (id)titleTupleForDayHighlightGroupNode:(id)a3 locationHelper:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  swift_getObjCClassMetadata();
  v7 = a3;
  v8 = a4;
  static TripTitleGenerator.titleTuple(highlightGroupNode:locationHelper:)(v7, v8);
  v10 = v9;

  return v10;
}

- (PGTripTitleGenerator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TripTitleGenerator();
  return -[PGTripTitleGenerator init](&v3, sel_init);
}

@end

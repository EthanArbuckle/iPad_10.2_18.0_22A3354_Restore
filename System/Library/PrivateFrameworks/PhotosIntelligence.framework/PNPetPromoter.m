@implementation PNPetPromoter

+ (int64_t)kPNPetPromoterVerifiedPetMinimumNumberOfFaces
{
  return 25;
}

+ (int64_t)kPNPetPromoterVerifiedPetMinimumNumberOfMoments
{
  return 3;
}

+ (int64_t)kPNPetPromoterVerifiedPetMinimumNumberOfAssetsAlone
{
  return 3;
}

+ (int64_t)kPNPetPromoterMaximumNumberOfPetsInPeopleHome
{
  return 10;
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)sub_243DC4920();
}

- (PNPersonPromoterDelegate)delegate
{
  return (PNPersonPromoterDelegate *)(id)sub_243DC4950();
}

- (NSDictionary)metrics
{
  void *v2;

  sub_243DC49C8();
  sub_243C67FD8(0, (unint64_t *)&qword_2543DA130);
  v2 = (void *)sub_243F84CC4();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)setMetrics:(id)a3
{
  uint64_t v4;
  PNPetPromoter *v5;

  sub_243C67FD8(0, (unint64_t *)&qword_2543DA130);
  v4 = sub_243F84CD0();
  v5 = self;
  sub_243DC4A84(v4);

}

- (PNPetPromoter)initWithPhotoLibrary:(id)a3 andDelegate:(id)a4
{
  id v5;

  v5 = a3;
  swift_unknownObjectRetain();
  return (PNPetPromoter *)PetPromoter.init(with:delegate:)((uint64_t)v5, (uint64_t)a4);
}

- (void)promoteUnverifiedPetsWithUpdateBlock:(id)a3
{
  void *v4;
  PNPetPromoter *v5;

  v4 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_243DC4BD0();

  swift_release();
}

- (void)incrementMetricForKey:(id)a3 withValue:(unint64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PNPetPromoter *v9;

  v6 = sub_243F84E2C();
  v8 = v7;
  v9 = self;
  sub_243DCDAF0(v6, v8, a4);

  swift_bridgeObjectRelease();
}

+ (id)statusWithPhotoLibrary:(id)a3 delegate:(id)a4
{
  id v5;
  void *v6;

  swift_getObjCClassMetadata();
  v5 = a3;
  swift_unknownObjectRetain();
  static PetPromoter.status(with:delegate:)();

  swift_unknownObjectRelease();
  v6 = (void *)sub_243F84E08();
  swift_bridgeObjectRelease();
  return v6;
}

+ (void)promoteUnverifiedPetsInPhotoLibrary:(id)a3 withUpdateBlock:(id)a4
{
  void *v5;
  uint64_t ObjCClassMetadata;
  id v7;

  v5 = _Block_copy(a4);
  ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v5);
  v7 = a3;
  sub_243DD0470(v7, ObjCClassMetadata, (uint64_t)v5);
  _Block_release(v5);

}

- (PNPetPromoter)init
{
  PetPromoter.init()();
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

@end

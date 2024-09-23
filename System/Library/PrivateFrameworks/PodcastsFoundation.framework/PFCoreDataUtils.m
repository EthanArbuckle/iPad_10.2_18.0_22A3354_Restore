@implementation PFCoreDataUtils

+ (id)findDuplicateItemsWithEntity:(id)a3 itemsToLookAtFilter:(id)a4 keysThatMustMatchToBeConsideredADuplicate:(id)a5 keysThatShouldNotBeDuplicated:(id)a6 keyValuesOfDuplicatedItemsToReturn:(id)a7 sortDescriptors:(id)a8
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;

  v9 = sub_1A93F8040();
  v11 = v10;
  v12 = (_QWORD *)sub_1A93F8310();
  v13 = sub_1A93F8310();
  v14 = sub_1A93F8310();
  sub_1A9072534(0, (unint64_t *)&qword_1ED2A4190);
  sub_1A93F8310();
  v15 = a4;
  _s18PodcastsFoundation15PFCoreDataUtilsC18findDuplicateItems6entity19itemsToLookAtFilter017keysThatMustMatchK22BeConsideredADuplicate0op9ShouldNotS10Duplicated011keyValuesOfxhK6Return15sortDescriptorsSDySSSayyXlGGSS_So11NSPredicateCSaySSGA2OSaySo16NSSortDescriptorCGtFZ_0(v9, v11, (uint64_t)v15, v12, v13, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEABA148);
  v16 = (void *)sub_1A93F7ED8();
  swift_bridgeObjectRelease();
  return v16;
}

- (_TtC18PodcastsFoundation15PFCoreDataUtils)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PFCoreDataUtils();
  return -[PFCoreDataUtils init](&v3, sel_init);
}

@end

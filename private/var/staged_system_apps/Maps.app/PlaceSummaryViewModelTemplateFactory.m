@implementation PlaceSummaryViewModelTemplateFactory

+ (int64_t)kSearchMinimumRegularLinesCount
{
  return 3;
}

+ (id)venueViewModelWithSearchResult:(id)a3 metadata:(id)a4 labelContext:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;

  swift_getObjCClassMetadata(a1);
  v8 = a3;
  v9 = a4;
  v10 = (void *)sub_1000F43DC(v8, a5);

  return v10;
}

+ (id)viewModelWithSearchResult:(id)a3 metadata:(id)a4 currentLocation:(id)a5 searchAlongRoute:(BOOL)a6 openAt:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v8 = a6;
  swift_getObjCClassMetadata(a1);
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = sub_1000E0218(v12, (char *)a4, (uint64_t)a5, v8, (uint64_t)a7);

  return v16;
}

+ (id)viewModelWithCompletion:(id)a3 metadata:(id)a4 currentLocation:(id)a5 userLocationSearchResult:(id)a6 highlightType:(id)a7 availableWidth:(double)a8 clientSourceType:(int64_t)a9 allowsTappableUnits:(BOOL)a10 searchAlongRoute:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;

  swift_getObjCClassMetadata(a1);
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = (void *)sub_1000E0DA0(v17, (char *)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)v21, a9, a10, a11, a8);

  return v22;
}

+ (id)viewModelWithHistoryEntrySearch:(id)a3 highlightConfiguration:(id)a4 searchAlongRoute:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;

  v5 = a5;
  swift_getObjCClassMetadata(a1);
  swift_unknownObjectRetain(a3);
  v8 = a4;
  v9 = (void *)sub_1000E1830((uint64_t)a3, (uint64_t)v8, v5);
  swift_unknownObjectRelease(a3);

  return v9;
}

+ (id)viewModelWithHistoryEntryPlaceDisplay:(id)a3 highlightConfiguration:(id)a4 availableWidth:(double)a5 currentLocation:(id)a6 searchAlongRoute:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  void *v14;

  v7 = a7;
  swift_getObjCClassMetadata(a1);
  swift_unknownObjectRetain(a3);
  v12 = a4;
  v13 = a6;
  v14 = (void *)sub_1000E18D4(a3, v12, a6, v7, a5);
  swift_unknownObjectRelease(a3);

  return v14;
}

+ (id)viewModelWithAddressBookAddress:(id)a3 highlightConfiguration:(id)a4 searchAlongRoute:(BOOL)a5
{
  return sub_1000E36B0((uint64_t)a1, (uint64_t)a2, a3, a4, a5, (uint64_t (*)(id, id, uint64_t))sub_1000E23A0);
}

+ (id)viewModelWithAutocompletePerson:(id)a3 highlightConfiguration:(id)a4 searchAlongRoute:(BOOL)a5
{
  return sub_1000E36B0((uint64_t)a1, (uint64_t)a2, a3, a4, a5, (uint64_t (*)(id, id, uint64_t))sub_1000E2508);
}

+ (id)viewModelWithCoreRecentContact:(id)a3 highlightConfiguration:(id)a4 searchAlongRoute:(BOOL)a5
{
  return sub_1000E36B0((uint64_t)a1, (uint64_t)a2, a3, a4, a5, (uint64_t (*)(id, id, uint64_t))sub_1000E3724);
}

+ (id)viewModelWithSearchResult:(id)a3 highlightConfiguration:(id)a4 currentLocation:(id)a5 availableWidth:(double)a6 searchAlongRoute:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  char *v13;
  id v14;
  void *v15;

  v7 = a7;
  swift_getObjCClassMetadata(a1);
  v12 = a3;
  v13 = (char *)a4;
  v14 = a5;
  v15 = (void *)sub_1000E3D7C(v12, v13, (uint64_t)a5, v7, a6);

  return v15;
}

+ (id)viewModelWithMapsSuggestionsEntry:(id)a3 highlightConfiguration:(id)a4 searchAlongRoute:(BOOL)a5
{
  return sub_1000E36B0((uint64_t)a1, (uint64_t)a2, a3, a4, a5, (uint64_t (*)(id, id, uint64_t))sub_1000E4684);
}

+ (id)addAPlaceAutocompleteViewModel
{
  swift_getObjCClassMetadata(a1);
  return (id)sub_1000E4E74(1);
}

+ (id)addAPlaceSearchViewModel
{
  swift_getObjCClassMetadata(a1);
  return (id)sub_1000E4E74(2);
}

- (_TtC4Maps36PlaceSummaryViewModelTemplateFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlaceSummaryViewModelTemplateFactory();
  return -[PlaceSummaryViewModelTemplateFactory init](&v3, "init");
}

+ (void)updateDistanceViewModelWithCurrentLocation:(id)a3 mapItem:(id)a4 template:(id)a5 searchAlongTheRoute:(BOOL)a6
{
  id v10;
  id v11;
  id v12;

  swift_getObjCClassMetadata(a1);
  v10 = a3;
  v11 = a4;
  v12 = a5;
  sub_1000F1AA4(a3, v11, (uint64_t)v12, a6);

}

@end

@implementation PersonalizedFavoriteItem

- (NSSet)keys
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_keys);
  swift_bridgeObjectRetain(v2);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSSet *)isa;
}

- (void)setKeys:(id)a3
{
  objc_class *v4;
  uint64_t v5;

  v4 = (objc_class *)static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, &protocol witness table for AnyHashable);
  v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_keys);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_keys) = v4;
  swift_bridgeObjectRelease(v5);
}

- (unint64_t)priority
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_priority);
}

- (void)setPriority:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_priority) = (Class)a3;
}

- (MKMapItem)mapItem
{
  return (MKMapItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_mapItem));
}

- (void)setMapItem:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_mapItem);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_mapItem) = (Class)a3;
  v3 = a3;

}

- (PersonalizedItemSource)source
{
  return (PersonalizedItemSource *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_source));
}

- (void)setSource:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_source);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_source) = (Class)a3;
  v3 = a3;

}

- (CLLocationCoordinate2D)coordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_coordinate);
  v3 = *(double *)&self->keys[OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_coordinate];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  *(CLLocationCoordinate2D *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_coordinate) = a3;
}

- (GEOEnhancedPlacement)enhancedPlacement
{
  return (GEOEnhancedPlacement *)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem__mapItem), "_enhancedPlacement");
}

- (GEOLabelGeometry)labelGeometry
{
  return (GEOLabelGeometry *)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem__mapItem), "_labelGeometry");
}

- (PersonalizedItemPrioritizedStringAdornment)prefix
{
  return (PersonalizedItemPrioritizedStringAdornment *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                               + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_prefix));
}

- (void)setPrefix:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_prefix);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_prefix) = (Class)a3;
  v3 = a3;

}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  return (PersonalizedItemPrioritizedStringAdornment *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                               + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_title));
}

- (void)setTitle:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_title);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_title) = (Class)a3;
  v3 = a3;

}

- (PersonalizedItemPrioritizedStringAdornment)subtitle
{
  return (PersonalizedItemPrioritizedStringAdornment *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                               + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_subtitle));
}

- (void)setSubtitle:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_subtitle);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_subtitle) = (Class)a3;
  v3 = a3;

}

- (unint64_t)sortOrder
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_sortOrder);
}

- (void)setSortOrder:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_sortOrder) = (Class)a3;
}

- (PersonalizedItemStyleAttributesAdornment)styleAttributes
{
  _TtC4Maps24PersonalizedFavoriteItem *v2;
  id v3;

  v2 = self;
  v3 = sub_1000CD934();

  return (PersonalizedItemStyleAttributesAdornment *)v3;
}

- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID
{
  void *v3;
  _TtC4Maps24PersonalizedFavoriteItem *v4;
  id v5;
  id v6;
  PersonalizedItemClientFeatureIDAdornment *result;

  v3 = (void *)objc_opt_self(PersonalizedItemSource);
  v4 = self;
  v5 = sub_1000CD934();
  v6 = objc_msgSend(v3, "clientFeatureIDFromAdornment:mapItem:", v5, *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem__mapItem));

  if (v6)
  {

    return (PersonalizedItemClientFeatureIDAdornment *)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)shouldBeClustered
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_shouldBeClustered);
}

- (void)setShouldBeClustered:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_shouldBeClustered) = a3;
}

- (BOOL)showsBalloonCallout
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_showsBalloonCallout);
}

- (void)setShowsBalloonCallout:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_showsBalloonCallout) = a3;
}

- (SearchResult)searchResult
{
  return (SearchResult *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem__searchResult));
}

- (VKLabelMarker)sourceLabelMarker
{
  return (VKLabelMarker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_sourceLabelMarker));
}

- (void)setSourceLabelMarker:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_sourceLabelMarker);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_sourceLabelMarker) = (Class)a3;
  v3 = a3;

}

- (AddressBookAddress)address
{
  return (AddressBookAddress *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_address));
}

- (void)setAddress:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_address);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_address) = (Class)a3;
  v3 = a3;

}

- (NSArray)searchableStrings
{
  uint64_t v2;
  NSArray v3;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_searchableStrings);
  if (v2)
  {
    swift_bridgeObjectRetain(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_searchableStrings));
    v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3.super.isa = 0;
  }
  return (NSArray *)v3.super.isa;
}

- (void)setSearchableStrings:(id)a3
{
  objc_class *v4;
  uint64_t v5;

  if (a3)
    v4 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  else
    v4 = 0;
  v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_searchableStrings);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_searchableStrings) = v4;
  swift_bridgeObjectRelease(v5);
}

- (BOOL)shouldBeHiddenFromMap
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_shouldBeHiddenFromMap);
}

- (void)setShouldBeHiddenFromMap:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_shouldBeHiddenFromMap) = a3;
}

- (BOOL)mustRefineMapItem
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_shortcutType)
       - 4 < 0xFFFFFFFFFFFFFFFELL;
}

- (SearchDotPlace)searchDotPlace
{
  return (SearchDotPlace *)0;
}

- (int64_t)sourceType
{
  return 9;
}

- (int64_t)sourceSubtype
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_sourceSubtype);
}

- (void)setSourceSubtype:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_sourceSubtype) = (Class)a3;
}

- (BOOL)hasPriorityOverride
{
  return 0;
}

- (int64_t)priorityOverride
{
  return 0;
}

- (GEOServerResultScoreMetadata)serverResultScoreMetadata
{
  return (GEOServerResultScoreMetadata *)0;
}

- (BOOL)hidden
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_hidden);
}

- (void)setHidden:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_hidden) = a3;
}

- (NSArray)autocompletionStrings
{
  _TtC4Maps24PersonalizedFavoriteItem *v2;
  uint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_1000CDEC8();

  if (v3)
  {
    sub_100008B04(&qword_101499CD8);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)setAutocompletionStrings:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;

  if (a3)
  {
    v5 = sub_100008B04(&qword_101499CD8);
    v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  }
  else
  {
    v6 = 0;
  }
  v7 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem____lazy_storage___autocompletionStrings);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem____lazy_storage___autocompletionStrings) = v6;
  sub_1000D010C(v7);
}

- (BOOL)hasServerItemIndex
{
  return 0;
}

- (unint64_t)serverSectionIndex
{
  return 0;
}

- (unint64_t)serverItemIndexInSection
{
  return 0;
}

- (BOOL)isCompoundPersonalizedAutocompleteItem
{
  return 0;
}

- (id)leafPersonalizedAutocompleteItems
{
  uint64_t v3;
  uint64_t v4;
  _TtC4Maps24PersonalizedFavoriteItem *v5;
  Class isa;
  uint64_t v8;

  v3 = sub_100008B04((uint64_t *)&unk_101493B10);
  v4 = swift_allocObject(v3, 40, 7);
  *(_OWORD *)(v4 + 16) = xmmword_100E23F50;
  *(_QWORD *)(v4 + 32) = self;
  v8 = v4;
  specialized Array._endMutation()(v4);
  v5 = self;
  sub_100008B04(&qword_101499CD0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return isa;
}

- (NSString)description
{
  _TtC4Maps24PersonalizedFavoriteItem *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1000CE190();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC4Maps24PersonalizedFavoriteItem)init
{
  _TtC4Maps24PersonalizedFavoriteItem *result;

  result = (_TtC4Maps24PersonalizedFavoriteItem *)_swift_stdlib_reportUnimplementedInitializer("Maps.PersonalizedFavoriteItem", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_keys));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_searchableStrings));
  sub_1000D010C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem____lazy_storage___autocompletionStrings));

  swift_bridgeObjectRelease(*(_QWORD *)&self->keys[OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem__title]);
}

@end

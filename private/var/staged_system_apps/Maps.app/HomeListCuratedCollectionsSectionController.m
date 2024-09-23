@implementation HomeListCuratedCollectionsSectionController

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps43HomeListCuratedCollectionsSectionController____lazy_storage___curatedCollectionsIdentifierPath));
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  _TtC4Maps43HomeListCuratedCollectionsSectionController *v19;
  uint64_t v20;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = objc_opt_self(HomeCuratedCollectionsCollectionViewCell);
  v14 = swift_dynamicCastObjCClass(a4, v13);
  if (v14)
  {
    v15 = OBJC_IVAR____TtC4Maps43HomeListCuratedCollectionsSectionController_needsResetScrollOffset;
    if (*((_BYTE *)&self->super.super.isa
         + OBJC_IVAR____TtC4Maps43HomeListCuratedCollectionsSectionController_needsResetScrollOffset) == 1)
    {
      v16 = (void *)v14;
      v17 = a3;
      v18 = a4;
      v19 = self;
      objc_msgSend(v16, "resetScrollOffset");
      *((_BYTE *)&self->super.super.isa + v15) = 0;

    }
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)routeToCuratedCollection:(id)a3
{
  void *v5;
  id v6;
  _TtC4Maps43HomeListCuratedCollectionsSectionController *v7;
  _QWORD v8[5];
  uint64_t v9;

  sub_1000AB280((uint64_t)self + OBJC_IVAR____TtC4Maps25HomeListSectionController_configuration, v8);
  v5 = (void *)swift_unknownObjectWeakLoadStrong(&v9);
  v6 = a3;
  v7 = self;
  sub_1000AB2BC((uint64_t)v8);
  if (v5)
  {
    objc_msgSend(v5, "homeItemTapped:", v6);

    swift_unknownObjectRelease(v5);
  }
  else
  {

  }
}

- (void)routeToGuidesHomeFromExploreGuides:(id)a3
{
  void *v5;
  id v6;
  _TtC4Maps43HomeListCuratedCollectionsSectionController *v7;
  id v8;
  _QWORD v9[5];
  uint64_t v10;

  sub_1000AB280((uint64_t)self + OBJC_IVAR____TtC4Maps25HomeListSectionController_configuration, v9);
  v5 = (void *)swift_unknownObjectWeakLoadStrong(&v10);
  v6 = a3;
  v7 = self;
  sub_1000AB2BC((uint64_t)v9);
  if (v5)
  {
    v8 = objc_msgSend(v6, "guideLocation");
    objc_msgSend(v5, "homeItemTapped:", v8);

    swift_unknownObjectRelease(v5);
  }
  else
  {

  }
}

- (void)collectionsCarouselDidRouteToCollectionId:(id)a3 atIndex:(int64_t)a4 isSaved:(BOOL)a5
{
  objc_msgSend((id)objc_opt_self(HomeAnalyticsManager), "captureCuratedCollectionCarouselTapCollectionWithIdentifier:atIndex:isSaved:", a3, a4, a5);
}

- (void)collectionsCarouselDidScrollForward
{
  objc_msgSend((id)objc_opt_self(HomeAnalyticsManager), "captureCuratedCollectionCarouselScrollForward");
}

- (void)collectionsCarouselDidScrollBackward
{
  objc_msgSend((id)objc_opt_self(HomeAnalyticsManager), "captureCuratedCollectionCarouselScrollBackward");
}

- (void)exploreGuidesButtonTapped
{
  objc_msgSend((id)objc_opt_self(HomeAnalyticsManager), "captureExploreGuidesTapAction");
}

@end

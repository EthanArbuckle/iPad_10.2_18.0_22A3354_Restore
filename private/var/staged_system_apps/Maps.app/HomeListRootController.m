@implementation HomeListRootController

- (NSArray)keyCommands
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22HomeListRootController_keyCommands);
  sub_10000E4BC(0, &qword_101499270, UIKeyCommand_ptr);
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void)setKeyCommands:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;

  v5 = sub_10000E4BC(0, &qword_101499270, UIKeyCommand_ptr);
  v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22HomeListRootController_keyCommands);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22HomeListRootController_keyCommands) = v6;
  swift_bridgeObjectRelease(v7);
}

- (_TtC4Maps22HomeListRootController)initWithConfiguration:(id)a3
{
  return (_TtC4Maps22HomeListRootController *)sub_100137068((void (**)(char *, uint64_t, uint64_t))a3);
}

- (BOOL)active
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps22HomeListRootController_isActive);
}

- (void)setActive:(BOOL)a3
{
  char v3;
  _TtC4Maps22HomeListRootController *v4;

  v3 = *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps22HomeListRootController_isActive);
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps22HomeListRootController_isActive) = a3;
  v4 = self;
  sub_1001379F0(v3);

}

- (UICollectionViewLayout)collectionViewLayout
{
  _TtC4Maps22HomeListRootController *v2;
  id v3;

  v2 = self;
  v3 = sub_1001383FC();

  return (UICollectionViewLayout *)v3;
}

- (UICollectionViewDataSource)dataSource
{
  _TtC4Maps22HomeListRootController *v2;
  id v3;

  v2 = self;
  v3 = sub_1001385F0();

  return (UICollectionViewDataSource *)v3;
}

- (SuggestionsItemSource)suggestionsItemSource
{
  _TtC4Maps22HomeListRootController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = sub_100136E10();
  v4 = objc_msgSend(v3, "suggestionsItemSource");

  return (SuggestionsItemSource *)v4;
}

- (void)resetScrollOffset
{
  _TtC4Maps22HomeListRootController *v2;

  v2 = self;
  sub_100137EC4();

}

- (void)setNeedsUpdate
{
  uint64_t v2;
  uint64_t v3;
  _TtC4Maps22HomeListRootController *v4;

  v4 = self;
  v2 = sub_100008B04(&qword_10149C140);
  v3 = sub_100010D70(&qword_10149C148, &qword_10149C140, (const char *)&protocol conformance descriptor for PassthroughSubject<A, B>);
  Subject<>.send()(v2, v3);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC4Maps22HomeListRootController *v6;
  _TtC4Maps22HomeListRootController *v7;
  char v8;
  _OWORD v10[2];

  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v10);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_100141B1C((uint64_t)v10);

  sub_100010CC4((uint64_t)v10, (uint64_t *)&unk_101493350);
  return v8 & 1;
}

- (void)handleKeyCommand:(id)a3
{
  id v4;
  _TtC4Maps22HomeListRootController *v5;

  v4 = a3;
  v5 = self;
  sub_10013CD90(v4);

}

- (_TtC4Maps22HomeListRootController)init
{
  _TtC4Maps22HomeListRootController *result;

  result = (_TtC4Maps22HomeListRootController *)_swift_stdlib_reportUnimplementedInitializer("Maps.HomeListRootController", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_10014212C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22HomeListRootController_rootSnapshot), *(_QWORD *)&self->configuration[OBJC_IVAR____TtC4Maps22HomeListRootController_rootSnapshot]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps22HomeListRootController_sectionControllersToUpdate));

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC4Maps22HomeListRootController_currentDragSession));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps22HomeListRootController_keyCommands));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps22HomeListRootController_keyCommandsToHandlers));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps22HomeListRootController____lazy_storage___suggestionsDataProvider));

  sub_100042EEC(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC4Maps22HomeListRootController____lazy_storage___homeResultDataProvider));
  swift_release();
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps22HomeListRootController_subscribers));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps22HomeListRootController____lazy_storage___compositionalLayout));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps22HomeListRootController____lazy_storage___diffableDataSource));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps22HomeListRootController__sectionControllers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps22HomeListRootController____lazy_storage___sectionControllersByIdentifier));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps22HomeListRootController_allDataProviders));
  v3 = (char *)self + OBJC_IVAR____TtC4Maps22HomeListRootController_proactiveTraySignposter;
  v4 = type metadata accessor for OSSignposter(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC4Maps22HomeListRootController *v14;
  void *v15;
  _QWORD v17[4];

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = a3;
  swift_unknownObjectRetain(a5);
  v14 = self;
  _bridgeAnyObjectToAny(_:)(v17);
  swift_unknownObjectRelease(a5);
  v15 = (void *)sub_10013E270((uint64_t)v13, (uint64_t)v12, (uint64_t)v17);

  sub_10000BEAC(v17);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v15;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC4Maps22HomeListRootController *v17;
  void *v18;
  __n128 v19;
  uint64_t v21;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = self;
  v18 = (void *)sub_10013E50C((uint64_t)v16, v13, v15, (uint64_t)v12);

  v19 = swift_bridgeObjectRelease(v15);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v19);
  return v18;
}

- (void)scrollViewDidScroll:(id)a3
{
  sub_10013E830((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_scrollViewDidScroll_);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  sub_10013E830((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_scrollViewWillBeginDragging_);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  void *Strong;
  void *v11;
  id v12;
  _TtC4Maps22HomeListRootController *v13;

  y = a4.y;
  x = a4.x;
  Strong = (void *)swift_unknownObjectWeakLoadStrong(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22HomeListRootController_configuration)+ OBJC_IVAR____TtC4Maps35HomeListRootControllerConfiguration_homeActionDelegate);
  if (Strong)
  {
    v11 = Strong;
    if ((objc_msgSend(Strong, "respondsToSelector:", "scrollViewWillEndDragging:withVelocity:targetContentOffset:") & 1) != 0)
    {
      v12 = a3;
      v13 = self;
      objc_msgSend(v11, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v12, a5, x, y);

    }
    swift_unknownObjectRelease(v11);
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC4Maps22HomeListRootController *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_10013E9A0((uint64_t)v13, (uint64_t)v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return sub_10013EFA4(self, (uint64_t)a2, a3, (uint64_t)a4, (SEL *)&selRef_collectionView_shouldHighlightItemAtIndexPath_);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_10013EFA4(self, (uint64_t)a2, a3, (uint64_t)a4, (SEL *)&selRef_collectionView_shouldSelectItemAtIndexPath_);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC4Maps22HomeListRootController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10013F06C((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)newTraits
{
  uint64_t Strong;
  void *v4;
  _TtC4Maps22HomeListRootController *v5;
  id v6;
  id result;
  id v8;
  _TtC4Maps22HomeListRootController *v9;
  id v10;

  Strong = swift_unknownObjectWeakLoadStrong(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22HomeListRootController_configuration)+ OBJC_IVAR____TtC4Maps35HomeListRootControllerConfiguration_homeActionDelegate);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = self;
    v6 = objc_msgSend(v4, "newTraits");

    swift_unknownObjectRelease(v4);
    return v6;
  }
  else
  {
    v8 = objc_allocWithZone((Class)GEOMapServiceTraits);
    v9 = self;
    result = objc_msgSend(v8, "init");
    if (result)
    {
      v10 = result;

      return v10;
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC4Maps22HomeListRootController *v14;
  uint64_t v15;
  uint64_t v16;
  Class isa;
  uint64_t v19;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  swift_unknownObjectRetain(a4);
  v14 = self;
  sub_100141C9C(v13, (uint64_t)v12);
  v16 = v15;

  swift_unknownObjectRelease(a4);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_10000E4BC(0, &qword_10149C0A8, UIDragItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v16);
  return isa;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v6;
  _TtC4Maps22HomeListRootController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_10013F718(v6, a4);

  swift_unknownObjectRelease(a4);
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v6;
  _TtC4Maps22HomeListRootController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_100141F74();

  swift_unknownObjectRelease(a4);
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC4Maps22HomeListRootController *v13;
  id v14;
  id result;
  id v16;
  id v17;
  uint64_t v18;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = objc_allocWithZone((Class)UIDragPreviewParameters);
  v12 = a3;
  v13 = self;
  v14 = objc_msgSend(v11, "init");
  result = objc_msgSend(v12, "theme");
  if (result)
  {
    v16 = result;
    v17 = objc_msgSend(result, "controlBackgroundColor");

    objc_msgSend(v14, "setBackgroundColor:", v17);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)dragAndDropItem:(id)a3 didResolveMapItem:(id)a4
{
  id v6;
  id v7;
  _TtC4Maps22HomeListRootController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10013F910();

}

- (void)dragAndDropPreviewDidUpdate:(id)a3
{
  id v4;
  _TtC4Maps22HomeListRootController *v5;

  v4 = a3;
  v5 = self;
  sub_10013F910();

}

@end

@implementation HighlightsProvider

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC8ShelfKit18HighlightsProvider *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit18HighlightsProvider_highlightCenter);
  v5 = self;
  objc_msgSend(v4, "setDelegate:", 0);
  v6 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  objc_msgSend(v6, "removeObserver:name:object:", v5, ACDAccountStoreDidChangeNotification, 0);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[HighlightsProvider dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((Class *)((char *)&self->super.isa
                                                     + OBJC_IVAR____TtC8ShelfKit18HighlightsProvider_storeDataProvider));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit18HighlightsProvider_highlightsSubject));
  swift_bridgeObjectRelease();
}

- (void)accountDidChange
{
  _TtC8ShelfKit18HighlightsProvider *v2;

  v2 = self;
  sub_184830();

}

- (BOOL)isSharedContentWithContentAdamId:(int64_t)a3
{
  _TtC8ShelfKit18HighlightsProvider *v5;
  uint64_t v6;
  _BYTE v8[24];

  swift_beginAccess((char *)self + OBJC_IVAR____TtC8ShelfKit18HighlightsProvider_highlightsDisplayedOnCurrentPage, v8, 0, 0);
  v5 = self;
  v6 = swift_bridgeObjectRetain();
  LOBYTE(a3) = sub_1824C4(v6, a3);

  swift_bridgeObjectRelease();
  return a3 & 1;
}

- (void)clearSharedItems
{
  uint64_t *v2;
  uint64_t v3;
  _BYTE v4[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8ShelfKit18HighlightsProvider_highlightsDisplayedOnCurrentPage);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8ShelfKit18HighlightsProvider_highlightsDisplayedOnCurrentPage, v4, 1, 0);
  v3 = *v2;
  *v2 = (uint64_t)&_swiftEmptySetSingleton;
  swift_bridgeObjectRelease(v3);
}

- (_TtC8ShelfKit18HighlightsProvider)init
{
  _TtC8ShelfKit18HighlightsProvider *result;

  result = (_TtC8ShelfKit18HighlightsProvider *)_swift_stdlib_reportUnimplementedInitializer("ShelfKit.HighlightsProvider", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (BOOL)isSharedContentWithPageAdamId:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC8ShelfKit18HighlightsProvider *v7;
  Swift::String_optional v8;
  Swift::Bool v9;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  v9 = HighlightsProvider.isSharedContent(pageAdamId:)(v8);

  swift_bridgeObjectRelease();
  return v9;
}

- (void)highlightCenterDidAddHighlights:(id)a3
{
  id v4;
  _TtC8ShelfKit18HighlightsProvider *v5;

  v4 = a3;
  v5 = self;
  _s8ShelfKit18HighlightsProviderC021highlightCenterDidAddC0yySo011SLHighlightF0CF_0();

}

- (void)highlightCenter:(id)a3 didRemoveHighlights:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8ShelfKit18HighlightsProvider *v10;

  v7 = sub_327F8(0, &qword_3BEB08, SLHighlight_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_187160(v8);

  swift_bridgeObjectRelease();
}

@end

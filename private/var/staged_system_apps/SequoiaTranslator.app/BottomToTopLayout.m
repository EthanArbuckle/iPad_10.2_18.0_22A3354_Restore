@implementation BottomToTopLayout

- (void)prepareLayout
{
  _TtC17SequoiaTranslator17BottomToTopLayout *v2;

  v2 = self;
  sub_1000167FC();

}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Class isa;
  _BYTE v13[24];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC17SequoiaTranslator17BottomToTopLayout_cachedAttributes);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC17SequoiaTranslator17BottomToTopLayout_cachedAttributes, v13, 0, 0);
  swift_bridgeObjectRetain(*v7);
  sub_100016C78(v8, x, y, width, height);
  v10 = v9;
  sub_100017660();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v10);
  return isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC17SequoiaTranslator17BottomToTopLayout *v9;
  void *v10;
  uint64_t v12;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  v10 = sub_100016F20((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (_TtC17SequoiaTranslator17BottomToTopLayout)initWithSection:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator17BottomToTopLayout_cachedAttributes) = (Class)&_swiftEmptyDictionarySingleton;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BottomToTopLayout();
  return -[BottomToTopLayout initWithSection:](&v5, "initWithSection:", a3);
}

- (_TtC17SequoiaTranslator17BottomToTopLayout)initWithSection:(id)a3 configuration:(id)a4
{
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator17BottomToTopLayout_cachedAttributes) = (Class)&_swiftEmptyDictionarySingleton;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for BottomToTopLayout();
  return -[BottomToTopLayout initWithSection:configuration:](&v7, "initWithSection:configuration:", a3, a4);
}

- (_TtC17SequoiaTranslator17BottomToTopLayout)initWithSectionProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _TtC17SequoiaTranslator17BottomToTopLayout *v8;
  objc_super v10;
  _QWORD aBlock[5];
  uint64_t v12;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_100263EF8, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator17BottomToTopLayout_cachedAttributes) = (Class)&_swiftEmptyDictionarySingleton;
  aBlock[4] = sub_10001769C;
  v12 = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001BAEF0;
  aBlock[3] = &unk_100263F10;
  v6 = _Block_copy(aBlock);
  v7 = v12;
  swift_retain(v5);
  swift_release(v7);
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for BottomToTopLayout();
  v8 = -[BottomToTopLayout initWithSectionProvider:](&v10, "initWithSectionProvider:", v6);
  swift_release(v5);
  _Block_release(v6);
  return v8;
}

- (_TtC17SequoiaTranslator17BottomToTopLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  _TtC17SequoiaTranslator17BottomToTopLayout *v11;
  objc_super v13;
  _QWORD aBlock[5];
  uint64_t v15;

  v6 = _Block_copy(a3);
  v7 = swift_allocObject(&unk_100263EA8, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator17BottomToTopLayout_cachedAttributes) = (Class)&_swiftEmptyDictionarySingleton;
  aBlock[4] = sub_1000175F8;
  v15 = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001BAEF0;
  aBlock[3] = &unk_100263EC0;
  v8 = _Block_copy(aBlock);
  v9 = v15;
  v10 = a4;
  swift_retain(v7);
  swift_release(v9);
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for BottomToTopLayout();
  v11 = -[BottomToTopLayout initWithSectionProvider:configuration:](&v13, "initWithSectionProvider:configuration:", v8, v10);
  swift_release(v7);

  _Block_release(v8);
  return v11;
}

- (_TtC17SequoiaTranslator17BottomToTopLayout)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator17BottomToTopLayout_cachedAttributes) = (Class)&_swiftEmptyDictionarySingleton;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BottomToTopLayout();
  return -[BottomToTopLayout initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC17SequoiaTranslator17BottomToTopLayout_cachedAttributes));
}

@end

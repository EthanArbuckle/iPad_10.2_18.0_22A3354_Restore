@implementation NowPlayingQueueViewController.CompositionalLayout

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtCC5Music29NowPlayingQueueViewController19CompositionalLayout *v11;
  NSString v12;
  Class isa;
  objc_class *v14;
  id v15;
  __n128 v16;
  objc_super v18;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = self;
  v12 = String._bridgeToObjectiveC()();
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v14 = (objc_class *)_s19CompositionalLayoutCMa();
  v18.receiver = v11;
  v18.super_class = v14;
  v15 = -[NowPlayingQueueViewController.CompositionalLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](&v18, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v12, isa);

  if (v15)
    sub_100574AEC(v15);

  v16 = swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v16);
  return v15;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtCC5Music29NowPlayingQueueViewController19CompositionalLayout *v7;
  uint64_t v8;
  NSArray v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_1005751D8(x, y, width, height);

  if (v8)
  {
    sub_100575D8C();
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  return v9.super.isa;
}

- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4
{
  double y;
  double x;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _TtCC5Music29NowPlayingQueueViewController19CompositionalLayout *v12;
  Class isa;
  objc_class *v14;
  id v15;
  objc_super v17;
  CGRect v18;

  y = a4.y;
  x = a4.x;
  v8 = type metadata accessor for IndexPath(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v14 = (objc_class *)_s19CompositionalLayoutCMa();
  v17.receiver = v12;
  v17.super_class = v14;
  v15 = -[NowPlayingQueueViewController.CompositionalLayout layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:](&v17, "layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:", isa, x, y);

  objc_msgSend(v15, "frame");
  if (CGRectGetMinY(v18) < *(double *)((char *)&v12->super.super.super.isa
                                      + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController19CompositionalLayout_upNextHeaderMaxY))
  {
    objc_msgSend(v15, "frame");
    objc_msgSend(v15, "setFrame:");
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v15;
}

- (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout)initWithSection:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController19CompositionalLayout_upNextHeaderMaxY) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController19CompositionalLayout_dataSource) = 0;
  v5.receiver = self;
  v5.super_class = (Class)_s19CompositionalLayoutCMa();
  return -[NowPlayingQueueViewController.CompositionalLayout initWithSection:](&v5, "initWithSection:", a3);
}

- (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout)initWithSection:(id)a3 configuration:(id)a4
{
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController19CompositionalLayout_upNextHeaderMaxY) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController19CompositionalLayout_dataSource) = 0;
  v7.receiver = self;
  v7.super_class = (Class)_s19CompositionalLayoutCMa();
  return -[NowPlayingQueueViewController.CompositionalLayout initWithSection:configuration:](&v7, "initWithSection:configuration:", a3, a4);
}

- (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout)initWithSectionProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  _TtCC5Music29NowPlayingQueueViewController19CompositionalLayout *v7;
  objc_super v9;
  _QWORD aBlock[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1010CE620, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController19CompositionalLayout_upNextHeaderMaxY) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController19CompositionalLayout_dataSource) = 0;
  aBlock[4] = sub_100448768;
  aBlock[5] = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1008E31AC;
  aBlock[3] = &unk_1010CE638;
  v6 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v9.receiver = self;
  v9.super_class = (Class)_s19CompositionalLayoutCMa();
  v7 = -[NowPlayingQueueViewController.CompositionalLayout initWithSectionProvider:](&v9, "initWithSectionProvider:", v6);
  swift_release();
  _Block_release(v6);
  return v7;
}

- (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = _Block_copy(a3);
  v6 = swift_allocObject(&unk_1010CE5D0, 24, 7);
  *(_QWORD *)(v6 + 16) = v5;
  return (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout *)sub_10057599C((uint64_t)sub_100448768, v6, a4);
}

- (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController19CompositionalLayout_upNextHeaderMaxY) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController19CompositionalLayout_dataSource) = 0;
  v5.receiver = self;
  v5.super_class = (Class)_s19CompositionalLayoutCMa();
  return -[NowPlayingQueueViewController.CompositionalLayout initWithCoder:](&v5, "initWithCoder:", a3);
}

- (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;

  v7 = _Block_copy(a4);
  if (v7)
  {
    v8 = swift_allocObject(&unk_1010CE580, 24, 7);
    *(_QWORD *)(v8 + 16) = v7;
    v7 = sub_100444E84;
  }
  else
  {
    v8 = 0;
  }
  v9 = a3;
  return (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout *)sub_100575B3C(a3, (uint64_t)v7, v8, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController19CompositionalLayout_dataSource));
}

@end

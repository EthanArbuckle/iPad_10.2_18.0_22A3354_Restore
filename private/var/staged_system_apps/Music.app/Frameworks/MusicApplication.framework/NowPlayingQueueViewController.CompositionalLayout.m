@implementation NowPlayingQueueViewController.CompositionalLayout

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout *v15;
  NSString v16;
  Class isa;
  objc_class *v18;
  id v19;
  objc_super v21;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = a3;
  v14 = a4;
  v15 = self;
  v16 = String._bridgeToObjectiveC()();
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v18 = (objc_class *)_s19CompositionalLayoutCMa();
  v21.receiver = v15;
  v21.super_class = v18;
  v19 = -[NowPlayingQueueViewController.CompositionalLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](&v21, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v16, isa);

  if (v19)
    sub_18CCC4(v19);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease(v12);

  return v19;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout *v7;
  uint64_t v8;
  NSArray v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_18D3D0(x, y, width, height);

  if (v8)
  {
    sub_18E0AC();
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
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
  id v12;
  _TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout *v13;
  Class isa;
  objc_class *v15;
  id v16;
  objc_super v18;
  CGRect v19;

  y = a4.y;
  x = a4.x;
  v8 = type metadata accessor for IndexPath(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = a3;
  v13 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v15 = (objc_class *)_s19CompositionalLayoutCMa();
  v18.receiver = v13;
  v18.super_class = v15;
  v16 = -[NowPlayingQueueViewController.CompositionalLayout layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:](&v18, "layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:", isa, x, y);

  objc_msgSend(v16, "frame");
  if (CGRectGetMinY(v19) < *(double *)((char *)&v13->super.super.super.isa
                                      + OBJC_IVAR____TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout_upNextHeaderMaxY))
  {
    objc_msgSend(v16, "frame");
    objc_msgSend(v16, "setFrame:");
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v16;
}

- (_TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout)initWithSection:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout_upNextHeaderMaxY) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout_dataSource) = 0;
  v5.receiver = self;
  v5.super_class = (Class)_s19CompositionalLayoutCMa();
  return -[NowPlayingQueueViewController.CompositionalLayout initWithSection:](&v5, "initWithSection:", a3);
}

- (_TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout)initWithSection:(id)a3 configuration:(id)a4
{
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout_upNextHeaderMaxY) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout_dataSource) = 0;
  v7.receiver = self;
  v7.super_class = (Class)_s19CompositionalLayoutCMa();
  return -[NowPlayingQueueViewController.CompositionalLayout initWithSection:configuration:](&v7, "initWithSection:configuration:", a3, a4);
}

- (_TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout)initWithSectionProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout *v8;
  objc_super v10;
  _QWORD aBlock[5];
  uint64_t v12;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_134A8A0, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout_upNextHeaderMaxY) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout_dataSource) = 0;
  aBlock[4] = sub_18E0E8;
  v12 = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_AD5E70;
  aBlock[3] = &block_descriptor_14_0;
  v6 = _Block_copy(aBlock);
  v7 = v12;
  swift_retain(v5);
  swift_release(v7);
  v10.receiver = self;
  v10.super_class = (Class)_s19CompositionalLayoutCMa();
  v8 = -[NowPlayingQueueViewController.CompositionalLayout initWithSectionProvider:](&v10, "initWithSectionProvider:", v6);
  swift_release(v5);
  _Block_release(v6);
  return v8;
}

- (_TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  _TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout *v11;
  objc_super v13;
  _QWORD aBlock[5];
  uint64_t v15;

  v6 = _Block_copy(a3);
  v7 = swift_allocObject(&unk_134A850, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout_upNextHeaderMaxY) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout_dataSource) = 0;
  aBlock[4] = sub_18E0E8;
  v15 = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_AD5E70;
  aBlock[3] = &block_descriptor_7;
  v8 = _Block_copy(aBlock);
  v9 = v15;
  v10 = a4;
  swift_retain(v7);
  swift_release(v9);
  v13.receiver = self;
  v13.super_class = (Class)_s19CompositionalLayoutCMa();
  v11 = -[NowPlayingQueueViewController.CompositionalLayout initWithSectionProvider:configuration:](&v13, "initWithSectionProvider:configuration:", v8, v10);
  swift_release(v7);
  _Block_release(v8);

  return v11;
}

- (_TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout)initWithCoder:(id)a3
{
  id v4;
  _TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout_upNextHeaderMaxY) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout_dataSource) = 0;
  v7.receiver = self;
  v7.super_class = (Class)_s19CompositionalLayoutCMa();
  v4 = a3;
  v5 = -[NowPlayingQueueViewController.CompositionalLayout initWithCoder:](&v7, "initWithCoder:", v4);

  return v5;
}

- (_TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout *v11;

  v7 = _Block_copy(a4);
  if (v7)
  {
    v8 = swift_allocObject(&unk_134A800, 24, 7);
    *(_QWORD *)(v8 + 16) = v7;
    v7 = sub_18E08C;
  }
  else
  {
    v8 = 0;
  }
  v9 = a3;
  v10 = a5;
  v11 = (_TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout *)sub_18DF6C((uint64_t)a3, (uint64_t)v7, v8, (uint64_t)v10);

  return v11;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication29NowPlayingQueueViewController19CompositionalLayout_dataSource));
}

@end

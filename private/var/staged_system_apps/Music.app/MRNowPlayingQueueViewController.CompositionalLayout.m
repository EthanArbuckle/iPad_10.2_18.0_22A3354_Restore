@implementation MRNowPlayingQueueViewController.CompositionalLayout

- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4
{
  double y;
  double x;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _TtCC5Music31MRNowPlayingQueueViewControllerP33_8E32695F97AEF024FCAC1FE4F403941119CompositionalLayout *v12;
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
  v14 = (objc_class *)type metadata accessor for MRNowPlayingQueueViewController.CompositionalLayout();
  v17.receiver = v12;
  v17.super_class = v14;
  v15 = -[MRNowPlayingQueueViewController.CompositionalLayout layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:](&v17, "layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:", isa, x, y);

  objc_msgSend(v15, "frame");
  if (CGRectGetMinY(v18) < *(double *)((char *)&v12->super.super.super.isa
                                      + OBJC_IVAR____TtCC5Music31MRNowPlayingQueueViewControllerP33_8E32695F97AEF024FCAC1FE4F403941119CompositionalLayout_upNextHeaderMaxY))
  {
    objc_msgSend(v15, "frame");
    objc_msgSend(v15, "setFrame:");
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v15;
}

- (_TtCC5Music31MRNowPlayingQueueViewControllerP33_8E32695F97AEF024FCAC1FE4F403941119CompositionalLayout)initWithSection:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music31MRNowPlayingQueueViewControllerP33_8E32695F97AEF024FCAC1FE4F403941119CompositionalLayout_upNextHeaderMaxY) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MRNowPlayingQueueViewController.CompositionalLayout();
  return -[MRNowPlayingQueueViewController.CompositionalLayout initWithSection:](&v5, "initWithSection:", a3);
}

- (_TtCC5Music31MRNowPlayingQueueViewControllerP33_8E32695F97AEF024FCAC1FE4F403941119CompositionalLayout)initWithSection:(id)a3 configuration:(id)a4
{
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music31MRNowPlayingQueueViewControllerP33_8E32695F97AEF024FCAC1FE4F403941119CompositionalLayout_upNextHeaderMaxY) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MRNowPlayingQueueViewController.CompositionalLayout();
  return -[MRNowPlayingQueueViewController.CompositionalLayout initWithSection:configuration:](&v7, "initWithSection:configuration:", a3, a4);
}

- (_TtCC5Music31MRNowPlayingQueueViewControllerP33_8E32695F97AEF024FCAC1FE4F403941119CompositionalLayout)initWithSectionProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  _TtCC5Music31MRNowPlayingQueueViewControllerP33_8E32695F97AEF024FCAC1FE4F403941119CompositionalLayout *v7;
  objc_super v9;
  _QWORD aBlock[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1010C5A48, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music31MRNowPlayingQueueViewControllerP33_8E32695F97AEF024FCAC1FE4F403941119CompositionalLayout_upNextHeaderMaxY) = 0;
  aBlock[4] = sub_100448768;
  aBlock[5] = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1008E31AC;
  aBlock[3] = &unk_1010C5A60;
  v6 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MRNowPlayingQueueViewController.CompositionalLayout();
  v7 = -[MRNowPlayingQueueViewController.CompositionalLayout initWithSectionProvider:](&v9, "initWithSectionProvider:", v6);
  swift_release();
  _Block_release(v6);
  return v7;
}

- (_TtCC5Music31MRNowPlayingQueueViewControllerP33_8E32695F97AEF024FCAC1FE4F403941119CompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _TtCC5Music31MRNowPlayingQueueViewControllerP33_8E32695F97AEF024FCAC1FE4F403941119CompositionalLayout *v10;
  objc_super v12;
  _QWORD aBlock[6];

  v6 = _Block_copy(a3);
  v7 = swift_allocObject(&unk_1010C59F8, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music31MRNowPlayingQueueViewControllerP33_8E32695F97AEF024FCAC1FE4F403941119CompositionalLayout_upNextHeaderMaxY) = 0;
  aBlock[4] = sub_100448768;
  aBlock[5] = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1008E31AC;
  aBlock[3] = &unk_1010C5A10;
  v8 = _Block_copy(aBlock);
  v9 = a4;
  swift_retain();
  swift_release();
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for MRNowPlayingQueueViewController.CompositionalLayout();
  v10 = -[MRNowPlayingQueueViewController.CompositionalLayout initWithSectionProvider:configuration:](&v12, "initWithSectionProvider:configuration:", v8, v9);
  swift_release();

  _Block_release(v8);
  return v10;
}

- (_TtCC5Music31MRNowPlayingQueueViewControllerP33_8E32695F97AEF024FCAC1FE4F403941119CompositionalLayout)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music31MRNowPlayingQueueViewControllerP33_8E32695F97AEF024FCAC1FE4F403941119CompositionalLayout_upNextHeaderMaxY) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MRNowPlayingQueueViewController.CompositionalLayout();
  return -[MRNowPlayingQueueViewController.CompositionalLayout initWithCoder:](&v5, "initWithCoder:", a3);
}

- (_TtCC5Music31MRNowPlayingQueueViewControllerP33_8E32695F97AEF024FCAC1FE4F403941119CompositionalLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;

  v7 = _Block_copy(a4);
  if (v7)
  {
    v8 = swift_allocObject(&unk_1010C59A8, 24, 7);
    *(_QWORD *)(v8 + 16) = v7;
    v7 = sub_100444E84;
  }
  else
  {
    v8 = 0;
  }
  v9 = a3;
  return (_TtCC5Music31MRNowPlayingQueueViewControllerP33_8E32695F97AEF024FCAC1FE4F403941119CompositionalLayout *)sub_1004444C4(a3, (uint64_t)v7, v8, a5);
}

@end

@implementation PosterRackCollectionView

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC11PosterBoard24PosterRackCollectionView *v8;

  sub_1CBB3566C();
  sub_1CBB356A8();
  v6 = sub_1CBB82640();
  v7 = a4;
  v8 = self;
  sub_1CBB35224(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1CBB35380(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1CBB35380(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_);
}

- (_TtC11PosterBoard24PosterRackCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC11PosterBoard24PosterRackCollectionView_posterRackDelegate) = 0;
  swift_unknownObjectWeakInit();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PosterRackCollectionView();
  return -[PosterRackCollectionView initWithFrame:collectionViewLayout:](&v11, sel_initWithFrame_collectionViewLayout_, a4, x, y, width, height);
}

- (_TtC11PosterBoard24PosterRackCollectionView)initWithCoder:(id)a3
{
  objc_super v6;

  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC11PosterBoard24PosterRackCollectionView_posterRackDelegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PosterRackCollectionView();
  return -[PosterRackCollectionView initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1CBAEE45C((uint64_t)self + OBJC_IVAR____TtC11PosterBoard24PosterRackCollectionView_posterRackDelegate);
}

@end

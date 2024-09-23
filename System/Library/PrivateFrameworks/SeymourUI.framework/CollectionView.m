@implementation CollectionView

- (_TtC9SeymourUI14CollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v9;
  _QWORD *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI14CollectionView_contentInsetBehaviorProvider);
  *v9 = 0;
  v9[1] = 0;
  v10 = (Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI14CollectionView_onLayoutUpdate);
  *v10 = 0;
  v10[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI14CollectionView____lazy_storage___smoothDecelerationAnimation) = 0;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for CollectionView();
  return -[CollectionView initWithFrame:collectionViewLayout:](&v12, sel_initWithFrame_collectionViewLayout_, a4, x, y, width, height);
}

- (void)layoutSubviews
{
  char *v2;
  void (*v3)(char *);
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CollectionView();
  v2 = (char *)v4.receiver;
  -[CollectionView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(void (**)(char *))&v2[OBJC_IVAR____TtC9SeymourUI14CollectionView_onLayoutUpdate];
  if (v3)
  {
    swift_retain();
    v3(v2);
    sub_22B0FAA68((uint64_t)v3);
  }

}

- (BOOL)_scrollToTopIfPossible:(BOOL)a3
{
  _TtC9SeymourUI14CollectionView *v4;
  char v5;

  v4 = self;
  v5 = sub_22B70D5CC(a3);

  return v5 & 1;
}

- (_TtC9SeymourUI14CollectionView)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  objc_super v7;

  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI14CollectionView_contentInsetBehaviorProvider);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI14CollectionView_onLayoutUpdate);
  *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI14CollectionView____lazy_storage___smoothDecelerationAnimation) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CollectionView();
  return -[CollectionView initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI14CollectionView_contentInsetBehaviorProvider));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI14CollectionView_onLayoutUpdate));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14CollectionView____lazy_storage___smoothDecelerationAnimation));
}

@end

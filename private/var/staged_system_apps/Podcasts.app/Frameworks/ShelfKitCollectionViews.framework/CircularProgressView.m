@implementation CircularProgressView

- (void)tintColorDidChange
{
  _TtC23ShelfKitCollectionViews20CircularProgressView *v2;

  v2 = self;
  sub_15370C();

}

- (_TtC23ShelfKitCollectionViews20CircularProgressView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_155630();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CircularProgressView();
  v4 = a3;
  v5 = v6.receiver;
  -[CircularProgressView traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_15370C();
  sub_15339C();

}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CircularProgressView();
  v2 = v3.receiver;
  -[CircularProgressView layoutSubviews](&v3, "layoutSubviews");
  sub_15339C();

}

- (_TtC23ShelfKitCollectionViews20CircularProgressView)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews20CircularProgressView *result;

  result = (_TtC23ShelfKitCollectionViews20CircularProgressView *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.CircularProgressView", 44, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  v3 = *(void **)&self->style[OBJC_IVAR____TtC23ShelfKitCollectionViews20CircularProgressView_style + 72];
  v4 = *(void **)&self->style[OBJC_IVAR____TtC23ShelfKitCollectionViews20CircularProgressView_style + 80];

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20CircularProgressView_backgroundRing));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20CircularProgressView_ring));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20CircularProgressView_stopSign));
}

- (void)updateRotationAnimation
{
  _TtC23ShelfKitCollectionViews20CircularProgressView *v2;

  v2 = self;
  sub_15505C();

}

@end

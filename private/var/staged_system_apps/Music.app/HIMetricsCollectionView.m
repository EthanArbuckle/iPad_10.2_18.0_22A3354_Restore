@implementation HIMetricsCollectionView

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self);
  -[HIMetricsCollectionView frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _TtC5Music23HIMetricsCollectionView *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  objc_super v19;
  objc_super v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v21.receiver = self;
  v21.super_class = ObjectType;
  v9 = self;
  -[HIMetricsCollectionView frame](&v21, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v20.receiver = v9;
  v20.super_class = ObjectType;
  -[HIMetricsCollectionView setFrame:](&v20, "setFrame:", x, y, width, height);
  v22.origin.x = v11;
  v22.origin.y = v13;
  v22.size.width = v15;
  v22.size.height = v17;
  v18 = CGRectGetWidth(v22);
  v19.receiver = v9;
  v19.super_class = ObjectType;
  -[HIMetricsCollectionView frame](&v19, "frame");
  if (v18 != CGRectGetWidth(v23))
    sub_100108B5C();

}

- (void)safeAreaInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[HIMetricsCollectionView safeAreaInsetsDidChange](&v3, "safeAreaInsetsDidChange");
  sub_100108B5C();

}

- (_TtC5Music23HIMetricsCollectionView)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  _TtC5Music23HIMetricsCollectionView *result;

  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC5Music23HIMetricsCollectionView_metricsDidUpdate);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC5Music23HIMetricsCollectionView____lazy_storage___artworkMetricsProvider);
  *v5 = 0;
  v5[1] = 0;
  v6 = a3;

  result = (_TtC5Music23HIMetricsCollectionView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/HIMetricsCollectionView.swift", 35, 2, 81, 0);
  __break(1u);
  return result;
}

- (_TtC5Music23HIMetricsCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4;
  _TtC5Music23HIMetricsCollectionView *result;

  v4 = a4;
  result = (_TtC5Music23HIMetricsCollectionView *)_swift_stdlib_reportUnimplementedInitializer("Music.HIMetricsCollectionView", 29, "init(frame:collectionViewLayout:)", 33, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC5Music23HIMetricsCollectionView_metricsDidUpdate), *(_QWORD *)&self->metricsDidUpdate[OBJC_IVAR____TtC5Music23HIMetricsCollectionView_metricsDidUpdate]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC5Music23HIMetricsCollectionView____lazy_storage___artworkMetricsProvider), *(_QWORD *)&self->metricsDidUpdate[OBJC_IVAR____TtC5Music23HIMetricsCollectionView____lazy_storage___artworkMetricsProvider]);
}

@end

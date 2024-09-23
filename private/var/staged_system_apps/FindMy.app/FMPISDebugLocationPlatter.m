@implementation FMPISDebugLocationPlatter

- (_TtC6FindMy25FMPISDebugLocationPlatter)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10044398C();
}

- (void)setupSubviews
{
  _TtC6FindMy25FMPISDebugLocationPlatter *v2;

  v2 = self;
  sub_100442B38();

}

- (void)willMoveToSuperview:(id)a3
{
  id v4;
  _TtC6FindMy25FMPISDebugLocationPlatter *v5;

  v4 = a3;
  v5 = self;
  sub_10044316C();

}

- (void)fidelitySegmentChanged
{
  _TtC6FindMy25FMPISDebugLocationPlatter *v2;

  v2 = self;
  sub_100442E0C();

}

- (void)handleAction
{
  _TtC6FindMy25FMPISDebugLocationPlatter *v2;

  v2 = self;
  sub_100443094();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMPISDebugLocationPlatter_locationProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMPISDebugLocationPlatter_fidelitySegment));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy25FMPISDebugLocationPlatter_shownInferences));
}

@end

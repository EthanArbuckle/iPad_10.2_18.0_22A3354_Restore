@implementation FMItemMarkAsLostView

- (_TtC6FindMy20FMItemMarkAsLostView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10043F17C();
}

- (void)handleAction
{
  _TtC6FindMy20FMItemMarkAsLostView *v2;

  v2 = self;
  sub_10043EF40();

}

- (void)handleStatusRowTap
{
  uint64_t Strong;
  uint64_t v4;
  _TtC6FindMy20FMItemMarkAsLostView *v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy20FMItemMarkAsLostView_delegate);
  if (Strong)
  {
    v4 = Strong;
    v5 = self;
    sub_10031A458();

    swift_unknownObjectRelease(v4);
  }
}

- (void).cxx_destruct
{
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy20FMItemMarkAsLostView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMItemMarkAsLostView_lostStatusRow));
}

@end

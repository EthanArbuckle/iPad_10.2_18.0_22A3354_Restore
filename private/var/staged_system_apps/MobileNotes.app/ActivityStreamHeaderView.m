@implementation ActivityStreamHeaderView

- (int64_t)_accessibilitySortPriority
{
  return 1000;
}

- (_TtC11MobileNotes24ActivityStreamHeaderView)initWithCoder:(id)a3
{
  sub_10012D740(a3);
}

- (void)updateUI
{
  _TtC11MobileNotes24ActivityStreamHeaderView *v2;

  v2 = self;
  sub_10012D270();

}

- (_TtC11MobileNotes24ActivityStreamHeaderView)initWithFrame:(CGRect)a3
{
  _TtC11MobileNotes24ActivityStreamHeaderView *result;

  result = (_TtC11MobileNotes24ActivityStreamHeaderView *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.ActivityStreamHeaderView", 36, "init(frame:)", 12, 0, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MobileNotes24ActivityStreamHeaderView_coordinator), a2);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24ActivityStreamHeaderView____lazy_storage___label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24ActivityStreamHeaderView____lazy_storage___closeButton));
}

@end

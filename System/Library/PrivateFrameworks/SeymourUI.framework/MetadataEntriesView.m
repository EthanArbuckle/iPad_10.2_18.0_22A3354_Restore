@implementation MetadataEntriesView

- (UIView)viewForFirstBaselineLayout
{
  _TtC9SeymourUI19MetadataEntriesView *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_22BA41020();
  v4 = v3;

  return (UIView *)v4;
}

- (UIView)viewForLastBaselineLayout
{
  _TtC9SeymourUI19MetadataEntriesView *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_22BA41180();

  return (UIView *)v3;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (_TtC9SeymourUI19MetadataEntriesView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI19MetadataEntriesView *)sub_22BA412D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI19MetadataEntriesView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22BA419D0();
}

- (void).cxx_destruct
{
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI19MetadataEntriesView_actionHandler));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end

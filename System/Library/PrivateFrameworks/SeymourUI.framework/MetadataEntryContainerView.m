@implementation MetadataEntryContainerView

- (UIView)viewForFirstBaselineLayout
{
  char *v3;
  UIView *v5;
  objc_super v6;

  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI26MetadataEntryContainerView_views;
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)v3 + 16))
    return (UIView *)*(id *)(*(_QWORD *)v3 + 32);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MetadataEntryContainerView();
  v5 = -[MetadataEntryContainerView viewForFirstBaselineLayout](&v6, sel_viewForFirstBaselineLayout);
  return v5;
}

- (UIView)viewForLastBaselineLayout
{
  _TtC9SeymourUI26MetadataEntryContainerView *v2;
  id v3;

  v2 = self;
  v3 = sub_22B649238();

  return (UIView *)v3;
}

- (_TtC9SeymourUI26MetadataEntryContainerView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC9SeymourUI26MetadataEntryContainerView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI26MetadataEntryContainerView_layout) = (Class)0x4024000000000000;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI26MetadataEntryContainerView_views) = (Class)MEMORY[0x24BEE4AF8];
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI26MetadataEntryContainerView_onAction);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC9SeymourUI26MetadataEntryContainerView *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI26MetadataEntryContainerView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI26MetadataEntryContainerView *result;

  result = (_TtC9SeymourUI26MetadataEntryContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI26MetadataEntryContainerView_onAction));
}

@end

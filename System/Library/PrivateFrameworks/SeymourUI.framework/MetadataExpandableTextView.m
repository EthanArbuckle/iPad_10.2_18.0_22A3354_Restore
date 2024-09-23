@implementation MetadataExpandableTextView

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC9SeymourUI26MetadataExpandableTextView_expandableTextView));
}

- (_TtC9SeymourUI26MetadataExpandableTextView)init
{
  return (_TtC9SeymourUI26MetadataExpandableTextView *)sub_22BA2A188();
}

- (_TtC9SeymourUI26MetadataExpandableTextView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC9SeymourUI26MetadataExpandableTextView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI26MetadataExpandableTextView_onEntryTapped);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC9SeymourUI26MetadataExpandableTextView *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI26MetadataExpandableTextView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI26MetadataExpandableTextView *result;

  result = (_TtC9SeymourUI26MetadataExpandableTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26MetadataExpandableTextView_expandableTextView));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI26MetadataExpandableTextView_onEntryTapped));
}

@end

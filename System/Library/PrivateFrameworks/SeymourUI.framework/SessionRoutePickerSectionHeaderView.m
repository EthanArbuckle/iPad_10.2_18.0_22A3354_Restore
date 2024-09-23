@implementation SessionRoutePickerSectionHeaderView

- (_TtC9SeymourUI35SessionRoutePickerSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI35SessionRoutePickerSectionHeaderView *)sub_22B2F33F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI35SessionRoutePickerSectionHeaderView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC9SeymourUI35SessionRoutePickerSectionHeaderView *result;

  v5 = OBJC_IVAR____TtC9SeymourUI35SessionRoutePickerSectionHeaderView_titleLabel;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC9SeymourUI35SessionRoutePickerSectionHeaderView_separatorView;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC9SeymourUI35SessionRoutePickerSectionHeaderView *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35SessionRoutePickerSectionHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35SessionRoutePickerSectionHeaderView_separatorView));
}

@end

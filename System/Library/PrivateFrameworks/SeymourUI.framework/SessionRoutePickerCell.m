@implementation SessionRoutePickerCell

- (_TtC9SeymourUI22SessionRoutePickerCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI22SessionRoutePickerCell *)sub_22BA3F944(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI22SessionRoutePickerCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22BA408A4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22SessionRoutePickerCell_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22SessionRoutePickerCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22SessionRoutePickerCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22SessionRoutePickerCell_checkmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22SessionRoutePickerCell_selectionAnimationView));
}

@end

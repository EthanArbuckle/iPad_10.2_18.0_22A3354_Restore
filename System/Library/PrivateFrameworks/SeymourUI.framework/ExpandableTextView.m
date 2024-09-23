@implementation ExpandableTextView

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC9SeymourUI18ExpandableTextView_textLabel));
}

- (_TtC9SeymourUI18ExpandableTextView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI18ExpandableTextView *)sub_22B4886AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI18ExpandableTextView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B48A35C();
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;
  CGRect v4;
  CGRect v5;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ExpandableTextView();
  v2 = v3.receiver;
  -[ExpandableTextView layoutSubviews](&v3, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v3.receiver, v3.super_class);
  v5.origin.x = 0.0;
  v5.origin.y = 0.0;
  v5.size.width = 0.0;
  v5.size.height = 0.0;
  if (!CGRectEqualToRect(v4, v5))
    sub_22B4891F8(*((_BYTE *)v2 + OBJC_IVAR____TtC9SeymourUI18ExpandableTextView_state));

}

- (void)didTapLink:(id)a3
{
  id v4;
  _TtC9SeymourUI18ExpandableTextView *v5;

  v4 = a3;
  v5 = self;
  sub_22B48A750((uint64_t)v4);

}

- (void)handleTapGesture:(id)a3
{
  void (*v3)(uint64_t);
  id v5;
  uint64_t v6;
  _TtC9SeymourUI18ExpandableTextView *v7;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC9SeymourUI18ExpandableTextView_onMoreTapped);
  if (v3)
  {
    v5 = a3;
    v7 = self;
    v6 = sub_22B0FAA58((uint64_t)v3);
    v3(v6);
    sub_22B0FAA68((uint64_t)v3);

  }
}

- (void).cxx_destruct
{
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI18ExpandableTextView_onMoreTapped));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18ExpandableTextView_linksBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18ExpandableTextView_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18ExpandableTextView_textLabelBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18ExpandableTextView_moreTextLabel));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18ExpandableTextView_tapTargetView));
}

@end

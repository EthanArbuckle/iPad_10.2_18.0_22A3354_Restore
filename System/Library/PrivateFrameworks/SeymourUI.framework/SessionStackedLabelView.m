@implementation SessionStackedLabelView

- (UILabel)primaryLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI23SessionStackedLabelView_primaryLabel));
}

- (UILabel)secondaryLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI23SessionStackedLabelView_secondaryLabel));
}

- (_TtC9SeymourUI23SessionStackedLabelView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI23SessionStackedLabelView *)sub_22B6A7D10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI23SessionStackedLabelView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B6A8490();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  _TtC9SeymourUI23SessionStackedLabelView *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI23SessionStackedLabelView_primaryLabel);
  v4 = self;
  objc_msgSend(v3, sel_intrinsicContentSize);
  v6 = v5;
  v7 = *(Class *)((char *)&v4->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI23SessionStackedLabelView_secondaryLabel);
  objc_msgSend(v7, sel_intrinsicContentSize);
  if (v6 <= v8)
    v6 = v8;
  objc_msgSend(v3, sel_intrinsicContentSize);
  v10 = v9;
  objc_msgSend(v7, sel_intrinsicContentSize);
  v12 = v11;

  v13 = v10 + v12;
  v14 = v6;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23SessionStackedLabelView_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23SessionStackedLabelView_secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23SessionStackedLabelView_stackView));
}

- (NSString)noDataIndicator
{
  uint64_t ObjCClassFromMetadata;
  void *v4;
  _TtC9SeymourUI23SessionStackedLabelView *v5;
  id v6;
  void *v7;

  type metadata accessor for SeymourLocalizationBundle();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_22BA795C0();

  v7 = (void *)sub_22BA8064C();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

@end

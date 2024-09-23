@implementation SessionPlatterMetricContainer

- (_TtC9SeymourUI29SessionPlatterMetricContainer)initWithCoder:(id)a3
{
  _TtC9SeymourUI29SessionPlatterMetricContainer *result;

  result = (_TtC9SeymourUI29SessionPlatterMetricContainer *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SessionPlatterMetricContainer();
  v2 = (char *)v6.receiver;
  -[SessionPlatterMetricContainer layoutSubviews](&v6, sel_layoutSubviews);
  sub_22B763BC8();
  v3 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI29SessionPlatterMetricContainer_contentView];
  v4 = objc_msgSend(v3, sel_layer, v6.receiver, v6.super_class);
  objc_msgSend(v4, sel_setAnchorPoint_, 0.0, 0.0);

  v5 = objc_msgSend(v3, sel_layer);
  objc_msgSend(v5, sel_setPosition_, 0.0, 0.0);

}

- (_TtC9SeymourUI29SessionPlatterMetricContainer)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI29SessionPlatterMetricContainer *result;

  result = (_TtC9SeymourUI29SessionPlatterMetricContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29SessionPlatterMetricContainer_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29SessionPlatterMetricContainer_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29SessionPlatterMetricContainer_platter));
}

@end

@implementation DOCInfoActionsView

- (double)spacing
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCInfoActionsView();
  -[DOCInfoActionsView spacing](&v3, "spacing");
  return result;
}

- (void)setSpacing:(double)a3
{
  objc_class *v5;
  _TtC5Files18DOCInfoActionsView *v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  objc_super v11;

  v5 = (objc_class *)type metadata accessor for DOCInfoActionsView();
  v11.receiver = self;
  v11.super_class = v5;
  v6 = self;
  -[DOCInfoActionsView spacing](&v11, "spacing");
  v8 = v7;
  v10.receiver = v6;
  v10.super_class = v5;
  -[DOCInfoActionsView setSpacing:](&v10, "setSpacing:", a3);
  -[DOCInfoActionsView spacing](v6, "spacing");
  if (v9 != v8)
    sub_10029A0E4();

}

- (NSArray)nodes
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Files18DOCInfoActionsView_nodes);
  swift_bridgeObjectRetain(v2);
  sub_10006922C((uint64_t *)&unk_1006424B0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void)setNodes:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _TtC5Files18DOCInfoActionsView *v7;

  v5 = sub_10006922C((uint64_t *)&unk_1006424B0);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  sub_10029A2E4(v6);

}

- (void)layoutSubviews
{
  _TtC5Files18DOCInfoActionsView *v2;

  v2 = self;
  sub_10029A35C();

}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_10029A484(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  sub_10029A4D4(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (SEL *)&selRef_bounds, (SEL *)&selRef_setBounds_);
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_10029A484(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  sub_10029A4D4(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (SEL *)&selRef_frame, (SEL *)&selRef_setFrame_);
}

- (_TtC5Files18DOCInfoActionsView)initWithFrame:(CGRect)a3
{
  _TtC5Files18DOCInfoActionsView *result;

  result = (_TtC5Files18DOCInfoActionsView *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCInfoActionsView", 24, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files18DOCInfoActionsView_actionManager);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files18DOCInfoActionsView_configuration));
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files18DOCInfoActionsView_actionDelegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files18DOCInfoActionsView_nodes));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files18DOCInfoActionsView_loadedActions));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files18DOCInfoActionsView_actionsLayout));
}

@end

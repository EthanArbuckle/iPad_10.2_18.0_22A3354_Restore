@implementation TintableShapeLayer

- (CGColor)borderColor
{
  return (CGColor *)sub_22B16F708(self, (uint64_t)a2, (SEL *)&selRef_borderColor);
}

- (void)setBorderColor:(CGColor *)a3
{
  sub_22B16F768(self, (uint64_t)a2, a3, (const char **)&selRef_setBorderColor_, (SEL *)&selRef_borderColor, &OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_undimmedBorderColor);
}

- (CGColor)strokeColor
{
  return (CGColor *)sub_22B16F708(self, (uint64_t)a2, (SEL *)&selRef_strokeColor);
}

- (void)setStrokeColor:(CGColor *)a3
{
  sub_22B16F768(self, (uint64_t)a2, a3, (const char **)&selRef_setStrokeColor_, (SEL *)&selRef_strokeColor, &OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_undimmedStrokeColor);
}

- (_TtC9SeymourUI18TintableShapeLayer)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_tintAdjustmentMode) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_undimmedBorderColor) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_undimmedStrokeColor) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TintableShapeLayer();
  return -[TintableShapeLayer init](&v3, sel_init);
}

- (_TtC9SeymourUI18TintableShapeLayer)initWithLayer:(id)a3
{
  uint64_t v4;
  _TtC9SeymourUI18TintableShapeLayer *v5;
  objc_super v7;
  _QWORD v8[4];

  swift_unknownObjectRetain();
  sub_22BA812E8();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_tintAdjustmentMode) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_undimmedBorderColor) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_undimmedStrokeColor) = 0;
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  v4 = sub_22BA81720();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TintableShapeLayer();
  v5 = -[TintableShapeLayer initWithLayer:](&v7, sel_initWithLayer_, v4);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

- (_TtC9SeymourUI18TintableShapeLayer)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_tintAdjustmentMode) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_undimmedBorderColor) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_undimmedStrokeColor) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TintableShapeLayer();
  return -[TintableShapeLayer initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_undimmedBorderColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_undimmedStrokeColor));
}

@end

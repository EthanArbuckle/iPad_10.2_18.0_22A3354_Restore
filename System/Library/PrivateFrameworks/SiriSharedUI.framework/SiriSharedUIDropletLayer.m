@implementation SiriSharedUIDropletLayer

- (_TtC12SiriSharedUI24SiriSharedUIDropletLayer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SiriSharedUIDropletLayer();
  return -[SiriSharedUIDropletLayer init](&v3, sel_init);
}

- (_TtC12SiriSharedUI24SiriSharedUIDropletLayer)initWithLayer:(id)a3
{
  uint64_t v4;
  _TtC12SiriSharedUI24SiriSharedUIDropletLayer *v5;
  objc_super v7;
  _QWORD v8[4];

  swift_unknownObjectRetain();
  sub_1DE130B30();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  v4 = sub_1DE130C80();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SiriSharedUIDropletLayer();
  v5 = -[SiriSharedUIDropletLayer initWithLayer:](&v7, sel_initWithLayer_, v4);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

- (_TtC12SiriSharedUI24SiriSharedUIDropletLayer)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SiriSharedUIDropletLayer();
  return -[SiriSharedUIDropletLayer initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end

@implementation ColorLayer

- (_TtC9SiriSetup10ColorLayer)init
{
  uint64_t v3;
  _TtC9SiriSetup10ColorLayer *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v3 = OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerRedColor;
  v4 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = CGColorCreateGenericRGB(0.96875, 0.25390625, 0.36328125, 1.0);
  v5 = OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerBlueColor;
  *(Class *)((char *)&v4->super.super.super.isa + v5) = CGColorCreateGenericRGB(0.15625, 0.52734375, 0.9921875, 1.0);
  v6 = OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerBackgroundColor;
  *(Class *)((char *)&v4->super.super.super.isa + v6) = CGColorCreateGenericRGB(1.0, 1.0, 1.0, 1.0);

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for ColorLayer();
  return -[ColorLayer init](&v8, sel_init);
}

- (_TtC9SiriSetup10ColorLayer)initWithLayer:(id)a3
{
  uint64_t v4;
  _TtC9SiriSetup10ColorLayer *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC9SiriSetup10ColorLayer *v9;
  objc_super v11;
  _QWORD v12[4];

  swift_unknownObjectRetain();
  sub_2277678A0();
  swift_unknownObjectRelease();
  v4 = OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerRedColor;
  v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v4) = CGColorCreateGenericRGB(0.96875, 0.25390625, 0.36328125, 1.0);
  v6 = OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerBlueColor;
  *(Class *)((char *)&v5->super.super.super.isa + v6) = CGColorCreateGenericRGB(0.15625, 0.52734375, 0.9921875, 1.0);
  v7 = OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerBackgroundColor;
  *(Class *)((char *)&v5->super.super.super.isa + v7) = CGColorCreateGenericRGB(1.0, 1.0, 1.0, 1.0);

  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  v8 = sub_227767984();
  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for ColorLayer();
  v9 = -[ColorLayer initWithLayer:](&v11, sel_initWithLayer_, v8);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v9;
}

- (_TtC9SiriSetup10ColorLayer)initWithCoder:(id)a3
{
  return (_TtC9SiriSetup10ColorLayer *)sub_2277659E4(a3);
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  unsigned __int8 v7;
  void *ObjCClassFromMetadata;
  void *v9;
  objc_super v11;

  v3 = sub_227767750();
  v5 = v4;
  swift_getObjCClassMetadata();
  if (qword_2558F7DD8 != -1)
    swift_once();
  v6 = v3 == qword_2558F8E70 && v5 == *(_QWORD *)algn_2558F8E78;
  if (v6 || (sub_227767990() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    v9 = (void *)sub_227767744();
    v11.receiver = ObjCClassFromMetadata;
    v11.super_class = (Class)&OBJC_METACLASS____TtC9SiriSetup10ColorLayer;
    v7 = objc_msgSendSuper2(&v11, sel_needsDisplayForKey_, v9);
    swift_bridgeObjectRelease();

  }
  return v7;
}

- (void)display
{
  _TtC9SiriSetup10ColorLayer *v2;

  v2 = self;
  sub_227765BE4();

}

- (id)actionForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC9SiriSetup10ColorLayer *v7;
  id v8;

  v4 = sub_227767750();
  v6 = v5;
  v7 = self;
  v8 = sub_227766164(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void).cxx_destruct
{

}

@end

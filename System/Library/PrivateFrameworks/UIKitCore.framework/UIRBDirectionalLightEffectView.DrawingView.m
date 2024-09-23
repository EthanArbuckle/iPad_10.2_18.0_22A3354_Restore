@implementation UIRBDirectionalLightEffectView.DrawingView

+ (Class)layerClass
{
  sub_1857A5018();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)RBLayer:(id)a3 draw:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v8;
  id v9;
  id v10;
  _TtCC5UIKit30UIRBDirectionalLightEffectViewP33_5F98E6BE5B93275EE5D20586FF75585B11DrawingView *v11;

  v4 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtCC5UIKit30UIRBDirectionalLightEffectViewP33_5F98E6BE5B93275EE5D20586FF75585B11DrawingView_effects);
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    v8 = (_QWORD *)(v4 + 32);
    v9 = a3;
    v10 = a4;
    v11 = self;
    swift_bridgeObjectRetain();
    do
    {
      sub_1857A4480(v8, (uint64_t)v11, (uint64_t)v9, v10);
      v8 += 5;
      --v5;
    }
    while (v5);

    swift_bridgeObjectRelease();
  }
}

- (_TtCC5UIKit30UIRBDirectionalLightEffectViewP33_5F98E6BE5B93275EE5D20586FF75585B11DrawingView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5UIKit30UIRBDirectionalLightEffectViewP33_5F98E6BE5B93275EE5D20586FF75585B11DrawingView_timeOffset) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5UIKit30UIRBDirectionalLightEffectViewP33_5F98E6BE5B93275EE5D20586FF75585B11DrawingView_effects) = (Class)MEMORY[0x1E0DEE9D8];
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[UIView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC5UIKit30UIRBDirectionalLightEffectViewP33_5F98E6BE5B93275EE5D20586FF75585B11DrawingView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5UIKit30UIRBDirectionalLightEffectViewP33_5F98E6BE5B93275EE5D20586FF75585B11DrawingView_timeOffset) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5UIKit30UIRBDirectionalLightEffectViewP33_5F98E6BE5B93275EE5D20586FF75585B11DrawingView_effects) = (Class)MEMORY[0x1E0DEE9D8];
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[UIView initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end

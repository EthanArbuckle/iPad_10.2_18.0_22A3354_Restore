@implementation CustomGrid

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0DC55F0];
  v3 = *MEMORY[0x1E0DC55F0];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB10CustomGrid)initWithArrangedSubviewRows:(id)a3
{
  objc_class *ObjectType;
  _TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB10CustomGrid *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4E55A0);
    sub_1B4906DAC();
    a3 = (id)sub_1B4906DA0();
    swift_bridgeObjectRelease();
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = -[NUIContainerGridView initWithArrangedSubviewRows:](&v8, sel_initWithArrangedSubviewRows_, a3);

  return v6;
}

- (id)initWithFrame:(double)a3
{
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v10, sel_initWithFrame_, a2, a3, a4, a5);
}

- (id)initWithCoder:(uint64_t)a3
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v5, sel_initWithCoder_, a3);
}

@end

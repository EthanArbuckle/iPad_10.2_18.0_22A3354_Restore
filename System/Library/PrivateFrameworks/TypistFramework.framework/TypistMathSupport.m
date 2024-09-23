@implementation TypistMathSupport

- (id)getBoundingBoxWithLatex:(id)a3 error:(id *)a4
{
  _QWORD *v5;
  TypistMathSupport *v6;
  void *v7;

  v5 = (_QWORD *)sub_2494ADFC8();
  v6 = self;
  sub_2494AD5E0(v5);
  swift_bridgeObjectRelease();

  __swift_instantiateConcreteTypeFromMangledName(&qword_257866B08);
  v7 = (void *)sub_2494AE004();
  swift_bridgeObjectRelease();
  return v7;
}

- (TypistMathSupport)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TypistMathSupport;
  return -[TypistMathSupport init](&v3, sel_init);
}

@end

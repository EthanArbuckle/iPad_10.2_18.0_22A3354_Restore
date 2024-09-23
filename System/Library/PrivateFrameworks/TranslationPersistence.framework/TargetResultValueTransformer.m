@implementation TargetResultValueTransformer

+ (Class)transformedValueClass
{
  sub_2493B19C0();
  return (Class)swift_getObjCClassFromMetadata();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  return sub_2493B1378(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr, _OWORD *))sub_2493BB954);
}

- (id)reverseTransformedValue:(id)a3
{
  return sub_2493B1378(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr, _OWORD *))sub_2493BBCBC);
}

- (_TtC22TranslationPersistence28TargetResultValueTransformer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TargetResultValueTransformer();
  return -[TargetResultValueTransformer init](&v3, sel_init);
}

@end

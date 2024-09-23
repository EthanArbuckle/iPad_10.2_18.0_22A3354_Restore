@implementation RawDictionaryTransformer

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

+ (Class)transformedValueClass
{
  sub_248A3F6A4();
  return (Class)swift_getObjCClassFromMetadata();
}

- (id)transformedValue:(id)a3
{
  return sub_248A3FB9C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr, _OWORD *))sub_248A3F6E0);
}

- (id)reverseTransformedValue:(id)a3
{
  return sub_248A3FB9C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr, _OWORD *))sub_248A3F974);
}

- (_TtC10TipKitCore24RawDictionaryTransformer)init
{
  return (_TtC10TipKitCore24RawDictionaryTransformer *)sub_2489BD1CC();
}

@end

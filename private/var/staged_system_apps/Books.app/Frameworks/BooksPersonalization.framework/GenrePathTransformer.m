@implementation GenrePathTransformer

+ (Class)transformedValueClass
{
  uint64_t v2;

  v2 = sub_A1CD0(0, &qword_1F30F0, NSArray_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (id)transformedValue:(id)a3
{
  return sub_90B74(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr, _OWORD *))sub_90560);
}

- (id)reverseTransformedValue:(id)a3
{
  return sub_90B74(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr, _OWORD *))sub_90760);
}

- (_TtC20BooksPersonalization20GenrePathTransformer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GenrePathTransformer();
  return -[GenrePathTransformer init](&v3, "init");
}

@end

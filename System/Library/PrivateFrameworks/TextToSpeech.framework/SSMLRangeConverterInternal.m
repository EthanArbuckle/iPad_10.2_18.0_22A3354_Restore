@implementation SSMLRangeConverterInternal

- (NSString)ssml
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A3AB4958();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setSsml:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_1A3AB497C();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___SSMLRangeConverterInternal_ssml);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSString)plainString
{
  SSMLRangeConverterInternal *v2;
  void *v3;

  v2 = self;
  sub_1A3A34FC8();

  v3 = (void *)sub_1A3AB4958();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setPlainString:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;

  v4 = sub_1A3AB497C();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___SSMLRangeConverterInternal____lazy_storage___plainString);
  *v5 = v4;
  v5[1] = v6;
  swift_bridgeObjectRelease();
}

- (SSMLRangeConverterInternal)initWithSSML:(id)a3
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  objc_super v9;

  v4 = sub_1A3AB497C();
  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SSMLRangeConverterInternal____lazy_storage___plainString);
  *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SSMLRangeConverterInternal____lazy_storage___converter) = 0;
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___SSMLRangeConverterInternal_ssml);
  *v6 = v4;
  v6[1] = v7;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SSMLRangeConverter();
  return -[SSMLRangeConverterInternal init](&v9, sel_init);
}

- (_NSRange)stringRangeFrom:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  SSMLRangeConverterInternal *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v5 = self;
  v6 = sub_1A3A35374(location, length);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (SSMLRangeConverterInternal)init
{
  SSMLRangeConverterInternal *result;

  result = (SSMLRangeConverterInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end

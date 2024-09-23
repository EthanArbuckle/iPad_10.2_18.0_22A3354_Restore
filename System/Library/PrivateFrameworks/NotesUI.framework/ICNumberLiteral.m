@implementation ICNumberLiteral

- (_NSRange)range
{
  NSUInteger *v2;
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v2 = (NSUInteger *)((char *)self + OBJC_IVAR___ICNumberLiteral_range);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  result.length = v4;
  result.location = v3;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger *v5;

  length = a3.length;
  location = a3.location;
  v5 = (NSUInteger *)((char *)self + OBJC_IVAR___ICNumberLiteral_range);
  swift_beginAccess();
  *v5 = location;
  v5[1] = length;
}

- (NSString)string
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1ACA42090();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setString:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_1ACA420C0();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___ICNumberLiteral_string);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (ICNumberLiteral)initWithRange:(_NSRange)a3 string:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  NSUInteger *v8;
  uint64_t *v9;
  uint64_t v10;
  objc_super v12;

  length = a3.length;
  location = a3.location;
  v7 = sub_1ACA420C0();
  v8 = (NSUInteger *)((char *)self + OBJC_IVAR___ICNumberLiteral_range);
  *v8 = location;
  v8[1] = length;
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___ICNumberLiteral_string);
  *v9 = v7;
  v9[1] = v10;
  v12.receiver = self;
  v12.super_class = (Class)ICNumberLiteral;
  return -[ICNumberLiteral init](&v12, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  ICNumberLiteral *v4;
  ICNumberLiteral *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1ACA4299C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = ICNumberLiteral.isEqual(_:)((uint64_t)v8);

  sub_1AC7C2C6C((uint64_t)v8);
  return v6 & 1;
}

- (ICNumberLiteral)init
{
  ICNumberLiteral *result;

  result = (ICNumberLiteral *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end

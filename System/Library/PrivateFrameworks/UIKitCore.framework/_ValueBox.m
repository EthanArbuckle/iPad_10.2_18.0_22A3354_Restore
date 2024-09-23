@implementation _ValueBox

- (_TtC5UIKitP33_255CA08DD239FA8856FF3210D2BF9D939_ValueBox)initWithBSXPCCoder:(id)a3
{
  swift_unknownObjectRetain();
  return (_TtC5UIKitP33_255CA08DD239FA8856FF3210D2BF9D939_ValueBox *)sub_1856FE048(a3);
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  _TtC5UIKitP33_255CA08DD239FA8856FF3210D2BF9D939_ValueBox *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1856FD218(a3);
  swift_unknownObjectRelease();

}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (int64_t)hash
{
  _TtC5UIKitP33_255CA08DD239FA8856FF3210D2BF9D939_ValueBox *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1856FE2D8();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC5UIKitP33_255CA08DD239FA8856FF3210D2BF9D939_ValueBox *v4;
  _TtC5UIKitP33_255CA08DD239FA8856FF3210D2BF9D939_ValueBox *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_186507B1C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1856FE5DC((uint64_t)v8);

  sub_18519F088((uint64_t)v8, &qword_1ECD75B20);
  return v6;
}

- (_TtC5UIKitP33_255CA08DD239FA8856FF3210D2BF9D939_ValueBox)init
{
  _TtC5UIKitP33_255CA08DD239FA8856FF3210D2BF9D939_ValueBox *result;

  result = (_TtC5UIKitP33_255CA08DD239FA8856FF3210D2BF9D939_ValueBox *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1856FEBB0((uint64_t)self + OBJC_IVAR____TtC5UIKitP33_255CA08DD239FA8856FF3210D2BF9D939_ValueBox_contents);
}

@end

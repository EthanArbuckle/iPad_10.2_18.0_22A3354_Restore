@implementation UITextEffectRangeChunk

- (int64_t)hash
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC5UIKit22UITextEffectRangeChunk_initialRange), sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  _TtC5UIKit22UITextEffectRangeChunk *v4;
  _TtC5UIKit22UITextEffectRangeChunk *v5;
  unsigned __int8 v6;
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
  v6 = sub_18576324C((uint64_t)v8);

  sub_18519F088((uint64_t)v8, &qword_1ECD75B20);
  return v6 & 1;
}

- (_TtC5UIKit22UITextEffectRangeChunk)init
{
  _TtC5UIKit22UITextEffectRangeChunk *result;

  result = (_TtC5UIKit22UITextEffectRangeChunk *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end

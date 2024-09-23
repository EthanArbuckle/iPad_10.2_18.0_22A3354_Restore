@implementation DeprecatedText.Drawing.Cache.Key

- (int64_t)hash
{
  Swift::Int v3;

  swift_retain(self);
  v3 = sub_10398();
  swift_release(self);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  if (a3)
  {
    v5 = _s5CacheC3KeyCMa();
    swift_retain(self);
    v6 = swift_unknownObjectRetain(a3);
    v7 = swift_dynamicCastClass(v6, v5);
    if (v7)
      v8 = sub_1071C((uint64_t)self, v7);
    else
      v8 = 0;
    swift_unknownObjectRelease(a3);
    swift_release(self);
  }
  else
  {
    v8 = 0;
  }
  return v8 & 1;
}

@end

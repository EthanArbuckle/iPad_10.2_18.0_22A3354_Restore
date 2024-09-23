@implementation DeprecatedText.Drawing.Cache.AttributesWrapper

- (int64_t)hash
{
  __int128 v3;
  __int128 v4;
  Swift::Int v5;
  _QWORD v7[9];
  _OWORD v8[4];

  Hasher.init(_seed:)(v7, 0);
  v3 = *(_OWORD *)&self->attributes[16];
  v8[0] = *(_OWORD *)self->attributes;
  v8[1] = v3;
  v4 = *(_OWORD *)&self->attributes[48];
  v8[2] = *(_OWORD *)&self->attributes[32];
  v8[3] = v4;
  swift_retain(self);
  sub_10620((uint64_t)v8);
  sub_7487C((uint64_t)v7);
  sub_1065C((uint64_t)v8);
  v5 = Hasher._finalize()();
  swift_release(self);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char v5;

  swift_unknownObjectRetain(a3);
  swift_retain(self);
  v5 = sub_FD60((uint64_t)a3);
  swift_unknownObjectRelease(a3);
  swift_release(self);
  return v5 & 1;
}

@end

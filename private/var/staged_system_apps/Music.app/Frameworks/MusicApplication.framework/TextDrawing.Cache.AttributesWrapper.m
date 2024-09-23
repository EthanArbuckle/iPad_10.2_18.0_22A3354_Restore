@implementation TextDrawing.Cache.AttributesWrapper

- (int64_t)hash
{
  __int128 v3;
  Swift::Int v4;
  _QWORD v6[9];
  _OWORD v7[3];
  uint64_t v8;

  Hasher.init(_seed:)(v6);
  v3 = *(_OWORD *)&self->attributes[16];
  v7[0] = *(_OWORD *)self->attributes;
  v7[1] = v3;
  v7[2] = *(_OWORD *)&self->attributes[32];
  v8 = *(_QWORD *)&self->attributes[48];
  swift_retain(self);
  sub_279A78((uint64_t)v7);
  TextAttributes.hash(into:)((uint64_t)v6);
  sub_279AB4((uint64_t)v7);
  v4 = Hasher._finalize()();
  swift_release(self);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v5;

  swift_unknownObjectRetain(a3);
  swift_retain(self);
  v5 = sub_277BD8((uint64_t)a3);
  swift_unknownObjectRelease(a3);
  swift_release(self);
  return v5;
}

@end

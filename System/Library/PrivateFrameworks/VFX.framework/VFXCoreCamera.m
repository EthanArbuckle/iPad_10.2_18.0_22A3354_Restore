@implementation VFXCoreCamera

- (BOOL)isEqual:(id)a3
{
  _TtC3VFX13VFXCoreCamera *v4;
  _TtC3VFX13VFXCoreCamera *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B22292EC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1B2167B70((uint64_t)v8);

  sub_1B1A0DD70((uint64_t)v8);
  return v6;
}

- (NSString)name
{
  uint64_t v3;
  _TtC3VFX13VFXCoreCamera *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC3VFX13VFXCoreCamera_instance];
  swift_retain();
  v4 = self;
  sub_1B1DAFC84(v3, v4);
  v6 = v5;

  swift_release();
  if (v6)
  {
    v7 = (void *)sub_1B2228728();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (BOOL)isOrthographic
{
  return sub_1B216A8EC((char *)self, (uint64_t)a2, (uint64_t (*)(uint64_t, char *))sub_1B1DAF104);
}

- (void)setIsOrthographic:(BOOL)a3
{
  uint64_t v5;
  _TtC3VFX13VFXCoreCamera *v6;

  v5 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC3VFX13VFXCoreCamera_instance];
  swift_retain();
  v6 = self;
  sub_1B1DA406C(v5, a3, v6);

  swift_release();
}

- (double)worldTransform
{
  double result;

  *(_QWORD *)&result = sub_1B2169C84(a1, a2, (double (*)(uint64_t, char *))sub_1B1DB1340).n128_u64[0];
  return result;
}

- (void)setWorldTransform:(simd_float4)a3
{
  id v5;
  simd_float4x4 v6;

  v6.columns[3] = a5;
  v6.columns[1] = a3;
  v6.columns[2] = a4;
  v6.columns[0] = a2;
  v5 = a1;
  sub_1B2168560(v6);

}

- (double)lastFrameWorldTransform
{
  double result;

  *(_QWORD *)&result = sub_1B2169C84(a1, a2, (double (*)(uint64_t, char *))sub_1B1DB136C).n128_u64[0];
  return result;
}

- (uint64_t)setLastFrameWorldTransform:(uint64_t)result
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (*(_DWORD *)(result + OBJC_IVAR____TtC3VFX13VFXCoreCamera_instance) != -1
    || *(_DWORD *)(result + OBJC_IVAR____TtC3VFX13VFXCoreCamera_instance + 4) != 0)
  {
    v2 = (void *)result;
    v3 = swift_retain();
    MEMORY[0x1E0C80A78](v3, v4);
    v5 = v2;
    sub_1B1D198D0(0, (void (*)(_BYTE *))sub_1B216ADA4);

    return swift_release();
  }
  return result;
}

- (__n128)position
{
  uint64_t v2;
  char *v3;
  __int128 v4;
  __int128 v6;

  v2 = *(_QWORD *)&a1[OBJC_IVAR____TtC3VFX13VFXCoreCamera_instance + 8];
  swift_retain();
  v3 = a1;
  sub_1B1DB15DC(v2, v3);
  v6 = v4;

  swift_release();
  return (__n128)v6;
}

- (void)setPosition:(_TtC3VFX13VFXCoreCamera *)self
{
  __n128 v2;
  _TtC3VFX13VFXCoreCamera *v3;
  __n128 v4;

  v4 = v2;
  v3 = self;
  sub_1B2168F84(v4);

}

- (__n128)orientation
{
  uint64_t v2;
  char *v3;
  __int128 v4;
  __int128 v6;

  v2 = *(_QWORD *)&a1[OBJC_IVAR____TtC3VFX13VFXCoreCamera_instance + 8];
  swift_retain();
  v3 = a1;
  sub_1B1DB17B8(v2, v3);
  v6 = v4;

  swift_release();
  return (__n128)v6;
}

- (void)setOrientation:(void *)a1
{
  id v2;

  v2 = a1;
  sub_1B21696A0(a2);

}

- (double)projection
{
  double result;

  *(_QWORD *)&result = sub_1B2169C84(a1, a2, (double (*)(uint64_t, char *))sub_1B1DB1398).n128_u64[0];
  return result;
}

- (void)setProjection:(float32x4_t)a3
{
  id v5;

  v5 = a1;
  sub_1B2169DD0(a2, a3, a4, a5);

}

- (float)fieldOfView
{
  return sub_1B216A6BC((char *)self, (uint64_t)a2, (float (*)(uint64_t, char *))sub_1B1DB1994);
}

- (float)focalLength
{
  return sub_1B216A6BC((char *)self, (uint64_t)a2, (float (*)(uint64_t, char *))sub_1B1DB1C1C);
}

- (float)focusDistance
{
  return sub_1B216A6BC((char *)self, (uint64_t)a2, (float (*)(uint64_t, char *))sub_1B1DB1E74);
}

- (float)sensorSize
{
  return sub_1B216A6BC((char *)self, (uint64_t)a2, (float (*)(uint64_t, char *))sub_1B1DB20CC);
}

- (float)fStop
{
  return sub_1B216A6BC((char *)self, (uint64_t)a2, (float (*)(uint64_t, char *))sub_1B1DB2324);
}

- (float)exposure
{
  return sub_1B216A6BC((char *)self, (uint64_t)a2, (float (*)(uint64_t, char *))sub_1B1DB257C);
}

- (float)aperture
{
  return sub_1B216A6BC((char *)self, (uint64_t)a2, (float (*)(uint64_t, char *))sub_1B1DB27D4);
}

- (double)filmOffset
{
  uint64_t v2;
  char *v3;
  double v4;

  v2 = *(_QWORD *)&a1[OBJC_IVAR____TtC3VFX13VFXCoreCamera_instance + 8];
  swift_retain();
  v3 = a1;
  v4 = sub_1B1DB2C98(v2, v3);

  swift_release();
  return v4;
}

- (float)scale
{
  return sub_1B216A6BC((char *)self, (uint64_t)a2, (float (*)(uint64_t, char *))sub_1B1DB2A2C);
}

- (float)zNear
{
  return sub_1B216A6BC((char *)self, (uint64_t)a2, (float (*)(uint64_t, char *))sub_1B1DB2A58);
}

- (float)zFar
{
  return sub_1B216A6BC((char *)self, (uint64_t)a2, (float (*)(uint64_t, char *))sub_1B1DB2A84);
}

- (BOOL)reverseZ
{
  return sub_1B216A8EC((char *)self, (uint64_t)a2, (uint64_t (*)(uint64_t, char *))sub_1B1DAF33C);
}

- (char)projectionDirection
{
  uint64_t v3;
  _TtC3VFX13VFXCoreCamera *v4;
  char v5;
  char v6;

  v3 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC3VFX13VFXCoreCamera_instance];
  swift_retain();
  v4 = self;
  sub_1B1DB2F00(v3, v4);
  v6 = v5;

  swift_release();
  return v6;
}

- (_TtC3VFX13VFXCoreCamera)init
{
  _TtC3VFX13VFXCoreCamera *result;

  result = (_TtC3VFX13VFXCoreCamera *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

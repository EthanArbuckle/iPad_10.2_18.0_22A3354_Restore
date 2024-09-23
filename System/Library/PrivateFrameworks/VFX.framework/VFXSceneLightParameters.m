@implementation VFXSceneLightParameters

- (_TtC3VFX23VFXSceneLightParameters)initWithType:(int64_t)a3
{
  return (_TtC3VFX23VFXSceneLightParameters *)VFXSceneLightParameters.init(type:)(a3);
}

- (_TtC3VFX23VFXSceneLightParameters)initWithType:(int64_t)a3 intensity:(float)a4 color:
{
  __n128 v4;

  return (_TtC3VFX23VFXSceneLightParameters *)VFXSceneLightParameters.init(type:intensity:color:)(a3, a4, v4);
}

- (void)setIntensity:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_intensity) = a3;
}

- (void)setOrientation:(_TtC3VFX23VFXSceneLightParameters *)self
{
  __int128 v2;
  char *v3;

  v3 = (char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_orientation;
  *(_OWORD *)v3 = v2;
  v3[16] = 0;
}

- (void)setPosition:(_TtC3VFX23VFXSceneLightParameters *)self
{
  __int128 v2;
  char *v3;

  v3 = (char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_position;
  *(_OWORD *)v3 = v2;
  v3[16] = 0;
}

- (void)setAttenuationRadius:(float)a3
{
  float *v3;

  v3 = (float *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_attenuationRadius);
  *v3 = a3;
  *((_BYTE *)v3 + 4) = 0;
}

- (void)setDirectionalParametersWithScale:(float)a3 zNear:(float)a4 zFar:(float)a5
{
  float *v5;
  float *v6;
  float *v7;

  v5 = (float *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_orthoScale);
  *v5 = a3;
  *((_BYTE *)v5 + 4) = 0;
  v6 = (float *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_zNear);
  *v6 = a4;
  *((_BYTE *)v6 + 4) = 0;
  v7 = (float *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_zFar);
  *v7 = a5;
  *((_BYTE *)v7 + 4) = 0;
}

- (void)setSpotLightParametersWithOuterAngle:(float)a3 innerAngle:(float)a4 zNear:(float)a5 zFar:(float)a6
{
  float *v6;
  float *v7;
  float *v8;
  float *v9;

  v6 = (float *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_outerAngle);
  *v6 = a3;
  *((_BYTE *)v6 + 4) = 0;
  v7 = (float *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_innerAngle);
  *v7 = a4;
  *((_BYTE *)v7 + 4) = 0;
  v8 = (float *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_zNear);
  *v8 = a5;
  *((_BYTE *)v8 + 4) = 0;
  v9 = (float *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_zFar);
  *v9 = a6;
  *((_BYTE *)v9 + 4) = 0;
}

- (void)setPointLightParametersWithZNear:(float)a3 zFar:(float)a4
{
  float *v4;
  float *v5;

  v4 = (float *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_zNear);
  *v4 = a3;
  *((_BYTE *)v4 + 4) = 0;
  v5 = (float *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_zFar);
  *v5 = a4;
  *((_BYTE *)v5 + 4) = 0;
}

- (void)setAreaLightParametersWithExtents:(BOOL)a3 doubleSided:
{
  uint64_t v3;
  char *v4;

  v4 = (char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_extents;
  *(_QWORD *)v4 = v3;
  v4[8] = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_doubleSided) = a3;
}

- (void)setIBLParametersWithUrl:(id)a3 texture:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _TtC3VFX23VFXSceneLightParameters *v14;
  uint64_t v15;

  sub_1B1791524(0, (unint64_t *)&qword_1ED4BF720, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v15 - v9;
  if (a3)
  {
    sub_1B22280C8();
    v11 = sub_1B2228110();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    v12 = sub_1B2228110();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  v13 = (char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_url;
  swift_unknownObjectRetain();
  v14 = self;
  sub_1B19EC9A4((uint64_t)v13);
  sub_1B19EC90C((uint64_t)v10, (uint64_t)v13);
  *(Class *)((char *)&v14->super.isa + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_texture) = (Class)a4;

  swift_unknownObjectRelease();
  sub_1B19EC9A4((uint64_t)v10);
}

- (void)setIBLParametersWithEntity:(int64_t)a3
{
  sub_1B19E9324(a3);
}

- (void)setIBLParametersWithTag:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  if (a3)
  {
    v4 = sub_1B222874C();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_textureTag);
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease();
}

- (_TtC3VFX23VFXSceneLightParameters)init
{
  _TtC3VFX23VFXSceneLightParameters *result;

  result = (_TtC3VFX23VFXSceneLightParameters *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B19EC9A4((uint64_t)self + OBJC_IVAR____TtC3VFX23VFXSceneLightParameters_url);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

@end

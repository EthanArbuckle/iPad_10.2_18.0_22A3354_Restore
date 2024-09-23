@implementation VFXEntityObject

- (int64_t)objectID
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  int64_t v5;

  v3 = *(unsigned int *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX15VFXEntityObject_entity);
  v2 = *(unsigned int *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX15VFXEntityObject_entity + 4);
  if ((_DWORD)v2)
    v4 = 0;
  else
    v4 = v3 == 0xFFFFFFFFLL;
  v5 = v3 | (v2 << 32);
  if (v4)
    return 0;
  else
    return v5;
}

- (id)init:(int64_t)a3 sharedEntityManager:(id)a4
{
  return (id)sub_1B1D1A148((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t *))VFXEntityObject.init(_:sharedEntityManager:));
}

- (id)init:(int64_t)a3 privateEntityManager:(id)a4
{
  return (id)sub_1B1D1A148((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t *))VFXEntityObject.init(_:privateEntityManager:));
}

- (NSString)description
{
  void *v2;

  sub_1B1BC3C70();
  v2 = (void *)sub_1B2228728();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)dealloc
{
  _TtC3VFX15VFXEntityObject *v2;

  v2 = self;
  VFXEntityObject.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  swift_release();
}

- (NSString)tag
{
  _TtC3VFX15VFXEntityObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1B1D1B7C8();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1B2228728();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setTag:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC3VFX15VFXEntityObject *v7;

  if (a3)
  {
    v4 = sub_1B222874C();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1B1D1B990(v4, v6);

}

- (id)copyWithZone:(void *)a3
{
  _TtC3VFX15VFXEntityObject *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_1B1D1BC10(v6);

  sub_1B19FA070(v6, v6[3]);
  v4 = (void *)sub_1B2229D0C();
  _s3VFX14_BinaryDecoderC16SingleValueStoreVwxx_0((uint64_t)v6);
  return v4;
}

- (void)updateBridgedReferencesWithBridgeable:(id)a3 objectByIdentifier:(id)a4
{
  id v6;
  _TtC3VFX15VFXEntityObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  sub_1B22292EC();
  swift_unknownObjectRelease();
  v8 = sub_1B2228530();

  sub_1B1D1BE0C(v9, v8);
  swift_bridgeObjectRelease();
  _s3VFX14_BinaryDecoderC16SingleValueStoreVwxx_0((uint64_t)&v10);
}

- (_TtC3VFX15VFXEntityObject)init
{
  _TtC3VFX15VFXEntityObject *result;

  result = (_TtC3VFX15VFXEntityObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)removeFromScene
{
  _TtC3VFX15VFXEntityObject *v3;
  _TtC3VFX15VFXEntityObject *v4;

  if (swift_weakLoadStrong())
  {
    v4 = self;
    swift_release();
    v3 = v4;
    if ((*((_BYTE *)&v4->super.isa + OBJC_IVAR____TtC3VFX15VFXEntityObject__isTombstoned) & 1) == 0)
    {
      sub_1B1D19A88(1);
      v3 = v4;
    }

  }
}

- (void)addTo:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC3VFX15VFXEntityObject *v6;

  v4 = *(_QWORD *)((char *)a3 + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v5 = a3;
  v6 = self;
  sub_1B1D1B3E4(v4);

}

- (MTLTexture)clientTexture
{
  _TtC3VFX15VFXEntityObject *v2;
  void *v3;

  v2 = self;
  v3 = (void *)VFXEntityObject.clientTexture.getter();

  return (MTLTexture *)v3;
}

- (void)setClientTexture:(id)a3
{
  _TtC3VFX15VFXEntityObject *v5;

  swift_unknownObjectRetain();
  v5 = self;
  VFXEntityObject.clientTexture.setter((uint64_t)a3);

}

- (CGImage)clientCGImage
{
  _TtC3VFX15VFXEntityObject *v2;
  void *v3;

  v2 = self;
  v3 = (void *)VFXEntityObject.clientCGImage.getter();

  return (CGImage *)v3;
}

- (void)setClientCGImage:(CGImage *)a3
{
  CGImage *v5;
  _TtC3VFX15VFXEntityObject *v6;

  v5 = a3;
  v6 = self;
  VFXEntityObject.clientCGImage.setter(a3);

}

- (NSArray)bindings
{
  return (NSArray *)sub_1B1DBF9AC(self, (uint64_t)a2, (void (*)(void))VFXEntityObject.bindings.getter, (unint64_t *)&qword_1EEF5C938);
}

- (NSArray)intersectionFunctions
{
  return (NSArray *)sub_1B1DBF9AC(self, (uint64_t)a2, (void (*)(void))VFXEntityObject.intersectionFunctions.getter, (unint64_t *)&unk_1ED4BA650);
}

- (MTLBuffer)particleHeaderBuffer
{
  _TtC3VFX15VFXEntityObject *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1B1DBFF20((uint64_t (*)(_QWORD, _QWORD, uint64_t))sub_1B1FF1708);

  return (MTLBuffer *)v3;
}

- (int64_t)particleHeaderBufferOffset
{
  _TtC3VFX15VFXEntityObject *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1B1DC01A4((uint64_t (*)(_QWORD, _QWORD, uint64_t))sub_1B1FF1414);

  return v3;
}

- (MTLBuffer)particleDataBuffer
{
  _TtC3VFX15VFXEntityObject *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1B1DBFF20((uint64_t (*)(_QWORD, _QWORD, uint64_t))sub_1B1FF1780);

  return (MTLBuffer *)v3;
}

- (int64_t)particleDataBufferOffset
{
  _TtC3VFX15VFXEntityObject *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1B1DC01A4((uint64_t (*)(_QWORD, _QWORD, uint64_t))sub_1B1FF148C);

  return v3;
}

- (__n128)transform
{
  id v1;
  __int128 v2;
  __int128 v4;

  v1 = a1;
  *(double *)&v2 = VFXEntityObject.transform.getter();
  v4 = v2;

  return (__n128)v4;
}

- (void)setTransform:(simd_float4)a3
{
  id v5;
  simd_float4x4 v6;

  v6.columns[3] = a5;
  v6.columns[1] = a3;
  v6.columns[2] = a4;
  v6.columns[0] = a2;
  v5 = a1;
  VFXEntityObject.transform.setter(v6);

}

- (void)setBeamed
{
  _TtC3VFX15VFXEntityObject *v2;

  v2 = self;
  VFXEntityObject.setBeamed()();

}

- (float)opacity
{
  _TtC3VFX15VFXEntityObject *v2;
  float v3;

  v2 = self;
  v3 = VFXEntityObject.opacity.getter();

  return v3;
}

- (void)setOpacity:(float)a3
{
  _TtC3VFX15VFXEntityObject *v3;

  v3 = self;
  VFXEntityObject.opacity.setter();

}

- (__n128)position
{
  id v1;
  __int128 v2;
  __int128 v4;

  v1 = a1;
  *(double *)&v2 = VFXEntityObject.position.getter();
  v4 = v2;

  return (__n128)v4;
}

- (void)setPosition:(_TtC3VFX15VFXEntityObject *)self
{
  _TtC3VFX15VFXEntityObject *v2;

  v2 = self;
  VFXEntityObject.position.setter();

}

- (__n128)orientation
{
  id v1;
  __int128 v2;
  __int128 v4;

  v1 = a1;
  *(double *)&v2 = VFXEntityObject.orientation.getter();
  v4 = v2;

  return (__n128)v4;
}

- (void)setOrientation:(void *)a1
{
  id v1;

  v1 = a1;
  VFXEntityObject.orientation.setter();

}

- (__n128)scale
{
  id v1;
  __int128 v2;
  __int128 v4;

  v1 = a1;
  *(double *)&v2 = VFXEntityObject.scale.getter();
  v4 = v2;

  return (__n128)v4;
}

- (void)setScale:(_TtC3VFX15VFXEntityObject *)self
{
  __n128 v2;
  _TtC3VFX15VFXEntityObject *v3;
  __n128 v4;

  v4 = v2;
  v3 = self;
  VFXEntityObject.scale.setter(v4);

}

- (BOOL)isEnabled
{
  _TtC3VFX15VFXEntityObject *v2;
  char v3;

  v2 = self;
  v3 = VFXEntityObject.isEnabled.getter();

  return v3 & 1;
}

- (void)setIsEnabled:(BOOL)a3
{
  _TtC3VFX15VFXEntityObject *v4;

  v4 = self;
  VFXEntityObject.isEnabled.setter(a3);

}

- (NSString)textureAbsolutePath
{
  _TtC3VFX15VFXEntityObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  VFXEntityObject.textureAbsolutePath.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1B2228728();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)isLocal
{
  _TtC3VFX15VFXEntityObject *v2;
  char v3;

  v2 = self;
  v3 = VFXEntityObject.isLocal.getter();

  return v3 & 1;
}

- (void)killParticles
{
  _TtC3VFX15VFXEntityObject *v2;

  v2 = self;
  VFXEntityObject.killParticles()();

}

- (void)restart
{
  _TtC3VFX15VFXEntityObject *v2;

  v2 = self;
  VFXEntityObject.restart()();

}

- (BOOL)_setValue:(id)a3 forKeyPath:(id)a4
{
  _TtC3VFX15VFXEntityObject *v6;
  char v7;

  sub_1B222874C();
  swift_unknownObjectRetain();
  v6 = self;
  v7 = VFXEntityObject._setValue(_:forKeyPath:)((uint64_t)a3);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (id)_valueForKeyPath:(id)a3 world:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC3VFX15VFXEntityObject *v10;
  void *v11;

  v6 = sub_1B222874C();
  v8 = v7;
  v9 = a4;
  v10 = self;
  v11 = (void *)VFXEntityObject._valueForKeyPath(_:world:)(v6, v8, v9);

  swift_bridgeObjectRelease();
  return v11;
}

@end

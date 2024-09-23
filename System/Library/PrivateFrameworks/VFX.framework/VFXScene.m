@implementation VFXScene

- (int64_t)addLightWithType:(int64_t)a3
{
  uint64_t v4;
  _TtC3VFX8VFXScene *v5;
  int64_t v6;
  int64_t v7;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v5 = self;
  sub_1B1DAD144(v4, a3, v5);
  v7 = v6;

  return v7;
}

- (void)removeLightWithId:(int64_t)a3
{
  uint64_t v4;
  _TtC3VFX8VFXScene *v5;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v5 = self;
  sub_1B1D9D9A0(v4, a3, v5);

}

- (void)setLightParametersOn:(int64_t)a3 parameters:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC3VFX8VFXScene *v8;
  id v9;
  _TtC3VFX8VFXScene *v10;

  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v7 = a4;
  v8 = self;
  v9 = v7;
  v10 = v8;
  sub_1B1D9DB34(v6, a3, v9, v10);

}

- (void)setShadowParametersOn:(int64_t)a3 castsShadows:(BOOL)a4 tiles:(void *)a5 count:(int64_t)a6 depthBias:(float)a7
{
  uint64_t v12;
  _TtC3VFX8VFXScene *v13;

  v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v13 = self;
  sub_1B1D9DD54(v12, a3, v13, a4, a6, (uint64_t)a5, a7);

}

- (void)setDirectionalLightUniformOverridesOn:(int64_t)a3 world:(void *)a4 proj:(void *)a5
{
  uint64_t v8;
  _TtC3VFX8VFXScene *v9;

  v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v9 = self;
  sub_1B1D9DF6C(v8, a3, (uint64_t)a4, (uint64_t)a5, v9);

}

- (int64_t)createSkyboxWithParameters:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC3VFX8VFXScene *v6;
  int64_t v7;
  int64_t v8;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v5 = a3;
  v6 = self;
  sub_1B1DAD330(v4, v5, v6);
  v8 = v7;

  return v8;
}

- (void)removeSkyboxes
{
  uint64_t v2;
  _TtC3VFX8VFXScene *v3;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v3 = self;
  sub_1B1D9E14C(v2, v3);

}

+ (NSBundle)vfxAssetsFrameworkBundle
{
  if (qword_1EEF56DC0 != -1)
    swift_once();
  return (NSBundle *)(id)qword_1EEF58AF0;
}

+ (NSArray)builtinEffectIdentifiers
{
  void *v2;

  if (qword_1EEF56DC8 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B2228AAC();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

+ (void)setBuiltinEffectIdentifiers:(id)a3
{
  uint64_t v3;

  v3 = sub_1B2228AB8();
  if (qword_1EEF56DC8 != -1)
    swift_once();
  qword_1EEF58AF8 = v3;
  swift_bridgeObjectRelease();
}

- (_TtC3VFX8VFXScene)initWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v4;
  unint64_t v5;

  v4 = sub_1B222874C();
  return (_TtC3VFX8VFXScene *)VFXScene.init(identifier:)(v4, v5);
}

+ (id)vfxLibraryURLFor:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  sub_1B17928A0();
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B222874C();
  static VFXScene.vfxLibraryURL(for:)(v7, v8, (uint64_t)v6);
  swift_bridgeObjectRelease();
  v9 = sub_1B2228110();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) != 1)
  {
    v11 = (void *)sub_1B2228074();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v6, v9);
  }
  return v11;
}

+ (void)registerWithTriggerManager:(id)a3 inWorld:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  sub_1B1B1FCD8(v5, v6);

}

+ (void)appendWithTrigger:(id)a3 touchEvent:(id)a4 view:(id)a5 inWorld:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  v9 = sub_1B222874C();
  v11 = v10;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  sub_1B1B1FE14(v9, v11, v12, v13, v14);

  swift_bridgeObjectRelease();
}

- (NSArray)effects
{
  void *v2;

  type metadata accessor for VFXEffect();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B2228AAC();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setEffects:(id)a3
{
  type metadata accessor for VFXEffect();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_effects) = (Class)sub_1B2228AB8();
  swift_bridgeObjectRelease();
}

- (int64_t)version
{
  _TtC3VFX8VFXScene *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1B1C279FC();

  return v3;
}

- (_TtC3VFX8VFXScene)initWithOptions:(id)a3
{
  return (_TtC3VFX8VFXScene *)VFXScene.init(options:)(a3);
}

- (_TtC3VFX8VFXScene)init
{
  return (_TtC3VFX8VFXScene *)VFXScene.init()();
}

- (_TtC3VFX8VFXScene)initWithContentsOf:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v6 = sub_1B2228110();
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B22280C8();
  return (_TtC3VFX8VFXScene *)VFXScene.init(contentsOf:options:)(v9, a4);
}

- (_TtC3VFX8VFXScene)initWithContentsOf:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = sub_1B2228110();
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B22280C8();
  return (_TtC3VFX8VFXScene *)VFXScene.init(contentsOf:)(v7);
}

- (id)initForEngineNamed:(id)a3
{
  _s3VFX8VFXSceneC14forEngineNamedACSS_tcfc_0();
}

- (void)dealloc
{
  _TtC3VFX8VFXScene *v3;
  _TtC3VFX8VFXScene *v4;
  objc_super v5;

  if (*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_hasSharedEntityManager) == 1)
  {
    v3 = self;
  }
  else
  {
    v4 = self;
    swift_retain();
    sub_1B1DA63A4();
    swift_release();
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VFXScene(0);
  -[VFXScene dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_1B19EC9A4((uint64_t)self + OBJC_IVAR____TtC3VFX8VFXScene_recordedMetalBinaryArchiveURL);
}

- (NSArray)metalBinaryArchiveURLs
{
  void *v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_metalBinaryArchiveURLs))
  {
    sub_1B2228110();
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1B2228AAC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (void)setMetalBinaryArchiveURLs:(id)a3
{
  objc_class *v4;

  if (a3)
  {
    sub_1B2228110();
    v4 = (objc_class *)sub_1B2228AB8();
  }
  else
  {
    v4 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_metalBinaryArchiveURLs) = v4;
  swift_bridgeObjectRelease();
}

- (NSURL)recordedMetalBinaryArchiveURL
{
  return (NSURL *)sub_1B1C2A164((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC3VFX8VFXScene_recordedMetalBinaryArchiveURL);
}

- (void)setRecordedMetalBinaryArchiveURL:(id)a3
{
  sub_1B1C2A24C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC3VFX8VFXScene_recordedMetalBinaryArchiveURL);
}

- (unint64_t)internalPixelFormat
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_internalPixelFormat);
}

- (void)setInternalPixelFormat:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_internalPixelFormat) = (Class)a3;
}

- (char)internalPixelFormatDepth
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_internalPixelFormatDepth);
}

- (void)setInternalPixelFormatDepth:(char)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_internalPixelFormatDepth) = a3;
}

- (BOOL)useGammaBlending
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_useGammaBlending);
}

- (void)setUseGammaBlending:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_useGammaBlending) = a3;
}

- (void)enterBackground
{
  _TtC3VFX8VFXScene *v2;

  v2 = self;
  sub_1B1E7104C();

}

- (void)enterForeground
{
  _TtC3VFX8VFXScene *v2;

  v2 = self;
  sub_1B1E7113C();

}

- (BOOL)isPlaying
{
  char *v2;

  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
     + OBJC_IVAR____TtC3VFX13EntityManager_clock;
  if (v2[96] == 1)
    return (v2[99] ^ 1) & 1;
  else
    return 0;
}

- (void)setIsPlaying:(BOOL)a3
{
  (*(_BYTE **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager))[OBJC_IVAR____TtC3VFX13EntityManager_clock
                                                                                      + 96] = a3;
}

- (BOOL)isFrozen
{
  return (*(_BYTE **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager))[OBJC_IVAR____TtC3VFX13EntityManager_clock
                                                                                             + 97];
}

- (void)setIsFrozen:(BOOL)a3
{
  char *v3;

  v3 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
     + OBJC_IVAR____TtC3VFX13EntityManager_clock;
  v3[97] = a3;
  if (a3)
    v3[98] = 0;
}

- (float)timeScale
{
  return *(float *)(*(_QWORD *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                              + OBJC_IVAR____TtC3VFX13EntityManager_scheduler)
                  + 208);
}

- (void)setTimeScale:(float)a3
{
  *(float *)(*(_QWORD *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                       + OBJC_IVAR____TtC3VFX13EntityManager_scheduler)
           + 208) = a3;
}

- (BOOL)allowsCameraControl
{
  return 0;
}

- (void)setAllowsCameraControl:(BOOL)a3
{
  uint64_t v3;
  _TtC3VFX8VFXScene *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = qword_1ED4BF430;
  v4 = self;
  if (v3 != -1)
    swift_once();
  swift_retain();
  v5 = sub_1B2228E90();
  v6 = 1;
  sub_1B1F1AAF0(v5, 0xD000000000000057, 0x80000001B23347F0, &v6);

  swift_release();
}

- (BOOL)showStatistics
{
  return 0;
}

- (BOOL)additiveWritesToAlpha
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                 + OBJC_IVAR____TtC3VFX13EntityManager_renderer);
  if (v2)
    return *(_BYTE *)(v2 + 321);
  else
    return 0;
}

- (void)setAdditiveWritesToAlpha:(BOOL)a3
{
  _TtC3VFX8VFXScene *v4;

  v4 = self;
  sub_1B1C2AB94(a3);

}

- (id)bindingOf:(id)a3 named:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC3VFX8VFXScene *v11;
  uint64_t v12;
  char v13;
  void *v14;

  v5 = sub_1B222874C();
  v7 = v6;
  v8 = sub_1B222874C();
  v10 = v9;
  v11 = self;
  v12 = sub_1B1FF36E8(v5, v7, 0x200000000, 1);
  if ((v13 & 1) != 0 || v12 == 0xFFFFFFFFLL)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v14 = 0;
  }
  else
  {
    v14 = (void *)sub_1B1F4BC74(v12, v5, v7, v8, v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return v14;
}

- (id)firstBindingWithName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC3VFX8VFXScene *v7;
  void *v8;

  v4 = sub_1B222874C();
  v6 = v5;
  v7 = self;
  v8 = (void *)sub_1B1F42AA8(v4, v6, 0x200000000);

  swift_bridgeObjectRelease();
  return v8;
}

- (NSArray)bindings
{
  _TtC3VFX8VFXScene *v2;
  void *v3;

  v2 = self;
  sub_1B1F42F94(0x200000000, 0, 0);

  sub_1B1C2F6B4();
  v3 = (void *)sub_1B2228AAC();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)updateWithDeltaTime:(double)a3
{
  uint64_t v4;
  _TtC3VFX8VFXScene *v5;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v5 = self;
  sub_1B1D9E178(v4, v5, a3);

}

- (void)restart
{
  _TtC3VFX8VFXScene *v2;

  v2 = self;
  sub_1B1C2AF7C();

}

- (void)prepare
{
  sub_1B1C2CE74((char *)self, (uint64_t)a2, (void (*)(uint64_t, char *))sub_1B1D9E49C);
}

- (void)clearCaches
{
  sub_1B1C2CE74((char *)self, (uint64_t)a2, (void (*)(uint64_t, char *))sub_1B1D9E858);
}

- (void)performTransaction:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC3VFX8VFXScene *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1B1790B98((void (*)(uint64_t))sub_1B1C2F6AC, v5);

  swift_release();
}

- (id)parameterOf:(id)a3 named:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC3VFX8VFXScene *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  char *v18;
  void *v19;
  _QWORD v22[3];
  uint64_t v23;

  v5 = sub_1B222874C();
  v7 = v6;
  v8 = sub_1B222874C();
  v10 = v9;
  v11 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12 = self;
  sub_1B1DA43FC(v11, v11, v5, v7, 0x200000000, v8, v10, (uint64_t)v22);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v13 = v23;
  if (!v23)
    return 0;
  v14 = sub_1B19FA070(v22, v23);
  v15 = *(_QWORD *)(v13 - 8);
  v16 = MEMORY[0x1E0C80A78](v14, v14);
  v18 = (char *)v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v15 + 16))(v18, v16);
  v19 = (void *)sub_1B2229D0C();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v13);
  _s3VFX14_BinaryDecoderC16SingleValueStoreVwxx_0((uint64_t)v22);
  return v19;
}

- (void)setParameterOf:(id)a3 named:(id)a4 :(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC3VFX8VFXScene *v12;
  _QWORD v13[5];
  int v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE v19[32];

  v6 = sub_1B222874C();
  v8 = v7;
  v9 = sub_1B222874C();
  v11 = v10;
  swift_unknownObjectRetain();
  v12 = self;
  sub_1B22292EC();
  swift_unknownObjectRelease();
  v13[2] = *(Class *)((char *)&v12->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v13[3] = v6;
  v13[4] = v8;
  v14 = 0;
  v15 = 2;
  v16 = v9;
  v17 = v11;
  v18 = v19;
  sub_1B1C276DC((void (*)(void))sub_1B1C2DB04, (uint64_t)v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  _s3VFX14_BinaryDecoderC16SingleValueStoreVwxx_0((uint64_t)v19);
}

- (void)withPointerToParameterOf:(id)a3 named:(id)a4 block:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _TtC3VFX8VFXScene *v13;

  v6 = _Block_copy(a5);
  v7 = sub_1B222874C();
  v9 = v8;
  v10 = sub_1B222874C();
  v12 = v11;
  _Block_copy(v6);
  v13 = self;
  sub_1B1C2DB34(v7, v9, v10, v12, (uint64_t)v13, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)setValue:(id)a3 atPath:(id)a4
{
  id v6;
  _TtC3VFX8VFXScene *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[8];
  _BYTE v12[32];

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  sub_1B22292EC();
  swift_unknownObjectRelease();
  v8 = sub_1B222874C();
  v10 = v9;

  v11[2] = v7;
  v11[3] = v12;
  v11[4] = v8;
  v11[5] = v10;
  sub_1B1C276DC((void (*)(void))sub_1B1C2F87C, (uint64_t)v11);

  swift_bridgeObjectRelease();
  _s3VFX14_BinaryDecoderC16SingleValueStoreVwxx_0((uint64_t)v12);
}

- (id)valueAtPath:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC3VFX8VFXScene *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  v4 = (_QWORD *)sub_1B222874C();
  v6 = v5;
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v8 = self;
  swift_bridgeObjectRetain();
  sub_1B1DA46EC(v7, v8, v4, v6, &v18);

  swift_bridgeObjectRelease();
  v9 = v19;
  if (!v19)
    return 0;
  v10 = sub_1B19FA070(&v18, v19);
  v11 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x1E0C80A78](v10, v10);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v11 + 16))(v14, v12);
  v15 = (void *)sub_1B2229D0C();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v9);
  _s3VFX14_BinaryDecoderC16SingleValueStoreVwxx_0((uint64_t)&v18);
  return v15;
}

- (void)withPointerToValueAtPath:(id)a3 block:(id)a4
{
  void *v5;
  uint64_t v6;
  int v7;
  _TtC3VFX8VFXScene *v8;
  uint64_t v9;

  v5 = _Block_copy(a4);
  v6 = qword_1ED4BF430;
  v8 = self;
  if (v6 != -1)
    swift_once();
  swift_retain();
  v7 = sub_1B2228E90();
  if (qword_1ED4BF658 != -1)
    swift_once();
  v9 = 0;
  swift_retain();
  sub_1B1F1AD70(v7, &v9, 0xD00000000000003DLL, 0x80000001B2334850);
  swift_release();
  swift_release();
  _Block_release(v5);

}

- (void)setEnabled:(id)a3 enabled:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC3VFX8VFXScene *v10;

  v6 = sub_1B222874C();
  v8 = v7;
  v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  swift_retain();
  swift_bridgeObjectRetain();
  v10 = self;
  sub_1B1D9EA90(v9, v9, v6, v8, 0x200000000, a4);

  swift_bridgeObjectRelease();
}

- (BOOL)isEnabled:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC3VFX8VFXScene *v8;

  v4 = sub_1B222874C();
  v6 = v5;
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  swift_retain();
  v8 = self;
  LOBYTE(v4) = sub_1B1DAE668(v7, v7, v4, v6, 0x200000000);

  swift_bridgeObjectRelease();
  swift_release();
  return v4 & 1;
}

- (id)addEffectFrom:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC3VFX8VFXScene *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v5 = sub_1B2228110();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B22280C8();
  v10 = self;
  sub_1B1791D00((uint64_t)v9);
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);

  return v12;
}

- (id)addEffectWithEffectID:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  _TtC3VFX8VFXScene *v5;
  id v7;

  v3 = *(_QWORD *)&a3;
  v7 = 0;
  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v5 = self;
  sub_1B1D9ED98(v4, &v7, v5, v3);

  return v7;
}

- (id)addEffectFromTemplate:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC3VFX8VFXScene *v6;
  id v7;
  _TtC3VFX8VFXScene *v8;
  id v10;

  v10 = 0;
  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v5 = a3;
  v6 = self;
  v7 = v5;
  v8 = v6;
  sub_1B1D9EF44(v4, v7, v8, &v10);

  return v10;
}

- (void)removeEffect:(id)a3
{
  uint64_t v4;
  _TtC3VFX8VFXScene *v5;
  id v6;
  _TtC3VFX8VFXScene *v7;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v5 = self;
  v6 = a3;
  v7 = v5;
  sub_1B1D9F164(v4, v7, v6);

}

- (void)removeAllEffects
{
  sub_1B1C2CE74((char *)self, (uint64_t)a2, (void (*)(uint64_t, char *))sub_1B1D9F49C);
}

- (id)makeDefaultCamera
{
  uint64_t v2;
  uint64_t v3;
  _TtC3VFX8VFXScene *v4;
  unint64_t v5;
  unint64_t v6;
  objc_class *v7;
  char *v8;
  char *v9;
  _TtC3VFX8VFXScene *v10;
  objc_super v12;
  char v13;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v3 = **(_QWORD **)(v2 + OBJC_IVAR____TtC3VFX13EntityManager_commandQueues);
  v4 = self;
  v13 = 1;
  v5 = sub_1B217E048(0x100000000uLL, v3);
  LODWORD(v3) = v5;
  v6 = HIDWORD(v5);
  v7 = (objc_class *)type metadata accessor for VFXCoreCamera();
  v8 = (char *)objc_allocWithZone(v7);
  v9 = &v8[OBJC_IVAR____TtC3VFX13VFXCoreCamera_instance];
  *(_DWORD *)v9 = v3;
  *((_DWORD *)v9 + 1) = v6;
  *((_QWORD *)v9 + 1) = v2;
  v12.receiver = v8;
  v12.super_class = v7;
  v10 = -[VFXScene init](&v12, sel_init);

  return v10;
}

- (NSObject)assetManager
{
  _TtC3VFX8VFXScene *v2;
  void *v3;

  v2 = self;
  v3 = (void *)VFXScene.assetManager.getter();

  return v3;
}

- (void)setAssetManager:(id)a3
{
  _TtC3VFX8VFXScene *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v5 = self;
  sub_1B1C2DD20(a3, v6);

}

- (void)initializeAssetManagerWithBundleURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC3VFX8VFXScene *v9;
  uint64_t v10;

  v4 = sub_1B2228110();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B22280C8();
  v9 = self;
  VFXScene.initializeAssetManagerWithBundleURL(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (int64_t)entityWithTag:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC3VFX8VFXScene *v7;
  Swift::String_optional v8;
  Swift::Int64 v9;

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
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  v9 = VFXScene.entity(withTag:)(v8);

  swift_bridgeObjectRelease();
  return v9;
}

- (id)textureForEntity:(int64_t)a3 isFallback:(BOOL *)a4 isDynamic:(BOOL *)a5
{
  _TtC3VFX8VFXScene *v8;
  void *v9;

  v8 = self;
  v9 = (void *)sub_1B1C2D63C(a3, a4, a5);

  return v9;
}

- (BOOL)loadWithUrl:(id)a3 loadingForAuthoring:(BOOL)a4 infoOut:(id)a5 presentationScene:(id)a6 error:(id *)a7
{
  _BOOL4 v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  id v17;
  _TtC3VFX8VFXScene *v18;
  uint64_t v20;

  v9 = a4;
  v11 = sub_1B2228110();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11, v13);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B22280C8();
  v16 = a5;
  v17 = a6;
  v18 = self;
  sub_1B1DCA2FC(v15, v9, a5);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);

  return 1;
}

- (void)addEntityObject:(id)a3
{
  id v4;
  _TtC3VFX8VFXScene *v5;

  v4 = a3;
  v5 = self;
  VFXScene.addEntityObject(_:)(v4);

}

- (void)removeEntityObject:(id)a3
{
  _TtC3VFX8VFXScene *v3;
  unint64_t *v4;
  unint64_t v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  _TtC3VFX8VFXScene *v11;

  v3 = self;
  v4 = (unint64_t *)((char *)self + OBJC_IVAR____TtC3VFX8VFXScene_entityObjects);
  v5 = *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityObjects);
  v6 = a3;
  v11 = v3;
  swift_bridgeObjectRetain();
  LOBYTE(v3) = sub_1B1DB9154((uint64_t)v6, v5);
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
  {
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = sub_1B1DB9BE8((uint64_t)v6, v7);
    v10 = v9;
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)

    objc_msgSend(v6, sel_removeFromScene);
  }

}

- (id)fetchEntityObjectWithTag:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC3VFX8VFXScene *v7;
  char *v8;
  char *v9;
  uint64_t v11;
  _TtC3VFX8VFXScene *v12;
  id v13;

  v4 = sub_1B222874C();
  v6 = v5;
  v7 = self;
  v8 = sub_1B1DBB450(v4, v6);
  if (v8)
  {
    v9 = v8;

    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    v13 = 0;
    v11 = *(uint64_t *)((char *)&v7->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
    v12 = v7;
    swift_bridgeObjectRetain();
    sub_1B1D9F884(v11, v12, v4, v6, &v13);

    swift_bridgeObjectRelease();
    return v13;
  }
}

- (void)resolveObjectReferencesWithRemapTableWithWorld:(id)a3 objectsByIdentifier:(id)a4
{
  uint64_t v6;
  VFXWorld *v7;
  _TtC3VFX8VFXScene *v8;

  v6 = sub_1B2228530();
  v7 = (VFXWorld *)a3;
  v8 = self;
  VFXScene.resolveObjectReferencesWithRemapTable(world:objectsByIdentifier:)(v7, (Swift::OpaquePointer)v6);

  swift_bridgeObjectRelease();
}

- (void)updateVFX2RenderOutputWithPointOfView:(id)a3 commandBuffer:(id)a4
{
  id v6;
  _TtC3VFX8VFXScene *v7;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  VFXScene.updateVFX2RenderOutput(pointOfView:commandBuffer:)((uint64_t)v6, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (void)remapEntityReferences:(id)a3
{
  id v4;
  _TtC3VFX8VFXScene *v5;

  v4 = a3;
  v5 = self;
  VFXScene.remapEntityReferences(_:)((uint64_t)v4);

}

- (void)beginTransaction:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC3VFX8VFXScene *v6;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v6 = self;
  sub_1B1DAAED0();
  v5 = *(_QWORD *)(v4 + OBJC_IVAR____TtC3VFX13EntityManager_renderer);
  if (v5)
    *(_QWORD *)(v5 + 144) = a3;

}

- (void)endTransaction
{
  uint64_t v2;
  _TtC3VFX8VFXScene *v3;

  v2 = *(_QWORD *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                 + OBJC_IVAR____TtC3VFX13EntityManager_renderer);
  if (v2)
    *(_QWORD *)(v2 + 144) = 0;
  v3 = self;
  sub_1B1DAAE5C();

}

- (VFXMTLResourceManager)resourceManager
{
  _TtC3VFX8VFXScene *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v2 = self;
  v10 = sub_1B1DBCFEC((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  return (VFXMTLResourceManager *)v10;
}

- (void)opaqueEntityManager
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
}

- (float)deltaTime
{
  return *(float *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                  + OBJC_IVAR____TtC3VFX13EntityManager_clock
                  + 64);
}

- (id)recycleBuffersGetCompletion
{
  uint64_t v2;
  _TtC3VFX8VFXScene *v3;
  uint64_t (*v4)();
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD aBlock[7];

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v3 = self;
  v4 = sub_1B1DAF564(v2, v3);
  v6 = v5;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v4;
  *(_QWORD *)(v7 + 24) = v6;

  aBlock[4] = sub_1B1D13D9C;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B17915D0;
  aBlock[3] = &unk_1E63F0CA0;
  v8 = _Block_copy(aBlock);
  swift_release();
  return v8;
}

- (void)updateAtTime:(double)a3 deltaTime:(double)a4 frameIndex:(int64_t)a5
{
  uint64_t v8;
  _TtC3VFX8VFXScene *v9;

  v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v9 = self;
  sub_1B1D9FAB0(v8, v9, a5, a3, a4);

}

- (void)enumerateDrawCall:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _TtC3VFX8VFXScene *v7;
  _QWORD v8[4];

  v4 = _Block_copy(a3);
  v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v8[2] = v4;
  v6 = *(id *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_transientDrawCall);
  swift_retain();
  v7 = self;
  sub_1B1D9FCB8(v5, v5, v6, (void (*)(uint64_t))sub_1B1DCC1F0, (uint64_t)v8);

  _Block_release(v4);
}

- (int64_t)drawCallCount
{
  uint64_t v2;
  uint64_t v3;
  _TtC3VFX8VFXScene *v4;
  int64_t v5;
  uint64_t v7[12];
  _QWORD v8[12];
  _OWORD v9[2];
  uint64_t v10;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v3 = qword_1EEF57378;
  v4 = self;
  if (v3 != -1)
    swift_once();
  v9[0] = xmmword_1EEF5E820;
  v9[1] = *(_OWORD *)algn_1EEF5E830;
  v10 = qword_1EEF5E840;
  sub_1B1E8FCE4(v2, (uint64_t)v9, 0x200000000, v7);
  sub_1B1A18378((uint64_t)v7, (uint64_t)v8, (unint64_t *)&qword_1ED4B7DE0, (uint64_t)&type metadata for QueryResult);
  if (v8[0])
  {
    v5 = v8[10];
    sub_1B19ED748(v7);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)triggerRenderWith:(id)a3 renderer:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC3VFX8VFXScene *v9;

  v6 = _Block_copy(a3);
  v7 = swift_allocObject();
  v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  *(_QWORD *)(v7 + 16) = v6;
  if (*(_QWORD *)(v8 + OBJC_IVAR____TtC3VFX13EntityManager_runtimeThread))
  {
    v9 = self;
    swift_retain();
    sub_1B1E6407C((uint64_t)sub_1B1C2F6AC, v7, a4);

    swift_release();
  }
  swift_release();
}

- (float)speedFactor
{
  return *(float *)(*(_QWORD *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                              + OBJC_IVAR____TtC3VFX13EntityManager_scheduler)
                  + 208);
}

- (void)setSpeedFactor:(float)a3
{
  *(float *)(*(_QWORD *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                       + OBJC_IVAR____TtC3VFX13EntityManager_scheduler)
           + 208) = a3;
}

- (float)time
{
  return *(double *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                   + OBJC_IVAR____TtC3VFX13EntityManager_clock
                   + 48);
}

- (void)setTime:(float)a3
{
  *(double *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
            + OBJC_IVAR____TtC3VFX13EntityManager_clock
            + 48) = a3;
}

- (BOOL)paused
{
  return (*(_BYTE **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager))[OBJC_IVAR____TtC3VFX13EntityManager_clock
                                                                                             + 97];
}

- (void)setPaused:(BOOL)a3
{
  char *v3;

  v3 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
     + OBJC_IVAR____TtC3VFX13EntityManager_clock;
  v3[97] = a3;
  if (a3)
    v3[98] = 0;
}

- (BOOL)beginImgUIFrameWithViewportSize:(CGSize)a3 backingScaleFactor:(double)a4
{
  return 0;
}

- (BOOL)endImgUIFrameWithCommandBuffer:(id)a3 encoder:(id)a4 renderPassDescriptor:(id)a5
{
  return 0;
}

- (BOOL)endImgUIFrame
{
  return 0;
}

- (BOOL)imGUIEnabled
{
  return (*(_BYTE **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager))[OBJC_IVAR____TtC3VFX13EntityManager_imGUIEnabled];
}

- (void)setImGUIEnabled:(BOOL)a3
{
  (*(_BYTE **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager))[OBJC_IVAR____TtC3VFX13EntityManager_imGUIEnabled] = a3;
}

- (void)encodeAuthoringWithEncoder:(id)a3 colorFormat:(unint64_t)a4 depthStencilFormat:(unint64_t)a5 sampleCount:(int64_t)a6
{
  uint64_t v7;
  _TtC3VFX8VFXScene *v8;
  _QWORD v9[11];

  sub_1B1B6B6F8(a4, 0, 0, 0, 0, 0, 0, 0, v9, a5, 0, 1, a6);
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  swift_unknownObjectRetain();
  v8 = self;
  sub_1B200062C(v7);
  swift_unknownObjectRelease();

}

- (int64_t)newObject
{
  int64_t result;

  result = sub_1B217E9B4(0x100000000uLL, **(_QWORD **)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)+ OBJC_IVAR____TtC3VFX13EntityManager_commandQueues));
  if (result == 0xFFFFFFFFLL)
    return 0;
  return result;
}

- (void)destroyObject:(int64_t)a3
{
  _TtC3VFX8VFXScene *v4;

  v4 = self;
  VFXScene.destroyObject(_:)(a3);

}

- (void)updateWorldTransform:(simd_float4x4 *)a3 of:
{
  id v4;

  v4 = a1;
  VFXScene.updateWorldTransform(_:of:)(a3, (Swift::Int64)v4);

}

- (void)selectObject:(int64_t)a3 selected:(BOOL)a4
{
  _TtC3VFX8VFXScene *v6;

  v6 = self;
  sub_1B1DBDF20(a3, a4);

}

- (void)invalidateCachedScriptParams
{
  uint64_t v3;
  _TtC3VFX8VFXScene *v4;

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = self;
  v4 = self;
  sub_1B1DA6294((uint64_t)sub_1B1DCC148, v3);

  swift_release();
}

- (void)setWorld:(__CFXWorld *)a3
{
  uint64_t v5;
  __CFXWorld *v6;
  _TtC3VFX8VFXScene *v7;
  __CFXWorld *v8;

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = self;
  *(_QWORD *)(v5 + 24) = a3;
  v6 = a3;
  v7 = self;
  v8 = v6;
  sub_1B1DA6294((uint64_t)sub_1B1DCC120, v5);

  swift_release();
}

- (void)updateForceField:(void *)a3 of:(int64_t)a4
{
  _TtC3VFX8VFXScene *v6;

  v6 = self;
  VFXScene.updateForceField(_:of:)((uint64_t)a3, a4);

}

- (__n128)evaluateForceFieldsAtPosition:(float32x4_t)a3 velocity:(float)a4 mass:(double)a5 charge:(float)a6 time:(float)a7 dt:(uint64_t)a8 categoryMask:(int)a9
{
  uint64_t v13;
  char *v14;
  double v15;
  __int128 v16;
  __int128 v20;

  v13 = *(_QWORD *)&a1[OBJC_IVAR____TtC3VFX8VFXScene_entityManager];
  v14 = a1;
  *(float *)&v15 = a4;
  sub_1B1B4A514(v13, a9, a2, a3, v15, a6, a7);
  v20 = v16;

  return (__n128)v20;
}

+ (void)stopReplicationWithModel:(id)a3 runtime:(id)a4
{
  id v5;
  char *v6;

  *(_QWORD *)(*(_QWORD *)((char *)a3 + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
            + OBJC_IVAR____TtC3VFX13EntityManager_replicationStream) = 0;
  v5 = a3;
  v6 = (char *)a4;
  swift_release();
  *(_QWORD *)(*(_QWORD *)&v6[OBJC_IVAR____TtC3VFX8VFXScene_entityManager]
            + OBJC_IVAR____TtC3VFX13EntityManager_replicationStream) = 0;

  swift_release();
}

+ (id)cloneAndSetupReplicationWithModelWorld:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = _s3VFX8VFXSceneC24cloneAndSetupReplication10modelWorldAA26VFXBidirectionalRemapTableCSo8VFXWorldC_tFZ_0(v3);

  return v4;
}

- (id)sourceReplicationDelegate
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                 + OBJC_IVAR____TtC3VFX13EntityManager_replicationStream);
  if (v2)
    return (id)MEMORY[0x1B5E240CC](v2 + 48, a2);
  else
    return 0;
}

- (void)setSourceReplicationDelegate:(id)a3
{
  sub_1B1DBE974(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B1DCAD08);
}

- (id)destinationReplicationDelegate
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                 + OBJC_IVAR____TtC3VFX13EntityManager_replicationStream);
  if (v2)
    return (id)MEMORY[0x1B5E240CC](v2 + 64, a2);
  else
    return 0;
}

- (void)setDestinationReplicationDelegate:(id)a3
{
  sub_1B1DBE974(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B1DCADA0);
}

- (void)setDebugUIOptions:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_debugUIOptions) = (Class)a3;
}

- (void)startRuntimeThread
{
  _TtC3VFX8VFXScene *v2;

  v2 = self;
  VFXScene.startRuntimeThread()();

}

- (id)buildAccelerationStructureDescriptorsWithEntity:(int64_t)a3
{
  _TtC3VFX8VFXScene *v4;
  void *v5;

  v4 = self;
  sub_1B1FB0B68(a3);

  sub_1B1FB1334();
  v5 = (void *)sub_1B2228AAC();
  swift_bridgeObjectRelease();
  return v5;
}

@end

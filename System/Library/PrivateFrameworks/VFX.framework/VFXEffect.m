@implementation VFXEffect

- (_TtC3VFX9VFXEffect)init
{
  return (_TtC3VFX9VFXEffect *)sub_1B17917A4();
}

- (int64_t)identifier
{
  if ((*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC3VFX9VFXEffect_effectID + 4) & 1) != 0)
    return 0;
  else
    return *(int *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX9VFXEffect_effectID);
}

- (int64_t)rootObjectID
{
  if ((self->effectID[OBJC_IVAR____TtC3VFX9VFXEffect_rootEntity] & 1) != 0)
    return 0;
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX9VFXEffect_rootEntity) == (Class)0xFFFFFFFFLL)
    return 0;
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX9VFXEffect_rootEntity);
}

- (_TtC3VFX8VFXScene)scene
{
  return (_TtC3VFX8VFXScene *)(id)MEMORY[0x1B5E240CC]((char *)self + OBJC_IVAR____TtC3VFX9VFXEffect_scene, a2);
}

- (void)setScene:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (_TtP3VFX17VFXEffectDelegate_)delegate
{
  return (_TtP3VFX17VFXEffectDelegate_ *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX9VFXEffect_delegate) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (int64_t)version
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX9VFXEffect_version);
}

- (void)setVersion:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX9VFXEffect_version) = (Class)a3;
}

- (BOOL)allowRemoteEdition
{
  return 0;
}

- (void)setAllowRemoteEdition:(BOOL)a3
{
  uint64_t v3;
  _TtC3VFX9VFXEffect *v4;
  int v5;
  uint64_t v6;

  v3 = qword_1ED4BF430;
  v4 = self;
  if (v3 != -1)
    swift_once();
  swift_retain();
  v5 = sub_1B2228E90();
  if (qword_1ED4BF658 != -1)
    swift_once();
  v6 = 0;
  swift_retain();
  sub_1B1F1AD70(v5, &v6, 0xD000000000000034, 0x80000001B2344D40);

  swift_release();
  swift_release();
}

- (id)bindingOf:(id)a3 named:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC3VFX9VFXEffect *v11;
  uint64_t v12;
  _TtC3VFX9VFXEffect *v13;
  void *v14;

  v5 = sub_1B222874C();
  v7 = v6;
  v8 = sub_1B222874C();
  v10 = v9;
  v11 = self;
  v12 = sub_1B1F43C48();
  v13 = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14 = (void *)sub_1B1DB08F8(v12, v13, v5, v7, v8, v10);
  swift_release();

  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  return v14;
}

- (id)bindingWith:(int64_t)a3 named:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC3VFX9VFXEffect *v9;
  uint64_t v10;
  _TtC3VFX9VFXEffect *v11;
  void *v12;

  v6 = sub_1B222874C();
  v8 = v7;
  v9 = self;
  v10 = sub_1B1F43C48();
  v11 = v9;
  swift_bridgeObjectRetain();
  v12 = (void *)sub_1B1DB0C40(v10, v11, a3, v6, v8);
  swift_release();

  swift_bridgeObjectRelease_n();
  return v12;
}

- (id)firstBindingWithName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC3VFX9VFXEffect *v7;
  void *v8;

  v4 = sub_1B222874C();
  v6 = v5;
  v7 = self;
  v8 = (void *)sub_1B1F45518(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (NSArray)bindings
{
  _TtC3VFX9VFXEffect *v2;
  void *v3;

  v2 = self;
  sub_1B1F45644();

  sub_1B1C2F6B4();
  v3 = (void *)sub_1B2228AAC();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (id)parameterOf:(id)a3 named:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC3VFX9VFXEffect *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  char *v17;
  void *v18;
  _QWORD v20[3];
  uint64_t v21;

  v5 = sub_1B222874C();
  v7 = v6;
  v8 = sub_1B222874C();
  v10 = v9;
  v11 = self;
  sub_1B1F45B54(v5, v7, v8, v10, (uint64_t)v20);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = v21;
  if (!v21)
    return 0;
  v13 = sub_1B19FA070(v20, v21);
  v14 = *(_QWORD *)(v12 - 8);
  v15 = MEMORY[0x1E0C80A78](v13, v13);
  v17 = (char *)v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v14 + 16))(v17, v15);
  v18 = (void *)sub_1B2229D0C();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v12);
  _s3VFX14_BinaryDecoderC16SingleValueStoreVwxx_0((uint64_t)v20);
  return v18;
}

- (void)setParameterOf:(id)a3 named:(id)a4 :(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC3VFX9VFXEffect *v12;
  _BYTE v13[32];

  v6 = sub_1B222874C();
  v8 = v7;
  v9 = sub_1B222874C();
  v11 = v10;
  swift_unknownObjectRetain();
  v12 = self;
  sub_1B22292EC();
  swift_unknownObjectRelease();
  sub_1B1F45D34(v6, v8, v9, v11, (uint64_t)v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  _s3VFX14_BinaryDecoderC16SingleValueStoreVwxx_0((uint64_t)v13);
}

- (int64_t)lookupObjectIDByName:(id)a3
{
  _TtC3VFX9VFXEffect *v4;
  int64_t v5;
  char v6;
  char v7;

  sub_1B222874C();
  v4 = self;
  v5 = sub_1B1F460BC();
  v7 = v6;

  swift_bridgeObjectRelease();
  if ((v7 & 1) != 0)
    return 0;
  else
    return v5;
}

- (void)parameterOf:(int64_t)a3 named:(id)a4 with:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC3VFX9VFXEffect *v11;
  uint64_t v12;
  _QWORD v13[4];

  v7 = _Block_copy(a5);
  v8 = sub_1B222874C();
  v10 = v9;
  v13[2] = v7;
  v11 = self;
  v12 = sub_1B1F43C48();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1B1DA2CA4(v12, v12, a3, v8, v10, 23, (uint64_t (*)(uint64_t, uint64_t))sub_1B1F4C908, (uint64_t)v13);
  swift_release();
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)parameterOf:(int64_t)a3 named:(id)a4 type:(int64_t)a5 with:(id)a6
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _TtC3VFX9VFXEffect *v13;
  uint64_t v14;
  _QWORD v15[4];

  v9 = _Block_copy(a6);
  v10 = sub_1B222874C();
  v12 = v11;
  v15[2] = v9;
  v13 = self;
  v14 = sub_1B1F43C48();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1B1DA2CA4(v14, v14, a3, v10, v12, a5, (uint64_t (*)(uint64_t, uint64_t))sub_1B1F4C5C0, (uint64_t)v15);
  swift_release();
  _Block_release(v9);

  swift_bridgeObjectRelease();
}

- (void)setParameterOf:(int64_t)a3 named:(id)a4 with:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC3VFX9VFXEffect *v11;
  uint64_t v12;
  _BYTE v13[16];
  void *v14;

  v7 = _Block_copy(a5);
  v8 = sub_1B222874C();
  v10 = v9;
  v14 = v7;
  v11 = self;
  v12 = sub_1B1F43C48();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1B1DA2ED0(v12, v12, a3, v8, v10, 23, 0, (uint64_t (*)(uint64_t, uint64_t))sub_1B1F4C908, (uint64_t)v13);
  swift_release();
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)setParameterOf:(int64_t)a3 named:(id)a4 type:(int64_t)a5 size:(int64_t)a6 with:(id)a7
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _TtC3VFX9VFXEffect *v15;
  uint64_t v16;
  _BYTE v17[16];
  void *v18;

  v11 = _Block_copy(a7);
  v12 = sub_1B222874C();
  v14 = v13;
  v18 = v11;
  v15 = self;
  v16 = sub_1B1F43C48();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1B1DA2ED0(v16, v16, a3, v12, v14, a5, a6, (uint64_t (*)(uint64_t, uint64_t))sub_1B1F4C908, (uint64_t)v17);
  swift_release();
  _Block_release(v11);

  swift_bridgeObjectRelease();
}

- (void)withPointerToParameterOf:(id)a3 named:(id)a4 block:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC3VFX9VFXEffect *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  void *v17;

  v6 = _Block_copy(a5);
  sub_1B222874C();
  v7 = sub_1B222874C();
  v9 = v8;
  v17 = v6;
  v10 = self;
  v11 = sub_1B1F460BC();
  if ((v12 & 1) != 0)
  {
    _Block_release(v6);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = v11;
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = sub_1B1DCC1F0;
    *(_QWORD *)(v14 + 24) = &v16;
    v15 = sub_1B1F43C48();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_1B1DA2ED0(v15, v15, v13, v7, v9, 23, 0, (uint64_t (*)(uint64_t, uint64_t))sub_1B1D13D9C, v14);
    swift_release();
    swift_release();
    _Block_release(v6);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

- (void)setEnabled:(id)a3 enabled:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC3VFX9VFXEffect *v9;

  v6 = sub_1B222874C();
  v8 = v7;
  v9 = self;
  sub_1B1F469AC(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (BOOL)isEnabled:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC3VFX9VFXEffect *v7;

  v4 = sub_1B222874C();
  v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_1B1F46AA8(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (int64_t)fetchClientTextureIDWithNamed:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC3VFX9VFXEffect *v7;
  int64_t v8;

  v4 = sub_1B222874C();
  v6 = v5;
  v7 = self;
  v8 = sub_1B1F46BB0(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void)setClientTextureWithId:(int64_t)a3 texture:(id)a4
{
  _TtC3VFX9VFXEffect *v7;
  uint64_t v8;
  _TtC3VFX9VFXEffect *v9;

  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_1B1F43C48();
  swift_unknownObjectRetain();
  v9 = v7;
  sub_1B1DA311C(v8, v9, a3, (uint64_t)a4);
  swift_unknownObjectRelease();

  swift_release();
}

- (BOOL)isEnabled
{
  _TtC3VFX9VFXEffect *v2;
  uint64_t v3;
  _TtC3VFX9VFXEffect *v4;
  char v5;

  v2 = self;
  v3 = sub_1B1F43C48();
  v4 = v2;
  v5 = sub_1B1DAEC20(v3, v4);
  swift_release();

  return v5 & 1;
}

- (void)setIsEnabled:(BOOL)a3
{
  _TtC3VFX9VFXEffect *v4;
  uint64_t v5;
  _TtC3VFX9VFXEffect *v6;

  v4 = self;
  v5 = sub_1B1F43C48();
  v6 = v4;
  sub_1B1DA3344(v5, v6, a3);

  swift_release();
}

- (BOOL)isTombstoned
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC3VFX9VFXEffect__tombstoned);
}

- (void)setIsTombstoned:(BOOL)a3
{
  _TtC3VFX9VFXEffect *v3;
  uint64_t v4;
  _TtC3VFX9VFXEffect *v5;

  if (*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC3VFX9VFXEffect__tombstoned) != a3)
  {
    *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC3VFX9VFXEffect__tombstoned) = a3;
    v3 = self;
    v4 = sub_1B1F43C48();
    v5 = v3;
    sub_1B1DA376C(v4, v5);

    swift_release();
  }
}

- (NSArray)cameras
{
  _TtC3VFX9VFXEffect *v2;
  uint64_t v3;
  _TtC3VFX9VFXEffect *v4;
  void *v5;

  v2 = self;
  v3 = sub_1B1F43C48();
  v4 = v2;
  sub_1B1DB0ECC(v3, v4);
  swift_release();

  type metadata accessor for VFXCoreCamera();
  v5 = (void *)sub_1B2228AAC();
  swift_bridgeObjectRelease();
  return (NSArray *)v5;
}

- (id)allCameraNamed:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC3VFX9VFXEffect *v7;
  uint64_t v8;
  _TtC3VFX9VFXEffect *v9;
  void *v10;

  v4 = sub_1B222874C();
  v6 = v5;
  v7 = self;
  v8 = sub_1B1F43C48();
  v9 = v7;
  swift_bridgeObjectRetain();
  sub_1B1DB10A4(v8, v9, v4, v6);
  swift_release();

  swift_bridgeObjectRelease_n();
  type metadata accessor for VFXCoreCamera();
  v10 = (void *)sub_1B2228AAC();
  swift_bridgeObjectRelease();
  return v10;
}

- (void)dump
{
  _TtC3VFX9VFXEffect *v2;

  v2 = self;
  sub_1B1F4871C();

}

- (void).cxx_destruct
{
  sub_1B1AEA224((uint64_t)self + OBJC_IVAR____TtC3VFX9VFXEffect_url, (uint64_t)&qword_1ED4BF720, (uint64_t)MEMORY[0x1E0CAFFF8], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1B1791524);

  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

@end

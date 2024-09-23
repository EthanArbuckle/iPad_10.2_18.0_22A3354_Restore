@implementation VFXREScene

- (_TtC3VFX8VFXScene)scene
{
  return (_TtC3VFX8VFXScene *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR___VFXREScene_scene));
}

- (void)setScene:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_scene);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_scene) = (Class)a3;
  v3 = a3;

}

- (_TtC3VFX9VFXEffect)effect
{
  return (_TtC3VFX9VFXEffect *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___VFXREScene_effect));
}

- (void)setEffect:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_effect);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_effect) = (Class)a3;
  v3 = a3;

}

- (id)transientDrawCall
{
  return (id)swift_unknownObjectRetain();
}

- (void)setTransientDrawCall:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_transientDrawCall) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (int64_t)uuid
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_uuid);
}

- (void)setUuid:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_uuid) = (Class)a3;
}

- (float)sceneScale
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_sceneScale);
}

- (void)setSceneScale:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_sceneScale) = a3;
}

- (id)reloadBlock
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  if (!*(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_reloadBlock))
    return 0;
  v2 = *(_QWORD *)&self->scene[OBJC_IVAR___VFXREScene_reloadBlock];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_reloadBlock);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 1107296256;
  v5[2] = sub_1B17915D0;
  v5[3] = &unk_1E63D2AA0;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (void)setReloadBlock:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t (**v7)();
  uint64_t v8;

  v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v5;
    v6 = sub_1B1E4CA2C;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR___VFXREScene_reloadBlock);
  v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_reloadBlock);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_1B19E5A18(v8);
}

- (void)opaqueECS
{
  return *(void **)(*(char **)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_scene)
                  + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
}

- (float)deltaTime
{
  return *(float *)(*(_QWORD *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_scene)
                              + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                  + OBJC_IVAR____TtC3VFX13EntityManager_clock
                  + 64);
}

- (int)peerPid
{
  return *(_DWORD *)(*(_QWORD *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_scene)
                               + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                   + OBJC_IVAR____TtC3VFX13EntityManager_peerPid);
}

- (void)setPeerPid:(int)a3
{
  *(_DWORD *)(*(_QWORD *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_scene)
                        + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
            + OBJC_IVAR____TtC3VFX13EntityManager_peerPid) = a3;
}

- (unsigned)peerTaskIdentity
{
  return *(_DWORD *)(*(_QWORD *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_scene)
                               + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                   + OBJC_IVAR____TtC3VFX13EntityManager_peerTaskIdentity);
}

- (void)setPeerTaskIdentity:(unsigned int)a3
{
  *(_DWORD *)(*(_QWORD *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_scene)
                        + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
            + OBJC_IVAR____TtC3VFX13EntityManager_peerTaskIdentity) = a3;
}

- (int64_t)drawCallCount
{
  uint64_t ObjectType;
  VFXREScene *v4;
  uint64_t v5;
  int64_t v6;

  ObjectType = swift_getObjectType();
  v4 = self;
  v5 = swift_retain();
  v6 = sub_1B1DA4AE8(v5, v4, ObjectType);

  swift_release();
  return v6;
}

- (void)updateMemoryOwnership
{
  VFXREScene *v2;
  VFXREScene *v3;
  uint64_t v4;

  v2 = self;
  swift_retain();
  sub_1B1DABEAC();
  swift_release();
  v3 = v2;
  v4 = swift_retain();
  sub_1B1DA0E40(v4, v3);

  swift_release();
}

- (__n128)worldBoundingBox
{
  id v1;
  uint64_t v2;
  unint64_t v3;
  unsigned __int32 v4;
  __n128 result;
  unsigned __int32 v6;
  unint64_t v7;

  v1 = a1;
  v2 = swift_retain();
  sub_1B1DB05AC(v2, v1);
  v7 = v3;
  v6 = v4;

  swift_release();
  result.n128_u64[0] = v7;
  result.n128_u32[2] = v6;
  return result;
}

- (VFXREScene)initWithContentsOf:(id)a3 commandQueue:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v8 = sub_1B2228110();
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B22280C8();
  swift_unknownObjectRetain();
  return (VFXREScene *)VFXREScene.init(contentsOf:commandQueue:options:)((uint64_t)v11, a4, a5);
}

- (VFXREScene)initWithCommandQueue:(id)a3 model:(id)a4 options:(id)a5
{
  VFXREScene *v8;

  swift_unknownObjectRetain();
  v8 = (VFXREScene *)sub_1B1E4BCE0(a3, (char *)a4, a5);
  swift_unknownObjectRelease();
  return v8;
}

- (VFXREScene)initWithDevice:(id)a3 contentsOf:(id)a4 error:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v5 = sub_1B2228110();
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B22280C8();
  v9 = swift_unknownObjectRetain();
  return (VFXREScene *)VFXREScene.init(device:contentsOf:)(v9, (uint64_t)v8);
}

- (VFXREScene)initWithDevice:(id)a3 model:(id)a4 options:(id)a5
{
  swift_unknownObjectRetain();
  return (VFXREScene *)VFXREScene.init(device:model:options:)((uint64_t)a3, (char *)a4, a5);
}

- (VFXREScene)initWithDevice:(id)a3 model:(id)a4
{
  swift_unknownObjectRetain();
  return (VFXREScene *)VFXREScene.init(device:model:)((uint64_t)a3, (char *)a4);
}

- (BOOL)shouldUseDrawCallHandler
{
  return 1;
}

- (id)generateMaterialsAndReturnError:(id *)a3
{
  void *v3;

  sub_1B1B98728(MEMORY[0x1E0DEE9D8]);
  v3 = (void *)sub_1B2228524();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)neededModelsAndReturnError:(id *)a3
{
  return (id)sub_1B2228AAC();
}

- (void)clear
{
  VFXREScene *v2;

  v2 = self;
  sub_1B1E48A04();

}

- (void)copyBindingValueWithObjectName:(id)a3 bindingName:(id)a4 action:(int64_t)a5 storageGetterBlock:(id)a6
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  VFXREScene *v16;
  uint64_t v17;

  v8 = _Block_copy(a6);
  v9 = sub_1B222874C();
  v11 = v10;
  v12 = sub_1B222874C();
  v14 = v13;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v8;
  v16 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v17 = swift_retain();
  sub_1B1DA1028(v17, v16, v9, v11, v12, v14, a5, (uint64_t (*)(uint64_t))sub_1B1DCC1F0, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)tick
{
  VFXREScene *v2;
  uint64_t v3;

  v2 = self;
  v3 = swift_retain();
  sub_1B1DA12D8(v3, v2);

  swift_release();
}

- (void)tickWithCommandBuffer:(id)a3
{
  VFXREScene *v4;
  VFXREScene *v5;
  uint64_t v6;

  v4 = self;
  swift_unknownObjectRetain_n();
  v5 = v4;
  v6 = swift_retain();
  sub_1B1DA14E0(v6, v5, (uint64_t)a3);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)tickWithDeltaTime:(double)a3
{
  VFXREScene *v4;
  uint64_t v5;

  v4 = self;
  v5 = swift_retain();
  sub_1B1DA16C0(v5, v4, a3);

  swift_release();
}

- (void)tickWithDeltaTime:(double)a3 commandBuffer:(id)a4
{
  VFXREScene *v6;
  VFXREScene *v7;
  uint64_t v8;

  v6 = self;
  swift_unknownObjectRetain_n();
  v7 = v6;
  v8 = swift_retain();
  sub_1B1DA18DC(v8, v7, (uint64_t)a4, a3);
  swift_unknownObjectRelease();

  swift_release();
}

- (id)recycleBuffersGetCompletion
{
  VFXREScene *v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD aBlock[7];

  v2 = self;
  v3 = swift_retain();
  v4 = sub_1B1DAF8B4(v3, v2);
  v6 = v5;
  swift_release();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v4;
  *(_QWORD *)(v7 + 24) = v6;

  aBlock[4] = sub_1B1DB39F8;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B17915D0;
  aBlock[3] = &unk_1E63D48A8;
  v8 = _Block_copy(aBlock);
  swift_release();
  return v8;
}

- (void)setRootEntityTransform:(VFXREScene *)self :(SEL)a2 :
{
  float32x4_t v2;
  float32x4_t v3;
  simd_float4 v4;
  VFXREScene *v5;
  float32x4_t v6;
  float32x4_t v7;
  simd_float4 v8;

  v8 = v4;
  v6 = v2;
  v7 = v3;
  v5 = self;
  sub_1B1E49A78(v6, v7, v8);

}

- (void)setRootTransform:(VFXREScene *)self :(SEL)a2 :
{
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v5;
  double v6;
  double v7;
  double v8;
  __n128 v9;
  __n128 v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  __n128 v14;
  VFXREScene *v15;
  uint64_t v16;
  __n128 v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;

  v21 = v3;
  *(double *)v5.i64 = sub_1B1E4BFB0(*(float *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_sceneScale), v2);
  v18 = v5;
  sub_1B1E4BFB8();
  v7 = sub_1B1E4BFC4(v21, v6, v18);
  *(double *)v11.i64 = sub_1B1E4C084(*(float32x4_t *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_sceneFromWorld), *(float32x4_t *)&self->effect[OBJC_IVAR___VFXREScene_sceneFromWorld], *(float32x4_t *)&self->rootEntity[OBJC_IVAR___VFXREScene_sceneFromWorld], *(float32x4_t *)&self->cameraEntity[OBJC_IVAR___VFXREScene_sceneFromWorld + 7], v7, v8, v9, v10);
  v20 = v12;
  v22 = v11;
  v17 = v14;
  v19 = v13;
  v15 = self;
  v16 = swift_retain();
  sub_1B1DA1D64(v16, v15, v22, v20, v19, v17);

  swift_release();
}

- (void)setSceneTransform:(VFXREScene *)self :(SEL)a2 :
{
  float32x4_t v2;
  float32x4_t v3;
  simd_float4 v4;
  VFXREScene *v5;
  float32x4_t v6;
  float32x4_t v7;
  simd_float4 v8;

  v8 = v4;
  v6 = v2;
  v7 = v3;
  v5 = self;
  sub_1B1E49EDC(v6, v7, v8);

}

- (void)setCameraEntityTransformProjection:(VFXREScene *)self :(SEL)a2 :::::
{
  __n128 v2;
  __n128 v3;
  __n128 v4;
  __n128 v5;
  __n128 v6;
  __n128 v7;
  __n128 v8;
  unint64_t v9;
  VFXREScene *v10;
  uint64_t v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;

  if ((self->scene[OBJC_IVAR___VFXREScene_cameraEntity] & 1) == 0)
  {
    v9 = *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_cameraEntity);
    v18 = v8;
    v16 = v6;
    v17 = v7;
    v14 = v4;
    v15 = v5;
    v12 = v2;
    v13 = v3;
    v10 = self;
    v11 = swift_retain();
    sub_1B1DA249C(v11, v10, v9, v12, v13, v14, v15, v16, v17, v18);

    swift_release();
  }
}

- (void)setFrameConfigurationWithImmersiveEnvironmentCurves:(VFXREScene *)self
{
  __n128 v2;
  VFXREScene *v3;
  uint64_t v4;
  __n128 v5;

  v5 = v2;
  v3 = self;
  v4 = swift_retain();
  sub_1B1DA2680(v4, v3, v5);

  swift_release();
}

- (int64_t)fetchClientTextureIDWithNamed:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  VFXREScene *v7;
  int64_t v8;

  v4 = sub_1B222874C();
  v6 = v5;
  v7 = self;
  v8 = sub_1B1E4A454(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void)setClientTextureWithId:(int64_t)a3 texture:(id)a4
{
  VFXREScene *v7;

  swift_unknownObjectRetain();
  v7 = self;
  sub_1B1E4A58C(a3, (uint64_t)a4);
  swift_unknownObjectRelease();

}

- (id)REMeshAssetBindings
{
  VFXREScene *v2;
  void *v3;

  v2 = self;
  sub_1B1E4A6B8();

  sub_1B1E4C9CC();
  v3 = (void *)sub_1B2228AAC();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)getREMeshAssetPath:(id)a3
{
  id v4;
  VFXREScene *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = self;
  sub_1B1E4ACE0(v4);
  v7 = v6;

  if (v7)
  {
    v8 = (void *)sub_1B2228728();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)createREMeshDataBinding
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for VFXREBindingMeshData()), sel_init);
}

- (void)setREMeshDataBinding:(id)a3 positionData:(id)a4 normalData:(id)a5 colorData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  VFXREScene *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  sub_1B1E4AE0C(v10, a4, a5, a6);

}

- (uint64_t)addCollisionPlaneWithCenter:(void *)a1 extents:(double)a2 transform:(float32x4_t)a3
{
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  __n128 v7;
  id v8;
  uint64_t v9;
  __n128 v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;

  sub_1B1E4C0D8();
  v13 = v5;
  v14 = v4;
  v11 = v7;
  v12 = v6;
  v8 = a1;
  v9 = sub_1B1E4B154(a3, v14, v13, v12, v11);

  return v9;
}

- (uint64_t)addCollisionPlaneWithExtents:(float32x4_t)a3 transform:(float32x4_t)a4
{
  id v6;
  uint64_t v7;

  v6 = a1;
  v7 = sub_1B1E4B154(a2, a3, a4, a5, a6);

  return v7;
}

- (void)updateCollisionPlaneWithId:(float32x4_t)a3 center:(uint64_t)a4 extents:(unint64_t)a5 transform:
{
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  __n128 v10;
  id v11;
  __n128 v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;

  sub_1B1E4C0D8();
  v15 = v7;
  v13 = v9;
  v14 = v8;
  v12 = v10;
  v11 = a1;
  sub_1B1E4B320(a5, a3, v15, v14, v13, v12);

}

- (void)updateCollisionPlaneWithId:(float32x4_t)a3 extents:(float32x4_t)a4 transform:(float32x4_t)a5
{
  id v9;

  v9 = a1;
  sub_1B1E4B320(a8, a2, a3, a4, a5, a6);

}

- (void)removeCollisionPlaneWithId:(int64_t)a3
{
  VFXREScene *v4;

  v4 = self;
  sub_1B1E4B6D8(a3);

}

- (BOOL)needsCollisionPlanes
{
  VFXREScene *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1B1E4B800();

  return v3;
}

- (void)collideOutsidePlaneWithId:(int64_t)a3
{
  VFXREScene *v4;

  v4 = self;
  sub_1B1E4B8AC(a3);

}

- (VFXREScene)init
{
  VFXREScene *result;

  result = (VFXREScene *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B19E5A18(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_reloadBlock));
  swift_bridgeObjectRelease();
  swift_release();
}

@end

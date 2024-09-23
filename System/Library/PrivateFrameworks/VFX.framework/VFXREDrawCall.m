@implementation VFXREDrawCall

- (unint64_t)materialIdentifier
{
  return 0;
}

- (void)enumerateBuffers:(id)a3
{
  void *v3;

  v3 = _Block_copy(a3);
  _Block_release(v3);
}

- (BOOL)hasLightingEnabled
{
  return 1;
}

- (void)withDefaultLightConstantBuffer:(void *)a3 :(id)a4
{
  sub_1B1F4D7C8(self, (int)a2, (uint64_t)a3, a4);
}

- (void)withDefaultIBLConstantBuffer:(void *)a3 :(id)a4
{
  sub_1B1F4D7C8(self, (int)a2, (uint64_t)a3, a4);
}

- (int64_t)indexCount
{
  return (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_drawCall))[8];
}

- (unsigned)indexType
{
  unsigned __int8 result;

  if ((*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_drawCall))[7] < 0x100uLL)
    return (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_drawCall))[7];
  result = sub_1B222967C();
  __break(1u);
  return result;
}

- (id)indexBuffer
{
  VFXREDrawCall *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1B1F4D8E0();

  return v3;
}

- (int64_t)indexBufferOffset
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_drawCall);
  if (*(_QWORD *)(v2 + 32))
    return *(_QWORD *)(v2 + 40);
  else
    return 0;
}

- (int64_t)indexBufferSize
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_drawCall);
  if (*(_QWORD *)(v2 + 32))
    return *(_QWORD *)(v2 + 48);
  else
    return 0;
}

- (int64_t)vertexCount
{
  return (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_drawCall))[13];
}

- (int64_t)instanceCount
{
  return (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_drawCall))[15];
}

- (unint64_t)primitiveType
{
  return (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_drawCall))[2];
}

- (unint64_t)winding
{
  return (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_drawCall))[18];
}

- (id)customHandler
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  v2 = *(_QWORD *)&self->drawCall[OBJC_IVAR___VFXREDrawCall_handler];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_handler);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 1107296256;
  v5[2] = sub_1B1F4DA5C;
  v5[3] = &unk_1E63D4998;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (BOOL)hasCustomHandler
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(_QWORD *, _QWORD *);

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_handler);
  v3 = *(_QWORD *)&self->drawCall[OBJC_IVAR___VFXREDrawCall_handler];
  if (v2)
  {
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v2;
    *(_QWORD *)(v4 + 24) = v3;
    v5 = sub_1B1F4EAFC;
  }
  else
  {
    v5 = 0;
  }
  sub_1B19F8C48(v2);
  sub_1B19E5A18((uint64_t)v5);
  return v2 != 0;
}

- (NSString)renderPassName
{
  return (NSString *)sub_1B1F4DC44();
}

- (void)setRenderPassName:(id)a3
{
  sub_1B1F4DC98((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___VFXREDrawCall_renderPassName);
}

- (unsigned)renderPassIdentifier
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_renderPassIdentifier);
}

- (void)setRenderPassIdentifier:(unsigned __int8)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_renderPassIdentifier) = a3;
}

- (BOOL)writesColor
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXREDrawCall__writesColor);
}

- (BOOL)writesSeparateDepth
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXREDrawCall__writesSeparateDepth);
}

- (BOOL)needsLinearDepth
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXREDrawCall__needsLinearDepth);
}

- (BOOL)isDepthOnly
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXREDrawCall__isDepthOnly);
}

- (BOOL)drawsForBlur
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXREDrawCall__drawsForBlur);
}

- (BOOL)isAdditive
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXREDrawCall__isAdditive);
}

- (int)materialType
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall__materialType);
}

- (uint64_t)boundingBoxMin
{
  return sub_1B1F4DC10(a1, a2, (uint64_t (*)(__n128, __n128))sub_1B1F4EAD0);
}

- (uint64_t)boundingBoxMax
{
  return sub_1B1F4DC10(a1, a2, (uint64_t (*)(__n128, __n128))sub_1B1F4EAC8);
}

- (int)renderingOrder
{
  return (*(_DWORD **)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_drawCall))[6];
}

- (NSString)emitterIdentifier
{
  return (NSString *)sub_1B1F4DC44();
}

- (void)setEmitterIdentifier:(id)a3
{
  sub_1B1F4DC98((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___VFXREDrawCall_emitterIdentifier);
}

- (VFXREDrawCall)init
{
  return (VFXREDrawCall *)VFXREDrawCall.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B19E5A18(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_handler));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

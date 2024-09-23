@implementation VFXRendererLegacy

- (_TtC3VFX8VFXScene)scene
{
  return (_TtC3VFX8VFXScene *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_scene));
}

- (void)setScene:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_scene);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_scene) = (Class)a3;
  v3 = a3;

}

- (_TtC3VFX9VFXEffect)effect
{
  return (_TtC3VFX9VFXEffect *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_effect));
}

- (void)setEffect:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  _TtC3VFX17VFXRendererLegacy *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v4 = OBJC_IVAR____TtC3VFX17VFXRendererLegacy_effect;
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_effect);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_effect) = (Class)a3;
  v6 = a3;
  v7 = self;

  v8 = *(uint64_t *)((char *)&self->super.isa + v4);
  if (v8)
    v9 = MEMORY[0x1B5E240CC](v8 + OBJC_IVAR____TtC3VFX9VFXEffect_scene);
  else
    v9 = 0;
  v10 = *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_scene);
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_scene) = (Class)v9;

}

- (MTLTexture)texture
{
  return (MTLTexture *)(id)swift_unknownObjectRetain();
}

- (void)setTexture:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_texture) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (MTLTexture)depthTexture
{
  return (MTLTexture *)(id)swift_unknownObjectRetain();
}

- (void)setDepthTexture:(id)a3
{
  _TtC3VFX17VFXRendererLegacy *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1B20C2E04((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_backgroundColor));
}

- (void)setBackgroundColor:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_backgroundColor);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_backgroundColor) = (Class)a3;
  v3 = a3;

}

- (_TtC3VFX13VFXCoreCamera)pointOfView
{
  return (_TtC3VFX13VFXCoreCamera *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_pointOfView));
}

- (void)setPointOfView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_pointOfView);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_pointOfView) = (Class)a3;
  v3 = a3;

}

- (_TtC3VFX17VFXRendererLegacy)initWithCommandQueue:(id)a3
{
  _TtC3VFX17VFXRendererLegacy *v4;

  swift_unknownObjectRetain();
  v4 = (_TtC3VFX17VFXRendererLegacy *)sub_1B20C2E84(a3);
  swift_unknownObjectRelease();
  return v4;
}

- (_TtC3VFX17VFXRendererLegacy)init
{
  return (_TtC3VFX17VFXRendererLegacy *)sub_1B20C0894();
}

- (BOOL)hasRenderableObjects
{
  _TtC3VFX17VFXRendererLegacy *v2;
  char v3;

  v2 = self;
  v3 = sub_1B20C0A48();

  return v3 & 1;
}

- (void)encodeWithCommandBuffer:(id)a3
{
  _TtC3VFX17VFXRendererLegacy *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1B20C0BB0(a3);
  swift_unknownObjectRelease();

}

- (void)finalizeEncoding
{
  void *v2;
  _TtC3VFX17VFXRendererLegacy *v4;
  uint64_t v5;
  id v6;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_scene);
  if (v2)
  {
    v6 = v2;
    v4 = self;
    v5 = swift_retain();
    sub_1B1DA3C1C(v5, v6);

    swift_release();
  }
}

- (BOOL)enableDeferredRendering
{
  return ((*(_BYTE **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_renderer))[536] & 1) == 0;
}

- (void)setEnableDeferredRendering:(BOOL)a3
{
  _TtC3VFX17VFXRendererLegacy *v3;

  (*(_BYTE **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_renderer))[536] = !a3;
  v3 = self;
  sub_1B1BA370C();
  sub_1B1BA370C();

}

- (id)snapshotWithSize:(CGSize)a3 deltaTime:(double)a4
{
  double height;
  double width;
  _TtC3VFX17VFXRendererLegacy *v7;
  void *v8;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = (void *)sub_1B20C13B4(width, height, a4);

  return v8;
}

- (id)snapshotImageWithSize:(CGSize)a3 deltaTime:(double)a4
{
  double height;
  double width;
  _TtC3VFX17VFXRendererLegacy *v7;
  UIImage_optional *v8;
  void *v9;
  void *v10;

  height = a3.height;
  width = a3.width;
  v7 = self;
  sub_1B20C13B4(width, height, a4);
  swift_getObjectType();
  MTLTexture.toImage()(v8);
  v10 = v9;

  swift_unknownObjectRelease();
  return v10;
}

- (BOOL)additiveWritesToAlpha
{
  return (*(_BYTE **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_renderer))[321];
}

- (void)setAdditiveWritesToAlpha:(BOOL)a3
{
  (*(_BYTE **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_renderer))[321] = a3;
}

- (id)postRenderCallback
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  if (!*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_postRenderCallback))
    return 0;
  v2 = *(_QWORD *)&self->scene[OBJC_IVAR____TtC3VFX17VFXRendererLegacy_postRenderCallback];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_postRenderCallback);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 1107296256;
  v5[2] = sub_1B1F4DA5C;
  v5[3] = &unk_1E63D2B40;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (void)setPostRenderCallback:(id)a3
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
    v6 = sub_1B1F4C5C0;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_postRenderCallback);
  v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_postRenderCallback);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_1B19E5A18(v8);
}

- (void).cxx_destruct
{

  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  sub_1B19E5A18(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_postRenderCallback));
}

@end

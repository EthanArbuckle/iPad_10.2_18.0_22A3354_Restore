@implementation VFXViewLegacy

- (_TtC3VFX8VFXScene)scene
{
  return (_TtC3VFX8VFXScene *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                      + OBJC_IVAR____TtC3VFX13VFXViewLegacy_scene));
}

- (void)setScene:(id)a3
{
  void *v4;
  _TtC3VFX13VFXViewLegacy *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_scene);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_scene) = (Class)a3;
  v6 = a3;
  v5 = self;

  sub_1B1D44088();
}

- (BOOL)framebufferOnly
{
  void *v2;
  _TtC3VFX13VFXViewLegacy *v3;
  id v4;
  unsigned __int8 v5;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView);
  v3 = self;
  v4 = objc_msgSend(v2, sel_layer);
  v5 = objc_msgSend(v4, sel_framebufferOnly);

  return v5;
}

- (void)setFramebufferOnly:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  _TtC3VFX13VFXViewLegacy *v5;
  id v6;

  v3 = a3;
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView);
  v5 = self;
  v6 = objc_msgSend(v4, sel_layer);
  objc_msgSend(v6, sel_setFramebufferOnly_, v3);

}

- (MTLCommandQueue)commandQueue
{
  _TtC3VFX13VFXViewLegacy *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1B1D43278();

  return (MTLCommandQueue *)v3;
}

- (id)postRenderCallback
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  v2 = (_QWORD *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView)
                + OBJC_IVAR____TtC3VFX11VFXCoreView_postRenderCallback);
  if (!*v2)
    return 0;
  v3 = v2[1];
  v6[4] = *v2;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1B1F4DA5C;
  v6[3] = &unk_1E63EF250;
  v4 = _Block_copy(v6);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setPostRenderCallback:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t *v7;
  uint64_t v8;

  v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v5;
    v6 = sub_1B1D449C4;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView)
                 + OBJC_IVAR____TtC3VFX11VFXCoreView_postRenderCallback);
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v4;
  sub_1B19E5A18(v8);
}

- (void)renderWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  _TtC3VFX13VFXViewLegacy *v7;
  char *v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView);
  v7 = self;
  v8 = v6;
  sub_1B1E5203C(0, v8, (void (*)(uint64_t))sub_1B1D449E8, v5);

  swift_release();
}

- (void)renderWithPresentWithTransaction:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  _TtC3VFX13VFXViewLegacy *v9;
  char *v10;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView);
  v9 = self;
  v10 = v8;
  sub_1B1E5203C(a3, v10, (void (*)(uint64_t))sub_1B1C2F6AC, v7);

  swift_release();
}

- (_TtC3VFX9VFXEffect)effect
{
  return (_TtC3VFX9VFXEffect *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                       + OBJC_IVAR____TtC3VFX13VFXViewLegacy_effect));
}

- (void)setEffect:(id)a3
{
  id v4;
  _TtC3VFX13VFXViewLegacy *v5;
  char *v6;

  v6 = *(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_effect);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_effect) = (Class)a3;
  v4 = a3;
  v5 = self;
  sub_1B1D435F8(v6);

}

- (_TtC3VFX13VFXCoreCamera)pointOfView
{
  return (_TtC3VFX13VFXCoreCamera *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                            + OBJC_IVAR____TtC3VFX13VFXViewLegacy_pointOfView));
}

- (void)setPointOfView:(id)a3
{
  id v5;
  _TtC3VFX13VFXViewLegacy *v6;

  v5 = a3;
  v6 = self;
  sub_1B1D4385C((uint64_t)a3);

}

- (unsigned)resizingMode
{
  return (*(_BYTE **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView))[OBJC_IVAR____TtC3VFX11VFXCoreView_resizingMode];
}

- (void)setResizingMode:(unsigned __int8)a3
{
  _BYTE *v3;
  _TtC3VFX13VFXViewLegacy *v4;
  _BYTE *v5;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView);
  v3[OBJC_IVAR____TtC3VFX11VFXCoreView_resizingMode] = a3;
  v4 = self;
  v5 = v3;
  sub_1B1E50590();

}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView), sel_backgroundColor);
}

- (void)setBackgroundColor:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView), sel_setBackgroundColor_, a3);
}

- (unint64_t)pixelFormat
{
  return (unint64_t)objc_msgSend(*(id *)(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView)+ OBJC_IVAR____TtC3VFX11VFXCoreView_metalLayer), sel_pixelFormat);
}

- (void)setPixelFormat:(unint64_t)a3
{
  objc_msgSend(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView)+ OBJC_IVAR____TtC3VFX11VFXCoreView_metalLayer), sel_setPixelFormat_, a3);
}

- (double)scaleFactor
{
  return *(double *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView)
                   + OBJC_IVAR____TtC3VFX11VFXCoreView_scaleFactor);
}

- (void)setScaleFactor:(double)a3
{
  _TtC3VFX13VFXViewLegacy *v4;

  v4 = self;
  sub_1B1D43A54(a3);

}

- (int64_t)preferredFramesPerSecond
{
  char *v2;

  v2 = *(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView)
     + OBJC_IVAR____TtC3VFX11VFXCoreView_preferredFramesPerSecond;
  if (v2[8])
    return 0;
  else
    return *(_QWORD *)v2;
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  _TtC3VFX13VFXViewLegacy *v4;

  v4 = self;
  sub_1B1D43C38(a3);

}

- (BOOL)lowLatency
{
  return objc_msgSend(*(id *)(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView)+ OBJC_IVAR____TtC3VFX11VFXCoreView_metalLayer), sel_lowLatency);
}

- (void)setLowLatency:(BOOL)a3
{
  objc_msgSend(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView)+ OBJC_IVAR____TtC3VFX11VFXCoreView_metalLayer), sel_setLowLatency_, a3);
}

- (_TtC3VFX13VFXViewLegacy)initWithFrame:(CGRect)a3
{
  return (_TtC3VFX13VFXViewLegacy *)sub_1B1D43CEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC3VFX13VFXViewLegacy)initWithCoder:(id)a3
{
  return (_TtC3VFX13VFXViewLegacy *)sub_1B1D43EC4(a3);
}

- (BOOL)isHidden
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VFXViewLegacy();
  return -[VFXViewLegacy isHidden](&v3, sel_isHidden);
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for VFXViewLegacy();
  v4 = (char *)v6.receiver;
  -[VFXViewLegacy setHidden:](&v6, sel_setHidden_, v3);
  v5 = *(id *)&v4[OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView];
  objc_msgSend(v5, sel_setHidden_, objc_msgSend(v4, sel_isHidden, v6.receiver, v6.super_class));

}

- (void).cxx_destruct
{
  swift_release();

}

@end

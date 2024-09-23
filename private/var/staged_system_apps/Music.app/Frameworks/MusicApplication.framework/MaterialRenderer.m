@implementation MaterialRenderer

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  id v5;
  _TtC16MusicApplication16MaterialRenderer *v6;
  id v7;
  double v8;
  double v9;
  objc_class *v10;
  uint64_t v11;

  v5 = a3;
  v6 = self;
  v7 = objc_msgSend(v5, "colorPixelFormat");
  objc_msgSend(v5, "frame");
  v10 = (objc_class *)sub_7FF658(v7, v8, v9);
  v11 = *(uint64_t *)((char *)&v6->super.isa + OBJC_IVAR____TtC16MusicApplication16MaterialRenderer_resizeTexture);
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR____TtC16MusicApplication16MaterialRenderer_resizeTexture) = v10;

  swift_unknownObjectRelease(v11);
}

- (void)drawInMTKView:(id)a3
{
  id v4;
  _TtC16MusicApplication16MaterialRenderer *v5;

  v4 = a3;
  v5 = self;
  sub_7FE708(v4);

}

- (_TtC16MusicApplication16MaterialRenderer)init
{
  _TtC16MusicApplication16MaterialRenderer *result;

  result = (_TtC16MusicApplication16MaterialRenderer *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.MaterialRenderer", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16MusicApplication16MaterialRenderer_context);
  v4 = *(_QWORD *)&self->context[OBJC_IVAR____TtC16MusicApplication16MaterialRenderer_context];
  v5 = *(_QWORD *)&self->context[OBJC_IVAR____TtC16MusicApplication16MaterialRenderer_context + 8];
  v6 = *(void **)&self->context[OBJC_IVAR____TtC16MusicApplication16MaterialRenderer_context + 16];

  swift_unknownObjectRelease(v5);
  swift_unknownObjectRelease(v4);
  swift_unknownObjectRelease(v3);
  sub_CBD68(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC16MusicApplication16MaterialRenderer_textureSource), self->context[OBJC_IVAR____TtC16MusicApplication16MaterialRenderer_textureSource]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16MusicApplication16MaterialRenderer_loadedImageTexture));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16MusicApplication16MaterialRenderer_resizeTexture));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication16MaterialRenderer____lazy_storage___resizeRenderPipelineDescriptor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication16MaterialRenderer____lazy_storage___treatmentRenderPipelineDescriptor));
  swift_release(*(_QWORD *)&self->context[OBJC_IVAR____TtC16MusicApplication16MaterialRenderer_textureFallbackCopyAllocator]);
}

@end

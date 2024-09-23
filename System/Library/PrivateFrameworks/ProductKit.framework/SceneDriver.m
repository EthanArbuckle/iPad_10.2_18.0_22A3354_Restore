@implementation SceneDriver

- (void)dealloc
{
  _TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver *v2;

  v2 = self;
  sub_213AD3414();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_scene));
  sub_213AD53FC((uint64_t)self + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_configuration, type metadata accessor for VideoViewConfiguration);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_player));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_camera));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_personalizedAssetMaterial));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_token));
  sub_213AD6270((uint64_t)self + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_timeObserverToken, &qword_254D188A8);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_textureCache));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_videoMaterial));
  sub_213AD529C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_featureStartedHandler));
  sub_213AD529C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_featureCompletedHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_currentIOSurface));
  swift_release();
}

- (void)handlePlayerItemFinished:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver *v8;
  uint64_t v9;

  v4 = sub_213B2BA68();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213B2BA50();
  v8 = self;
  sub_213AD3F98();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)renderer:(id)a3 didRenderScene:(id)a4 atTime:(double)a5
{
  id v8;
  _TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver *v9;

  swift_unknownObjectRetain();
  v8 = a4;
  v9 = self;
  sub_213AD5630(a3);
  swift_unknownObjectRelease();

}

- (_TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver)init
{
  _TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver *result;

  result = (_TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

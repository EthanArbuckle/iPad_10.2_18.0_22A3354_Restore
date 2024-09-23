@implementation LightLevelControllerWrapper

- (void)dealloc
{
  void *v2;
  _TtC5Books27LightLevelControllerWrapper *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books27LightLevelControllerWrapper_lightLevelController);
  v3 = self;
  objc_msgSend(v2, "removeObserver:", v3);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for LightLevelControllerWrapper();
  -[LightLevelControllerWrapper dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Books27LightLevelControllerWrapper_isLowLightSubject));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Books27LightLevelControllerWrapper_lightLevelController));
}

- (_TtC5Books27LightLevelControllerWrapper)init
{
  _TtC5Books27LightLevelControllerWrapper *result;

  result = (_TtC5Books27LightLevelControllerWrapper *)_swift_stdlib_reportUnimplementedInitializer("Books.LightLevelControllerWrapper", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

@end

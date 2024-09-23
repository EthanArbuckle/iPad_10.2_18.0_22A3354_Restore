@implementation InternalSettingsObserver

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  id v10;
  _TtC12PhotosUICore24InternalSettingsObserver *v11;

  v6 = sub_1A7AE3764();
  v8 = v7;
  v9 = *(void (**)(uint64_t, uint64_t))((char *)&self->super.isa
                                               + OBJC_IVAR____TtC12PhotosUICore24InternalSettingsObserver_changeHandler);
  v10 = a3;
  v11 = self;
  v9(v6, v8);

  swift_bridgeObjectRelease();
}

- (_TtC12PhotosUICore24InternalSettingsObserver)init
{
  _TtC12PhotosUICore24InternalSettingsObserver *result;

  result = (_TtC12PhotosUICore24InternalSettingsObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end

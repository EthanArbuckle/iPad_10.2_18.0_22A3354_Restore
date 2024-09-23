@implementation DNDModeConfigurationService.Listener

- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4
{
  void (*v4)(uint64_t);
  id v6;
  uint64_t v7;
  _TtCE11PosterBoardCSo27DNDModeConfigurationServiceP33_810B7575001E280934AD3AE501DC549F8Listener *v8;

  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCE11PosterBoardCSo27DNDModeConfigurationServiceP33_810B7575001E280934AD3AE501DC549F8Listener_onUpdate);
  if (v4)
  {
    v6 = a3;
    v8 = self;
    v7 = sub_1CBB0CDBC((uint64_t)v4);
    v4(v7);
    sub_1CBB08008((uint64_t)v4);

  }
}

- (_TtCE11PosterBoardCSo27DNDModeConfigurationServiceP33_810B7575001E280934AD3AE501DC549F8Listener)init
{
  _TtCE11PosterBoardCSo27DNDModeConfigurationServiceP33_810B7575001E280934AD3AE501DC549F8Listener *result;

  result = (_TtCE11PosterBoardCSo27DNDModeConfigurationServiceP33_810B7575001E280934AD3AE501DC549F8Listener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1CBB08008(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCE11PosterBoardCSo27DNDModeConfigurationServiceP33_810B7575001E280934AD3AE501DC549F8Listener_onUpdate));
}

@end

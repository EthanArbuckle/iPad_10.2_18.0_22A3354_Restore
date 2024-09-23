@implementation FindingSessionPresentationController

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _TtC10TVRemoteUI36FindingSessionPresentationController *v10;

  v4 = one-time initialization token for findingExperience;
  v5 = a3;
  v10 = self;
  if (v4 != -1)
    swift_once();
  v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Logger.findingExperience);
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21B042000, v7, v8, "presentationControllerDidDismiss", v9, 2u);
    MEMORY[0x22075D4E4](v9, -1, -1);
  }

  (*(void (**)(void))((char *)&v10->super.isa
                    + OBJC_IVAR____TtC10TVRemoteUI36FindingSessionPresentationController_didDismissHandler))();

}

- (_TtC10TVRemoteUI36FindingSessionPresentationController)init
{
  _TtC10TVRemoteUI36FindingSessionPresentationController *result;

  result = (_TtC10TVRemoteUI36FindingSessionPresentationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end

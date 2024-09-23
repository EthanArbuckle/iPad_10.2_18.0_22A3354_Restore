@implementation AudioTransportStream

- (void)dealloc
{
  _TtC16ScreenSharingKit20AudioTransportStream *v2;
  objc_super v3;

  v2 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574BB3E0);
  sub_245956490();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for AudioTransportStream();
  -[AudioTransportStream dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  sub_2458A4838(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit20AudioTransportStream_currentState));

  v3 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit20AudioTransportStream_stateStream;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574BB400);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit20AudioTransportStream_stateContinuation;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574BB3E0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

  v7 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit20AudioTransportStream_sessionID;
  v8 = sub_24595589C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

- (_TtC16ScreenSharingKit20AudioTransportStream)init
{
  _TtC16ScreenSharingKit20AudioTransportStream *result;

  result = (_TtC16ScreenSharingKit20AudioTransportStream *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)streamDidRTCPTimeOut:(id)a3
{
  id v5;
  _TtC16ScreenSharingKit20AudioTransportStream *v6;

  v5 = a3;
  v6 = self;
  sub_2458A43E0(a3);

}

- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  _TtC16ScreenSharingKit20AudioTransportStream *v9;
  id v10;

  v6 = a4;
  v8 = a3;
  v9 = self;
  v10 = a5;
  sub_2458A4F70(v6, a5);

}

- (void)streamDidStop:(id)a3
{
  uint64_t v4;
  _TtC16ScreenSharingKit20AudioTransportStream *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;

  v4 = qword_2574B8B20;
  v10 = a3;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = sub_245955DDC();
  __swift_project_value_buffer(v6, (uint64_t)qword_2574D6C10);
  v7 = sub_245955DC4();
  v8 = sub_2459565F8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_24586D000, v7, v8, "Audio stream streamDidStop", v9, 2u);
    MEMORY[0x24953F260](v9, -1, -1);
  }

}

@end

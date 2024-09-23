@implementation LIDDisambiguationView.Coordinator

- (void)cancelConfirmation
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v7;
  _TtCV17SequoiaTranslator21LIDDisambiguationView11Coordinator *v8;
  uint64_t v9;

  v3 = sub_100006DF4((uint64_t *)&unk_10028FE50);
  __chkstk_darwin(v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))((char *)&self->super.isa
                                     + OBJC_IVAR____TtCV17SequoiaTranslator21LIDDisambiguationView11Coordinator_onDismiss);
  v7 = type metadata accessor for Locale(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5, 1, 1, v7);
  v8 = self;
  v6(v5);
  sub_1000A8C7C((uint64_t)v5);

}

- (void)lidConfirmedWithLocale:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *);
  _TtCV17SequoiaTranslator21LIDDisambiguationView11Coordinator *v13;
  uint64_t v14;

  v5 = sub_100006DF4((uint64_t *)&unk_10028FE50);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Locale(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Locale._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = *(void (**)(char *))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCV17SequoiaTranslator21LIDDisambiguationView11Coordinator_onDismiss);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v7, v11, v8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  v13 = self;
  v12(v7);
  sub_1000A8C7C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (_TtCV17SequoiaTranslator21LIDDisambiguationView11Coordinator)init
{
  _TtCV17SequoiaTranslator21LIDDisambiguationView11Coordinator *result;

  result = (_TtCV17SequoiaTranslator21LIDDisambiguationView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.Coordinator", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->onDismiss[OBJC_IVAR____TtCV17SequoiaTranslator21LIDDisambiguationView11Coordinator_onDismiss]);
}

@end

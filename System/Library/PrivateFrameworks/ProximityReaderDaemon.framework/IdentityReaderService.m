@implementation IdentityReaderService

- (void)dealloc
{
  _TtC21ProximityReaderDaemon21IdentityReaderService *v2;

  v2 = self;
  sub_244E25118();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_entitlements;
  v4 = sub_244E4CEA0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_uiManager));
  sub_244DB4E08(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_startReader));
  sub_244DB4E08(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_readerReadyListener));
  sub_244DB4E08(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_prepareTask));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_prepareError));
  sub_244DB4E08(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_prepareHandler));
  swift_release();
  sub_244DB4E08(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_readDocumentTask));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_readError));
  sub_244DB4E08(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_dataRequestHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_dataRequestResponse));
  sub_244DB4E08(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_rawDataRequestHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_rawDataRequestResponse));
  sub_244DB4E08(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_displayRequestHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_displayRequestResponse));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_244D66F54((uint64_t)self + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_analyticsTransaction, &qword_257419540);
}

- (_TtC21ProximityReaderDaemon21IdentityReaderService)init
{
  _TtC21ProximityReaderDaemon21IdentityReaderService *result;

  result = (_TtC21ProximityReaderDaemon21IdentityReaderService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)readerConfigurationWithCompletion:(id)a3
{
  sub_244DF7BD8(self, (int)a2, a3, (void (*)(void))sub_244E31DE4);
}

- (void)prepareUsing:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  _TtC21ProximityReaderDaemon21IdentityReaderService *v9;

  v6 = _Block_copy(a4);
  if (a3)
  {
    v7 = sub_244E4E31C();
    a3 = v8;
  }
  else
  {
    v7 = 0;
  }
  _Block_copy(v6);
  v9 = self;
  sub_244E32340(v7, (unint64_t)a3, (char *)v9, v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)performRawDataRequest:(id)a3 completion:(id)a4
{
  sub_244E2DD00(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_244E32924);
}

- (void)performDataRequest:(id)a3 completion:(id)a4
{
  sub_244E2DD00(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_244E32E9C);
}

- (void)performDisplayRequest:(id)a3 completion:(id)a4
{
  sub_244E2DD00(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_244E33414);
}

- (void)cancelReadWithCompletion:(id)a3
{
  sub_244DF7BD8(self, (int)a2, a3, (void (*)(void))sub_244E30ADC);
}

- (void)identityUIDidLoad
{
  _TtC21ProximityReaderDaemon21IdentityReaderService *v2;

  v2 = self;
  sub_244E22A04();

}

- (void)identityUIFinished
{
  _TtC21ProximityReaderDaemon21IdentityReaderService *v2;

  v2 = self;
  sub_244E22ECC();

}

- (void)requestCancelReadWithIsEngagementTransition:(BOOL)a3
{
  _BOOL4 v3;
  _TtC21ProximityReaderDaemon21IdentityReaderService *v4;

  v3 = a3;
  v4 = self;
  sub_244E2304C(v3);

}

- (void)requestRestartReadWithTriggeredByMultipleCheck:(BOOL)a3
{
  _BOOL4 v3;
  _TtC21ProximityReaderDaemon21IdentityReaderService *v4;

  v3 = a3;
  v4 = self;
  sub_244E236BC(v3);

}

- (void)readDocumentFromScannedQRCodeWithPayload:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _TtC21ProximityReaderDaemon21IdentityReaderService *v8;

  v4 = a3;
  v8 = self;
  v5 = sub_244E4C324();
  v7 = v6;

  sub_244E23478(v5, v7);
  sub_244D651AC(v5, v7);

}

- (void)notifyUIButtonTapWithButton:(int64_t)a3
{
  _TtC21ProximityReaderDaemon21IdentityReaderService *v4;

  v4 = self;
  sub_244E23AFC(a3);

}

- (void)cancelRegistration
{
  _TtC21ProximityReaderDaemon21IdentityReaderService *v2;

  v2 = self;
  sub_244E245F4();

}

- (void)registerWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC21ProximityReaderDaemon21IdentityReaderService *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_244E24260((uint64_t)sub_244E3056C, v5);

  swift_release();
}

- (void)identityRegUIFinished
{
  _TtC21ProximityReaderDaemon21IdentityReaderService *v2;

  v2 = self;
  sub_244E227A0();

}

- (uint64_t)identityRegUIDidLoad
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v14;

  v0 = sub_244E4C714();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574145A0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_257414440 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v4, (uint64_t)qword_257419EC0);
  sub_244D91E3C(v7, (uint64_t)v6, &qword_2574145A0);
  v8 = sub_244E4DCD4();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) == 1)
  {
    sub_244D66F54((uint64_t)v6, &qword_2574145A0);
  }
  else
  {
    v10 = sub_244E4DCBC();
    v11 = sub_244E4E688();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_244D61000, v10, v11, "Identity registration UI is visible", v12, 2u);
      MEMORY[0x2495283BC](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  sub_244E4C66C();
  sub_244E4C6A8();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

- (void)qrCodeScanInitiated
{
  _TtC21ProximityReaderDaemon21IdentityReaderService *v2;

  v2 = self;
  sub_244E34E68();

}

- (void)qrCodeScanErrorWithError:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC21ProximityReaderDaemon21IdentityReaderService *v7;

  v4 = sub_244E4E31C();
  v6 = v5;
  v7 = self;
  sub_244E350C0(v4, v6);

  swift_bridgeObjectRelease();
}

@end

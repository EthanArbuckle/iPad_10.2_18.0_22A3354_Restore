@implementation PaymentTerminalService

- (void)dealloc
{
  _TtC21ProximityReaderDaemon22PaymentTerminalService *v2;

  v2 = self;
  sub_244DF1650();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityReaderDaemon22PaymentTerminalService_connection));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityReaderDaemon22PaymentTerminalService_uiManager));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21ProximityReaderDaemon22PaymentTerminalService_cardReaderAdapter);
  swift_release();
  swift_release();
  sub_244DB4E08(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon22PaymentTerminalService_transactionCompletion));
  swift_release();
  swift_release();
  sub_244DB4E08(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon22PaymentTerminalService_pinCompletion));
  swift_release();
  sub_244DB4E08(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon22PaymentTerminalService_registrationCompletion));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_244D66F54((uint64_t)self + OBJC_IVAR____TtC21ProximityReaderDaemon22PaymentTerminalService_finishedContinuation, &qword_257418B00);
  swift_release();
  sub_244D66F54((uint64_t)self + OBJC_IVAR____TtC21ProximityReaderDaemon22PaymentTerminalService_issuerPINContinuation, &qword_257418B00);
  swift_release();
  swift_release();
}

- (_TtC21ProximityReaderDaemon22PaymentTerminalService)init
{
  _TtC21ProximityReaderDaemon22PaymentTerminalService *result;

  result = (_TtC21ProximityReaderDaemon22PaymentTerminalService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)createContext:(id)a3 completion:(id)a4
{
  sub_244DF23D4(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_244DFE3D8);
}

- (void)getTerminalIdWithCompletion:(id)a3
{
  sub_244DF7BD8(self, (int)a2, a3, (void (*)(void))sub_244DFF14C);
}

- (void)isAccountLinked:(id)a3 completion:(id)a4
{
  sub_244DF23D4(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_244DFF88C);
}

- (void)linkAccount:(id)a3 relink:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC21ProximityReaderDaemon22PaymentTerminalService *v12;

  v5 = a4;
  v7 = _Block_copy(a5);
  v8 = sub_244E4E31C();
  v10 = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v7;
  v12 = self;
  sub_244DF2478(v8, v10, v5, (void (*)(_QWORD, void *))sub_244E025EC, v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)status:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  _TtC21ProximityReaderDaemon22PaymentTerminalService *v9;

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
  sub_244DFFC8C(v7, (uint64_t)a3, (uint64_t)v9, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)startSession:(id)a3 options:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC21ProximityReaderDaemon22PaymentTerminalService *v12;

  v7 = _Block_copy(a5);
  v8 = sub_244E4E31C();
  v10 = v9;
  _Block_copy(v7);
  v11 = a4;
  v12 = self;
  sub_244E003CC(v8, v10, v11, (uint64_t)v12, v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)closeSession:(BOOL)a3
{
  _BOOL4 v3;
  _TtC21ProximityReaderDaemon22PaymentTerminalService *v4;

  v3 = a3;
  v4 = self;
  sub_244DF4148(v3);

}

- (void)startTransaction:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  _TtC21ProximityReaderDaemon22PaymentTerminalService *v15;
  id v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257415740);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = sub_244E4E55C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = sub_244E02920;
  v13[7] = v11;
  v14 = a3;
  v15 = self;
  v16 = v14;
  swift_retain();
  *(Class *)((char *)&v15->super.isa
           + OBJC_IVAR____TtC21ProximityReaderDaemon22PaymentTerminalService_startTransactionTask) = (Class)sub_244DB2DDC((uint64_t)v9, (uint64_t)&unk_257418B50, (uint64_t)v13);

  swift_release();
  swift_release();
}

- (void)cancelTransactionWithCompletion:(id)a3
{
  sub_244DF7BD8(self, (int)a2, a3, (void (*)(void))sub_244E00CFC);
}

- (void)startIssuerPINEntry:(id)a3 transactionId:(id)a4 completion:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC21ProximityReaderDaemon22PaymentTerminalService *v14;

  v6 = _Block_copy(a5);
  v7 = sub_244E4E31C();
  v9 = v8;
  v10 = sub_244E4E31C();
  v12 = v11;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v6;
  v14 = self;
  sub_244DF843C(v7, v9, v10, v12, (uint64_t)sub_244E01A8C, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)tapUIDidLoad
{
  _TtC21ProximityReaderDaemon22PaymentTerminalService *v2;

  v2 = self;
  sub_244DFAA80();

}

- (void)tapUIRequestingRetry
{
  _TtC21ProximityReaderDaemon22PaymentTerminalService *v2;

  v2 = self;
  sub_244DFB178();

}

- (void)tapUIRequestingCancel
{
  _TtC21ProximityReaderDaemon22PaymentTerminalService *v2;

  v2 = self;
  sub_244DFB338();

}

- (void)tapUIFinishedWithExpected:(BOOL)a3 issuerPIN:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  _TtC21ProximityReaderDaemon22PaymentTerminalService *v6;

  v4 = a4;
  v5 = a3;
  v6 = self;
  sub_244DFB4D4(v5, v4);

}

- (void)pinValidateSession
{
  _TtC21ProximityReaderDaemon22PaymentTerminalService *v2;

  v2 = self;
  sub_244DFC7F8();

}

- (void)pinAuthNeeded
{
  _TtC21ProximityReaderDaemon22PaymentTerminalService *v2;

  v2 = self;
  sub_244DFCFD4();

}

- (void)pinAuthResultWithError:(id)a3 cancelsFlow:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC21ProximityReaderDaemon22PaymentTerminalService *v9;

  if (a3)
  {
    v6 = sub_244E4E31C();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = self;
  sub_244DFD1C4(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)pinDataReceivedWithPinData:(id)a3 isCardRequest:(BOOL)a4 isAccessibilityEnabled:(BOOL)a5 accessibilityEntryType:(int64_t)a6 drawNumberFailures:(int64_t)a7
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v12;
  _TtC21ProximityReaderDaemon22PaymentTerminalService *v13;

  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = self;
  sub_244DFD4B0(v12, v10, v9, a6, a7);

}

- (void)reportPINErrorWithError:(int64_t)a3 isCardRequest:(BOOL)a4 isAccessibilityEnabled:(BOOL)a5 accessibilityEntryType:(int64_t)a6 drawNumberFailures:(int64_t)a7
{
  _BOOL4 v10;
  _TtC21ProximityReaderDaemon22PaymentTerminalService *v12;

  v10 = a4;
  v12 = self;
  sub_244DFD828(a3, v10, a5, a6, a7);

}

- (void)reportGuidanceUpdateWithVisible:(BOOL)a3 trigger:(id)a4
{
  _BOOL8 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC21ProximityReaderDaemon22PaymentTerminalService *v9;

  v4 = a3;
  v6 = sub_244E4E31C();
  v8 = v7;
  v9 = self;
  sub_244DFDAC8(v4, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)reportProxEventInRange:(BOOL)a3 inRangeTime:(unsigned int)a4
{
  _BOOL8 v5;
  _TtC21ProximityReaderDaemon22PaymentTerminalService *v6;

  v5 = a3;
  v6 = self;
  sub_244DFDBDC(v5, a4);

}

- (void)setVoiceOverWithEnabled:(BOOL)a3
{
  sub_244E01290(a3);
}

- (uint64_t)pinUIDidLoad
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574145A0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2574143D8 != -1)
    swift_once();
  v3 = __swift_project_value_buffer(v0, (uint64_t)qword_257419D88);
  sub_244D91E3C(v3, (uint64_t)v2, &qword_2574145A0);
  v4 = sub_244E4DCD4();
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v4) == 1)
    return sub_244D66F54((uint64_t)v2, &qword_2574145A0);
  v7 = sub_244E4DCBC();
  v8 = sub_244E4E670();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_244D61000, v7, v8, "pinUIDidLoad", v9, 2u);
    MEMORY[0x2495283BC](v9, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v2, v4);
}

@end

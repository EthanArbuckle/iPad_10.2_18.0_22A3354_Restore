@implementation PMOtpauthQRCodeScannerView.Coordinator

- (void)QRCodeScannerViewController:(id)a3 didScanQRCodeWithURLValue:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void (*v10)(char *);
  id v11;
  _TtCV17PasswordManagerUI26PMOtpauthQRCodeScannerView11Coordinator *v12;
  uint64_t v13;

  v6 = sub_24384D720();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24384D6F0();
  v10 = *(void (**)(char *))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCV17PasswordManagerUI26PMOtpauthQRCodeScannerView11Coordinator_completion);
  v11 = a3;
  v12 = self;
  swift_retain();
  v10(v9);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtCV17PasswordManagerUI26PMOtpauthQRCodeScannerView11Coordinator)init
{
  _TtCV17PasswordManagerUI26PMOtpauthQRCodeScannerView11Coordinator *result;

  result = (_TtCV17PasswordManagerUI26PMOtpauthQRCodeScannerView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end

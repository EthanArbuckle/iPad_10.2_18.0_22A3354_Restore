@implementation PASUICDPEnrollmentObserver

- (void)dealloc
{
  _TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver *v2;
  objc_super v3;

  v2 = self;
  sub_220D94AC8();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for PASUICDPEnrollmentObserver();
  -[PASUICDPEnrollmentObserver dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_notificationCenter));
  swift_bridgeObjectRelease();
  sub_220D671D8((uint64_t)self + OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_delegate);
}

- (_TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver)init
{
  _TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver *result;

  result = (_TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)uiController:(id)a3 prepareAlertContext:(id)a4
{
  void *v6;
  id v7;
  _TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_220D94EC8((uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)uiController:(id)a3 preparePresentationContext:(id)a4
{
  void *v6;
  id v7;
  _TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_220D94FD8((uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (uint64_t)uiController:didPresentRootViewController:
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v9;

  v0 = sub_220D98C98();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_220D98C8C();
  v6 = sub_220D99484();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_220D57000, v5, v6, "PASUICDPEnrollmentObserver uiController(_:didPresentRootViewController:)", v7, 2u);
    MEMORY[0x2276657E4](v7, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

@end

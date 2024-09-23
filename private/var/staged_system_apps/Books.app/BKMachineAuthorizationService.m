@implementation BKMachineAuthorizationService

+ (void)requestAuthorizeWithAccount:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  void *v12;
  _QWORD *v13;
  _QWORD v14[5];
  _QWORD *v15;

  v5 = _Block_copy(a4);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = swift_allocObject(&unk_100904BB0, 24, 7);
  *(_QWORD *)(v9 + 16) = v5;
  v10 = objc_msgSend((id)objc_opt_self(BKAppDelegate), "sceneManager");
  v11 = (_QWORD *)swift_allocObject(&unk_100904BD8, 48, 7);
  v11[2] = v6;
  v11[3] = v8;
  v11[4] = sub_10040C8B0;
  v11[5] = v9;
  v14[4] = sub_10040C89C;
  v15 = v11;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_1001EDBF0;
  v14[3] = &unk_100904BF0;
  v12 = _Block_copy(v14);
  v13 = v15;
  swift_bridgeObjectRetain(v8);
  swift_retain(v9);
  objc_msgSend(v10, "requestPrimaryScene:", v12, swift_release(v13).n128_f64[0]);
  _Block_release(v12);
  swift_bridgeObjectRelease(v8);
  swift_release(v9);

}

+ (void)requestKeybagRefetchWithDsid:(unint64_t)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  _QWORD v11[5];
  _QWORD *v12;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject(&unk_100904B38, 24, 7);
  *(_QWORD *)(v6 + 16) = v5;
  v7 = objc_msgSend((id)objc_opt_self(BKAppDelegate), "sceneManager");
  v8 = (_QWORD *)swift_allocObject(&unk_100904B60, 40, 7);
  v8[2] = a3;
  v8[3] = sub_10040C838;
  v8[4] = v6;
  v11[4] = sub_10040C864;
  v12 = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_1001EDBF0;
  v11[3] = &unk_100904B78;
  v9 = _Block_copy(v11);
  v10 = v12;
  swift_retain(v6);
  objc_msgSend(v7, "requestPrimaryScene:", v9, swift_release(v10).n128_f64[0]);
  _Block_release(v9);
  swift_release(v6);

}

- (BKMachineAuthorizationService)init
{
  return (BKMachineAuthorizationService *)sub_10040BC50();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___BKMachineAuthorizationService_presentingViewController);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___BKMachineAuthorizationService_completionsByDSID));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___BKMachineAuthorizationService_completionsByAccountName));
  v3 = (char *)self + OBJC_IVAR___BKMachineAuthorizationService_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  BKMachineAuthorizationService *v11;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_100904868, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  sub_100059BB4();
  v8 = swift_allocObject(&unk_100904890, 24, 7);
  swift_unknownObjectWeakInit(v8 + 16);
  v9 = (_QWORD *)swift_allocObject(&unk_1009048B8, 48, 7);
  v9[2] = v8;
  v9[3] = a3;
  v9[4] = sub_10040C8A8;
  v9[5] = v7;
  v10 = a3;
  v11 = self;
  swift_retain(v8);
  swift_retain(v7);
  static OS_dispatch_queue.dispatchAsyncOnMainIfNeeded(block:)(sub_10040C6C0, v9);

  swift_release(v7);
  swift_release(v8);
  swift_release(v9);
}

- (void)handleDialogRequest:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  BKMachineAuthorizationService *v10;
  id v11;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1009047F0, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  sub_100059BB4();
  v8 = (_QWORD *)swift_allocObject(&unk_100904818, 48, 7);
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_10040C610;
  v8[5] = v7;
  v9 = a3;
  v10 = self;
  v11 = v9;
  swift_retain(v7);
  static OS_dispatch_queue.dispatchAsyncOnMainIfNeeded(block:)(sub_10040C65C, v8);

  swift_release(v7);
  swift_release(v8);
}

@end

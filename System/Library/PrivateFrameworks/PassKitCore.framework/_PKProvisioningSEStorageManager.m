@implementation _PKProvisioningSEStorageManager

- (_PKProvisioningSEStorageManager)init
{
  id v4;
  _PKProvisioningSEStorageManager *v5;

  if (PKRunningInPassd())
    return -[_PKProvisioningSEStorageManager initWithWebService:](self, sel_initWithWebService_, 0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_sharedService);
  v5 = -[_PKProvisioningSEStorageManager initWithWebService:](self, sel_initWithWebService_, v4);

  return v5;
}

- (_PKProvisioningSEStorageManager)initWithWebService:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _PKProvisioningSEStorageManager *v8;
  id v9;
  _PKProvisioningSEStorageManager *v10;
  objc_super v12;

  v5 = OBJC_IVAR____PKProvisioningSEStorageManager_secureElement;
  v6 = objc_allocWithZone((Class)PKSecureElement);
  v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____PKProvisioningSEStorageManager_webService) = (Class)a3;
  v9 = v7;

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for ProvisioningSEStorageManager();
  v10 = -[_PKProvisioningSEStorageManager init](&v12, sel_init);

  return v10;
}

- (void).cxx_destruct
{

}

- (void)reserveStorageFor:(id)a3 metadata:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  _PKProvisioningSEStorageManager *v9;

  v7 = _Block_copy(a5);
  v8 = sub_1903D0784();
  if (a4)
    a4 = (id)sub_1903D04E4();
  _Block_copy(v7);
  v9 = self;
  sub_18FDACCF4(v8, (uint64_t)a4, v9, v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)deleteWithReservation:(id)a3 completion:(id)a4
{
  void (*v5)(void);
  uint64_t v6;
  uint64_t v7;
  _PKProvisioningSEStorageManager *v8;

  v5 = (void (*)(void))_Block_copy(a4);
  sub_1903D0250();
  v6 = sub_1903D0784();
  if (v5)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v5;
    v5 = (void (*)(void))sub_18FDB0158;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  ProvisioningSEStorageManager.delete(reservation:completion:)(v6, v5, v7);
  sub_18FD4A1C4((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)currentSnapshotWithCompletion:(id)a3
{
  sub_18FDA7808(self, (int)a2, a3, (void (*)(void))sub_18FDACE90);
}

- (void)deleteExpiredReservationsWithCompletion:(id)a3
{
  void *v4;
  _PKProvisioningSEStorageManager *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_18FDAD1B4(1, 2, (char *)v5, (void (**)(_QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)debugReservationDescriptionsWithCompletion:(id)a3
{
  sub_18FDA7808(self, (int)a2, a3, (void (*)(void))sub_18FDAD414);
}

- (void)performDebugSECleanupWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _PKProvisioningSEStorageManager *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_18FDADB88(0, 0, (char *)v6, (void (*)(uint64_t))sub_18FDADEF8, v5);

  swift_release();
}

@end

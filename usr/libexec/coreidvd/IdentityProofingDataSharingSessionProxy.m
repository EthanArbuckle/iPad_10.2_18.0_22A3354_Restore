@implementation IdentityProofingDataSharingSessionProxy

- (void)fetchUserConsentWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1006080D8, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100608100, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100634BC8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100608128, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100634BD0;
  v12[5] = v11;
  swift_retain(self);
  v13 = sub_1004B685C((uint64_t)v7, (uint64_t)&unk_100634BD8, (uint64_t)v12);
  swift_release(v13);
}

- (void)didChangeUserConsent:(int64_t)a3 completion:(id)a4
{
  void *v6;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  swift_retain(self);
  sub_1000FE4F0(a3, (uint64_t)self, v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_release(self);
}

- (void)checkUserConsentWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100608060, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100608088, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100634BA8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1006080B0, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100634BB0;
  v12[5] = v11;
  swift_retain(self);
  v13 = sub_1004B685C((uint64_t)v7, (uint64_t)&unk_100631240, (uint64_t)v12);
  swift_release(v13);
}

@end

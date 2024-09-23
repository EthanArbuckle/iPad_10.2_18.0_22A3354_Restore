@implementation LocalFindableLostModeDetectionService

- (void)systemOnboardingStartedWithCompletionHandler:(id)a3
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

  v5 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_101084EE0, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_101084F08, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_101102CF0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_101084F30, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_101102CF8;
  v12[5] = v11;
  swift_retain();
  sub_100665F70((uint64_t)v7, (uint64_t)&unk_101102D00, (uint64_t)v12);
  swift_release();
}

- (void)systemOnboardingEndedWithCompletionHandler:(id)a3
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

  v5 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_101084E40, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_101084E68, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_101102CC0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_101084E90, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1010FF840;
  v12[5] = v11;
  swift_retain();
  sub_100665F70((uint64_t)v7, (uint64_t)&unk_1010FF848, (uint64_t)v12);
  swift_release();
}

@end

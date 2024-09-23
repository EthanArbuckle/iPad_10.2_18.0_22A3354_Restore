@implementation AEAPolicyDeactivationRunner

- (BOOL)isFailable
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  char v6;

  v3 = *(_QWORD *)&self->deactivation[24];
  v4 = *(_QWORD *)&self->deactivation[32];
  sub_1000060F4(self->deactivation, v3);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 16);
  swift_retain(self);
  v6 = v5(v3, v4);
  swift_release(self);
  return v6 & 1;
}

- (void)deactivateWithCompletion:(id)a3
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

  v5 = sub_100004D20(&qword_100091B00);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100085090, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1000850B8, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100091B10;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1000850E0, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100091B20;
  v12[5] = v11;
  swift_retain(self);
  v13 = sub_100037BB0((uint64_t)v7, (uint64_t)&unk_100091B30, (uint64_t)v12);
  swift_release(v13);
}

@end

@implementation IdentityProofingSessionProxy

- (void)cancelProofingWithState:(NSString *)a3 country:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  NSString *v18;
  uint64_t v19;
  uint64_t v20;

  v9 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_100604FE0, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_100605008, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100631230;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_100605030, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100634BB0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain(self);
  v19 = sub_1004B685C((uint64_t)v11, (uint64_t)&unk_100631240, (uint64_t)v16);
  swift_release(v19);
}

@end

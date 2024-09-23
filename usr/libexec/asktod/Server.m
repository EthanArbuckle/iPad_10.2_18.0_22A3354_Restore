@implementation Server

- (void)sendWithQuestion:(_TtC5AskTo10ATQuestion *)a3 to:(signed __int16)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _TtC5AskTo10ATQuestion *v17;
  uint64_t v18;
  uint64_t v19;

  v9 = sub_100005FF0(&qword_100042990);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject(&unk_10003D650, 48, 7);
  *(_QWORD *)(v13 + 16) = a3;
  *(_WORD *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_10003D678, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100041F88;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_10003D6A0, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100041F90;
  v16[5] = v15;
  v17 = a3;
  swift_retain(self);
  v18 = sub_10000CC7C((uint64_t)v11, (uint64_t)&unk_100041F98, (uint64_t)v16);
  swift_release(v18);
}

- (void)sendResponse:(_TtC9AskToCore9ATPayload *)a3 to:(NSArray *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _TtC9AskToCore9ATPayload *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;

  v9 = sub_100005FF0(&qword_100042990);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_10003D5D8, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_10003D600, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100041F50;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_10003D628, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100041F58;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain(self);
  v19 = sub_10000CC7C((uint64_t)v11, (uint64_t)&unk_100041F60, (uint64_t)v16);
  swift_release(v19);
}

- (void)screenTimeDidReceiveAnswer:(_TtC5AskTo14ATAnswerChoice *)a3 forRequestWithID:(NSString *)a4 responderDSID:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _TtC5AskTo14ATAnswerChoice *v19;
  NSString *v20;
  NSString *v21;
  uint64_t v22;
  uint64_t v23;

  v11 = sub_100005FF0(&qword_100042990);
  __chkstk_darwin(v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject(&unk_10003D538, 56, 7);
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject(&unk_10003D560, 48, 7);
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100041F08;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject(&unk_10003D588, 48, 7);
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_100041F18;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  swift_retain(self);
  v22 = sub_10000CC7C((uint64_t)v13, (uint64_t)&unk_100041F28, (uint64_t)v18);
  swift_release(v22);
}

@end

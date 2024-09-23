@implementation ServerEvaluationStatusMapsSync

+ (_TtC4Maps30ServerEvaluationStatusMapsSync)shared
{
  if (qword_101491058 != -1)
    swift_once(&qword_101491058, sub_1001996A4);
  return (_TtC4Maps30ServerEvaluationStatusMapsSync *)(id)qword_1014D4EF8;
}

- (_TtC4Maps30ServerEvaluationStatusMapsSync)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ServerEvaluationStatusMapsSync();
  return -[ServerEvaluationStatusMapsSync init](&v3, "init");
}

- (void)setARPStatusWithIsBlocked:(BOOL)a3 isTrusted:(BOOL)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _TtC4Maps30ServerEvaluationStatusMapsSync *v16;
  uint64_t v17;

  v9 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  if (v12)
  {
    v13 = swift_allocObject(&unk_1011A7F68, 24, 7);
    *(_QWORD *)(v13 + 16) = v12;
    v12 = sub_10019B44C;
  }
  else
  {
    v13 = 0;
  }
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = swift_allocObject(&unk_1011A7F40, 58, 7);
  *(_QWORD *)(v15 + 16) = 0;
  *(_QWORD *)(v15 + 24) = 0;
  *(_QWORD *)(v15 + 32) = self;
  *(_QWORD *)(v15 + 40) = v12;
  *(_QWORD *)(v15 + 48) = v13;
  *(_BYTE *)(v15 + 56) = a3;
  *(_BYTE *)(v15 + 57) = a4;
  v16 = self;
  sub_10000C128((uint64_t)v12, v13);
  sub_1001B0C08((uint64_t)v11, (uint64_t)&unk_10149E7F0, v15);
  swift_release();
  sub_10000BF74((uint64_t)v12, v13);

}

- (void)fetchARPStatusWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _TtC4Maps30ServerEvaluationStatusMapsSync *v12;
  uint64_t v13;

  v5 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  if (v8)
  {
    v9 = swift_allocObject(&unk_1011A7F18, 24, 7);
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_10019B45C;
  }
  else
  {
    v9 = 0;
  }
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1011A7EF0, 56, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = v8;
  v11[6] = v9;
  v12 = self;
  sub_10000C128((uint64_t)v8, v9);
  sub_1001B0C08((uint64_t)v7, (uint64_t)&unk_10149E7E0, (uint64_t)v11);
  swift_release();
  sub_10000BF74((uint64_t)v8, v9);

}

- (void)setRAPStatusWithIsBlocked:(BOOL)a3 isTrusted:(BOOL)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _TtC4Maps30ServerEvaluationStatusMapsSync *v16;
  uint64_t v17;

  v9 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  if (v12)
  {
    v13 = swift_allocObject(&unk_1011A7EC8, 24, 7);
    *(_QWORD *)(v13 + 16) = v12;
    v12 = sub_100016024;
  }
  else
  {
    v13 = 0;
  }
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = swift_allocObject(&unk_1011A7EA0, 58, 7);
  *(_QWORD *)(v15 + 16) = 0;
  *(_QWORD *)(v15 + 24) = 0;
  *(_QWORD *)(v15 + 32) = self;
  *(_QWORD *)(v15 + 40) = v12;
  *(_QWORD *)(v15 + 48) = v13;
  *(_BYTE *)(v15 + 56) = a3;
  *(_BYTE *)(v15 + 57) = a4;
  v16 = self;
  sub_10000C128((uint64_t)v12, v13);
  sub_1001B0C08((uint64_t)v11, (uint64_t)&unk_10149E7D0, v15);
  swift_release();
  sub_10000BF74((uint64_t)v12, v13);

}

- (void)fetchRAPStatusWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _TtC4Maps30ServerEvaluationStatusMapsSync *v12;
  uint64_t v13;

  v5 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  if (v8)
  {
    v9 = swift_allocObject(&unk_1011A7E78, 24, 7);
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_10019A768;
  }
  else
  {
    v9 = 0;
  }
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1011A7E50, 56, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = v8;
  v11[6] = v9;
  v12 = self;
  sub_10000C128((uint64_t)v8, v9);
  sub_1001B0C08((uint64_t)v7, (uint64_t)&unk_10149E7B0, (uint64_t)v11);
  swift_release();
  sub_10000BF74((uint64_t)v8, v9);

}

@end

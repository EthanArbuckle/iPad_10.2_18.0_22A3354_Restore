@implementation RDStatusSharer

- (_TtC8countryd14RDStatusSharer)init
{
  return (_TtC8countryd14RDStatusSharer *)sub_100005960();
}

- (void)shareStatusWithEstimate:(RDEstimate *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  RDEstimate *v15;
  _TtC8countryd14RDStatusSharer *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100005084(&qword_100019300);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100014900, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100014928, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100019358;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100014950, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100019360;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_100008B34((uint64_t)v9, (uint64_t)&unk_100019368, (uint64_t)v14);
  swift_release(v17);
}

- (void)shareStatusesWithEstimates:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSArray *v15;
  _TtC8countryd14RDStatusSharer *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100005084(&qword_100019300);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100014860, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100014888, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100019310;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_1000148B0, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100019320;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_100008B34((uint64_t)v9, (uint64_t)&unk_100019330, (uint64_t)v14);
  swift_release(v17);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8countryd14RDStatusSharer_statusClient));
  sub_10000AF90((uint64_t)self + OBJC_IVAR____TtC8countryd14RDStatusSharer_options, &qword_1000191A8);
  sub_10000AF90((uint64_t)self + OBJC_IVAR____TtC8countryd14RDStatusSharer_statusKey, &qword_1000191B8);
  sub_10000AF90((uint64_t)self + OBJC_IVAR____TtC8countryd14RDStatusSharer_statusesKey, &qword_1000191C8);
}

@end

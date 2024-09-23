@implementation SERServerHelperToConformToSERProtocol

- (void)getStateWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100063D3C(&qword_100346898);
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject(&unk_1003092D0, 32, 7);
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = self;
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject(&unk_1003092F8, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1003469F0;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject(&unk_100309320, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1003469F8;
  v13[5] = v12;
  swift_retain(self);
  v14 = sub_1000F8F44((uint64_t)v8, (uint64_t)&unk_100346A00, (uint64_t)v13);
  swift_release(v14);
}

- (void)addReservationWithType:(NSString *)a3 metadata:(NSData *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  NSString *v18;
  NSData *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_100063D3C(&qword_100346898);
  __chkstk_darwin(v9, v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = (_QWORD *)swift_allocObject(&unk_100309258, 48, 7);
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = v13;
  v14[5] = self;
  v15 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject(&unk_100309280, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1003469C0;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject(&unk_1003092A8, 48, 7);
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1003469C8;
  v17[5] = v16;
  v18 = a3;
  v19 = a4;
  swift_retain(self);
  v20 = sub_1000F8F44((uint64_t)v12, (uint64_t)&unk_1003469D0, (uint64_t)v17);
  swift_release(v20);
}

- (void)editReservationWithUuid:(NSUUID *)a3 metadata:(NSData *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  NSUUID *v18;
  NSData *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_100063D3C(&qword_100346898);
  __chkstk_darwin(v9, v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = (_QWORD *)swift_allocObject(&unk_1003091E0, 48, 7);
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = v13;
  v14[5] = self;
  v15 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject(&unk_100309208, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100346998;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject(&unk_100309230, 48, 7);
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1003469A0;
  v17[5] = v16;
  v18 = a3;
  v19 = a4;
  swift_retain(self);
  v20 = sub_1000F8F44((uint64_t)v12, (uint64_t)&unk_1003469A8, (uint64_t)v17);
  swift_release(v20);
}

- (void)findReservationWithUuid:(NSUUID *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  NSUUID *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100063D3C(&qword_100346898);
  __chkstk_darwin(v7, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (_QWORD *)swift_allocObject(&unk_100309168, 40, 7);
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  v13 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject(&unk_100309190, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100346970;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject(&unk_1003091B8, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100346978;
  v15[5] = v14;
  v16 = a3;
  swift_retain(self);
  v17 = sub_1000F8F44((uint64_t)v10, (uint64_t)&unk_100346980, (uint64_t)v15);
  swift_release(v17);
}

- (void)removeReservationWithUuid:(NSUUID *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  NSUUID *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100063D3C(&qword_100346898);
  __chkstk_darwin(v7, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (_QWORD *)swift_allocObject(&unk_1003090F0, 40, 7);
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  v13 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject(&unk_100309118, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100346948;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject(&unk_100309140, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100346950;
  v15[5] = v14;
  v16 = a3;
  swift_retain(self);
  v17 = sub_1000F8F44((uint64_t)v10, (uint64_t)&unk_100346958, (uint64_t)v15);
  swift_release(v17);
}

- (void)reservationsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100063D3C(&qword_100346898);
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject(&unk_100309078, 32, 7);
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = self;
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject(&unk_1003090A0, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100346910;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject(&unk_1003090C8, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100346918;
  v13[5] = v12;
  swift_retain(self);
  v14 = sub_1000F8F44((uint64_t)v8, (uint64_t)&unk_100346920, (uint64_t)v13);
  swift_release(v14);
}

- (void)clearReservationsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100063D3C(&qword_100346898);
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject(&unk_100309000, 32, 7);
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = self;
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject(&unk_100309028, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1003468E8;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject(&unk_100309050, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1003468F0;
  v13[5] = v12;
  swift_retain(self);
  v14 = sub_1000F8F44((uint64_t)v8, (uint64_t)&unk_1003468F8, (uint64_t)v13);
  swift_release(v14);
}

- (void)getDeviceCapabilityWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100063D3C(&qword_100346898);
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject(&unk_100308F60, 32, 7);
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = self;
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject(&unk_100308F88, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1003468A8;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject(&unk_100308FB0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1003468B8;
  v13[5] = v12;
  swift_retain(self);
  v14 = sub_1000F8F44((uint64_t)v8, (uint64_t)&unk_1003468C8, (uint64_t)v13);
  swift_release(v14);
}

@end

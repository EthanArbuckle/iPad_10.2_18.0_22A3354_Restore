@implementation XPCConnection

- (void)recordEventWithStarting:(BOOL)a3 useCase:(unsigned int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  uint64_t (*v6)(void);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC14bluetoothuserd13XPCConnection *v12;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = *(uint64_t (**)(void))((**(_QWORD **)((char *)&self->super.isa
                                          + OBJC_IVAR____TtC14bluetoothuserd13XPCConnection_listener) & swift_isaMask)
                           + 0x70);
  v12 = self;
  v7 = v6();
  if (v7)
  {
    v8 = v7;
    v9 = (*(uint64_t (**)(void))(*(_QWORD *)v7 + 520))();
    if (v9)
    {
      v10 = v9;
      (*(void (**)(_BOOL8, uint64_t))(*(_QWORD *)v9 + 224))(v5, v4);

      swift_release(v8);
      v11 = v10;
    }
    else
    {

      v11 = v8;
    }
    swift_release(v11);
  }
  else
  {

  }
}

- (_TtC14bluetoothuserd13XPCConnection)init
{
  _TtC14bluetoothuserd13XPCConnection *result;

  result = (_TtC14bluetoothuserd13XPCConnection *)_swift_stdlib_reportUnimplementedInitializer("bluetoothuserd.XPCConnection", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

- (void)diagnosticShow:(NSDictionary *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSDictionary *v15;
  _TtC14bluetoothuserd13XPCConnection *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_10000215C(&qword_10007C620);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100074278, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_1000742A0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10007C138;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_1000742C8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10007C140;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_10004E540((uint64_t)v9, (uint64_t)&unk_10007C148, (uint64_t)v14);
  swift_release(v17);
}

- (void)getCloudPairedDevicesWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC14bluetoothuserd13XPCConnection *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_10000215C(&qword_10007C620);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100074200, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100074228, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10007C118;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100074250, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10007C120;
  v12[5] = v11;
  v13 = self;
  v14 = sub_10004E540((uint64_t)v7, (uint64_t)&unk_10007C128, (uint64_t)v12);
  swift_release(v14);
}

- (void)deleteControllerInfoForDevice:(CBDevice *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  CBDevice *v15;
  _TtC14bluetoothuserd13XPCConnection *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_10000215C(&qword_10007C620);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100074188, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_1000741B0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10007C0F8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_1000741D8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10007C100;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_10004E540((uint64_t)v9, (uint64_t)&unk_10007C108, (uint64_t)v14);
  swift_release(v17);
}

- (void)storeControllerInfo:(CBControllerInfo *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  CBControllerInfo *v15;
  _TtC14bluetoothuserd13XPCConnection *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_10000215C(&qword_10007C620);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100074110, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100074138, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10007C0D8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100074160, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10007C0E0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_10004E540((uint64_t)v9, (uint64_t)&unk_10007C0E8, (uint64_t)v14);
  swift_release(v17);
}

- (void)getControllerInfoForDevice:(CBDevice *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  CBDevice *v15;
  _TtC14bluetoothuserd13XPCConnection *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_10000215C(&qword_10007C620);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100074098, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_1000740C0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10007C0B8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_1000740E8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10007C0C0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_10004E540((uint64_t)v9, (uint64_t)&unk_10007C0C8, (uint64_t)v14);
  swift_release(v17);
}

- (void)getDistributedLoggingStatusWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC14bluetoothuserd13XPCConnection *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_10000215C(&qword_10007C620);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100074020, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100074048, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10007C098;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100074070, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10007C0A0;
  v12[5] = v11;
  v13 = self;
  v14 = sub_10004E540((uint64_t)v7, (uint64_t)&unk_10007C0A8, (uint64_t)v12);
  swift_release(v14);
}

- (void)setDistributedLoggingStatus:(unsigned int)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC14bluetoothuserd13XPCConnection *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_10000215C(&qword_10007C620);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject(&unk_100073FA8, 40, 7);
  *(_DWORD *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100073FD0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10007C078;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100073FF8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10007C080;
  v14[5] = v13;
  v15 = self;
  v16 = sub_10004E540((uint64_t)v9, (uint64_t)&unk_10007C088, (uint64_t)v14);
  swift_release(v16);
}

- (void)appleAudioAccessoryLimitedLoggingWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC14bluetoothuserd13XPCConnection *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_10000215C(&qword_10007C620);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100073F30, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100073F58, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10007C058;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100073F80, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10007C060;
  v12[5] = v11;
  v13 = self;
  v14 = sub_10004E540((uint64_t)v7, (uint64_t)&unk_10007C068, (uint64_t)v12);
  swift_release(v14);
}

- (void)setAppleAudioAccessoryLimitedLogging:(BOOL)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC14bluetoothuserd13XPCConnection *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_10000215C(&qword_10007C620);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject(&unk_100073EB8, 40, 7);
  *(_BYTE *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100073EE0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10007C038;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100073F08, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10007C040;
  v14[5] = v13;
  v15 = self;
  v16 = sub_10004E540((uint64_t)v9, (uint64_t)&unk_10007C048, (uint64_t)v14);
  swift_release(v16);
}

- (void)getCurrentUserGivenNameWithCompletion:(id)a3
{
  void *v4;
  _TtC14bluetoothuserd13XPCConnection *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_10004FF44((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)recordEventWithDeviceIdentifier:(id)a3 initiator:(BOOL)a4 starting:(BOOL)a5 useCase:(unsigned int)a6
{
  uint64_t v6;
  _BOOL8 v7;
  _BOOL8 v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void);
  _TtC14bluetoothuserd13XPCConnection *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v8 = a4;
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;
  v13 = *(uint64_t (**)(void))((swift_isaMask & **(_QWORD **)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC14bluetoothuserd13XPCConnection_listener))
                            + 0x70);
  v14 = self;
  v15 = v13();
  if (v15)
  {
    v16 = v15;
    v17 = (*(uint64_t (**)(void))(*(_QWORD *)v15 + 520))();
    if (v17)
    {
      v18 = v17;
      (*(void (**)(uint64_t, uint64_t, _BOOL8, _BOOL8, uint64_t))(*(_QWORD *)v17 + 216))(v10, v12, v8, v7, v6);

      swift_bridgeObjectRelease(v12);
      swift_release(v16);
      v19 = v18;
    }
    else
    {

      swift_bridgeObjectRelease(v12);
      v19 = v16;
    }
    swift_release(v19);
  }
  else
  {

    swift_bridgeObjectRelease(v12);
  }
}

- (void)readPrefKeys:(NSArray *)a3 source:(unsigned int)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSArray *v17;
  _TtC14bluetoothuserd13XPCConnection *v18;
  uint64_t v19;
  uint64_t v20;

  v9 = sub_10000215C(&qword_10007C620);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject(&unk_100073E40, 48, 7);
  *(_QWORD *)(v13 + 16) = a3;
  *(_DWORD *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_100073E68, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10007C018;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_100073E90, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10007C020;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  v19 = sub_10004E540((uint64_t)v11, (uint64_t)&unk_10007C028, (uint64_t)v16);
  swift_release(v19);
}

- (void)writePrefKey:(NSString *)a3 value:(id)a4 source:(unsigned int)a5 completion:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSString *v19;
  _TtC14bluetoothuserd13XPCConnection *v20;
  uint64_t v21;
  uint64_t v22;

  v11 = sub_10000215C(&qword_10007C620);
  __chkstk_darwin(v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = swift_allocObject(&unk_100073DA0, 56, 7);
  *(_QWORD *)(v15 + 16) = a3;
  *(_QWORD *)(v15 + 24) = a4;
  *(_DWORD *)(v15 + 32) = a5;
  *(_QWORD *)(v15 + 40) = v14;
  *(_QWORD *)(v15 + 48) = self;
  v16 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject(&unk_100073DC8, 48, 7);
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_10007BFD8;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject(&unk_100073DF0, 48, 7);
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_10007BFE8;
  v18[5] = v17;
  v19 = a3;
  swift_unknownObjectRetain(a4);
  v20 = self;
  v21 = sub_10004E540((uint64_t)v13, (uint64_t)&unk_10007BFF8, (uint64_t)v18);
  swift_release(v21);
}

@end

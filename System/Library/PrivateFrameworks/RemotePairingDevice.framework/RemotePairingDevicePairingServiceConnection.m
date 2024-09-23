@implementation RemotePairingDevicePairingServiceConnection

- (_TtC19RemotePairingDevice43RemotePairingDevicePairingServiceConnection)init
{
  return (_TtC19RemotePairingDevice43RemotePairingDevicePairingServiceConnection *)RemotePairingDevicePairingServiceConnection.init()();
}

- (BOOL)deleteAllPairingRecordsAndReturnError:(id *)a3
{
  _TtC19RemotePairingDevice43RemotePairingDevicePairingServiceConnection *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = self;
  RemotePairingDevicePairingServiceConnection.deleteAllPairingRecords()();

  if (v5)
  {
    if (a3)
    {
      v6 = (void *)sub_1CF73E484();

      v7 = v6;
      *a3 = v6;
    }
    else
    {

    }
  }
  return v5 == 0;
}

- (BOOL)deletePairingRecordForHostWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC19RemotePairingDevice43RemotePairingDevicePairingServiceConnection *v9;
  uint64_t v11;

  v5 = sub_1CF73E664();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF73E658();
  v9 = self;
  RemotePairingDevicePairingServiceConnection.deletePairingRecord(forHostWithIdentifier:)((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (void)deletePairingRecordWithUuid:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  _TtC19RemotePairingDevice43RemotePairingDevicePairingServiceConnection *v14;
  uint64_t v15;

  v8 = sub_1CF73E664();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  sub_1CF73E658();
  *(_QWORD *)(swift_allocObject() + 16) = v12;
  v13 = a4;
  v14 = self;
  RemotePairingDevicePairingServiceConnection.deletePairingRecord(uuid:queue:completion:)();

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)deleteAllPairingRecordsWithInvokingCompletionHandlerOn:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC19RemotePairingDevice43RemotePairingDevicePairingServiceConnection *v8;

  v6 = _Block_copy(a4);
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  v7 = a3;
  v8 = self;
  RemotePairingDevicePairingServiceConnection.deleteAllPairingRecords(invokingCompletionHandlerOn:completion:)();

  swift_release();
}

- (id)trustedHostInfoAndReturnError:(id *)a3
{
  _TtC19RemotePairingDevice43RemotePairingDevicePairingServiceConnection *v3;
  void *v4;

  v3 = self;
  RemotePairingDevicePairingServiceConnection.trustedHostInfo()();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBA1890);
  v4 = (void *)sub_1CF73F030();
  swift_bridgeObjectRelease();
  return v4;
}

- (int64_t)getUSBConectedHostTrustStateWithError:(id *)a3
{
  _TtC19RemotePairingDevice43RemotePairingDevicePairingServiceConnection *v3;
  int64_t v4;
  int64_t v5;

  v3 = self;
  RemotePairingDevicePairingServiceConnection.getUSBConnectedHostState(with:)();
  v5 = v4;

  return v5;
}

- (void)allowPromptlessPairingForAutomation:(BOOL)a3 forBUID:(id)a4 withQueue:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtC19RemotePairingDevice43RemotePairingDevicePairingServiceConnection *v15;

  v7 = a3;
  v9 = _Block_copy(a6);
  v10 = sub_1CF73EED4();
  v12 = v11;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v9;
  v14 = a5;
  v15 = self;
  RemotePairingDevicePairingServiceConnection.allowPromptlessPairingForHost(pairingShouldBeMarkedForAutomation:forBUID:withQueue:completion:)(v7, v10, v12, (uint64_t)a5, (uint64_t)sub_1CF6A6F88, v13);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)initiateWirelessPairingSessionWithQueue:(id)a3 completionHandler:(id)a4 customPinHandler:(id)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC19RemotePairingDevice43RemotePairingDevicePairingServiceConnection *v13;

  v8 = _Block_copy(a4);
  v9 = _Block_copy(a5);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v8;
  if (v9)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v9;
    v9 = sub_1CF6A6F80;
  }
  else
  {
    v11 = 0;
  }
  v12 = a3;
  v13 = self;
  RemotePairingDevicePairingServiceConnection.initiateWirelessPairingSession(withQueue:completionHandler:customPinHandler:)(v12, (uint64_t)sub_1CF6A6F78, v10, (uint64_t)v9, v11);
  sub_1CF693EC8((uint64_t)v9);

  swift_release();
}

- (void).cxx_destruct
{
  swift_release();
}

@end

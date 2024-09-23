@implementation AgentXPCAdminProxy

- (_TtC16UniversalControlP33_22B26D9AC92D4CC25624F8FC3B914ED518AgentXPCAdminProxy)init
{
  sub_2497678D0();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

- (void)xpcGetConfigurationWithCompletion:(id)a3
{
  sub_24976912C((int)self, (int)a2, a3);
}

- (void)xpcSetConfiguration:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC16UniversalControlP33_22B26D9AC92D4CC25624F8FC3B914ED518AgentXPCAdminProxy *v11;

  v6 = _Block_copy(a4);
  v7 = a3;
  v11 = self;
  v8 = sub_249836940();
  v10 = v9;

  _Block_copy(v6);
  sub_249767C20(v8, v10, v11, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  sub_249748C10(v8, v10);

}

- (void)xpcGetDevicesWithCompletion:(id)a3
{
  sub_24976912C((int)self, (int)a2, a3);
}

- (void)xpcGetConnectedDevicesWithCompletion:(id)a3
{
  sub_2497682CC((int)self, (int)a2, a3);
}

- (void)xpcGetIDSWithCompletion:(id)a3
{
  sub_2497682CC((int)self, (int)a2, a3);
}

- (void)xpcConnectTo:(id)a3 completion:(id)a4
{
  sub_2497686EC(self, (int)a2, a3, a4, (uint64_t)&unk_251AB1930, (uint64_t)sub_24976D244, (void (*)(id, uint64_t, uint64_t))sub_249768310);
}

- (void)xpcDiagnoseWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC16UniversalControlP33_22B26D9AC92D4CC25624F8FC3B914ED518AgentXPCAdminProxy *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_249768484((uint64_t)sub_24976CBDC, v5);

  swift_release();
}

- (void)xpcDisconnectFrom:(id)a3 completion:(id)a4
{
  sub_2497686EC(self, (int)a2, a3, a4, (uint64_t)&unk_251AB18E0, (uint64_t)sub_24976D244, (void (*)(id, uint64_t, uint64_t))sub_249768578);
}

- (void)xpcDisconnect
{
  _TtC16UniversalControlP33_22B26D9AC92D4CC25624F8FC3B914ED518AgentXPCAdminProxy *v2;

  v2 = self;
  sub_249768778();

}

- (void)xpcSynchronizeWith:(id)a3 completion:(id)a4
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  _TtC16UniversalControlP33_22B26D9AC92D4CC25624F8FC3B914ED518AgentXPCAdminProxy *v8;

  v5 = _Block_copy(a4);
  sub_24976D1D4(0, &qword_2578805B0);
  v6 = sub_249836EA4();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = self;
  sub_249768814(v6, (uint64_t)sub_24976B88C, v7);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)xpcMoveWithType:(id)a3 device:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC16UniversalControlP33_22B26D9AC92D4CC25624F8FC3B914ED518AgentXPCAdminProxy *v11;

  v7 = _Block_copy(a5);
  v8 = sub_249836EA4();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = a4;
  v11 = self;
  sub_249768D20(v8, (uint64_t)v10, (uint64_t)sub_24976D244, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)xpcGetAutomaticallyReconnectWithCompletion:(id)a3
{
  sub_24976912C((int)self, (int)a2, a3);
}

- (void)xpcSetAutomaticallyReconnect:(BOOL)a3 completion:(id)a4
{
  void *v6;
  _TtC16UniversalControlP33_22B26D9AC92D4CC25624F8FC3B914ED518AgentXPCAdminProxy *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_24976916C(a3, (uint64_t)v7, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);

}

- (void)xpcTakeClientAssertion:(id)a3 assertionID:(id)a4 deviceID:(id)a5 completion:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _TtC16UniversalControlP33_22B26D9AC92D4CC25624F8FC3B914ED518AgentXPCAdminProxy *v18;
  id v19;
  uint64_t v20;

  v10 = sub_249836A18();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  sub_2498369D0();
  if (a5)
  {
    v15 = _sSo18UVCClientAssertiona16UniversalControlE11descriptionSSvg_0();
    a5 = v16;
  }
  else
  {
    v15 = 0;
  }
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v14;
  v18 = self;
  v19 = a3;
  sub_249769260((uint64_t)v19, (uint64_t)v13, v15, (uint64_t)a5, (uint64_t)sub_24976D244, v17);

  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)xpcReleaseClientAssertion:(id)a3 completion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  _TtC16UniversalControlP33_22B26D9AC92D4CC25624F8FC3B914ED518AgentXPCAdminProxy *v12;
  uint64_t v13;

  v6 = sub_249836A18();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_2498369D0();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = self;
  sub_249769450((uint64_t)v9, (uint64_t)sub_24976B868, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end

@implementation PKHeadUnitPairingFlowBridge

+ (void)startHeadUnitPairingFlowWithContext:(id)a3 navController:(id)a4 provisioningController:(id)a5 completion:(id)a6
{
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v9 = _Block_copy(a6);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  sub_19D3F4EA4(v11, (uint64_t)a4, a5, (uint64_t)sub_19D266A30, v10);

  swift_release();
}

- (PKHeadUnitPairingFlowBridge)init
{
  return (PKHeadUnitPairingFlowBridge *)sub_19D3EEDE4(self, (uint64_t)a2, type metadata accessor for HeadUnitPairingFlowBridge);
}

@end

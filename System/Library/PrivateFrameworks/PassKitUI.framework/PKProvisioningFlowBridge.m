@implementation PKProvisioningFlowBridge

+ (void)startInAppFlowWithNavController:(id)a3 context:(id)a4 requestConfiguration:(id)a5 phoneWebService:(id)a6 watchWebService:(id)a7 generateRequest:(id)a8 onViewLoaded:(id)a9 completion:(id)a10
{
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v15 = _Block_copy(a8);
  v16 = _Block_copy(a9);
  v17 = _Block_copy(a10);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v15;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v16;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v17;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = a7;
  sub_19D3EEE2C((uint64_t)v21, v22, v23, a6, (unsigned __int8 *)a7, (uint64_t)sub_19D3F5474, v18, (uint64_t)sub_19D266FF0, v19, (void (*)(_QWORD, _QWORD))sub_19D3F5894, v20);

  swift_release();
  swift_release();
  swift_release();
}

+ (void)startInAppFlowWithNavController:(id)a3 context:(id)a4 addPassConfiguration:(id)a5 completion:(id)a6
{
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v9 = _Block_copy(a6);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = a3;
  v12 = a4;
  swift_unknownObjectRetain();
  _s9PassKitUI22ProvisioningFlowBridgeC010startInAppE017withNavController7context03addA13Configuration10completionySo012UINavigationL0C_So21PKProvisioningContextCSo010PKPushableaO8Provider_pySaySo015PKSecureElementA0CGSg_So7NSErrorCSgtctFZ_0((uint64_t)v11, v12, (uint64_t)a5, (uint64_t)sub_19D3F5894, v10);

  swift_unknownObjectRelease();
  swift_release();
}

+ (void)startInAppFlowWithNavController:(id)a3 context:(id)a4 addCarKeyConfiguration:(id)a5 completion:(id)a6
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
  _s9PassKitUI22ProvisioningFlowBridgeC010startInAppE017withNavController7context22addCarKeyConfiguration10completionySo012UINavigationL0C_So21PKProvisioningContextCSo05PKAddopaQ0CySaySo015PKSecureElementA0CGSg_So7NSErrorCSgtctFZ_0((uint64_t)v11, v12, v13, (uint64_t)sub_19D3F5894, v10);

  swift_release();
}

+ (void)startShareableCredentialFlowWithNavController:(id)a3 context:(id)a4 credentials:(id)a5 completion:(id)a6
{
  void *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  v8 = _Block_copy(a6);
  sub_19D1A9ED4(0, (unint64_t *)&unk_1EE4B6750);
  v9 = sub_19DE87E10();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v8;
  v11 = a3;
  v12 = a4;
  _s9PassKitUI22ProvisioningFlowBridgeC024startShareableCredentialE017withNavController7context11credentials10completionySo012UINavigationL0C_So21PKProvisioningContextCSaySo09PKPaymenthI0CGyyctFZ_0((uint64_t)v11, v12, v9, (uint64_t)sub_19D266FF0, v10);

  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)startShareRedemptionFlowWithNavController:(id)a3 context:(id)a4 invitation:(id)a5 referralSource:(id)a6 completion:(id)a7
{
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  v11 = _Block_copy(a7);
  if (a6)
  {
    v12 = sub_19DE87BF4();
    a6 = v13;
  }
  else
  {
    v12 = 0;
  }
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v11;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  _s9PassKitUI22ProvisioningFlowBridgeC020startShareRedemptionE017withNavController7context10invitation14referralSource10completionySo012UINavigationL0C_So21PKProvisioningContextCSo013PKSharingPushD10InvitationCSSSgySaySo015PKSecureElementA0CGSg_So7NSErrorCSgtctFZ_0((uint64_t)v15, v16, v17, v12, (uint64_t)a6, (uint64_t)sub_19D3F5894, v14);

  swift_release();
  swift_bridgeObjectRelease();
}

+ (void)startCarKeyShareRedemptionFlowWithNavController:(id)a3 context:(id)a4 invitation:(id)a5 handle:(id)a6 originalShareURL:(id)a7 completion:(id)a8
{
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v12 = _Block_copy(a8);
  v13 = sub_19DE87BF4();
  v15 = v14;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v12;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  _s9PassKitUI22ProvisioningFlowBridgeC026startCarKeyShareRedemptionE017withNavController7context10invitation6handle08originalJ3URL10completionySo012UINavigationN0C_So21PKProvisioningContextCSo09PKSharinghI10InvitationCSo0X13ChannelHandleCSSySaySo015PKSecureElementA0CGSg_So7NSErrorCSgtctFZ_0((uint64_t)v17, v18, v19, v20, v13, v15, (uint64_t)sub_19D3F546C, v16);

  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)startManualEntryFlowWithNavController:(id)a3 context:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v7 = _Block_copy(a5);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  v9 = a3;
  v10 = a4;
  _s9PassKitUI22ProvisioningFlowBridgeC016startManualEntryE017withNavController7context10completionySo012UINavigationL0C_So21PKProvisioningContextCyyctFZ_0((uint64_t)v9, v10, (uint64_t)sub_19D266FF0, v8);

  swift_release();
}

+ (void)startProductManualEntryFlowWithNavController:(id)a3 context:(id)a4 product:(id)a5 presentNavController:(id)a6 completion:(id)a7
{
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  v11 = _Block_copy(a6);
  v12 = _Block_copy(a7);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v11;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v12;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  _s9PassKitUI22ProvisioningFlowBridgeC023startProductManualEntryE017withNavController7context7product07presentlM010completionySo012UINavigationM0C_So21PKProvisioningContextCSo014PKPaymentSetupH0CyycyyctFZ_0((uint64_t)v15, v16, v17, (uint64_t)sub_19D266FF0, v13, (uint64_t)sub_19D266FF0, v14);

  swift_release();
  swift_release();
}

+ (void)startProvisionToPurchaseFlowWithNavController:(id)a3 context:(id)a4 onFirstViewControllerShown:(id)a5 completion:(id)a6
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;

  v9 = _Block_copy(a5);
  v10 = _Block_copy(a6);
  if (v9)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v9;
    v9 = sub_19D266FF0;
  }
  else
  {
    v11 = 0;
  }
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v10;
  v13 = a3;
  v14 = a4;
  _s9PassKitUI22ProvisioningFlowBridgeC024startProvisionToPurchaseE017withNavController7context011onFirstViewM5Shown10completionySo012UINavigationM0C_So21PKProvisioningContextCyycSgyyctFZ_0((uint64_t)v13, v14, (uint64_t)v9, v11, (uint64_t)sub_19D266FF0, v12);
  swift_release();
  sub_19D1A9F60((uint64_t)v9);

}

+ (void)startVerificationFlowWithNavController:(id)a3 context:(id)a4 pass:(id)a5 verificationController:(id)a6 presentNavController:(id)a7
{
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v11 = _Block_copy(a7);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  _s9PassKitUI22ProvisioningFlowBridgeC017startVerificationE017withNavController7context4pass012verificationK007presentjK0ySo012UINavigationK0C_So21PKProvisioningContextCSo015PKSecureElementA0CSo09PKPaymenthK0CyyctFZ_0(v13, v14, v15, v16, (uint64_t)sub_19D266FF0, v12);

  swift_release();
}

+ (void)startPrecursorPassFlowWithNavController:(id)a3 context:(id)a4 pass:(id)a5 precursorController:(id)a6 parentNavController:(id)a7 presentNavController:(id)a8 completion:(id)a9
{
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v14 = _Block_copy(a8);
  v15 = _Block_copy(a9);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v14;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v15;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  sub_19D3F2544(v18, v19, v20, v21, v22, (uint64_t)sub_19D266FF0, v16, (uint64_t)sub_19D266FF0, v17);

  swift_release();
  swift_release();
}

+ (void)startCredentialsProvisioningFlowWithNavController:(id)a3 context:(id)a4 credentials:(id)a5 parentNavController:(id)a6 presentNavController:(id)a7 completion:(id)a8
{
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;

  v12 = _Block_copy(a7);
  v13 = _Block_copy(a8);
  sub_19D1A9ED4(0, (unint64_t *)&qword_1EE4A34C0);
  v14 = sub_19DE87E10();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v12;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v13;
  v17 = a3;
  v18 = a4;
  v19 = a6;
  _s9PassKitUI22ProvisioningFlowBridgeC016startCredentialsdE017withNavController7context11credentials06parentjK007presentjK010completionySo012UINavigationK0C_So21PKProvisioningContextCSaySo19PKPaymentCredentialCGALyycyyctFZ_0((uint64_t)v17, v18, v14, (uint64_t)v19, (uint64_t)sub_19D266FF0, v15, (uint64_t)sub_19D266FF0, v16);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

+ (void)startSetupAssistantFlowWithContext:(id)a3 credentials:(id)a4 onFirstViewControllerShown:(id)a5 completion:(id)a6
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v8 = _Block_copy(a5);
  v9 = _Block_copy(a6);
  sub_19D1A9ED4(0, (unint64_t *)&qword_1EE4A34C0);
  v10 = sub_19DE87E10();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v8;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v9;
  v13 = a3;
  _s9PassKitUI22ProvisioningFlowBridgeC019startSetupAssistantE07context11credentials26onFirstViewControllerShown10completionySo21PKProvisioningContextC_SaySo19PKPaymentCredentialCGySo06UIViewO0CcyyctFZ_0(v13, v10, (uint64_t)sub_19D3F5910, v11, (uint64_t)sub_19D266FF0, v12);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

+ (void)startSetupAssistantFlowWithContext:(id)a3 allowManualEntry:(BOOL)a4 onFirstViewControllerShown:(id)a5 completion:(id)a6
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v9 = _Block_copy(a5);
  v10 = _Block_copy(a6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v9;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v10;
  v13 = a3;
  _s9PassKitUI22ProvisioningFlowBridgeC019startSetupAssistantE07context16allowManualEntry26onFirstViewControllerShown10completionySo21PKProvisioningContextC_SbySo06UIViewQ0CcyyctFZ_0(v13, a4, (uint64_t)sub_19D22E97C, v11, (uint64_t)sub_19D266FF0, v12);

  swift_release();
  swift_release();
}

+ (void)startSetupAssistantFollowupFlowWithNavController:(id)a3 context:(id)a4 preflightCompletion:(id)a5 completion:(id)a6
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;

  v9 = _Block_copy(a5);
  v10 = _Block_copy(a6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v9;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v10;
  v13 = a3;
  v14 = a4;
  _s9PassKitUI22ProvisioningFlowBridgeC027startSetupAssistantFollowupE017withNavController7context19preflightCompletion10completionySo012UINavigationM0C_So21PKProvisioningContextCyycyyctFZ_0((uint64_t)v13, v14, (uint64_t)sub_19D266FF0, v11, (uint64_t)sub_19D266FF0, v12);

  swift_release();
  swift_release();
}

+ (void)startPaymentSetupFlowWithNavController:(id)a3 context:(id)a4 mode:(int64_t)a5 preflightCompletion:(id)a6 completion:(id)a7
{
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;

  v11 = _Block_copy(a6);
  v12 = _Block_copy(a7);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v11;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v12;
  v15 = a3;
  v16 = a4;
  _s9PassKitUI22ProvisioningFlowBridgeC017startPaymentSetupE017withNavController7context4mode19preflightCompletion10completionySo012UINavigationL0C_So21PKProvisioningContextCSo09PKPaymentI4ModeVyycyyctFZ_0((uint64_t)v15, v16, a5, (uint64_t)sub_19D266FF0, v13, (uint64_t)sub_19D266FF0, v14);

  swift_release();
  swift_release();
}

- (PKProvisioningFlowBridge)init
{
  return (PKProvisioningFlowBridge *)sub_19D3EEDE4(self, (uint64_t)a2, type metadata accessor for ProvisioningFlowBridge);
}

@end

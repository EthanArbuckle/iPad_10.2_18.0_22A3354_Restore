@implementation PKPeerPaymentIdentityManagementSectionController

- (PKPeerPaymentIdentityManagementSectionController)initWithDelegate:(id)a3
{
  PKPeerPaymentIdentityManagementSectionController *v3;
  PKPeerPaymentIdentityManagementSectionController *v4;

  swift_unknownObjectRetain();
  sub_19D83C9A8();
  v4 = v3;
  swift_unknownObjectRelease();
  return v4;
}

- (NSArray)allSectionIdentifiers
{
  return (NSArray *)(id)sub_19DE87DF8();
}

+ (BOOL)validForPaymentPass:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  v4 = _s9PassKitUI46PeerPaymentIdentityManagementSectionControllerC5valid3forSbSo09PKPaymentA0C_tFZ_0(v3);

  return v4 & 1;
}

- (void)preflight:(id)a3
{
  void (**v4)(_QWORD);
  PKPeerPaymentIdentityManagementSectionController *v5;

  v4 = (void (**)(_QWORD))_Block_copy(a3);
  swift_getKeyPath();
  sub_19D1A03D8((unint64_t *)&qword_1EE4A2AD0, (uint64_t (*)(uint64_t))type metadata accessor for PeerPaymentIdentityManager, (uint64_t)&protocol conformance descriptor for PeerPaymentIdentityManager);
  v5 = self;
  sub_19DE83E8C();
  swift_release();
  v4[2](v4);
  _Block_release(v4);

}

- (NSArray)sectionIdentifiers
{
  PKPeerPaymentIdentityManagementSectionController *v2;
  void *v3;

  v2 = self;
  PeerPaymentIdentityManagementSectionController.sectionIdentifiers.getter();

  v3 = (void *)sub_19DE87DF8();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  void *v5;
  id v6;
  PKPeerPaymentIdentityManagementSectionController *v7;
  id v8;

  v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PKPeerPaymentIdentityManagementSectionController_account);
  v6 = a3;
  v7 = self;
  if (objc_msgSend(v5, sel_supportsDeviceTap)
    && (PKCashDeviceTapEnabled() & 1) != 0
    && (PKIsVision() & 1) == 0
    && (PKIsPhone() & 1) != 0)
  {
    v8 = -[PKPaymentPassDetailSectionController detailViewStyle](v7, sel_detailViewStyle);

    return v8 != (id)2;
  }
  else
  {

    return 0;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  PKPeerPaymentIdentityManagementSectionController *v13;
  id v14;
  uint64_t v16;

  v7 = sub_19DE83D78();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19DE83D48();
  v12 = a3;
  v13 = self;
  v14 = _s9PassKitUI46PeerPaymentIdentityManagementSectionControllerC9tableView_12cellForRowAt17sectionIdentifierSo07UITableK4CellCSgSo0rK0C_10Foundation9IndexPathVSStF_0(v12);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v14;
}

- (id)titleForHeaderInSectionIdentifier:(id)a3
{
  return sub_19D83C5B4(self);
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  return sub_19D83C5B4(self);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  PKPeerPaymentIdentityManagementSectionController *v13;
  uint64_t v14;

  v7 = sub_19DE83D78();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19DE83D48();
  v12 = a3;
  v13 = self;
  _s9PassKitUI46PeerPaymentIdentityManagementSectionControllerC9tableView_14didSelectRowAt17sectionIdentifierySo07UITableK0C_10Foundation9IndexPathVSStF_0(v12);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (void)peerPaymentIdentityManager:(id)a3 didUpdateProfileAppearanceData:(id)a4
{
  id v6;
  id v7;
  PKPeerPaymentIdentityManagementSectionController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  _s9PassKitUI46PeerPaymentIdentityManagementSectionControllerC04peereF7Manager_30didUpdateProfileAppearanceDatayAA0defK0C_So06PKPeerenoP0CtF_0();

}

- (PKPeerPaymentIdentityManagementSectionController)init
{
  PKPeerPaymentIdentityManagementSectionController *result;

  result = (PKPeerPaymentIdentityManagementSectionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___PKPeerPaymentIdentityManagementSectionController_account));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___PKPeerPaymentIdentityManagementSectionController_identityManager));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___PKPeerPaymentIdentityManagementSectionController_renderer));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR___PKPeerPaymentIdentityManagementSectionController_delegate);
}

@end

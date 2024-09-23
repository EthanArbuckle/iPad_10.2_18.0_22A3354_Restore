@implementation PKPassDetailAccountCredentialsSectionController

- (NSArray)allSectionIdentifiers
{
  return (NSArray *)(id)sub_19DE87DF8();
}

- (NSArray)sectionIdentifiers
{
  _TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController *v2;
  void *v3;

  v2 = self;
  PKPassDetailAccountCredentialsSectionController.sectionIdentifiers.getter();

  v3 = (void *)sub_19DE87DF8();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (_TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController)initWithPass:(id)a3 delegate:(id)a4 throwsError:(id *)a5
{
  id v5;

  v5 = a3;
  swift_unknownObjectRetain();
  return (_TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController *)PKPassDetailAccountCredentialsSectionController.init(pass:delegate:)(v5);
}

- (void)fetchPaymentInformationWithCompletion:(id)a3
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
  _TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController *v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE49E4F0);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = self;
  v11 = sub_19DE87F30();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE49E548;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE49E550;
  v13[5] = v12;
  v14 = self;
  sub_19D83942C((uint64_t)v8, (uint64_t)&unk_1EE4A99D0, (uint64_t)v13);
  swift_release();
}

+ (BOOL)validForPaymentPass:(id)a3
{
  return PKBankConnectAvailableForPass();
}

- (void)updatePass:(id)a3
{
  id v4;
  _TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController *v5;

  v4 = a3;
  v5 = self;
  PKPassDetailAccountCredentialsSectionController.update(pass:)((PKPaymentPass)v4);

}

- (_TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController)init
{
  _TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController *result;

  result = (_TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController_delegate);
  sub_19D348C6C(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController_connectionState), *(void **)((char *)&self->super._currentSegment+ OBJC_IVAR____TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController_connectionState));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController_pass));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController_accountProvider));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController *v16;
  uint64_t v17;
  id v18;
  uint64_t v20;

  v7 = sub_19DE83D78();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19DE83D48();
  v12 = sub_19DE87BF4();
  v14 = v13;
  v15 = a3;
  v16 = self;
  v18 = PKPassDetailAccountCredentialsSectionController.tableView(_:cellForRowAt:sectionIdentifier:)((uint64_t)v15, v17, v12, v14);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v18;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  uint64_t v4;
  char v6;

  if (sub_19DE87BF4() == 0xD000000000000019 && v4 == 0x800000019DF18C50)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_19DE88A58();
    swift_bridgeObjectRelease();
    return v6 & 1;
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController *v13;
  uint64_t v14;

  v7 = sub_19DE83D78();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19DE83D48();
  v12 = a3;
  v13 = self;
  _s9PassKitUI47PKPassDetailAccountCredentialsSectionControllerC9tableView_14didSelectRowAt17sectionIdentifierySo07UITableK0C_10Foundation9IndexPathVSStF_0(v12, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (void)bankConnectAccountDidChange:(id)a3
{
  id v5;
  _TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController *v6;

  v5 = a3;
  v6 = self;
  PKPassDetailAccountCredentialsSectionController.accountDidChange(to:)(a3);

}

- (void)bankConnectConsentStatusDidChange:(unint64_t)a3
{
  _TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController *v4;

  v4 = self;
  PKPassDetailAccountCredentialsSectionController.consentStatusDidChange(to:)(a3);

}

@end

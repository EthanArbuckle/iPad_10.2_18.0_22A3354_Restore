@implementation PKPassDetailBankConnectSectionController

- (NSArray)allSectionIdentifiers
{
  return (NSArray *)(id)sub_19DE87DF8();
}

- (NSArray)sectionIdentifiers
{
  _TtC9PassKitUI40PKPassDetailBankConnectSectionController *v2;
  void *v3;

  v2 = self;
  PKPassDetailBankConnectSectionController.sectionIdentifiers.getter();

  v3 = (void *)sub_19DE87DF8();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (_TtC9PassKitUI40PKPassDetailBankConnectSectionController)initWithPass:(id)a3 delegate:(id)a4 throwsError:(id *)a5
{
  id v5;

  v5 = a3;
  swift_unknownObjectRetain();
  return (_TtC9PassKitUI40PKPassDetailBankConnectSectionController *)PKPassDetailBankConnectSectionController.init(pass:delegate:)(v5);
}

- (void)preflight:(id)a3
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
  _TtC9PassKitUI40PKPassDetailBankConnectSectionController *v14;
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
  v12[4] = &unk_1EE4B9718;
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
  _TtC9PassKitUI40PKPassDetailBankConnectSectionController *v4;
  id pass;

  pass = a3;
  v4 = self;
  PKPassDetailBankConnectSectionController.update(pass:)((PKPaymentPass)pass);

}

- (FKInstitution)connectedInstitution
{
  _TtC9PassKitUI40PKPassDetailBankConnectSectionController *v2;
  void *v3;

  v2 = self;
  v3 = PKPassDetailBankConnectSectionController.connectedInstitution.getter();

  return (FKInstitution *)v3;
}

- (_TtC9PassKitUI40PKPassDetailBankConnectSectionController)init
{
  _TtC9PassKitUI40PKPassDetailBankConnectSectionController *result;

  result = (_TtC9PassKitUI40PKPassDetailBankConnectSectionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI40PKPassDetailBankConnectSectionController_pass));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI40PKPassDetailBankConnectSectionController_accountProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI40PKPassDetailBankConnectSectionController_institutionMatcher));
  sub_19D8396F4(*(void **)((char *)&self->super.super.isa+ OBJC_IVAR____TtC9PassKitUI40PKPassDetailBankConnectSectionController_connectionState), *(unint64_t *)((char *)&self->super._currentSegment+ OBJC_IVAR____TtC9PassKitUI40PKPassDetailBankConnectSectionController_connectionState), *(void **)((char *)&self->super._detailViewStyle+ OBJC_IVAR____TtC9PassKitUI40PKPassDetailBankConnectSectionController_connectionState), *((_BYTE *)&self->super._primaryTextColor+ OBJC_IVAR____TtC9PassKitUI40PKPassDetailBankConnectSectionController_connectionState));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI40PKPassDetailBankConnectSectionController_delegate);
}

- (void)bankConnectAccountDidChange:(id)a3
{
  id v5;
  _TtC9PassKitUI40PKPassDetailBankConnectSectionController *v6;

  v5 = a3;
  v6 = self;
  PKPassDetailBankConnectSectionController.accountDidChange(to:)(a3);

}

- (void)bankConnectConsentStatusDidChange:(unint64_t)a3
{
  _TtC9PassKitUI40PKPassDetailBankConnectSectionController *v4;

  v4 = self;
  PKPassDetailBankConnectSectionController.consentStatusDidChange(to:)(a3);

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
  _TtC9PassKitUI40PKPassDetailBankConnectSectionController *v16;
  id v17;
  uint64_t v19;

  v7 = sub_19DE83D78();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19DE83D48();
  v12 = sub_19DE87BF4();
  v14 = v13;
  v15 = a3;
  v16 = self;
  v17 = PKPassDetailBankConnectSectionController.tableView(_:cellForRowAt:sectionIdentifier:)((uint64_t)v15, (uint64_t)v11, v12, v14);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v17;
}

- (id)titleForHeaderInSectionIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC9PassKitUI40PKPassDetailBankConnectSectionController *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = sub_19DE87BF4();
  v6 = v5;
  v7 = self;
  _s9PassKitUI40PKPassDetailBankConnectSectionControllerC14titleForHeader02inH10IdentifierSSSgSS_tF_0(v4, v6);
  v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    v10 = (void *)sub_19DE87BD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC9PassKitUI40PKPassDetailBankConnectSectionController *v7;
  Swift::String v8;
  void *object;
  void *v10;

  v4 = sub_19DE87BF4();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  object = PKPassDetailBankConnectSectionController.titleForFooter(inSectionIdentifier:)(v8).value._object;

  swift_bridgeObjectRelease();
  if (object)
  {
    v10 = (void *)sub_19DE87BD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
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
  _TtC9PassKitUI40PKPassDetailBankConnectSectionController *v16;
  uint64_t v17;

  v7 = sub_19DE83D78();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19DE83D48();
  v12 = sub_19DE87BF4();
  v14 = v13;
  v15 = a3;
  v16 = self;
  PKPassDetailBankConnectSectionController.tableView(_:didSelectRowAt:sectionIdentifier:)(v15, v11, v12, v14);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC9PassKitUI40PKPassDetailBankConnectSectionController *v10;
  int64_t v11;

  v6 = sub_19DE87BF4();
  v8 = v7;
  v9 = a3;
  v10 = self;
  v11 = sub_19D83A020(v6, v8);

  swift_bridgeObjectRelease();
  return v11;
}

@end

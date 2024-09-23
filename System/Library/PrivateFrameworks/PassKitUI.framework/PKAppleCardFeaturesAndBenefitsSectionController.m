@implementation PKAppleCardFeaturesAndBenefitsSectionController

- (id)selectionHandler
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR___PKAppleCardFeaturesAndBenefitsSectionController_selectionHandler);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19D626440;
  aBlock[3] = &block_descriptor_103;
  v4 = _Block_copy(aBlock);
  sub_19DE82CB0();
  swift_release();
  return v4;
}

- (void)setSelectionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_19D626DE8;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___PKAppleCardFeaturesAndBenefitsSectionController_selectionHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_19D1A9F60(v7);
}

- (NSArray)sectionIdentifiers
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4B0C50);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_19DEE0240;
  v4 = *(unint64_t *)((char *)&self->super._currentSegment
                           + OBJC_IVAR___PKAppleCardFeaturesAndBenefitsSectionController_exploreFeaturesAndBenefitsSectionID);
  *(_QWORD *)(v3 + 32) = *(Class *)((char *)&self->super.super.isa
                                  + OBJC_IVAR___PKAppleCardFeaturesAndBenefitsSectionController_exploreFeaturesAndBenefitsSectionID);
  *(_QWORD *)(v3 + 40) = v4;
  sub_19DE82F08();
  v5 = (void *)sub_19DE87DF8();
  swift_bridgeObjectRelease();
  return (NSArray *)v5;
}

- (NSArray)allSectionIdentifiers
{
  PKAppleCardFeaturesAndBenefitsSectionController *v2;
  NSArray *v3;
  void *v4;

  v2 = self;
  v3 = -[PKAppleCardFeaturesAndBenefitsSectionController sectionIdentifiers](v2, sel_sectionIdentifiers);
  sub_19DE87E10();

  v4 = (void *)sub_19DE87DF8();
  swift_bridgeObjectRelease();
  return (NSArray *)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  return 1;
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
  char *v15;
  id v16;
  PKAppleCardFeaturesAndBenefitsSectionController *v17;
  id result;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;

  v7 = sub_19DE8430C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_19DE83D78();
  v12 = *(_QWORD *)(v23 - 8);
  MEMORY[0x1E0C80A78](v23, v13);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19DE83D48();
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v11, *MEMORY[0x1E0D661C0], v7);
  v16 = a3;
  v17 = self;
  result = (id)PKPassKitBundle();
  if (result)
  {
    v19 = result;
    sub_19DE83F28();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    v20 = (void *)sub_19DE87BD0();
    swift_bridgeObjectRelease();
    v21 = -[PKPaymentPassDetailSectionController disclosureCellWithTitle:forTableView:](v17, sel_disclosureCellWithTitle_forTableView_, v20, v16);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v23);
    return v21;
  }
  else
  {
    __break(1u);
  }
  return result;
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
  PKAppleCardFeaturesAndBenefitsSectionController *v16;
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
  sub_19D626A08(v15, (uint64_t)v11, v12, v14);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (PKAppleCardFeaturesAndBenefitsSectionController)init
{
  _QWORD *v3;
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR___PKAppleCardFeaturesAndBenefitsSectionController_exploreFeaturesAndBenefitsSectionID);
  *v3 = 0xD000000000000023;
  v3[1] = 0x800000019DF2D000;
  v4 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR___PKAppleCardFeaturesAndBenefitsSectionController_selectionHandler);
  v5 = (objc_class *)type metadata accessor for AppleCardFeaturesAndBenefitsSectionController();
  *v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return -[PKPaymentPassDetailSectionController init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_19D1A9F60(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR___PKAppleCardFeaturesAndBenefitsSectionController_selectionHandler));
}

@end

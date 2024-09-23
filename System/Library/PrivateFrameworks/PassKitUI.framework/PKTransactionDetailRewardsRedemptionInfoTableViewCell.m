@implementation PKTransactionDetailRewardsRedemptionInfoTableViewCell

- (void)configureWithRewardsRedemption:(id)a3 rewardsBalance:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  id v12;
  id v13;
  _TtC9PassKitUI53PKTransactionDetailRewardsRedemptionInfoTableViewCell *v14;
  _BYTE v15[16];
  id v16;
  id v17;
  uint64_t v18[5];

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4AFBC0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = &v15[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = a3;
  v17 = a4;
  sub_19D673AD4();
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_19DE86754();
  sub_19DE86988();
  v18[3] = v7;
  v18[4] = sub_19D1A9D2C(&qword_1EE4AFBD0, &qword_1EE4AFBC0, MEMORY[0x1E0CDC120]);
  __swift_allocate_boxed_opaque_existential_1(v18);
  sub_19DE86748();
  (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v11, v7);
  MEMORY[0x1A1AE2814](v18);

}

- (_TtC9PassKitUI53PKTransactionDetailRewardsRedemptionInfoTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_class *ObjectType;
  _TtC9PassKitUI53PKTransactionDetailRewardsRedemptionInfoTableViewCell *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_19DE87BF4();
    a4 = (id)sub_19DE87BD0();
    swift_bridgeObjectRelease();
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = -[PKTransactionDetailRewardsRedemptionInfoTableViewCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);

  return v8;
}

- (_TtC9PassKitUI53PKTransactionDetailRewardsRedemptionInfoTableViewCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[PKTransactionDetailRewardsRedemptionInfoTableViewCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end

@implementation CHStackListTableViewCell

- (CHStackListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (CHStackListTableViewCell *)sub_1002B3B84(a3, (uint64_t)a4, v6);
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  objc_class *v6;
  CHStackListTableViewCell *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[24];
  objc_super v12;

  v3 = sub_100047110((uint64_t *)&unk_100828380);
  __chkstk_darwin(v3);
  v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (objc_class *)type metadata accessor for StackListTableViewCell(0);
  v12.receiver = self;
  v12.super_class = v6;
  v7 = self;
  -[CHStackListTableViewCell prepareForReuse](&v12, "prepareForReuse");
  v8 = type metadata accessor for FitnessPlusStackViewModel(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR___CHStackListTableViewCell_fitnessPlusStackViewModel;
  swift_beginAccess((char *)v7 + OBJC_IVAR___CHStackListTableViewCell_fitnessPlusStackViewModel, v11, 33, 0);
  sub_10028C884((uint64_t)v5, v9);
  swift_endAccess(v11);
  objc_msgSend(*(id *)((char *)&v7->super.super.super.super.isa + OBJC_IVAR___CHStackListTableViewCell_iconImageView), "setImage:", 0);

}

- (CHStackListTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002B5EE0();
}

- (void).cxx_destruct
{
  sub_10001BE90((uint64_t)self + OBJC_IVAR___CHStackListTableViewCell_fitnessPlusStackViewModel, (uint64_t *)&unk_100828380);

}

@end

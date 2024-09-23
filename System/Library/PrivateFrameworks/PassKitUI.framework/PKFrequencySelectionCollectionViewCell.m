@implementation PKFrequencySelectionCollectionViewCell

- (void)configureWithOptions:(id)a3 selectedFrequency:(unint64_t)a4 selectedDate:(id)a5 isEditable:(BOOL)a6 titleColor:(id)a7 changeHandler:(id)a8
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  void *v27;
  void (**v28)();
  id v29;
  _TtC9PassKitUI38PKFrequencySelectionCollectionViewCell *v30;
  _TtC9PassKitUI38PKFrequencySelectionCollectionViewCell *v31;
  uint64_t v32;
  char *v33;
  unint64_t v34;
  _BOOL4 v35;
  id v36;

  v36 = a7;
  v35 = a6;
  v34 = a4;
  v31 = self;
  v9 = sub_19DE83ACC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x1E0C80A78](v9, v12);
  v13 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14, v15);
  v17 = (char *)&v31 - v16;
  v18 = _Block_copy(a8);
  v32 = sub_19DE87E10();
  v33 = v17;
  sub_19DE83A84();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v18;
  v20 = swift_allocObject();
  swift_unknownObjectWeakInit();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v17, v9);
  v21 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v22 = v21 + v11;
  v23 = (char *)swift_allocObject();
  *((_QWORD *)v23 + 2) = v20;
  v24 = v34;
  *((_QWORD *)v23 + 3) = v32;
  *((_QWORD *)v23 + 4) = v24;
  v25 = v13;
  v26 = v9;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v23[v21], v25, v9);
  v23[v22] = v35;
  v27 = v36;
  *(_QWORD *)&v23[(v22 & 0xFFFFFFFFFFFFFFF8) + 8] = v36;
  v28 = (void (**)())&v23[((v22 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8];
  *v28 = sub_19D726730;
  v28[1] = (void (*)())v19;
  v29 = v27;
  v30 = v31;
  sub_19DE82F08();
  sub_19DE82CB0();
  sub_19DE88290();
  -[PKFrequencySelectionCollectionViewCell setNeedsUpdateConfiguration](v30, sel_setNeedsUpdateConfiguration);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v33, v26);
}

- (_TtC9PassKitUI38PKFrequencySelectionCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PKFrequencySelectionCollectionViewCell();
  return -[PKFrequencySelectionCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9PassKitUI38PKFrequencySelectionCollectionViewCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PKFrequencySelectionCollectionViewCell();
  return -[PKFrequencySelectionCollectionViewCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end

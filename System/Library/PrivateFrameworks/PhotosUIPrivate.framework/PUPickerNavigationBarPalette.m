@implementation PUPickerNavigationBarPalette

- (PUPickerNavigationBarPalette)initWithTopView:(id)a3 bottomView:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  return (PUPickerNavigationBarPalette *)sub_1AABDC930(a3, a4);
}

- (void)layoutSubviews
{
  PUPickerNavigationBarPalette *v2;

  v2 = self;
  sub_1AABDCD3C();

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  PUPickerNavigationBarPalette *v14;
  uint64_t v15;
  id v16;
  PUPickerNavigationBarPalette *v17;
  _OWORD v18[2];

  if (a3)
  {
    v10 = sub_1AB08D498();
    v12 = v11;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v18, 0, sizeof(v18));
    v16 = a5;
    v17 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  v12 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain();
  v13 = a5;
  v14 = self;
  sub_1AB08DCA8();
  swift_unknownObjectRelease();
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_1AAB8FD04(&qword_1EEBBA848, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_1AB0E2708);
  v15 = sub_1AB08D3A8();

LABEL_8:
  sub_1AABDCDA4(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AAB849A4((uint64_t)v18);
}

- (void)sizeTraitsDidChange
{
  PUPickerNavigationBarPalette *v2;

  v2 = self;
  sub_1AABDD37C();

}

- (PUPickerNavigationBarPalette)initWithContentView:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AABDD580();
}

@end

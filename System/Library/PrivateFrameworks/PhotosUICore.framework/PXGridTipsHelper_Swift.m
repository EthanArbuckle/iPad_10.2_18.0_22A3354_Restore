@implementation PXGridTipsHelper_Swift

- (PXGridTipsHelper_Swift)init
{
  PXGridTipsHelper_Swift *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v2 = self;
  v4 = PXDisplayCollectionDetailedCountsMake(v2, v3);
  v6 = PXDisplayCollectionDetailedCountsMake(v4, v5);
  PXDisplayCollectionDetailedCountsMake(v6, v7);
  *((_BYTE *)&v2->super.super.isa + OBJC_IVAR___PXGridTipsHelper_Swift_hasStartedTips) = 0;

  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for PXGridTipsHelper();
  return -[PXTipsHelper_Swift init](&v9, sel_init);
}

+ (void)setTip:(id)a3 isPresentable:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  BOOL v9;
  _QWORD *v10;
  BOOL v11;
  _QWORD *v12;

  v4 = a4;
  v5 = sub_1A7AE3764();
  v7 = v6;
  v8 = sub_1A6847C20();
  v9 = *v8 == v5 && v8[1] == v7;
  if (v9 || (sub_1A7AE4DB4() & 1) != 0)
  {
    sub_1A6A31AD4(v4);
  }
  else
  {
    v10 = sub_1A6847C2C();
    v11 = *v10 == v5 && v10[1] == v7;
    if (v11 || (sub_1A7AE4DB4() & 1) != 0)
    {
      sub_1A6847F58(v4);
    }
    else
    {
      v12 = sub_1A6A31AB4();
      if (*v12 == v5 && v12[1] == v7 || (sub_1A7AE4DB4() & 1) != 0)
        sub_1A6A323AC(v4);
    }
  }
  swift_bridgeObjectRelease();
}

+ (NSString)curatedLibrarySwitchTipID
{
  return (NSString *)sub_1A6848288((uint64_t)a1, (uint64_t)a2, qword_1EE923010);
}

+ (NSString)syndicatedAssetsTipID
{
  return (NSString *)sub_1A6848288((uint64_t)a1, (uint64_t)a2, &qword_1EE924550);
}

+ (void)setTipsPresentationDelegate:(id)a3
{
  uint64_t v3;

  swift_getObjCClassMetadata();
  v3 = swift_unknownObjectRetain();
  sub_1A67EBEC0(v3);
  swift_unknownObjectRelease();
}

+ (PXGridTipsHelper_Swift)shared
{
  if (qword_1EE924560 != -1)
    swift_once();
  return (PXGridTipsHelper_Swift *)(id)qword_1EE924558;
}

+ (NSString)filterAllPhotosTipID
{
  return (NSString *)sub_1A6848288((uint64_t)a1, (uint64_t)a2, qword_1EE92FBC8);
}

+ (void)setTipActionPerformed:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1A7AE3764();
  _s12PhotosUICore16PXGridTipsHelperC21setTipActionPerformedyySSFZ_0(v3, v4);
  swift_bridgeObjectRelease();
}

@end

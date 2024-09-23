@implementation CRLiOSFolderGridViewController.Item

- (_TtCC8Freeform30CRLiOSFolderGridViewController4Item)initWithFrame:(CGRect)a3
{
  return (_TtCC8Freeform30CRLiOSFolderGridViewController4Item *)sub_100B312E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC8Freeform30CRLiOSFolderGridViewController4Item)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100B36164();
}

- (BOOL)isSelected
{
  return sub_100B31654(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _TtCC8Freeform30CRLiOSFolderGridViewController4Item *v4;

  v4 = self;
  sub_100B314D4(a3);

}

- (BOOL)isHighlighted
{
  return sub_100B31654(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _TtCC8Freeform30CRLiOSFolderGridViewController4Item *v4;

  v4 = self;
  sub_100B316D4(a3);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1006EE818(self, (uint64_t)a2, (void (*)(void))sub_100B34024);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1006EE818(self, (uint64_t)a2, (void (*)(void))sub_100B345D8);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1006EE818(self, (uint64_t)a2, (void (*)(void))sub_100B34788);
}

- (NSArray)accessibilityCustomActions
{
  _TtCC8Freeform30CRLiOSFolderGridViewController4Item *v2;
  double *v3;
  NSArray v4;

  v2 = self;
  v3 = sub_100B34A4C();

  if (v3)
  {
    sub_1004B8930(0, &qword_1013E78E8, UIAccessibilityCustomAction_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (BOOL)accessibilityPerformMagicTap
{
  _TtCC8Freeform30CRLiOSFolderGridViewController4Item *v2;
  char v3;

  v2 = self;
  v3 = sub_100B35374();

  return v3 & 1;
}

- (void).cxx_destruct
{
  sub_1006F00F4((uint64_t)self + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController4Item_item);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController4Item_crlaxDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController4Item_viewController));
}

@end

@implementation CRLiOSFolderGridViewController.iOSListItem

- (_TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem)initWithFrame:(CGRect)a3
{
  return (_TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem *)sub_1006ED1DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1006F032C();
}

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_s11iOSListItemCMa(0);
  return -[CRLiOSFolderGridViewController.iOSListItem isSelected](&v3, "isSelected");
}

- (void)setSelected:(BOOL)a3
{
  _TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem *v4;

  v4 = self;
  sub_1006ED5A0(a3);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1006EE818(self, (uint64_t)a2, (void (*)(void))sub_1006EE0B4);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1006EE818(self, (uint64_t)a2, (void (*)(void))sub_1006EE668);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1006EE818(self, (uint64_t)a2, (void (*)(void))sub_1006EE880);
}

- (NSArray)accessibilityCustomActions
{
  _TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem *v2;
  double *v3;
  NSArray v4;

  v2 = self;
  v3 = sub_1006EEB44();

  if (v3)
  {
    sub_1004B8930(0, &qword_1013E78E8, UIAccessibilityCustomAction_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (BOOL)accessibilityPerformMagicTap
{
  _TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem *v2;
  char v3;

  v2 = self;
  v3 = sub_1006EF638();

  return v3 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->crlaxLastEditedTimestampText[OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem_crlaxLastEditedTimestampText]);
  sub_1006F00F4((uint64_t)self + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem_item);
  swift_bridgeObjectRelease(*(_QWORD *)&self->crlaxLastEditedTimestampText[OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem_boardTitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->crlaxLastEditedTimestampText[OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem_lastEditedTimestampText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->crlaxLastEditedTimestampText[OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem_collaboratorName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->crlaxLastEditedTimestampText[OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem_folderName]);
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem_crlaxDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem_viewController));
}

@end

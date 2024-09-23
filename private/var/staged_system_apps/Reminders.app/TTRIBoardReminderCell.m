@implementation TTRIBoardReminderCell

- (_TtC9Reminders21TTRIBoardReminderCell)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders21TTRIBoardReminderCell *)sub_1001F06A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC9Reminders21TTRIBoardReminderCell)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders21TTRIBoardReminderCell *)sub_1001F09D0(v3, v4);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC9Reminders21TTRIBoardReminderCell *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = type metadata accessor for UICellConfigurationState(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1001F0B5C((uint64_t)v8, v10);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)prepareForReuse
{
  uint64_t v2;
  _TtC9Reminders21TTRIBoardReminderCell *v3;

  v3 = self;
  sub_1001F12F8((uint64_t)v3, v2);

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _BYTE v10[24];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType(self, a2);
  v4 = a3;
  v5 = (char *)v11.receiver;
  -[TTRIBoardReminderCell applyLayoutAttributes:](&v11, "applyLayoutAttributes:", v4);
  v7 = type metadata accessor for TTRBoardColumnItemLayoutAttributes(0, v6);
  v8 = swift_dynamicCastClass(v4, v7);
  if (v8)
  {
    v9 = (_QWORD *)(v8 + direct field offset for TTRBoardColumnItemLayoutAttributes.backgroundRoundedCorners);
    swift_beginAccess(v8 + direct field offset for TTRBoardColumnItemLayoutAttributes.backgroundRoundedCorners, v10, 0, 0);
    *(_QWORD *)&v5[OBJC_IVAR____TtC9Reminders21TTRIBoardReminderCell_roundedCorners] = *v9;
  }

}

- (unint64_t)_maskedCornersForSystemBackgroundView
{
  _TtC9Reminders21TTRIBoardReminderCell *v2;
  CACornerMask v3;

  v2 = self;
  v3 = TTRRectCorners.cornerMask(layoutDirection:isFlipped:)((UIUserInterfaceLayoutDirection)-[TTRIBoardReminderCell effectiveUserInterfaceLayoutDirection](v2, "effectiveUserInterfaceLayoutDirection"), 1);

  return v3;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC9Reminders21TTRIBoardReminderCell *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = self;
  v10 = sub_1001F15C0(width, height, a4, a5);
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC9Reminders21TTRIBoardReminderCell *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = -[TTRIBoardReminderCell contentView](v5, "contentView");
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  _TtC9Reminders21TTRIBoardReminderCell *v2;

  v2 = self;
  sub_1001F17B8();

}

- (NSString)accessibilityIdentifier
{
  _TtC9Reminders21TTRIBoardReminderCell *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1001F3544();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityIdentifier:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  _TtC9Reminders21TTRIBoardReminderCell *v8;
  _TtC9Reminders21TTRIBoardReminderCell *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = self;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v9 = self;
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  -[TTRIBoardReminderCell setAccessibilityIdentifier:](&v10, "setAccessibilityIdentifier:", a3);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (NSArray)accessibilityElements
{
  _TtC9Reminders21TTRIBoardReminderCell *v2;
  _QWORD *v3;
  NSArray v4;

  v2 = self;
  v3 = sub_1001F3844();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (BOOL)accessibilityActivate
{
  _TtC9Reminders21TTRIBoardReminderCell *v2;
  uint64_t v3;
  char v4;

  v2 = self;
  v4 = sub_1001F3C20((uint64_t)v2, v3);

  return v4 & 1;
}

- (BOOL)accessibilityPerformEscape
{
  _TtC9Reminders21TTRIBoardReminderCell *v2;
  _TtC9Reminders21TTRIBoardReminderCell *v3;
  uint64_t v4;
  _TtC9Reminders21TTRIBoardReminderCell *v5;
  unsigned __int8 v6;

  v2 = self;
  v3 = (_TtC9Reminders21TTRIBoardReminderCell *)-[TTRIBoardReminderCell contentView](v2, "contentView");
  v4 = type metadata accessor for TTRIBoardReminderCellContentView(0);
  if (swift_dynamicCastClass(v3, v4))
  {
    v5 = (_TtC9Reminders21TTRIBoardReminderCell *)UIView.firstResponderDescendant.getter();

    if (!v5)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v6 = -[TTRIBoardReminderCell resignFirstResponder](v5, "resignFirstResponder");
    v3 = v5;
  }
  else
  {
    v6 = 0;
  }

  v2 = v3;
LABEL_7:

  return v6;
}

- (NSArray)accessibilityCustomActions
{
  _TtC9Reminders21TTRIBoardReminderCell *v2;
  uint64_t v3;
  unint64_t v4;
  NSArray v5;

  v2 = self;
  v4 = sub_1001F4284((uint64_t)v2, v3);

  if (v4)
  {
    sub_100005ED8(0, (unint64_t *)&unk_1006466C0, UIAccessibilityCustomAction_ptr);
    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5.super.isa = 0;
  }
  return (NSArray *)v5.super.isa;
}

- (id)_accessibilityInternalTextLinks
{
  _TtC9Reminders21TTRIBoardReminderCell *v2;
  id v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  Class isa;

  v2 = self;
  v3 = -[TTRIBoardReminderCell contentView](v2, "contentView");
  v4 = type metadata accessor for TTRIBoardReminderCellContentView(0);
  if (swift_dynamicCastClass(v3, v4))
  {
    sub_1003F5E28();
    v6 = v5;
  }
  else
  {
    v6 = _swiftEmptyArrayStorage;
  }

  sub_100005ED8(0, &qword_10064CB20, UIAccessibilityLinkSubelement_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

- (void).cxx_destruct
{
  sub_1000381C8((uint64_t)self + OBJC_IVAR____TtC9Reminders21TTRIBoardReminderCell_delegate);
  swift_release();
  sub_1000073A0((uint64_t)self + OBJC_IVAR____TtC9Reminders21TTRIBoardReminderCell_viewModelState, (uint64_t *)&unk_1006572F0);
  sub_1000073A0((uint64_t)self + OBJC_IVAR____TtC9Reminders21TTRIBoardReminderCell_titleModule, &qword_10064CB38);
  sub_1000073A0((uint64_t)self + OBJC_IVAR____TtC9Reminders21TTRIBoardReminderCell_notesModule, &qword_10064CB40);
  sub_1000073A0((uint64_t)self + OBJC_IVAR____TtC9Reminders21TTRIBoardReminderCell_autoCompleteModule, &qword_10064CB48);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRIBoardReminderCell_customAccessibilityElement));
}

@end

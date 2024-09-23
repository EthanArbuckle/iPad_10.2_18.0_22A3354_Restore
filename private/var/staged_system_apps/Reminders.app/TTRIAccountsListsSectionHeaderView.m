@implementation TTRIAccountsListsSectionHeaderView

- (_TtC9Reminders34TTRIAccountsListsSectionHeaderView)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC9Reminders34TTRIAccountsListsSectionHeaderView *)sub_100019F0C(v3, v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_outerStackView), "effectiveLayoutSizeFittingSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC9Reminders34TTRIAccountsListsSectionHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002603F8();
}

- (void)toggleExpandState
{
  char *v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(_QWORD *, uint64_t, uint64_t);
  _TtC9Reminders34TTRIAccountsListsSectionHeaderView *v10;
  _QWORD v11[5];
  _BYTE v12[24];

  v3 = (char *)self + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_treeCellViewDelegate;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_treeCellViewDelegate, v12, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v6 = Strong;
    v7 = *((_QWORD *)v3 + 1);
    ObjectType = swift_getObjectType(Strong, v5);
    v11[3] = type metadata accessor for TTRIAccountsListsSectionHeaderView();
    v11[4] = &off_1005F9AC8;
    v11[0] = self;
    v9 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v7 + 8);
    v10 = self;
    v9(v11, ObjectType, v7);
    swift_unknownObjectRelease(v6);
    sub_100027F10(v11);

  }
}

- (void)handleLongPressGesture:(id)a3
{
  id v4;
  _TtC9Reminders34TTRIAccountsListsSectionHeaderView *v5;

  v4 = a3;
  v5 = self;
  sub_10025EEFC(v4);

}

- (void)migrateButtonAction:(id)a3
{
  _TtC9Reminders34TTRIAccountsListsSectionHeaderView *v5;
  _QWORD v6[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v6);
  swift_unknownObjectRelease(a3);
  sub_10025F250((uint64_t)v6);

  sub_100027F10(v6);
}

- (NSString)accessibilityIdentifier
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _TtC9Reminders34TTRIAccountsListsSectionHeaderView *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSString v10;

  v3 = *(_QWORD *)&self->identifier[OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_identifier];
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    v5 = *(Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_labelView);
    v6 = self;
    v7 = objc_msgSend(v5, "text");
    if (!v7)
    {

      v10 = 0;
      return (NSString *)v10;
    }
    v8 = v7;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
    v4 = v9;

    v3 = 0;
  }
  swift_bridgeObjectRetain(v3);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v10;
}

- (void)setAccessibilityIdentifier:(id)a3
{
  sub_10025F7B4(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityIdentifier_);
}

- (NSString)accessibilityLabel
{
  void *v2;
  _TtC9Reminders34TTRIAccountsListsSectionHeaderView *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_labelView);
  v3 = self;
  v4 = objc_msgSend(v2, "text");
  if (v4)
  {
    v5 = v4;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v7 = v6;

    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {

    v8 = 0;
  }
  return (NSString *)v8;
}

- (void)setAccessibilityLabel:(id)a3
{
  sub_10025F7B4(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityLabel_);
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_hasDisclosureControl);
}

- (NSArray)accessibilityUserInputLabels
{
  void *v2;
  _TtC9Reminders34TTRIAccountsListsSectionHeaderView *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  Class isa;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_labelView);
  v3 = self;
  v4 = objc_msgSend(v2, "text");
  if (v4)
  {
    v5 = v4;
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v8 = v7;

    v9 = sub_10002A750((uint64_t *)&unk_100654F80);
    v10 = (_QWORD *)swift_allocObject(v9, 48, 7);
    *((_OWORD *)v10 + 1) = xmmword_100520250;
    v10[4] = v6;
    v10[5] = v8;
  }
  else
  {
    v10 = _swiftEmptyArrayStorage;
  }

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v10);
  return (NSArray *)isa;
}

- (NSString)accessibilityValue
{
  _TtC9Reminders34TTRIAccountsListsSectionHeaderView *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;
  _QWORD *v12;

  v2 = self;
  v12 = sub_10025FBF8();
  v3 = (uint64_t *)TTRAccesibility.General.Label.Separator.unsafeMutableAddressor(v12);
  v4 = *v3;
  v5 = v3[1];
  swift_bridgeObjectRetain(v5);
  v6 = sub_10002A750(&qword_1006466D0);
  v7 = sub_1000923A8();
  BidirectionalCollection<>.joined(separator:)(v4, v5, v6, v7);
  v9 = v8;

  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v5);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  return (NSString *)v10;
}

- (void)setAccessibilityValue:(id)a3
{
  sub_10025F7B4(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityValue_);
}

- (NSString)accessibilityHint
{
  _TtC9Reminders34TTRIAccountsListsSectionHeaderView *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10025F6A4();
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

- (void)setAccessibilityHint:(id)a3
{
  sub_10025F7B4(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityHint_);
}

- (BOOL)accessibilityActivate
{
  _TtC9Reminders34TTRIAccountsListsSectionHeaderView *v2;
  char v3;

  v2 = self;
  v3 = sub_10025F840();

  return v3 & 1;
}

- (NSArray)accessibilityCustomActions
{
  _TtC9Reminders34TTRIAccountsListsSectionHeaderView *v2;
  uint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_10025F9A0();

  if (v3)
  {
    sub_100005ED8(0, (unint64_t *)&unk_1006466C0, UIAccessibilityCustomAction_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)setAccessibilityCustomActions:(id)a3
{
  void *isa;
  uint64_t v5;
  uint64_t v6;
  _TtC9Reminders34TTRIAccountsListsSectionHeaderView *v7;
  _TtC9Reminders34TTRIAccountsListsSectionHeaderView *v8;
  objc_super v9;

  isa = a3;
  if (a3)
  {
    v5 = sub_100005ED8(0, (unint64_t *)&unk_1006466C0, UIAccessibilityCustomAction_ptr);
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(isa, v5);
    v7 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v8 = self;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TTRIAccountsListsSectionHeaderView();
  -[TTRIAccountsListsSectionHeaderView setAccessibilityCustomActions:](&v9, "setAccessibilityCustomActions:", isa);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_identifier]);
  sub_1000381C8((uint64_t)self + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_accountID));
  sub_1000073A0((uint64_t)self + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_treeCellViewModel, (uint64_t *)&unk_10065BDF0);
  sub_1000381C8((uint64_t)self + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_treeCellViewDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_outerStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_innerStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_labelView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_migrateButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_migratingSpinner));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_disclosureView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_collapseGestureRecognizers));
}

@end

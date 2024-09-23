@implementation TTRIRemindersListEditableSectionCell

+ (Class)containerViewClass
{
  uint64_t v2;

  v2 = sub_100005ED8(0, &qword_100659008, NUIContainerBoxView_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (BOOL)isHidden
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[TTRIRemindersListEditableSectionCell isHidden](&v3, "isHidden");
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  _TtC9Reminders36TTRIRemindersListEditableSectionCell *v6;
  unsigned int v7;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v10.receiver = self;
  v10.super_class = ObjectType;
  v6 = self;
  v7 = -[TTRIRemindersListEditableSectionCell isHidden](&v10, "isHidden");
  v9.receiver = v6;
  v9.super_class = ObjectType;
  -[TTRIRemindersListEditableSectionCell setHidden:](&v9, "setHidden:", v3);
  v8.receiver = v6;
  v8.super_class = ObjectType;
  if (v7 != -[TTRIRemindersListEditableSectionCell isHidden](&v8, "isHidden"))
    -[TTRIRemindersListEditableSectionCell setNeedsLayout](v6, "setNeedsLayout");

}

- (void)containerViewDidLoad
{
  uint64_t v2;
  _TtC9Reminders36TTRIRemindersListEditableSectionCell *v3;

  v3 = self;
  sub_1003CFAB4((uint64_t)v3, v2);

}

- (void)prepareForReuse
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC9Reminders36TTRIRemindersListEditableSectionCell *v7;
  uint64_t v8;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = sub_10002A750((uint64_t *)&unk_100654970);
  __chkstk_darwin(v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9.receiver = self;
  v9.super_class = ObjectType;
  v7 = self;
  -[TTRIRemindersListEditableSectionCell prepareForReuse](&v9, "prepareForReuse");
  v8 = type metadata accessor for TTRRemindersListEditableSectionNameViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  sub_1003CF02C((uint64_t)v6);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_class *ObjectType;
  _TtC9Reminders36TTRIRemindersListEditableSectionCell *v8;
  unsigned int v9;
  objc_super v10;

  v4 = a4;
  v5 = a3;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v8 = self;
  v9 = -[TTRIRemindersListEditableSectionCell isEditing](v8, "isEditing");
  v10.receiver = v8;
  v10.super_class = ObjectType;
  -[TTRIRemindersListEditableSectionCell setEditing:animated:](&v10, "setEditing:animated:", v5, v4);
  if (v9 != v5)
    sub_1003CF220();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  objc_class *ObjectType;
  _TtC9Reminders36TTRIRemindersListEditableSectionCell *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  objc_super v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v15.receiver = self;
  v15.super_class = ObjectType;
  v7 = self;
  -[TTRIRemindersListEditableSectionCell sizeThatFits:](&v15, "sizeThatFits:", width, height);
  v9 = v8;
  v11 = v10;
  v14.receiver = v7;
  v14.super_class = ObjectType;
  LODWORD(ObjectType) = -[TTRIRemindersListEditableSectionCell isHidden](&v14, "isHidden");

  if ((_DWORD)ObjectType)
    v12 = 1.0;
  else
    v12 = v11;
  v13 = v9;
  result.height = v12;
  result.width = v13;
  return result;
}

- (_TtC9Reminders36TTRIRemindersListEditableSectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders36TTRIRemindersListEditableSectionCell *)sub_1003D0EA8(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders36TTRIRemindersListEditableSectionCell)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders36TTRIRemindersListEditableSectionCell *)sub_1003D108C(v3, v4);
}

- (void).cxx_destruct
{
  sub_1000381C8((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders36TTRIRemindersListEditableSectionCell_delegate]);
  sub_1000073A0((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders36TTRIRemindersListEditableSectionCell_viewModel], (uint64_t *)&unk_100654970);
  sub_1000073A0((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders36TTRIRemindersListEditableSectionCell_treeCellViewModel], (uint64_t *)&unk_10065BDF0);
  sub_1000381C8((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders36TTRIRemindersListEditableSectionCell_treeCellViewDelegate]);
  sub_1000073A0((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders36TTRIRemindersListEditableSectionCell_nameModule], (uint64_t *)&unk_1006653B0);

}

- (BOOL)isAccessibilityElement
{
  void *v2;

  v2 = *(void **)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders36TTRIRemindersListEditableSectionCell_nameTextView];
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "isEditing") ^ 1;
  else
    __break(1u);
  return (char)v2;
}

- (BOOL)accessibilityActivate
{
  _TtC9Reminders36TTRIRemindersListEditableSectionCell *v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = self;
  v4 = sub_1003D19A0((uint64_t)v2, v3);

  return v4 & 1;
}

- (NSString)accessibilityLabel
{
  _TtC9Reminders36TTRIRemindersListEditableSectionCell *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1003D1B2C();
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

- (NSString)accessibilityValue
{
  return (NSString *)sub_1003D1C34(self, (uint64_t)a2, (uint64_t (*)(uint64_t))&TTRAccesibility.AccountsList.Attributes.Expanded.unsafeMutableAddressor, (uint64_t (*)(uint64_t))&TTRAccesibility.AccountsList.Attributes.Collapsed.unsafeMutableAddressor);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1003D1C34(self, (uint64_t)a2, (uint64_t (*)(uint64_t))&TTRAccesibility.AccountsList.Hint.HeadingCollapse.unsafeMutableAddressor, (uint64_t (*)(uint64_t))&TTRAccesibility.AccountsList.Hint.HeadingExpand.unsafeMutableAddressor);
}

- (NSArray)accessibilityUserInputLabels
{
  _TtC9Reminders36TTRIRemindersListEditableSectionCell *v2;
  _QWORD *v3;
  NSArray v4;

  v2 = self;
  v3 = sub_1003D1DC8();

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

- (NSArray)accessibilityCustomActions
{
  _TtC9Reminders36TTRIRemindersListEditableSectionCell *v2;
  uint64_t v3;
  _QWORD *v4;
  NSArray v5;

  v2 = self;
  v4 = sub_1003D1FD4((uint64_t)v2, v3);

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

- (void)setAccessibilityCustomActions:(id)isa
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  _TtC9Reminders36TTRIRemindersListEditableSectionCell *v8;
  double v9;
  _TtC9Reminders36TTRIRemindersListEditableSectionCell *v10;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (isa)
  {
    v6 = sub_100005ED8(0, (unint64_t *)&unk_1006466C0, UIAccessibilityCustomAction_ptr);
    v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(isa, v6);
    v8 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    *(_QWORD *)&v9 = swift_bridgeObjectRelease(v7).n128_u64[0];
  }
  else
  {
    v10 = self;
  }
  v11.receiver = self;
  v11.super_class = ObjectType;
  -[TTRIRemindersListEditableSectionCell setAccessibilityCustomActions:](&v11, "setAccessibilityCustomActions:", isa, v9);

}

- (unint64_t)accessibilityTraits
{
  id v2;
  unint64_t v3;
  UIAccessibilityTraits v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v6.receiver;
  v3 = -[TTRIRemindersListEditableSectionCell accessibilityTraits](&v6, "accessibilityTraits");
  v4 = UIAccessibilityTraitHeader;

  return v4 | v3;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self, a2);
  -[TTRIRemindersListEditableSectionCell setAccessibilityTraits:](&v4, "setAccessibilityTraits:", a3);
}

@end

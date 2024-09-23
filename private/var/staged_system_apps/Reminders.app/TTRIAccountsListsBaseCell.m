@implementation TTRIAccountsListsBaseCell

+ (Class)containerViewClass
{
  uint64_t v2;

  v2 = sub_100005ED8(0, &qword_10065BE20, NUIContainerGridView_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC9Reminders25TTRIAccountsListsBaseCell *v6;

  v4 = *(_QWORD *)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_titleLabel];
  v5 = a3;
  v6 = self;
  UITableViewCell.setSeparatorInsetType(_:)(v4);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC9Reminders25TTRIAccountsListsBaseCell *v6;
  _TtC9Reminders25TTRIAccountsListsBaseCell *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_needsUpdateGridSubviewRows] == 1)
  {
    self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_needsUpdateGridSubviewRows] = 0;
    v6 = self;
    sub_100026548();
  }
  else
  {
    v7 = self;
  }
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for TTRIAccountsListsBaseCell();
  -[TTRIAccountsListsBaseCell sizeThatFits:](&v14, "sizeThatFits:", width, height);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;
  id v7;
  id v8;
  objc_super v9;

  v4 = a4;
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TTRIAccountsListsBaseCell();
  v6 = v9.receiver;
  -[TTRIAccountsListsBaseCell setEditing:animated:](&v9, "setEditing:animated:", v5, v4);
  if ((*((_BYTE *)v6 + OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_unitTest_forceLargeTextLayout) & 1) != 0
    || (v7 = objc_msgSend(v6, "traitCollection", v9.receiver, v9.super_class),
        v8 = objc_msgSend(v7, "preferredContentSizeCategory"),
        v7,
        LOBYTE(v7) = UIContentSizeCategory.isAccessibilityCategory.getter(v8),
        v8,
        (v7 & 1) != 0))
  {
    objc_msgSend(v6, "layoutIfNeeded", v9.receiver, v9.super_class);
  }

}

- (void)layoutSubviews
{
  _BYTE *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRIAccountsListsBaseCell();
  v2 = v3.receiver;
  -[TTRIAccountsListsBaseCell layoutSubviews](&v3, "layoutSubviews");
  if (v2[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_needsUpdateGridSubviewRows] == 1)
  {
    v2[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_needsUpdateGridSubviewRows] = 0;
    sub_100026548();
  }

}

- (_TtC9Reminders25TTRIAccountsListsBaseCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders25TTRIAccountsListsBaseCell *)sub_100026FD4(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders25TTRIAccountsListsBaseCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004159D8();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _TtC9Reminders25TTRIAccountsListsBaseCell *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100414C24((uint64_t)v6, (uint64_t)v7);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  id v2;
  unint64_t v3;
  unsigned int v4;
  UIAccessibilityTraits v5;
  unint64_t v6;
  UIAccessibilityTraits v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TTRIAccountsListsBaseCell();
  v2 = v10.receiver;
  v3 = -[TTRIAccountsListsBaseCell accessibilityTraits](&v10, "accessibilityTraits");
  v4 = objc_msgSend(v2, "isSelected", v10.receiver, v10.super_class);
  v5 = UIAccessibilityTraitSelected;

  v6 = v3 & ~v5;
  if ((v5 & v3) == 0)
    v6 = v3;
  if ((v5 & v3) == v5)
    v7 = 0;
  else
    v7 = v5;
  v8 = v7 | v3;
  if (v4)
    return v8;
  else
    return v6;
}

- (NSString)accessibilityLabel
{
  _TtC9Reminders25TTRIAccountsListsBaseCell *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100414E6C();
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

- (void)setAccessibilityLabel:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC9Reminders25TTRIAccountsListsBaseCell *v6;
  NSString v7;
  _TtC9Reminders25TTRIAccountsListsBaseCell *v8;
  objc_super v9;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
    v6 = self;
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v8 = self;
    v7 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TTRIAccountsListsBaseCell();
  -[TTRIAccountsListsBaseCell setAccessibilityLabel:](&v9, "setAccessibilityLabel:", v7);

}

- (NSArray)accessibilityUserInputLabels
{
  void *v2;
  _TtC9Reminders25TTRIAccountsListsBaseCell *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  Class isa;

  v2 = *(void **)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_titleLabel];
  v3 = self;
  v4 = objc_msgSend(v2, "text");
  if (v4)
  {
    v5 = v4;
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v8 = v7;

  }
  else
  {
    v9 = (uint64_t *)TTRAccesibility.General.Label.Untitled.unsafeMutableAddressor();
    v6 = *v9;
    v8 = v9[1];
    swift_bridgeObjectRetain(v8);
  }
  v10 = sub_10002A750((uint64_t *)&unk_100654F80);
  v11 = swift_allocObject(v10, 48, 7);
  *(_OWORD *)(v11 + 16) = xmmword_100520250;
  *(_QWORD *)(v11 + 32) = v6;
  *(_QWORD *)(v11 + 40) = v8;

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v11);
  return (NSArray *)isa;
}

- (BOOL)accessibilityActivate
{
  _TtC9Reminders25TTRIAccountsListsBaseCell *v2;
  uint64_t Strong;
  uint64_t v4;
  BOOL v5;
  objc_super v7;

  v2 = self;
  if (-[TTRIAccountsListsBaseCell isEditing](v2, "isEditing"))
  {
    Strong = swift_unknownObjectWeakLoadStrong(&v2->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_delegate]);
    if (Strong)
    {
      v4 = Strong;
      sub_100068DD0(v2);

      swift_unknownObjectRelease(v4);
    }
    else
    {

    }
    return 1;
  }
  else
  {
    v7.receiver = v2;
    v7.super_class = (Class)type metadata accessor for TTRIAccountsListsBaseCell();
    v5 = -[TTRIAccountsListsBaseCell accessibilityActivate](&v7, "accessibilityActivate");

  }
  return v5;
}

- (BOOL)ttriAccessibilityIsSpeakThisElement
{
  return -[TTRIAccountsListsBaseCell isHidden](self, "isHidden") ^ 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->ttriAccessibilityCount[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_ttriAccessibilityGroupName]);
  sub_100092308((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_treeCellViewModel]);
  sub_1000381C8((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_treeCellViewDelegate]);
  sub_1000381C8((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_delegate]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_ttriAccessibilityAdditionalLabelAttributes]);
}

@end

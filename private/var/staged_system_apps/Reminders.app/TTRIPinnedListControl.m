@implementation TTRIPinnedListControl

- (void)layoutSubviews
{
  char *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v12.receiver;
  -[TTRIPinnedListControl layoutSubviews](&v12, "layoutSubviews");
  objc_msgSend(v2, "bounds", v12.receiver, v12.super_class);
  v7 = *(void **)&v2[OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_gradientBackgroundView];
  if (v7)
  {
    v8 = v3;
    v9 = v4;
    v10 = v5;
    v11 = v6;
    objc_msgSend(v7, "setFrame:");
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_grid], "setFrame:", v8, v9, v10, v11);

  }
  else
  {
    __break(1u);
  }
}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v3.receiver;
  -[TTRIPinnedListControl tintColorDidChange](&v3, "tintColorDidChange");
  sub_10001EA80();

}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  return 1;
}

- (BOOL)isHighlighted
{
  return sub_100018B5C(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (BOOL)isSelected
{
  return sub_100018B5C(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_grid), "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC9Reminders21TTRIPinnedListControl)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100107104();
}

- (void)setSelected:(BOOL)a3
{
  sub_100105EB4(self, (uint64_t)a2, a3, (SEL *)&selRef_isSelected, (SEL *)&selRef_setSelected_);
}

- (void)setHighlighted:(BOOL)a3
{
  sub_100105EB4(self, (uint64_t)a2, a3, (SEL *)&selRef_isHighlighted, (SEL *)&selRef_setHighlighted_);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  uint64_t Strong;
  uint64_t v7;
  id v8;
  _TtC9Reminders21TTRIPinnedListControl *v9;
  void *v10;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_delegate);
  if (Strong)
  {
    v7 = Strong;
    v8 = a3;
    v9 = self;
    v10 = (void *)sub_10024FDB8((uint64_t)v9);

    swift_unknownObjectRelease(v7);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  char v5;
  id v9;
  id v10;
  _TtC9Reminders21TTRIPinnedListControl *v11;

  v5 = *((_BYTE *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_isContextMenuTarget);
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_isContextMenuTarget) = 1;
  if ((v5 & 1) == 0)
  {
    v9 = a3;
    v10 = a4;
    swift_unknownObjectRetain(a5);
    v11 = self;
    sub_100105D20((uint64_t)v11);

    swift_unknownObjectRelease(a5);
  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  int v5;
  id v9;
  id v10;
  _TtC9Reminders21TTRIPinnedListControl *v11;

  v5 = *((unsigned __int8 *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_isContextMenuTarget);
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_isContextMenuTarget) = 0;
  if (v5 == 1)
  {
    v9 = a3;
    v10 = a4;
    swift_unknownObjectRetain(a5);
    v11 = self;
    sub_100105D20((uint64_t)v11);

    swift_unknownObjectRelease(a5);
  }
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _TtC9Reminders21TTRIPinnedListControl *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100106104(v6, (uint64_t)v7);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  _TtC9Reminders21TTRIPinnedListControl *v2;
  uint64_t v3;
  UIAccessibilityTraits v4;

  v2 = self;
  v4 = sub_1001062CC((uint64_t)v2, v3);

  return v4;
}

- (NSString)accessibilityLabel
{
  _TtC9Reminders21TTRIPinnedListControl *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1001063E8();
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

- (NSArray)accessibilityUserInputLabels
{
  _TtC9Reminders21TTRIPinnedListControl *v2;
  uint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_100106B5C();

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

- (NSArray)accessibilityElements
{
  return (NSArray *)0;
}

- (NSString)accessibilityHint
{
  _TtC9Reminders21TTRIPinnedListControl *v2;
  uint64_t v3;
  NSString v4;
  uint64_t v5;

  v2 = self;
  if ((UIAccessibilityTraitNotEnabled & ~sub_1001062CC((uint64_t)v2, v3)) != 0)
  {
    v5 = *(_QWORD *)(TTRAccesibility.AccountsList.Hint.List.unsafeMutableAddressor() + 8);
    swift_bridgeObjectRetain(v5);

    v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {

    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSArray)accessibilityCustomActions
{
  _TtC9Reminders21TTRIPinnedListControl *v2;
  uint64_t v3;
  uint64_t v4;
  NSArray v5;

  v2 = self;
  v4 = sub_100106CF4((uint64_t)v2, v3);

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
  _TtC9Reminders21TTRIPinnedListControl *v8;
  _TtC9Reminders21TTRIPinnedListControl *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (isa)
  {
    v6 = sub_100005ED8(0, (unint64_t *)&unk_1006466C0, UIAccessibilityCustomAction_ptr);
    v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(isa, v6);
    v8 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v9 = self;
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  -[TTRIPinnedListControl setAccessibilityCustomActions:](&v10, "setAccessibilityCustomActions:", isa);

}

- (_TtC9Reminders21TTRIPinnedListControl)initWithFrame:(CGRect)a3
{
  sub_100106EE0((uint64_t)self, (uint64_t)a2, (uint64_t)"Reminders.TTRIPinnedListControl", 31);
}

- (void).cxx_destruct
{
  sub_10001FCE8((uint64_t)self + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_pinnedList);
  sub_1000381C8((uint64_t)self + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_gradientBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_badgeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_countLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_stackedAvatarsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_grid));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_secondRowStackView));
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  uint64_t Strong;
  uint64_t v8;
  id v9;
  _TtC9Reminders21TTRIPinnedListControl *v10;
  _QWORD *v11;
  Class isa;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_delegate);
  if (Strong)
  {
    v8 = Strong;
    v9 = a3;
    swift_unknownObjectRetain(a4);
    v10 = self;
    v11 = sub_10024FF68((uint64_t)v10);

    swift_unknownObjectRelease(a4);
    swift_unknownObjectRelease(v8);
  }
  else
  {
    v11 = _swiftEmptyArrayStorage;
  }
  sub_100005ED8(0, (unint64_t *)&qword_100650570, UIDragItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v11);
  return isa;
}

@end

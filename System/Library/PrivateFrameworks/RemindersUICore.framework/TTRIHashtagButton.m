@implementation TTRIHashtagButton

- (_TtC15RemindersUICore17TTRIHashtagButton)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore17TTRIHashtagButton *)sub_1B47DE43C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore17TTRIHashtagButton)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore17TTRIHashtagButton *)sub_1B47DE554(a3);
}

- (BOOL)canBecomeFocused
{
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(void);
  _TtC15RemindersUICore17TTRIHashtagButton *v6;
  char v7;

  v3 = (char *)self + OBJC_IVAR____TtC15RemindersUICore17TTRIHashtagButton_focusDelegate;
  swift_beginAccess();
  if (MEMORY[0x1B5E3D8DC](v3))
  {
    v4 = *((_QWORD *)v3 + 1);
    swift_getObjectType();
    v5 = *(uint64_t (**)(void))(v4 + 8);
    v6 = self;
    v7 = v5();

    swift_unknownObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7 & 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _TtC15RemindersUICore17TTRIHashtagButton *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  TTRIHashtagButton.didUpdateFocus(in:with:)((UIFocusUpdateContext)v6, (UIFocusAnimationCoordinator)v7);

}

- (NSString)accessibilityLabel
{
  _TtC15RemindersUICore17TTRIHashtagButton *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  TTRIHashtagButton.accessibilityLabel.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1B4906A34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (unint64_t)accessibilityTraits
{
  char *v2;
  unint64_t v3;
  char *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v2 = (char *)v7.receiver;
  v3 = -[TTRIHashtagButton accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = &v2[OBJC_IVAR____TtC15RemindersUICore17TTRIHashtagButton_isExcluded];
  swift_beginAccess();
  if (*v4 == 1)
  {
    v5 = *MEMORY[0x1E0DC46B0];

    if ((v5 & v3) != 0)
      v3 &= ~v5;
  }
  else
  {

  }
  return v3;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[TTRIHashtagButton setAccessibilityTraits:](&v4, sel_setAccessibilityTraits_, a3);
}

- (NSString)accessibilityValue
{
  _BYTE *v3;
  void *v4;
  uint64_t v5;
  _TtC15RemindersUICore17TTRIHashtagButton *v6;

  v3 = (char *)self + OBJC_IVAR____TtC15RemindersUICore17TTRIHashtagButton_isExcluded;
  swift_beginAccess();
  v4 = 0;
  if (*v3 == 1)
  {
    v5 = qword_1EF0988F8;
    v6 = self;
    if (v5 != -1)
      swift_once();
    _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();

    v4 = (void *)sub_1B4906A34();
    swift_bridgeObjectRelease();
  }
  return (NSString *)v4;
}

- (NSString)accessibilityHint
{
  char *v3;
  void *v4;
  uint64_t v5;
  void (*v6)(void);
  _TtC15RemindersUICore17TTRIHashtagButton *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (char *)self + OBJC_IVAR____TtC15RemindersUICore17TTRIHashtagButton_accessibilityDelegate;
  v4 = (void *)MEMORY[0x1B5E3D8DC]((char *)self + OBJC_IVAR____TtC15RemindersUICore17TTRIHashtagButton_accessibilityDelegate, a2);
  if (v4)
  {
    v5 = *((_QWORD *)v3 + 1);
    swift_getObjectType();
    v6 = *(void (**)(void))(v5 + 8);
    v7 = self;
    v6();
    v9 = v8;

    swift_unknownObjectRelease();
    if (v9)
    {
      v4 = (void *)sub_1B4906A34();
      swift_bridgeObjectRelease();
    }
    else
    {
      v4 = 0;
    }
  }
  return (NSString *)v4;
}

- (NSArray)accessibilityUserInputLabels
{
  _TtC15RemindersUICore17TTRIHashtagButton *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = TTRIHashtagButton.accessibilityUserInputLabels.getter();

  if (v3)
  {
    v4 = (void *)sub_1B4906DA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)setAccessibilityUserInputLabels:(id)a3
{
  objc_class *ObjectType;
  _TtC15RemindersUICore17TTRIHashtagButton *v6;
  _TtC15RemindersUICore17TTRIHashtagButton *v7;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1B4906DAC();
    v6 = self;
    a3 = (id)sub_1B4906DA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  -[TTRIHashtagButton setAccessibilityUserInputLabels:](&v8, sel_setAccessibilityUserInputLabels_, a3);

}

- (NSArray)accessibilityCustomActions
{
  char *v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  _TtC15RemindersUICore17TTRIHashtagButton *v7;
  uint64_t v8;

  v3 = (char *)self + OBJC_IVAR____TtC15RemindersUICore17TTRIHashtagButton_accessibilityDelegate;
  v4 = (void *)MEMORY[0x1B5E3D8DC]((char *)self + OBJC_IVAR____TtC15RemindersUICore17TTRIHashtagButton_accessibilityDelegate, a2);
  if (v4)
  {
    v5 = *((_QWORD *)v3 + 1);
    swift_getObjectType();
    v6 = *(uint64_t (**)(void))(v5 + 16);
    v7 = self;
    v8 = v6();

    swift_unknownObjectRelease();
    if (v8)
    {
      sub_1B41DF50C(0, &qword_1EF0A75D0);
      v4 = (void *)sub_1B4906DA0();
      swift_bridgeObjectRelease();
    }
    else
    {
      v4 = 0;
    }
  }
  return (NSArray *)v4;
}

- (BOOL)ttriAccessibilityShouldUseViewHierarchyForFindingScrollParent
{
  return 1;
}

- (void).cxx_destruct
{
  sub_1B41F4748((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore17TTRIHashtagButton_focusDelegate);
  sub_1B41F4748((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore17TTRIHashtagButton_accessibilityDelegate);
}

@end

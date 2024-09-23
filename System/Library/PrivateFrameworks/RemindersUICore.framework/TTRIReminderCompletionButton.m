@implementation TTRIReminderCompletionButton

- (_TtC15RemindersUICore28TTRIReminderCompletionButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _TtC15RemindersUICore28TTRIReminderCompletionButton *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore28TTRIReminderCompletionButton_preferredSymbolConfiguration) = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15RemindersUICore28TTRIReminderCompletionButton_scale) = 1;
  *(_OWORD *)((char *)&self->super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC15RemindersUICore28TTRIReminderCompletionButton_icon) = xmmword_1B4924660;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15RemindersUICore28TTRIReminderCompletionButton_prefersFadedAppearance) = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15RemindersUICore28TTRIReminderCompletionButton_togglesSelectionOnPress) = 1;
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[TTRIExpandedHitTestButton initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  sub_1B46C9D40();

  return v9;
}

- (_TtC15RemindersUICore28TTRIReminderCompletionButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s15RemindersUICore28TTRIReminderCompletionButtonC5coderACSgSo7NSCoderC_tcfc_0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[TTRIReminderCompletionButton intrinsicContentSize](self, sel_intrinsicContentSize, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)updateConfiguration
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[TTRIReminderCompletionButton updateConfiguration](&v3, sel_updateConfiguration);
  sub_1B46CA03C();

}

- (NSArray)accessibilityUserInputLabels
{
  _TtC15RemindersUICore28TTRIReminderCompletionButton *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = TTRIReminderCompletionButton.accessibilityUserInputLabels.getter();

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

- (void)onButtonPress:(id)a3
{
  id v4;
  _TtC15RemindersUICore28TTRIReminderCompletionButton *v5;

  v4 = a3;
  v5 = self;
  sub_1B46CB4E4();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore28TTRIReminderCompletionButton_preferredSymbolConfiguration));
  sub_1B454023C(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore28TTRIReminderCompletionButton_icon), *(char **)((char *)&self->super.super.super.super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore28TTRIReminderCompletionButton_icon));
}

@end

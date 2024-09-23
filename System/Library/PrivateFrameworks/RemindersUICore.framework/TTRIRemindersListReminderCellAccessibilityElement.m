@implementation TTRIRemindersListReminderCellAccessibilityElement

- (CGRect)accessibilityFrame
{
  _TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement *v2;
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v2 = self;
  v3 = -[TTRIRemindersListReminderCellAccessibilityElement accessibilityContainer](v2, sel_accessibilityContainer);
  if (!v3)
  {

LABEL_9:
    v11 = 0.0;
    v13 = 0.0;
    v7 = 0.0;
    v9 = 0.0;
    goto LABEL_10;
  }
  v4 = v3;
  swift_getObjectType();
  if (swift_conformsToProtocol2())
    v5 = v4;
  else
    v5 = 0;
  if (!v5)
  {

    swift_unknownObjectRelease();
    goto LABEL_9;
  }
  objc_msgSend(v5, sel_accessibilityFrame);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  swift_unknownObjectRelease();
LABEL_10:
  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  _TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement *v2;
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v2 = self;
  v3 = -[TTRIRemindersListReminderCellAccessibilityElement accessibilityContainer](v2, sel_accessibilityContainer);
  if (!v3)
  {

LABEL_9:
    v7 = 0.0;
    v9 = 0.0;
    goto LABEL_10;
  }
  v4 = v3;
  swift_getObjectType();
  if (swift_conformsToProtocol2())
    v5 = v4;
  else
    v5 = 0;
  if (!v5)
  {

    swift_unknownObjectRelease();
    goto LABEL_9;
  }
  objc_msgSend(v5, sel_accessibilityActivationPoint);
  v7 = v6;
  v9 = v8;

  swift_unknownObjectRelease();
LABEL_10:
  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (NSAttributedString)accessibilityAttributedLabel
{
  _TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement *v2;
  id v3;

  v2 = self;
  v3 = TTRIRemindersListReminderCellAccessibilityElement.accessibilityAttributedLabel.getter();

  return (NSAttributedString *)v3;
}

- (NSArray)accessibilityUserInputLabels
{
  _TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = TTRIRemindersListReminderCellAccessibilityElement.accessibilityUserInputLabels.getter();

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

- (unint64_t)accessibilityTraits
{
  _TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement *v2;
  unint64_t v3;

  v2 = self;
  v3 = TTRIRemindersListReminderCellAccessibilityElement.accessibilityTraits.getter();

  return v3;
}

- (NSString)accessibilityHint
{
  _TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  TTRIRemindersListReminderCellAccessibilityElement.accessibilityHint.getter();
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

- (BOOL)accessibilityActivate
{
  return sub_1B45663B8(self, (uint64_t)a2, (SEL *)&selRef_accessibilityActivate);
}

- (BOOL)accessibilityPerformEscape
{
  return sub_1B45663B8(self, (uint64_t)a2, (SEL *)&selRef_accessibilityPerformEscape);
}

- (NSArray)accessibilityCustomRotors
{
  return (NSArray *)sub_1B453B744(self, (uint64_t)a2, TTRIRemindersListReminderCellAccessibilityElement.accessibilityCustomRotors.getter, &qword_1EF09B3F8);
}

- (id)_accessibilityInternalTextLinks
{
  _TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement *v2;
  id v3;
  id v4;
  void *v5;
  _TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement *v6;
  void *v7;

  v2 = self;
  v3 = -[TTRIRemindersListReminderCellAccessibilityElement accessibilityContainer](v2, sel_accessibilityContainer);
  if (v3)
  {
    v4 = v3;
    swift_getObjectType();
    if (swift_conformsToProtocol2())
      v5 = v4;
    else
      v5 = 0;
    if (v5)
    {
      v6 = (_TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement *)objc_msgSend(v5, sel__accessibilityInternalTextLinks);
      swift_unknownObjectRelease();
      if (v6)
      {
        sub_1B41DF50C(0, &qword_1EF09B420);
        sub_1B4906DAC();

        v2 = v6;
      }
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }

  sub_1B41DF50C(0, &qword_1EF09B420);
  v7 = (void *)sub_1B4906DA0();
  swift_bridgeObjectRelease();
  return v7;
}

- (NSArray)accessibilityDragSourceDescriptors
{
  return (NSArray *)sub_1B453B744(self, (uint64_t)a2, (uint64_t (*)(void))TTRIRemindersListReminderCellAccessibilityElement.accessibilityDragSourceDescriptors.getter, (unint64_t *)&unk_1EF0A7520);
}

- (NSArray)accessibilityDropPointDescriptors
{
  return (NSArray *)sub_1B453B744(self, (uint64_t)a2, (uint64_t (*)(void))TTRIRemindersListReminderCellAccessibilityElement.accessibilityDropPointDescriptors.getter, (unint64_t *)&unk_1EF0A7520);
}

- (BOOL)_accessibilityScrollToVisible
{
  return sub_1B45663B8(self, (uint64_t)a2, (SEL *)&selRef__accessibilityScrollToVisible);
}

- (_TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  _QWORD v4[4];

  swift_unknownObjectRetain();
  sub_1B4907C4C();
  swift_unknownObjectRelease();
  return (_TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement *)TTRIRemindersListReminderCellAccessibilityElement.init(accessibilityContainer:)(v4);
}

- (_TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement)init
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  _TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement *v6;
  id v7;
  void *v8;
  objc_class *v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement_ttriAccessibilityLabelSeparator;
  v5 = qword_1ED4EE450;
  v6 = self;
  if (v5 != -1)
    swift_once();
  v7 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
  _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
  v8 = (void *)sub_1B4906A34();
  swift_bridgeObjectRelease();
  v9 = (objc_class *)objc_msgSend(v7, sel_initWithString_, v8);

  *(Class *)((char *)&v6->super.super.super.isa + v4) = v9;
  v11.receiver = v6;
  v11.super_class = ObjectType;
  return -[TTRIRemindersListReminderCellAccessibilityElement init](&v11, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement_ttriAccessibilityLabelSeparator));
}

@end

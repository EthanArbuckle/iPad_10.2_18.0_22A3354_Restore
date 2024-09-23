@implementation TTRIRemindersListHashtagCollectionCell

+ (Class)containerViewClass
{
  uint64_t v2;

  v2 = type metadata accessor for TTRIMarginTransferringContainerStackView(0, a2);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC9Reminders38TTRIRemindersListHashtagCollectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders38TTRIRemindersListHashtagCollectionCell *)sub_100501F78(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders38TTRIRemindersListHashtagCollectionCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100505A2C();
}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC9Reminders38TTRIRemindersListHashtagCollectionCell *v4;
  objc_super v5;
  _QWORD v6[4];

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v6[3] = ObjectType;
  v6[0] = self;
  v4 = self;
  static UIAccessibility.removeAccessibilityStatusChangeObserver(_:)(v6);
  sub_100027F10(v6);
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[TTRIRemindersListHashtagCollectionCell dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;

  sub_1000381C8((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders38TTRIRemindersListHashtagCollectionCell_delegate]);
  sub_1000073A0((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders38TTRIRemindersListHashtagCollectionCell_viewModel], (uint64_t *)&unk_100665210);

  sub_100505C08(*(void **)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders38TTRIRemindersListHashtagCollectionCell_hashtagSelector], *(void **)&self->delegate[OBJC_IVAR____TtC9Reminders38TTRIRemindersListHashtagCollectionCell_hashtagSelector], *(_QWORD *)&self->delegate[OBJC_IVAR____TtC9Reminders38TTRIRemindersListHashtagCollectionCell_hashtagSelector + 8]);
  v3 = &self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders38TTRIRemindersListHashtagCollectionCell_internalSelection];
  v4 = type metadata accessor for REMHashtagLabelSpecifier(0);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC9Reminders38TTRIRemindersListHashtagCollectionCell *v3;

  v3 = self;
  sub_100502700((uint64_t)v3, v2);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC9Reminders38TTRIRemindersListHashtagCollectionCell *v5;
  uint64_t v6;
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
  sub_1005027C4(width, height, (uint64_t)v5, v6);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)hashtagButtonAction:(id)a3
{
  _TtC9Reminders38TTRIRemindersListHashtagCollectionCell *v5;
  _TtC9Reminders38TTRIRemindersListHashtagCollectionCell *v6;
  _OWORD v7[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v7);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    v6 = self;
  }
  sub_100503AC4((uint64_t)v7);

  sub_1000073A0((uint64_t)v7, &qword_100640E50);
}

- (NSArray)accessibilityElements
{
  _TtC9Reminders38TTRIRemindersListHashtagCollectionCell *v2;
  _QWORD *v3;
  NSArray v4;

  v2 = self;
  v3 = sub_100503F1C();

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

- (void)ttrAccessibilityServicesDidChange
{
  _TtC9Reminders38TTRIRemindersListHashtagCollectionCell *v2;

  v2 = self;
  sub_100502EDC();

}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  double width;
  id v7;
  _TtC9Reminders38TTRIRemindersListHashtagCollectionCell *v8;

  width = a4.width;
  v7 = a3;
  v8 = self;
  sub_100505B28(v7, width);

}

@end

@implementation SmartFolderComposerSwitchCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC11MobileNotes29SmartFolderComposerSwitchCell *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1003E7D14();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)onDidChangeWithSender:(id)a3
{
  id v4;
  void (*v5)(id);
  uint64_t v6;
  _TtC11MobileNotes29SmartFolderComposerSwitchCell *v7;

  v7 = self;
  if (a3)
    v4 = objc_msgSend(a3, "isOn");
  else
    v4 = 0;
  v5 = *(void (**)(id))((char *)&v7->super.super.super.super.super.super.isa
                                 + OBJC_IVAR____TtC11MobileNotes29SmartFolderComposerSwitchCell_onDidChange);
  if (v5)
  {
    v6 = *(_QWORD *)&v7->onDidChange[OBJC_IVAR____TtC11MobileNotes29SmartFolderComposerSwitchCell_onDidChange];
    swift_retain(v6);
    v5(v4);
    sub_100012C50((uint64_t)v5, v6);
  }

}

- (_TtC11MobileNotes29SmartFolderComposerSwitchCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _QWORD *v9;
  _QWORD *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v9 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes29SmartFolderComposerSwitchCell_onDidChange);
  *v9 = 0;
  v9[1] = 0;
  v10 = (Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes29SmartFolderComposerSwitchCell_text);
  *v10 = 0;
  v10[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes29SmartFolderComposerSwitchCell____lazy_storage___switchView) = 0;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[SmartFolderComposerSwitchCell initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes29SmartFolderComposerSwitchCell)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  _QWORD *v6;
  _QWORD *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v6 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes29SmartFolderComposerSwitchCell_onDidChange);
  *v6 = 0;
  v6[1] = 0;
  v7 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes29SmartFolderComposerSwitchCell_text);
  *v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes29SmartFolderComposerSwitchCell____lazy_storage___switchView) = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[SmartFolderComposerSwitchCell initWithCoder:](&v9, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_100012C50(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC11MobileNotes29SmartFolderComposerSwitchCell_onDidChange), *(_QWORD *)&self->onDidChange[OBJC_IVAR____TtC11MobileNotes29SmartFolderComposerSwitchCell_onDidChange]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->onDidChange[OBJC_IVAR____TtC11MobileNotes29SmartFolderComposerSwitchCell_text]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes29SmartFolderComposerSwitchCell____lazy_storage___switchView));
}

@end

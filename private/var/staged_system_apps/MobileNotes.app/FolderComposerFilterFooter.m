@implementation FolderComposerFilterFooter

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _TtC11MobileNotes26FolderComposerFilterFooter *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[5];

  v5 = type metadata accessor for UIListContentConfiguration(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v19[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for UICellConfigurationState(0, v9);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v19[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v14 = self;
  static UIListContentConfiguration.groupedFooter()();
  v15 = *(uint64_t *)((char *)&v14->super.super.super.super.super.super.isa
                   + OBJC_IVAR____TtC11MobileNotes26FolderComposerFilterFooter_text);
  v16 = *(_QWORD *)&v14->text[OBJC_IVAR____TtC11MobileNotes26FolderComposerFilterFooter_text];
  swift_bridgeObjectRetain(v16);
  UIListContentConfiguration.text.setter(v15, v16);
  v19[3] = v5;
  v19[4] = &protocol witness table for UIListContentConfiguration;
  v17 = sub_10012D160(v19);
  (*(void (**)(_QWORD *, char *, uint64_t))(v6 + 16))(v17, v8, v5);
  UICollectionViewCell.contentConfiguration.setter(v19);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (_TtC11MobileNotes26FolderComposerFilterFooter)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _QWORD *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v9 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes26FolderComposerFilterFooter_text);
  *v9 = 0;
  v9[1] = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[FolderComposerFilterFooter initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes26FolderComposerFilterFooter)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  _QWORD *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v6 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes26FolderComposerFilterFooter_text);
  *v6 = 0;
  v6[1] = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[FolderComposerFilterFooter initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->text[OBJC_IVAR____TtC11MobileNotes26FolderComposerFilterFooter_text]);
}

@end

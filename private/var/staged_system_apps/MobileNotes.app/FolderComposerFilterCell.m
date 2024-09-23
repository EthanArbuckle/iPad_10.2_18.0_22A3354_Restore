@implementation FolderComposerFilterCell

- (_TtC11MobileNotes24FolderComposerFilterCell)initWithFrame:(CGRect)a3
{
  return (_TtC11MobileNotes24FolderComposerFilterCell *)sub_1003E0F30(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11MobileNotes24FolderComposerFilterCell)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes24FolderComposerFilterCell *)sub_1003E1090(a3);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC11MobileNotes24FolderComposerFilterCell *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1003E11E4((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)updateConstraints
{
  _TtC11MobileNotes24FolderComposerFilterCell *v2;

  v2 = self;
  sub_1003E2248();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24FolderComposerFilterCell_accountObjectID));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24FolderComposerFilterCell_filterTypeSelection));
  sub_100012C50(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC11MobileNotes24FolderComposerFilterCell_filterTypeSelectionDidChange), *(_QWORD *)&self->accountObjectID[OBJC_IVAR____TtC11MobileNotes24FolderComposerFilterCell_filterTypeSelectionDidChange]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24FolderComposerFilterCell____lazy_storage___horizontalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24FolderComposerFilterCell_horizontalStackViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24FolderComposerFilterCell_listContentViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24FolderComposerFilterCell____lazy_storage___listContentView));
  sub_1003E2680(*(id *)((char *)&self->super.super.super.super.super.super.isa
                      + OBJC_IVAR____TtC11MobileNotes24FolderComposerFilterCell____lazy_storage___image));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24FolderComposerFilterCell____lazy_storage___menuLabel));
}

- (NSString)accessibilityValue
{
  _TtC11MobileNotes24FolderComposerFilterCell *v2;
  id v3;
  NSString v4;
  uint64_t v5;
  uint64_t v6;

  v2 = self;
  v3 = sub_1003E0E5C();
  v4 = objc_msgSend(v3, "text");

  if (v4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v6 = v5;

    v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
  }
  else
  {

  }
  return (NSString *)v4;
}

@end

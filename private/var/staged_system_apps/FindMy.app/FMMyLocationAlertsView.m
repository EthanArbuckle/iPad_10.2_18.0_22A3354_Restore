@implementation FMMyLocationAlertsView

- (void)handleFriendTapWithGestureRecognizer:(id)a3
{
  id v4;
  _TtC6FindMy22FMMyLocationAlertsView *v5;

  v4 = a3;
  v5 = self;
  sub_1003D97C4(v4);

}

- (_TtC6FindMy22FMMyLocationAlertsView)init
{
  char *v3;
  objc_super v5;

  v3 = (char *)self + OBJC_IVAR____TtC6FindMy22FMMyLocationAlertsView_delegate;
  *((_QWORD *)v3 + 1) = 0;
  swift_unknownObjectWeakInit(v3);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy22FMMyLocationAlertsView_friendsRow) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy22FMMyLocationAlertsView_rowViewModel) = (Class)&_swiftEmptyDictionarySingleton;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMMyLocationAlertsView();
  return -[FMSectionPlatterGroupView init](&v5, "init");
}

- (_TtC6FindMy22FMMyLocationAlertsView)initWithCoder:(id)a3
{
  char *v5;
  objc_super v7;

  v5 = (char *)self + OBJC_IVAR____TtC6FindMy22FMMyLocationAlertsView_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy22FMMyLocationAlertsView_friendsRow) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy22FMMyLocationAlertsView_rowViewModel) = (Class)&_swiftEmptyDictionarySingleton;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FMMyLocationAlertsView();
  return -[FMSectionPlatterGroupView initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy22FMMyLocationAlertsView_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy22FMMyLocationAlertsView_friendsRow));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy22FMMyLocationAlertsView_rowViewModel));
}

@end

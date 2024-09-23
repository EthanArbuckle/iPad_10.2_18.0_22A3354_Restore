@implementation FMLocationAlertsView

- (_TtC6FindMy20FMLocationAlertsView)initWithCoder:(id)a3
{
  char *v5;
  char *v6;
  uint64_t v7;
  id v8;
  _TtC6FindMy20FMLocationAlertsView *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMLocationAlertsView_fencesRow) = (Class)_swiftEmptyArrayStorage;
  v5 = (char *)self + OBJC_IVAR____TtC6FindMy20FMLocationAlertsView_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5);
  v6 = (char *)self + OBJC_IVAR____TtC6FindMy20FMLocationAlertsView_viewModel;
  v7 = type metadata accessor for FMPersonDetailViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMLocationAlertsView_canSetNotifyMe) = 0;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMLocationAlertsView_disabled) = 0;
  v8 = a3;

  result = (_TtC6FindMy20FMLocationAlertsView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMLocationAlertsView.swift", 33, 2, 59, 0);
  __break(1u);
  return result;
}

- (void)handleAction
{
  _TtC6FindMy20FMLocationAlertsView *v2;

  v2 = self;
  sub_100304700();

}

- (void)handleFenceTapWithSender:(id)a3
{
  id v4;
  _TtC6FindMy20FMLocationAlertsView *v5;

  v4 = a3;
  v5 = self;
  sub_1003047F0(v4);

}

- (void)handleSecondaryAction
{
  _TtC6FindMy20FMLocationAlertsView *v2;

  v2 = self;
  sub_100304A34();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy20FMLocationAlertsView_fencesRow));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy20FMLocationAlertsView_delegate);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy20FMLocationAlertsView_viewModel, &qword_1005D63D8);
}

@end

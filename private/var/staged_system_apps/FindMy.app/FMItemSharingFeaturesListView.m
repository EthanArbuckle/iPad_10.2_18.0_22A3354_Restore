@implementation FMItemSharingFeaturesListView

- (_TtC6FindMy29FMItemSharingFeaturesListView)init
{
  _TtC6FindMy29FMItemSharingFeaturesListView *v2;
  uint64_t v3;
  _TtC6FindMy29FMItemSharingFeaturesListView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMItemSharingFeaturesListView();
  v2 = -[FMSymbolBulletedListView init](&v6, "init");
  v3 = qword_1005D1ED8;
  v4 = v2;
  if (v3 != -1)
    swift_once(&qword_1005D1ED8, sub_10032D540);
  -[FMItemSharingFeaturesListView setDirectionalLayoutMargins:](v4, "setDirectionalLayoutMargins:", *(double *)&qword_1005F5AC0, *(double *)algn_1005F5AC8, xmmword_1005F5AD0);
  -[FMItemSharingFeaturesListView setLayoutMarginsRelativeArrangement:](v4, "setLayoutMarginsRelativeArrangement:", 1);
  sub_10032D660();

  return v4;
}

- (_TtC6FindMy29FMItemSharingFeaturesListView)initWithCoder:(id)a3
{
  _TtC6FindMy29FMItemSharingFeaturesListView *result;

  result = (_TtC6FindMy29FMItemSharingFeaturesListView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMItemSharingLandingViewController.swift", 47, 2, 29, 0);
  __break(1u);
  return result;
}

@end

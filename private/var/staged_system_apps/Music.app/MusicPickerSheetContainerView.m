@implementation MusicPickerSheetContainerView

- (_TtC5Music29MusicPickerSheetContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC5Music29MusicPickerSheetContainerView *)sub_100653A4C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music29MusicPickerSheetContainerView)initWithCoder:(id)a3
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC5Music29MusicPickerSheetContainerView *result;

  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5Music29MusicPickerSheetContainerView_completionHandler);
  *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5Music29MusicPickerSheetContainerView_dismissedHandler);
  *v6 = 0;
  v6[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music29MusicPickerSheetContainerView_sourceTracks) = (Class)_swiftEmptyArrayStorage;
  v7 = OBJC_IVAR____TtC5Music29MusicPickerSheetContainerView_dataSource;
  v8 = type metadata accessor for PickerDataSource(0);
  swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
  v9 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)sub_100654170();

  result = (_TtC5Music29MusicPickerSheetContainerView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/MusicPickerSheetContainerView.swift", 41, 2, 53, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Music29MusicPickerSheetContainerView_completionHandler), *(_QWORD *)&self->completionHandler[OBJC_IVAR____TtC5Music29MusicPickerSheetContainerView_completionHandler]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Music29MusicPickerSheetContainerView_dismissedHandler), *(_QWORD *)&self->completionHandler[OBJC_IVAR____TtC5Music29MusicPickerSheetContainerView_dismissedHandler]);
  swift_bridgeObjectRelease();
  swift_release();
}

@end

@implementation MusicPickerSheetContainerView

- (_TtC16MusicApplication29MusicPickerSheetContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication29MusicPickerSheetContainerView *)sub_12BAD0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication29MusicPickerSheetContainerView)initWithCoder:(id)a3
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC16MusicApplication29MusicPickerSheetContainerView *result;

  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication29MusicPickerSheetContainerView_completionHandler);
  *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication29MusicPickerSheetContainerView_dismissedHandler);
  *v6 = 0;
  v6[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication29MusicPickerSheetContainerView_sourceTracks) = (Class)_swiftEmptyArrayStorage;
  v7 = OBJC_IVAR____TtC16MusicApplication29MusicPickerSheetContainerView_dataSource;
  v8 = type metadata accessor for PickerDataSource(0);
  swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
  v9 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)sub_12C250();

  result = (_TtC16MusicApplication29MusicPickerSheetContainerView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/MusicPickerSheetContainerView.swift", 52, 2, 53, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication29MusicPickerSheetContainerView_completionHandler), *(_QWORD *)&self->completionHandler[OBJC_IVAR____TtC16MusicApplication29MusicPickerSheetContainerView_completionHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication29MusicPickerSheetContainerView_dismissedHandler), *(_QWORD *)&self->completionHandler[OBJC_IVAR____TtC16MusicApplication29MusicPickerSheetContainerView_dismissedHandler]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication29MusicPickerSheetContainerView_sourceTracks));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication29MusicPickerSheetContainerView_dataSource));
}

@end

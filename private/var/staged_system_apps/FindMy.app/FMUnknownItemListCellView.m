@implementation FMUnknownItemListCellView

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC6FindMy25FMUnknownItemListCellView *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1001E47F8((uint64_t)v8, v10);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC6FindMy25FMUnknownItemListCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC6FindMy25FMUnknownItemListCellView *)sub_1001E5828(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMy25FMUnknownItemListCellView)initWithCoder:(id)a3
{
  return (_TtC6FindMy25FMUnknownItemListCellView *)sub_1001E5954(a3);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy25FMUnknownItemListCellView_imageCancellable));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUnknownItemListCellView_imageContainer));
}

@end

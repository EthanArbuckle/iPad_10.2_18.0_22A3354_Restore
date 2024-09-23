@implementation HUDLoadingContentView

- (_TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView)initWithCoder:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView_indicator) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView_label) = 0;
  v4 = a3;

  result = (_TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/HUDLoadingController.swift", 50, 2, 155, 0);
  __break(1u);
  return result;
}

- (_TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView *result;

  result = (_TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.HUDLoadingContentView", 45, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self
     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView_config;
  v4 = type metadata accessor for LoadingAction.Configuration(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView_indicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView_label));
}

@end

@implementation DownloadButton

- (_TtC23ShelfKitCollectionViews14DownloadButton)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC23ShelfKitCollectionViews14DownloadButton *result;

  *((_BYTE *)&self->super.super.super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews14DownloadButton_episodeCellState) = 3;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews14DownloadButton_presenter) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews14DownloadButton_progressView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews14DownloadButton_progressState;
  *(_QWORD *)v4 = 0;
  *((_WORD *)v4 + 4) = 256;
  v5 = a3;

  result = (_TtC23ShelfKitCollectionViews14DownloadButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/DownloadButton.swift", 44, 2, 75, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_FB1AC((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews14DownloadButton_downloadButtonStyle);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews14DownloadButton_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14DownloadButton_progressView));
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_FA7E0(self, (uint64_t)a2, (void (*)(void))sub_FA61C);
}

- (void)setAccessibilityLabel:(id)a3
{
  sub_FA91C(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityLabel_);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_FA7E0(self, (uint64_t)a2, (void (*)(void))sub_FA848);
}

- (void)setAccessibilityValue:(id)a3
{
  sub_FA91C(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityValue_);
}

@end

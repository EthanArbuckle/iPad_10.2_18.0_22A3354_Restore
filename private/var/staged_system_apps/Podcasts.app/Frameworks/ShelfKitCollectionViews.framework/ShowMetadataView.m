@implementation ShowMetadataView

- (_TtC23ShelfKitCollectionViews16ShowMetadataView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews16ShowMetadataView *)sub_1D6730(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC23ShelfKitCollectionViews16ShowMetadataView *v6;

  v5 = a3;
  v6 = self;
  sub_1D6DA0(a3);

}

- (_TtC23ShelfKitCollectionViews16ShowMetadataView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D7FA0();
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ShowMetadataView();
  v2 = (char *)v4.receiver;
  -[ShowMetadataView layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_label];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (CGSize)intrinsicContentSize
{
  _TtC23ShelfKitCollectionViews16ShowMetadataView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_1D74C8();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_label));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_label));
  swift_bridgeObjectRelease(*(_QWORD *)&self->label[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_formattedRatingCount]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_titles));
  swift_bridgeObjectRelease(*(_QWORD *)&self->label[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_updateFrequency]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->label[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_newEpisodeCount]);
  sub_DCC8(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase), *(_QWORD *)&self->label[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase], *(_QWORD *)&self->explicitTreatment[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase], *(_QWORD *)&self->numberOfRatings[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase + 3], *(_QWORD *)&self->formattedRatingCount[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase + 3], *(_QWORD *)&self->formattedRatingCount[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase + 11], *(void **)&self->titles[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase + 3], *(_QWORD *)&self->updateFrequency[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase + 2], *(_QWORD *)&self->updateFrequency[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase + 10], *(_QWORD *)&self->newEpisodeCount[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase + 2], *(_QWORD *)&self->newEpisodeCount[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase + 10], self->fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase + 1], self->fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase + 2]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_color));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView____lazy_storage___numberFormatter));
}

@end

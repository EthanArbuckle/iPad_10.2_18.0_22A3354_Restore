@implementation TranscriptTimestampView

- (_TtC23ShelfKitCollectionViews23TranscriptTimestampView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_CBE88();
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = v4.receiver;
  -[TranscriptTimestampView layoutSubviews](&v4, "layoutSubviews");
  v3 = objc_msgSend(v2, "layer", v4.receiver, v4.super_class);
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "setCornerRadius:", CGRectGetHeight(v5) * 0.5);

}

- (_TtC23ShelfKitCollectionViews23TranscriptTimestampView)initWithEffect:(id)a3
{
  id v3;
  _TtC23ShelfKitCollectionViews23TranscriptTimestampView *result;

  v3 = a3;
  result = (_TtC23ShelfKitCollectionViews23TranscriptTimestampView *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.TranscriptTimestampView", 47, "init(effect:)", 13, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23TranscriptTimestampView_label));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews23TranscriptTimestampView_constants);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23TranscriptTimestampView_subscriptions));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23TranscriptTimestampView_scrollView);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23TranscriptTimestampView_verticalScrollIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23TranscriptTimestampView_verticalConstraint));
}

@end

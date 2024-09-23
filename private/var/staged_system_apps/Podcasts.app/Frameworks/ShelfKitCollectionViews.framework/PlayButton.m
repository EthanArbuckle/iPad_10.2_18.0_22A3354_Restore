@implementation PlayButton

- (_TtC23ShelfKitCollectionViews10PlayButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_995A4();
}

- (void)trigger
{
  _TtC23ShelfKitCollectionViews10PlayButton *v2;

  v2 = self;
  sub_94B0C();

}

- (BOOL)isHighlighted
{
  return sub_95448(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  sub_954D8(self, (uint64_t)a2, a3, (const char **)&selRef_setHighlighted_);
}

- (BOOL)isEnabled
{
  return sub_95448(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  sub_954D8(self, (uint64_t)a2, a3, (const char **)&selRef_setEnabled_);
}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[PlayButton tintColorDidChange](&v3, "tintColorDidChange");
  sub_92334();

}

- (CGSize)intrinsicContentSize
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  v2 = v10.receiver;
  -[PlayButton intrinsicContentSize](&v10, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  if (qword_3CF1B8 != -1)
    swift_once(&qword_3CF1B8, sub_920F4);
  v7 = *(double *)&qword_3D34E0;

  if (v6 > v7)
    v8 = v6;
  else
    v8 = v7;
  v9 = v4;
  result.height = v8;
  result.width = v9;
  return result;
}

- (BOOL)_supportsMacIdiom
{
  return 0;
}

- (NSString)accessibilityLabel
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  _TtC23ShelfKitCollectionViews10PlayButton *v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;
  _BYTE v14[24];

  v3 = type metadata accessor for PlayButtonPresenter.State(0, a2);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews10PlayButton_buttonState;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews10PlayButton_buttonState, v14, 0, 0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = self;
  PlayButtonPresenter.State.accessibilityLabel.getter();
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  return (NSString *)v11;
}

- (void)setAccessibilityLabel:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  _TtC23ShelfKitCollectionViews10PlayButton *v8;
  _TtC23ShelfKitCollectionViews10PlayButton *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = self;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v9 = self;
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  -[PlayButton setAccessibilityLabel:](&v10, "setAccessibilityLabel:", a3);

}

- (_TtC23ShelfKitCollectionViews10PlayButton)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews10PlayButton *result;

  result = (_TtC23ShelfKitCollectionViews10PlayButton *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.PlayButton", 34, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews10PlayButton_data, (uint64_t *)&unk_3D6D90);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews10PlayButton_presenter));
  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews10PlayButton_buttonState;
  v5 = type metadata accessor for PlayButtonPresenter.State(0, v4);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews10PlayButton_symbolSwapView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews10PlayButton_progressView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews10PlayButton_progressLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews10PlayButton_progressWidthConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews10PlayButton_subscriptions));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews10PlayButton_waveformView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews10PlayButton_objectGraph));
}

@end

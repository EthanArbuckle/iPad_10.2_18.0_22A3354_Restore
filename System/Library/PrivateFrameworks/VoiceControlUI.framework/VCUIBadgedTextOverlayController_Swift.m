@implementation VCUIBadgedTextOverlayController_Swift

- (void)viewDidLoad
{
  _TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift *v2;

  v2 = self;
  sub_24A263D68();

}

- (CGSize)preferredContentSize
{
  void *v2;
  _TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift *v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_hostingController);
  v3 = self;
  v4 = objc_msgSend(v2, sel_view);
  if (v4)
  {
    v7 = v4;
    objc_msgSend(v4, sel_intrinsicContentSize);
    v9 = v8;
    v11 = v10;

    v5 = v9;
    v6 = v11;
  }
  else
  {
    __break(1u);
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (NSString)text
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_24A266808();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift *v7;

  v4 = sub_24A266814();
  v6 = v5;
  v7 = self;
  sub_24A264440(v4, v6);

}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__type);
}

- (void)setType:(int64_t)a3
{
  _TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift *v4;

  v4 = self;
  sub_24A264738(a3);

}

- (CGRect)focusRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect);
  v3 = *(double *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect);
  v4 = *(double *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect);
  v5 = *(double *)((char *)&self->super._overrideTransitioningDelegate
                 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFocusRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_24A264974(x, y, width, height);

}

- (int64_t)startIndex
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__startIndex);
}

- (void)setStartIndex:(int64_t)a3
{
  _TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift *v4;

  v4 = self;
  sub_24A264BB8(a3);

}

- (BOOL)popoverShowing
{
  return *((_BYTE *)&self->super.super.super.isa
         + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__popoverShowing);
}

- (void)setPopoverShowing:(BOOL)a3
{
  _TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift *v4;

  v4 = self;
  sub_24A264DB4(a3);

}

- (int64_t)zOrder
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_zOrder);
  swift_beginAccess();
  return *v2;
}

- (void)setZOrder:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_zOrder);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isOverlay
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_isOverlay;
  swift_beginAccess();
  return *v2;
}

- (void)setIsOverlay:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_isOverlay;
  swift_beginAccess();
  *v4 = a3;
}

+ (id)textSegmentModelsForText:(id)a3 type:(int64_t)a4 start:(int64_t)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  char v12;
  void *v13;
  id result;

  v7 = sub_24A266814();
  v9 = v8;
  if (a4 == 1)
  {
    v10 = 3;
    v11 = a5;
    v12 = 0;
LABEL_5:
    sub_24A260B48(v10, v11, v12, v7, v9);
    swift_bridgeObjectRelease();
    type metadata accessor for VCUIBadgedTextSegmentModel();
    v13 = (void *)sub_24A266838();
    swift_bridgeObjectRelease();
    return v13;
  }
  if (!a4)
  {
    v10 = 2;
    v11 = a5;
    v12 = 1;
    goto LABEL_5;
  }
  result = (id)sub_24A2668F8();
  __break(1u);
  return result;
}

- (id)displayedTextSegmentModels
{
  _TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  sub_24A266610();
  v3 = *(uint64_t *)((char *)&v2->super.super.super.isa
                  + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__type);
  swift_retain();
  sub_24A2639FC(v3);

  swift_release_n();
  swift_release();
  type metadata accessor for VCUIBadgedTextSegmentModel();
  v4 = (void *)sub_24A266838();
  swift_bridgeObjectRelease();
  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_24A266814();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift *)VCUIBadgedTextOverlayController_Swift.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift)initWithCoder:(id)a3
{
  return (_TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift *)VCUIBadgedTextOverlayController_Swift.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_hostingController));
  swift_bridgeObjectRelease();
}

@end

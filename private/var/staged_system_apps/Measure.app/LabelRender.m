@implementation LabelRender

- (int64_t)state
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure11LabelRender_state);
}

- (void)setState:(int64_t)a3
{
  uint64_t v3;
  _TtC7Measure11LabelRender *v5;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure11LabelRender_state);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure11LabelRender_state) = (Class)a3;
  if (v3 != a3)
  {
    v5 = self;
    sub_1000ADB38(a3);

  }
}

- (NSString)speakableString
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->delegate[OBJC_IVAR____TtC7Measure11LabelRender_speakableString];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setSpeakableString:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7Measure11LabelRender_speakableString);
  v6 = *(_QWORD *)&self->delegate[OBJC_IVAR____TtC7Measure11LabelRender_speakableString];
  *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (_TtC7Measure19TouchableSpriteNode)labelNode
{
  return (_TtC7Measure19TouchableSpriteNode *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                      + OBJC_IVAR____TtC7Measure11LabelRender_labelNode));
}

- (void)setLabelNode:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure11LabelRender_labelNode);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure11LabelRender_labelNode) = (Class)a3;
  v3 = a3;

}

- (_TtC7Measure11LabelRender)init
{
  _TtC7Measure11LabelRender *result;

  result = (_TtC7Measure11LabelRender *)_swift_stdlib_reportUnimplementedInitializer("Measure.LabelRender", 19, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  void *v4;

  sub_10001ADF4((uint64_t)self + OBJC_IVAR____TtC7Measure11LabelRender_delegate);
  sub_1000217BC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure11LabelRender_labelSizeAdjustment), *(_QWORD *)&self->delegate[OBJC_IVAR____TtC7Measure11LabelRender_labelSizeAdjustment]);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease(*(_QWORD *)&self->labelSizeAdjustment[OBJC_IVAR____TtC7Measure11LabelRender_currentProperties
                                                                + 17]);
  swift_release();
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC7Measure11LabelRender_captureActionKey]);
  v3 = *(_QWORD *)&self->delegate[OBJC_IVAR____TtC7Measure11LabelRender_attributedText];
  v4 = *(void **)&self->labelType[OBJC_IVAR____TtC7Measure11LabelRender_attributedText];

  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC7Measure11LabelRender_speakableString]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC7Measure11LabelRender_measurementID]);
  sub_1000C21E4((uint64_t)self + OBJC_IVAR____TtC7Measure11LabelRender_snapTimestamp);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7Measure11LabelRender_lastPositionsOnLine));
  sub_1000C21E4((uint64_t)self + OBJC_IVAR____TtC7Measure11LabelRender_occlusionResetTime);

  swift_release();
}

- (void)selectAnimationComplete
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC7Measure11LabelRender_selectionState) = 2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure11LabelRender_desiredAlpha) = 0;
}

- (CGRect)accessibilityFrameForLabelContainer
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *(double *)&self->rectangleLabelData[OBJC_IVAR____TtC7Measure11LabelRender_currentProperties + 15];
  v3 = *(double *)&self->labelSizeAdjustment[OBJC_IVAR____TtC7Measure11LabelRender_currentProperties + 1];
  v4 = *(double *)&self->delegate[OBJC_IVAR____TtC7Measure11LabelRender_currentProperties + 8] - v2 * 0.5;
  v5 = *(double *)&self->labelType[OBJC_IVAR____TtC7Measure11LabelRender_currentProperties] - v3 * 0.5;
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

@end

@implementation RCRecordingControlLayoutHelper

- (_TtC10VoiceMemos30RCRecordingControlLayoutHelper)initWithDiameter:(double)a3
{
  objc_super v4;

  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos30RCRecordingControlLayoutHelper_diameter) = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RCRecordingControlLayoutHelper();
  return -[RCRecordingControlLayoutHelper init](&v4, "init");
}

- (double)recordingControlOuterRingThickness
{
  double result;

  sub_1000C4D00(self, (uint64_t)a2, (SEL *)&selRef_recordingControlOuterRingThicknessScaleFactor);
  return result;
}

- (double)recordingControlOuterRingGap
{
  double result;

  sub_1000C4D00(self, (uint64_t)a2, (SEL *)&selRef_recordingControlOuterRingGapScaleFactor);
  return result;
}

- (double)recordingControlInnerSquareWidth
{
  double result;

  sub_1000C4D00(self, (uint64_t)a2, (SEL *)&selRef_recordingControlInnerSquareWidthScaleFactor);
  return result;
}

- (double)recordingControlSquareCornerRadius
{
  double result;

  sub_1000C4D00(self, (uint64_t)a2, (SEL *)&selRef_recordingControlSquareCornerRadiusScaleFactor);
  return result;
}

- (double)recordingControlPauseGap
{
  double result;

  sub_1000C4D00(self, (uint64_t)a2, (SEL *)&selRef_recordingControlPauseGapScaleFactor);
  return result;
}

- (double)recordingControlPauseStrokeCornerRadius
{
  double result;

  sub_1000C4D00(self, (uint64_t)a2, (SEL *)&selRef_recordingControlPauseStrokeCornerRadiusScaleFactor);
  return result;
}

- (double)recordingControlLozengeFixedWidth
{
  double result;

  sub_1000C4D00(self, (uint64_t)a2, (SEL *)&selRef_recordingControlLozengeFixedWidthScaleFactor);
  return result;
}

- (double)recordingControlHeight
{
  void *v3;
  _TtC10VoiceMemos30RCRecordingControlLayoutHelper *v4;
  id v5;
  double result;
  void *v7;
  double v8;
  double v9;

  v3 = (void *)objc_opt_self(RCRecorderStyleProvider);
  v4 = self;
  v5 = objc_msgSend(v3, "sharedStyleProvider");
  if (v5)
  {
    v7 = v5;
    objc_msgSend(v5, "recordingControlHeightForDiameter:", *(double *)((char *)&v4->super.isa + OBJC_IVAR____TtC10VoiceMemos30RCRecordingControlLayoutHelper_diameter));
    v9 = v8;

    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (double)recordingControlWidthWithLabelIntrinsicWidth:(double)a3
{
  _TtC10VoiceMemos30RCRecordingControlLayoutHelper *v3;
  double v4;
  double v5;

  v3 = self;
  sub_1000C4E18();
  v5 = v4;

  return v5;
}

- (CGRect)labelLozengeRectWithLabelIntrinsicWidth:(double)a3 recordingControlCenterPoint:(CGPoint)a4
{
  double x;
  _TtC10VoiceMemos30RCRecordingControlLayoutHelper *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  x = a4.x;
  v6 = self;
  sub_1000C4F28(a3, x);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (double)labelLozengeHeight
{
  _TtC10VoiceMemos30RCRecordingControlLayoutHelper *v2;
  double v3;
  double v4;

  v2 = self;
  sub_1000C5054();
  v4 = v3;

  return v4;
}

- (double)labelLozengeWidthWithPaddedLabelWidth:(double)a3
{
  _TtC10VoiceMemos30RCRecordingControlLayoutHelper *v4;
  double v5;
  double v6;

  v4 = self;
  sub_1000C5054();
  v6 = v5;

  return v6 + a3;
}

- (double)labelLozengeHorizontalPadding
{
  _TtC10VoiceMemos30RCRecordingControlLayoutHelper *v2;
  double v3;
  double v4;

  v2 = self;
  sub_1000C5054();
  v4 = v3;

  return v4;
}

- (double)paddedLabelWidthWithLabelIntrinsicWidth:(double)a3
{
  double v5;
  void *v6;
  _TtC10VoiceMemos30RCRecordingControlLayoutHelper *v7;
  id v8;
  double result;
  void *v10;
  double v11;
  double v12;

  v5 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos30RCRecordingControlLayoutHelper_diameter);
  v6 = (void *)objc_opt_self(RCRecorderStyleProvider);
  v7 = self;
  v8 = objc_msgSend(v6, "sharedStyleProvider");
  if (v8)
  {
    v10 = v8;
    objc_msgSend(v8, "recordingControlLozengeFixedWidthScaleFactor");
    v12 = v11;

    result = v5 * v12;
    if (v5 * v12 < a3)
      return a3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC10VoiceMemos30RCRecordingControlLayoutHelper)init
{
  _TtC10VoiceMemos30RCRecordingControlLayoutHelper *result;

  result = (_TtC10VoiceMemos30RCRecordingControlLayoutHelper *)_swift_stdlib_reportUnimplementedInitializer("VoiceMemos.RCRecordingControlLayoutHelper", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

@end

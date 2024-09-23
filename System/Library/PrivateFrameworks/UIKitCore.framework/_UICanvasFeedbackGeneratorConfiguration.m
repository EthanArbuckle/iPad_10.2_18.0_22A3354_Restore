@implementation _UICanvasFeedbackGeneratorConfiguration

- (_UIFeedbackDiscretePlayable)snappingFeedback
{
  return (_UIFeedbackDiscretePlayable *)sub_1856EEA68(self, (uint64_t)a2, &OBJC_IVAR____TtC5UIKit39_UICanvasFeedbackGeneratorConfiguration__snappingFeedback);
}

- (void)setSnappingFeedback:(id)a3
{
  sub_1856EEABC(self, (uint64_t)a2, a3, &OBJC_IVAR____TtC5UIKit39_UICanvasFeedbackGeneratorConfiguration__snappingFeedback);
}

- (_UIFeedbackDiscretePlayable)pathCompletingFeedback
{
  return (_UIFeedbackDiscretePlayable *)sub_1856EEA68(self, (uint64_t)a2, &OBJC_IVAR____TtC5UIKit39_UICanvasFeedbackGeneratorConfiguration__pathCompletingFeedback);
}

- (void)setPathCompletingFeedback:(id)a3
{
  sub_1856EEABC(self, (uint64_t)a2, a3, &OBJC_IVAR____TtC5UIKit39_UICanvasFeedbackGeneratorConfiguration__pathCompletingFeedback);
}

- (NSArray)feedbackKeyPaths
{
  return (NSArray *)sub_1856EEF6C(self, (uint64_t)a2, (void (*)(void))sub_1856EEB2C);
}

- (int64_t)requiredSupportLevel
{
  return -1;
}

- (int64_t)requiredPeripheralSupportLevel
{
  return 1;
}

+ (id)defaultConfiguration
{
  swift_getObjCClassMetadata();
  return (id)sub_1856EECB8();
}

- (NSString)snappingFeedbackPatternName
{
  return (NSString *)sub_1856EEED0();
}

- (void)setSnappingFeedbackPatternName:(id)a3
{
  sub_1856EEF24((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5UIKit39_UICanvasFeedbackGeneratorConfiguration_snappingFeedbackPatternName);
}

- (NSString)snappingTrackpadFeedbackPatternName
{
  return (NSString *)sub_1856EEED0();
}

- (void)setSnappingTrackpadFeedbackPatternName:(id)a3
{
  sub_1856EEF24((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5UIKit39_UICanvasFeedbackGeneratorConfiguration_snappingTrackpadFeedbackPatternName);
}

- (NSString)pathCompletingFeedbackPatternName
{
  return (NSString *)sub_1856EEED0();
}

- (void)setPathCompletingFeedbackPatternName:(id)a3
{
  sub_1856EEF24((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5UIKit39_UICanvasFeedbackGeneratorConfiguration_pathCompletingFeedbackPatternName);
}

- (NSArray)hidFeedbackPatternNameKeyPaths
{
  return (NSArray *)sub_1856EEF6C(self, (uint64_t)a2, (void (*)(void))sub_1856EEFBC);
}

- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5
{
  id v8;
  _TtC5UIKit39_UICanvasFeedbackGeneratorConfiguration *v9;
  id v10;

  v8 = a3;
  v9 = self;
  v10 = sub_1856EF180(v8, a4, a5);

  return v10;
}

- (_TtC5UIKit39_UICanvasFeedbackGeneratorConfiguration)init
{
  return (_TtC5UIKit39_UICanvasFeedbackGeneratorConfiguration *)sub_1856EF410();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC5UIKit39_UICanvasFeedbackGeneratorConfiguration__snappingFeedback));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC5UIKit39_UICanvasFeedbackGeneratorConfiguration__pathCompletingFeedback));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

@implementation UICanvasFeedbackGenerator

- (void)alignmentOccurredAtLocation:(CGPoint)a3
{
  sub_1856EE454(self, a3.x, a3.y, (uint64_t)a2, &OBJC_IVAR____TtC5UIKit39_UICanvasFeedbackGeneratorConfiguration__snappingFeedback);
}

- (void)pathCompletedAtLocation:(CGPoint)a3
{
  sub_1856EE454(self, a3.x, a3.y, (uint64_t)a2, &OBJC_IVAR____TtC5UIKit39_UICanvasFeedbackGeneratorConfiguration__pathCompletingFeedback);
}

+ (Class)_configurationClass
{
  type metadata accessor for _UICanvasFeedbackGeneratorConfiguration();
  return (Class)swift_getObjCClassFromMetadata();
}

- (UICanvasFeedbackGenerator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UICanvasFeedbackGenerator;
  return -[UIFeedbackGenerator init](&v3, sel_init);
}

- (UICanvasFeedbackGenerator)initWithCoordinateSpace:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UICanvasFeedbackGenerator;
  return -[UIFeedbackGenerator initWithCoordinateSpace:](&v4, sel_initWithCoordinateSpace_, a3);
}

- (UICanvasFeedbackGenerator)initWithConfiguration:(id)a3 coordinateSpace:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICanvasFeedbackGenerator;
  return -[UIFeedbackGenerator initWithConfiguration:coordinateSpace:](&v5, sel_initWithConfiguration_coordinateSpace_, a3, a4);
}

- (UICanvasFeedbackGenerator)initWithView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UICanvasFeedbackGenerator;
  return -[UIFeedbackGenerator initWithView:](&v4, sel_initWithView_, a3);
}

- (UICanvasFeedbackGenerator)initWithConfiguration:(id)a3 view:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICanvasFeedbackGenerator;
  return -[UIFeedbackGenerator initWithConfiguration:view:](&v5, sel_initWithConfiguration_view_, a3, a4);
}

- (UICanvasFeedbackGenerator)initWithConfiguration:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UICanvasFeedbackGenerator;
  return -[UIFeedbackGenerator initWithConfiguration:](&v4, sel_initWithConfiguration_, a3);
}

@end

@implementation _UICanvasFeedbackGenerator

- (void)snappingOccurredAtLocation:(CGPoint)a3
{
  -[UICanvasFeedbackGenerator alignmentOccurredAtLocation:](self, sel_alignmentOccurredAtLocation_, a3.x, a3.y);
}

- (_UICanvasFeedbackGenerator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UICanvasFeedbackGenerator;
  return -[UICanvasFeedbackGenerator init](&v3, sel_init);
}

- (_UICanvasFeedbackGenerator)initWithCoordinateSpace:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UICanvasFeedbackGenerator;
  return -[UICanvasFeedbackGenerator initWithCoordinateSpace:](&v4, sel_initWithCoordinateSpace_, a3);
}

- (_UICanvasFeedbackGenerator)initWithConfiguration:(id)a3 coordinateSpace:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UICanvasFeedbackGenerator;
  return -[UICanvasFeedbackGenerator initWithConfiguration:coordinateSpace:](&v5, sel_initWithConfiguration_coordinateSpace_, a3, a4);
}

- (_UICanvasFeedbackGenerator)initWithView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UICanvasFeedbackGenerator;
  return -[UICanvasFeedbackGenerator initWithView:](&v4, sel_initWithView_, a3);
}

- (_UICanvasFeedbackGenerator)initWithConfiguration:(id)a3 view:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UICanvasFeedbackGenerator;
  return -[UICanvasFeedbackGenerator initWithConfiguration:view:](&v5, sel_initWithConfiguration_view_, a3, a4);
}

- (_UICanvasFeedbackGenerator)initWithConfiguration:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UICanvasFeedbackGenerator;
  return -[UICanvasFeedbackGenerator initWithConfiguration:](&v4, sel_initWithConfiguration_, a3);
}

@end

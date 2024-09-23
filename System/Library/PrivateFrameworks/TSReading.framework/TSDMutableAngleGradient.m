@implementation TSDMutableAngleGradient

- (void)setFirstColor:(id)a3
{
  -[TSDMutableAngleGradient setColorOfStopAtIndex:toColor:](self, "setColorOfStopAtIndex:toColor:", 0, a3);
}

- (void)setLastColor:(id)a3
{
  -[TSDMutableAngleGradient setColorOfStopAtIndex:toColor:](self, "setColorOfStopAtIndex:toColor:", -[NSArray count](-[TSDGradient gradientStops](self, "gradientStops"), "count") - 1, a3);
}

- (void)setGradientAngleInDegrees:(double)a3
{
  self->super.mAngle = a3 * 0.0174532925;
}

@end

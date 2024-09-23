@implementation TSDMovieKnob

- (void)updateHitRegionPathForRep:(id)a3
{
  double v4;

  self->super.super.mHitRegionPath = 0;
  -[TSDKnob radius](self, "radius");
  self->super.super.mHitRegionPath = +[TSDBezierPath bezierPathWithOvalInRect:](TSDBezierPath, "bezierPathWithOvalInRect:", -v4, -v4, v4 + v4, v4 + v4);
}

@end

@implementation DistanceCircleAnnotationView

- (void)setDistanceRadius:(double)a3
{
  self->_distanceRadius = a3;
  -[DistanceCircleAnnotationView _pointsForDistance:](self, "_pointsForDistance:");
  -[CircleAnnotationView setRadius:](self, "setRadius:");
}

- (void)_updateFromMap
{
  objc_super v3;

  -[DistanceCircleAnnotationView _pointsForDistance:](self, "_pointsForDistance:", self->_distanceRadius);
  -[CircleAnnotationView setRadius:](self, "setRadius:");
  v3.receiver = self;
  v3.super_class = (Class)DistanceCircleAnnotationView;
  -[DistanceCircleAnnotationView _updateFromMap](&v3, "_updateFromMap");
}

- (double)distanceRadius
{
  return self->_distanceRadius;
}

@end

@implementation TransitScheduleCardVehiclePositionAnnotationView

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleCardVehiclePositionAnnotationView layer](self, "layer"));
  objc_msgSend(v3, "size");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleCardVehiclePositionAnnotationView layer](self, "layer"));
  objc_msgSend(v6, "size");
  v8 = v7;

  v9 = v8;
  v10 = v5;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (double)shadowBlur
{
  return 2.0;
}

@end

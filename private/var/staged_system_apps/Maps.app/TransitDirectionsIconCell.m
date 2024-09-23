@implementation TransitDirectionsIconCell

+ (Class)stepViewClass
{
  return (Class)objc_opt_class(TransitDirectionsIconStepView);
}

- (TransitDirectionsIconCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TransitDirectionsIconCell *v4;
  TransitDirectionsIconCell *v5;
  void *v6;
  id v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TransitDirectionsIconCell;
  v4 = -[TransitDirectionsCell initWithStyle:reuseIdentifier:](&v10, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsCell stepView](v4, "stepView"));
    v7 = -[TransitDirectionsIconCell _mapkit_forceSeparatorFrameToCGRectZero](v5, "_mapkit_forceSeparatorFrameToCGRectZero");
    -[TransitDirectionsIconCell set_mapkit_forceSeparatorFrameToCGRectZero:](v5, "set_mapkit_forceSeparatorFrameToCGRectZero:", 0);
    -[TransitDirectionsCell _separatorFrame](v5, "_separatorFrame");
    objc_msgSend(v6, "_setCalculatedSeparatorHeight:", v8);
    -[TransitDirectionsIconCell set_mapkit_forceSeparatorFrameToCGRectZero:](v5, "set_mapkit_forceSeparatorFrameToCGRectZero:", v7);

  }
  return v5;
}

@end

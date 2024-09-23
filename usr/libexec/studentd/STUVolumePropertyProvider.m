@implementation STUVolumePropertyProvider

- (STUVolumePropertyProvider)init
{
  STUVolumePropertyProvider *v2;
  STUVolumePropertyProvider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUVolumePropertyProvider;
  v2 = -[STUVolumePropertyProvider init](&v5, "init");
  v3 = v2;
  if (v2)
    -[STUDevicePropertyProvider setValue:](v2, "setValue:", &off_1000D42A8);
  return v3;
}

- (id)key
{
  return CRKDeviceVolumeKey;
}

- (float)volume
{
  void *v2;
  float v3;
  float v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyProvider value](self, "value"));
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setVolume:(float)a3
{
  double v5;
  id v6;

  -[STUVolumePropertyProvider volume](self, "volume");
  if (vabds_f32(*(float *)&v5, a3) > 2.2204e-16)
  {
    *(float *)&v5 = a3;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
    -[STUDevicePropertyProvider setValue:](self, "setValue:", v6);

  }
}

@end

@implementation CHSharingImageWorkoutConfiguration

- (CHSharingImageWorkoutConfiguration)initWithIconImage:(id)a3 routeImage:(id)a4 metricTitleAndValueInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  CHSharingImageWorkoutConfiguration *v12;
  CHSharingImageWorkoutConfiguration *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CHSharingImageWorkoutConfiguration;
  v12 = -[CHSharingImageWorkoutConfiguration init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_iconImage, a3);
    objc_storeStrong((id *)&v13->_routeImage, a4);
    objc_storeStrong((id *)&v13->_metricTitleAndValueInfo, a5);
  }

  return v13;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_iconImage, a3);
}

- (UIImage)routeImage
{
  return self->_routeImage;
}

- (void)setRouteImage:(id)a3
{
  objc_storeStrong((id *)&self->_routeImage, a3);
}

- (NSArray)metricTitleAndValueInfo
{
  return self->_metricTitleAndValueInfo;
}

- (void)setMetricTitleAndValueInfo:(id)a3
{
  objc_storeStrong((id *)&self->_metricTitleAndValueInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricTitleAndValueInfo, 0);
  objc_storeStrong((id *)&self->_routeImage, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
}

@end

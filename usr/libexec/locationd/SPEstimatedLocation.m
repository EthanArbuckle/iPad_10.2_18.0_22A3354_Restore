@implementation SPEstimatedLocation

- (BOOL)isEqualToEstimatedLocation:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  if (!a3)
    return 0;
  if (self == a3)
    return 1;
  -[SPEstimatedLocation latitude](self, "latitude");
  v6 = v5;
  objc_msgSend(a3, "latitude");
  v8 = v6 - v7;
  if (v8 < 0.0)
    v8 = -v8;
  if (v8 >= 2.22044605e-16)
    return 0;
  -[SPEstimatedLocation longitude](self, "longitude");
  v10 = v9;
  objc_msgSend(a3, "longitude");
  v12 = v10 - v11;
  if (v12 < 0.0)
    v12 = -v12;
  if (v12 >= 2.22044605e-16)
    return 0;
  -[SPEstimatedLocation altitude](self, "altitude");
  v14 = v13;
  objc_msgSend(a3, "altitude");
  v16 = v14 - v15;
  if (v16 < 0.0)
    v16 = -v16;
  return v16 < 2.22044605e-16;
}

@end

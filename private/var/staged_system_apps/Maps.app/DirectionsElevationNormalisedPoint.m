@implementation DirectionsElevationNormalisedPoint

- (id)columnsInChartView
{
  return &off_1012743A0;
}

- (id)chartViewDataValueForColumn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("elevation")))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationNormalisedPoint elevationMeasurement](self, "elevationMeasurement"));
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("offset")))
    {
      v7 = 0;
      goto LABEL_7;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationNormalisedPoint offsetMeasurement](self, "offsetMeasurement"));
  }
  v6 = v5;
  objc_msgSend(v5, "doubleValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

LABEL_7:
  return v7;
}

- (id)chartViewDataRowID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationNormalisedPoint offsetMeasurement](self, "offsetMeasurement"));
  objc_msgSend(v2, "doubleValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

  return v3;
}

- (NSMeasurement)elevationMeasurement
{
  return self->_elevationMeasurement;
}

- (void)setElevationMeasurement:(id)a3
{
  objc_storeStrong((id *)&self->_elevationMeasurement, a3);
}

- (NSMeasurement)offsetMeasurement
{
  return self->_offsetMeasurement;
}

- (void)setOffsetMeasurement:(id)a3
{
  objc_storeStrong((id *)&self->_offsetMeasurement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsetMeasurement, 0);
  objc_storeStrong((id *)&self->_elevationMeasurement, 0);
}

@end

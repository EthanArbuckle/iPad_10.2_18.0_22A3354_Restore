@implementation _CHWorkoutDetailSummaryLocationItem

- (NSDictionary)swimDistanceByStrokeStyle
{
  return self->_swimDistanceByStrokeStyle;
}

- (void)setSwimDistanceByStrokeStyle:(id)a3
{
  objc_storeStrong((id *)&self->_swimDistanceByStrokeStyle, a3);
}

- (id)swimDistanceByStrokeStyleUpdateBlock
{
  return self->_swimDistanceByStrokeStyleUpdateBlock;
}

- (void)setSwimDistanceByStrokeStyleUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CLLocation)firstCoordinate
{
  return self->_firstCoordinate;
}

- (void)setFirstCoordinate:(id)a3
{
  objc_storeStrong((id *)&self->_firstCoordinate, a3);
}

- (id)firstCoordinateUpdatedBlock
{
  return self->_firstCoordinateUpdatedBlock;
}

- (void)setFirstCoordinateUpdatedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_firstCoordinateUpdatedBlock, 0);
  objc_storeStrong((id *)&self->_firstCoordinate, 0);
  objc_storeStrong(&self->_swimDistanceByStrokeStyleUpdateBlock, 0);
  objc_storeStrong((id *)&self->_swimDistanceByStrokeStyle, 0);
}

@end

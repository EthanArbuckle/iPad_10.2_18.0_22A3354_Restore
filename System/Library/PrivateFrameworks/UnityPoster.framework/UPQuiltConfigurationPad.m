@implementation UPQuiltConfigurationPad

- (UPQuiltConfigurationPad)initWithRandomizationSeedValue:(unint64_t)a3 viewport:(CGRect)a4 timeBounds:(CGRect)a5 lineVariance:(double)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UPQuiltConfigurationPad;
  return -[UPQuiltConfiguration initWithRandomizationSeedValue:viewport:timeBounds:lineVariance:](&v7, sel_initWithRandomizationSeedValue_viewport_timeBounds_lineVariance_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, *(_QWORD *)&a6);
}

- (UIBezierPath)topQuiltLockedPath
{
  return self->_topQuiltLockedPath;
}

- (void)setTopQuiltLockedPath:(id)a3
{
  objc_storeStrong((id *)&self->_topQuiltLockedPath, a3);
}

- (UIBezierPath)leftQuiltLockedPath
{
  return self->_leftQuiltLockedPath;
}

- (void)setLeftQuiltLockedPath:(id)a3
{
  objc_storeStrong((id *)&self->_leftQuiltLockedPath, a3);
}

- (UIBezierPath)bottomQuiltLockedPath
{
  return self->_bottomQuiltLockedPath;
}

- (void)setBottomQuiltLockedPath:(id)a3
{
  objc_storeStrong((id *)&self->_bottomQuiltLockedPath, a3);
}

- (UIBezierPath)rightQuiltLockedPath
{
  return self->_rightQuiltLockedPath;
}

- (void)setRightQuiltLockedPath:(id)a3
{
  objc_storeStrong((id *)&self->_rightQuiltLockedPath, a3);
}

- (UIBezierPath)intersectionPieceLockedPath
{
  return self->_intersectionPieceLockedPath;
}

- (void)setIntersectionPieceLockedPath:(id)a3
{
  objc_storeStrong((id *)&self->_intersectionPieceLockedPath, a3);
}

- (UIBezierPath)topQuiltUnlockedPath
{
  return self->_topQuiltUnlockedPath;
}

- (void)setTopQuiltUnlockedPath:(id)a3
{
  objc_storeStrong((id *)&self->_topQuiltUnlockedPath, a3);
}

- (UIBezierPath)leftQuiltUnlockedPath
{
  return self->_leftQuiltUnlockedPath;
}

- (void)setLeftQuiltUnlockedPath:(id)a3
{
  objc_storeStrong((id *)&self->_leftQuiltUnlockedPath, a3);
}

- (UIBezierPath)bottomQuiltUnlockedPath
{
  return self->_bottomQuiltUnlockedPath;
}

- (void)setBottomQuiltUnlockedPath:(id)a3
{
  objc_storeStrong((id *)&self->_bottomQuiltUnlockedPath, a3);
}

- (UIBezierPath)rightQuiltUnlockedPath
{
  return self->_rightQuiltUnlockedPath;
}

- (void)setRightQuiltUnlockedPath:(id)a3
{
  objc_storeStrong((id *)&self->_rightQuiltUnlockedPath, a3);
}

- (UIBezierPath)bottomRightQuiltUnlockedPath
{
  return self->_bottomRightQuiltUnlockedPath;
}

- (void)setBottomRightQuiltUnlockedPath:(id)a3
{
  objc_storeStrong((id *)&self->_bottomRightQuiltUnlockedPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomRightQuiltUnlockedPath, 0);
  objc_storeStrong((id *)&self->_rightQuiltUnlockedPath, 0);
  objc_storeStrong((id *)&self->_bottomQuiltUnlockedPath, 0);
  objc_storeStrong((id *)&self->_leftQuiltUnlockedPath, 0);
  objc_storeStrong((id *)&self->_topQuiltUnlockedPath, 0);
  objc_storeStrong((id *)&self->_intersectionPieceLockedPath, 0);
  objc_storeStrong((id *)&self->_rightQuiltLockedPath, 0);
  objc_storeStrong((id *)&self->_bottomQuiltLockedPath, 0);
  objc_storeStrong((id *)&self->_leftQuiltLockedPath, 0);
  objc_storeStrong((id *)&self->_topQuiltLockedPath, 0);
  objc_storeStrong((id *)&self->_toInterpolatedConfiguration, 0);
  objc_storeStrong((id *)&self->_fromInterpolatedConfiguration, 0);
}

@end

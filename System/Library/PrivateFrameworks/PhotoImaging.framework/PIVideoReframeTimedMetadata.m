@implementation PIVideoReframeTimedMetadata

- (void)setTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- (void)setEstimatedCenterMotion:(CGVector)a3
{
  self->_estimatedCenterMotion = a3;
}

- (void)setEstimatedMotionBlur:(CGVector)a3
{
  self->_estimatedMotionBlur = a3;
}

- (__n128)setTrajectoryHomography:(__n128)a3
{
  result[4] = a2;
  result[5] = a3;
  result[6] = a4;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_time, 24, 1, 0);
  return result;
}

- (CGVector)estimatedCenterMotion
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGVector result;

  objc_copyStruct(v4, &self->_estimatedCenterMotion, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.dy = v3;
  result.dx = v2;
  return result;
}

- (CGVector)estimatedMotionBlur
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGVector result;

  objc_copyStruct(v4, &self->_estimatedMotionBlur, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.dy = v3;
  result.dx = v2;
  return result;
}

- (double)trajectoryHomography
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 64), 48, 1, 0);
  return *(double *)&v2;
}

@end

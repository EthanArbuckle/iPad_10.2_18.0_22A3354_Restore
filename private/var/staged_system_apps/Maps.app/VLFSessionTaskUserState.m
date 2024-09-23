@implementation VLFSessionTaskUserState

- (int64_t)originalUserTrackingMode
{
  return self->_originalUserTrackingMode;
}

- (void)setOriginalUserTrackingMode:(int64_t)a3
{
  self->_originalUserTrackingMode = a3;
}

- ($FF918C85BF8E73478720C66798E418D4)originalUserTrackingBehavior
{
  *($F8852815F5307377C348AED5259C60F2 *)retstr = ($F8852815F5307377C348AED5259C60F2)self[1];
  return self;
}

- (void)setOriginalUserTrackingBehavior:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_originalUserTrackingBehavior.shouldPreserveUserSpecifiedZoomLevel = *(_QWORD *)&a3->var2;
  *(_OWORD *)&self->_originalUserTrackingBehavior.shouldZoomToFit = v3;
}

- (double)originalCenterCoordinateDistance
{
  return self->_originalCenterCoordinateDistance;
}

- (void)setOriginalCenterCoordinateDistance:(double)a3
{
  self->_originalCenterCoordinateDistance = a3;
}

@end

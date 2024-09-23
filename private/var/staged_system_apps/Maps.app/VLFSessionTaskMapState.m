@implementation VLFSessionTaskMapState

- (BOOL)scrollEnabled
{
  return self->_scrollEnabled;
}

- (void)setScrollEnabled:(BOOL)a3
{
  self->_scrollEnabled = a3;
}

- (BOOL)rotateEnabled
{
  return self->_rotateEnabled;
}

- (void)setRotateEnabled:(BOOL)a3
{
  self->_rotateEnabled = a3;
}

- (BOOL)zoomEnabled
{
  return self->_zoomEnabled;
}

- (void)setZoomEnabled:(BOOL)a3
{
  self->_zoomEnabled = a3;
}

- (BOOL)pitchEnabled
{
  return self->_pitchEnabled;
}

- (void)setPitchEnabled:(BOOL)a3
{
  self->_pitchEnabled = a3;
}

@end

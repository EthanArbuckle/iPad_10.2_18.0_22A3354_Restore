@implementation _UISliderControlStateContent

- (void)setMinTrack:(id)a3
{
  objc_storeStrong((id *)&self->_minTrack, a3);
}

- (void)setMaxTrack:(id)a3
{
  objc_storeStrong((id *)&self->_maxTrack, a3);
}

- (BOOL)isEmpty
{
  return !self->_thumb && !self->_minTrack && self->_maxTrack == 0;
}

- (UIImage)maxTrack
{
  return self->_maxTrack;
}

- (UIImage)minTrack
{
  return self->_minTrack;
}

- (UIImage)thumb
{
  return self->_thumb;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxTrack, 0);
  objc_storeStrong((id *)&self->_minTrack, 0);
  objc_storeStrong((id *)&self->_thumb, 0);
}

- (void)setThumb:(id)a3
{
  objc_storeStrong((id *)&self->_thumb, a3);
}

@end

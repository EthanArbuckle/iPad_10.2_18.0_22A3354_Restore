@implementation AXKonaBuffer

- (AVAudioPCMBuffer)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_buffer, a3);
}

- (NSArray)markers
{
  return self->_markers;
}

- (void)setMarkers:(id)a3
{
  objc_storeStrong((id *)&self->_markers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markers, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end

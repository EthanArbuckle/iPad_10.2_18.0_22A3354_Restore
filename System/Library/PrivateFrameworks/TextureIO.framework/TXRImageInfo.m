@implementation TXRImageInfo

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (TXRBuffer)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_buffer, a3);
}

- (unint64_t)bytesPerRow
{
  return self->_bytesPerRow;
}

- (void)setBytesPerRow:(unint64_t)a3
{
  self->_bytesPerRow = a3;
}

- (unint64_t)bytesPerImage
{
  return self->_bytesPerImage;
}

- (void)setBytesPerImage:(unint64_t)a3
{
  self->_bytesPerImage = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end

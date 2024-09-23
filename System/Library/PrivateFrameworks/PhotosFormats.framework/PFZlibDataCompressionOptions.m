@implementation PFZlibDataCompressionOptions

- (void)setCompressionLevel:(int)a3
{
  self->_compressionLevel = a3;
}

- (void)setCompressionStrategy:(int)a3
{
  self->_strategy = a3;
}

- (int)compressionLevel
{
  return self->_compressionLevel;
}

- (int)strategy
{
  return self->_strategy;
}

- (void)setStrategy:(int)a3
{
  self->_strategy = a3;
}

- (int)windowBits
{
  return self->_windowBits;
}

- (void)setWindowBits:(int)a3
{
  self->_windowBits = a3;
}

- (int)memoryLevel
{
  return self->_memoryLevel;
}

- (void)setMemoryLevel:(int)a3
{
  self->_memoryLevel = a3;
}

- (int)chunkSize
{
  return self->_chunkSize;
}

- (void)setChunkSize:(int)a3
{
  self->_chunkSize = a3;
}

+ (id)defaultOptions
{
  uint64_t v2;

  v2 = objc_opt_new();
  *(_OWORD *)(v2 + 8) = xmmword_1A17B6DE0;
  *(_DWORD *)(v2 + 24) = 0x4000;
  return (id)v2;
}

@end

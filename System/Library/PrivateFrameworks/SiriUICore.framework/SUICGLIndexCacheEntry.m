@implementation SUICGLIndexCacheEntry

- (void)dealloc
{
  objc_super v3;

  free(self->_gl_indices);
  v3.receiver = self;
  v3.super_class = (Class)SUICGLIndexCacheEntry;
  -[SUICGLIndexCacheEntry dealloc](&v3, sel_dealloc);
}

- (unsigned)numAuraIndices
{
  return self->_numAuraIndices;
}

- (void)setNumAuraIndices:(unsigned int)a3
{
  self->_numAuraIndices = a3;
}

- (unsigned)numAuraIndicesCulled
{
  return self->_numAuraIndicesCulled;
}

- (void)setNumAuraIndicesCulled:(unsigned int)a3
{
  self->_numAuraIndicesCulled = a3;
}

- (unsigned)numWaveIndices
{
  return self->_numWaveIndices;
}

- (void)setNumWaveIndices:(unsigned int)a3
{
  self->_numWaveIndices = a3;
}

- (unsigned)gl_indices
{
  return self->_gl_indices;
}

- (void)setGl_indices:(unsigned int *)a3
{
  self->_gl_indices = a3;
}

@end
